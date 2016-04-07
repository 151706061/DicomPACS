program DispList;

uses
  OracleMonitor,
  Forms,
  fMain in 'fMain.pas' {frmMain},
  fAddNaz in 'fAddNaz.pas' {frmAddNaz};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Журнал диспансеризации';
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.DoShowForm;
  Application.Run;
end.
