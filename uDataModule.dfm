object DataModuleMain: TDataModuleMain
  OldCreateOrder = False
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
  object RESTClient1: TRESTClient
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
    Client = RESTClient1
    Params = <
      item
        Kind = pkURLSEGMENT
        name = 'scheduleType'
        Options = [poAutoCreated]
        Value = '82'
      end>
    Resource = 'Scheduler/NextUpcomingProgram/{scheduleType}'
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 360
    Top = 240
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    Left = 544
    Top = 232
  end
  object RESTRequestUpcomingPrograms: TRESTRequest
    Client = RESTClient1
    Params = <
      item
        Kind = pkURLSEGMENT
        name = 'scheduleType'
        Options = [poAutoCreated]
        Value = '82'
      end>
    Resource = 'Scheduler/UpcomingPrograms/{scheduleType}'
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 368
    Top = 336
  end
end
