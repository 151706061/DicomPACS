program Form30_022013;

uses
  OracleMonitor,
  SmMainApi,
  uGlobal,
  Forms,
  fMain in 'fMain.pas' {frmMain},
  fChooseNaz in 'fChooseNaz.pas' {frmChooseNaz},
  fMetodics in 'fMetodics.pas' {frmMetodics};

{$R *.res}

begin
  if not GetCheckConnect() then
    Exit;

  if not DO_CHECK_ACCESS then
    Exit;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Форма 30 - Настройка';
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.DoShowForm;
  Application.Run;
end.
