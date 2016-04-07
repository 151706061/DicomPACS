program List_diagnost;
// OKB Hanty �������� 55368 ; �������� �� 63271; ������� �� 142208 
// Vartovsk ������ 64145
// ������ ����������� �� - 71120
// ������ ��� � � 130370 ; ������ � � 418436 
// ����������� ���� ���������� - 105437
// ������ �������� �� - 77679
// ��� ���������� - 47789                            
uses
  SMMainAPI in '..\..\..\..\..\Trunk\ASU2\uCommon_Tima\SMMainAPI.pas',
  Forms,
  OracleMonitor,
  fMain in '..\Source\fMain.pas' {frmMain},
  uPeriod in '..\Source\uPeriod.pas' {frmPeriod},
  fOtmena in '..\..\..\uCommon_Kolya\fOtmena.pas' {frmOtmena},
  fSetNaz in '..\..\..\uCommon_Kolya\fSetNaz.pas' {frmSetNaz},
  fPreview in '..\..\..\uCommon_Kolya\fPreview.pas' {frmPreview},
  fSearch in '..\Source\fSearch.pas' {frmSearch},
  fWait in '..\..\..\uCommon_Kolya\fWait.pas' {FrmWait},
  fPacInfoDiagnost in '..\..\..\uCommon_Kolya\fPacInfoDiagnost.pas' {frmPacInfoDiagnost},
  fEditNaz in '..\Source\fEditNaz.pas' {frmEditNaz},
  fDolg in '..\Source\fDolg.pas' {frmDolg},
  fPac in '..\Source\fPac.pas' {frmPac},
  fArchive in '..\Source\fArchive.pas' {frmArchive},
  uDigitalSignature in '..\..\..\..\DigitalSignature\parts\DigKey\uDigitalSignature.pas',
  fEditType in '..\Source\fEditType.pas' {frmEditType},
  fMS in '..\Source\fMS.pas' {frmMS},
  fNaz in '..\Source\fNaz.pas' {frmNaz},
  fSysInfo in '..\..\..\uCommon_Kolya\fSysInfo.pas' {frmSysInfo},
  fDolgTalon in '..\Source\fDolgTalon.pas' {frmDolgTalon},
  fSetMS in '..\Source\fSetMS.pas' {frmSetMS},
  fImages in '..\Source\fImages.pas' {frmImages},
  fTextIssl in '..\Source\fTextIssl.pas' {frmTextIssl};

{$R *.res}

begin
  if Application.Terminated then
    Exit;
  {$IFDEF USE_NEW_AUTH}
    if not GetCheckConnect() then
      Exit;
  {$ENDIF}    
  Application.Initialize;
  Application.Title := '������ ������������';
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.DoShowForm;
  Application.Run;
end.
