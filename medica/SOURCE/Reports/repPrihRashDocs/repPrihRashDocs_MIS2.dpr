program repPrihRashDocs_MIS2;



uses
  Forms,
  fm_Main in 'fm_Main.pas' {fmMain},
  HtmlHlp in 'HtmlHlp.pas',
  fCheckedListEdit in '..\CommonUnits\fCheckedListEdit.pas' {fmCheckedListEdit},
  fSelectCheckedList in '..\CommonUnits\fSelectCheckedList.pas' {fmSelectCheckedList},
  dm_Main in 'dm_Main.pas' {dmMain: TDataModule},
  uGlobalConst in 'uCommon\uGlobalConst.pas',
  fHeaderSetup in 'fHeaderSetup.pas' {fmHeaderAndFooter},
  cxPivotGrid_Rusification in 'cxPivotGrid_Rusification.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Конструктор документов';
  Application.HelpFile := '';
  Application.CreateForm(TdmMain, dmMain);
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TfmHeaderAndFooter, fmHeaderAndFooter);
  Application.Run;
end.
