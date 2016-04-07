program Run;

uses
  Forms,
  fRun in 'fRun.pas' {frmRun};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Запуск EditTalon';
  Application.CreateForm(TfrmRun, frmRun);
  Application.Run;
end.
