program WADOService;

uses
  SvcMgr,
  CmnUnit in '..\..\..\uCommon_Dicom\CmnUnit.pas',
  uMD5 in '..\..\..\uCommon_Kolya\uMD5.pas',
  DICOM_CMN in '..\..\..\uCommon_Dicom\DICOM_CMN.pas',
  DB_CMN in '..\..\..\uCommon_Dicom\DB_CMN.pas',
  UnFrmProgressBar in '..\..\..\uCommon_Dicom\UnFrmProgressBar.pas' {FrmProgressBar},
  Unit1 in 'Unit1.pas' {WADOServer: TService},
  DCM_Attributes in '..\..\..\..\DicomVCL\DCM_Attributes.pas',
  DCM_Client in '..\..\..\..\DicomVCL\DCM_Client.pas',
  DCM_Connection in '..\..\..\..\DicomVCL\DCM_Connection.pas',
  DCM_Dict in '..\..\..\..\DicomVCL\DCM_Dict.pas';

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
  Application.CreateForm(TWADOServer, WADOServer);
  Application.CreateForm(TFrmProgressBar, FrmProgressBar);
  Application.Run;
end.
