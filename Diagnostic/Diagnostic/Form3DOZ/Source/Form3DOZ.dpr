program Form3DOZ;

uses
  OracleMonitor,
  SMMainAPI in '..\..\..\uCommon_Tima\SMMainAPI.pas',
  Forms,
  fMain in 'fMain.pas' {frmMain},
  fMetodics in 'fMetodics.pas' {frmMetodics},
  fChooseNaz in 'fChooseNaz.pas' {frmChooseNaz};

{$R *.res}

begin
  if Application.Terminated then
    Exit;
  if not GetCheckConnect() then
    Exit;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := '3ДОЗ - Настройка формы';
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.DoShowForm;
  Application.Run;
end.
