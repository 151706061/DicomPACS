// $Id: medica.dpr,v 1.7 2007/06/04 06:42:54 delphi5 Exp $
//
// JCL_DEBUG_EXPERT_GENERATEJDBG OFF
program medica;

uses
  SMMainAPI,
  Windows,
  Sysutils,
  Forms,
  OracleMonitor,
  uDigitalSignature in '..\..\..\DigitalSignature\parts\DigKey\uDigitalSignature.pas',
  ufrmDigKey in '..\..\..\DigitalSignature\parts\DigKey\ufrmDigKey.pas' {frmDigKey},
  uCryptMng in '..\..\..\DigitalSignature\parts\uCryptMng.pas',
  uCertificateKey in '..\..\..\DigitalSignature\parts\XMLKeysInfo\uCertificateKey.pas',
  uEmployeeInfo in '..\..\..\DigitalSignature\parts\XMLKeysInfo\uEmployeeInfo.pas',
  uEmployeeKeysInfo in '..\..\..\DigitalSignature\parts\XMLKeysInfo\uEmployeeKeysInfo.pas',
  uKeyInfo in '..\..\..\DigitalSignature\parts\XMLKeysInfo\uKeyInfo.pas',
  uKeysInfoConst in '..\..\..\DigitalSignature\parts\XMLKeysInfo\uKeysInfoConst.pas',
  uPrivateKeyInfo in '..\..\..\DigitalSignature\parts\XMLKeysInfo\uPrivateKeyInfo.pas',
  uPublicKeyInfo in '..\..\..\DigitalSignature\parts\XMLKeysInfo\uPublicKeyInfo.pas',
  uUserKeyInfo in '..\..\..\DigitalSignature\parts\XMLKeysInfo\uUserKeyInfo.pas',
  fdmMain in 'src\fdmMain.pas' {dmMain: TDataModule},
  uIROraUtils in '..\..\..\uCommon_Ura\uIROraUtils.pas',
  PkgInvopis in 'src\pkgs\PkgInvopis.pas',
  PKGMEDKART in 'src\pkgs\PKGMEDKART.pas',
  PKGMEDSES in 'src\pkgs\PKGMEDSES.pas',
  PkgPrihrash in 'src\pkgs\PkgPrihrash.pas',
  PKGTEDIZM in 'src\pkgs\PKGTEDIZM.pas',
  PKGTFARMGR in 'src\pkgs\PKGTFARMGR.pas',
  PKGTMEDIC in 'src\pkgs\PKGTMEDIC.pas',
  PKGTMO in 'src\pkgs\PKGTMO.PAS',
  PKGTPOSTAV in 'src\pkgs\PKGTPOSTAV.pas',
  PKGTUCHGR in 'src\pkgs\PKGTUCHGR.pas',
  fUchGr in 'src\forms\fUchGr.pas' {frmUchGr},
  fUchGrEdit in 'src\forms\fUchGrEdit.pas' {frmUchGrEdit},
  fPostavEdit in 'src\forms\fPostavEdit.pas' {frmPostavEdit},
  fPostavLst in 'src\forms\fPostavLst.pas' {frmPostavLst},
  fPrihEdit in 'src\forms\fPrihEdit.pas' {frmPrihEdit},
  fActOstEdit in 'src\forms\fActOstEdit.pas' {frmActOstEdit},
  fPrihList in 'src\forms\fPrihList.pas' {frmPrihList},
  fSetup in 'src\forms\fSetup.pas' {frmSetup},
  fMedicEdit in 'src\forms\fMedicEdit.pas' {frmMedicEdit},
  fMedKardEdit in 'src\forms\fMedKardEdit.pas' {frmMedKardEdit},
  fMedKardLst in 'src\forms\fMedKardLst.pas' {frmMedKardLst},
  fMO in 'src\forms\fMO.pas' {frmMO},
  fMOEdit in 'src\forms\fMOEdit.pas' {frmMOEdit},
  fMoveEdit in 'src\forms\fMoveEdit.pas' {frmMoveEdit},
  fMoveList in 'src\forms\fMoveList.pas' {frmMoveList},
  fNeotl in 'src\forms\fNeotl.pas' {frmNeotlozh},
  FCHMO in 'src\forms\FCHMO.PAS' {frmChmo},
  fEditAll in 'src\forms\fEditAll.pas' {frmEditAll},
  fEdIzm in 'src\forms\fEdIzm.pas' {frmEdIzm},
  fEdizmEdit in 'src\forms\fEdizmEdit.pas' {frmEdIzmEdit},
  fFarmGr in 'src\forms\fFarmGr.pas' {frmFarmGr},
  fFarmGrEdit in 'src\forms\fFarmGrEdit.pas' {frmFarmGrEdit},
  fFIONakl in 'src\forms\fFIONakl.pas' {frmFIONakl},
  fMedic in 'src\forms\fMedic.pas' {frmMedic},
  fFIOTreb in 'src\forms\fFIOTreb.pas' {frmFIOTreb},
  fgetperiod in 'src\forms\fgetperiod.pas' {frmGetPeriod},
  fInvEdit in 'src\forms\fInvEdit.pas' {frmInvEdit1},
  fInvList in 'src\forms\fInvList.pas' {frmInvList1},
  fMainForm in 'src\forms\fMainForm.pas' {frmMain},
  uProdCertDlg in 'src\forms\uProdCertDlg.pas' {ProdCertDlg},
  uProdCertEditDlg in 'src\forms\uProdCertEditDlg.pas' {ProdCertEditDlg},
  fRlsChosePrep in 'src\forms\fRlsChosePrep.pas' {frmRlsChosePrep},
  fRlsFarmGroup in 'src\forms\fRlsFarmGroup.pas' {frmRlsFarmGroup},
  fTrebLst in 'src\forms\fTrebLst.pas' {frmTrebLst},
  fTrebManual in 'src\forms\fTrebManual.pas' {frmTrebManual},
  fTrebByNaz in 'src\forms\fTrebByNaz.pas' {frmTrebByNaz},
  fMedKardListFilter in 'src\forms\fMedKardListFilter.pas' {frmMedKardListFilter},
  fMinSpare in 'src\forms\fMinSpare.pas' {frmMinSpare},
  fSelectPeriod in 'src\forms\fSelectPeriod.pas' {frmSelectPeriod},
  fDateInput in 'src\forms\fDateInput.pas' {frmDateInput},
  fFioZav in 'src\forms\fFioZav.pas' {frmFioZav},
  fRlsDragForms in 'src\forms\fRlsDragForms.pas' {frmRlsDragForms},
  PKGTREB in 'src\pkgs\PKGTREB.pas',
  GLOBALS in 'src\GLOBALS.pas',
  uPkgProdCert in 'src\pkgs\uPkgProdCert.pas',
  PKGTUCHGRTYPE in 'src\pkgs\PKGTUCHGRTYPE.pas',
  fDictAncestor in 'src\forms\DictAnc\fDictAncestor.pas' {frmDictAncestor},
  fMassUnits in 'src\forms\fMassUnits.pas' {frmMassUnits},
  fInputMemo in 'src\forms\fInputMemo.pas' {frmInputMemo},
  fSpecialMedic in 'src\forms\fSpecialMedic.pas' {frmSpecialMedic},
  fSelectSotr in 'src\forms\fSelectSotr.pas' {frmSelectSotr},
  fGlobal in 'src\fGlobal.pas',
  fRecipe in 'src\forms\fRecipe.pas' {frmRecipe},
  PkgSmini in 'src\pkgs\PkgSmini.pas',
  fMedicSelect in 'src\forms\fMedicSelect.pas' {frmMedicSelect},
  fMedProduceList in 'src\forms\fMedProduceList.pas' {frmMedProduceList},
  fMedProduceEdit in 'src\forms\fMedProduceEdit.pas' {frmMedProduceEdit},
  PKGTKARTCOMPOS in 'src\pkgs\PKGTKARTCOMPOS.pas',
  fKartsLst in 'src\forms\fKartsLst.pas' {frmKartsLst},
  PKGTKARTCOITEM in 'src\pkgs\PKGTKARTCOITEM.pas',
  PKGTDOCS in 'src\pkgs\PKGTDOCS.pas',
  HtmlHlp in 'src\forms\HtmlHlp.pas',
  fMOGroup in 'src\forms\fMOGroup.pas' {frmMOGroup},
  fMOinGroup in 'src\forms\fMOinGroup.pas' {frmMOinGroup},
  fEditMoinGroup in 'src\forms\fEditMoinGroup.pas' {frmEditMoinGroup},
  frmRlsChosePrep_B in 'src\forms\frmRlsChosePrep_B.pas' {frameRlsChosePrep_B: TFrame},
  frmRlsChosePrep1 in 'src\forms\frmRlsChosePrep1.pas' {frameRlsChosePrep1: TFrame},
  frmRlsChosePrep2 in 'src\forms\frmRlsChosePrep2.pas' {frameRlsChosePrep2: TFrame},
  fViewPeriodChange in 'src\forms\fViewPeriodChange.pas' {fmViewPeriodChange},
  fSpisanieVid in 'src\forms\fSpisanieVid.pas' {fmSpisanieVid},
  fInputNameValue in 'src\forms\fInputNameValue.pas' {fmInputNameValue},
  fCheckedListEdit in 'Reports\CommonUnits\fCheckedListEdit.pas' {fmCheckedListEdit},
  fSelectCheckedList in 'Reports\CommonUnits\fSelectCheckedList.pas' {fmSelectCheckedList},
  fdmPrintReports in 'src\fdmPrintReports.pas' {dmPrintReports: TDataModule},
  fReportInputActSpis in 'src\forms\fReportInputActSpis.pas' {fmReportInputActSpis},
  fPrintPreview_Base in 'src\forms\fPrintPreview_Base.pas' {fmPrintPreview_Base},
  fPrintPreview_FR2 in 'src\forms\fPrintPreview_FR2.pas' {fmPrintPreview_FR2},
  uProcess in '..\..\..\uCommon\uProcess.pas',
  fPostGiven in 'src\forms\fPostGiven.pas' {frmPostGiven},
  fMedicWithoutLink in 'src\forms\fMedicWithoutLink.pas' {frmMedicWithoutLink},
  fInterface in 'src\forms\fInterface.pas' {fmInterface},
  fLinkedDocs in 'src\forms\fLinkedDocs.pas' {frmLinkedDocs},
  fZayavList in 'src\forms\fZayavList.pas' {frmZayavList},
  fZayavEdit in 'src\forms\fZayavEdit.pas' {frmZayavEdit},
  fdmPrintSelect in 'src\fdmPrintSelect.pas' {dmPrintSelect: TDataModule},
  fm_Select_UchGr in 'src\forms\fm_Select_UchGr.pas' {fmSelect_UchGr},
  fSklad in 'src\forms\fSklad.pas' {frmSklad},
  fVid_post in 'src\forms\fVid_post.pas' {frmVid_post},
  fcross_table_check in 'src\forms\fcross_table_check.pas' {frmCROSS_TABLE_CHECK},
  fdmSkladSelect in 'src\fdmSkladSelect.pas' {dmSkladSelect: TDataModule},
  fBrakSelect in 'src\forms\fBrakSelect.pas' {fmBrakSelect},
  fBrakCheckProgress in 'src\forms\fBrakCheckProgress.pas' {fmBrakCheckProgress},
  uTLINK_IMPNAKL in 'src\uTLINK_IMPNAKL.pas',
  fdmMoveEdit in 'src\forms\fdmMoveEdit.pas' {dmMoveEdit: TDataModule},
  fFinSource in 'src\forms\fFinSource.pas' {fmFinSource},
  fPayCond in 'src\forms\fPayCond.pas' {fmPayCond},
  uGlobalConst in '..\..\..\uCommon\uGlobalConst.pas',
  fGroup_LF in 'src\forms\fGroup_LF.pas' {frmGroup_LF},
  fImportNakl in 'src\forms\fImportNakl.pas' {fmImportNakl},
  fTemplates in 'src\forms\fTemplates.pas' {fmTemplates},
  fInputEdit in 'src\forms\fInputEdit.pas' {fmInputEdit},
  fCROSS_TABLE_PARAMS in 'src\forms\fCROSS_TABLE_PARAMS.pas' {frmCROSS_TABLE_PARAMS},
  fTreb_Quota in 'src\forms\fTreb_Quota.pas' {fmTreb_Quota},
  fTreb_Quota_Edit in 'src\forms\fTreb_Quota_Edit.pas' {fmTreb_Quota_Edit},
  fZatrebList in 'src\forms\fZatrebList.pas' {fmZatrebList},
  fDOC_AUTONUM in 'src\forms\fDOC_AUTONUM.pas' {fmDOC_AUTONUM},
  fSetPacSpis_HiTech in 'src\forms\fSetPacSpis_HiTech.pas' {fmSetPacSpis_HiTech},
  fm_Select_Sotr in 'src\forms\fm_Select_Sotr.pas' {fmSelect_Sotr},
  fProduceByTreb in 'src\forms\fProduceByTreb.pas' {fmProduceByTreb},
  fm_Select_MO in 'src\forms\fm_Select_MO.pas' {fmSelect_MO},
  fSrokyColorOption in 'src\forms\fSrokyColorOption.pas' {frmSrokyColorOption},
  fClosedPeriods in 'src\forms\fClosedPeriods.pas' {frmClosedPeriods},
  fProfil in 'src\forms\fProfil.pas' {fmProfil},
  uSprOKDP in 'src\forms\uSprOKDP.pas' {SprOKDP},
  uSprOKDPEdit in 'src\forms\uSprOKDPEdit.pas' {SprOKDPEdit},
  fUchGrEdit_new in 'src\forms\fUchGrEdit_new.pas' {frmUchGrEdit_new},
  uPrintActSpisUchGr in 'src\forms\uPrintActSpisUchGr.pas' {fPrintActSpisUchGrp},
  fUchgrpsChr in 'src\forms\fUchgrpsChr.pas' {FrmUchGrpsChanges},
  fNarcoticActReportUnit in 'src\forms\fNarcoticActReportUnit.pas' {fNarcoticActReport},
  fNaznList in 'src\forms\fNaznList.pas' {frmNaznList},
  fMOGroupEdit in 'src\forms\fMOGroupEdit.pas' {frmMOGroupEdit};

{$R *.RES}
var UniqueMapping: THandle;

 i:Integer;

begin

//  for i := 0 to ParamCount do ShowMessage('Параметр '+IntToStr(i)+' = '+ParamStr(i));
  for i := 0 to ParamCount do
    OutputDebugString ( PAnsiChar( 'Параметр '+IntToStr(i)+' = '+ParamStr(i) ) );

  //запрет запуска второй копии
  UniqueMapping := CreateFileMapping($FFFFFFFF, nil, PAGE_READONLY, 0, 32,
    pChar(ChangeFileExt(ExtractFileName(ParamStr(0)), '')));
  if UniqueMapping = 0 then
  begin
    MessageBox(UniqueMapping, 'Ошибка выделения памяти!', 'Ошибка!', MB_OK + MB_ICONERROR);
    Application.Terminate;
  end
  else if GetLastError = ERROR_ALREADY_EXISTS then
  begin
    MessageBox(Application.Handle, 'Вторую копию задачи запускать нельзя!', 'Ошибка!', MB_OK + MB_ICONERROR);
    SaveToLog('', '# Попытка запуска второй копии программы');
    CloseHandle(UniqueMapping);
    Exit;
  end;
  Application.Initialize;
  Application.Title := 'Учет движения медикаментов';
  Application.HelpFile := 'Medica.chm';
  Application.CreateForm(TdmMain, dmMain);
  Application.CreateForm(TdmPrintReports, dmPrintReports);
  Application.CreateForm(TdmPrintSelect, dmPrintSelect);
  Application.CreateForm(TdmSkladSelect, dmSkladSelect);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

