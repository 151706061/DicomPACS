program Plan;

uses
  Forms,
  fMain in 'fMain.pas' {frmMain},
  SMMainAPI in '..\..\..\uCommon_Tima\SMMainAPI.pas',
  fWork in 'fWork.pas' {frmWork},
  fSetUch in 'fSetUch.pas' {frmSetUch};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'План';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmWork, frmWork);
  Application.CreateForm(TfrmSetUch, frmSetUch);
  frmMain.DoShowForm;
  Application.Run;
end.
