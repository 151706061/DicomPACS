program Configurator;

uses
  Forms,
  fMain in 'fMain.pas' {frmMain},
  CmnUnit in '..\..\..\uCommon_Dicom\CmnUnit.pas',
  fBackUp in 'fBackUp.pas' {FrmBackUp},
  fEdtDevice in 'fEdtDevice.pas' {FrmEdtDevice},
  DICOM_CMN in '..\..\..\uCommon_Dicom\DICOM_CMN.pas',
  DB_CMN in '..\..\..\uCommon_Dicom\DB_CMN.pas',
  fAddRule in 'fAddRule.pas' {frmAddRule},
  UnFrmGetDevices in '..\..\..\uCommon_Dicom\UnFrmGetDevices.pas' {FrmGetDevices},
  UnFrmProgressBar in '..\..\..\uCommon_Dicom\UnFrmProgressBar.pas' {FrmProgressBar},
  fTAGSEdt in 'fTAGSEdt.pas' {FTAGS},
  UnfrmEdtPatient in 'UnfrmEdtPatient.pas' {frmEdtPatient},
  UnEdtWLForm in 'UnEdtWLForm.pas' {EdtWLForm},
  UnAbout in '..\..\..\uCommon_Dicom\UnAbout.pas' {FrmAbout},
  DCM_Attributes in '..\..\..\..\DicomVCL\DCM_Attributes.pas',
  DCM_Client in '..\..\..\..\DicomVCL\DCM_Client.pas',
  DCM_Connection in '..\..\..\..\DicomVCL\DCM_Connection.pas',
  DCM_Def in '..\..\..\..\DicomVCL\DCM_Def.pas',
  DCM_Dict in '..\..\..\..\DicomVCL\DCM_Dict.pas',
  DCM_Server in '..\..\..\..\DicomVCL\DCM_Server.pas',
  DCM_UID in '..\..\..\..\DicomVCL\DCM_UID.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Конфигуратор';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
