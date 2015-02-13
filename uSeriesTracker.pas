{ ******************************************************* }
{ *
  {* uSeriesTracker.pas
  {* Delphi Implementation of the Class SeriesTracker
  {* Generated by Enterprise Architect
  {* Created on:      09-f�vr.-2015 11:42:14
  {* Original author: Labelleg      OK
  {*
  {******************************************************* }

unit uSeriesTracker;

interface

uses
  System.Generics.Collections;

type

  // Simple tracking class to track successful and failed look-ups per series.
  TSeriesTracker = class(TInterfacedObject, IComparable<TObject>)
  private
    Ffail: Integer;
    Fseries: String;
    Fsucess: Integer;
  protected
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
  public
    procedure addFail;
    procedure addSuccess;
    // order more successful first

    function CompareTo(Other: TObject): Integer;

    function getFail: Integer;
    function getPercentSuccessful: double;
    function getSeries: String;
    function getSucess: Integer;
    function getTotal: Integer;
    constructor Create(series: String);

    destructor Destroy; override;
  end;

  TSeriesTrackerColl = Class(TObjectDictionary<string, TSeriesTracker>)
  public
    constructor Create();
    destructor Destroy; override;

  End;

implementation

procedure TSeriesTracker.addFail;
begin
  inc(Ffail);
end;

procedure TSeriesTracker.addSuccess;
begin
  inc(Fsucess);
end;

function TSeriesTracker.CompareTo(Other: TObject): Integer;
var
  st: TSeriesTracker;
begin

  st := Other as TSeriesTracker;

  if Self.getPercentSuccessful > st.getPercentSuccessful then
  begin
    Result := -1;
  end
  else if Self.getPercentSuccessful < st.getPercentSuccessful then
  begin
    Result := 1
  end
  else
  begin
    Result := 0;
  end;

end;

constructor TSeriesTracker.Create(series: String);
begin
  inherited Create;
  Ffail := 0;
  Fsucess := 0;

  Self.Fseries := series;
end;

destructor TSeriesTracker.Destroy;
begin

  inherited;
end;

function TSeriesTracker.getFail: Integer;
begin
  Result := Ffail;
end;

function TSeriesTracker.getPercentSuccessful: double;
begin
  if Self.getTotal = 0 then
  begin

    Result := 0
  end
  else
  begin
    Result := 100.0 * (getSucess() / getTotal());
  end;
end;

function TSeriesTracker.getSeries: String;
begin
  Result := Fseries;
end;

function TSeriesTracker.getSucess: Integer;
begin
  Result := Fsucess;
end;

function TSeriesTracker.getTotal: Integer;
begin
  Result := getSucess + getFail;
end;

function TSeriesTracker.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  QueryInterface := 0;
end;

function TSeriesTracker._AddRef: Integer;
begin
  _AddRef := 0;
end;

function TSeriesTracker._Release: Integer;
begin
  _Release := 0;
end;

{ TSeriesTracker }

{ TSeriesTrackerColl }

constructor TSeriesTrackerColl.Create;
begin
  inherited Create([doOwnsValues]);
end;

destructor TSeriesTrackerColl.Destroy;
begin

  inherited;
end;

end.