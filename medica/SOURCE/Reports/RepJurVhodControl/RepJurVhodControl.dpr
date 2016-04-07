program RepJurVhodControl;



uses
  Forms,
  OracleMonitor,
  fgetperiod in 'fgetperiod.pas' {frmGetPeriod},
  fdmPrintSelect in '..\..\src\fdmPrintSelect.pas' {dmPrintSelect: TDataModule},
  uGlobalConst in '..\..\..\..\..\uCommon\uGlobalConst.pas',
  fCheckedListEdit in '..\CommonUnits\fCheckedListEdit.pas' {fmCheckedListEdit},
  SMMainAPI in '..\..\..\..\uCommon_Tima\SMMainAPI.pas',
  uCrc in '..\..\..\..\uCommon_Tima\uCrc.pas',
  uEncDec in '..\..\..\..\uCommon_Tima\uEncDec.pas',
  uMD5 in '..\..\..\..\uCommon_Tima\uMD5.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Журнал входного контроля';
  Application.CreateForm(TfrmGetPeriod, frmGetPeriod);
  Application.CreateForm(TdmPrintSelect, dmPrintSelect);
  Application.CreateForm(TfmCheckedListEdit, fmCheckedListEdit);
  Application.Run;
end.
