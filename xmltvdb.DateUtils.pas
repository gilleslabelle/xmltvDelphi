unit xmltvdb.DateUtils;

interface

//uses
//  System.SysUtils ,System.DateUtils ,Soap.XSBuiltIns;

type
  TUTCDateTime = Record
  strict private
    var
      FDT : TDateTime;
  private
    function GetAsUTC : TDateTime;
    function GetAsLocal : TDateTime;
    function GetAsISO8601String : String;

    procedure SetAsISO8601String(v : String);
    function GetAsISO8601StringRAW : String;
    procedure SetAsISO8601StringRAW(v : String);
    procedure SetAsUTC(dt : TDateTime);
    procedure SetAsLocal(dt : TDateTime);
    function GetAsNormal: TDateTime;
    procedure SetAsNormal(const Value: TDateTime);
    function GetAsISO8601StringShort: String;

  public

    function IsDST : Boolean;
    procedure SetToNow;

    property AsUTC : TDateTime read GetAsUTC Write SetAsUTC;
    property AsNormal : TDateTime read GetAsNormal Write SetAsNormal;
    property AsLocal : TDateTime read GetAsLocal Write SetAsLocal;
    property AsISO8601String : String read GetAsISO8601String Write SetAsISO8601String;
    property AsISO8601StringRAW : String read GetAsISO8601StringRAW Write SetAsISO8601StringRAW;

  property AsISO8601StringShort : String read GetAsISO8601StringShort Write SetAsISO8601StringRAW;

  End;

  TZymaDateTimeHelper = record helper for TDateTime
    function ToUCTDateTime : TUTCDateTime;
    function To24hStr : String;
    procedure From24hStr(str: String);
    function HourOfTheDay : integer;
    function IsNull: Boolean;
    procedure SetToNull;


  end;

function SHA1FromString(const AString: string): string;




implementation

uses
  System.SysUtils, Soap.XSBuiltIns, System.DateUtils, System.StrUtils,IdHashSHA;



function SHA1FromString(const AString: string): string;
var
  SHA1: TIdHashSHA1;
begin
  SHA1 := TIdHashSHA1.Create;
  try
    Result := SHA1.HashStringAsHex(AString);
  finally
    SHA1.Free;
  end;
end;



function DateTimeToISO8601(Value: TDateTime): String;
const
  Neg: array[Boolean] of string=  ('+', '-');
begin
  Result := FormatDateTime('yyyymmdd', Value) + 'T' + FormatDateTime('hhnnss', Value) + 'Z';

end;
function DateTimeToISO8601NoSec(Value: TDateTime): String;
const
  Neg: array[Boolean] of string=  ('+', '-');
begin
  Result := FormatDateTime('yyyy-mm-dd', Value) + 'T' + FormatDateTime('hh:nn', Value) + 'Z';

end;



{ TUTCDateTime }

function TUTCDateTime.GetAsISO8601StringShort: String;
begin
  Result := DateTimeToISO8601NoSec(FDT);
end;


function TUTCDateTime.GetAsISO8601String: String;
begin
  Result := DateTimeToXMLTime(FDT, False);
end;

function TUTCDateTime.GetAsISO8601StringRAW: String;
begin
  Result := DateTimeToISO8601(FDT);
end;

function TUTCDateTime.GetAsLocal: TDateTime;
begin

  Result := TTimeZone.Local.ToLocalTime(FDT);
end;

function TUTCDateTime.GetAsNormal: TDateTime;
begin
  Result := TTimeZone.Local.ToLocalTime(FDT);
  if TTimeZone.Local.IsDaylightTime(FDT) then
    Result := IncHour(Result, -1);

end;

function TUTCDateTime.GetAsUTC: TDateTime;
begin
  Result := FDT;
end;


function TUTCDateTime.IsDST: Boolean;
begin
  Result := TTimeZone.Local.IsDaylightTime(FDT);

end;

procedure TUTCDateTime.SetAsISO8601String(v: String);
begin
 FDT := XMLTimeToDateTime(v, True);
end;

procedure TUTCDateTime.SetAsISO8601StringRAW(v: String);
var
  sp: TArray<String>;
  sDateTime : string;
  sDateTime2 : string;
  sFuseau:string;
begin
   sp:= v.Split([' '] );

   sDateTime := sp[0];
   sFuseau := sp[1];

    sDateTime2 :=  LeftStr(sDateTime,4) +'-' + MidStr(sDateTime,5,2) +'-' + MidStr(sDateTime,7,2)+'T'+ MidStr(sDateTime,9,2) +':' +MidStr(sDateTime,11,2) +':'   +MidStr(sDateTime,13,2) ;

    if not sFuseau.IsEmpty then
     sDateTime2 := sDateTime2 + LeftStr(sFuseau,3) + ':' + MidStr(sFuseau,4,2);

    Self.SetAsISO8601String(sDateTime2);

end;

procedure TUTCDateTime.SetAsLocal(dt: TDateTime);
var
  bInSaving : Boolean;
begin
  if TTimeZone.Local.IsAmbiguousTime(dt) then
      bInSaving := false;  //**+**  on doit essaye de détecter la date heure (saving light ou non)
  FDT := TTimeZone.Local.ToUniversalTime(dt, true );

end;

procedure TUTCDateTime.SetAsNormal(const Value: TDateTime);
begin
  FDT := TTimeZone.Local.ToUniversalTime(Value, FALSE);

end;

procedure TUTCDateTime.SetAsUTC(dt: TDateTime);
begin
  FDT := dt;
end;

procedure TUTCDateTime.SetToNow;
begin
  FDT := TTimeZone.Local.ToUniversalTime(now);
end;

{ TZymaDateTimeHelper }

procedure TZymaDateTimeHelper.From24hStr(str: String);
begin

end;

function TZymaDateTimeHelper.HourOfTheDay: integer;
begin
  // **+**
  Result := HourOf(self);
  if Result = 0 then
    Result := 24;

end;

function TZymaDateTimeHelper.To24hStr: String;
begin
  // **+**
  if HourOf(self) = 0 then
  begin
    Result := Format('%d-%d-%d %d:%d:%d', [0,0,0,0,0,0]) ;
  end
  else
  begin
    Result := Format('%d-%d-%d %d:%d:%d', [0,0,0,0,0,0]) ;
  end;
end;

function TZymaDateTimeHelper.ToUCTDateTime: TUTCDateTime;
begin
  Result.AsLocal := Self;
end;

function TZymaDateTimeHelper.IsNull: Boolean;
begin
  Result := (Self = EncodeDateTime(1899, 12, 30, 0, 0, 0, 0));
end;

procedure TZymaDateTimeHelper.SetToNull;
begin
  Self := 0;
end;


end.
