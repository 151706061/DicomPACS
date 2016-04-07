program prPrihBuh;

{$R '..\Shablon.res' '..\Shablon.rc'}
{$R '..\Shablon_Med.res' '..\Shablon_Med.rc'}

uses
  SmMainAPI,
  Forms,
  fMain in '..\fMain.pas' {frmMain},
  uReportParams in '..\..\CommonUnits\uReportParams.pas',
  fdmPrintSelect in '..\..\..\src\fdmPrintSelect.pas' {dmPrintSelect: TDataModule},
  fGetMOGroup in '..\..\CommonUnits\fGetMOGroup.pas' {frmGetMOGroup},
  fgetperiod in '..\..\CommonUnits\fgetperiod.pas' {frmGetPeriod};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Журнал учета документов прихода';
  Application.HelpFile := 'StMedsestra.chm';
  Application.CreateForm(TdmPrintSelect, dmPrintSelect);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
