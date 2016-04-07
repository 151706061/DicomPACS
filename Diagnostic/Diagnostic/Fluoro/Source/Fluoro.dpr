program Fluoro;

uses
  SMMainAPI in '..\..\..\uCommon_Tima\SMMainAPI.pas',
  Forms,
  OracleMonitor,
  fMain in 'fMain.pas' {frmMain},
  fChoice in 'fChoice.pas' {frmChoice},
  fSetUch in 'fSetUch.pas' {frmSetUch},
  fCompanySet in 'fCompanySet.pas' {frmCompanySet},
  fAddEditPeriod in 'fAddEditPeriod.pas' {frmAddEditPeriod},
  fCompany in '..\..\..\uCommon_Kolya\fCompany.pas' {frmCompany},
  fCompanyList in '..\..\..\uCommon_Kolya\fCompanyList.pas' {frmCompanyList},
  fPac in 'fPac.pas' {frmPac},
  fWait in '..\..\..\uCommon_Kolya\fWait.pas' {FrmWait},
  fEdit in 'fEdit.pas' {frmEdit},
  fSetDate in 'fSetDate.pas' {frmSetDate},
  fPreview in '..\..\..\uCommon_Kolya\fPreview.pas' {frmPreview},
  fFastRegist in 'fFastRegist.pas' {frmFastRegist},
  fJournal in 'fJournal.pas' {frmJournal},
  uPeriod in '..\..\..\uCommon_Kolya\uPeriod.pas' {frmParamDate},
  fSetZakl in 'fSetZakl.pas' {frmRepZakl},
  fOkonZakl in 'fOkonZakl.pas' {frmOkonZakl},
  fAddEditCompany in 'fAddEditCompany.pas' {frmAddEditCompany},
  fSearchCompany in 'fSearchCompany.pas' {frmSearchCompany},
  fEditPeriod in 'fEditPeriod.pas' {frmEditPeriod},
  fSearchPeople in 'fSearchPeople.pas' {frmSearchPeople},
  fProsmotrZaklFlu in '..\..\..\uCommon_Kolya\fProsmotrZaklFlu.pas' {frmProsmotrZaklFlu},
  fSetPeriodTub in '..\..\..\uCommon_Kolya\fSetPeriodTub.pas' {frmSetPeriodTub},
  fDateControl in 'fDateControl.pas' {frmDateControl},
  fTransfer in 'fTransfer.pas' {frmTransfer},
  fSetCompanyTransfer in 'fSetCompanyTransfer.pas' {frmSetCompanyTransfer},
  fAddToCompany in 'fAddToCompany.pas' {frmAddToCompany},
  fFluoro in '..\..\..\uCommon_Kolya\fFluoro.pas' {frmFluoro},
  fFluoroParameters in '..\..\..\uCommon_Kolya\fFluoroParameters.pas' {frmFluoroParameters},
  fSetResume in 'fSetResume.pas' {frmSetResume},
  fSetParamZakl in 'fSetParamZakl.pas' {frmSetParamZakl},
  fTub in '..\..\..\uCommon_Kolya\fTub.pas' {frmTub},
  fJournalRgPlus in 'fJournalRgPlus.pas' {frmJournalRgPlus},
  fDs in 'fDs.pas' {frmDs},
  fPeriodOsm in 'fPeriodOsm.pas' {frmSetPeriodOsm},
  fProgress in 'fProgress.pas' {frmProgress},
  fFindPacUch in 'fFindPacUch.pas' {frmFindPacUch},
  fSetDateFG in 'fSetDateFG.pas' {frmSetDateFG},
  fSetPeriodCategory in 'fSetPeriodCategory.pas' {frmSetPeriodCategory},
  fJournalNew in 'fJournalNew.pas' {frmJournalNew},
  fSpisokSms in 'fSpisokSms.pas' {frmSpisokSms},
  fJurWU in 'fJurWU.pas' {frmJurWU};

{$R *.res}

begin
  if Application.Terminated then
    Exit;
  if not GetCheckConnect() then
    Exit;
  Application.Initialize;
  Application.Title := 'Журнал флюорографии';
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.DoShowMainForm;
  Application.Run;
end.
