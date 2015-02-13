
{*********************************************}
{                                             }
{              XML Data Binding               }
{                                             }
{         Generated on: 2015-02-06 17:20:01   }
{       Generated from: C:\Tmp\xmltv.dtd      }
{   Settings stored in: C:\Tmp\xmltv.xdb      }
{                                             }
{*********************************************}

unit xmltvBind;

interface

uses xmldom, XMLDoc, XMLIntf,XML.Win.msxmldom;

type

{ Forward Decls }

  IXMLTvType = interface;
  IXMLChannelType = interface;
  IXMLChannelTypeList = interface;
  IXMLDisplaynameType = interface;
  IXMLDisplaynameTypeList = interface;
  IXMLIconType = interface;
  IXMLIconTypeList = interface;
  IXMLProgrammeType = interface;
  IXMLProgrammeTypeList = interface;
  IXMLTitleType = interface;
  IXMLTitleTypeList = interface;
  IXMLSubtitleType = interface;
  IXMLSubtitleTypeList = interface;
  IXMLDescType = interface;
  IXMLDescTypeList = interface;
  IXMLCreditsType = interface;
  IXMLActorType = interface;
  IXMLActorTypeList = interface;
  IXMLCategoryType = interface;
  IXMLCategoryTypeList = interface;
  IXMLLanguageType = interface;
  IXMLOriglanguageType = interface;
  IXMLLengthType = interface;
  IXMLCountryType = interface;
  IXMLCountryTypeList = interface;
  IXMLEpisodenumType = interface;
  IXMLEpisodenumTypeList = interface;
  IXMLVideoType = interface;
  IXMLAudioType = interface;
  IXMLPreviouslyshownType = interface;
  IXMLPremiereType = interface;
  IXMLLastchanceType = interface;
  IXMLSubtitlesType = interface;
  IXMLSubtitlesTypeList = interface;
  IXMLRatingType = interface;
  IXMLRatingTypeList = interface;
  IXMLStarratingType = interface;
  IXMLStarratingTypeList = interface;
  IXMLReviewType = interface;
  IXMLReviewTypeList = interface;
  IXMLWriterTypeList = interface;
  IXMLAdapterTypeList = interface;
  IXMLPresenterTypeList = interface;
  IXMLUrlTypeList = interface;
  IXMLCommentatorTypeList = interface;
  IXMLDirectorTypeList = interface;
  IXMLProducerTypeList = interface;
  IXMLComposerTypeList = interface;
  IXMLGuestTypeList = interface;
  IXMLEditorTypeList = interface;

{ IXMLTvType }

  IXMLTvType = interface(IXMLNode)
    ['{A2FE0401-1995-4D58-911B-5382B009601E}']
    { Property Accessors }
    function GetDate: UnicodeString;
    function GetSourceinfourl: UnicodeString;
    function GetSourceinfoname: UnicodeString;
    function GetSourcedataurl: UnicodeString;
    function GetGeneratorinfoname: UnicodeString;
    function GetGeneratorinfourl: UnicodeString;
    function GetChannel: IXMLChannelTypeList;
    function GetProgramme: IXMLProgrammeTypeList;
    procedure SetDate(Value: UnicodeString);
    procedure SetSourceinfourl(Value: UnicodeString);
    procedure SetSourceinfoname(Value: UnicodeString);
    procedure SetSourcedataurl(Value: UnicodeString);
    procedure SetGeneratorinfoname(Value: UnicodeString);
    procedure SetGeneratorinfourl(Value: UnicodeString);
    { Methods & Properties }
    property Date: UnicodeString read GetDate write SetDate;
    property Sourceinfourl: UnicodeString read GetSourceinfourl write SetSourceinfourl;
    property Sourceinfoname: UnicodeString read GetSourceinfoname write SetSourceinfoname;
    property Sourcedataurl: UnicodeString read GetSourcedataurl write SetSourcedataurl;
    property Generatorinfoname: UnicodeString read GetGeneratorinfoname write SetGeneratorinfoname;
    property Generatorinfourl: UnicodeString read GetGeneratorinfourl write SetGeneratorinfourl;
    property Channel: IXMLChannelTypeList read GetChannel;
    property Programme: IXMLProgrammeTypeList read GetProgramme;
  end;

{ IXMLChannelType }

  IXMLChannelType = interface(IXMLNode)
    ['{3EFCBAF0-F76E-4BAC-98CC-AD4CD6D9CFED}']
    { Property Accessors }
    function GetId: UnicodeString;
    function GetDisplayname: IXMLDisplaynameTypeList;
    function GetIcon: IXMLIconTypeList;
    function GetUrl: IXMLUrlTypeList;
    procedure SetId(Value: UnicodeString);
    { Methods & Properties }
    property Id: UnicodeString read GetId write SetId;
    property Displayname: IXMLDisplaynameTypeList read GetDisplayname;
    property Icon: IXMLIconTypeList read GetIcon;
    property Url: IXMLUrlTypeList read GetUrl;
  end;

{ IXMLChannelTypeList }

  IXMLChannelTypeList = interface(IXMLNodeCollection)
    ['{59E5DE7E-D93E-4D67-BC56-4F7320D01C86}']
    { Methods & Properties }
    function Add: IXMLChannelType;
    function Insert(const Index: Integer): IXMLChannelType;

    function GetItem(Index: Integer): IXMLChannelType;
    property Items[Index: Integer]: IXMLChannelType read GetItem; default;
  end;

{ IXMLDisplaynameType }

  IXMLDisplaynameType = interface(IXMLNode)
    ['{68FE85E1-043C-4396-95BC-B680B238FF78}']
    { Property Accessors }
    function GetLang: UnicodeString;
    procedure SetLang(Value: UnicodeString);
    { Methods & Properties }
    property Lang: UnicodeString read GetLang write SetLang;
  end;

{ IXMLDisplaynameTypeList }

  IXMLDisplaynameTypeList = interface(IXMLNodeCollection)
    ['{F65F3C4D-3022-49D5-94D0-C6739CF4EB40}']
    { Methods & Properties }
    function Add: IXMLDisplaynameType;
    function Insert(const Index: Integer): IXMLDisplaynameType;

    function GetItem(Index: Integer): IXMLDisplaynameType;
    property Items[Index: Integer]: IXMLDisplaynameType read GetItem; default;
  end;

{ IXMLIconType }

  IXMLIconType = interface(IXMLNode)
    ['{19C2F477-BB0F-4A32-8914-37891486AA87}']
    { Property Accessors }
    function GetSrc: UnicodeString;
    function GetWidth: UnicodeString;
    function GetHeight: UnicodeString;
    procedure SetSrc(Value: UnicodeString);
    procedure SetWidth(Value: UnicodeString);
    procedure SetHeight(Value: UnicodeString);
    { Methods & Properties }
    property Src: UnicodeString read GetSrc write SetSrc;
    property Width: UnicodeString read GetWidth write SetWidth;
    property Height: UnicodeString read GetHeight write SetHeight;
  end;

{ IXMLIconTypeList }

  IXMLIconTypeList = interface(IXMLNodeCollection)
    ['{CBA0053F-4DEE-4A50-85B6-517F69BE8250}']
    { Methods & Properties }
    function Add: IXMLIconType;
    function Insert(const Index: Integer): IXMLIconType;

    function GetItem(Index: Integer): IXMLIconType;
    property Items[Index: Integer]: IXMLIconType read GetItem; default;
  end;

{ IXMLProgrammeType }

  IXMLProgrammeType = interface(IXMLNode)
    ['{F43FD0F4-46B3-42DC-87F8-E34CE3CCCC02}']
    { Property Accessors }
    function GetStart: UnicodeString;
    function GetStop: UnicodeString;
    function GetPdcstart: UnicodeString;
    function GetVpsstart: UnicodeString;
    function GetShowview: UnicodeString;
    function GetVideoplus: UnicodeString;
    function GetChannel: UnicodeString;
    function GetClumpidx: UnicodeString;
    function GetTitle: IXMLTitleTypeList;
    function GetSubtitle: IXMLSubtitleTypeList;
    function GetDesc: IXMLDescTypeList;
    function GetCredits: IXMLCreditsType;
    function GetDate: UnicodeString;
    function GetCategory: IXMLCategoryTypeList;
    function GetLanguage: IXMLLanguageType;
    function GetOriglanguage: IXMLOriglanguageType;
    function GetLength: IXMLLengthType;
    function GetIcon: IXMLIconTypeList;
    function GetUrl: IXMLUrlTypeList;
    function GetCountry: IXMLCountryTypeList;
    function GetEpisodenum: IXMLEpisodenumTypeList;
    function GetVideo: IXMLVideoType;
    function GetAudio: IXMLAudioType;
    function GetPreviouslyshown: IXMLPreviouslyshownType;
    function GetPremiere: IXMLPremiereType;
    function GetLastchance: IXMLLastchanceType;
    function GetNew: UnicodeString;
    function GetSubtitles: IXMLSubtitlesTypeList;
    function GetRating: IXMLRatingTypeList;
    function GetStarrating: IXMLStarratingTypeList;
    function GetReview: IXMLReviewTypeList;
    procedure SetStart(Value: UnicodeString);
    procedure SetStop(Value: UnicodeString);
    procedure SetPdcstart(Value: UnicodeString);
    procedure SetVpsstart(Value: UnicodeString);
    procedure SetShowview(Value: UnicodeString);
    procedure SetVideoplus(Value: UnicodeString);
    procedure SetChannel(Value: UnicodeString);
    procedure SetClumpidx(Value: UnicodeString);
    procedure SetDate(Value: UnicodeString);
    procedure SetNew(Value: UnicodeString);
    { Methods & Properties }
    property Start: UnicodeString read GetStart write SetStart;
    property Stop: UnicodeString read GetStop write SetStop;
    property Pdcstart: UnicodeString read GetPdcstart write SetPdcstart;
    property Vpsstart: UnicodeString read GetVpsstart write SetVpsstart;
    property Showview: UnicodeString read GetShowview write SetShowview;
    property Videoplus: UnicodeString read GetVideoplus write SetVideoplus;
    property Channel: UnicodeString read GetChannel write SetChannel;
    property Clumpidx: UnicodeString read GetClumpidx write SetClumpidx;
    property Title: IXMLTitleTypeList read GetTitle;
    property Subtitle: IXMLSubtitleTypeList read GetSubtitle;
    property Desc: IXMLDescTypeList read GetDesc;
    property Credits: IXMLCreditsType read GetCredits;
    property Date: UnicodeString read GetDate write SetDate;
    property Category: IXMLCategoryTypeList read GetCategory;
    property Language: IXMLLanguageType read GetLanguage;
    property Origlanguage: IXMLOriglanguageType read GetOriglanguage;
    property Length: IXMLLengthType read GetLength;
    property Icon: IXMLIconTypeList read GetIcon;
    property Url: IXMLUrlTypeList read GetUrl;
    property Country: IXMLCountryTypeList read GetCountry;
    property Episodenum: IXMLEpisodenumTypeList read GetEpisodenum;
    property Video: IXMLVideoType read GetVideo;
    property Audio: IXMLAudioType read GetAudio;
    property Previouslyshown: IXMLPreviouslyshownType read GetPreviouslyshown;
    property Premiere: IXMLPremiereType read GetPremiere;
    property Lastchance: IXMLLastchanceType read GetLastchance;
    property New: UnicodeString read GetNew write SetNew;
    property Subtitles: IXMLSubtitlesTypeList read GetSubtitles;
    property Rating: IXMLRatingTypeList read GetRating;
    property Starrating: IXMLStarratingTypeList read GetStarrating;
    property Review: IXMLReviewTypeList read GetReview;
  end;

{ IXMLProgrammeTypeList }

  IXMLProgrammeTypeList = interface(IXMLNodeCollection)
    ['{9C4BCFB4-7CD2-430E-85B3-B1F0804B52BE}']
    { Methods & Properties }
    function Add: IXMLProgrammeType;
    function Insert(const Index: Integer): IXMLProgrammeType;

    function GetItem(Index: Integer): IXMLProgrammeType;
    property Items[Index: Integer]: IXMLProgrammeType read GetItem; default;
  end;

{ IXMLTitleType }

  IXMLTitleType = interface(IXMLNode)
    ['{0238B650-3DB5-49CE-8244-CE92B107C639}']
    { Property Accessors }
    function GetLang: UnicodeString;
    procedure SetLang(Value: UnicodeString);
    { Methods & Properties }
    property Lang: UnicodeString read GetLang write SetLang;
  end;

{ IXMLTitleTypeList }

  IXMLTitleTypeList = interface(IXMLNodeCollection)
    ['{FE48DF67-3CAF-4BE6-82C2-41EB352FF2CF}']
    { Methods & Properties }
    function Add: IXMLTitleType;
    function Insert(const Index: Integer): IXMLTitleType;

    function GetItem(Index: Integer): IXMLTitleType;
    property Items[Index: Integer]: IXMLTitleType read GetItem; default;
  end;

{ IXMLSubtitleType }

  IXMLSubtitleType = interface(IXMLNode)
    ['{97CB15D8-274F-4630-A86F-303183D6EFD3}']
    { Property Accessors }
    function GetLang: UnicodeString;
    procedure SetLang(Value: UnicodeString);
    { Methods & Properties }
    property Lang: UnicodeString read GetLang write SetLang;
  end;

{ IXMLSubtitleTypeList }

  IXMLSubtitleTypeList = interface(IXMLNodeCollection)
    ['{39E69454-FB94-4651-B626-B672C8B983A5}']
    { Methods & Properties }
    function Add: IXMLSubtitleType;
    function Insert(const Index: Integer): IXMLSubtitleType;

    function GetItem(Index: Integer): IXMLSubtitleType;
    property Items[Index: Integer]: IXMLSubtitleType read GetItem; default;
  end;

{ IXMLDescType }

  IXMLDescType = interface(IXMLNode)
    ['{08598F1A-81A1-4764-9B58-B64B51F9DB44}']
    { Property Accessors }
    function GetLang: UnicodeString;
    procedure SetLang(Value: UnicodeString);
    { Methods & Properties }
    property Lang: UnicodeString read GetLang write SetLang;
  end;

{ IXMLDescTypeList }

  IXMLDescTypeList = interface(IXMLNodeCollection)
    ['{2CB7A9DB-464B-4899-A01B-977EDFD44AA8}']
    { Methods & Properties }
    function Add: IXMLDescType;
    function Insert(const Index: Integer): IXMLDescType;

    function GetItem(Index: Integer): IXMLDescType;
    property Items[Index: Integer]: IXMLDescType read GetItem; default;

    function GetItemByLangAttribute(value:string; addIfNotExist:Boolean): IXMLDescType;
  end;

{ IXMLCreditsType }

  IXMLCreditsType = interface(IXMLNode)
    ['{8A294010-CE56-46B8-8A03-E8E47E878EA8}']
    { Property Accessors }
    function GetDirector: IXMLDirectorTypeList;
    function GetActor: IXMLActorTypeList;
    function GetWriter: IXMLWriterTypeList;
    function GetAdapter: IXMLAdapterTypeList;
    function GetProducer: IXMLProducerTypeList;
    function GetComposer: IXMLComposerTypeList;
    function GetEditor: IXMLEditorTypeList;
    function GetPresenter: IXMLPresenterTypeList;
    function GetCommentator: IXMLCommentatorTypeList;
    function GetGuest: IXMLGuestTypeList;
    { Methods & Properties }
    property Director: IXMLDirectorTypeList read GetDirector;
    property Actor: IXMLActorTypeList read GetActor;
    property Writer: IXMLWriterTypeList read GetWriter;
    property Adapter: IXMLAdapterTypeList read GetAdapter;
    property Producer: IXMLProducerTypeList read GetProducer;
    property Composer: IXMLComposerTypeList read GetComposer;
    property Editor: IXMLEditorTypeList read GetEditor;
    property Presenter: IXMLPresenterTypeList read GetPresenter;
    property Commentator: IXMLCommentatorTypeList read GetCommentator;
    property Guest: IXMLGuestTypeList read GetGuest;
  end;

{ IXMLActorType }

  IXMLActorType = interface(IXMLNode)
    ['{7942D921-0CCE-4915-9BD9-BE476B708488}']
    { Property Accessors }
    function GetRole: UnicodeString;
    procedure SetRole(Value: UnicodeString);
    { Methods & Properties }
    property Role: UnicodeString read GetRole write SetRole;
  end;

{ IXMLActorTypeList }

  IXMLActorTypeList = interface(IXMLNodeCollection)
    ['{47A7F7A9-6A0C-4729-BB28-4A3582CD1EA9}']
    { Methods & Properties }
    function Add: IXMLActorType;
    function Insert(const Index: Integer): IXMLActorType;

    function GetItem(Index: Integer): IXMLActorType;
    property Items[Index: Integer]: IXMLActorType read GetItem; default;
  end;

{ IXMLCategoryType }

  IXMLCategoryType = interface(IXMLNode)
    ['{A7A426F0-683D-4199-B180-7F2AFC1B6CB4}']
    { Property Accessors }
    function GetLang: UnicodeString;
    procedure SetLang(Value: UnicodeString);
    { Methods & Properties }
    property Lang: UnicodeString read GetLang write SetLang;
  end;

{ IXMLCategoryTypeList }

  IXMLCategoryTypeList = interface(IXMLNodeCollection)
    ['{E33CBD12-65A5-46B9-939F-930A68E08104}']
    { Methods & Properties }
    function Add: IXMLCategoryType;
    function Insert(const Index: Integer): IXMLCategoryType;

    function GetItem(Index: Integer): IXMLCategoryType;
    property Items[Index: Integer]: IXMLCategoryType read GetItem; default;
  end;

{ IXMLLanguageType }

  IXMLLanguageType = interface(IXMLNode)
    ['{5228977D-0BE6-476C-8FC5-2005BF48572B}']
    { Property Accessors }
    function GetLang: UnicodeString;
    procedure SetLang(Value: UnicodeString);
    { Methods & Properties }
    property Lang: UnicodeString read GetLang write SetLang;
  end;

{ IXMLOriglanguageType }

  IXMLOriglanguageType = interface(IXMLNode)
    ['{DBE95DC8-C49B-4BAF-9EE9-D74F2F815643}']
    { Property Accessors }
    function GetLang: UnicodeString;
    procedure SetLang(Value: UnicodeString);
    { Methods & Properties }
    property Lang: UnicodeString read GetLang write SetLang;
  end;

{ IXMLLengthType }

  IXMLLengthType = interface(IXMLNode)
    ['{55E9B888-AB93-4907-9BBB-181104299B82}']
    { Property Accessors }
    function GetUnits: UnicodeString;
    procedure SetUnits(Value: UnicodeString);
    { Methods & Properties }
    property Units: UnicodeString read GetUnits write SetUnits;
  end;

{ IXMLCountryType }

  IXMLCountryType = interface(IXMLNode)
    ['{D679F5C4-579B-4DA3-8391-2EFD3E955568}']
    { Property Accessors }
    function GetLang: UnicodeString;
    procedure SetLang(Value: UnicodeString);
    { Methods & Properties }
    property Lang: UnicodeString read GetLang write SetLang;
  end;

{ IXMLCountryTypeList }

  IXMLCountryTypeList = interface(IXMLNodeCollection)
    ['{A9284407-703B-48A6-9D4B-CBEC71A9C2A4}']
    { Methods & Properties }
    function Add: IXMLCountryType;
    function Insert(const Index: Integer): IXMLCountryType;

    function GetItem(Index: Integer): IXMLCountryType;
    property Items[Index: Integer]: IXMLCountryType read GetItem; default;
  end;

{ IXMLEpisodenumType }

  IXMLEpisodenumType = interface(IXMLNode)
    ['{051CB2E2-9098-4CF7-8A63-E0E03E24217A}']
    { Property Accessors }
    function GetSystem: UnicodeString;
    procedure SetSystem(Value: UnicodeString);
    { Methods & Properties }
    property System: UnicodeString read GetSystem write SetSystem;
  end;

{ IXMLEpisodenumTypeList }

  IXMLEpisodenumTypeList = interface(IXMLNodeCollection)
    ['{701DCE98-E2FE-43CD-BF63-E6E75970B3D7}']
    { Methods & Properties }
    function Add: IXMLEpisodenumType;
    function Insert(const Index: Integer): IXMLEpisodenumType;

    function GetItem(Index: Integer): IXMLEpisodenumType;
    property Items[Index: Integer]: IXMLEpisodenumType read GetItem; default;

    function GetItemBySystemAttribute(value:string; addIfNotExist:Boolean): IXMLEpisodenumType;
  end;

{ IXMLVideoType }

  IXMLVideoType = interface(IXMLNode)
    ['{09EF3312-88D3-4364-AD14-600115CE1D7C}']
    { Property Accessors }
    function GetPresent: UnicodeString;
    function GetColour: UnicodeString;
    function GetAspect: UnicodeString;
    function GetQuality: UnicodeString;
    procedure SetPresent(Value: UnicodeString);
    procedure SetColour(Value: UnicodeString);
    procedure SetAspect(Value: UnicodeString);
    procedure SetQuality(Value: UnicodeString);
    { Methods & Properties }
    property Present: UnicodeString read GetPresent write SetPresent;
    property Colour: UnicodeString read GetColour write SetColour;
    property Aspect: UnicodeString read GetAspect write SetAspect;
    property Quality: UnicodeString read GetQuality write SetQuality;
  end;

{ IXMLAudioType }

  IXMLAudioType = interface(IXMLNode)
    ['{797EEC09-8543-452B-8286-668AF8AA451E}']
    { Property Accessors }
    function GetPresent: UnicodeString;
    function GetStereo: UnicodeString;
    procedure SetPresent(Value: UnicodeString);
    procedure SetStereo(Value: UnicodeString);
    { Methods & Properties }
    property Present: UnicodeString read GetPresent write SetPresent;
    property Stereo: UnicodeString read GetStereo write SetStereo;
  end;

{ IXMLPreviouslyshownType }

  IXMLPreviouslyshownType = interface(IXMLNode)
    ['{3DF39D28-3F79-4D96-B898-BD629C4B7F2B}']
    { Property Accessors }
    function GetStart: UnicodeString;
    function GetChannel: UnicodeString;
    procedure SetStart(Value: UnicodeString);
    procedure SetChannel(Value: UnicodeString);
    { Methods & Properties }
    property Start: UnicodeString read GetStart write SetStart;
    property Channel: UnicodeString read GetChannel write SetChannel;
  end;

{ IXMLPremiereType }

  IXMLPremiereType = interface(IXMLNode)
    ['{34834791-D393-48E3-8130-BB99FF853B1C}']
    { Property Accessors }
    function GetLang: UnicodeString;
    procedure SetLang(Value: UnicodeString);
    { Methods & Properties }
    property Lang: UnicodeString read GetLang write SetLang;
  end;

{ IXMLLastchanceType }

  IXMLLastchanceType = interface(IXMLNode)
    ['{9523F9DD-412B-4847-9487-01BD7FB3DAC3}']
    { Property Accessors }
    function GetLang: UnicodeString;
    procedure SetLang(Value: UnicodeString);
    { Methods & Properties }
    property Lang: UnicodeString read GetLang write SetLang;
  end;

{ IXMLSubtitlesType }

  IXMLSubtitlesType = interface(IXMLNode)
    ['{2C2851E3-B3FC-4E31-97C6-199EC5413E18}']
    { Property Accessors }
    function GetType_: UnicodeString;
    function GetLanguage: IXMLLanguageType;
    procedure SetType_(Value: UnicodeString);
    { Methods & Properties }
    property Type_: UnicodeString read GetType_ write SetType_;
    property Language: IXMLLanguageType read GetLanguage;
  end;

{ IXMLSubtitlesTypeList }

  IXMLSubtitlesTypeList = interface(IXMLNodeCollection)
    ['{C0E59025-7AF3-405A-991F-73BEF40E9CC9}']
    { Methods & Properties }
    function Add: IXMLSubtitlesType;
    function Insert(const Index: Integer): IXMLSubtitlesType;

    function GetItem(Index: Integer): IXMLSubtitlesType;
    property Items[Index: Integer]: IXMLSubtitlesType read GetItem; default;
  end;

{ IXMLRatingType }

  IXMLRatingType = interface(IXMLNode)
    ['{DE6E69CD-1527-44B7-A298-BD61A6CA240B}']
    { Property Accessors }
    function GetSystem: UnicodeString;
    function GetValue: UnicodeString;
    function GetIcon: IXMLIconTypeList;
    procedure SetSystem(Value: UnicodeString);
    procedure SetValue(Value: UnicodeString);
    { Methods & Properties }
    property System: UnicodeString read GetSystem write SetSystem;
    property Value: UnicodeString read GetValue write SetValue;
    property Icon: IXMLIconTypeList read GetIcon;
  end;

{ IXMLRatingTypeList }

  IXMLRatingTypeList = interface(IXMLNodeCollection)
    ['{45A63DCF-4B36-4344-A5E6-8A39992696BC}']
    { Methods & Properties }
    function Add: IXMLRatingType;
    function Insert(const Index: Integer): IXMLRatingType;

    function GetItem(Index: Integer): IXMLRatingType;
    property Items[Index: Integer]: IXMLRatingType read GetItem; default;
  end;

{ IXMLStarratingType }

  IXMLStarratingType = interface(IXMLNode)
    ['{4D704890-6E14-4F40-9BB2-4095B731CB92}']
    { Property Accessors }
    function GetSystem: UnicodeString;
    function GetValue: UnicodeString;
    function GetIcon: IXMLIconTypeList;
    procedure SetSystem(Value: UnicodeString);
    procedure SetValue(Value: UnicodeString);
    { Methods & Properties }
    property System: UnicodeString read GetSystem write SetSystem;
    property Value: UnicodeString read GetValue write SetValue;
    property Icon: IXMLIconTypeList read GetIcon;
  end;

{ IXMLStarratingTypeList }

  IXMLStarratingTypeList = interface(IXMLNodeCollection)
    ['{D949D533-26DB-4C4F-8441-6268902C8C31}']
    { Methods & Properties }
    function Add: IXMLStarratingType;
    function Insert(const Index: Integer): IXMLStarratingType;

    function GetItem(Index: Integer): IXMLStarratingType;
    property Items[Index: Integer]: IXMLStarratingType read GetItem; default;
  end;

{ IXMLReviewType }

  IXMLReviewType = interface(IXMLNode)
    ['{0BEE152A-0039-4518-8579-D8322DE4CF28}']
    { Property Accessors }
    function GetType_: UnicodeString;
    function GetSource: UnicodeString;
    function GetReviewer: UnicodeString;
    procedure SetType_(Value: UnicodeString);
    procedure SetSource(Value: UnicodeString);
    procedure SetReviewer(Value: UnicodeString);
    { Methods & Properties }
    property Type_: UnicodeString read GetType_ write SetType_;
    property Source: UnicodeString read GetSource write SetSource;
    property Reviewer: UnicodeString read GetReviewer write SetReviewer;
  end;

{ IXMLReviewTypeList }

  IXMLReviewTypeList = interface(IXMLNodeCollection)
    ['{C1F30970-1417-4C99-A788-2CACA5A69FC9}']
    { Methods & Properties }
    function Add: IXMLReviewType;
    function Insert(const Index: Integer): IXMLReviewType;

    function GetItem(Index: Integer): IXMLReviewType;
    property Items[Index: Integer]: IXMLReviewType read GetItem; default;
  end;

{ IXMLWriterTypeList }

  IXMLWriterTypeList = interface(IXMLNodeCollection)
    ['{509D23F2-D46F-452D-A2B3-3B0882F4E3EA}']
    { Methods & Properties }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function GetItem(Index: Integer): UnicodeString;
    property Items[Index: Integer]: UnicodeString read GetItem; default;
  end;

{ IXMLAdapterTypeList }

  IXMLAdapterTypeList = interface(IXMLNodeCollection)
    ['{E8A06464-8754-4C52-896F-3798B2007669}']
    { Methods & Properties }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function GetItem(Index: Integer): UnicodeString;
    property Items[Index: Integer]: UnicodeString read GetItem; default;
  end;

{ IXMLPresenterTypeList }

  IXMLPresenterTypeList = interface(IXMLNodeCollection)
    ['{6E02EC60-5C92-41D5-8AA4-4761F3CAD3E5}']
    { Methods & Properties }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function GetItem(Index: Integer): UnicodeString;
    property Items[Index: Integer]: UnicodeString read GetItem; default;
  end;

{ IXMLUrlTypeList }

  IXMLUrlTypeList = interface(IXMLNodeCollection)
    ['{AF28E997-CA9D-4043-BA6E-6034F141012A}']
    { Methods & Properties }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function GetItem(Index: Integer): UnicodeString;
    property Items[Index: Integer]: UnicodeString read GetItem; default;
  end;

{ IXMLCommentatorTypeList }

  IXMLCommentatorTypeList = interface(IXMLNodeCollection)
    ['{0400CBD7-289E-426B-803D-76D5B314DA28}']
    { Methods & Properties }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function GetItem(Index: Integer): UnicodeString;
    property Items[Index: Integer]: UnicodeString read GetItem; default;
  end;

{ IXMLDirectorTypeList }

  IXMLDirectorTypeList = interface(IXMLNodeCollection)
    ['{24FF9E90-8AB4-4BBD-85E2-F986B6E23403}']
    { Methods & Properties }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function GetItem(Index: Integer): UnicodeString;
    property Items[Index: Integer]: UnicodeString read GetItem; default;
  end;

{ IXMLProducerTypeList }

  IXMLProducerTypeList = interface(IXMLNodeCollection)
    ['{3DC0DA70-61C8-4BA8-88DD-89DF01A95C66}']
    { Methods & Properties }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function GetItem(Index: Integer): UnicodeString;
    property Items[Index: Integer]: UnicodeString read GetItem; default;
  end;

{ IXMLComposerTypeList }

  IXMLComposerTypeList = interface(IXMLNodeCollection)
    ['{6638DF67-870F-4316-AC1E-A4CC0613F009}']
    { Methods & Properties }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function GetItem(Index: Integer): UnicodeString;
    property Items[Index: Integer]: UnicodeString read GetItem; default;
  end;

{ IXMLGuestTypeList }

  IXMLGuestTypeList = interface(IXMLNodeCollection)
    ['{CF5928C9-B72B-458C-89B6-950BCC503897}']
    { Methods & Properties }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function GetItem(Index: Integer): UnicodeString;
    property Items[Index: Integer]: UnicodeString read GetItem; default;
  end;

{ IXMLEditorTypeList }

  IXMLEditorTypeList = interface(IXMLNodeCollection)
    ['{0875B106-1156-4239-84E2-145616BDCE60}']
    { Methods & Properties }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function GetItem(Index: Integer): UnicodeString;
    property Items[Index: Integer]: UnicodeString read GetItem; default;
  end;

{ Forward Decls }

  TXMLTvType = class;
  TXMLChannelType = class;
  TXMLChannelTypeList = class;
  TXMLDisplaynameType = class;
  TXMLDisplaynameTypeList = class;
  TXMLIconType = class;
  TXMLIconTypeList = class;
  TXMLProgrammeType = class;
  TXMLProgrammeTypeList = class;
  TXMLTitleType = class;
  TXMLTitleTypeList = class;
  TXMLSubtitleType = class;
  TXMLSubtitleTypeList = class;
  TXMLDescType = class;
  TXMLDescTypeList = class;
  TXMLCreditsType = class;
  TXMLActorType = class;
  TXMLActorTypeList = class;
  TXMLCategoryType = class;
  TXMLCategoryTypeList = class;
  TXMLLanguageType = class;
  TXMLOriglanguageType = class;
  TXMLLengthType = class;
  TXMLCountryType = class;
  TXMLCountryTypeList = class;
  TXMLEpisodenumType = class;
  TXMLEpisodenumTypeList = class;
  TXMLVideoType = class;
  TXMLAudioType = class;
  TXMLPreviouslyshownType = class;
  TXMLPremiereType = class;
  TXMLLastchanceType = class;
  TXMLSubtitlesType = class;
  TXMLSubtitlesTypeList = class;
  TXMLRatingType = class;
  TXMLRatingTypeList = class;
  TXMLStarratingType = class;
  TXMLStarratingTypeList = class;
  TXMLReviewType = class;
  TXMLReviewTypeList = class;
  TXMLWriterTypeList = class;
  TXMLAdapterTypeList = class;
  TXMLPresenterTypeList = class;
  TXMLUrlTypeList = class;
  TXMLCommentatorTypeList = class;
  TXMLDirectorTypeList = class;
  TXMLProducerTypeList = class;
  TXMLComposerTypeList = class;
  TXMLGuestTypeList = class;
  TXMLEditorTypeList = class;

{ TXMLTvType }

  TXMLTvType = class(TXMLNode, IXMLTvType)
  private
    FChannel: IXMLChannelTypeList;
    FProgramme: IXMLProgrammeTypeList;
  protected
    { IXMLTvType }
    function GetDate: UnicodeString;
    function GetSourceinfourl: UnicodeString;
    function GetSourceinfoname: UnicodeString;
    function GetSourcedataurl: UnicodeString;
    function GetGeneratorinfoname: UnicodeString;
    function GetGeneratorinfourl: UnicodeString;
    function GetChannel: IXMLChannelTypeList;
    function GetProgramme: IXMLProgrammeTypeList;
    procedure SetDate(Value: UnicodeString);
    procedure SetSourceinfourl(Value: UnicodeString);
    procedure SetSourceinfoname(Value: UnicodeString);
    procedure SetSourcedataurl(Value: UnicodeString);
    procedure SetGeneratorinfoname(Value: UnicodeString);
    procedure SetGeneratorinfourl(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLChannelType }

  TXMLChannelType = class(TXMLNode, IXMLChannelType)
  private
    FDisplayname: IXMLDisplaynameTypeList;
    FIcon: IXMLIconTypeList;
    FUrl: IXMLUrlTypeList;
  protected
    { IXMLChannelType }
    function GetId: UnicodeString;
    function GetDisplayname: IXMLDisplaynameTypeList;
    function GetIcon: IXMLIconTypeList;
    function GetUrl: IXMLUrlTypeList;
    procedure SetId(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLChannelTypeList }

  TXMLChannelTypeList = class(TXMLNodeCollection, IXMLChannelTypeList)
  protected
    { IXMLChannelTypeList }
    function Add: IXMLChannelType;
    function Insert(const Index: Integer): IXMLChannelType;

    function GetItem(Index: Integer): IXMLChannelType;
  end;

{ TXMLDisplaynameType }

  TXMLDisplaynameType = class(TXMLNode, IXMLDisplaynameType)
  protected
    { IXMLDisplaynameType }
    function GetLang: UnicodeString;
    procedure SetLang(Value: UnicodeString);
  end;

{ TXMLDisplaynameTypeList }

  TXMLDisplaynameTypeList = class(TXMLNodeCollection, IXMLDisplaynameTypeList)
  protected
    { IXMLDisplaynameTypeList }
    function Add: IXMLDisplaynameType;
    function Insert(const Index: Integer): IXMLDisplaynameType;

    function GetItem(Index: Integer): IXMLDisplaynameType;
  end;

{ TXMLIconType }

  TXMLIconType = class(TXMLNode, IXMLIconType)
  protected
    { IXMLIconType }
    function GetSrc: UnicodeString;
    function GetWidth: UnicodeString;
    function GetHeight: UnicodeString;
    procedure SetSrc(Value: UnicodeString);
    procedure SetWidth(Value: UnicodeString);
    procedure SetHeight(Value: UnicodeString);
  end;

{ TXMLIconTypeList }

  TXMLIconTypeList = class(TXMLNodeCollection, IXMLIconTypeList)
  protected
    { IXMLIconTypeList }
    function Add: IXMLIconType;
    function Insert(const Index: Integer): IXMLIconType;

    function GetItem(Index: Integer): IXMLIconType;
  end;

{ TXMLProgrammeType }

  TXMLProgrammeType = class(TXMLNode, IXMLProgrammeType)
  private
    FTitle: IXMLTitleTypeList;
    FSubtitle: IXMLSubtitleTypeList;
    FDesc: IXMLDescTypeList;
    FCategory: IXMLCategoryTypeList;
    FIcon: IXMLIconTypeList;
    FUrl: IXMLUrlTypeList;
    FCountry: IXMLCountryTypeList;
    FEpisodenum: IXMLEpisodenumTypeList;
    FSubtitles: IXMLSubtitlesTypeList;
    FRating: IXMLRatingTypeList;
    FStarrating: IXMLStarratingTypeList;
    FReview: IXMLReviewTypeList;
  protected
    { IXMLProgrammeType }
    function GetStart: UnicodeString;
    function GetStop: UnicodeString;
    function GetPdcstart: UnicodeString;
    function GetVpsstart: UnicodeString;
    function GetShowview: UnicodeString;
    function GetVideoplus: UnicodeString;
    function GetChannel: UnicodeString;
    function GetClumpidx: UnicodeString;
    function GetTitle: IXMLTitleTypeList;
    function GetSubtitle: IXMLSubtitleTypeList;
    function GetDesc: IXMLDescTypeList;
    function GetCredits: IXMLCreditsType;
    function GetDate: UnicodeString;
    function GetCategory: IXMLCategoryTypeList;
    function GetLanguage: IXMLLanguageType;
    function GetOriglanguage: IXMLOriglanguageType;
    function GetLength: IXMLLengthType;
    function GetIcon: IXMLIconTypeList;
    function GetUrl: IXMLUrlTypeList;
    function GetCountry: IXMLCountryTypeList;
    function GetEpisodenum: IXMLEpisodenumTypeList;
    function GetVideo: IXMLVideoType;
    function GetAudio: IXMLAudioType;
    function GetPreviouslyshown: IXMLPreviouslyshownType;
    function GetPremiere: IXMLPremiereType;
    function GetLastchance: IXMLLastchanceType;
    function GetNew: UnicodeString;
    function GetSubtitles: IXMLSubtitlesTypeList;
    function GetRating: IXMLRatingTypeList;
    function GetStarrating: IXMLStarratingTypeList;
    function GetReview: IXMLReviewTypeList;
    procedure SetStart(Value: UnicodeString);
    procedure SetStop(Value: UnicodeString);
    procedure SetPdcstart(Value: UnicodeString);
    procedure SetVpsstart(Value: UnicodeString);
    procedure SetShowview(Value: UnicodeString);
    procedure SetVideoplus(Value: UnicodeString);
    procedure SetChannel(Value: UnicodeString);
    procedure SetClumpidx(Value: UnicodeString);
    procedure SetDate(Value: UnicodeString);
    procedure SetNew(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLProgrammeTypeList }

  TXMLProgrammeTypeList = class(TXMLNodeCollection, IXMLProgrammeTypeList)
  protected
    { IXMLProgrammeTypeList }
    function Add: IXMLProgrammeType;
    function Insert(const Index: Integer): IXMLProgrammeType;

    function GetItem(Index: Integer): IXMLProgrammeType;
  end;

{ TXMLTitleType }

  TXMLTitleType = class(TXMLNode, IXMLTitleType)
  protected
    { IXMLTitleType }
    function GetLang: UnicodeString;
    procedure SetLang(Value: UnicodeString);
  end;

{ TXMLTitleTypeList }

  TXMLTitleTypeList = class(TXMLNodeCollection, IXMLTitleTypeList)
  protected
    { IXMLTitleTypeList }
    function Add: IXMLTitleType;
    function Insert(const Index: Integer): IXMLTitleType;

    function GetItem(Index: Integer): IXMLTitleType;
  end;

{ TXMLSubtitleType }

  TXMLSubtitleType = class(TXMLNode, IXMLSubtitleType)
  protected
    { IXMLSubtitleType }
    function GetLang: UnicodeString;
    procedure SetLang(Value: UnicodeString);
  end;

{ TXMLSubtitleTypeList }

  TXMLSubtitleTypeList = class(TXMLNodeCollection, IXMLSubtitleTypeList)
  protected
    { IXMLSubtitleTypeList }
    function Add: IXMLSubtitleType;
    function Insert(const Index: Integer): IXMLSubtitleType;

    function GetItem(Index: Integer): IXMLSubtitleType;
  end;

{ TXMLDescType }

  TXMLDescType = class(TXMLNode, IXMLDescType)
  protected
    { IXMLDescType }
    function GetLang: UnicodeString;
    procedure SetLang(Value: UnicodeString);
  end;

{ TXMLDescTypeList }

  TXMLDescTypeList = class(TXMLNodeCollection, IXMLDescTypeList)
  protected
    { IXMLDescTypeList }
    function Add: IXMLDescType;
    function Insert(const Index: Integer): IXMLDescType;

    function GetItem(Index: Integer): IXMLDescType;
    function GetItemByLangAttribute(value:string; addIfNotExist:Boolean): IXMLDescType;

  end;

{ TXMLCreditsType }

  TXMLCreditsType = class(TXMLNode, IXMLCreditsType)
  private
    FDirector: IXMLDirectorTypeList;
    FActor: IXMLActorTypeList;
    FWriter: IXMLWriterTypeList;
    FAdapter: IXMLAdapterTypeList;
    FProducer: IXMLProducerTypeList;
    FComposer: IXMLComposerTypeList;
    FEditor: IXMLEditorTypeList;
    FPresenter: IXMLPresenterTypeList;
    FCommentator: IXMLCommentatorTypeList;
    FGuest: IXMLGuestTypeList;
  protected
    { IXMLCreditsType }
    function GetDirector: IXMLDirectorTypeList;
    function GetActor: IXMLActorTypeList;
    function GetWriter: IXMLWriterTypeList;
    function GetAdapter: IXMLAdapterTypeList;
    function GetProducer: IXMLProducerTypeList;
    function GetComposer: IXMLComposerTypeList;
    function GetEditor: IXMLEditorTypeList;
    function GetPresenter: IXMLPresenterTypeList;
    function GetCommentator: IXMLCommentatorTypeList;
    function GetGuest: IXMLGuestTypeList;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLActorType }

  TXMLActorType = class(TXMLNode, IXMLActorType)
  protected
    { IXMLActorType }
    function GetRole: UnicodeString;
    procedure SetRole(Value: UnicodeString);
  end;

{ TXMLActorTypeList }

  TXMLActorTypeList = class(TXMLNodeCollection, IXMLActorTypeList)
  protected
    { IXMLActorTypeList }
    function Add: IXMLActorType;
    function Insert(const Index: Integer): IXMLActorType;

    function GetItem(Index: Integer): IXMLActorType;
  end;

{ TXMLCategoryType }

  TXMLCategoryType = class(TXMLNode, IXMLCategoryType)
  protected
    { IXMLCategoryType }
    function GetLang: UnicodeString;
    procedure SetLang(Value: UnicodeString);
  end;

{ TXMLCategoryTypeList }

  TXMLCategoryTypeList = class(TXMLNodeCollection, IXMLCategoryTypeList)
  protected
    { IXMLCategoryTypeList }
    function Add: IXMLCategoryType;
    function Insert(const Index: Integer): IXMLCategoryType;

    function GetItem(Index: Integer): IXMLCategoryType;
  end;

{ TXMLLanguageType }

  TXMLLanguageType = class(TXMLNode, IXMLLanguageType)
  protected
    { IXMLLanguageType }
    function GetLang: UnicodeString;
    procedure SetLang(Value: UnicodeString);
  end;

{ TXMLOriglanguageType }

  TXMLOriglanguageType = class(TXMLNode, IXMLOriglanguageType)
  protected
    { IXMLOriglanguageType }
    function GetLang: UnicodeString;
    procedure SetLang(Value: UnicodeString);
  end;

{ TXMLLengthType }

  TXMLLengthType = class(TXMLNode, IXMLLengthType)
  protected
    { IXMLLengthType }
    function GetUnits: UnicodeString;
    procedure SetUnits(Value: UnicodeString);
  end;

{ TXMLCountryType }

  TXMLCountryType = class(TXMLNode, IXMLCountryType)
  protected
    { IXMLCountryType }
    function GetLang: UnicodeString;
    procedure SetLang(Value: UnicodeString);
  end;

{ TXMLCountryTypeList }

  TXMLCountryTypeList = class(TXMLNodeCollection, IXMLCountryTypeList)
  protected
    { IXMLCountryTypeList }
    function Add: IXMLCountryType;
    function Insert(const Index: Integer): IXMLCountryType;

    function GetItem(Index: Integer): IXMLCountryType;
  end;

{ TXMLEpisodenumType }

  TXMLEpisodenumType = class(TXMLNode, IXMLEpisodenumType)
  protected
    { IXMLEpisodenumType }
    function GetSystem: UnicodeString;
    procedure SetSystem(Value: UnicodeString);
  end;

{ TXMLEpisodenumTypeList }

  TXMLEpisodenumTypeList = class(TXMLNodeCollection, IXMLEpisodenumTypeList)
  protected
    { IXMLEpisodenumTypeList }
    function Add: IXMLEpisodenumType;
    function Insert(const Index: Integer): IXMLEpisodenumType;

    function GetItem(Index: Integer): IXMLEpisodenumType;
    function GetItemBySystemAttribute(value:string; addIfNotExist:Boolean): IXMLEpisodenumType;

  end;

{ TXMLVideoType }

  TXMLVideoType = class(TXMLNode, IXMLVideoType)
  protected
    { IXMLVideoType }
    function GetPresent: UnicodeString;
    function GetColour: UnicodeString;
    function GetAspect: UnicodeString;
    function GetQuality: UnicodeString;
    procedure SetPresent(Value: UnicodeString);
    procedure SetColour(Value: UnicodeString);
    procedure SetAspect(Value: UnicodeString);
    procedure SetQuality(Value: UnicodeString);
  end;

{ TXMLAudioType }

  TXMLAudioType = class(TXMLNode, IXMLAudioType)
  protected
    { IXMLAudioType }
    function GetPresent: UnicodeString;
    function GetStereo: UnicodeString;
    procedure SetPresent(Value: UnicodeString);
    procedure SetStereo(Value: UnicodeString);
  end;

{ TXMLPreviouslyshownType }

  TXMLPreviouslyshownType = class(TXMLNode, IXMLPreviouslyshownType)
  protected
    { IXMLPreviouslyshownType }
    function GetStart: UnicodeString;
    function GetChannel: UnicodeString;
    procedure SetStart(Value: UnicodeString);
    procedure SetChannel(Value: UnicodeString);
  end;

{ TXMLPremiereType }

  TXMLPremiereType = class(TXMLNode, IXMLPremiereType)
  protected
    { IXMLPremiereType }
    function GetLang: UnicodeString;
    procedure SetLang(Value: UnicodeString);
  end;

{ TXMLLastchanceType }

  TXMLLastchanceType = class(TXMLNode, IXMLLastchanceType)
  protected
    { IXMLLastchanceType }
    function GetLang: UnicodeString;
    procedure SetLang(Value: UnicodeString);
  end;

{ TXMLSubtitlesType }

  TXMLSubtitlesType = class(TXMLNode, IXMLSubtitlesType)
  protected
    { IXMLSubtitlesType }
    function GetType_: UnicodeString;
    function GetLanguage: IXMLLanguageType;
    procedure SetType_(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLSubtitlesTypeList }

  TXMLSubtitlesTypeList = class(TXMLNodeCollection, IXMLSubtitlesTypeList)
  protected
    { IXMLSubtitlesTypeList }
    function Add: IXMLSubtitlesType;
    function Insert(const Index: Integer): IXMLSubtitlesType;

    function GetItem(Index: Integer): IXMLSubtitlesType;
  end;

{ TXMLRatingType }

  TXMLRatingType = class(TXMLNode, IXMLRatingType)
  private
    FIcon: IXMLIconTypeList;
  protected
    { IXMLRatingType }
    function GetSystem: UnicodeString;
    function GetValue: UnicodeString;
    function GetIcon: IXMLIconTypeList;
    procedure SetSystem(Value: UnicodeString);
    procedure SetValue(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLRatingTypeList }

  TXMLRatingTypeList = class(TXMLNodeCollection, IXMLRatingTypeList)
  protected
    { IXMLRatingTypeList }
    function Add: IXMLRatingType;
    function Insert(const Index: Integer): IXMLRatingType;

    function GetItem(Index: Integer): IXMLRatingType;
  end;

{ TXMLStarratingType }

  TXMLStarratingType = class(TXMLNode, IXMLStarratingType)
  private
    FIcon: IXMLIconTypeList;
  protected
    { IXMLStarratingType }
    function GetSystem: UnicodeString;
    function GetValue: UnicodeString;
    function GetIcon: IXMLIconTypeList;
    procedure SetSystem(Value: UnicodeString);
    procedure SetValue(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLStarratingTypeList }

  TXMLStarratingTypeList = class(TXMLNodeCollection, IXMLStarratingTypeList)
  protected
    { IXMLStarratingTypeList }
    function Add: IXMLStarratingType;
    function Insert(const Index: Integer): IXMLStarratingType;

    function GetItem(Index: Integer): IXMLStarratingType;
  end;

{ TXMLReviewType }

  TXMLReviewType = class(TXMLNode, IXMLReviewType)
  protected
    { IXMLReviewType }
    function GetType_: UnicodeString;
    function GetSource: UnicodeString;
    function GetReviewer: UnicodeString;
    procedure SetType_(Value: UnicodeString);
    procedure SetSource(Value: UnicodeString);
    procedure SetReviewer(Value: UnicodeString);
  end;

{ TXMLReviewTypeList }

  TXMLReviewTypeList = class(TXMLNodeCollection, IXMLReviewTypeList)
  protected
    { IXMLReviewTypeList }
    function Add: IXMLReviewType;
    function Insert(const Index: Integer): IXMLReviewType;

    function GetItem(Index: Integer): IXMLReviewType;
  end;

{ TXMLWriterTypeList }

  TXMLWriterTypeList = class(TXMLNodeCollection, IXMLWriterTypeList)
  protected
    { IXMLWriterTypeList }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function GetItem(Index: Integer): UnicodeString;
  end;

{ TXMLAdapterTypeList }

  TXMLAdapterTypeList = class(TXMLNodeCollection, IXMLAdapterTypeList)
  protected
    { IXMLAdapterTypeList }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function GetItem(Index: Integer): UnicodeString;
  end;

{ TXMLPresenterTypeList }

  TXMLPresenterTypeList = class(TXMLNodeCollection, IXMLPresenterTypeList)
  protected
    { IXMLPresenterTypeList }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function GetItem(Index: Integer): UnicodeString;
  end;

{ TXMLUrlTypeList }

  TXMLUrlTypeList = class(TXMLNodeCollection, IXMLUrlTypeList)
  protected
    { IXMLUrlTypeList }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function GetItem(Index: Integer): UnicodeString;
  end;

{ TXMLCommentatorTypeList }

  TXMLCommentatorTypeList = class(TXMLNodeCollection, IXMLCommentatorTypeList)
  protected
    { IXMLCommentatorTypeList }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function GetItem(Index: Integer): UnicodeString;
  end;

{ TXMLDirectorTypeList }

  TXMLDirectorTypeList = class(TXMLNodeCollection, IXMLDirectorTypeList)
  protected
    { IXMLDirectorTypeList }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function GetItem(Index: Integer): UnicodeString;
  end;

{ TXMLProducerTypeList }

  TXMLProducerTypeList = class(TXMLNodeCollection, IXMLProducerTypeList)
  protected
    { IXMLProducerTypeList }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function GetItem(Index: Integer): UnicodeString;
  end;

{ TXMLComposerTypeList }

  TXMLComposerTypeList = class(TXMLNodeCollection, IXMLComposerTypeList)
  protected
    { IXMLComposerTypeList }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function GetItem(Index: Integer): UnicodeString;
  end;

{ TXMLGuestTypeList }

  TXMLGuestTypeList = class(TXMLNodeCollection, IXMLGuestTypeList)
  protected
    { IXMLGuestTypeList }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function GetItem(Index: Integer): UnicodeString;
  end;

{ TXMLEditorTypeList }

  TXMLEditorTypeList = class(TXMLNodeCollection, IXMLEditorTypeList)
  protected
    { IXMLEditorTypeList }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function GetItem(Index: Integer): UnicodeString;
  end;

{ Global Functions }

function Gettv(Doc: IXMLDocument): IXMLTvType;
function Loadtv(const FileName: string): IXMLTvType;
function Newtv: IXMLTvType;

const
  TargetNamespace = '';

implementation

uses
  System.SysUtils;

{ Global Functions }

function Gettv(Doc: IXMLDocument): IXMLTvType;
begin
  Result := Doc.GetDocBinding('tv', TXMLTvType, TargetNamespace) as IXMLTvType;
end;

function Loadtv(const FileName: string): IXMLTvType;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('tv', TXMLTvType, TargetNamespace) as IXMLTvType;
end;

function Newtv: IXMLTvType;
begin
  Result := NewXMLDocument.GetDocBinding('tv', TXMLTvType, TargetNamespace) as IXMLTvType;
end;

{ TXMLTvType }

procedure TXMLTvType.AfterConstruction;
begin
  RegisterChildNode('channel', TXMLChannelType);
  RegisterChildNode('programme', TXMLProgrammeType);
  FChannel := CreateCollection(TXMLChannelTypeList, IXMLChannelType, 'channel') as IXMLChannelTypeList;
  FProgramme := CreateCollection(TXMLProgrammeTypeList, IXMLProgrammeType, 'programme') as IXMLProgrammeTypeList;
  inherited;
end;

function TXMLTvType.GetDate: UnicodeString;
begin
  Result := AttributeNodes['date'].Text;
end;

procedure TXMLTvType.SetDate(Value: UnicodeString);
begin
  SetAttribute('date', Value);
end;

function TXMLTvType.GetSourceinfourl: UnicodeString;
begin
  Result := AttributeNodes['source-info-url'].Text;
end;

procedure TXMLTvType.SetSourceinfourl(Value: UnicodeString);
begin
  SetAttribute('source-info-url', Value);
end;

function TXMLTvType.GetSourceinfoname: UnicodeString;
begin
  Result := AttributeNodes['source-info-name'].Text;
end;

procedure TXMLTvType.SetSourceinfoname(Value: UnicodeString);
begin
  SetAttribute('source-info-name', Value);
end;

function TXMLTvType.GetSourcedataurl: UnicodeString;
begin
  Result := AttributeNodes['source-data-url'].Text;
end;

procedure TXMLTvType.SetSourcedataurl(Value: UnicodeString);
begin
  SetAttribute('source-data-url', Value);
end;

function TXMLTvType.GetGeneratorinfoname: UnicodeString;
begin
  Result := AttributeNodes['generator-info-name'].Text;
end;

procedure TXMLTvType.SetGeneratorinfoname(Value: UnicodeString);
begin
  SetAttribute('generator-info-name', Value);
end;

function TXMLTvType.GetGeneratorinfourl: UnicodeString;
begin
  Result := AttributeNodes['generator-info-url'].Text;
end;

procedure TXMLTvType.SetGeneratorinfourl(Value: UnicodeString);
begin
  SetAttribute('generator-info-url', Value);
end;

function TXMLTvType.GetChannel: IXMLChannelTypeList;
begin
  Result := FChannel;
end;

function TXMLTvType.GetProgramme: IXMLProgrammeTypeList;
begin
  Result := FProgramme;
end;

{ TXMLChannelType }

procedure TXMLChannelType.AfterConstruction;
begin
  RegisterChildNode('display-name', TXMLDisplaynameType);
  RegisterChildNode('icon', TXMLIconType);
  FDisplayname := CreateCollection(TXMLDisplaynameTypeList, IXMLDisplaynameType, 'display-name') as IXMLDisplaynameTypeList;
  FIcon := CreateCollection(TXMLIconTypeList, IXMLIconType, 'icon') as IXMLIconTypeList;
  FUrl := CreateCollection(TXMLUrlTypeList, IXMLNode, 'url') as IXMLUrlTypeList;
  inherited;
end;

function TXMLChannelType.GetId: UnicodeString;
begin
  Result := AttributeNodes['id'].Text;
end;

procedure TXMLChannelType.SetId(Value: UnicodeString);
begin
  SetAttribute('id', Value);
end;

function TXMLChannelType.GetDisplayname: IXMLDisplaynameTypeList;
begin
  Result := FDisplayname;
end;

function TXMLChannelType.GetIcon: IXMLIconTypeList;
begin
  Result := FIcon;
end;

function TXMLChannelType.GetUrl: IXMLUrlTypeList;
begin
  Result := FUrl;
end;

{ TXMLChannelTypeList }

function TXMLChannelTypeList.Add: IXMLChannelType;
begin
  Result := AddItem(-1) as IXMLChannelType;
end;

function TXMLChannelTypeList.Insert(const Index: Integer): IXMLChannelType;
begin
  Result := AddItem(Index) as IXMLChannelType;
end;

function TXMLChannelTypeList.GetItem(Index: Integer): IXMLChannelType;
begin
  Result := List[Index] as IXMLChannelType;
end;

{ TXMLDisplaynameType }

function TXMLDisplaynameType.GetLang: UnicodeString;
begin
  Result := AttributeNodes['lang'].Text;
end;

procedure TXMLDisplaynameType.SetLang(Value: UnicodeString);
begin
  SetAttribute('lang', Value);
end;

{ TXMLDisplaynameTypeList }

function TXMLDisplaynameTypeList.Add: IXMLDisplaynameType;
begin
  Result := AddItem(-1) as IXMLDisplaynameType;
end;

function TXMLDisplaynameTypeList.Insert(const Index: Integer): IXMLDisplaynameType;
begin
  Result := AddItem(Index) as IXMLDisplaynameType;
end;

function TXMLDisplaynameTypeList.GetItem(Index: Integer): IXMLDisplaynameType;
begin
  Result := List[Index] as IXMLDisplaynameType;
end;

{ TXMLIconType }

function TXMLIconType.GetSrc: UnicodeString;
begin
  Result := AttributeNodes['src'].Text;
end;

procedure TXMLIconType.SetSrc(Value: UnicodeString);
begin
  SetAttribute('src', Value);
end;

function TXMLIconType.GetWidth: UnicodeString;
begin
  Result := AttributeNodes['width'].Text;
end;

procedure TXMLIconType.SetWidth(Value: UnicodeString);
begin
  SetAttribute('width', Value);
end;

function TXMLIconType.GetHeight: UnicodeString;
begin
  Result := AttributeNodes['height'].Text;
end;

procedure TXMLIconType.SetHeight(Value: UnicodeString);
begin
  SetAttribute('height', Value);
end;

{ TXMLIconTypeList }

function TXMLIconTypeList.Add: IXMLIconType;
begin
  Result := AddItem(-1) as IXMLIconType;
end;

function TXMLIconTypeList.Insert(const Index: Integer): IXMLIconType;
begin
  Result := AddItem(Index) as IXMLIconType;
end;

function TXMLIconTypeList.GetItem(Index: Integer): IXMLIconType;
begin
  Result := List[Index] as IXMLIconType;
end;

{ TXMLProgrammeType }

procedure TXMLProgrammeType.AfterConstruction;
begin
  RegisterChildNode('title', TXMLTitleType);
  RegisterChildNode('sub-title', TXMLSubtitleType);
  RegisterChildNode('desc', TXMLDescType);
  RegisterChildNode('credits', TXMLCreditsType);
  RegisterChildNode('category', TXMLCategoryType);
  RegisterChildNode('language', TXMLLanguageType);
  RegisterChildNode('orig-language', TXMLOriglanguageType);
  RegisterChildNode('length', TXMLLengthType);
  RegisterChildNode('icon', TXMLIconType);
  RegisterChildNode('country', TXMLCountryType);
  RegisterChildNode('episode-num', TXMLEpisodenumType);
  RegisterChildNode('video', TXMLVideoType);
  RegisterChildNode('audio', TXMLAudioType);
  RegisterChildNode('previously-shown', TXMLPreviouslyshownType);
  RegisterChildNode('premiere', TXMLPremiereType);
  RegisterChildNode('last-chance', TXMLLastchanceType);
  RegisterChildNode('subtitles', TXMLSubtitlesType);
  RegisterChildNode('rating', TXMLRatingType);
  RegisterChildNode('star-rating', TXMLStarratingType);
  RegisterChildNode('review', TXMLReviewType);
  FTitle := CreateCollection(TXMLTitleTypeList, IXMLTitleType, 'title') as IXMLTitleTypeList;
  FSubtitle := CreateCollection(TXMLSubtitleTypeList, IXMLSubtitleType, 'sub-title') as IXMLSubtitleTypeList;
  FDesc := CreateCollection(TXMLDescTypeList, IXMLDescType, 'desc') as IXMLDescTypeList;
  FCategory := CreateCollection(TXMLCategoryTypeList, IXMLCategoryType, 'category') as IXMLCategoryTypeList;
  FIcon := CreateCollection(TXMLIconTypeList, IXMLIconType, 'icon') as IXMLIconTypeList;
  FUrl := CreateCollection(TXMLUrlTypeList, IXMLNode, 'url') as IXMLUrlTypeList;
  FCountry := CreateCollection(TXMLCountryTypeList, IXMLCountryType, 'country') as IXMLCountryTypeList;
  FEpisodenum := CreateCollection(TXMLEpisodenumTypeList, IXMLEpisodenumType, 'episode-num') as IXMLEpisodenumTypeList;
  FSubtitles := CreateCollection(TXMLSubtitlesTypeList, IXMLSubtitlesType, 'subtitles') as IXMLSubtitlesTypeList;
  FRating := CreateCollection(TXMLRatingTypeList, IXMLRatingType, 'rating') as IXMLRatingTypeList;
  FStarrating := CreateCollection(TXMLStarratingTypeList, IXMLStarratingType, 'star-rating') as IXMLStarratingTypeList;
  FReview := CreateCollection(TXMLReviewTypeList, IXMLReviewType, 'review') as IXMLReviewTypeList;
  inherited;
end;

function TXMLProgrammeType.GetStart: UnicodeString;
begin
  Result := AttributeNodes['start'].Text;
end;

procedure TXMLProgrammeType.SetStart(Value: UnicodeString);
begin
  SetAttribute('start', Value);
end;

function TXMLProgrammeType.GetStop: UnicodeString;
begin
  Result := AttributeNodes['stop'].Text;
end;

procedure TXMLProgrammeType.SetStop(Value: UnicodeString);
begin
  SetAttribute('stop', Value);
end;

function TXMLProgrammeType.GetPdcstart: UnicodeString;
begin
  Result := AttributeNodes['pdc-start'].Text;
end;

procedure TXMLProgrammeType.SetPdcstart(Value: UnicodeString);
begin
  SetAttribute('pdc-start', Value);
end;

function TXMLProgrammeType.GetVpsstart: UnicodeString;
begin
  Result := AttributeNodes['vps-start'].Text;
end;

procedure TXMLProgrammeType.SetVpsstart(Value: UnicodeString);
begin
  SetAttribute('vps-start', Value);
end;

function TXMLProgrammeType.GetShowview: UnicodeString;
begin
  Result := AttributeNodes['showview'].Text;
end;

procedure TXMLProgrammeType.SetShowview(Value: UnicodeString);
begin
  SetAttribute('showview', Value);
end;

function TXMLProgrammeType.GetVideoplus: UnicodeString;
begin
  Result := AttributeNodes['videoplus'].Text;
end;

procedure TXMLProgrammeType.SetVideoplus(Value: UnicodeString);
begin
  SetAttribute('videoplus', Value);
end;

function TXMLProgrammeType.GetChannel: UnicodeString;
begin
  Result := AttributeNodes['channel'].Text;
end;

procedure TXMLProgrammeType.SetChannel(Value: UnicodeString);
begin
  SetAttribute('channel', Value);
end;

function TXMLProgrammeType.GetClumpidx: UnicodeString;
begin
  Result := AttributeNodes['clumpidx'].Text;
end;

procedure TXMLProgrammeType.SetClumpidx(Value: UnicodeString);
begin
  SetAttribute('clumpidx', Value);
end;

function TXMLProgrammeType.GetTitle: IXMLTitleTypeList;
begin
  Result := FTitle;
end;

function TXMLProgrammeType.GetSubtitle: IXMLSubtitleTypeList;
begin
  Result := FSubtitle;
end;

function TXMLProgrammeType.GetDesc: IXMLDescTypeList;
begin
  Result := FDesc;
end;

function TXMLProgrammeType.GetCredits: IXMLCreditsType;
begin
  Result := ChildNodes['credits'] as IXMLCreditsType;
end;

function TXMLProgrammeType.GetDate: UnicodeString;
begin
  Result := ChildNodes['date'].Text;
end;

procedure TXMLProgrammeType.SetDate(Value: UnicodeString);
begin
  ChildNodes['date'].NodeValue := Value;
end;

function TXMLProgrammeType.GetCategory: IXMLCategoryTypeList;
begin
  Result := FCategory;
end;

function TXMLProgrammeType.GetLanguage: IXMLLanguageType;
begin
  Result := ChildNodes['language'] as IXMLLanguageType;
end;

function TXMLProgrammeType.GetOriglanguage: IXMLOriglanguageType;
begin
  Result := ChildNodes['orig-language'] as IXMLOriglanguageType;
end;

function TXMLProgrammeType.GetLength: IXMLLengthType;
begin
  Result := ChildNodes['length'] as IXMLLengthType;
end;

function TXMLProgrammeType.GetIcon: IXMLIconTypeList;
begin
  Result := FIcon;
end;

function TXMLProgrammeType.GetUrl: IXMLUrlTypeList;
begin
  Result := FUrl;
end;

function TXMLProgrammeType.GetCountry: IXMLCountryTypeList;
begin
  Result := FCountry;
end;

function TXMLProgrammeType.GetEpisodenum: IXMLEpisodenumTypeList;
begin
  Result := FEpisodenum;
end;

function TXMLProgrammeType.GetVideo: IXMLVideoType;
begin
  Result := ChildNodes['video'] as IXMLVideoType;
end;

function TXMLProgrammeType.GetAudio: IXMLAudioType;
begin
  Result := ChildNodes['audio'] as IXMLAudioType;
end;

function TXMLProgrammeType.GetPreviouslyshown: IXMLPreviouslyshownType;
begin
  Result := ChildNodes['previously-shown'] as IXMLPreviouslyshownType;
end;

function TXMLProgrammeType.GetPremiere: IXMLPremiereType;
begin
  Result := ChildNodes['premiere'] as IXMLPremiereType;
end;

function TXMLProgrammeType.GetLastchance: IXMLLastchanceType;
begin
  Result := ChildNodes['last-chance'] as IXMLLastchanceType;
end;

function TXMLProgrammeType.GetNew: UnicodeString;
begin
  Result := ChildNodes['new'].Text;
end;

procedure TXMLProgrammeType.SetNew(Value: UnicodeString);
begin
  ChildNodes['new'].NodeValue := Value;
end;

function TXMLProgrammeType.GetSubtitles: IXMLSubtitlesTypeList;
begin
  Result := FSubtitles;
end;

function TXMLProgrammeType.GetRating: IXMLRatingTypeList;
begin
  Result := FRating;
end;

function TXMLProgrammeType.GetStarrating: IXMLStarratingTypeList;
begin
  Result := FStarrating;
end;

function TXMLProgrammeType.GetReview: IXMLReviewTypeList;
begin
  Result := FReview;
end;

{ TXMLProgrammeTypeList }

function TXMLProgrammeTypeList.Add: IXMLProgrammeType;
begin
  Result := AddItem(-1) as IXMLProgrammeType;
end;

function TXMLProgrammeTypeList.Insert(const Index: Integer): IXMLProgrammeType;
begin
  Result := AddItem(Index) as IXMLProgrammeType;
end;

function TXMLProgrammeTypeList.GetItem(Index: Integer): IXMLProgrammeType;
begin
  Result := List[Index] as IXMLProgrammeType;
end;

{ TXMLTitleType }

function TXMLTitleType.GetLang: UnicodeString;
begin
  Result := AttributeNodes['lang'].Text;
end;

procedure TXMLTitleType.SetLang(Value: UnicodeString);
begin
  SetAttribute('lang', Value);
end;

{ TXMLTitleTypeList }

function TXMLTitleTypeList.Add: IXMLTitleType;
begin
  Result := AddItem(-1) as IXMLTitleType;
end;

function TXMLTitleTypeList.Insert(const Index: Integer): IXMLTitleType;
begin
  Result := AddItem(Index) as IXMLTitleType;
end;

function TXMLTitleTypeList.GetItem(Index: Integer): IXMLTitleType;
begin
  Result := List[Index] as IXMLTitleType;
end;

{ TXMLSubtitleType }

function TXMLSubtitleType.GetLang: UnicodeString;
begin
  Result := AttributeNodes['lang'].Text;
end;

procedure TXMLSubtitleType.SetLang(Value: UnicodeString);
begin
  SetAttribute('lang', Value);
end;

{ TXMLSubtitleTypeList }

function TXMLSubtitleTypeList.Add: IXMLSubtitleType;
begin
  Result := AddItem(-1) as IXMLSubtitleType;
end;

function TXMLSubtitleTypeList.Insert(const Index: Integer): IXMLSubtitleType;
begin
  Result := AddItem(Index) as IXMLSubtitleType;
end;

function TXMLSubtitleTypeList.GetItem(Index: Integer): IXMLSubtitleType;
begin
  Result := List[Index] as IXMLSubtitleType;
end;

{ TXMLDescType }

function TXMLDescType.GetLang: UnicodeString;
begin
  Result := AttributeNodes['lang'].Text;
end;

procedure TXMLDescType.SetLang(Value: UnicodeString);
begin
  SetAttribute('lang', Value);
end;

{ TXMLDescTypeList }

function TXMLDescTypeList.Add: IXMLDescType;
begin
  Result := AddItem(-1) as IXMLDescType;
end;

function TXMLDescTypeList.Insert(const Index: Integer): IXMLDescType;
begin
  Result := AddItem(Index) as IXMLDescType;
end;

function TXMLDescTypeList.GetItem(Index: Integer): IXMLDescType;
begin
  Result := List[Index] as IXMLDescType;
end;

function TXMLDescTypeList.GetItemByLangAttribute(value: string; addIfNotExist: Boolean): IXMLDescType;
var
  I: Integer;
begin
  Result := nil;
  for I := 0  to Self.Count-1 do
  begin

    if (Self.GetItem(i).Lang=value) then begin
            Result := Self.GetItem(i);
            break;
    end;
  end;

  if not Assigned(Result) then
  begin
      if addIfNotExist then
      begin
           Result :=  Self.Add;
           Result.Lang := value;
      end
      else
      begin
        raise Exception.Create('Element non existant!');
      end;
  end;

end;

{ TXMLCreditsType }

procedure TXMLCreditsType.AfterConstruction;
begin
  RegisterChildNode('actor', TXMLActorType);
  FDirector := CreateCollection(TXMLDirectorTypeList, IXMLNode, 'director') as IXMLDirectorTypeList;
  FActor := CreateCollection(TXMLActorTypeList, IXMLActorType, 'actor') as IXMLActorTypeList;
  FWriter := CreateCollection(TXMLWriterTypeList, IXMLNode, 'writer') as IXMLWriterTypeList;
  FAdapter := CreateCollection(TXMLAdapterTypeList, IXMLNode, 'adapter') as IXMLAdapterTypeList;
  FProducer := CreateCollection(TXMLProducerTypeList, IXMLNode, 'producer') as IXMLProducerTypeList;
  FComposer := CreateCollection(TXMLComposerTypeList, IXMLNode, 'composer') as IXMLComposerTypeList;
  FEditor := CreateCollection(TXMLEditorTypeList, IXMLNode, 'editor') as IXMLEditorTypeList;
  FPresenter := CreateCollection(TXMLPresenterTypeList, IXMLNode, 'presenter') as IXMLPresenterTypeList;
  FCommentator := CreateCollection(TXMLCommentatorTypeList, IXMLNode, 'commentator') as IXMLCommentatorTypeList;
  FGuest := CreateCollection(TXMLGuestTypeList, IXMLNode, 'guest') as IXMLGuestTypeList;
  inherited;
end;

function TXMLCreditsType.GetDirector: IXMLDirectorTypeList;
begin
  Result := FDirector;
end;

function TXMLCreditsType.GetActor: IXMLActorTypeList;
begin
  Result := FActor;
end;

function TXMLCreditsType.GetWriter: IXMLWriterTypeList;
begin
  Result := FWriter;
end;

function TXMLCreditsType.GetAdapter: IXMLAdapterTypeList;
begin
  Result := FAdapter;
end;

function TXMLCreditsType.GetProducer: IXMLProducerTypeList;
begin
  Result := FProducer;
end;

function TXMLCreditsType.GetComposer: IXMLComposerTypeList;
begin
  Result := FComposer;
end;

function TXMLCreditsType.GetEditor: IXMLEditorTypeList;
begin
  Result := FEditor;
end;

function TXMLCreditsType.GetPresenter: IXMLPresenterTypeList;
begin
  Result := FPresenter;
end;

function TXMLCreditsType.GetCommentator: IXMLCommentatorTypeList;
begin
  Result := FCommentator;
end;

function TXMLCreditsType.GetGuest: IXMLGuestTypeList;
begin
  Result := FGuest;
end;

{ TXMLActorType }

function TXMLActorType.GetRole: UnicodeString;
begin
  Result := AttributeNodes['role'].Text;
end;

procedure TXMLActorType.SetRole(Value: UnicodeString);
begin
  SetAttribute('role', Value);
end;

{ TXMLActorTypeList }

function TXMLActorTypeList.Add: IXMLActorType;
begin
  Result := AddItem(-1) as IXMLActorType;
end;

function TXMLActorTypeList.Insert(const Index: Integer): IXMLActorType;
begin
  Result := AddItem(Index) as IXMLActorType;
end;

function TXMLActorTypeList.GetItem(Index: Integer): IXMLActorType;
begin
  Result := List[Index] as IXMLActorType;
end;

{ TXMLCategoryType }

function TXMLCategoryType.GetLang: UnicodeString;
begin
  Result := AttributeNodes['lang'].Text;
end;

procedure TXMLCategoryType.SetLang(Value: UnicodeString);
begin
  SetAttribute('lang', Value);
end;

{ TXMLCategoryTypeList }

function TXMLCategoryTypeList.Add: IXMLCategoryType;
begin
  Result := AddItem(-1) as IXMLCategoryType;
end;

function TXMLCategoryTypeList.Insert(const Index: Integer): IXMLCategoryType;
begin
  Result := AddItem(Index) as IXMLCategoryType;
end;

function TXMLCategoryTypeList.GetItem(Index: Integer): IXMLCategoryType;
begin
  Result := List[Index] as IXMLCategoryType;
end;

{ TXMLLanguageType }

function TXMLLanguageType.GetLang: UnicodeString;
begin
  Result := AttributeNodes['lang'].Text;
end;

procedure TXMLLanguageType.SetLang(Value: UnicodeString);
begin
  SetAttribute('lang', Value);
end;

{ TXMLOriglanguageType }

function TXMLOriglanguageType.GetLang: UnicodeString;
begin
  Result := AttributeNodes['lang'].Text;
end;

procedure TXMLOriglanguageType.SetLang(Value: UnicodeString);
begin
  SetAttribute('lang', Value);
end;

{ TXMLLengthType }

function TXMLLengthType.GetUnits: UnicodeString;
begin
  Result := AttributeNodes['units'].Text;
end;

procedure TXMLLengthType.SetUnits(Value: UnicodeString);
begin
  SetAttribute('units', Value);
end;

{ TXMLCountryType }

function TXMLCountryType.GetLang: UnicodeString;
begin
  Result := AttributeNodes['lang'].Text;
end;

procedure TXMLCountryType.SetLang(Value: UnicodeString);
begin
  SetAttribute('lang', Value);
end;

{ TXMLCountryTypeList }

function TXMLCountryTypeList.Add: IXMLCountryType;
begin
  Result := AddItem(-1) as IXMLCountryType;
end;

function TXMLCountryTypeList.Insert(const Index: Integer): IXMLCountryType;
begin
  Result := AddItem(Index) as IXMLCountryType;
end;

function TXMLCountryTypeList.GetItem(Index: Integer): IXMLCountryType;
begin
  Result := List[Index] as IXMLCountryType;
end;

{ TXMLEpisodenumType }

function TXMLEpisodenumType.GetSystem: UnicodeString;
begin
  Result := AttributeNodes['system'].Text;
end;

procedure TXMLEpisodenumType.SetSystem(Value: UnicodeString);
begin
  SetAttribute('system', Value);
end;

{ TXMLEpisodenumTypeList }

function TXMLEpisodenumTypeList.Add: IXMLEpisodenumType;
begin
  Result := AddItem(-1) as IXMLEpisodenumType;
end;

function TXMLEpisodenumTypeList.Insert(const Index: Integer): IXMLEpisodenumType;
begin
  Result := AddItem(Index) as IXMLEpisodenumType;
end;

function TXMLEpisodenumTypeList.GetItem(Index: Integer): IXMLEpisodenumType;
begin
  Result := List[Index] as IXMLEpisodenumType;
end;

function TXMLEpisodenumTypeList.GetItemBySystemAttribute(value: string; addIfNotExist:Boolean): IXMLEpisodenumType;
var
  I: Integer;
begin
  Result := nil;
  for I := 0  to Self.Count-1 do
  begin

    if Self.GetItem(i).System=value then begin
            Result := Self.GetItem(i);
            break;
    end;
  end;

  if not Assigned(Result) then
  begin
      if addIfNotExist then
      begin

//            Self.n
           Result :=  Self.Insert(0);
           Result.System := value;
      end
      else
      begin
        raise Exception.Create('Element non existant!');
      end;
  end;


end;

{ TXMLVideoType }

function TXMLVideoType.GetPresent: UnicodeString;
begin
  Result := ChildNodes['present'].Text;
end;

procedure TXMLVideoType.SetPresent(Value: UnicodeString);
begin
  ChildNodes['present'].NodeValue := Value;
end;

function TXMLVideoType.GetColour: UnicodeString;
begin
  Result := ChildNodes['colour'].Text;
end;

procedure TXMLVideoType.SetColour(Value: UnicodeString);
begin
  ChildNodes['colour'].NodeValue := Value;
end;

function TXMLVideoType.GetAspect: UnicodeString;
begin
  Result := ChildNodes['aspect'].Text;
end;

procedure TXMLVideoType.SetAspect(Value: UnicodeString);
begin
  ChildNodes['aspect'].NodeValue := Value;
end;

function TXMLVideoType.GetQuality: UnicodeString;
begin
  Result := ChildNodes['quality'].Text;
end;

procedure TXMLVideoType.SetQuality(Value: UnicodeString);
begin
  ChildNodes['quality'].NodeValue := Value;
end;

{ TXMLAudioType }

function TXMLAudioType.GetPresent: UnicodeString;
begin
  Result := ChildNodes['present'].Text;
end;

procedure TXMLAudioType.SetPresent(Value: UnicodeString);
begin
  ChildNodes['present'].NodeValue := Value;
end;

function TXMLAudioType.GetStereo: UnicodeString;
begin
  Result := ChildNodes['stereo'].Text;
end;

procedure TXMLAudioType.SetStereo(Value: UnicodeString);
begin
  ChildNodes['stereo'].NodeValue := Value;
end;

{ TXMLPreviouslyshownType }

function TXMLPreviouslyshownType.GetStart: UnicodeString;
begin
  Result := AttributeNodes['start'].Text;
end;

procedure TXMLPreviouslyshownType.SetStart(Value: UnicodeString);
begin
  SetAttribute('start', Value);
end;

function TXMLPreviouslyshownType.GetChannel: UnicodeString;
begin
  Result := AttributeNodes['channel'].Text;
end;

procedure TXMLPreviouslyshownType.SetChannel(Value: UnicodeString);
begin
  SetAttribute('channel', Value);
end;

{ TXMLPremiereType }

function TXMLPremiereType.GetLang: UnicodeString;
begin
  Result := AttributeNodes['lang'].Text;
end;

procedure TXMLPremiereType.SetLang(Value: UnicodeString);
begin
  SetAttribute('lang', Value);
end;

{ TXMLLastchanceType }

function TXMLLastchanceType.GetLang: UnicodeString;
begin
  Result := AttributeNodes['lang'].Text;
end;

procedure TXMLLastchanceType.SetLang(Value: UnicodeString);
begin
  SetAttribute('lang', Value);
end;

{ TXMLSubtitlesType }

procedure TXMLSubtitlesType.AfterConstruction;
begin
  RegisterChildNode('language', TXMLLanguageType);
  inherited;
end;

function TXMLSubtitlesType.GetType_: UnicodeString;
begin
  Result := AttributeNodes['type'].Text;
end;

procedure TXMLSubtitlesType.SetType_(Value: UnicodeString);
begin
  SetAttribute('type', Value);
end;

function TXMLSubtitlesType.GetLanguage: IXMLLanguageType;
begin
  Result := ChildNodes['language'] as IXMLLanguageType;
end;

{ TXMLSubtitlesTypeList }

function TXMLSubtitlesTypeList.Add: IXMLSubtitlesType;
begin
  Result := AddItem(-1) as IXMLSubtitlesType;
end;

function TXMLSubtitlesTypeList.Insert(const Index: Integer): IXMLSubtitlesType;
begin
  Result := AddItem(Index) as IXMLSubtitlesType;
end;

function TXMLSubtitlesTypeList.GetItem(Index: Integer): IXMLSubtitlesType;
begin
  Result := List[Index] as IXMLSubtitlesType;
end;

{ TXMLRatingType }

procedure TXMLRatingType.AfterConstruction;
begin
  RegisterChildNode('icon', TXMLIconType);
  FIcon := CreateCollection(TXMLIconTypeList, IXMLIconType, 'icon') as IXMLIconTypeList;
  inherited;
end;

function TXMLRatingType.GetSystem: UnicodeString;
begin
  Result := AttributeNodes['system'].Text;
end;

procedure TXMLRatingType.SetSystem(Value: UnicodeString);
begin
  SetAttribute('system', Value);
end;

function TXMLRatingType.GetValue: UnicodeString;
begin
  Result := ChildNodes['value'].Text;
end;

procedure TXMLRatingType.SetValue(Value: UnicodeString);
begin
  ChildNodes['value'].NodeValue := Value;
end;

function TXMLRatingType.GetIcon: IXMLIconTypeList;
begin
  Result := FIcon;
end;

{ TXMLRatingTypeList }

function TXMLRatingTypeList.Add: IXMLRatingType;
begin
  Result := AddItem(-1) as IXMLRatingType;
end;

function TXMLRatingTypeList.Insert(const Index: Integer): IXMLRatingType;
begin
  Result := AddItem(Index) as IXMLRatingType;
end;

function TXMLRatingTypeList.GetItem(Index: Integer): IXMLRatingType;
begin
  Result := List[Index] as IXMLRatingType;
end;

{ TXMLStarratingType }

procedure TXMLStarratingType.AfterConstruction;
begin
  RegisterChildNode('icon', TXMLIconType);
  FIcon := CreateCollection(TXMLIconTypeList, IXMLIconType, 'icon') as IXMLIconTypeList;
  inherited;
end;

function TXMLStarratingType.GetSystem: UnicodeString;
begin
  Result := AttributeNodes['system'].Text;
end;

procedure TXMLStarratingType.SetSystem(Value: UnicodeString);
begin
  SetAttribute('system', Value);
end;

function TXMLStarratingType.GetValue: UnicodeString;
begin
  Result := ChildNodes['value'].Text;
end;

procedure TXMLStarratingType.SetValue(Value: UnicodeString);
begin
  ChildNodes['value'].NodeValue := Value;
end;

function TXMLStarratingType.GetIcon: IXMLIconTypeList;
begin
  Result := FIcon;
end;

{ TXMLStarratingTypeList }

function TXMLStarratingTypeList.Add: IXMLStarratingType;
begin
  Result := AddItem(-1) as IXMLStarratingType;
end;

function TXMLStarratingTypeList.Insert(const Index: Integer): IXMLStarratingType;
begin
  Result := AddItem(Index) as IXMLStarratingType;
end;

function TXMLStarratingTypeList.GetItem(Index: Integer): IXMLStarratingType;
begin
  Result := List[Index] as IXMLStarratingType;
end;

{ TXMLReviewType }

function TXMLReviewType.GetType_: UnicodeString;
begin
  Result := AttributeNodes['type'].Text;
end;

procedure TXMLReviewType.SetType_(Value: UnicodeString);
begin
  SetAttribute('type', Value);
end;

function TXMLReviewType.GetSource: UnicodeString;
begin
  Result := AttributeNodes['source'].Text;
end;

procedure TXMLReviewType.SetSource(Value: UnicodeString);
begin
  SetAttribute('source', Value);
end;

function TXMLReviewType.GetReviewer: UnicodeString;
begin
  Result := AttributeNodes['reviewer'].Text;
end;

procedure TXMLReviewType.SetReviewer(Value: UnicodeString);
begin
  SetAttribute('reviewer', Value);
end;

{ TXMLReviewTypeList }

function TXMLReviewTypeList.Add: IXMLReviewType;
begin
  Result := AddItem(-1) as IXMLReviewType;
end;

function TXMLReviewTypeList.Insert(const Index: Integer): IXMLReviewType;
begin
  Result := AddItem(Index) as IXMLReviewType;
end;

function TXMLReviewTypeList.GetItem(Index: Integer): IXMLReviewType;
begin
  Result := List[Index] as IXMLReviewType;
end;

{ TXMLWriterTypeList }

function TXMLWriterTypeList.Add(const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLWriterTypeList.Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;

function TXMLWriterTypeList.GetItem(Index: Integer): UnicodeString;
begin
  Result := List[Index].NodeValue;
end;

{ TXMLAdapterTypeList }

function TXMLAdapterTypeList.Add(const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLAdapterTypeList.Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;

function TXMLAdapterTypeList.GetItem(Index: Integer): UnicodeString;
begin
  Result := List[Index].NodeValue;
end;

{ TXMLPresenterTypeList }

function TXMLPresenterTypeList.Add(const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLPresenterTypeList.Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;

function TXMLPresenterTypeList.GetItem(Index: Integer): UnicodeString;
begin
  Result := List[Index].NodeValue;
end;

{ TXMLUrlTypeList }

function TXMLUrlTypeList.Add(const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLUrlTypeList.Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;

function TXMLUrlTypeList.GetItem(Index: Integer): UnicodeString;
begin
  Result := List[Index].NodeValue;
end;

{ TXMLCommentatorTypeList }

function TXMLCommentatorTypeList.Add(const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLCommentatorTypeList.Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;

function TXMLCommentatorTypeList.GetItem(Index: Integer): UnicodeString;
begin
  Result := List[Index].NodeValue;
end;

{ TXMLDirectorTypeList }

function TXMLDirectorTypeList.Add(const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLDirectorTypeList.Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;

function TXMLDirectorTypeList.GetItem(Index: Integer): UnicodeString;
begin
  Result := List[Index].NodeValue;
end;

{ TXMLProducerTypeList }

function TXMLProducerTypeList.Add(const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLProducerTypeList.Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;

function TXMLProducerTypeList.GetItem(Index: Integer): UnicodeString;
begin
  Result := List[Index].NodeValue;
end;

{ TXMLComposerTypeList }

function TXMLComposerTypeList.Add(const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLComposerTypeList.Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;

function TXMLComposerTypeList.GetItem(Index: Integer): UnicodeString;
begin
  Result := List[Index].NodeValue;
end;

{ TXMLGuestTypeList }

function TXMLGuestTypeList.Add(const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLGuestTypeList.Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;

function TXMLGuestTypeList.GetItem(Index: Integer): UnicodeString;
begin
  Result := List[Index].NodeValue;
end;

{ TXMLEditorTypeList }

function TXMLEditorTypeList.Add(const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLEditorTypeList.Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;

function TXMLEditorTypeList.GetItem(Index: Integer): UnicodeString;
begin
  Result := List[Index].NodeValue;
end;

initialization

Xml.Win.msxmldom.MSXMLDOMDocumentFactory.AddDOMProperty('ProhibitDTD', False);

end.