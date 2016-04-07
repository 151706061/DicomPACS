program List_xrays_vrach; //~СТАРАЯ АВТОРИЗАЦИЯ~
// Ханты (ГромутИП) - 39127, ВеретельниковаОМ - 38833, КовалеваАВ - 105038                                
// Сургут Травма (ТарасенкоЛЛ) - 71922
// Нягань(удаленно БукинаВМ) - 53938
// Сургут Кардио Берестовская НИ - 39127, Бессонов ДВ - 129579
// Нижневартовск локально Бондырева НА - 59182
// МИД Крючкова 39127

uses
  {$IFDEF USE_NEW_AUTH}
    SMMainAPI in '..\..\..\uCommon_Tima\SMMainAPI.pas',
    uReportUtils in '..\..\..\uCommon_Utils\uReportUtils.pas',
  {$ELSE}
    SMMainAPI in '..\..\..\..\..\Trunk\ASU2\uCommon_Tima\SMMainAPI.pas',
    uReportUtils in '..\..\..\..\..\Trunk\ASU2\uCommon_Utils\uReportUtils.pas',
  {$ENDIF}
  Forms,
  OracleMonitor,
  fMain in '..\Source\fMain.pas' {frmMain},
  fOtmena in '..\..\..\uCommon_Kolya\fOtmena.pas' {frmOtmena},
  fEditNaz in '..\..\..\uCommon_Kolya\fEditNaz.pas' {frmEditNaz},
  fSetNaz in '..\..\..\uCommon_Kolya\fSetNaz.pas' {frmSetNaz},
  fPacInfo in '..\..\..\uCommon_Kolya\fPacInfo.pas' {frmPacInfo},
  fOtmetki in '..\Source\fOtmetki.pas' {frmOtmetki},
  fArchive in '..\..\..\uCommon_Kolya\fArchive.pas' {frmArchive},
  fProtocolMore in '..\Source\fProtocolMore.pas' {frmProtocolMore},
  fAllHistory in '..\..\..\uCommon_Kolya\fAllHistory.pas' {frmAllHistory},
  fSetResume in '..\Source\fSetResume.pas' {frmSetResume},
  fAddEditElement in '..\Source\fAddEditElement.pas' {frmAddEditElement},
  fSearchLab in '..\Source\fSearchLab.pas' {frmSearchLab},
  fDolg in '..\Source\fDolg.pas' {frmDolg},
  fOtmetkiFlu in '..\Source\fOtmetkiFlu.pas' {frmOtmetkiFlu},
  fWait in '..\..\..\uCommon_Kolya\fWait.pas' {FrmWait},
  fPass in '..\Source\fPass.pas' {frmPass},
  fPac in '..\Source\fPac.pas' {frmPac},
  fControlProtocolN in '..\Source\fControlProtocolN.pas' {frmControlProtocolN},
  fProgressNorma in '..\Source\fProgressNorma.pas' {frmProgressNorma},
  fSnimok in '..\Source\fSnimok.pas' {frmSnimok},
  fCorrect in '..\Source\fCorrect.pas' {frmCorrect},
  fMedEditorTemplates in '..\Source\fMedEditorTemplates.pas' {fmMedEditorTemplates},
  fProtocolN in '..\Source\fProtocolN.pas' {frmProtocolN},
  fSetDs in '..\Source\fSetDs.pas' {frmSetDs},
  fEditDiag in '..\Source\fEditDiag.pas' {frmEditDiag},
  fProtocol in '..\Source\fProtocol.pas',
  fDolgTalon in '..\Source\fDolgTalon.pas' {frmDolgTalon},
  fSysInfo in '..\..\..\uCommon_Kolya\fSysInfo.pas' {frmSysInfo},
  fShowControlProtokol in '..\Source\fShowControlProtokol.pas' {frmShowControlProtokol},
  fSetQ in '..\Source\fSetQ.pas' {frmSetQ},
  Makhaon_TLB in '..\..\..\uCommon_Kolya\Makhaon_TLB.pas',
  fControlProtocol in '..\Source\fControlProtocol.pas' {frmControlProtocol};

{$R *.res}

begin
  if Application.Terminated then
    Exit;
  {$IFDEF USE_NEW_AUTH}
    if not GetCheckConnect() then
      Exit;
  {$ENDIF}
  Application.Initialize;
  Application.Title := 'Рентген - Журнал врача';
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.DoShowForm;
  Application.Run;
end.
