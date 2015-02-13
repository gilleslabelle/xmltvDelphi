{ ******************************************************* }
{ *
  {* uEpisode.pas
  {* Delphi Implementation of the Class Episode
  {* Generated by Enterprise Architect
  {* Created on:      09-f�vr.-2015 11:45:26
  {* Original author: Labelleg  OK
  {*
  {******************************************************* }

unit uEpisode;

interface

uses uTVDBSeries, uTVDBEpisode, System.Generics.Collections;

type

  TEpisode = class
  private
    Fepisode: Integer;
    FhasTVDBImage: boolean; // remote id's we can use to look up series
    Fimdbid: String;
    Flanguage: String; // for multi-part episodes (meaning this episode represents more than 1 tvdb episode)
    FmultiPart: boolean;
    ForiginalAirDate: TDateTime;
    Fseason: Integer;
    Fseries: TTVDBSeries;
    Ftitle: String; // remote id's we can use to look up series
    Fzap2itid: String;
    FmultiPartseasonEpisodeNaming: String;

    function padNumber(const num: Integer): String;
  public
    function addTVDBSeriesEpisodeNumbers(seasonNumber: String; episodeNumber: String): boolean;
    procedure clearRemoteIds;

    constructor Create(series: TTVDBSeries); overload;

    function getEpisode: Integer;
    function getLanguage: String;
    function getMultipartSeasonEpisodeNaming: String;
    function getOriginalAirDate: TDateTime;
    function getPaddedEpisodeNumber: String;
    function getPaddedSeasonNumber: String;
    function getRemoteIds: TDictionary<String, String>;
    function getSeason: Integer;
    function getSeries: TTVDBSeries;
    function getSeriesYear: String;
    function getTitle: String;
    function getTVDBId: String;
    // three numbers separated by dots, the first is the series or season, the second
    // the episode number within that series, and the third the part number, if the
    // programme is part of a two-parter.  All these numbers are indexed from zero,
    // and they can be given in the form 'X/Y' to show series X out of Y series made,
    // or episode X out of Y episodes in this series, or part X of a Y-part episode.
    // If any of these aren't known they can be omitted. You can put spaces whereever
    // you like to make things easier to read.
    function getXMLTVSeasonEpisodeAttribute: String;
    function hasEpisode: boolean;
    function hasOriginalAirDate: boolean;
    function hasRemoteId: boolean;
    function hasSeason: boolean;
    function hasSeries: boolean;
    function hasTitle: boolean;
    function hasTVDBid: boolean;
    function hasTVDBImage: boolean;
    function isMultiPart: boolean;
    procedure setEpisode(const e: Integer);
    procedure setHasTVDBImage(const hasTVDBImage: boolean);
    procedure setIMDBId(const imdbId: String);
    procedure setLanguage(const langCode: String);
    function setMatchingEpisodes(const episodes: TVDBEpisodeColl): boolean;
    procedure setMultipart(const multipart: boolean);
    procedure setMultipartSeasonEpisodeNaming(const seasonEpisodeNaming: String);
    procedure setOriginalAirDate(const dt: TDateTime);
    procedure setSeason(const s: Integer);
    procedure setSeries(const series: TTVDBSeries);
    procedure setTitle(const title: String);
    procedure setZap2ItId(const zap2ItId: String);
    function toString: String; reintroduce;
    // constructor Create; overload;
    destructor Destroy; override;
  end;

implementation

uses
  System.Math, REST.Utils, CodeSiteLogging, System.SysUtils, uConts, uTVDB;

{ implementation of Episode }

function TEpisode.addTVDBSeriesEpisodeNumbers(seasonNumber, episodeNumber: String): boolean;
var
  s: Integer;
  e: Integer;
begin
  Result := False;
  if TryStrToInt(seasonNumber, s) then
  begin
    if TryStrToInt(episodeNumber, e) then
    begin
      setSeason(s);
      setEpisode(e);
      Result := True;

    end;

  end;

  if not Result then
  begin

    CodeSite.SendWarning('Could not parse season episode numbers: S' + seasonNumber + 'E' + episodeNumber);
  end;

end;

procedure TEpisode.clearRemoteIds;
begin
  Self.Fzap2itid := '';
  Self.Fimdbid := '';
end;

constructor TEpisode.Create(series: TTVDBSeries);
begin
  inherited Create;
  Fseason := -1;
  Fepisode := -1;
  Self.ForiginalAirDate.SetToNull;
  Self.Fseries := series;
end;

destructor TEpisode.Destroy;
begin
  inherited Destroy;
  Fseries.Free;
end;

function TEpisode.getEpisode: Integer;
begin
  Result := Fepisode;
end;

function TEpisode.getLanguage: String;
begin
  Result := iif(Flanguage <> '', Flanguage, 'en'); // default english
end;

function TEpisode.getMultipartSeasonEpisodeNaming: String;
begin
  Result := FmultiPartseasonEpisodeNaming;
end;

function TEpisode.getOriginalAirDate: TDateTime;
begin
  Result := ForiginalAirDate;
end;

function TEpisode.getPaddedEpisodeNumber: String;
begin
  Result := padNumber(getEpisode);
end;

function TEpisode.getPaddedSeasonNumber: String;
begin
  Result := padNumber(getSeason);
end;

function TEpisode.getRemoteIds: TDictionary<String, String>;
var
  ids: TDictionary<String, String>;
begin
  // GetSeriesByRemoteID.php?imdbid=<imdbid>&language=<language>&zap2it=<zap2it>

  ids := TDictionary<String, String>.Create;
  // LinkedHashMap<String,String> ids = new LinkedHashMap<>();
  if Fzap2itid <> '' then
  begin
    ids.Add(ZAP2IT_IDENTIFIER, Fzap2itid);
  end;
  if (Fimdbid <> '') then
  begin
    ids.Add(IMDB_IDENTIFIER, Fimdbid);
  end;

  Result := ids;
end;

function TEpisode.getSeason: Integer;
begin
  Result := Fseason;
end;

function TEpisode.getSeries: TTVDBSeries;
begin
  Result := Self.Fseries;
end;

function TEpisode.getSeriesYear: String;
begin
  Result := iif(hasSeries(), Fseries.seriesYear, '');
end;

function TEpisode.getTitle: String;
begin
  Result := Ftitle;
end;

function TEpisode.getTVDBId: String;
begin
  Result := iif(getSeries = nil, '', getSeries().seriesId);
end;

function TEpisode.getXMLTVSeasonEpisodeAttribute: String;
begin
  // zero indexed
  // int e = getEpisode()-1;
  // int s = getSeason()-1;
  // final String part = "0/0";//not used, but needed to keep FTR parser happy
  // return s+"."+e+"."+part;

  Result := Format('%d.%d.0/0', [getEpisode - 1, getSeason - 1]);
end;

function TEpisode.hasEpisode: boolean;
begin
  Result := (Fepisode <> -1);
end;

function TEpisode.hasOriginalAirDate: boolean;
begin
  Result := not ForiginalAirDate.IsNull;
end;

function TEpisode.hasRemoteId: boolean;
begin
  Result := (Fzap2itid <> '') or (Fimdbid <> '');
end;

function TEpisode.hasSeason: boolean;
begin
  Result := (Fseason <> -1);
end;

function TEpisode.hasSeries: boolean;
begin
  Result := (Fseries <> nil);
end;

function TEpisode.hasTitle: boolean;
begin
  Result := (Ftitle <> '');
end;

function TEpisode.hasTVDBid: boolean;
begin
  Result := (getTVDBId <> '-1');
end;

function TEpisode.hasTVDBImage: boolean;
begin
  Result := FhasTVDBImage;
end;

function TEpisode.isMultiPart: boolean;
begin
  Result := FmultiPart;
end;

function TEpisode.padNumber(const num: Integer): String;
begin
  if (num < 10) then
  begin
    Result := '0' + num.toString;
  end
  else
  begin
    Result := '' + num.toString;
  end;
end;

procedure TEpisode.setEpisode(const e: Integer);
begin
  Self.Fepisode := e;
end;

procedure TEpisode.setHasTVDBImage(const hasTVDBImage: boolean);
begin
  Self.FhasTVDBImage := hasTVDBImage;
end;

procedure TEpisode.setIMDBId(const imdbId: String);
begin
  Self.Fimdbid := imdbId;
end;

procedure TEpisode.setLanguage(const langCode: String);
begin
  Self.Flanguage := langCode;
end;

function TEpisode.setMatchingEpisodes(const episodes: TVDBEpisodeColl): boolean;
var
  ep: TTVDBEpisode;
  seasonEpisodeNaming: string;
  lastSeason: Integer;
  firstEpisode: TTVDBEpisode;
  nextEpisode: TTVDBEpisode;
begin
  if (episodes.isEmpty()) then
  begin
    CodeSite.SendWarning('No episodes passed in to setMatchingEpisodes()');
    Result := False;
    exit;
  end;

  if (episodes.count = 1) then
  begin
    setMultipart(False);
    ep := episodes[0];
    Result := addTVDBSeriesEpisodeNumbers(ep.seasonNumber, ep.episodeNumber);
    exit;
  end
  else // multipart
  begin
    setMultipart(True);
    seasonEpisodeNaming := '';
    lastSeason := -1;
    firstEpisode := nil;
    for nextEpisode in episodes do
    begin
      if (firstEpisode = nil) then
      begin
        firstEpisode := nextEpisode;
      end;

      // check the season/episode numbers for integrity
      if (not addTVDBSeriesEpisodeNumbers(nextEpisode.seasonNumber, nextEpisode.episodeNumber)) then
      begin
        CodeSite.SendError('Found a multi-part match on thetvdb.com, ' +
          'but the season and episode numbers are invalid (' + nextEpisode.seasonNumber + '\' +
          nextEpisode.episodeNumber + '\). Skipping and trying again later.');
        Result := False;
        exit;
      end;
      if (getSeason() <> lastSeason) then
      begin
        seasonEpisodeNaming := seasonEpisodeNaming + 'S' + getPaddedSeasonNumber();
      end;

      // always continue to add episode numbers
      seasonEpisodeNaming := seasonEpisodeNaming + 'E' + getPaddedEpisodeNumber();

      lastSeason := getSeason();
    end;
    CodeSite.SendFmtMsg('Video''s multipart (%d-part) season episodes were determined to be: %s',
      [episodes.count, seasonEpisodeNaming]);
    // CodeSite.SendMsg( 'Video''s multipart ('+episodes.Count.ToString+'-part) season episodes were determined to be: ' + seasonEpisodeNaming);
    setMultipartSeasonEpisodeNaming(seasonEpisodeNaming);

    // use the first episode's season/episode as the 'default' if we need just a single-episode number
    addTVDBSeriesEpisodeNumbers(firstEpisode.seasonNumber, firstEpisode.episodeNumber);

    Result := True;
    exit;
  end;

end;

procedure TEpisode.setMultipart(const multipart: boolean);
begin
  Self.FmultiPart := multipart;
end;

procedure TEpisode.setMultipartSeasonEpisodeNaming(const seasonEpisodeNaming: String);
begin
  Self.FmultiPartseasonEpisodeNaming := seasonEpisodeNaming;
end;

procedure TEpisode.setOriginalAirDate(const dt: TDateTime);
begin
  Self.ForiginalAirDate := dt;
end;

procedure TEpisode.setSeason(const s: Integer);
begin
  Self.Fseason := s;
end;

procedure TEpisode.setSeries(const series: TTVDBSeries);
begin
  Self.Fseries := series;
end;

procedure TEpisode.setTitle(const title: String);
begin
  Self.Ftitle := title;
end;

procedure TEpisode.setZap2ItId(const zap2ItId: String);
begin
  Self.Fzap2itid := zap2ItId;
end;

function TEpisode.toString: String;
begin

  Result := getSeries().toString + ': S' + getPaddedSeasonNumber() + 'E' + getPaddedEpisodeNumber() + ' - ' + getTitle()
    + iif(hasOriginalAirDate(), ' (' + TTVDB.dateToTVDBString(getOriginalAirDate) + ')', '');

end;

end.