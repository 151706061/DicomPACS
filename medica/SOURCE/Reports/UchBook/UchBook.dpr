program UchBook;

{$R '..\RepPrihRashBySumByUchGr\Shablon.res' '..\RepPrihRashBySumByUchGr\Shablon.rc'}

uses
  Forms,
  SmMainApi,
  uGlobal,
  fgetperiod in 'fgetperiod.pas' {frmGetPeriod},
  HtmlHlp in 'HtmlHlp.pas',
  fdmPrintSelect in '..\..\src\fdmPrintSelect.pas' {dmPrintSelect: TDataModule},
  fCheckedListEdit in '..\CommonUnits\fCheckedListEdit.pas' {fmCheckedListEdit},
  uGlobalConst in '..\..\..\..\..\uCommon\uGlobalConst.pas',
  uUchBook in 'uUchBook.pas' {frmUchBook},
  uGetDate in 'uGetDate.pas' {fGetDate},
  uTimer in 'uTimer.pas' {fTimer};

{$R *.RES}

begin
  if not GetCheckConnect() then
    Exit;

  if not DO_CHECK_ACCESS then
    Exit;

  Application.Initialize;
  Application.Title := 'Книга учета ТМЦ';
  Application.HelpFile := '';
  Application.CreateForm(TfrmUchBook, frmUchBook);
  Application.CreateForm(TdmPrintSelect, dmPrintSelect);
  Application.Run;
end.
