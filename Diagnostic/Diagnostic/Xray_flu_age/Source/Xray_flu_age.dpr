program Xray_flu_age;

uses
  OracleMonitor,
  Forms,
  fMain in 'fMain.pas' {frmMain},
  SMMainAPI in '..\..\..\uCommon_Tima\SMMainAPI.pas',
  fSetParam in 'fSetParam.pas' {frmSetParam},
  fCompanyList in '..\..\..\uCommon_Kolya\fCompanyList.pas' {frmCompanyList},
  fSetUch in 'fSetUch.pas' {frmSetUch};

{$R *.res}

begin
  if Application.Terminated then
    Exit;
  if not GetCheckConnect() then
    Exit;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Отчет по флюорографии';
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.DoShowForm;
  Application.Run;
end.
