program QueryList;

uses 
  Forms,
  fMain in 'fMain.pas' {frmMain},
  DICOM_CMN in '..\..\..\uCommon_Dicom\DICOM_CMN.pas',
  CmnUnit in '..\..\..\uCommon_Dicom\CmnUnit.pas',
  DB_CMN in '..\..\..\uCommon_Dicom\DB_CMN.pas',
  UnFrmProgressBar in '..\..\..\uCommon_Dicom\UnFrmProgressBar.pas' {FrmProgressBar},
  fCapture in 'fCapture.pas' {frmCapture},
  fSendParam in '..\..\..\uCommon_Dicom\fSendParam.pas' {frmSendParam},
  UnFrmGetDevices in '..\..\..\uCommon_Dicom\UnFrmGetDevices.pas' {FrmGetDevices},
  UnKalibr in '..\..\..\uCommon_Dicom\UnKalibr.pas' {frmKalibr},
  fSnimok in 'fSnimok.pas' {frmSnimok},
  fHeader in '..\..\..\uCommon_Dicom\fHeader.pas' {frmHeader},
  Dcm_View in '..\..\..\..\DicomVCL\Dcm_View.pas',
  DCM_Attributes in '..\..\..\..\DicomVCL\DCM_Attributes.pas',
  DCM_Connection in '..\..\..\..\DicomVCL\DCM_Connection.pas',
  DCM_Def in '..\..\..\..\DicomVCL\DCM_Def.pas',
  DCM_Dict in '..\..\..\..\DicomVCL\DCM_Dict.pas',
  DCM_UID in '..\..\..\..\DicomVCL\DCM_UID.pas',
  UnAbout in '..\..\..\uCommon_Dicom\UnAbout.pas' {FrmAbout},
  fCD in '..\..\..\uCommon_Dicom\fCD.pas',
  fProgressCD in '..\..\..\uCommon_Dicom\fProgressCD.pas' {frmProgressCD},
  UnfrmProgressBurn in '..\..\..\uCommon_Dicom\UnfrmProgressBurn.pas' {frmProgressBurn},
  ImportSession in '..\..\Client\Source\ImportSession.pas' {frmSessions},
  fSettings in '..\..\Client\Source\fSettings.pas' {frmAdvanceSettings},
  unfrmNastr in 'unfrmNastr.pas' {frmNastr},
  UnEdtWLForm in 'UnEdtWLForm.pas' {EdtWLForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Query-лист';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
