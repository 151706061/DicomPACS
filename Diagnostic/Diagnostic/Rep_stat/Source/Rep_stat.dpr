program Rep_stat;
// ханты 52869; Суюндиков ЭР - 157524, 208504
// кардио Берестовская НИ 134540
uses
  SMMainAPI in '..\..\..\uCommon_Tima\SMMainAPI.pas',
  Forms,
  OracleMonitor,
  fMain in 'fMain.pas' {frmMain},
  uPeriodParam in '..\..\..\uCommon_Kolya\uPeriodParam.pas' {frmPeriod};

{$R *.res}

begin
  if Application.Terminated then
    Exit;
  if not GetCheckConnect() then
    Exit;
  Application.Initialize;
  Application.Title := 'Отчёты';
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.DoShowForm;
  Application.Run;
end.
