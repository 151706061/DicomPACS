program Recalc_plan_fluoro;

uses
  Forms,
  fMain in 'fMain.pas' {frmMain},
  SMMainAPI in '..\..\..\uCommon_Tima\SMMainAPI.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := '�������� �������� ������������';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
