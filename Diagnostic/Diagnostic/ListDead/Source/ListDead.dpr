program ListDead;

uses
  SMMainAPI in '..\..\..\uCommon_Tima\SMMainAPI.pas',
  Forms,
  OracleMonitor,
  fMain in 'fMain.pas' {frmMain},
  fWait in '..\..\..\uCommon_Kolya\fWait.pas' {FrmWait},
  uPeriod in '..\..\..\uCommon_Kolya\uPeriod.pas' {frmParamDate},
  fProcess in 'fProcess.pas' {frmProcess};

{$R *.res}

begin
  if Application.Terminated then
    Exit;
  if not GetCheckConnect() then
    Exit;
  Application.Initialize;
  Application.Title := 'Список умерших';
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.DoShowFormDead;
  Application.Run;
end.
