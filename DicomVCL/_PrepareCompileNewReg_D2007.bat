echo off
ren DicomPack.inc  MyDicomPack.inc
ren DicomPack_REG.inc DicomPack.inc

del "c:\Program Files\CodeGear\RAD Studio\5.0\Dicom\*.*" /Q

echo run "F:\CodeGear\RAD Studio\5.0\bin\Dcc32.exe"  DicomVCLD2007.dpk
ECHO run delphi 2007 yourself
pause

copy *.dfm "c:\Program Files\CodeGear\RAD Studio\5.0\Dicom\*.*"
copy *.res "c:\Program Files\CodeGear\RAD Studio\5.0\Dicom\*.*"
copy *.dcr "c:\Program Files\CodeGear\RAD Studio\5.0\Dicom\*.*"
rem copy *.hpp "c:\Program Files\CodeGear\RAD Studio\5.0\Dicom\*.*"

ren DicomPack.inc DicomPack_REG.inc
ren MyDicomPack.inc DicomPack.inc 

call "c:\dicomvcl\DicomVCL\_clean.bat"


"C:\Program Files\Inno Setup 5\Compil32.exe"  /cc  "c:\dicomvcl\DicomVCL\Setup\DicomEasyRegD2007.iss"
del E:\D\DicomVCLRegD2007.exe
copy c:\Setup\DicomVCLRegD2007.exe E:\D\DicomVCLRegD2007.exe

"C:\Program Files\Inno Setup 5\Compil32.exe"  /cc  "c:\dicomvcl\DicomVCL\Setup\DicomEasyRegProD2007.iss"
del E:\D\DicomVCLRegProD2007.exe
copy c:\Setup\DicomVCLRegProD2007.exe E:\D\DicomVCLRegProD2007.exe

pause


