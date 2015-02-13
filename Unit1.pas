unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IPPeerClient, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Vcl.StdCtrls, Vcl.ExtCtrls, Data.Bind.Components,
  REST.Client, Data.Bind.ObjectScope, CodeSiteLogging, xmltvBind,
  System.Generics.Collections, uTVDB, Xml.xmldom, Vcl.ComCtrls;

type
  TConfig = record
    ONLY_LOOKUP_SCHEDULED_SHOWS: Boolean;
    ZAP2IT_SOURCE_INFO_NAMES: string;
    EXCLUDED_CATEGORIES: string;
    MOVIE_CATEGORIES: string;
    TVDB_TRANSLATIONS: TDictionary<string, string>;
    procedure init;
    procedure Free;
  end;

  TForm1 = class(TForm)
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    FConfig: TConfig;
    category: string;
    procedure processXMLTVFile(xmlFile: TFileName);
    function findDescChildElementByAttributeValue(programElem: IXMLProgrammeType; lang: string): IXMLDescType;
    function getZap2ItId(programElem: IXMLProgrammeType): string;
  public
    { Public declarations }

  end;

const
  NullDate: TDateTime = { -693594 } 0;

var
  Form1: TForm1;

implementation

uses System.JSON, Soap.XSBuiltIns, System.DateUtils, Xml.XMLIntf,
  Xml.XMLDoc, uConts, uSeriesTracker, uTVDBSeries, REST.Utils, uEpisode,
  uTVDBBind, uDataModule;

// , Winapi.MSXMLIntf,ComObj,MSXML, NativeXmlXPath;
// uses msxmldom;
{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  FConfig.init;
  FConfig.ONLY_LOOKUP_SCHEDULED_SHOWS := false;
  FConfig.ZAP2IT_SOURCE_INFO_NAMES := ('Zap2it|Schedules Direct').ToLower;
  FConfig.MOVIE_CATEGORIES := ('Movie|Movies|Films').ToLower;

  FConfig.EXCLUDED_CATEGORIES := ('Paid Programming|Talk Show|Weather|Sports').ToLower;

  FConfig.TVDB_TRANSLATIONS.Add(('Dragons'' Den').ToLower, '116811');
  // Xml.Win.msxmldom.MSXMLDOMDocumentFactory.AddDOMProperty('ProhibitDTD', False);

end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FConfig.Free;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
 Timer1.Enabled:=true;
end;

function TryIso8601BasicToDate(const Str: string; out Date: TDateTime): Boolean;
var
  Year, Month, Day: Integer;
begin
  Assert(Length(Str) <= 8);

  Month := 01;
  Day := 01;
//  REsult := False;

  if Length(Str) >= 4 then
  begin

    REsult := TryStrToInt(Copy(Str, 1, 4), Year);
    if not REsult then
      exit;
  end;
  if Length(Str) >= 6 then
  begin

    REsult := TryStrToInt(Copy(Str, 5, 2), Month);
    if not REsult then
      exit;
  end;

  if Length(Str) = 8 then
  begin
    REsult := TryStrToInt(Copy(Str, 7, 2), Day);
    if not REsult then
      exit;
  end;

  REsult := TryEncodeDate(Year, Month, Day, Date);
  // REsult := true;

end;

procedure TForm1.processXMLTVFile(xmlFile: TFileName);
var
  inputXMLFile: TFileName;

  whatToLookUp: TStringList;
  scheduleType: Integer;
//  JSON: string;

//  arr: TJSONArray;
  I: Integer;
//  obj: TJSONValue;
//  title: string;
//  subtitle: string;
  // programElem :IXMLNode;
  sourceInfoName: string;
  isZap2It: Boolean;
  totalPrograms: Integer;
  successCount: Integer;
  failCount: Integer;
  progCount: Integer;
  seriesName: string;
  isMovie: Boolean;
  overRiddenSeriesName: string;
  // programElem: IDOMNode;
//  qq: Integer;
//  jj: Integer;
  idx: Integer;
  successfulLookup: Boolean;
  tvdb: TTVDB;
  st: TSeriesTracker;
  xmltv: IXMLTvType;
  programs: IXMLProgrammeTypeList;
  programElem: IXMLProgrammeType;
  titleElem: IXMLTitleTypeList;
  categories: IXMLCategoryTypeList;
  catElem: IXMLCategoryType;
  subTitleElem: IXMLSubtitleTypeList;
  episodeTitle: string;
  dateElem: string;
  LaDate: TDateTime;

  lang: string;
//  idxDesc: Integer;
  currentDesc: string;
  y: Word;
  strOrigAirDate: string;
  additionalInfo: string;
  newDesc: string;
  currentDescLang: IXMLDescType;
  // seriesTracker:  SeriesTracker ;

  seriesTrackers: TSeriesTrackerColl;
  UnseriesTracker: TSeriesTracker;
  knownTVDBId: Integer;
  tvdbSeries: TTVDBSeries;
  guideEpisode: TEpisode;
  zap2ItId: string;
  displayValue: string;
  multiPartNaming: string;
  tvdbId: string;
  seriesYear: string;
  doc: IXMLDocument;
  BreakContinue: Boolean;
  jsonvalue: TJSONValue;
begin

  // HTTP.cleanCache();//clean out any cached xml or HTTP requests before starting
  CodeSite.Clear; // cleans historical logs and resets current logs
  CodeSite.SendMsg('Processing: ' + ExpandFileName(xmlFile));

  // move the xmlFile to the default XMLTV's directory (where the dtd is also located)
  inputXMLFile := IncludeTrailingPathDelimiter(XMLTVS_DIR) + 'xmltv.xml';

  if FileExists(inputXMLFile) then
  begin
    DeleteFile(inputXMLFile);
  end;
  CopyFile(pchar(xmlFile), pchar(inputXMLFile), False);
  // end
  // else
  // begin
  // CodeSite.SendError( 'Failed to move xml file to '+ XMLTVS_DIR +' directory...');
  // exit;
  // end;

  whatToLookUp := TStringList.Create;
  doc := TXMLDocument.Create(nil);
  try
    begin


      doc.LoadFromFile(inputXMLFile);
      // doc.Options := doc.Options +[doAutoSave];

      xmltv := xmltvBind.Gettv(doc);


      // xmltv :=  xmltvBind.Loadtv(inputXMLFile);


      // root:= xmltv.DocumentElement;
      // Element root = xmltv.getRootElement();

      whatToLookUp.Clear;
      if (FConfig.ONLY_LOOKUP_SCHEDULED_SHOWS) then
      begin
        //
        // 82 = Recording  The programs in the schedule should be recorded.
        // 83 = Suggestion The programs in the schedule can be shown as suggestions.
        // 65 = Alert The programs in the schedule should pop up alerts when they are about to start.
        scheduleType := 82;

        DatamoduleMain.GetNextRecordTitles(scheduleType, whatToLookUp);
      end;
      //

      programs := xmltv.Programme;

      sourceInfoName := xmltv.sourceInfoName;
      isZap2It := FConfig.ZAP2IT_SOURCE_INFO_NAMES.contains(sourceInfoName.ToLower);
      if (isZap2It) then
      begin
        CodeSite.SendMsg('This XMLTV source (' + sourceInfoName + ') appears to originate from Zap2It');
      end
      else
      begin
        CodeSite.SendMsg('This XMLTV is not a Zap2It source: ' + sourceInfoName);
      end;
      //
      // HashMap<String,SeriesTracker> seriesTrackers = new LinkedHashMap<>();
      seriesTrackers := TSeriesTrackerColl.Create;

      totalPrograms := programs.Count;
      successCount := 0;
      failCount := 0;
      progCount := 0;

      ProgressBar1.Max := totalPrograms;
      ProgressBar1.Min := 0;

      for I := 0 to totalPrograms - 1 do
      begin
        ProgressBar1.Position := I;
          CodeSite.AddSeparator;

        Application.ProcessMessages;
        programElem := programs[I];

        inc(progCount);

        titleElem := programElem.title;

        if titleElem[0] = nil then
        begin
          CodeSite.SendError('Skipping program #' + progCount.ToString + ' with no <title> element');
          Continue;
        end
        else
        begin
          //
          seriesName := titleElem[0].Text;
          if seriesName = '' then
          begin
            CodeSite.SendError('No series name found from <title> element, skipping a program #' +
              progCount.ToString + '...');

            Continue;

            // continue programSearch;
          end;

          // check for over-ride based on series name
          if FConfig.TVDB_TRANSLATIONS.ContainsKey(seriesName.ToLower) then
          begin
            overRiddenSeriesName := FConfig.TVDB_TRANSLATIONS[seriesName.ToLower];
          end
          else
          begin
            overRiddenSeriesName := '';
          end;
          //
          isMovie := False;
          categories := programElem.category;
          // categories:=   TXMLNodeHelper.SelectNodes( programElem,'category');
          BreakContinue := False;
          for idx := 0 to categories.Count - 1 do
          begin
            catElem := categories[idx];
            category := catElem.Text;

            if (FConfig.EXCLUDED_CATEGORIES.contains(category.ToLower)) then
            begin
              CodeSite.SendMsg('Skipping program because its category is excluded (' + category + '): ' + seriesName);
              BreakContinue := true;
              break;
              // Continue; // programSearch;
            end;

            if (not isMovie) then
            begin // if any category matches, then its considered a movie
              isMovie := FConfig.MOVIE_CATEGORIES.contains(category.ToLower());
            end;
          end;

          if BreakContinue then
          begin
            Continue;
          end;

          subTitleElem := programElem.subtitle; // the episode title
          if (subTitleElem = nil) or (subTitleElem.Count = 0) or (subTitleElem[0].Text = '') then
          // if missing, default is empty string
          begin
            episodeTitle := '';

          end
          else
          begin
            episodeTitle := subTitleElem[0].Text;
          end;

          dateElem := programElem.Date;

          { All dates and times in this DTD follow the same format, loosely based
            on ISO 8601.  They can be 'YYYYMMDDhhmmss' or some initial
            substring, for example if you only know the year and month you can
            have 'YYYYMM'.  You can also append a timezone to the end; if no
            explicit timezone is given, UTC is assumed.  Examples:
            '200007281733 BST', '200209', '19880523083000 +0300'.  (BST == +0100.)
          }
          if not TryIso8601BasicToDate(dateElem, LaDate) then
          begin
            // LaDate := 0;
            LaDate.SetToNull;
          end;
          // String date = dateElem == null ? null : dateElem.getText();
          //
          // CodeSite.SendMsg('Program '+ progCount +'/'+totalPrograms+': '+seriesName + ' - '+ episodeTitle +     (valid(date) ? ' ('+date+')' : ''));
          //
          if (not isMovie) then
          begin
            // filter by scheduled tv series if configured to do so
            if (FConfig.ONLY_LOOKUP_SCHEDULED_SHOWS) then
            begin
              // based on series name only instead of episode title too since series queries are cached

              if (whatToLookUp.IndexOf(seriesName.ToLower) = -1) then
              begin

                CodeSite.SendMsg('Skipping because this series is not in recording schedule: ' + seriesName);
                Continue;
              end;
            end;

            // cant process on series name alone. We need either episode title or air date or both
            if (episodeTitle = '') and (LaDate.IsNull) then
            begin
              // if(!valid(episodeTitle) && !valid(date))

              CodeSite.SendMsg('Skipping because no episode title or airdate is available for airing: ' + seriesName);
              Continue;
            end;
          end;

          // use language from title elem
          lang := titleElem[0].lang; // getAttributeValue('lang');

          // get description
          currentDesc := '';

          currentDescLang := findDescChildElementByAttributeValue(programElem, lang);

          if currentDescLang <> nil then
          begin
            currentDesc := currentDescLang.Text;
          end;

          // Element currentDescElem = findChildElementByAttributeValue(programElem,'desc', 'lang', lang);
          //
          // String strOrigAirDate = null;
          if (isMovie) then
          begin // for movies, just try to find year and add it to the description elem
            // try
            // begin
            // if(valid(date) && date.length()>=4)
            // begin //this appears to be a year, confirm it is an int
            // String fourDigitYear = date.substring(0,4);//trim month/day info it it's there
            y := YearOf(LaDate);
            // int y = Integer.parseInt(fourDigitYear); ///throwx exception for non-integer
            if ((y < 1800) or (y > 2100)) then // sanity check
            begin
              // Date invalide
              strOrigAirDate := '';
              CodeSite.SendWarning('Not able to add year to description for movie. Year found = ' +
                DateToStr(LaDate) + '. ');
            end
            else
            begin
              strOrigAirDate := IntToStr(y);
            end;

            // throw new Exception('Year is too old or too future: '+ y);
            //
            // //if we got here, we know it is 4 numeric digits between 1800-2200. Assume its a valid year.
            // strOrigAirDate =  y+'';
            // end;
            // else
            // throw new Exception('Not a valid year: '+ date);
            //
            additionalInfo := ' [y:' + strOrigAirDate + ']';
            newDesc := currentDesc + additionalInfo;

            currentDescLang := findDescChildElementByAttributeValue(programElem, lang);

            if currentDescLang <> nil then
            begin
              currentDescLang.Text := newDesc;
            end;

            // updateOrCreateElem(programElem, 'desc', 'lang', lang, newDesc);
//            CodeSite.SendMsg('Added: ' + additionalInfo + ' to end of desc element for movie: ' + seriesName);
            //

            // end;
            // catch(Exception x)
            // begin
            // CodeSite.WARN('Not able to add year to description for movie. Year found = '+ date+'. '+x.getMessage());
            // end;
            // finally
            // begin
            // continue programSearch;//we don't need to do anything else for movies
            // end;

            Continue;
          end
          else // not a movie, assume tv episode
          begin
            // if(valid(date))
            // begin
            // trybegin
             strOrigAirDate := TTVDB.dateToTVDBString (LaDate);
            // end;catch(ParseException x)
            // begin
            // CodeSite.WARN( 'Not using upparsable date: '+ date);
            // strOrigAirDate = null;
            // end;
            // end;

//            strOrigAirDate := FormatDateTime('yyyymmdd', LaDate);
          end;

          // once we get here, movies have already been handled. Should be only episodes
          // passed all checks, try and look it up on TheTVDB.com

          if seriesTrackers.ContainsKey(seriesName) then
          begin

            UnseriesTracker := seriesTrackers[seriesName];
          end
          else
          begin
            UnseriesTracker := nil;
          end;

          if (UnseriesTracker = nil) then
          begin
            UnseriesTracker := TSeriesTracker.Create(seriesName);
            seriesTrackers.Add(seriesName, UnseriesTracker);
          end;

          knownTVDBId := -1; // '';
          if (overRiddenSeriesName <> '') then
          begin
            // if it is a number, assume it is a TVDB id instead of a series name
            if TryStrToInt(overRiddenSeriesName, knownTVDBId) then
            begin
              overRiddenSeriesName := ''; // this is an ID, not a series name
              CodeSite.SendFmtMsg('Using over-ridden TVDB SeriesID: %d for series: %s', [knownTVDBId, seriesName]);
            end
            else
            begin
              CodeSite.SendFmtMsg('Using over-ridden series name: %s for series: %s',
                [overRiddenSeriesName, seriesName]);
            end;

          end;

          // create an Episode object with what we know fromt he XMLTV data.
          tvdbSeries := TTVDBSeries.Create(IntToStr(knownTVDBId), iif(overRiddenSeriesName <> '', overRiddenSeriesName,
            seriesName), '');
          // TVDBSeries tvdbSeries = new TVDBSeries(knownTVDBId,(valid(overRiddenSeriesName) ? overRiddenSeriesName : seriesName),null);
          guideEpisode := TEpisode.Create(tvdbSeries);
          guideEpisode.setLanguage(lang);
          if (strOrigAirDate <> '') then
          begin
            guideEpisode.setOriginalAirDate(LaDate); // sdf.parse(date));
          end;
          if (episodeTitle <> '') then
          begin
            guideEpisode.setTitle(episodeTitle);
          end;

          if (not guideEpisode.hasTVDBid()) then
          begin // try using external id(s)
            if (isZap2It) then
            begin
              zap2ItId := getZap2ItId(programElem);
              if (zap2ItId <> '') then
              begin
//                CodeSite.SendMsg('Setting Zap2It id: ' + zap2ItId + ' for ' + seriesName);
                guideEpisode.setZap2ItId(zap2ItId);
              end;
            end;

            // TODO: parse IMDB id's (need a sample xmltv file that uses IMDB id's)
          end;

          successfulLookup := False;

          tvdb := TTVDB.Create(guideEpisode);

          successfulLookup := tvdb.lookup();

          if (successfulLookup) then
          begin // inject season/ep info to the xmltv doc

            // update onscreen episode num (gets displayed in guide)
            displayValue := iif(guideEpisode.isMultiPart, guideEpisode.getMultipartSeasonEpisodeNaming(),
              'S' + guideEpisode.getPaddedSeasonNumber() + 'E' + guideEpisode.getPaddedEpisodeNumber());
            programElem.Episodenum.GetItemBySystemAttribute('onscreen', true).Text := displayValue;

            // update xmltv_ns episode num
            programElem.Episodenum.GetItemBySystemAttribute('xmltv_ns', true).Text :=
              guideEpisode.getXMLTVSeasonEpisodeAttribute();

            //
            // update description (used for storing multi-episode details and tvdbid)
            multiPartNaming := iif(guideEpisode.isMultiPart(), ' [' + guideEpisode.getMultipartSeasonEpisodeNaming() +
              ']', ''); // Like S01E01E02
            tvdbId := ' [tvdb:' + guideEpisode.getTVDBId() + ']';
            seriesYear := iif(guideEpisode.getSeriesYear <> '', ' [y:' + guideEpisode.getSeriesYear() + ']', '');

            additionalInfo := multiPartNaming + seriesYear + tvdbId;
            newDesc := currentDesc + additionalInfo;


            programElem.Desc.GetItemByLangAttribute(lang, true).Text := newDesc;
            // end;

//            CodeSite.SendMsg('Added: ' + additionalInfo + ' to end of desc element.');
            inc(successCount);
            UnseriesTracker.addSuccess();
          end
          else // failed lookup
          begin
            inc(failCount);
             UnseriesTracker.addFail();
          end;

//          CodeSite.SendMsg('---' + iif(successfulLookup, 'SUCCESS', 'FAILED ') + '--- ' + guideEpisode.ToString());
          if successfulLookup then
          CodeSite.SendMsg(csmLevel4,'---SUCCESS--- ' + guideEpisode.ToString())
          else
          CodeSite.SendMsg(csmLevel1, '---FAILED--- ' + guideEpisode.ToString());


          //

          // if successCount=5 then begin
          //
          // break;
          // end;

          if assigned(tvdb) then
            FreeAndNil(tvdb);

        end; // done looping thru guide episodes
        //
        // XMLOutputter out = new XMLOutputter(Format.getPrettyFormat());
        // CodeSite.NOTICE( 'Writing updated XMLTV file to: '+ outputXMLFile);
        // try (FileWriter writer = new FileWriter(outputXMLFile))
        // begin
        // out.output(xmltv, writer);
        // writer.close();
        //
        // CodeSite.SendMsg('Successfully created updated XMLTV file, now renaming original file to .old: '+ xmlFile.getAbsolutePath());
        // renameToOld(xmlFile);//success, rename the old file to a .old extension (to prevent processing again)
        // end;
        // catch(IOException x)
        // begin
        // CodeSite.ERROR( 'Failed to write new XML File at: '+ outputXMLFile.getAbsolutePath(),x);
        // end;
        //
        //

      end;

      CodeSite.SendMsg('********************TVDB LOOKUP SUMMARY**********************');
     for st in seriesTrackers.Values do
      begin
        CodeSite.SendFmtMsg('%d/%d - %s', [st.getSucess, st.getTotal, st.getSeries]);
        // CodeSite.SendMsg(tfl(st.getSucess()+'/'+st.getTotal(),10)+' - '+ st.getSeries());
      end;
      CodeSite.SendMsg('Total: ' + successCount.ToString + ' successful lookups, ' + failCount.ToString +
        ' failed lookups.');
      CodeSite.SendMsg('Of ' + progCount.ToString + ' total programs, ' + seriesTrackers.Count.ToString +
        ' unique series were looked up.');

    end;
  finally
    doc.SaveToFile(inputXMLFile);
    doc.Active := False;
    // tvdb.Free;
    programs.Clear;

    if Assigned(seriesTrackers) then
     FreeAndNil(seriesTrackers);

    whatToLookUp.Free;

    CodeSite.SendWarning
      ('--------------------------------------------DONE PROCESSING XMLTV FILE--------------------------------------------');
    /// /            emailNotification();        //emails if warning/error (user-configurable)

  end;

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:=false;
 Application.ProcessMessages;
  Application.ProcessMessages;
 processXMLTVFile('C:\Apps\mc2xml\xmltv.xml');
  Application.Terminate;
end;

function TForm1.getZap2ItId(programElem: IXMLProgrammeType): string;
var
  zap2ItId: string;
  I: Integer;
  zap2ItEpisodeElem: IXMLEpisodenumType;
begin
  zap2ItId := '';
  for I := 0 to programElem.Episodenum.Count - 1 do
  begin
    if SameText(programElem.Episodenum[I].System, 'dd_progid') then
    begin
      zap2ItEpisodeElem := programElem.Episodenum[I];
      break;
    end;

  end;

  // Element zap2ItEpisodeElem = findChildElementByAttributeValue(programElem, "episode-num", "system", "dd_progid");
  if (zap2ItEpisodeElem <> nil) then
  begin

    zap2ItId := zap2ItEpisodeElem.Text; // EP00688359.0258
    if (not zap2ItId.IsEmpty) then
    begin
      if (zap2ItId.contains('.')) then // EP00688359.0258
      begin
        zap2ItId := zap2ItId.Split(['.'])[0]; // .split("\\.")[0];
      end
      else
      begin
        zap2ItId := String.Empty; // := null; // unkown format
      end;
    end;
  end;

  if (zap2ItId.IsEmpty) then // not found, try ms_progid method
  begin
    // Example: <episode-num system="ms_progid">1.EP006883590258</episode-num>

    for I := 0 to programElem.Episodenum.Count - 1 do
    begin
      if SameText(programElem.Episodenum[I].System, 'ms_progid') then
      begin
        zap2ItEpisodeElem := programElem.Episodenum[I];
        break;
      end;

    end;

    // zap2ItEpisodeElem = findChildElementByAttributeValue(programElem, "episode-num", "system", "ms_progid");
    zap2ItId := zap2ItEpisodeElem.Text; // 1.EP006883590258
    if (zap2ItId.contains('.')) then
    begin
      zap2ItId := zap2ItId.Split(['.'])[1];
      if (zap2ItId.Length > 10) then
      begin
        zap2ItId := zap2ItId.substring(0, 10);
      end
      else
      begin
        zap2ItId := String.Empty; // := ''; // unkown format
      end;
    end
    else
    begin
      zap2ItId := String.Empty; // := ''; // unknown format
    end;
  end;

  if not zap2ItId.IsEmpty then
  begin
    if (zap2ItId.Length = 10) then
    begin
      REsult := zap2ItId; // valid id

    end
    else
    begin
      CodeSite.SendWarning('Found Zap2It id with length of ' + zap2ItId.Length.ToString + ' (' + zap2ItId +
        '), epected length of 10. Will not use this id.');
      REsult := '';

    end;
  end;

end;

function TForm1.findDescChildElementByAttributeValue(programElem: IXMLProgrammeType; lang: string): IXMLDescType;
var
  I: Integer;
begin
  REsult := nil;
  for I := 0 to programElem.Desc.Count - 1 do
  begin
    if SameText(programElem.Desc[I].lang, lang) then
    begin
      REsult := programElem.Desc[I];
      break;
    end;
  end;
end; { TConfig }

procedure TConfig.Free;
begin
  TVDB_TRANSLATIONS.Free;
end;

procedure TConfig.init;
begin
  TVDB_TRANSLATIONS := TDictionary<string, string>.Create;
end;

end.
