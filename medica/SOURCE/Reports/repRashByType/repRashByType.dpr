program repRashByType;

uses
  Forms,
  fGetPeriod in 'fGetPeriod.pas' {frmGetPeriod};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := '������ �� ����';
  Application.CreateForm(TfrmGetPeriod, frmGetPeriod);
  Application.Run;
end.
