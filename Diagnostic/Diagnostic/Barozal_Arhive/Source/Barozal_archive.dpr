// ���� ����� ������ �� - 158165
program Barozal_archive;

uses
  Forms,
  OracleMonitor,  
  fMain in 'fMain.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := '����� ��������';
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.DoShowMainForm;
  Application.Run;
end.
