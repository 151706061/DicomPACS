program Run;

uses
  Forms,
  fRun in 'fRun.pas' {frmRun},
  fSearchPeople in 'fSearchPeople.pas' {frmSearchPeople},
  SMMainAPI in '..\..\..\uCommon_Tima\SMMainAPI.pas';

{$R *.res}

begin
  if Application.Terminated then
    Exit;
  if not GetCheckConnect() then
    Exit;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmRun, frmRun);
  Application.CreateForm(TfrmSearchPeople, frmSearchPeople);
  Application.Run;
end.
