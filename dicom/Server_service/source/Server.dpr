program Server;

uses
  SvcMgr,
  SysUtils,
  fMain in 'fMain.pas' {DicomServer: TService},
  DICOM_CMN in '..\..\..\uCommon_Dicom\DICOM_CMN.pas',
  DB_CMN in '..\..\..\uCommon_Dicom\DB_CMN.pas',
  CmnUnit in '..\..\..\uCommon_Dicom\CmnUnit.pas',
  UnFrmProgressBar in '..\..\..\uCommon_Dicom\UnFrmProgressBar.pas' {FrmProgressBar},
  DICOM_charset in '..\..\..\..\DicomVCL\DICOM_charset.pas',
  DCM_Server in '..\..\..\..\DicomVCL\DCM_Server.pas',
  DCM_Client in '..\..\..\..\DicomVCL\DCM_Client.pas',
  DCM_Connection in '..\..\..\..\DicomVCL\DCM_Connection.pas',
  DCM_Dict in '..\..\..\..\DicomVCL\DCM_Dict.pas',
  DCM_UID in '..\..\..\..\DicomVCL\DCM_UID.pas',
  DCM_Attributes in '..\..\..\..\DicomVCL\DCM_Attributes.pas',
  DCM_Bitmap16 in '..\..\..\..\DicomVCL\DCM_Bitmap16.pas',
  DCM_ImageData_Bitmap in '..\..\..\..\DicomVCL\DCM_ImageData_Bitmap.pas',
  DCM_ImageData_Bitmap16 in '..\..\..\..\DicomVCL\DCM_ImageData_Bitmap16.pas',
  DCM_ImageData_Bitmap32 in '..\..\..\..\DicomVCL\DCM_ImageData_Bitmap32.pas',
  DCM_log in '..\..\..\..\DicomVCL\DCM_log.pas',
  Kxsocket in '..\..\..\..\DicomVCL\Kxsocket.pas',
  KXServerCore in '..\..\..\..\DicomVCL\KXServerCore.pas',
  KXSock in '..\..\..\..\DicomVCL\KXSock.pas',
  KxSockClient in '..\..\..\..\DicomVCL\KxSockClient.pas',
  KxThread in '..\..\..\..\DicomVCL\KxThread.pas',
  KxCache in '..\..\..\..\DicomVCL\KxCache.pas';

{$R *.RES}

begin
  // Windows 2003 Server requires StartServiceCtrlDispatcher to be
  // called before CoRegisterClassObject, which can be called indirectly
  // by Application.Initialize. TServiceApplication.DelayInitialize allows
  // Application.Initialize to be called from TService.Main (after
  // StartServiceCtrlDispatcher has been called).
  //
  // Delayed initialization of the Application object may affect
  // events which then occur prior to initialization, such as
  // TService.OnCreate. It is only recommended if the ServiceApplication
  // registers a class object with OLE and is intended for use with
  // Windows 2003 Server.
  //
  // Application.DelayInitialize := True;
  //
  if not Application.DelayInitialize or Application.Installing then
    Application.Initialize;
  Application.CreateForm(TDicomServer, DicomServer);
  Application.Run;
end.
