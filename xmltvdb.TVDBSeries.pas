{ ******************************************************* }
{ *
  {* uTVDBSeries.pas
  {* Delphi Implementation of the Class TVDBSeries
  {* Generated by Enterprise Architect
  {* Created on:      09-f�vr.-2015 11:43:46
  {* Original author: bvidovic    OK
  {*
  {******************************************************* }

unit xmltvdb.TVDBSeries;

interface

uses
  System.Generics.Collections, System.Classes;

type

   ITVDBSeries= interface['{19AADF49-9842-4F1A-8395-4081F05BD59B}']
    function equals(const o: ITVDBSeries): boolean;
    function GetseriesId: String;
    function GetseriesName: String;
    function GetseriesYear: String;
    procedure SetseriesId(const Value: String);
    procedure SetseriesName(const Value: String);
    procedure SetseriesYear(const Value: String);
    procedure Assign(valeurs:ITVDBSeries);

    function hashCode: Integer;
    function toString: String;

   end;

  TTVDBSeries = class(TInterfacedObject,ITVDBSeries)
  strict private
    FseriesId: String;
    FseriesName: String;
    FseriesYear: String;
  private

  public
    function equals(const o: ITVDBSeries): boolean;  reintroduce;
    function GetseriesId: String;
    function GetseriesName: String;
    function GetseriesYear: String;
    procedure SetseriesId(const Value: String);
    procedure SetseriesName(const Value: String);
    procedure SetseriesYear(const Value: String);

    function hashCode: Integer;
    function toString: String;  reintroduce;

    procedure Assign(valeurs:ITVDBSeries);

    constructor Create(const seriesId: String; const seriesName: String;const  seriesYear: String); overload;
    constructor Create(const seriesId: String); overload;

    destructor Destroy; override;
  end;


  TTVDBSeriesColl = Class(TList<ITVDBSeries>)
  public
    constructor Create; overload;

    destructor Destroy; override;

  End;



implementation

uses
  System.SysUtils;

{ implementation of TVDBSeries }

constructor TTVDBSeries.Create(const seriesId, seriesName, seriesYear: String);
begin
  inherited Create;
  Self.FseriesId := seriesId;
  Self.FseriesName := seriesName;
  Self.FseriesYear := seriesYear;
end;

procedure TTVDBSeries.Assign(valeurs: ITVDBSeries);
begin
      Self.FseriesId := valeurs.GetseriesId;
      Self.FseriesName := valeurs.GetseriesName;
      Self.FseriesYear := valeurs.GetseriesYear;
end;

constructor TTVDBSeries.Create(const seriesId: String);
begin

  inherited Create;
  Self.FseriesId := seriesId;
end;

destructor TTVDBSeries.Destroy;
begin
  inherited Destroy;
end;

function TTVDBSeries.equals(const o: ITVDBSeries): boolean;
//var
//  otherSeries: TTVDBSeries;
begin

  //otherSeries := o;

  if (Self.FseriesId = '') then
  begin
    Result := (o.GetseriesId = '');
  end
  else
  begin
    Result := SameText(Self.GetseriesId, o.GetseriesId);
  end;

end;

function TTVDBSeries.GetseriesId: String;
begin
  REsult := FseriesId;
end;

function TTVDBSeries.GetseriesName: String;
begin
    Result := FseriesName
end;

function TTVDBSeries.GetseriesYear: String;
begin
    Result:= FseriesYear;
end;

function TTVDBSeries.hashCode: Integer;
var
  hash: Integer;
begin
  hash := 3;
  hash := 97 * hash + Self.GetseriesId.GetHashCode; // Objects.hashCode(this.seriesId);
  Result := hash;
end;

procedure TTVDBSeries.SetseriesId(const Value: String);
begin
  FseriesId := Value;
end;

procedure TTVDBSeries.SetseriesName(const Value: String);
begin
  FseriesName := Value;
end;

procedure TTVDBSeries.SetseriesYear(const Value: String);
begin
  FseriesYear := Value;
end;

function TTVDBSeries.toString: String;
begin
  Result := 'tvdbid: ' + GetseriesId + ', seriesName: ' + GetseriesName + ', seriesYear: ' + GetseriesYear;
end;

{ TTVDBSeriesColl }

constructor TTVDBSeriesColl.Create;
begin
  inherited Create;

//  Self.OwnsObjects := true;
end;

destructor TTVDBSeriesColl.Destroy;
begin

  inherited;
end;

end.
