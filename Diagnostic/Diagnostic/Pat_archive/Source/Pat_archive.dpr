// ����� - ��������� - 145965
// ��� - ���������� - 174954
// ����� �������� �������� - 183160
program Pat_archive;

uses
  OracleMonitor,
  Forms,
  fMain in 'fMain.pas' {frmMain},
  SMMainAPI in '..\..\..\uCommon_Tima\SMMainAPI.pas',
  fSetChar in 'fSetChar.pas' {frmSetChar},
  fKem in 'fKem.pas' {frmSetKem},
  fIssl in 'fIssl.pas' {frmIssl};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := '����� �����������';
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.DoShowForm;
  Application.Run;
end.
