program OborotkaSMS;

{$R 'Shablon.res' 'Shablon.rc'}

uses
  Forms,
  OracleMonitor,
  fgetperiod in 'fgetperiod.pas' {frmGetPeriod},
  fFIOTreb in 'fFIOTreb.pas' {frmFIOTreb},
  fDateInput in 'fDateInput.pas' {frmDateInput},
  fCheckedListEdit in '..\CommonUnits\fCheckedListEdit.pas' {fmCheckedListEdit},
  fdmPrintSelect in '..\..\src\fdmPrintSelect.pas' {dmPrintSelect: TDataModule},
  uGlobalConst in '..\..\..\..\..\uCommon\uGlobalConst.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Оборотная ведомость старшей медсестры';
  Application.CreateForm(TfrmGetPeriod, frmGetPeriod);
  Application.CreateForm(TfmCheckedListEdit, fmCheckedListEdit);
  Application.CreateForm(TdmPrintSelect, dmPrintSelect);
  Application.Run;
end.
