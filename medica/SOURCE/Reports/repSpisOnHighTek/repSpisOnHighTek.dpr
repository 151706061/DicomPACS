program repSpisOnHighTek;



uses
  Forms,
  fgetperiod in 'fgetperiod.pas' {frmGetPeriod},
  fdmPrintSelect in '..\..\src\fdmPrintSelect.pas' {dmPrintSelect: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Отчет по высоким технологиям';
  Application.HelpFile := '';
  Application.CreateForm(TfrmGetPeriod, frmGetPeriod);
  Application.CreateForm(TdmPrintSelect, dmPrintSelect);
  Application.Run;
end.
