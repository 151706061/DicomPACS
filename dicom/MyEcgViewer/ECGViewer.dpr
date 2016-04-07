program ECGViewer;

uses
  Forms,
  UnECGMain in 'UnECGMain.pas' {frmECGMain},
  Dcm_View in '..\..\..\DicomVCL\Dcm_View.pas',
  DCM_Attributes in '..\..\..\DicomVCL\DCM_Attributes.pas',
  DCM_Dict in '..\..\..\DicomVCL\DCM_Dict.pas',
  DCM_UID in '..\..\..\DicomVCL\DCM_UID.pas',
  DCM_Def in '..\..\..\DicomVCL\DCM_Def.pas',
  DCM_ImageData_Bitmap in '..\..\..\DicomVCL\DCM_ImageData_Bitmap.pas',
  DCM_ImageData_Bitmap32 in '..\..\..\DicomVCL\DCM_ImageData_Bitmap32.pas',
  DicomVFWView in '..\..\..\DicomVCL\DicomVFWView.pas',
  fHeader in '..\..\uCommon_Dicom\fHeader.pas' {frmHeader},
  DICOM_charset in '..\..\..\DicomVCL\DICOM_charset.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmECGMain, frmECGMain);
  Application.CreateForm(TfrmHeader, frmHeader);
  Application.Run;
end.
