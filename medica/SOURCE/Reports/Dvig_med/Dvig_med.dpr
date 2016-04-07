program Dvig_med;

{$R 'shablon.res' 'shablon.rc'}

uses
  Forms,
  fgetperiod in 'fgetperiod.pas' {frmGetPeriod},
  fFIOTreb in 'fFIOTreb.pas' {frmFIOTreb},
  HtmlHlp in 'HtmlHlp.pas',
  fCheckedListEdit in '..\CommonUnits\fCheckedListEdit.pas' {fmCheckedListEdit},
  fSelectCheckedList in '..\CommonUnits\fSelectCheckedList.pas' {fmSelectCheckedList},
  uReportParams in '..\CommonUnits\uReportParams.pas',
  fdmPrintSelect in '..\..\src\fdmPrintSelect.pas' {dmPrintSelect: TDataModule},
  uGlobalConst in '..\..\..\..\..\uCommon\uGlobalConst.pas',
  fm_Select_MO in 'fm_Select_MO.pas' {fmSelect_MO},
  fReportInputActSpis in '..\..\src\forms\fReportInputActSpis.pas' {fmReportInputActSpis};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Отчет по движению ТМЦ';
  Application.HelpFile := 'StMedsestra.chm';
  Application.CreateForm(TfrmGetPeriod, frmGetPeriod);
  Application.CreateForm(TdmPrintSelect, dmPrintSelect);
  Application.CreateForm(TfmReportInputActSpis, fmReportInputActSpis);
  Application.Run;
end.
