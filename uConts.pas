unit uConts;

interface

const
  XMLTVS_DIR: string = 'C:\Tmp'; // 'C:\Apps\mc2xml';

  TVDB_API_KEY: string = '05EB6802977A1FFE';
  IMDB_IDENTIFIER: string = 'imdbid'; // identifier used by TheTVDB.com
  ZAP2IT_IDENTIFIER: string = 'zap2it'; // identifier used by TheTVDB.com

type
  TDateTimeHelper = record helper for TDateTime
  public
    function IsNull: Boolean;
    procedure SetToNull;
  end;

implementation

uses
  System.DateUtils;

{ TDateTimeHelper }

function TDateTimeHelper.IsNull: Boolean;
begin
  Result := (Self = EncodeDateTime(1899, 12, 30, 0, 0, 0, 0));
end;

procedure TDateTimeHelper.SetToNull;
begin
  Self := 0;
end;

end.
