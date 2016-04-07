echo off
ren DicomPack.inc  MyDicomPack.inc
ren DicomPack_REG.inc DicomPack.inc



del "C:\Program Files\Embarcadero\RAD Studio\9.0\Dicom\*.*" /Q



echo run "C:\Program Files\Embarcadero\RAD Studio\9.0\bin\Dcc32.exe"  DicomVCLDXE.dpk
ECHO run delphi XE yourself
pause


copy *.dfm "C:\Program Files\Embarcadero\RAD Studio\9.0\Dicom\*.*"
copy *.res "C:\Program Files\Embarcadero\RAD Studio\9.0\Dicom\*.*"
copy *.dcr "C:\Program Files\Embarcadero\RAD Studio\9.0\Dicom\*.*"
rem copy *.hpp "C:\Program Files\Embarcadero\RAD Studio\9.0\Dicom\*.*"


ren DicomPack.inc DicomPack_REG.inc
ren MyDicomPack.inc DicomPack.inc 

call "C:\dicomvcl\dicomvcl\_clean.bat"


"C:\Program Files\Inno Setup 5\Compil32.exe"  /cc  "C:\dicomvcl\DicomVCL\Setup\DicomEasyRegD_XE2.iss"
rem del E:\D\DicomVCLRegDXE2.exe
rem copy F:\Setup\DicomVCLRegDXE2.exe E:\D\DicomVCLRegDXE2.exe


"C:\Program Files\Inno Setup 5\Compil32.exe"  /cc  "C:\dicomvcl\DicomVCL\Setup\DicomEasyRegProD_XE2.iss"
rem del E:\D\DicomVCLRegProDXE2.exe
rem copy F:\Setup\DicomVCLRegProDXE2.exe E:\D\DicomVCLRegProDXE2.exe

pause


