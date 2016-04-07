echo off
echo First Exit All Delphi
rem pause

ren DicomPack.inc  MyDicomPack.inc
ren DicomPack_TRIAL.inc DicomPack.inc

del "C:\Program Files\CodeGear\RAD Studio\6.0\Dicom\*.*" /Q

echo "F:\CodeGear\RAD Studio\6.0\bin\Dcc32.exe"  DicomVCLD2009.dpk -N0"F:\CodeGear\RAD Studio\5.0\Dicom"
ECHO RUN delphi 2009 yourself
pause

copy *.dfm "C:\Program Files\CodeGear\RAD Studio\6.0\Dicom\*.*"
copy *.res "C:\Program Files\CodeGear\RAD Studio\6.0\Dicom\*.*"
copy *.dcr "C:\Program Files\CodeGear\RAD Studio\6.0\Dicom\*.*"


ren DicomPack.inc DicomPack_TRIAL.inc
ren MyDicomPack.inc DicomPack.inc 

call "c:\dicomvcl\dicomvcl\_clean.bat"

pause


"C:\Program Files\Inno Setup 5\Compil32.exe"  /cc  "c:\dicomvcl\DicomVCL\Setup\DicomEasyD2K9.iss"
del E:\D\DicomVCL_D2009.exe 
copy c:\Setup\DicomVCL_D2009.exe E:\D\DicomVCL_D2009.exe 

pause