// ����� - ��������� - 145965
// ��� - ���������� - 174954
// ����� �������� �������� - 183160
program Oper_archive;

uses
  OracleMonitor,
  Forms,
  fMain in 'fMain.pas' {frmMain},
  SMMainAPI in '..\..\..\uCommon_Tima\SMMainAPI.pas',
  fSetChar in 'fSetChar.pas' {frmSetChar},
  uMKB10 in 'uMKB10.pas' {frmMKB10};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := '����� �����������';
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.DoShowForm;
  Application.Run;
end.
