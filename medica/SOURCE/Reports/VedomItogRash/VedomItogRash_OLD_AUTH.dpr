program VedomItogRash_OLD_AUTH;

uses
  Forms,
  fgetperiod in 'fgetperiod.pas' {frmGetPeriod},
  HtmlHlp in 'HtmlHlp.pas',
  fdmPrintSelect in '..\..\src\fdmPrintSelect.pas' {dmPrintSelect: TDataModule},
  uGlobalConst in '..\..\..\..\..\uCommon\uGlobalConst.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Ведомость расхода по отделениям';
  Application.HelpFile := 'StMedsestra.chm';
  Application.CreateForm(TfrmGetPeriod, frmGetPeriod);
  Application.CreateForm(TdmPrintSelect, dmPrintSelect);
  Application.Run;
end.
