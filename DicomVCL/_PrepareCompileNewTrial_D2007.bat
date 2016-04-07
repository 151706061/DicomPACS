echo off
echo First Exit All Delphi
rem pause

ren DicomPack.inc  MyDicomPack.inc
ren DicomPack_TRIAL.inc DicomPack.inc

del "c:\Program Files\CodeGear\RAD Studio\5.0\Dicom\*.*" /Q

echo "F:\CodeGear\RAD Studio\5.0\bin\Dcc32.exe"  DicomVCLD2007.dpk -N0"F:\CodeGear\RAD Studio\5.0\Dicom"
ECHO RUN delphi 2007 yourself
pause

copy *.dfm "c:\Program Files\CodeGear\RAD Studio\5.0\Dicom\*.*"
copy *.res "c:\Program Files\CodeGear\RAD Studio\5.0\Dicom\*.*"
copy *.dcr "c:\Program Files\CodeGear\RAD Studio\5.0\Dicom\*.*"
rem copy *.hpp "c:\Program Files\CodeGear\RAD Studio\5.0\Dicom\*.*"

ren DicomPack.inc DicomPack_TRIAL.inc
ren MyDicomPack.inc DicomPack.inc 

call "c:\dicomvcl\DicomVCL\_clean.bat"

pause

"C:\Program Files\Inno Setup 5\Compil32.exe"  /cc  "c:\dicomvcl\DicomVCL\Setup\DicomEasyD2K7.iss"
del E:\D\DicomVCL_D2007.exe 
copy c:\Setup\DicomVCL_D2007.exe E:\D\DicomVCL_D2007.exe 

pause