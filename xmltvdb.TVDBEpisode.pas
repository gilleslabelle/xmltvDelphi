{ ******************************************************* }
{ *
  {* uTVDBEpisode.pas
  {* Delphi Implementation of the Class TVDBEpisode
  {* Generated by Enterprise Architect
  {* Created on:      09-f�vr.-2015 11:43:17
  {* Original author: Labelleg  OK
  {*
  {******************************************************* }

unit xmltvdb.TVDBEpisode;

interface

uses System.Generics.Collections;

type
  ITVDBEpisode = interface['{95CA74BA-EDD5-44B3-A3C6-6158DCD22E5B}']
    function toString: String;
    function GetepisodeNumber: String;
    function GetfirstAired: String;
    function GethasImage: boolean;
    function GetseasonNumber: String;
    function Gettitle: String;

    procedure Assign( e:ITVDBEpisode);
    procedure AddMissingInfo(e: ITVDBEpisode);
  end;

  TTVDBEpisode = class(TInterfacedObject,ITVDBEpisode)
  strict private
    FepisodeNumber: String;
    FfirstAired: String;
    FhasImage: boolean;
    FseasonNumber: String;
    Ftitle: String;
  public
    function GetepisodeNumber: String;
    function GetfirstAired: String;
    function GethasImage: boolean;
    function GetseasonNumber: String;
    function Gettitle: String;

    function toString: String;  reintroduce;

    procedure Assign( e:ITVDBEpisode);
    procedure AddMissingInfo(e: ITVDBEpisode);
    constructor Create(const tvdbTitle: String; const tvdbFirstAired: String;const  tvdbSeasonNumber: String;const  tvdbEpisodeNumber: String; const   hasTVDBImage: boolean); overload;


    destructor Destroy; override;
  end;

  TVDBEpisodeColl = class(TList<ITVDBEpisode>)
  public
    constructor Create; overload;
    destructor Destroy; override;

    function containsAll(coll: TVDBEpisodeColl): boolean;
    function IsEmpty: boolean;

    function toString: String; reintroduce;

    function FindByOriginalDate(ladate:string) : ITVDBEpisode;
  end;

implementation

uses
  System.SysUtils;

{ implementation of TVDBEpisode }

procedure TTVDBEpisode.AddMissingInfo(e: ITVDBEpisode);
begin
        if Ftitle.IsEmpty and not e.Gettitle.IsEmpty then
                 Ftitle := e.getTitle;

        if FseasonNumber.IsEmpty and not e.GetseasonNumber.IsEmpty then
                  FseasonNumber := e.GetseasonNumber;

        if FepisodeNumber.IsEmpty and not e.GetepisodeNumber.IsEmpty then
                  FepisodeNumber := e.GetepisodeNumber;

end;

procedure TTVDBEpisode.Assign(e: ITVDBEpisode);
begin
  self.Ftitle := e.getTitle;
  self.FfirstAired := e.GetfirstAired;
  self.FseasonNumber := e.GetseasonNumber;
  self.FepisodeNumber := e.GetepisodeNumber;
  self.FhasImage := e.GethasImage;

end;

constructor TTVDBEpisode.Create(const tvdbTitle, tvdbFirstAired, tvdbSeasonNumber, tvdbEpisodeNumber: String;
 const  hasTVDBImage: boolean);
begin
  inherited Create;

  self.Ftitle := tvdbTitle;
  self.FfirstAired := tvdbFirstAired;
  self.FseasonNumber := tvdbSeasonNumber;
  self.FepisodeNumber := tvdbEpisodeNumber;
  self.FhasImage := hasTVDBImage;
end;

destructor TTVDBEpisode.Destroy;
begin
  inherited Destroy;
end;

function TTVDBEpisode.GetepisodeNumber: String;
begin
  Result := FepisodeNumber;
end;

function TTVDBEpisode.GetfirstAired: String;
begin
  Result := FfirstAired;
end;

function TTVDBEpisode.GethasImage: boolean;
begin
Result := FhasImage;
end;

function TTVDBEpisode.GetseasonNumber: String;
begin
    Result := FseasonNumber;
end;

function TTVDBEpisode.Gettitle: String;
begin
    Result := Ftitle
end;

//procedure TTVDBEpisode.SetepisodeNumber(const Value: String);
//begin
//  FepisodeNumber := Value;
//end;
//
//procedure TTVDBEpisode.SetfirstAired(const Value: String);
//begin
//  FfirstAired := Value;
//end;
//
//procedure TTVDBEpisode.SethasImage(const Value: boolean);
//begin
//  FhasImage := Value;
//end;
//
//procedure TTVDBEpisode.SetseasonNumber(const Value: String);
//begin
//  FseasonNumber := Value;
//end;
//
//procedure TTVDBEpisode.Settitle(const Value: String);
//begin
//  Ftitle := Value;
//end;

function TTVDBEpisode.toString: String;
begin
  Result := FseasonNumber + 'x' + FepisodeNumber + ' - ' + Ftitle + ' (' + FfirstAired + ')';
end;

{ TVDBEpisodeColl }

function TVDBEpisodeColl.containsAll(coll: TVDBEpisodeColl): boolean;
var
  unElement: ITVDBEpisode;
begin

  for unElement in coll do
  begin
    if not self.Contains(unElement) then
    begin
      Result := False;
      exit;
    end;

  end;
  Result := True;

end;

constructor TVDBEpisodeColl.Create;
begin
  inherited Create();
//  OwnsObjects := True;

end;

destructor TVDBEpisodeColl.Destroy;
begin

  inherited Destroy;
end;

function TVDBEpisodeColl.FindByOriginalDate(ladate: string): ITVDBEpisode;
var
  ep:ITVDBEpisode;
begin
    Result := nil ;
    for ep in Self do
    begin
      if sameText( ep.GetfirstAired, ladate) then
      begin
          Result := ep;
      end;

    end;


end;

function TVDBEpisodeColl.IsEmpty: boolean;
begin
  Result := (self.Count = 0);
end;

function TVDBEpisodeColl.toString: String;
var
  item: ITVDBEpisode;
begin

  Result := '';

  for item in self do
  begin
    Result := Result + '; ' + item.toString;
  end;

end;

end.