{ ************************************************************ }
{ }
{ XML Data Binding }
{ }
{ Generated on: 2015-02-10 21:10:38 }
{ Generated from: C:\Users\admin\Downloads\fr\fr.xml }
{ Settings stored in: C:\Users\admin\Downloads\fr\fr.xdb }
{ }
{ ************************************************************ }

unit uTVDBBind;

interface

uses xmldom, XMLDoc, XMLIntf;

type

  { Forward Decls }

  IXMLTVDBDataType = interface;
  IXMLTVDBSeriesType = interface;
  IXMLTVDBSeriesTypeList = interface;
  IXMLTVDBEpisodeType = interface;
  IXMLTVDBEpisodeTypeList = interface;

  { IXMLTVDBDataType }

  IXMLTVDBDataType = interface(IXMLNode)
    ['{23D9F943-4538-4FA2-B097-1DC7BC6BA33B}']
    { Property Accessors }
    function GetSeries: IXMLTVDBSeriesTypeList;
    function GetEpisode: IXMLTVDBEpisodeTypeList;
    { Methods & Properties }
    property Series: IXMLTVDBSeriesTypeList read GetSeries;
    property Episode: IXMLTVDBEpisodeTypeList read GetEpisode;
  end;

  { IXMLTVDBSeriesType }

  IXMLTVDBSeriesType = interface(IXMLNode)
    ['{ACEC8900-E7D3-4DFE-8426-35EA2DAC8136}']
    { Property Accessors }
    function GetId: Integer;
    function GetActors: UnicodeString;
    function GetAirs_DayOfWeek: UnicodeString;
    function GetAirs_Time: TTime;
    function GetContentRating: UnicodeString;
    function GetFirstAired: UnicodeString;
    function GetGenre: UnicodeString;
    function GetIMDB_ID: UnicodeString;
    function GetLanguage: UnicodeString;
    function GetNetwork: UnicodeString;
    function GetNetworkID: UnicodeString;
    function GetOverview: UnicodeString;
    function GetRating: double;
    function GetRatingCount: Integer;
    function GetRuntime: Integer;
    function GetSeriesID: UnicodeString;
    function GetSeriesName: UnicodeString;
    function GetStatus: UnicodeString;
    function GetAdded: TDateTime;
    function GetAddedBy: Integer;
    function GetBanner: UnicodeString;
    function GetFanart: UnicodeString;
    function GetLastupdated: Integer;
    function GetPoster: UnicodeString;
    function GetTms_wanted_old: Integer;
    function GetZap2it_id: Integer;
    { Methods & Properties }
    property Id: Integer read GetId;
    property Actors: UnicodeString read GetActors;
    property Airs_DayOfWeek: UnicodeString read GetAirs_DayOfWeek;
    property Airs_Time: TTime read GetAirs_Time;
    property ContentRating: UnicodeString read GetContentRating;
    property FirstAired: UnicodeString read GetFirstAired;
    property Genre: UnicodeString read GetGenre;
    property IMDB_ID: UnicodeString read GetIMDB_ID;
    property Language: UnicodeString read GetLanguage;
    property Network: UnicodeString read GetNetwork;
    property NetworkID: UnicodeString read GetNetworkID;
    property Overview: UnicodeString read GetOverview;
    property Rating: double read GetRating;
    property RatingCount: Integer read GetRatingCount;
    property Runtime: Integer read GetRuntime;
    property SeriesID: UnicodeString read GetSeriesID;
    property SeriesName: UnicodeString read GetSeriesName;
    property Status: UnicodeString read GetStatus;
    property Added: TDateTime read GetAdded;
    property AddedBy: Integer read GetAddedBy;
    property Banner: UnicodeString read GetBanner;
    property Fanart: UnicodeString read GetFanart;
    property Lastupdated: Integer read GetLastupdated;
    property Poster: UnicodeString read GetPoster;
    property Tms_wanted_old: Integer read GetTms_wanted_old;
    property Zap2it_id: Integer read GetZap2it_id;
  end;

  { IXMLTVDBSeriesTypeList }

  IXMLTVDBSeriesTypeList = interface(IXMLNodeCollection)
    ['{70B9DDDD-FF14-4624-BCB0-D0D737C8A4C3}']
    { Methods & Properties }
    function Add: IXMLTVDBSeriesType;
    function Insert(const Index: Integer): IXMLTVDBSeriesType;

    function GetItem(Index: Integer): IXMLTVDBSeriesType;
    property Items[Index: Integer]: IXMLTVDBSeriesType read GetItem; default;
  end;

  { IXMLTVDBEpisodeType }

  IXMLTVDBEpisodeType = interface(IXMLNode)
    ['{61379FC9-68AA-4E95-A6FA-31438B2E2C61}']
    { Property Accessors }
    function GetId: Integer;
    function GetCombined_episodenumber: Integer;
    function GetCombined_season: Integer;
    function GetDVD_chapter: UnicodeString;
    function GetDVD_discid: UnicodeString;
    function GetDVD_episodenumber: UnicodeString;
    function GetDVD_season: UnicodeString;
    function GetDirector: UnicodeString;
    function GetEpImgFlag: UnicodeString;
    function GetEpisodeName: UnicodeString;
    function GetEpisodeNumber: UnicodeString;
    function GetFirstAired: UnicodeString;
    function GetGuestStars: UnicodeString;
    function GetIMDB_ID: UnicodeString;
    function GetLanguage: UnicodeString;
    function GetOverview: UnicodeString;
    function GetProductionCode: UnicodeString;
    function GetRating: double;
    function GetRatingCount: Integer;
    function GetSeasonNumber: UnicodeString;
    function GetWriter: UnicodeString;
    function GetAbsolute_number: UnicodeString;
    function GetAirsafter_season: UnicodeString;
    function GetAirsbefore_episode: UnicodeString;
    function GetAirsbefore_season: UnicodeString;
    function GetFilename: UnicodeString;
    function GetLastupdated: Integer;
    function GetSeasonid: Integer;
    function GetSeriesID: Integer;
    function GetThumb_added: UnicodeString;
    function GetThumb_height: UnicodeString;
    function GetThumb_width: UnicodeString;
    { Methods & Properties }
    property Id: Integer read GetId;
    property Combined_episodenumber: Integer read GetCombined_episodenumber;
    property Combined_season: Integer read GetCombined_season;
    property DVD_chapter: UnicodeString read GetDVD_chapter;
    property DVD_discid: UnicodeString read GetDVD_discid;
    property DVD_episodenumber: UnicodeString read GetDVD_episodenumber;
    property DVD_season: UnicodeString read GetDVD_season;
    property Director: UnicodeString read GetDirector;
    property EpImgFlag: UnicodeString read GetEpImgFlag;
    property EpisodeName: UnicodeString read GetEpisodeName;
    property EpisodeNumber: UnicodeString read GetEpisodeNumber;
    property FirstAired: UnicodeString read GetFirstAired;
    property GuestStars: UnicodeString read GetGuestStars;
    property IMDB_ID: UnicodeString read GetIMDB_ID;
    property Language: UnicodeString read GetLanguage;
    property Overview: UnicodeString read GetOverview;
    property ProductionCode: UnicodeString read GetProductionCode;
    property Rating: double read GetRating;
    property RatingCount: Integer read GetRatingCount;
    property SeasonNumber: UnicodeString read GetSeasonNumber;
    property Writer: UnicodeString read GetWriter;
    property Absolute_number: UnicodeString read GetAbsolute_number;
    property Airsafter_season: UnicodeString read GetAirsafter_season;
    property Airsbefore_episode: UnicodeString read GetAirsbefore_episode;
    property Airsbefore_season: UnicodeString read GetAirsbefore_season;
    property Filename: UnicodeString read GetFilename;
    property Lastupdated: Integer read GetLastupdated;
    property Seasonid: Integer read GetSeasonid;
    property SeriesID: Integer read GetSeriesID;
    property Thumb_added: UnicodeString read GetThumb_added;
    property Thumb_height: UnicodeString read GetThumb_height;
    property Thumb_width: UnicodeString read GetThumb_width;
  end;

  { IXMLTVDBEpisodeTypeList }

  IXMLTVDBEpisodeTypeList = interface(IXMLNodeCollection)
    ['{7DE8BC0B-0C2E-434D-823F-7E3E798C004F}']
    { Methods & Properties }
    function Add: IXMLTVDBEpisodeType;
    function Insert(const Index: Integer): IXMLTVDBEpisodeType;

    function GetItem(Index: Integer): IXMLTVDBEpisodeType;
    property Items[Index: Integer]: IXMLTVDBEpisodeType read GetItem; default;
  end;

  { Forward Decls }

  TXMLTVDBDataType = class;
  TXMLTVDBSeriesType = class;
  TXMLTVDBSeriesTypeList = class;
  TXMLTVDBEpisodeType = class;
  TXMLTVDBEpisodeTypeList = class;

  { TXMLTVDBDataType }

  TXMLTVDBDataType = class(TXMLNode, IXMLTVDBDataType)
  private
    FSeries: IXMLTVDBSeriesTypeList;
    FEpisode: IXMLTVDBEpisodeTypeList;
  protected
    { IXMLTVDBDataType }
    function GetSeries: IXMLTVDBSeriesTypeList;
    function GetEpisode: IXMLTVDBEpisodeTypeList;
  public
    procedure AfterConstruction; override;
  end;

  { TXMLTVDBSeriesType }

  TXMLTVDBSeriesType = class(TXMLNode, IXMLTVDBSeriesType)
  protected
    { IXMLTVDBSeriesType }
    function GetId: Integer;
    function GetActors: UnicodeString;
    function GetAirs_DayOfWeek: UnicodeString;
    function GetAirs_Time: TTime;
    function GetContentRating: UnicodeString;
    function GetFirstAired: UnicodeString;
    function GetGenre: UnicodeString;
    function GetIMDB_ID: UnicodeString;
    function GetLanguage: UnicodeString;
    function GetNetwork: UnicodeString;
    function GetNetworkID: UnicodeString;
    function GetOverview: UnicodeString;
    function GetRating: double;
    function GetRatingCount: Integer;
    function GetRuntime: Integer;
    function GetSeriesID: UnicodeString;
    function GetSeriesName: UnicodeString;
    function GetStatus: UnicodeString;
    function GetAdded: TDateTime;
    function GetAddedBy: Integer;
    function GetBanner: UnicodeString;
    function GetFanart: UnicodeString;
    function GetLastupdated: Integer;
    function GetPoster: UnicodeString;
    function GetTms_wanted_old: Integer;
    function GetZap2it_id: Integer;
  end;

  { TXMLTVDBSeriesTypeList }

  TXMLTVDBSeriesTypeList = class(TXMLNodeCollection, IXMLTVDBSeriesTypeList)
  protected
    { IXMLTVDBSeriesTypeList }
    function Add: IXMLTVDBSeriesType;
    function Insert(const Index: Integer): IXMLTVDBSeriesType;

    function GetItem(Index: Integer): IXMLTVDBSeriesType;
  end;

  { TXMLTVDBEpisodeType }

  TXMLTVDBEpisodeType = class(TXMLNode, IXMLTVDBEpisodeType)
  protected
    { IXMLTVDBEpisodeType }
    function GetId: Integer;
    function GetCombined_episodenumber: Integer;
    function GetCombined_season: Integer;
    function GetDVD_chapter: UnicodeString;
    function GetDVD_discid: UnicodeString;
    function GetDVD_episodenumber: UnicodeString;
    function GetDVD_season: UnicodeString;
    function GetDirector: UnicodeString;
    function GetEpImgFlag: UnicodeString;
    function GetEpisodeName: UnicodeString;
    function GetEpisodeNumber: UnicodeString;
    function GetFirstAired: UnicodeString;
    function GetGuestStars: UnicodeString;
    function GetIMDB_ID: UnicodeString;
    function GetLanguage: UnicodeString;
    function GetOverview: UnicodeString;
    function GetProductionCode: UnicodeString;
    function GetRating: double;
    function GetRatingCount: Integer;
    function GetSeasonNumber: UnicodeString;
    function GetWriter: UnicodeString;
    function GetAbsolute_number: UnicodeString;
    function GetAirsafter_season: UnicodeString;
    function GetAirsbefore_episode: UnicodeString;
    function GetAirsbefore_season: UnicodeString;
    function GetFilename: UnicodeString;
    function GetLastupdated: Integer;
    function GetSeasonid: Integer;
    function GetSeriesID: Integer;
    function GetThumb_added: UnicodeString;
    function GetThumb_height: UnicodeString;
    function GetThumb_width: UnicodeString;
  end;

  { TXMLTVDBEpisodeTypeList }

  TXMLTVDBEpisodeTypeList = class(TXMLNodeCollection, IXMLTVDBEpisodeTypeList)
  protected
    { IXMLTVDBEpisodeTypeList }
    function Add: IXMLTVDBEpisodeType;
    function Insert(const Index: Integer): IXMLTVDBEpisodeType;

    function GetItem(Index: Integer): IXMLTVDBEpisodeType;
  end;

  { Global Functions }

function GetData(Doc: IXMLDocument): IXMLTVDBDataType;
function LoadData(const Filename: string): IXMLTVDBDataType;
function NewData: IXMLTVDBDataType;

const
  TargetNamespace = '';

implementation

uses
  System.Variants;

{ Global Functions }

function GetData(Doc: IXMLDocument): IXMLTVDBDataType;
begin
  Result := Doc.GetDocBinding('Data', TXMLTVDBDataType, TargetNamespace) as IXMLTVDBDataType;
end;

function LoadData(const Filename: string): IXMLTVDBDataType;
begin
  Result := LoadXMLDocument(Filename).GetDocBinding('Data', TXMLTVDBDataType, TargetNamespace) as IXMLTVDBDataType;
end;

function NewData: IXMLTVDBDataType;
begin
  Result := NewXMLDocument.GetDocBinding('Data', TXMLTVDBDataType, TargetNamespace) as IXMLTVDBDataType;
end;

{ TXMLTVDBDataType }

procedure TXMLTVDBDataType.AfterConstruction;
begin
  RegisterChildNode('Series', TXMLTVDBSeriesType);
  RegisterChildNode('Episode', TXMLTVDBEpisodeType);
  FSeries := CreateCollection(TXMLTVDBSeriesTypeList, IXMLTVDBSeriesType, 'Series') as IXMLTVDBSeriesTypeList;
  FEpisode := CreateCollection(TXMLTVDBEpisodeTypeList, IXMLTVDBEpisodeType, 'Episode') as IXMLTVDBEpisodeTypeList;
  inherited;
end;

function TXMLTVDBDataType.GetSeries: IXMLTVDBSeriesTypeList;
begin
  Result := FSeries;
end;

function TXMLTVDBDataType.GetEpisode: IXMLTVDBEpisodeTypeList;
begin
  Result := FEpisode;
end;

{ TXMLTVDBSeriesType }

function TXMLTVDBSeriesType.GetId: Integer;
begin
  Result := ChildNodes['id'].NodeValue;
end;

function TXMLTVDBSeriesType.GetActors: UnicodeString;
begin
  Result := ChildNodes['Actors'].Text;
end;

function TXMLTVDBSeriesType.GetAirs_DayOfWeek: UnicodeString;
begin
  Result := ChildNodes['Airs_DayOfWeek'].Text;
end;

function TXMLTVDBSeriesType.GetAirs_Time: TTime;
begin
  Result := ChildNodes['Airs_Time'].NodeValue;
end;

function TXMLTVDBSeriesType.GetContentRating: UnicodeString;
begin
  Result := ChildNodes['ContentRating'].Text;
end;

function TXMLTVDBSeriesType.GetFirstAired: UnicodeString;
begin
  Result := ChildNodes['FirstAired'].Text;
end;

function TXMLTVDBSeriesType.GetGenre: UnicodeString;
begin
  Result := ChildNodes['Genre'].Text;
end;

function TXMLTVDBSeriesType.GetIMDB_ID: UnicodeString;
begin
  Result := ChildNodes['IMDB_ID'].Text;
end;

function TXMLTVDBSeriesType.GetLanguage: UnicodeString;
begin
  Result := ChildNodes['Language'].Text;
end;

function TXMLTVDBSeriesType.GetNetwork: UnicodeString;
begin
  Result := ChildNodes['Network'].Text;
end;

function TXMLTVDBSeriesType.GetNetworkID: UnicodeString;
begin
  Result := ChildNodes['NetworkID'].Text;
end;

function TXMLTVDBSeriesType.GetOverview: UnicodeString;
begin
  Result := ChildNodes['Overview'].Text;
end;

function TXMLTVDBSeriesType.GetRating: double;
begin
  Result := ChildNodes['Rating'].NodeValue;
end;

function TXMLTVDBSeriesType.GetRatingCount: Integer;
begin
  Result := ChildNodes['RatingCount'].NodeValue;
end;

function TXMLTVDBSeriesType.GetRuntime: Integer;
begin
  Result := ChildNodes['Runtime'].NodeValue;
end;

function TXMLTVDBSeriesType.GetSeriesID: UnicodeString;
begin
  if Assigned(ChildNodes['seriesid']) then
    Result := ChildNodes['seriesid'].Text
  else
    Result := ChildNodes['SeriesID'].Text;
end;

function TXMLTVDBSeriesType.GetSeriesName: UnicodeString;
begin
  Result := ChildNodes['SeriesName'].Text;
end;

function TXMLTVDBSeriesType.GetStatus: UnicodeString;
begin
  Result := ChildNodes['Status'].Text;
end;

function TXMLTVDBSeriesType.GetAdded: TDateTime;
begin
  Result := ChildNodes['added'].NodeValue;
end;

function TXMLTVDBSeriesType.GetAddedBy: Integer;
begin
  Result := ChildNodes['addedBy'].NodeValue;
end;

function TXMLTVDBSeriesType.GetBanner: UnicodeString;
begin
  Result := ChildNodes['banner'].Text;
end;

function TXMLTVDBSeriesType.GetFanart: UnicodeString;
begin
  Result := ChildNodes['fanart'].Text;
end;

function TXMLTVDBSeriesType.GetLastupdated: Integer;
begin
  Result := ChildNodes['lastupdated'].NodeValue;
end;

function TXMLTVDBSeriesType.GetPoster: UnicodeString;
begin
  Result := ChildNodes['poster'].Text;
end;

function TXMLTVDBSeriesType.GetTms_wanted_old: Integer;
begin
  Result := ChildNodes['tms_wanted_old'].NodeValue;
end;

function TXMLTVDBSeriesType.GetZap2it_id: Integer;
begin
  Result := ChildNodes['zap2it_id'].NodeValue;
end;

{ TXMLTVDBSeriesTypeList }

function TXMLTVDBSeriesTypeList.Add: IXMLTVDBSeriesType;
begin
  Result := AddItem(-1) as IXMLTVDBSeriesType;
end;

function TXMLTVDBSeriesTypeList.Insert(const Index: Integer): IXMLTVDBSeriesType;
begin
  Result := AddItem(Index) as IXMLTVDBSeriesType;
end;

function TXMLTVDBSeriesTypeList.GetItem(Index: Integer): IXMLTVDBSeriesType;
begin
  Result := List[Index] as IXMLTVDBSeriesType;
end;

{ TXMLTVDBEpisodeType }

function TXMLTVDBEpisodeType.GetId: Integer;
begin
  Result := ChildNodes['id'].NodeValue;
end;

function TXMLTVDBEpisodeType.GetCombined_episodenumber: Integer;
begin
  Result := ChildNodes['Combined_episodenumber'].NodeValue;
end;

function TXMLTVDBEpisodeType.GetCombined_season: Integer;
begin
  Result := ChildNodes['Combined_season'].NodeValue;
end;

function TXMLTVDBEpisodeType.GetDVD_chapter: UnicodeString;
begin
  Result := ChildNodes['DVD_chapter'].Text;
end;

function TXMLTVDBEpisodeType.GetDVD_discid: UnicodeString;
begin
  Result := ChildNodes['DVD_discid'].Text;
end;

function TXMLTVDBEpisodeType.GetDVD_episodenumber: UnicodeString;
begin
  Result := ChildNodes['DVD_episodenumber'].Text;
end;

function TXMLTVDBEpisodeType.GetDVD_season: UnicodeString;
begin
  Result := ChildNodes['DVD_season'].Text;
end;

function TXMLTVDBEpisodeType.GetDirector: UnicodeString;
begin
  Result := ChildNodes['Director'].Text;
end;

function TXMLTVDBEpisodeType.GetEpImgFlag: UnicodeString;
begin
  Result := ChildNodes['EpImgFlag'].Text;
end;

function TXMLTVDBEpisodeType.GetEpisodeName: UnicodeString;
begin
  Result := ChildNodes['EpisodeName'].Text;
end;

function TXMLTVDBEpisodeType.GetEpisodeNumber: UnicodeString;
begin
  Result := ChildNodes['EpisodeNumber'].Text;
end;

function TXMLTVDBEpisodeType.GetFirstAired: UnicodeString;
begin
  Result := ChildNodes['FirstAired'].Text;
end;

function TXMLTVDBEpisodeType.GetGuestStars: UnicodeString;
begin
  Result := ChildNodes['GuestStars'].Text;
end;

function TXMLTVDBEpisodeType.GetIMDB_ID: UnicodeString;
begin
  Result := ChildNodes['IMDB_ID'].Text;
end;

function TXMLTVDBEpisodeType.GetLanguage: UnicodeString;
begin
  Result := ChildNodes['Language'].Text;
end;

function TXMLTVDBEpisodeType.GetOverview: UnicodeString;
begin
  Result := ChildNodes['Overview'].Text;
end;

function TXMLTVDBEpisodeType.GetProductionCode: UnicodeString;
begin
  Result := ChildNodes['ProductionCode'].Text;
end;

function TXMLTVDBEpisodeType.GetRating: double;
begin
  Result := ChildNodes['Rating'].NodeValue;
end;

function TXMLTVDBEpisodeType.GetRatingCount: Integer;
begin
  Result := ChildNodes['RatingCount'].NodeValue;
end;

function TXMLTVDBEpisodeType.GetSeasonNumber: UnicodeString;
begin
  Result := ChildNodes['SeasonNumber'].Text;
end;

function TXMLTVDBEpisodeType.GetWriter: UnicodeString;
begin
  Result := ChildNodes['Writer'].Text;
end;

function TXMLTVDBEpisodeType.GetAbsolute_number: UnicodeString;
begin
  Result := ChildNodes['absolute_number'].Text;
end;

function TXMLTVDBEpisodeType.GetAirsafter_season: UnicodeString;
begin
  Result := ChildNodes['airsafter_season'].Text;
end;

function TXMLTVDBEpisodeType.GetAirsbefore_episode: UnicodeString;
begin
  Result := ChildNodes['airsbefore_episode'].Text;
end;

function TXMLTVDBEpisodeType.GetAirsbefore_season: UnicodeString;
begin
  Result := ChildNodes['airsbefore_season'].Text;
end;

function TXMLTVDBEpisodeType.GetFilename: UnicodeString;
begin
  Result := ChildNodes['filename'].Text;
end;

function TXMLTVDBEpisodeType.GetLastupdated: Integer;
begin
  Result := ChildNodes['lastupdated'].NodeValue;
end;

function TXMLTVDBEpisodeType.GetSeasonid: Integer;
begin
  Result := ChildNodes['seasonid'].NodeValue;
end;

function TXMLTVDBEpisodeType.GetSeriesID: Integer;
begin
  Result := ChildNodes['seriesid'].NodeValue;
end;

function TXMLTVDBEpisodeType.GetThumb_added: UnicodeString;
begin
  Result := ChildNodes['thumb_added'].Text;
end;

function TXMLTVDBEpisodeType.GetThumb_height: UnicodeString;
begin
  Result := ChildNodes['thumb_height'].Text;
end;

function TXMLTVDBEpisodeType.GetThumb_width: UnicodeString;
begin
  Result := ChildNodes['thumb_width'].Text;
end;

{ TXMLTVDBEpisodeTypeList }

function TXMLTVDBEpisodeTypeList.Add: IXMLTVDBEpisodeType;
begin
  Result := AddItem(-1) as IXMLTVDBEpisodeType;
end;

function TXMLTVDBEpisodeTypeList.Insert(const Index: Integer): IXMLTVDBEpisodeType;
begin
  Result := AddItem(Index) as IXMLTVDBEpisodeType;
end;

function TXMLTVDBEpisodeTypeList.GetItem(Index: Integer): IXMLTVDBEpisodeType;
begin
  Result := List[Index] as IXMLTVDBEpisodeType;
end;

end.
