program xmltvdbProg;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},

  xmltvBind in 'xmltvBind.pas' ,
  uEpisode in 'uEpisode.pas',
  uMatch in 'uMatch.pas',
  uMatchAccuracy in 'uMatchAccuracy.pas',
  uSeriesTracker in 'uSeriesTracker.pas',
  uTVDB in 'uTVDB.pas',
  uTVDBEpisode in 'uTVDBEpisode.pas',
  uTVDBMatcher in 'uTVDBMatcher.pas',
  uTVDBSeries in 'uTVDBSeries.pas',
  LevenshteinDistance in 'LevenshteinDistance.pas',
  uConts in 'uConts.pas',
  uTVDBBind in 'uTVDBBind.pas',
  uDataModule in 'uDataModule.pas' {DataModuleMain: TDataModule};

{$R *.res}
begin

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModuleMain, DataModuleMain);
  Application.Run;

end.
