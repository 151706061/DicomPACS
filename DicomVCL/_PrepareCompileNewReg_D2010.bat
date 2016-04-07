echo off
ren DicomPack.inc  MyDicomPack.inc
ren DicomPack_REG.inc DicomPack.inc



del "C:\Program Files\Embarcadero\RAD Studio\7.0\Dicom\*.*" /Q



echo run "C:\Program Files\Embarcadero\RAD Studio\7.0\bin\Dcc32.exe"  DicomVCLD2010.dpk
ECHO run delphi 2010 yourself
pause


copy *.dfm "C:\Program Files\Embarcadero\RAD Studio\7.0\Dicom\*.*"
copy *.res "C:\Program Files\Embarcadero\RAD Studio\7.0\Dicom\*.*"
copy *.dcr "C:\Program Files\Embarcadero\RAD Studio\7.0\Dicom\*.*"
rem copy *.hpp "C:\Program Files\Embarcadero\RAD Studio\7.0\Dicom\*.*"


ren DicomPack.inc DicomPack_REG.inc
ren MyDicomPack.inc DicomPack.inc 

call "c:\dicomvcl\dicomvcl\_clean.bat"


"C:\Program Files\Inno Setup 5\Compil32.exe"  /cc  "C:\dicomvcl\DicomVCL\Setup\DicomEasyRegD2010.iss"
rem del E:\D\DicomVCLRegD2010.exe
rem copy F:\Setup\DicomVCLRegD2010.exe E:\D\DicomVCLRegD2010.exe


"C:\Program Files\Inno Setup 5\Compil32.exe"  /cc  "C:\dicomvcl\DicomVCL\Setup\DicomEasyRegProD2010.iss"
rem del E:\D\DicomVCLRegProD2010.exe
rem copy F:\Setup\DicomVCLRegProD2010.exe E:\D\DicomVCLRegProD2010.exe

pause


