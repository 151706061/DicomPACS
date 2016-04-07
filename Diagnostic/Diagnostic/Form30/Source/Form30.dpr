program Form30;
// окб (новая авторизация) Громут ИП - 93445
uses
  SMMainAPI in '..\..\..\uCommon_Tima\SMMainAPI.pas',
  Forms,
  OracleMonitor,
  fMain in 'fMain.pas' {frmMain},
  fMetodics in 'fMetodics.pas' {frmMetodics},
  fDetails in 'fDetails.pas' {frmDetails},
  fChooseNaz in 'fChooseNaz.pas' {frmChooseNaz};

{$R *.res}

begin
  if Application.Terminated then
    Exit;
  if not GetCheckConnect() then
    Exit;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Форма 30 - Настройка формы';
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.DoShowForm;
  Application.Run;
end.
