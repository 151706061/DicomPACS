program aOborotkaRazv;

{$R 'Shablon.res' 'Shablon.rc'}

uses
  Forms,
  fMain in 'fMain.pas' {frmMain},
  fgetperiod in 'fgetperiod.pas' {frmGetPeriod},
  HtmlHlp in 'HtmlHlp.pas',
  fCheckedListEdit in '..\CommonUnits\fCheckedListEdit.pas' {fmCheckedListEdit},
  fProgressBar in '..\CommonUnits\fProgressBar.pas' {frmProgressBar},
  fdmPrintSelect in '..\..\src\fdmPrintSelect.pas' {dmPrintSelect: TDataModule},
  uGlobalConst in '..\..\..\..\..\uCommon\uGlobalConst.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfmCheckedListEdit, fmCheckedListEdit);
  Application.Title := 'Оборотка с разбивкой расхода';
  Application.HelpFile := 'StMedsestra.chm';
  Application.Run;
end.
