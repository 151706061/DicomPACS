program TaxiArchive;

uses
  OracleMonitor,
  Forms,
  fMain in 'fMain.pas' {frmMain},
  fSetDisp in 'fSetDisp.pas' {frmSetDisp},
  fSetNumDrv in 'fSetNumDrv.pas' {frmSetNumDrv};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Архив такси';
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.DoShowForm;
  Application.Run;
end.
