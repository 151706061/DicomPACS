echo off
echo First Exit All Delphi
rem pause

ren DicomPack.inc  MyDicomPack.inc
ren DicomPack_TRIAL.inc DicomPack.inc

del "C:\Program Files\Embarcadero\RAD Studio\7.0\Dicom\*.*" /Q

echo "C:\Program Files\Embarcadero\RAD Studio\7.0\bin\Dcc32.exe"  DicomVCLD2010.dpk -N0"C:\Program Files\Embarcadero\RAD Studio\7.0\Dicom"
ECHO RUN delphi 2010 yourself
pause

copy *.dfm "C:\Program Files\Embarcadero\RAD Studio\7.0\Dicom\*.*"
copy *.res "C:\Program Files\Embarcadero\RAD Studio\7.0\Dicom\*.*"
copy *.dcr "C:\Program Files\Embarcadero\RAD Studio\7.0\Dicom\*.*"


ren DicomPack.inc DicomPack_TRIAL.inc
ren MyDicomPack.inc DicomPack.inc 

call "c:\dicomvcl\dicomvcl\_clean.bat"

pause


"C:\Program Files\Inno Setup 5\Compil32.exe"  /cc  "C:\dicomvcl\DicomVCL\Setup\DicomEasyD2010.iss"
rem del E:\D\DicomVCL_D2010.exe 
rem copy c:\Setup\DicomVCL_D2010.exe E:\D\DicomVCL_D2010.exe 

pause