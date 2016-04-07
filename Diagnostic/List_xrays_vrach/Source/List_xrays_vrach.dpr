program List_xrays_vrach; //~����� �����������~
// ����� (��������) - 39127, ���������������� - 38833, ���������� - 105038, ����������� ����� - 208330                                
// ������ ������ (�����������) - 115655
// ������(�������� ��������) - 53938
// ������ ������ ������������ �� - 418203, �������� �� - 129579
// ������������� �������� ��������� �� - 59182
// �������� - ���������� �� - 66365                               

uses
  SMMainAPI in '..\..\..\uCommon_Tima\SMMainAPI.pas',
  Forms,
  OracleMonitor,
  fMain in 'fMain.pas' {frmMain},
  fOtmena in '..\..\..\uCommon_Kolya\fOtmena.pas' {frmOtmena},
  fEditNaz in '..\..\..\uCommon_Kolya\fEditNaz.pas' {frmEditNaz},
  fSetNaz in '..\..\..\uCommon_Kolya\fSetNaz.pas' {frmSetNaz},
  fPacInfo in '..\..\..\uCommon_Kolya\fPacInfo.pas' {frmPacInfo},
  fOtmetki in 'fOtmetki.pas' {frmOtmetki},
  fArchive in '..\..\..\uCommon_Kolya\fArchive.pas' {frmArchive},
  fProtocolMore in 'fProtocolMore.pas' {frmProtocolMore},
  fAllHistory in '..\..\..\uCommon_Kolya\fAllHistory.pas' {frmAllHistory},
  fSetResume in 'fSetResume.pas' {frmSetResume},
  fAddEditElement in 'fAddEditElement.pas' {frmAddEditElement},
  fSearchLab in 'fSearchLab.pas' {frmSearchLab},
  fDolg in 'fDolg.pas' {frmDolg},
  fOtmetkiFlu in 'fOtmetkiFlu.pas' {frmOtmetkiFlu},
  fWait in '..\..\..\uCommon_Kolya\fWait.pas' {FrmWait},
  fPass in 'fPass.pas' {frmPass},
  fPac in 'fPac.pas' {frmPac},
  fControlProtocolN in 'fControlProtocolN.pas' {frmControlProtocolN},
  fProgressNorma in 'fProgressNorma.pas' {frmProgressNorma},
  fCorrect in 'fCorrect.pas' {frmCorrect},
  fMedEditorTemplates in 'fMedEditorTemplates.pas' {fmMedEditorTemplates},
  fProtocolN in 'fProtocolN.pas' {frmProtocolN},
  fSetDs in 'fSetDs.pas' {frmSetDs},
  fEditDiag in 'fEditDiag.pas' {frmEditDiag},
  fProtocol in 'fProtocol.pas' {frmProtocol},
  fDolgTalon in 'fDolgTalon.pas' {frmDolgTalon},
  fSysInfo in '..\..\..\uCommon_Kolya\fSysInfo.pas' {frmSysInfo},
  fShowControlProtokol in 'fShowControlProtokol.pas' {frmShowControlProtokol},
  fSetQ in 'fSetQ.pas' {frmSetQ},
  Makhaon_TLB in '..\..\..\uCommon_Kolya\Makhaon_TLB.pas',
  fProfFactor in 'fProfFactor.pas' {frmProfFactor},
  fSaveRSh in 'fSaveRSh.pas' {frmSaveRSh},
  fAddEditSh in 'fAddEditSh.pas' {frmAddEditSh},
  fAddorEditSh in 'fAddorEditSh.pas' {frmAddorEditSh},
  fSnimki in '..\..\..\uCommon_Dicom\fSnimki.pas' {frmSnimki},
  UnMultiFormsFrame in '..\..\..\uCommon_Dicom\UnMultiFormsFrame.pas' {MultiForms: TFrame},
  uPrintDocument in '..\..\..\..\uCommon\uPrintDocument.pas',
  fTableParam in 'fTableParam.pas' {fmTableParam},
  uPrintWord in '..\..\..\..\uCommon\uPrintWord.pas',
  uPrintType in '..\..\..\..\uCommon\uPrintType.pas';

{$R *.res}

begin
  if Application.Terminated then
    Exit;
  if not GetCheckConnect() then
    Exit;
  Application.Initialize;
  Application.Title := '������� - ������ �����';
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.DoShowForm;
  Application.Run;
end.
