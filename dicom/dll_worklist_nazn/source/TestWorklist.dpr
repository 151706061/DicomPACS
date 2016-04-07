program TestWorklist;

uses
  Forms,
  unTestWorklist in 'unTestWorklist.pas' {frmTestWorklist};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmTestWorklist, frmTestWorklist);
  Application.Run;
end.
