program RepYearForAnalizeABC;



uses
  Forms,
  SysUtils,
  Dialogs,
  OracleMonitor,
  fgetperiod in 'fgetperiod.pas' {frmGetPeriod},
  fFIOTreb in 'fFIOTreb.pas' {frmFIOTreb},
  fDateInput in 'fDateInput.pas' {frmDateInput},
  fCheckedListEdit in '..\CommonUnits\fCheckedListEdit.pas' {fmCheckedListEdit},
  fdmPrintSelect in '..\..\src\fdmPrintSelect.pas' {dmPrintSelect: TDataModule};

{$R *.RES}

//var i:Integer;

begin

 // for i := 0 to ParamCount do ShowMessage('Параметр '+IntToStr(i)+' = '+ParamStr(i));

  Application.Initialize;
  Application.Title := 'Годовой отчет для анализа ABC';
  Application.CreateForm(TfrmGetPeriod, frmGetPeriod);
  Application.CreateForm(TfmCheckedListEdit, fmCheckedListEdit);
  Application.CreateForm(TdmPrintSelect, dmPrintSelect);
  Application.Run;
end.
