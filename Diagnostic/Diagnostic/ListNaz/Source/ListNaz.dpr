program ListNaz;

uses
  SMMainAPI in '..\..\..\uCommon_Tima\SMMainAPI.pas',
  Forms,
  OracleMonitor,
  fListNaz in 'fListNaz.pas' {frmMain};

{$R *.res}

begin
  if Application.Terminated then
    Exit;
  if not GetCheckConnect() then
    Exit;
  Application.Initialize;
  Application.Title := '������ ������������';
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.DoShowForm;
  Application.Run;
end.
