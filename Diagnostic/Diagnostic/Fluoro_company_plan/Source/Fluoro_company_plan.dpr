program Fluoro_company_plan;

uses
  Forms,
  OracleMonitor,
  fMain in 'fMain.pas' {frmMain},
  SMMainAPI in '..\..\..\uCommon_Tima\SMMainAPI.pas',
  uPeriod_Param in 'uPeriod_Param.pas' {frmParamDate},
  fSetUch in 'fSetUch.pas' {frmSetUch},
  fCompanyList in 'fCompanyList.pas' {frmCompanyList};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'План по флюорографиям';
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.DoShowForm;
  Application.Run;
end.
