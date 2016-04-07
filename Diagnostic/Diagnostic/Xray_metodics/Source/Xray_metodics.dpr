program Xray_metodics;

uses
  SMMainAPI in '..\..\..\uCommon_Tima\SMMainAPI.pas',
  Forms,
  OracleMonitor,
  fMain in 'fMain.pas' {frmMain},
  fSetParam in 'fSetParam.pas' {frmSetParam},
  fNazRgOne1 in 'fNazRgOne1.pas' {frmNazRg1},
  uPeriod in '..\..\..\uCommon_Kolya\uPeriod.pas' {frmParamDate},
  fOtmena in '..\..\..\uCommon_Kolya\fOtmena.pas' {frmOtmena},
  fLaborant in 'fLaborant.pas' {frmLaborant};

{$R *.res}

begin
  if Application.Terminated then
    Exit;
  if not GetCheckConnect() then
    Exit;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Журнал методик';
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.DoShowForm;
  Application.Run;
end.
