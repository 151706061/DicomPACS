program aRepPat;
// ������ ������ �� 418982
uses
  Forms,
  OracleMonitor,
  fMain in 'fMain.pas' {frmMain},
  fSetParam in 'fSetParam.pas' {frmSetParam},
  fSetValue in 'fSetValue.pas' {frmSetValue};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := '����� � ����������';
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.DoShowForm;
  Application.Run;
end.
