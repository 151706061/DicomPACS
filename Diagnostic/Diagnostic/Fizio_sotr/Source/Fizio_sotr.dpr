program Fizio_sotr;

uses
  SMMainAPI in '..\..\..\uCommon_Tima\SMMainAPI.pas',
  Forms,
  OracleMonitor,
  fMain in 'fMain.pas' {frmMain},
  fSetParam in 'fSetParam.pas' {frmSetParam},
  fSetUsl in 'fSetUsl.pas' {frmSetUsl},
  fSetSotr in 'fSetSotr.pas';

{$R *.res}

begin
  if Application.Terminated then
    Exit;
  if not GetCheckConnect() then
    Exit;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Статистика по сотруднику';
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.DoShowForm;
  Application.Run;
end.
