program Sotr_talons;

uses
  SMMainAPI in '..\..\..\uCommon_Tima\SMMainAPI.pas',
  Forms,
  OracleMonitor,
  fMain in 'fMain.pas' {frmMain},
  fSetParam in 'fSetParam.pas' {frmSetParam},
  fSetSotr in 'fSetSotr.pas' {frmSetSotr},
  fSetOtdel in 'fSetOtdel.pas' {frmSetOtdel};

{$R *.res}

begin
  if Application.Terminated then
    Exit;
  if not GetCheckConnect() then
    Exit;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Статистика по талонам';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmSetOtdel, frmSetOtdel);
  frmMain.DoShowForm;
  Application.Run;
end.
