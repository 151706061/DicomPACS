//Ханты ОКБ ГромутИП 104365
program Fluoro_uch;

uses
  SMMainAPI in '..\..\..\uCommon_Tima\SMMainAPI.pas',
  OracleMonitor,
  Forms,
  fMain in 'fMain.pas' {frmMain},
  fSetParam in 'fSetParam.pas' {frmSetParam},
  fSetPeriod in 'fSetPeriod.pas' {frmSetPeriod},
  uPeriod in '..\..\..\uCommon_Kolya\uPeriod.pas' {frmParamDate};

{$R *.res}

begin
  if Application.Terminated then
    Exit;
  if not GetCheckConnect() then
    Exit;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Флюорография - план по участкам';
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.DoShowForm;
  Application.Run;
end.
