program RepSrokiGodnosti;

{$R 'Shablon.res' 'Shablon.rc'}

uses
  Forms,
  fgetperiod in 'fgetperiod.pas' {frmGetPeriod},
  fdmPrintSelect in '..\..\src\fdmPrintSelect.pas' {dmPrintSelect: TDataModule},
  uGlobalConst in '..\..\..\..\..\uCommon\uGlobalConst.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Выборка партий по срокам годности';
  Application.HelpFile := 'StMedsestra.chm';
  Application.CreateForm(TfrmGetPeriod, frmGetPeriod);
  Application.CreateForm(TdmPrintSelect, dmPrintSelect);
  Application.Run;
end.
