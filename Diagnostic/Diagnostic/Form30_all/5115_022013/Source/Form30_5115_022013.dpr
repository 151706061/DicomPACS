program Form30_5115_022013;

uses
  OracleMonitor,
  Forms,
  SmMainApi,
  uGlobal,
  fMain in 'fMain.pas' {frmMain},
  fMetodics in 'fMetodics.pas' {frmMetodics},
  fChooseNaz in 'fChooseNaz.pas' {frmChooseNaz};

{$R *.res}

begin
  if not GetCheckConnect() then
    Exit;

  if not DO_CHECK_ACCESS then
    Exit;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Форма 30. Таблица 5115';
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.DoShowForm;
  Application.Run;
end.
