program WLServer;

uses
  SvcMgr,
  fMain in 'fMain.pas' {DicomWLServer: TService},
  DicomDatabaseLinkIBX in 'DicomDatabaseLinkIBX.pas',
  CmnUnit1 in 'CmnUnit1.pas',
  DICOM_CMN in '..\..\..\uCommon_Dicom\DICOM_CMN.pas',
  DB_CMN in '..\..\..\uCommon_Dicom\DB_CMN.pas',
  DICOM_charset in '..\..\..\..\DicomVCL\DICOM_charset.pas',
  CmnUnit in '..\..\..\uCommon_Dicom\CmnUnit.pas',
  UnFrmProgressBar in '..\..\..\uCommon_Dicom\UnFrmProgressBar.pas' {FrmProgressBar},
  DCM_Server in '..\..\..\..\DicomVCL\DCM_Server.pas',
  DCM_Attributes in '..\..\..\..\DicomVCL\DCM_Attributes.pas',
  DCM_Client in '..\..\..\..\DicomVCL\DCM_Client.pas',
  DCM_Connection in '..\..\..\..\DicomVCL\DCM_Connection.pas',
  DCM_Def in '..\..\..\..\DicomVCL\DCM_Def.pas',
  DCM_Dict in '..\..\..\..\DicomVCL\DCM_Dict.pas',
  DCM_UID in '..\..\..\..\DicomVCL\DCM_UID.pas';

{$R *.RES}

begin
  if not Application.DelayInitialize or Application.Installing then
    Application.Initialize;
  Application.CreateForm(TDicomWLServer, DicomWLServer);
  //  Application.CreateForm(TFrmProgressBar, FrmProgressBar);
  Application.Run;
end.
