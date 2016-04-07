program RgRegistr;
// локально ГромутИП - 44968, СуюндиковЭР Радионуклидка - 208332
// ханты новая авторизация 1.6 ЛитвиновАМ - 46293
// сургут травма БыковаКЮ - 109258
uses
  OracleMonitor,
  SMMainAPI in '..\..\..\uCommon_Tima\SMMainAPI.pas',
  Forms,
  fMain in 'fMain.pas' {frmMain},
  fSearch in 'fSearch.pas' {frmSearch},
  fNazRgOne1 in 'fNazRgOne1.pas' {frmNazRg1},
  fNazParamRegist in 'fNazParamRegist.pas' {frmNazParamRegist},
  fRegistrAmbPac in 'fRegistrAmbPac.pas' {frmRegistrAmbPac},
  fRegistrAmbPacFlu in 'fRegistrAmbPacFlu.pas' {frmRegistrAmbPacFlu},
  fEditNaz in '..\..\..\uCommon_Kolya\fEditNaz.pas' {frmEditNaz},
  fCompanyList in '..\..\..\uCommon_Kolya\fCompanyList.pas' {frmCompanyList},
  fCompany in '..\..\..\uCommon_Kolya\fCompany.pas' {frmCompany},
  fWait in '..\..\..\uCommon_Kolya\fWait.pas' {FrmWait},
  fOtmena in '..\..\..\uCommon_Kolya\fOtmena.pas' {frmOtmena},
  fPacInfo in '..\..\..\uCommon_Kolya\fPacInfo.pas' {frmPacInfo},
  fAllHistory in '..\..\..\uCommon_Kolya\fAllHistory.pas' {frmAllHistory},
  fProsmotrZakl in '..\..\..\uCommon_Kolya\fProsmotrZakl.pas' {frmProsmotrZakl},
  fProsmotrZaklFlu in '..\..\..\uCommon_Kolya\fProsmotrZaklFlu.pas' {frmProsmotrZaklFlu},
  fTub in '..\..\..\uCommon_Kolya\fTub.pas' {frmTub},
  fSetPeriodTub in '..\..\..\uCommon_Kolya\fSetPeriodTub.pas' {frmSetPeriodTub},
  fViewProtocol in '..\..\..\uCommon_Kolya\fViewProtocol.pas' {frmViewProtocol},
  fSetResume in 'fSetResume.pas' {frmSetResume},
  fAddEditElement in 'fAddEditElement.pas' {frmAddEditElement},
  fKem in '..\..\..\uCommon_Kolya\fKem.pas' {frmKem},
  fFluoro in '..\..\..\uCommon_Kolya\fFluoro.pas' {frmFluoro},
  fFluoroParameters in '..\..\..\uCommon_Kolya\fFluoroParameters.pas' {frmFluoroParameters},
  fSysInfo in '..\..\..\uCommon_Kolya\fSysInfo.pas' {frmSysInfo},
  fSetLastFluNum in 'fSetLastFluNum.pas' {frmSetLastFluNum},
  fSetPolis in '..\..\..\uCommon_Kolya\fSetPolis.pas' {frmSetPolis},
  fIns in '..\..\..\uCommon_Kolya\fIns.pas' {frmIns},
  fRegistRad in 'fRegistRad.pas' {frmRegistRad};

{$R *.res}

begin
  if Application.Terminated then
    Exit;
  if not GetCheckConnect() then
    Exit;
  Application.Initialize;
  Application.Title := 'Регистратура';
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.DoShowForm;
  Application.Run;
end.
