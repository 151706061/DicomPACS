program NewMetodics;

uses
  SMMainAPI in '..\..\..\uCommon_Tima\SMMainAPI.pas',
  Forms,
  OracleMonitor,
  fMain in 'fMain.pas' {frmMain},
  fAddEditMetodic in 'fAddEditMetodic.pas' {frmAddEditMetodic},
  fInsReport in 'fInsReport.pas' {frmInsReport},
  fAddEditRep in 'fAddEditRep.pas' {frmAddEditRep};

{$R *.res}

begin
  if Application.Terminated then
    Exit;
  if not GetCheckConnect() then
    Exit;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Новые методики';
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.DoShowfrmMain;
  Application.Run;
end.

