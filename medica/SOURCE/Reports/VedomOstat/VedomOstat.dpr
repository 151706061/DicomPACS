program VedomOstat;

{$R 'VedomOstatExlShablon.res' 'VedomOstatExlShablon.rc'}

uses
  Forms,
  fgetperiod in 'fgetperiod.pas' {frmGetPeriod},
  fFio in 'fFio.pas' {frmFIO},
  HtmlHlp in 'HtmlHlp.pas',
  fCheckedListEdit in '..\CommonUnits\fCheckedListEdit.pas' {fmCheckedListEdit},
  uReportParams in '..\CommonUnits\uReportParams.pas',
  fdmPrintSelect in '..\..\src\fdmPrintSelect.pas' {dmPrintSelect: TDataModule},
  uGlobalConst in '..\..\..\..\..\uCommon\uGlobalConst.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Ведомость остатков ТМЦ';
  Application.HelpFile := 'StMedsestra.chm';
  Application.CreateForm(TfrmGetPeriod, frmGetPeriod);
  Application.CreateForm(TfmCheckedListEdit, fmCheckedListEdit);
  Application.CreateForm(TdmPrintSelect, dmPrintSelect);
  Application.Run;
end.
