program aSvodOtchetOtdelIssl;

uses
  Forms,
  OracleMonitor, 
  fMain in 'fMain.pas' {frmMain},
  SMMainAPI in '..\..\..\uCommon_Tima\SMMainAPI.pas',
  fSetIssl in 'fSetIssl.pas' {frmSetIssl},
  fSetOtdel in 'fSetOtdel.pas' {frmSetOtdel};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := '����� �� ���������, �� ������������, �� �������� �� ������';
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.DoShowForm;
  Application.Run;
end.
