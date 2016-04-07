program SvodkaPoDefecture;

{$R 'SvodkaPoDefectureExlShablon.res' 'SvodkaPoDefectureExlShablon.rc'}

uses
  Forms,
  OracleMonitor,
  fgetperiod in 'fgetperiod.pas' {frmGetPeriod},
  fFio in 'fFio.pas' {frmFIO},
  uGlobalConst in '..\..\..\..\..\uCommon\uGlobalConst.pas',
  fdmPrintSelect in '..\..\src\fdmPrintSelect.pas' {dmPrintSelect: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Сводка по дефектуре';
  Application.HelpFile := 'StMedsestra.chm';
  Application.CreateForm(TfrmGetPeriod, frmGetPeriod);
  Application.CreateForm(TdmPrintSelect, dmPrintSelect);
  Application.Run;
end.
