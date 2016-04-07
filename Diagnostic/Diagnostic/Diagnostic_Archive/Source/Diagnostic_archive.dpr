program Diagnostic_archive;

uses
  Forms,
  fMain in 'fMain.pas' {frmMain},
  fSetIssl in 'fSetIssl.pas' {frmSetIssl},
  fKem in 'fKem.pas' {frmSetKem};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Архив диагностики';
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.DoShowForm;
  Application.Run;
end.
