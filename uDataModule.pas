unit uDataModule;

interface

uses
  System.SysUtils, System.Classes, Xml.xmldom, Xml.XMLIntf, Xml.omnixmldom, Xml.XMLDoc, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, System.JSON, xmltvdb.Episode;

type
  TDataModuleMain = class(TDataModule)
    XMLDocument1: TXMLDocument;
    BindingsList1: TBindingsList;
    RESTClientArgusTV: TRESTClient;
    RESTRequestNextUpcomingProgram: TRESTRequest;
    RESTResponseArgusTV: TRESTResponse;
    RESTRequestUpcomingPrograms: TRESTRequest;
    RESTClientGracenote: TRESTClient;
    RESTRequestGracenoteNewShowAirings: TRESTRequest;
    RESTResponseGracenote: TRESTResponse;
    RESTRequestGracenoteNewShowAiringsFullDay: TRESTRequest;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetNextRecords(letype: integer): TJsonValue;
    procedure GetNextRecordTitles(const letype: integer; out LesTitres: TStringList);
    function GetXmlDocument(url: string; pagestream: TStringStream): Boolean; overload;

    function GetNewShowAirings(var Episode: IEpisode):string; overload;
    function GetNewShowAirings(const startDate,endDate: string) :TJSONArray; overload;

  end;

var
  DataModuleMain: TDataModuleMain;

{$INCLUDE ProgInc.inc}

implementation

uses
  CodeSiteLogging, IdHTTP, IdExceptionCore, xmltvdb.DateUtils, System.StrUtils;

{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}


function TDataModuleMain.GetNewShowAirings(const startDate,endDate: string) :TJSONArray;

  function SetAsISO8601StringRAW(v: String): string;
  var
    sp:         TArray<String>;
    sDateTime:  string;
    sDateTime2: string;
    sFuseau:    string;
  begin
    sp := v.Split([' ']);

    sDateTime := sp[0];
    sFuseau   := sp[1];

    sDateTime2 := LeftStr(sDateTime, 4) + '-' + MidStr(sDateTime, 5, 2) + '-' + MidStr(sDateTime, 7, 2) + 'T' +
      MidStr(sDateTime, 9, 2) + ':' + MidStr(sDateTime, 11, 2);

    if not sFuseau.IsEmpty then
      sDateTime2 := sDateTime2 + LeftStr(sFuseau, 3) + ':' + MidStr(sFuseau, 4, 2);

    Result := sDateTime2;

  end;

//var
//  strStartDate: string;

//  qq:                   TUTCDateTime;
//  OriginalAirDate:      TDateTime;
//  LJsonArr:             TJSONArray;
//  LJsonValue:           TJsonValue;
//  title:                string;
//  OriginalStartAirDate: TUTCDateTime;
//  tmsId:                string;
//  rootId:               string;
//  seriesId:             string;
//  longDescription:      string;
//  tvdbID:               string;
//  programelem:          TJsonValue;
//  entityType:           string;
//  Zap2itid:             string;
//  episodeTitle:         string;
//  episodeNum:           string;
//  seasonNum:            string;
//  LJPair:               TJSONPair;
//  LItem:                TJsonValue;

begin

 // OriginalAirDate := Episode.getOriginalAirDate; // on as seulement la journee

  // OriginalStartAirDate:= Episode.GetOriginalStartAirDateTime;

//  qq.AsNormal := OriginalAirDate;
  // qq.SetToNow;
//  strStartDate := SetAsISO8601StringRAW(startDate);
//  strEndDate := SetAsISO8601StringRAW(endDate);

  RESTRequestGracenoteNewShowAiringsFullDay.Params.ParameterByName('LINEUPID').Value := 'CAN-OTAH1B4J8';
  RESTRequestGracenoteNewShowAiringsFullDay.Params.ParameterByName('startDateTime').Value := startDate; // '2015-02-16T22:30Z';
  RESTRequestGracenoteNewShowAiringsFullDay.Params.ParameterByName('endDateTime').Value := endDate; // '2015-02-16T22:30Z';
  RESTRequestGracenoteNewShowAiringsFullDay.Params.ParameterByName('api_key').Value := APIGracenote; //
  RESTRequestGracenoteNewShowAiringsFullDay.Execute;

  CodeSite.SendNote('Json returnd from UpcomingPrograms is: ' + RESTResponseGracenote.StatusText);


  if RESTResponseGracenote.StatusCode =200 then
  begin

  Result := TJSONObject.ParseJSONValue(RESTResponseGracenote.RawBytes, 0) as TJSONArray;
//  Result:=  RESTResponseGracenote.JSONText;
  end
  else
  begin
  Result := nil;
  end  ;






//  LJsonArr := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(RESTResponseGracenote.JSONText), 0) as TJSONArray;
//
//  CodeSite.SendMsg('Found: ' + LJsonArr.Count.ToString + ' scheduled recordings...');
//
//  for LJsonValue in LJsonArr do
//  begin
//
//    programelem := LJsonValue.GetValue<TJsonValue>('program');
//
//    entityType := programelem.GetValue<string>('entityType');
//
//    if not entityType.Equals('Movie') then
//    begin
//
//      Zap2itid := Episode.GetOriginalms_progid;
//
//      Zap2itid := Zap2itid.Split(['.'])[1];
//
//      tmsId := programelem.GetValue<string>('tmsId');
//
//      if tmsId.Equals(Zap2itid) then
//      begin
//
//        CodeSite.SendMsg(tmsId);
//
//        programelem.TryGetValue<string>('title', title);
//        programelem.TryGetValue<string>('episodeTitle', episodeTitle);
//        programelem.TryGetValue<string>('episodeNum', episodeNum);
//        programelem.TryGetValue<string>('seasonNum', seasonNum);
//        programelem.TryGetValue<string>('longDescription', longDescription);
//
//        CodeSite.SendMsg(title);
//
//        Break;
//      end;
//
//    end;
//    // LesTitres.add(title.ToLower); // normalize as L.C.
//  end;
//
//  if Assigned(LJsonArr) then
//    LJsonArr.Free;

end;

procedure TDataModuleMain.DataModuleCreate(Sender: TObject);
begin

//RESTClient1.Params.AddHeader()
//    RESTRequest1.Params.AddHeader(
//
//            RESTRequest1.Accept

end;

function TDataModuleMain.GetNewShowAirings(var Episode: IEpisode) :string;
  function SetAsISO8601StringRAW(v: String): string;
  var
    sp:         TArray<String>;
    sDateTime:  string;
    sDateTime2: string;
    sFuseau:    string;
  begin
    sp := v.Split([' ']);

    sDateTime := sp[0];
    sFuseau   := sp[1];

    sDateTime2 := LeftStr(sDateTime, 4) + '-' + MidStr(sDateTime, 5, 2) + '-' + MidStr(sDateTime, 7, 2) + 'T' +
      MidStr(sDateTime, 9, 2) + ':' + MidStr(sDateTime, 11, 2);

    if not sFuseau.IsEmpty then
      sDateTime2 := sDateTime2 + LeftStr(sFuseau, 3) + ':' + MidStr(sFuseau, 4, 2);

    Result := sDateTime2;

  end;

var
  strDate: string;

//  qq:                   TUTCDateTime;
//  OriginalAirDate:      TDateTime;
//  LJsonArr:             TJSONArray;
//  LJsonValue:           TJsonValue;
//  title:                string;
//  OriginalStartAirDate: TUTCDateTime;
//  tmsId:                string;
//  rootId:               string;
//  seriesId:             string;
//  longDescription:      string;
//  tvdbID:               string;
//  programelem:          TJsonValue;
//  entityType:           string;
//  Zap2itid:             string;
//  episodeTitle:         string;
//  episodeNum:           string;
//  seasonNum:            string;
//  LJPair:               TJSONPair;
//  LItem:                TJsonValue;

begin

 // OriginalAirDate := Episode.getOriginalAirDate; // on as seulement la journee

  // OriginalStartAirDate:= Episode.GetOriginalStartAirDateTime;

//  qq.AsNormal := OriginalAirDate;
  // qq.SetToNow;
  strDate := SetAsISO8601StringRAW(Episode.GetOriginalStartAirDateTime);

  RESTRequestGracenoteNewShowAirings.Params.ParameterByName('LINEUPID').Value := 'CAN-OTAH1B4J8';
  RESTRequestGracenoteNewShowAirings.Params.ParameterByName('startDateTime').Value := strDate; // '2015-02-16T22:30Z';
  RESTRequestGracenoteNewShowAirings.Params.ParameterByName('api_key').Value := APIGracenote2; //
  RESTRequestGracenoteNewShowAirings.Execute;

  CodeSite.SendNote('Json returnd from UpcomingPrograms is: ' + RESTResponseGracenote.StatusText);

  // CodeSite.SendNote('Json returnd from UpcomingPrograms is: ' + RESTResponseGracenote.JSONText);


  Result:=  RESTResponseGracenote.JSONText;


//  LJsonArr := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(RESTResponseGracenote.JSONText), 0) as TJSONArray;
//
//  CodeSite.SendMsg('Found: ' + LJsonArr.Count.ToString + ' scheduled recordings...');
//
//  for LJsonValue in LJsonArr do
//  begin
//
//    programelem := LJsonValue.GetValue<TJsonValue>('program');
//
//    entityType := programelem.GetValue<string>('entityType');
//
//    if not entityType.Equals('Movie') then
//    begin
//
//      Zap2itid := Episode.GetOriginalms_progid;
//
//      Zap2itid := Zap2itid.Split(['.'])[1];
//
//      tmsId := programelem.GetValue<string>('tmsId');
//
//      if tmsId.Equals(Zap2itid) then
//      begin
//
//        CodeSite.SendMsg(tmsId);
//
//        programelem.TryGetValue<string>('title', title);
//        programelem.TryGetValue<string>('episodeTitle', episodeTitle);
//        programelem.TryGetValue<string>('episodeNum', episodeNum);
//        programelem.TryGetValue<string>('seasonNum', seasonNum);
//        programelem.TryGetValue<string>('longDescription', longDescription);
//
//        CodeSite.SendMsg(title);
//
//        Break;
//      end;
//
//    end;
//    // LesTitres.add(title.ToLower); // normalize as L.C.
//  end;
//
//  if Assigned(LJsonArr) then
//    LJsonArr.Free;

end;

function TDataModuleMain.GetNextRecords(letype: integer): TJsonValue;
begin
  RESTRequestNextUpcomingProgram.Params[0].Value := IntToStr(letype); // scheduleType.ToString;
  RESTRequestNextUpcomingProgram.Execute;
  // JSON := RESTResponse1.Content;

  Result := TJSONArray.Create(RESTResponseArgusTV.JSONValue);

end;

procedure TDataModuleMain.GetNextRecordTitles(const letype: integer; out LesTitres: TStringList);
var

  title:      string;
  LJsonArr:   TJSONArray;
  LJsonValue: TJsonValue;

begin

  RESTRequestUpcomingPrograms.Params[0].Value := IntToStr(letype);
  RESTRequestUpcomingPrograms.Execute;

  CodeSite.SendNote('Json returnd from UpcomingPrograms is: ' + RESTResponseArgusTV.JSONText);

  LJsonArr := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(RESTResponseArgusTV.JSONText), 0) as TJSONArray;

  CodeSite.SendMsg('Found: ' + LJsonArr.Count.ToString + ' scheduled recordings...');


  // use title as key to identify a program
  // don't base it on individual episodes, because once we query one episode,
  // we already have the entire series's XML cached from the TVDB.com,
  // making it uncostly to query other episodes from same series

  for LJsonValue in LJsonArr do
  begin
    title := LJsonValue.GetValue<string>('Title');
    LesTitres.add(title.ToLower); // normalize as L.C.
  end;

  if Assigned(LJsonArr) then
    LJsonArr.Free;

end;

function TDataModuleMain.GetXmlDocument(url: string; pagestream: TStringStream): Boolean;
var
  // doc: IXMLDocument;
  IdHTTP: TIdHTTP;
  // ms: TStringStream;
  // noErrors: Boolean;
begin

  if not Assigned(pagestream) then
    pagestream := TStringStream.Create(nil);

  IdHTTP := TIdHTTP.Create(Self);
  // ms := TStringStream.Create;
  try

    Result := TRUE;

    // * After 1 minute stop trying
    CodeSite.SendMsg(url);

    IdHTTP.ReadTimeout := 1 * 60 * 1000;
    try // --> First try

      IdHTTP.Get(url, pagestream);
    except
      try // --> Second try
        CodeSite.SendWarning('Essai 2 ');
        IdHTTP.Get(url, pagestream);
      except
        try // --> Third try
          CodeSite.SendWarning('Essai 3 ');
          IdHTTP.Get(url, pagestream);
        except
          on e: EIdReadTimeout do
          begin
            Result := False;
            CodeSite.SendError('UPage. IdHTTP.ReadTimeout: ''' + IdHTTP.ResponseText + ''': ' + url);
          end
          else
          begin
            Result := False;
            CodeSite.SendError('UPage. IdHTTP: ''' + IdHTTP.ResponseText + ''': ' + url);
          end;
        end; // <-- Third try
      end;   // <-- Second try
    end;     // <-- First try

    // if noErrors then
    // resultat.LoadFromStream(ms, TXMLEncodingType.xetUTF_8);
    //
  finally
    // ms.Clear;
    // ms.Free;
    IdHTTP.Free;

  end;

end;

end.
