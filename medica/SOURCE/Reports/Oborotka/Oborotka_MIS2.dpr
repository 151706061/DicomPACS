program Oborotka_MIS2;

{$R 'Shablon.res' 'Shablon.rc'}

uses
  Forms,
  fgetperiod in 'fgetperiod.pas' {frmGetPeriod},
  fFIOTreb in 'fFIOTreb.pas' {frmFIOTreb},
  HtmlHlp in 'HtmlHlp.pas',
  {$IFDEF MIS2}
  {$ELSE}
  SMMainAPI in '..\..\..\..\uCommon_TIMA\SMMainAPI.pas',
  {$ENDIF}

  fCheckedListEdit in '..\CommonUnits\fCheckedListEdit.pas' {fmCheckedListEdit},
  uReportParams in '..\CommonUnits\uReportParams.pas',
  fdmPrintSelect in '..\..\src\fdmPrintSelect.pas' {dmPrintSelect: TDataModule},
  uGlobalConst in '..\..\..\..\..\uCommon\uGlobalConst.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Оборотная ведомость';
  Application.HelpFile := 'StMedsestra.chm';
  Application.CreateForm(TfrmGetPeriod, frmGetPeriod);
  Application.CreateForm(TdmPrintSelect, dmPrintSelect);
  Application.Run;
end.
