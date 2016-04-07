program VedomItog;

uses
  Forms,
  OracleMonitor,
  fgetperiod in 'fgetperiod.pas' {frmGetPeriod},
  fFIOTreb in 'fFIOTreb.pas' {frmFIOTreb},
  SMMainAPI in '..\..\..\..\uCommon_TIMA\SMMainAPI.pas',
  fCheckedListEdit in '..\CommonUnits\fCheckedListEdit.pas' {fmCheckedListEdit},
  fdmPrintSelect in '..\..\src\fdmPrintSelect.pas' {dmPrintSelect: TDataModule},
  uGlobalConst in '..\..\..\..\..\uCommon\uGlobalConst.pas',
  uGlobal in '..\..\..\..\uCommon_Tima\uGlobal.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Итоговая оборотная ведомость';
  Application.HelpFile := 'StMedsestra.chm';
  Application.CreateForm(TfrmGetPeriod, frmGetPeriod);
  Application.CreateForm(TdmPrintSelect, dmPrintSelect);
  Application.Run;
end.
