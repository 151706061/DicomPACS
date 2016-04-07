program RgRegistr; //~—“ј–јя ј¬“ќ–»«ј÷»я~
// локально √ромут»ѕ - 44968
// ханты нова€ авторизаци€ 1.6 Ћитвиновјћ - 46293
uses
  {$IFDEF USE_NEW_AUTH}
    SMMainAPI in '..\..\..\uCommon_Tima\SMMainAPI.pas',
  {$ELSE}
    SMMainAPI in '..\..\..\..\..\Trunk\ASU2\uCommon_Tima\SMMainAPI.pas',
  {$ENDIF}  
  Forms,
  OracleMonitor,
  fMain in '..\Source\fMain.pas' {frmMain},
  fSearch in '..\Source\fSearch.pas' {frmSearch},
  fNazRgOne1 in '..\Source\fNazRgOne1.pas' {frmNazRg1},
  fNazParamRegist in '..\Source\fNazParamRegist.pas' {frmNazParamRegist},
  fRegistrAmbPac in '..\Source\fRegistrAmbPac.pas' {frmRegistrAmbPac},
  fRegistrAmbPacFlu in '..\Source\fRegistrAmbPacFlu.pas' {frmRegistrAmbPacFlu},
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
  fSetResume in '..\Source\fSetResume.pas' {frmSetResume},
  fAddEditElement in '..\Source\fAddEditElement.pas' {frmAddEditElement},
  fKem in '..\..\..\uCommon_Kolya\fKem.pas' {frmKem},
  fFluoro in '..\..\..\uCommon_Kolya\fFluoro.pas' {frmFluoro},
  fFluoroParameters in '..\..\..\uCommon_Kolya\fFluoroParameters.pas' {frmFluoroParameters},
  fSysInfo in '..\..\..\uCommon_Kolya\fSysInfo.pas' {frmSysInfo},
  fSetLastFluNum in '..\Source\fSetLastFluNum.pas' {frmSetLastFluNum};

{$R *.res}

begin
  if Application.Terminated then
    Exit;
  {$IFDEF USE_NEW_AUTH}
    if not GetCheckConnect() then
      Exit;
  {$ENDIF}
  Application.Initialize;
  Application.Title := '–егистратура';
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.DoShowForm;
  Application.Run;
end.
