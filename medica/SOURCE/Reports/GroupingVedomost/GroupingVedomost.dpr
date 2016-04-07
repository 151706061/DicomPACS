program GroupingVedomost;

uses
  Forms,
  fgetperiod in 'fgetperiod.pas' {frmGetPeriod},
  fFIOTreb in 'fFIOTreb.pas' {frmFIOTreb},
  HtmlHlp in 'HtmlHlp.pas',
  SMMainAPI in '..\..\..\..\uCommon_Tima\SMMainAPI.pas',
  uCrc in '..\..\..\..\uCommon_Tima\uCrc.pas',
  uEncDec in '..\..\..\..\uCommon_Tima\uEncDec.pas',
  uMD5 in '..\..\..\..\uCommon_Tima\uMD5.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Группировочная ведомость по медикаментам';
  Application.HelpFile := 'StMedsestra.chm';
  Application.CreateForm(TfrmGetPeriod, frmGetPeriod);
  Application.Run;
end.
