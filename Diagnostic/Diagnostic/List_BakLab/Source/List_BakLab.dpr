program List_BakLab;
// OKB Hanty - ��������� - 137965, ���������� - 149090
// Local �������� - 112568
// ������ ����� ���������� - 174380 ; ����������� - 173619
// ����� �������� �������� - 183159
uses
  SMMainAPI in '..\..\..\uCommon_Tima\SMMainAPI.pas',
  Forms,
  OracleMonitor,
  fMain in 'fMain.pas' {frmMain},
  fOtmena in '..\..\..\uCommon_Kolya\fOtmena.pas' {frmOtmena},
  fSetNaz in '..\..\..\uCommon_Kolya\fSetNaz.pas' {frmSetNaz},
  fPreview in '..\..\..\uCommon_Kolya\fPreview.pas' {frmPreview},
  fSearch in 'fSearch.pas' {frmSearch},
  fWait in '..\..\..\uCommon_Kolya\fWait.pas' {FrmWait},
  fPacInfoDiagnost in '..\..\..\uCommon_Kolya\fPacInfoDiagnost.pas' {frmPacInfoDiagnost},
  fEditNaz in 'fEditNaz.pas' {frmEditNaz},
  fDolg in 'fDolg.pas' {frmDolg},
  fPac in 'fPac.pas' {frmPac},
  uDigitalSignature in '..\..\..\..\DigitalSignature\parts\DigKey\uDigitalSignature.pas',
  fLabPatAnatom in 'fLabPatAnatom.pas' {frmLabPatAnatom},
  fProtocol in 'fProtocol.pas' {frmProtocol},
  fSetChar in 'fSetChar.pas' {frmSetChar},
  fSetDatePos in 'fSetDatePos.pas' {frmSetDatePos},
  fSysInfo in '..\..\..\uCommon_Kolya\fSysInfo.pas' {frmSysInfo},
  fSeCompany in 'fSeCompany.pas' {frmSetCompany},
  fArchive in '..\..\List_konsult\Source\fArchive.pas' {frmArchive},
  fSetParam in '..\..\List_konsult\Source\fSetParam.pas' {frmSetParam};

{$R *.res}

begin
  if Application.Terminated then
    Exit;
  if not GetCheckConnect() then
    Exit;
  Application.Initialize;
  Application.Title := '������ ������������';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmArchive, frmArchive);
  Application.CreateForm(TfrmSetParam, frmSetParam);
  frmMain.DoShowForm;
  Application.Run;
end.
