program PrihRashMedicByType_OLD_AUTH;

uses
  Forms,
  fgetperiod in 'fgetperiod.pas' {frmGetPeriod},
  HtmlHlp in 'HtmlHlp.pas',
  fCheckedListEdit in '..\CommonUnits\fCheckedListEdit.pas' {fmCheckedListEdit},
  uGlobalConst in '..\..\..\..\..\uCommon\uGlobalConst.pas',
  fdmPrintSelect in '..\..\src\fdmPrintSelect.pas' {dmPrintSelect: TDataModule},
  dmMain in 'dmMain.pas' {fdmMain: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'ѕриход/расход медикаментов с денежном выражении';
  Application.HelpFile := 'StMedsestra.chm';
  Application.CreateForm(TfdmMain, fdmMain);
  Application.CreateForm(TdmPrintSelect, dmPrintSelect);
  Application.CreateForm(TfrmGetPeriod, frmGetPeriod);
  Application.Run;
end.
