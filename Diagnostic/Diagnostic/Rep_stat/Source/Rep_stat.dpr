program Rep_stat;
// ����� 52869; ��������� �� - 157524, 208504
// ������ ������������ �� 134540
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
  Application.Title := '������';
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.DoShowForm;
  Application.Run;
end.
