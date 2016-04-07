program Dvig_med_detail_by_mogroup;

uses
  Forms,
  fgetperiod in 'fgetperiod.pas' {Form1},
  fdmPrintSelect in '..\..\src\fdmPrintSelect.pas' {dmPrintSelect: TDataModule};

{$R *.res}

begin
  Application.Initialize;
//  Application.MainFormOnTaskbar := True;
  Application.Title := 'Отчет по движение ТМЦ, детализированный по группам МО';
  Application.CreateForm(TfrmGetPeriod, frmGetPeriod);
  Application.CreateForm(TdmPrintSelect, dmPrintSelect);
  Application.Run;
end.
