program Forms_config;

uses
  OracleMonitor,
  Forms,
  fMain in 'fMain.pas' {frmMain},
  SMMainAPI in '..\..\..\uCommon_Tima\SMMainAPI.pas',
  fAddEditForm in 'fAddEditForm.pas' {frmAddEditF},
  fAddEditC in 'fAddEditC.pas' {frmAddEditC};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Настройка форм';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmAddEditC, frmAddEditC);
  Application.Run;
end.
