program Dvig_OneMedic;

{$R 'Shablon.res' 'Shablon.rc'}

uses
  Forms,
  fgetperiod in 'fgetperiod.pas' {frmGetPeriod},
  HtmlHlp in 'HtmlHlp.pas',
  fdmPrintSelect in '..\..\src\fdmPrintSelect.pas' {dmPrintSelect: TDataModule},
  fCheckedListEdit in '..\CommonUnits\fCheckedListEdit.pas' {fmCheckedListEdit},  
  uGlobalConst in '..\..\..\..\..\uCommon\uGlobalConst.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Материальный отчёт о движении ТМЦ';
  Application.HelpFile := 'StMedsestra.chm';
  Application.CreateForm(TfrmGetPeriod, frmGetPeriod);
  Application.CreateForm(TdmPrintSelect, dmPrintSelect);
  Application.Run;
end.
