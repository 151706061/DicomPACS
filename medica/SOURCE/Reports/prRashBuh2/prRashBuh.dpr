program prRashBuh;

{$R 'Rash_UchGr.res' 'Rash_UchGr.rc'}
{$R 'Rash_Med.res' 'Rash_Med.rc'}

uses
  Forms,
  fMain in 'fMain.pas' {frmMain},
  HtmlHlp in 'HtmlHlp.pas',
  uReportParams in '..\CommonUnits\uReportParams.pas',
  fdmPrintSelect in '..\..\src\fdmPrintSelect.pas' {dmPrintSelect: TDataModule},
  fgetperiod in '..\CommonUnits\fgetperiod.pas' {frmGetPeriod},
  fGetMOGroup in '..\CommonUnits\fGetMOGroup.pas' {frmGetMOGroup},
  fReportInputActSpis in '..\..\src\forms\fReportInputActSpis.pas' {fmReportInputActSpis};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Журнал учета  расходных документов';
  Application.HelpFile := 'StMedsestra.chm';
  Application.CreateForm(TdmPrintSelect, dmPrintSelect);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfmReportInputActSpis, fmReportInputActSpis);
  Application.Run;
end.
