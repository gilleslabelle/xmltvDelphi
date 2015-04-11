object DataModuleMain: TDataModuleMain
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 444
  Width = 872
  object XMLDocument1: TXMLDocument
    Left = 112
    Top = 56
    DOMVendorDesc = 'Omni XML'
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 108
    Top = 237
  end
  object RESTClientArgusTV: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    AcceptEncoding = 'identity'
    BaseURL = 'http://192.168.111.20:49943/ArgusTV'
    Params = <>
    HandleRedirects = True
    Left = 200
    Top = 240
  end
  object RESTRequestNextUpcomingProgram: TRESTRequest
    Client = RESTClientArgusTV
    Params = <
      item
        Kind = pkURLSEGMENT
        name = 'scheduleType'
        Options = [poAutoCreated]
        Value = '82'
      end>
    Resource = 'Scheduler/NextUpcomingProgram/{scheduleType}'
    Response = RESTResponseArgusTV
    SynchronizedEvents = False
    Left = 360
    Top = 240
  end
  object RESTResponseArgusTV: TRESTResponse
    ContentType = 'application/json'
    Left = 544
    Top = 248
  end
  object RESTRequestUpcomingPrograms: TRESTRequest
    Client = RESTClientArgusTV
    Params = <
      item
        Kind = pkURLSEGMENT
        name = 'scheduleType'
        Options = [poAutoCreated]
        Value = '82'
      end>
    Resource = 'Scheduler/UpcomingPrograms/{scheduleType}'
    Response = RESTResponseArgusTV
    SynchronizedEvents = False
    Left = 368
    Top = 336
  end
  object RESTClientGracenote: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    AcceptEncoding = 'identity'
    BaseURL = 'http://data.tmsapi.com'
    Params = <>
    HandleRedirects = True
    Left = 312
    Top = 88
  end
  object RESTRequestGracenoteNewShowAirings: TRESTRequest
    Client = RESTClientGracenote
    Params = <
      item
        Kind = pkURLSEGMENT
        name = 'LINEUPID'
        Options = [poAutoCreated]
        Value = 'CAN-OTAH1B4J8'
      end
      item
        Kind = pkURLSEGMENT
        name = 'startDateTime'
        Options = [poAutoCreated]
        Value = '2015-02-16T22:30Z'
      end
      item
        Kind = pkURLSEGMENT
        name = 'api_key'
        Options = [poAutoCreated]
        Value = 'a7yzmr6wq32rswvje5xsa5dd'
      end>
    Resource = 
      'v1.1/programs/newShowAirings?lineupId={LINEUPID}&startDateTime={' +
      'startDateTime}&api_key={api_key}'
    Response = RESTResponseGracenote
    SynchronizedEvents = False
    Left = 464
    Top = 88
  end
  object RESTResponseGracenote: TRESTResponse
    ContentType = 'application/json'
    Left = 640
    Top = 88
  end
  object RESTRequestGracenoteNewShowAiringsFullDay: TRESTRequest
    Client = RESTClientGracenote
    Params = <
      item
        Kind = pkURLSEGMENT
        name = 'LINEUPID'
        Options = [poAutoCreated]
        Value = 'CAN-OTAH1B4J8'
      end
      item
        Kind = pkURLSEGMENT
        name = 'startDateTime'
        Options = [poAutoCreated]
        Value = '2015-02-16T22:30Z'
      end
      item
        Kind = pkURLSEGMENT
        name = 'api_key'
        Options = [poAutoCreated]
        Value = 'a7yzmr6wq32rswvje5xsa5dd'
      end
      item
        Kind = pkURLSEGMENT
        name = 'endDateTime'
        Options = [poAutoCreated]
        Value = '0'
      end>
    Resource = 
      'v1.1/programs/newShowAirings?lineupId={LINEUPID}&startDateTime={' +
      'startDateTime}&endDateTime={endDateTime}&api_key={api_key}'
    Response = RESTResponseGracenote
    SynchronizedEvents = False
    Left = 464
    Top = 160
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    AcceptEncoding = 'identity'
    BaseURL = 'https://json.schedulesdirect.org/20140530'
    ContentType = 'application/x-www-form-urlencoded'
    Params = <>
    HandleRedirects = True
    Left = 520
    Top = 368
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Method = rmPOST
    Params = <
      item
        Kind = pkHTTPHEADER
        name = 'username'
        Value = 'gilleslabelle'
      end
      item
        Kind = pkHTTPHEADER
        name = 'password'
        Value = '873443c05f52eba083ad29a5706f26f466ab83e9'
      end>
    Resource = 'token'
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 600
    Top = 368
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    Left = 688
    Top = 364
  end
end
