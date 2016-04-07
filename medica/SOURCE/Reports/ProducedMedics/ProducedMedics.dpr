program ProducedMedics;

{$R 'Shablon.res' 'Shablon.rc'}

uses
  Forms,
  fgetperiod in 'fgetperiod.pas' {frmGetPeriod},
  fFIOTreb in 'fFIOTreb.pas' {frmFIOTreb},
  fdmPrintSelect in '..\..\src\fdmPrintSelect.pas' {dmPrintSelect: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Журнал РПО';
  Application.HelpFile := 'StMedsestra.chm';
  Application.CreateForm(TdmPrintSelect, dmPrintSelect);
  Application.CreateForm(TfrmGetPeriod, frmGetPeriod);
  Application.Run;
end.
