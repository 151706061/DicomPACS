program Oborotka;

{$R 'Shablon.res' 'Shablon.rc'}

uses
  Forms,
  fgetperiod in 'fgetperiod.pas' {frmGetPeriod},
  fFIOTreb in 'fFIOTreb.pas' {frmFIOTreb},
  HtmlHlp in 'HtmlHlp.pas',
  SMMainAPI in '..\..\..\..\uCommon_TIMA\SMMainAPI.pas',
  fCheckedListEdit in '..\CommonUnits\fCheckedListEdit.pas' {fmCheckedListEdit},
  uReportParams in '..\CommonUnits\uReportParams.pas',
  fdmPrintSelect in '..\..\src\fdmPrintSelect.pas' {dmPrintSelect: TDataModule},
  uGlobalConst in '..\..\..\..\..\uCommon\uGlobalConst.pas',
  uGlobal in '..\..\..\..\uCommon_Tima\uGlobal.pas',
  fFinSourceReplace in 'fFinSourceReplace.pas' {frmFinSourceReplace};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Оборотная ведомость';
  Application.HelpFile := 'StMedsestra.chm';
  Application.CreateForm(TfrmGetPeriod, frmGetPeriod);
  Application.CreateForm(TdmPrintSelect, dmPrintSelect);
  Application.Run;
end.
