program Xray_ds;

uses
  Forms,
  fMain in 'fMain.pas' {frmMain},
  SMMainAPI in '..\..\..\uCommon_Tima\SMMainAPI.pas',
  fSetParam in 'fSetParam.pas' {frmSetParam},
  fSetDs in 'fSetDs.pas' {frmSetDs};

{$R *.res}

begin
  if Application.Terminated then
    Exit;
  if not GetCheckConnect() then
    Exit;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Статистика по диагнозам';
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.DoShowForm;
  Application.Run;
end.
