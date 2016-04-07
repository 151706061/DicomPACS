echo off
ren DicomPack.inc  MyDicomPack.inc
ren DicomPack_REG.inc DicomPack.inc



del "C:\Program Files\CodeGear\RAD Studio\6.0\Dicom\*.*" /Q



echo run "F:\CodeGear\RAD Studio\6.0\bin\Dcc32.exe"  DicomVCLD2009.dpk
ECHO run delphi 2009 yourself
pause


copy *.dfm "C:\Program Files\CodeGear\RAD Studio\6.0\Dicom\*.*"
copy *.res "C:\Program Files\CodeGear\RAD Studio\6.0\Dicom\*.*"
copy *.dcr "C:\Program Files\CodeGear\RAD Studio\6.0\Dicom\*.*"
rem copy *.hpp "C:\Program Files\CodeGear\RAD Studio\6.0\Dicom\*.*"


ren DicomPack.inc DicomPack_REG.inc
ren MyDicomPack.inc DicomPack.inc 

call "c:\dicomvcl\dicomvcl\_clean.bat"


"C:\Program Files\Inno Setup 5\Compil32.exe"  /cc  "c:\dicomvcl\DicomVCL\Setup\DicomEasyRegD2009.iss"
del E:\D\DicomVCLRegD2009.exe
copy c:\Setup\DicomVCLRegD2009.exe E:\D\DicomVCLRegD2009.exe


"C:\Program Files\Inno Setup 5\Compil32.exe"  /cc  "c:\dicomvcl\DicomVCL\Setup\DicomEasyRegProD2009.iss"
del E:\D\DicomVCLRegProD2009.exe
copy c:\Setup\DicomVCLRegProD2009.exe E:\D\DicomVCLRegProD2009.exe

pause


