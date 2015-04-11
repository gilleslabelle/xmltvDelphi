unit xmltv.Gracenote;

interface

uses
  System.Generics.Collections, System.JSON;

type

  // TGracenoteMovieEpisodeProgramData = record
  // runTime: integer;     // duration, specified in ISO-8601 format; PTxxHyyM = xx hours, yy minutes
  // releaseYear: integer; // year of theatrical movie release, formatted yyyy
  // directors: string;    // comma-separated list of director names, formatted firstname<space>lastname
  // officialUrl: string;  // official movie website, if available
  // end;

  // TGracenoteSportEventProgramData = record
  //
  // eventTitle: string; // for team events, includes team names and location (e.g., Kansas at Missouri);
  // // for non-team events, provides greater detail than common 'Title' field
  // organizationId: string;
  // // organization ID; indicates organization (NFL, NBA, etc) associated with teams; only available on team vs. team events
  // sportsId: string;
  // // sports ID; indicates general sport of event  (Basketball, Baseball, etc); only available on team vs. team events
  // gameDate: string;     // formatted yyyy-mm-dd
  // gameTime: string;     // formatted in local timezone for game; hh:mi:ss-<offset from UTC>; e.g., 13:00:00-05:00
  // gameTimeZone: string; // timezone of game locale; e.g., Central Observing (if observing daylight savings time)
  //
  // end;

  TGracenoteSerieEpisodeProgramData = class
  strict private

    FseriesId:     string; // numeric identifier corresponding to rootId of series' main program record
    FepisodeTitle: string; // episode-specific title, maximum 150 characters
    // episodeImage :TImage; // for episodes only; episode-specific image (no text), where available
    FseasonNum: string;
    // for episodes only; season number; will not be provided for non-seasonal shows such as soap operas
    FepisodeNum:    string; // for episodes only; episode number within season
    FtotalSeasons:  string;  // for series only; total number of seasons
    FtotalEpisodes: integer;
    procedure SetepisodeNum(const Value: string);
    procedure SetepisodeTitle(const Value: string);
    procedure SetseasonNum(const Value: string);
    procedure SetseriesId(const Value: string);
    procedure SettotalEpisodes(const Value: integer);
    procedure SettotalSeasons(const Value: string); // for series only; total number of episodes across all seasons
  public
    constructor Create;
    destructor Destroy; override;
    property seriesId: string read FseriesId write SetseriesId;
    // numeric identifier corresponding to rootId of series' main program record
    property episodeTitle: string read FepisodeTitle write SetepisodeTitle;
    // episode-specific title, maximum 150 characters
    property seasonNum: string read FseasonNum write SetseasonNum;
    property episodeNum: string read FepisodeNum write SetepisodeNum;
    // for episodes only; episode number within season
    property totalSeasons: string read FtotalSeasons write SettotalSeasons; // for series only; total number of seasons
    property totalEpisodes: integer read FtotalEpisodes write SettotalEpisodes;
    // for series only; total number of episodes across all seasons

  end;

  TGracenoteProgram = class
  strict private

    FtmsId: string;
    // 14-character alphanumeric identifier for program record; first 2 characters generally identify program type (MV=movie, SH=show/series, EP=episode, SP=sports event);
    // where available, parameter includeDetail=false will restrict program metadata to only programIds (tmsId, rootId, seriesId)

    FrootId: string;
    // numeric identifier used to connect related program records with different title language, description language, and versions

    Ftitle:     string; // program title; for episode records, this is series title
    FtitleLang: string; // language abbreviation code (e.g., 'en'=English, 'sp'=Spanish, 'pt-BR'=Brazilian Portugese);
    // see IETF Language Tag reference for more information
    FshortDescription: string; // brief program description, Maximum 100 characters
    FlongDescription:  string; // long program description,  Maximum 1000 characters

    FdescriptionLang: string;
    // language abbreviation code (e.g., 'en'=English, 'sp'=Spanish, 'pt-BR'=Brazilian Portugese);
    // see IETF Language Tag reference for more information

    Fgenres: string;
    // [ ] comma-separated list of program genres (e.g., Talk, News, Politics, Sports talk, Entertainment); returned in English
    ForigAirDate: string; // date of original TV airing; format is yyyy-mm-dd
    Fholiday:     string; // program details only; text of holiday name related to program content
    Fanimation:   string; // program details only; animation type of program content; values may be:
    // Animated, Anime, Live action/animated, Live action/anime
    FentityType: string; // program type; one of following values;    Show, Episode, Sports, Movie
    FsubType:    string; // program subtype; one of following values:
    // Feature Film, Short Film, TV Movie, Miniseries, Series, Special, Sports event, Sports non-event, Paid Programming, Theatre Event
    // EpisodeSerieData: TGracenoteSerieEpisodeProgramData;
    // SportEventData: TGracenoteSportEventProgramData;
    // MovieEpisodeData: TGracenoteMovieEpisodeProgramData;

    FSerieEpisodeData: TGracenoteSerieEpisodeProgramData;
    procedure Setanimation(const Value: string);
    procedure SetdescriptionLang(const Value: string);
    procedure SetentityType(const Value: string);
    procedure Setgenres(const Value: string);
    procedure Setholiday(const Value: string);
    procedure SetlongDescription(const Value: string);
    procedure SetorigAirDate(const Value: string);
    procedure SetrootId(const Value: string);
    procedure SetSerieEpisodeData(const Value: TGracenoteSerieEpisodeProgramData);
    procedure SetshortDescription(const Value: string);
    procedure SetsubType(const Value: string);
    procedure Settitle(const Value: string);
    procedure SettitleLang(const Value: string);
    procedure SettmsId(const Value: string);
    // MovieData:        TGracenoteMovieEpisodeProgramData;
    // SportEventData:   TGracenoteSportEventProgramData;

  public
    property tmsId:     string read FtmsId write SettmsId;
    property rootId:    string read FrootId write SetrootId;
    property title:     string read Ftitle write Settitle; // program title; for episode records, this is series title
    property titleLang: string read FtitleLang write SettitleLang;
    // language abbreviation code (e.g., 'en'=English, 'sp'=Spanish, 'pt-BR'=Brazilian Portugese);
    property shortDescription: string read FshortDescription write SetshortDescription;
    // brief program description, Maximum 100 characters
    property longDescription: string read FlongDescription write SetlongDescription;
    // long program description,  Maximum 1000 characters
    property descriptionLang: string read FdescriptionLang write SetdescriptionLang;
    property genres:          string read Fgenres write Setgenres;
    property origAirDate:     string read ForigAirDate write SetorigAirDate;
    // date of original TV airing; format is yyyy-mm-dd
    property holiday: string read Fholiday write Setholiday;
    // program details only; text of holiday name related to program content
    property animation: string read Fanimation write Setanimation;
    // program details only; animation type of program content; values may be:
    property entityType: string read FentityType write SetentityType;
    // program type; one of following values;    Show, Episode, Sports, Movie
    property subType:          string read FsubType write SetsubType; // program subtype; one of following values:
    property SerieEpisodeData: TGracenoteSerieEpisodeProgramData read FSerieEpisodeData write SetSerieEpisodeData;

    constructor Create;
    destructor Destroy; override;

  end;

  TGracenoteProgramColl = class
  strict private

//    FPrograms:        TObjectList<TGracenoteProgram>;
    FProgramsByTmsID: TObjectDictionary<string, TGracenoteProgram>;
  private
//    function GetCount: integer; // System.Generics.Collections.TDictionary<TKey,TValue><TGracenoteCommonProgramData>

  public
    function GetEnumerable: TEnumerable<TGracenoteProgram>;
    constructor Create;
    destructor Destroy; override;
    procedure AddPrograms(jsonArray: TJSONArray);
    // function AddNewTask : TGracenoteProgram;
    //function Contains(Prog: TGracenoteProgram): boolean;
//    property Count: integer read GetCount;
    function GetByTmsID( tmsID:string;out leProg:TGracenoteProgram):Boolean;
    function GetByNameAndDate( SerieName,showdate:string;out leProg:TGracenoteProgram):Boolean;

  end;

  TGraceNote = class
    private
//    FColl :TGracenoteProgramColl;
  public
    class var Coll :TGracenoteProgramColl;
//    class procedure GetNext14Days(GracenoteColl: TGracenoteProgramColl);
    class procedure GetNext14Days;
//    class function GetProgramColl:TGracenoteProgramColl;

  end;

implementation

uses
  xmltvdb.DateUtils, System.SysUtils, System.DateUtils, CodeSiteLogging,
  uDataModule;

{ TGraceNote }

class procedure TGraceNote.GetNext14Days; //(GracenoteColl: TGracenoteProgramColl);
var
//  PremiereJournee: TdateTime;
  DebutJour:       TUTCDateTime;
  FinJour:         TUTCDateTime;
  I:               integer;
  JSONarr: TJSONArray;
//  StartTime: Extended;
  NextAllowedTime: Extended;
  // Prog:            TGracenoteProgram;
begin

  CodeSite.EnterMethod(nil,'GetNext14Days');//

  NextAllowedTime := Extended.MinValue;

  for I := 0 to 13 do
  begin
    DebutJour.AsLocal := IncDay(Today, I);

    FinJour.AsLocal := EndOfTheDay(DebutJour.AsLocal);


    if NextAllowedTime <> Extended.MinValue then
    begin

      while Now< NextAllowedTime do begin
          Sleep(100);
          CodeSite.SendMsg('Attente 100ms pour requête');
      end;

    end;

    NextAllowedTime := IncSecond(now,3);

      CodeSite.SendMsg('Execute la requête pour la date :' + DebutJour.AsISO8601StringShort);
      CodeSite.SendMsg('                                :' + FinJour.AsISO8601StringShort);

     JSONarr:= nil;

    JSONarr := DataModuleMain.GetNewShowAirings(DebutJour.AsISO8601StringShort, FinJour.AsISO8601StringShort);

    if JSONarr<>nil then
    begin
      Self.Coll.AddPrograms(JSONarr);
    end;

  end;

  // PremiereHeuredeCetteJournee

    CodeSite.ExitMethod('GetNext14Days');//

end;


{ TGracenoteProgramColl }

procedure TGracenoteProgramColl.AddPrograms(jsonArray: TJSONArray);
var
//  LJsonArr:     TJSONArray;
  LJsonValue:   TJsonValue;
  programelem:  TJsonValue;
  entityType:   string;
  title:        string;
  episodeTitle: string;
  episodeNum:   string;
  seasonNum:    string;
  origAirDate:  string;

  unProg: TGracenoteProgram;
//  tmpInt: integer;
begin

//  LJsonArr := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(jsonString), 0) as TJSONArray;

//  CodeSite.SendNote(jsonArray);

//  CodeSite.SendMsg('Found: ' + LJsonArr.Count.ToString + ' scheduled recordings...');

  if jsonArray<>nil then
  begin


  for LJsonValue in jsonArray do
  begin

    programelem := LJsonValue.GetValue<TJsonValue>('program');

    if programelem <> nil then
    begin

      unProg := TGracenoteProgram.Create;

      try

        entityType := programelem.GetValue<string>('entityType');

        if not entityType.Equals('Movie') then
        begin

          unProg.tmsId := programelem.GetValue<string>('tmsId');

          programelem.TryGetValue<string>('title', title);
          if not title.IsEmpty then
            unProg.title := title;

          programelem.TryGetValue<string>('episodeTitle', episodeTitle);
          if not episodeTitle.IsEmpty then
            unProg.SerieEpisodeData.episodeTitle := episodeTitle;

          programelem.TryGetValue<string>('episodeNum', episodeNum);
//          if TryStrToInt(episodeNum, tmpInt) then
//          begin
            unProg.SerieEpisodeData.episodeNum := episodeNum;
//          end;

          programelem.TryGetValue<string>('seasonNum', seasonNum);
//          if TryStrToInt(seasonNum, tmpInt) then
//          begin
            unProg.SerieEpisodeData.seasonNum := seasonNum;
//          end;

          programelem.TryGetValue<string>('origAirDate', origAirDate);
          if not origAirDate.IsEmpty then
            unProg.origAirDate := origAirDate;

        end;

//        FPrograms.Add(unProg);
        if not unProg.tmsId.IsEmpty then begin

          if not Self.FProgramsByTmsID.ContainsKey(unProg.tmsId) then begin
              Self.FProgramsByTmsID.Add(unProg.tmsId, unProg);
          end
          else
          begin

             with Self.FProgramsByTmsID[unProg.tmsId] do
             begin
               if title.IsEmpty and not unProg.title.IsEmpty then
                    title := unProg.title;

               if origAirDate.IsEmpty and not unProg.title.IsEmpty then
                    origAirDate := unProg.origAirDate;

               if SerieEpisodeData.episodeTitle.IsEmpty and not unProg.SerieEpisodeData.episodeTitle.IsEmpty then
                    SerieEpisodeData.episodeTitle := unProg.SerieEpisodeData.episodeTitle;

               if SerieEpisodeData.seasonNum.IsEmpty and not unProg.SerieEpisodeData.seasonNum.IsEmpty then
                    SerieEpisodeData.seasonNum := unProg.SerieEpisodeData.seasonNum;

               if SerieEpisodeData.episodeNum.IsEmpty and not unProg.SerieEpisodeData.episodeNum.IsEmpty then
                    SerieEpisodeData.episodeNum := unProg.SerieEpisodeData.episodeNum;


             end;

          end;
        end;
      finally

      end;
    end;

  end;
  end;

end;

//function TGracenoteProgramColl.Contains(Prog: TGracenoteProgram): boolean;
//begin
//  Result := FPrograms.Contains(Prog);
//end;

constructor TGracenoteProgramColl.Create;
begin
  inherited Create;

///  FPrograms := TObjectList<TGracenoteProgram>.Create(True);
  FProgramsByTmsID:= TObjectDictionary<string, TGracenoteProgram>.Create([doOwnsValues]);
end;

destructor TGracenoteProgramColl.Destroy;
begin
//  if assigned(FPrograms) then  FPrograms.Free;
 if Assigned(FProgramsByTmsID) then   FProgramsByTmsID.Free;
  inherited;
end;

function TGracenoteProgramColl.GetByNameAndDate(SerieName, showdate: string; out leProg: TGracenoteProgram): Boolean;
var
  unprog :TGracenoteProgram;
begin

    for unprog in FProgramsByTmsID.Values do begin

        if  SameText( unprog.title, SerieName) then begin

        if  SameText( unprog.origAirDate, showdate) then begin

              leProg := unprog;
              Break;
        end;
        end;


    end;

end;

function TGracenoteProgramColl.GetByTmsID(tmsID: string; out leProg: TGracenoteProgram): Boolean;
begin
    if Self.FProgramsByTmsID.ContainsKey(tmsId) then
    begin
      Result := True;

      leProg:=   Self.FProgramsByTmsID.Items[tmsID];
    end
    else
    begin
      Result := false;
    end;

end;

//function TGracenoteProgramColl.GetCount: integer;
//begin
////  Result := FPrograms.Count;
//end;

function TGracenoteProgramColl.GetEnumerable: TEnumerable<TGracenoteProgram>;
begin
  Result := FProgramsByTmsID.Values;
end;

{ TGracenoteProgram }

constructor TGracenoteProgram.Create;
begin
  inherited Create;

  FSerieEpisodeData := TGracenoteSerieEpisodeProgramData.Create;
end;

destructor TGracenoteProgram.Destroy;
begin
  if Assigned(FSerieEpisodeData) then
        FSerieEpisodeData.Free;

  inherited Destroy;
end;

procedure TGracenoteProgram.Setanimation(const Value: string);
begin
  Fanimation := Value;
end;

procedure TGracenoteProgram.SetdescriptionLang(const Value: string);
begin
  FdescriptionLang := Value;
end;

procedure TGracenoteProgram.SetentityType(const Value: string);
begin
  FentityType := Value;
end;

procedure TGracenoteProgram.Setgenres(const Value: string);
begin
  Fgenres := Value;
end;

procedure TGracenoteProgram.Setholiday(const Value: string);
begin
  Fholiday := Value;
end;

procedure TGracenoteProgram.SetlongDescription(const Value: string);
begin
  FlongDescription := Value;
end;

procedure TGracenoteProgram.SetorigAirDate(const Value: string);
begin
  ForigAirDate := Value;
end;

procedure TGracenoteProgram.SetrootId(const Value: string);
begin
  FrootId := Value;
end;

procedure TGracenoteProgram.SetSerieEpisodeData(const Value: TGracenoteSerieEpisodeProgramData);
begin
  FSerieEpisodeData := Value;
end;

procedure TGracenoteProgram.SetshortDescription(const Value: string);
begin
  FshortDescription := Value;
end;

procedure TGracenoteProgram.SetsubType(const Value: string);
begin
  FsubType := Value;
end;

procedure TGracenoteProgram.Settitle(const Value: string);
begin
  Ftitle := Value;
end;

procedure TGracenoteProgram.SettitleLang(const Value: string);
begin
  FtitleLang := Value;
end;

procedure TGracenoteProgram.SettmsId(const Value: string);
begin
  FtmsId := Value;
end;

{ TGracenoteSerieEpisodeProgramData }

constructor TGracenoteSerieEpisodeProgramData.Create;
begin
  inherited Create;
end;

destructor TGracenoteSerieEpisodeProgramData.Destroy;
begin

  inherited Destroy;
end;

procedure TGracenoteSerieEpisodeProgramData.SetepisodeNum(const Value: string);
begin
  FepisodeNum := Value;
end;

procedure TGracenoteSerieEpisodeProgramData.SetepisodeTitle(const Value: string);
begin
  FepisodeTitle := Value;
end;

procedure TGracenoteSerieEpisodeProgramData.SetseasonNum(const Value: string);
begin
  FseasonNum := Value;
end;

procedure TGracenoteSerieEpisodeProgramData.SetseriesId(const Value: string);
begin
  FseriesId := Value;
end;

procedure TGracenoteSerieEpisodeProgramData.SettotalEpisodes(const Value: integer);
begin
  FtotalEpisodes := Value;
end;

procedure TGracenoteSerieEpisodeProgramData.SettotalSeasons(const Value: string);
begin
  FtotalSeasons := Value;
end;



initialization

     TGraceNote.Coll := TGracenoteProgramColl.Create;
finalization

  TGraceNote.Coll.Free;

end.
