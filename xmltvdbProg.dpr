program xmltvdbProg;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Vcl.Forms,
  Unit1 in 'Unit1.pas' ,
  xmltvdb.Tvdb.Bind in 'xmltvdb.Tvdb.Bind.pas' {$R *.res},
  xmltvdb.Episode in 'xmltvdb.Episode.pas',
  xmltvdb.Match in 'xmltvdb.Match.pas',
  xmltvdb.MatchAccuracy in 'xmltvdb.MatchAccuracy.pas',
  xmltvdb.SeriesTracker in 'xmltvdb.SeriesTracker.pas',
  xmltvdb.tvdb in 'xmltvdb.tvdb.pas',
  xmltvdb.TVDBEpisode in 'xmltvdb.TVDBEpisode.pas',
  xmltvdb.TVDBMatcher in 'xmltvdb.TVDBMatcher.pas',
  xmltvdb.TVDBSeries in 'xmltvdb.TVDBSeries.pas',
  uConts in 'uConts.pas',
  uTVDBBind in 'uTVDBBind.pas',
  uDataModule in 'uDataModule.pas' {DataModuleMain: TDataModule},
  xmltvdb.DateUtils in 'xmltvdb.DateUtils.pas',
  xmltv.Gracenote in 'xmltv.Gracenote.pas';

{$R *.res}
begin

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModuleMain, DataModuleMain);
  Application.CreateForm(TForm1, Form1);
  Application.Run;

end.
