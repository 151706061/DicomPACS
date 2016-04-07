program List_xrays_lab; // ~����� �����������~
// ����� (����������) - 39211, ����������� ������������� - 208331 
// ������ (����������) - 71869
// �������� �������� - 112520
// ������ ������ ������������ �� - 417873
// ��� ���������� - 45715
// ������ ��� - 155282
// ������ ����� ���� - ������ �� - 173576
// ������ -  ������� �� - 67441



uses
  SMMainAPI in '..\..\..\uCommon_Tima\SMMainAPI.pas',
  Forms,
  OracleMonitor,
  fMain in 'fMain.pas' {frmMain},
  fLabNaprav in 'fLabNaprav.pas' {frmLabNaprav},
  fNazParamRegist in 'fNazParamRegist.pas' {frmNazParamRegist},
  fSearchLab in 'fSearchLab.pas' {frmSearchLab},
  fNazRgOne1 in 'fNazRgOne1.pas' {frmNazRg1},
  fLabNapravFlu in 'fLabNapravFlu.pas' {frmLabNapravFlu},
  fCompanyList in '..\..\..\uCommon_Kolya\fCompanyList.pas' {frmCompanyList},
  fCompany in '..\..\..\uCommon_Kolya\fCompany.pas' {frmCompany},
  fWait in '..\..\..\uCommon_Kolya\fWait.pas' {FrmWait},
  fPacInfo in '..\..\..\uCommon_Kolya\fPacInfo.pas' {frmPacInfo},
  fPass in 'fPass.pas' {frmPass},
  fDolg in 'fDolg.pas' {frmDolg},
  fPac in 'fPac.pas' {frmPac},
  fProsmotrZaklFlu in '..\..\..\uCommon_Kolya\fProsmotrZaklFlu.pas' {frmProsmotrZaklFlu},
  fOtmena in '..\..\..\uCommon_Kolya\fOtmena.pas' {frmOtmena},
  fSysInfo in '..\..\..\uCommon_Kolya\fSysInfo.pas' {frmSysInfo},
  fCompare in 'fCompare.pas' {frmCompare},
  fCorrectPac in 'fCorrectPac.pas' {frmCorrectPac},
  fNaprRad in 'fNaprRad.pas' {frmNaprRad},
  fSetKontrast in 'fSetKontrast.pas' {frmSetKontrast},
  fDolgTalon in 'fDolgTalon.pas' {frmDolgTalon},
  Dialogs,
  fPreview in 'fPreview.pas' {frmPreview};

{$R *.res}

begin
  if Application.Terminated then
    Exit;
  {$IFDEF USE_NEW_AUTH}
  if not GetCheckConnect() then
    Exit;
  {$ENDIF}
  Application.Initialize;
  Application.Title := '������� - ������ ���������';
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.DoShowForm;
  Application.Run;
end.
