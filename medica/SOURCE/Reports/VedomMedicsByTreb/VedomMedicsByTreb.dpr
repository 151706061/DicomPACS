program VedomMedicsByTreb;

uses
  Forms,
  fgetperiod in 'fgetperiod.pas' {frmGetPeriod},
  fdmPrintSelect in '..\..\src\fdmPrintSelect.pas' {dmPrintSelect: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  //Application.MainFormOnTaskbar := True;
  Application.Title := '��������� ������� �� ����� ����������';
  Application.CreateForm(TfrmGetPeriod, frmGetPeriod);
  Application.CreateForm(TdmPrintSelect, dmPrintSelect);
  Application.Run;
end.
