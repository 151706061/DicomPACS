program List_diagnost;
// OKB Hanty �������� 55368 ; �������� �� 63271; ������� �� 142208 ���������� �� 144291
// Vartovsk ������ 64145
// ������ ����������� �� - 71120
// ������ ��� � � 130370 ; ������ � � 420621 
// ����������� ���� ���������� - 105437
// ������ �������� �� - 77679
// ������������ ������������� - 159785
// ������ ��� ��������� �� - 174376
// �������� - ������� �� - 68279
// ������ ����� �������� - 173570
// ����� �������� ���� � - 176318 ; �������� - 172647
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
  fArchive in 'fArchive.pas' {frmArchive},
  uDigitalSignature in '..\..\..\..\DigitalSignature\parts\DigKey\uDigitalSignature.pas',
  fEditType in 'fEditType.pas' {frmEditType},
  fMS in 'fMS.pas' {frmMS},
  fNaz in 'fNaz.pas' {frmNaz},
  fSysInfo in '..\..\..\uCommon_Kolya\fSysInfo.pas' {frmSysInfo},
  fDolgTalon in 'fDolgTalon.pas' {frmDolgTalon},
  fSetMS in 'fSetMS.pas' {frmSetMS},
  fUpdateNaz in 'fUpdateNaz.pas' {frmUpdateNaz},
  fTextIssl in '..\..\..\uCommon_Kolya\fTextIssl.pas' {frmTextIssl};

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
  Application.CreateForm(TfrmTextIssl, frmTextIssl);
  frmMain.DoShowForm;
  Application.Run;
end.
