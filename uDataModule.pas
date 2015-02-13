unit uDataModule;

interface

uses
  System.SysUtils, System.Classes, Xml.xmldom, Xml.XMLIntf, Xml.omnixmldom, Xml.XMLDoc, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, System.JSON;

type
  TDataModuleMain = class(TDataModule)
    XMLDocument1: TXMLDocument;
    BindingsList1: TBindingsList;
    RESTClient1: TRESTClient;
    RESTRequestNextUpcomingProgram: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTRequestUpcomingPrograms: TRESTRequest;
  private
    { Private declarations }
  public
    { Public declarations }
    function GetNextRecords(letype: integer): TJsonValue;
    procedure GetNextRecordTitles(const letype: integer; out LesTitres: TStringList);
    function GetXmlDocument(url: string; pagestream: TStringStream): Boolean;
  end;

var
  DataModuleMain: TDataModuleMain;

implementation

uses
  CodeSiteLogging, IdHTTP, IdExceptionCore;

{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}

function TDataModuleMain.GetNextRecords(letype: integer): TJsonValue;
begin
  RESTRequestNextUpcomingProgram.Params[0].Value := IntToStr(letype); // scheduleType.ToString;
  RESTRequestNextUpcomingProgram.Execute;
  // JSON := RESTResponse1.Content;

  Result := TJSONArray.Create(RESTResponse1.JSONValue);

end;

procedure TDataModuleMain.GetNextRecordTitles(const letype: integer; out LesTitres: TStringList);
var

  // JSON: string;
  // arr: TJSONArray;
  // I: Integer;
  // arr2: TJSONArray;
  // obj: TJSONValue;
  title: string;
  // RetObject: TJSONArray;
  LJsonArr: TJSONArray;
  LJsonValue: TJsonValue;
//  LItem: TJsonValue;
begin

  RESTRequestUpcomingPrograms.Params[0].Value := IntToStr(letype);
  RESTRequestUpcomingPrograms.Execute;
  // JSON := RESTResponse1.Content;

  // RESTResponse1.JSONText;

  // arr := TJSONArray.Create(RESTResponse1.JSONValue);

  // RetObject := TJSONObject.ParseJSONValue(RESTResponse1.Content) as TJSONArray;
  CodeSite.SendNote('Json returnd from UpcomingPrograms is: ' + RESTResponse1.JSONText);

  LJsonArr := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(RESTResponse1.JSONText), 0) as TJSONArray;

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

  // JSONArray arr = new JSONArray(json);

  // for I := 0 to arr.Count - 1 do
  // begin
  // obj := arr.Items[I]; // .getJSONObject(i);
  // // JSONObject obj = arr.getJSONObject(i);
  //
  // title := obj.GetValue<string>('Title'); // aka series
  // //         subtitle := obj.GetValue<string>('SubTitle');
  // // if(!valid(subtitle))
  // // subtitle = '';//normalize as empty string when subtitle is missing
  // // CodeSite.log(title + ': '+ subtitle);
  // // whatToLookUp.add( (title/*+': '+subtitle*/).toLowerCase() );//normalize as L.C.
  // // whatToLookUp.add( (title+': '+subtitle).ToLower );//normalize as L.C.
  // LesTitres.add(title.ToLower); // normalize as L.C.
  //
  // end;
  //
  //
  //
  //
  // arr.Free;

end;

function TDataModuleMain.GetXmlDocument(url: string; pageStream: TStringStream): Boolean;
var
  // doc: IXMLDocument;
  IdHTTP: TIdHTTP;
 // ms: TStringStream;
//  noErrors: Boolean;
begin

  if not Assigned(pageStream) then
    pageStream := TStringStream.Create(nil);


  IdHTTP := TIdHTTP.Create(Self);
//  ms := TStringStream.Create;
  try

  Result := TRUE;

  // * After 1 minute stop trying

  IdHTTP.ReadTimeout := 1 * 60 * 1000;
  try // --> First try
    IdHTTP.Get(url, pageStream);
  except
    try // --> Second try
      IdHTTP.Get(url, pageStream);
    except
      try // --> Third try
        IdHTTP.Get(url, pageStream);
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
    end; // <-- Second try
  end; // <-- First try

//  if noErrors then
//    resultat.LoadFromStream(ms, TXMLEncodingType.xetUTF_8);
//
  finally
//  ms.Clear;
//  ms.Free;
  IdHTTP.Free;

  end;

end;

end.
