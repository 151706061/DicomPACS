echo off
ren DicomPack.inc  MyDicomPack.inc
ren DicomPack_REG.inc DicomPack.inc


del "C:\Program Files\Borland\Delphi5\dicom\*.*" /Q
del "C:\Program Files\Borland\Delphi6\dicom\*.*" /Q
del "C:\Program Files\Borland\Delphi7\dicom\*.*" /Q
del "c:\Program Files\Borland\BDS\3.0\dicom\*.*" /Q
del "c:\Program Files\Borland\BDS\4.0\dicom\*.*" /Q
rem del "F:\CodeGear\RAD Studio\5.0\Dicom\*.*" /Q

"C:\Program Files\Borland\Delphi5\Bin\Dcc32.exe"  DicomVCLD5.dpk


"C:\Program Files\Borland\Delphi6\Bin\Dcc32.exe"  DicomVCLD6.dpk


"C:\Program Files\Borland\Delphi7\Bin\Dcc32.exe"  DicomVCLD7.dpk

"C:\Program Files\Borland\BDS\3.0\Bin\Dcc32.exe"  DicomVCLD2005.dpk

"C:\Program Files\Borland\BDS\4.0\Bin\Dcc32.exe"  DicomVCLD2006.dpk

rem echo run "F:\CodeGear\RAD Studio\5.0\bin\Dcc32.exe"  DicomVCLD2007.dpk
rem ECHO run delphi 2007 yourself
pause

copy *.dfm "C:\Program Files\Borland\Delphi5\dicom\*.*"
copy *.res "C:\Program Files\Borland\Delphi5\dicom\*.*"
copy *.dcr "C:\Program Files\Borland\Delphi5\dicom\*.*"
rem copy *.hpp "C:\Program Files\Borland\Delphi5\dicom\*.*"

copy *.dfm "C:\Program Files\Borland\Delphi6\dicom\*.*"
copy *.res "C:\Program Files\Borland\Delphi6\dicom\*.*"
copy *.dcr "C:\Program Files\Borland\Delphi6\dicom\*.*"
rem copy *.hpp "C:\Program Files\Borland\Delphi6\dicom\*.*"


copy *.dfm "C:\Program Files\Borland\Delphi7\dicom\*.*"
copy *.res "C:\Program Files\Borland\Delphi7\dicom\*.*"
copy *.dcr "C:\Program Files\Borland\Delphi7\dicom\*.*"
rem copy *.hpp "C:\Program Files\Borland\Delphi7\dicom\*.*"


copy *.dfm "c:\Program Files\Borland\BDS\3.0\dicom\*.*"
copy *.res "c:\Program Files\Borland\BDS\3.0\dicom\*.*"
copy *.dcr "c:\Program Files\Borland\BDS\3.0\dicom\*.*"
rem copy *.hpp "c:\Program Files\Borland\BDS\3.0\dicom\*.*"


copy *.dfm "c:\Program Files\Borland\BDS\4.0\dicom\*.*"
copy *.res "c:\Program Files\Borland\BDS\4.0\dicom\*.*"
copy *.dcr "c:\Program Files\Borland\BDS\4.0\dicom\*.*"
rem copy *.hpp "c:\Program Files\Borland\BDS\4.0\dicom\*.*"

rem copy *.dfm "c:\Program Files\Borland\BDS\4.0\cbdicom\*.*"
rem copy *.res "c:\Program Files\Borland\BDS\4.0\cbdicom\*.*"
rem copy *.dcr "c:\Program Files\Borland\BDS\4.0\cbdicom\*.*"
rem copy *.hpp "c:\Program Files\Borland\BDS\4.0\cbdicom\*.*"

rem copy *.dfm "c:\Program Files\Borland\CBuilder6\dicom\*.*"
rem copy *.res "c:\Program Files\Borland\CBuilder6\dicom\*.*"
rem copy *.dcr "c:\Program Files\Borland\CBuilder6\dicom\*.*"
rem copy *.hpp "c:\Program Files\Borland\CBuilder6\dicom\*.*"

rem copy *.dfm "c:\Program Files\CodeGear\RAD Studio\5.0\Dicom\*.*"
rem copy *.res "c:\Program Files\CodeGear\RAD Studio\5.0\Dicom\*.*"
rem copy *.dcr "c:\Program Files\CodeGear\RAD Studio\5.0\Dicom\*.*"
rem copy *.hpp "c:\Program Files\CodeGear\RAD Studio\5.0\Dicom\*.*"

rem copy *.dfm "c:\Program Files\CodeGear\RAD Studio\5.0\CBDicom\*.*"
rem copy *.res "c:\Program Files\CodeGear\RAD Studio\5.0\cbDicom\*.*"
rem copy *.dcr "c:\Program Files\CodeGear\RAD Studio\5.0\cbDicom\*.*"
rem copy *.hpp "c:\Program Files\CodeGear\RAD Studio\5.0\cbDicom\*.*"

ren DicomPack.inc DicomPack_REG.inc
ren MyDicomPack.inc DicomPack.inc 

call "c:\dicomvcl\DicomVCL\_clean.bat"

rem "C:\Program Files\Inno Setup 5\Compil32.exe"  /cc  "c:\dicomvcl\DicomVCL\Setup\DicomEasyReg.iss"
rem del E:\D\DicomVCLReg.exe
rem copy F:\Setup\DicomVCLReg.exe E:\D\DicomVCLReg.exe

"C:\Program Files\Inno Setup 5\Compil32.exe"  /cc  "c:\dicomvcl\DicomVCL\Setup\DicomEasyRegD5.iss"
del E:\D\DicomVCLRegD5.exe
copy c:\Setup\DicomVCLRegD5.exe E:\D\DicomVCLRegD5.exe

"C:\Program Files\Inno Setup 5\Compil32.exe"  /cc  "c:\dicomvcl\DicomVCL\Setup\DicomEasyRegD6.iss"
del E:\D\DicomVCLRegD6.exe
copy c:\Setup\DicomVCLRegD6.exe E:\D\DicomVCLRegD6.exe

"C:\Program Files\Inno Setup 5\Compil32.exe"  /cc  "c:\dicomvcl\DicomVCL\Setup\DicomEasyRegD7.iss"
del E:\D\DicomVCLRegD7.exe
copy c:\Setup\DicomVCLRegD7.exe E:\D\DicomVCLRegD7.exe

"C:\Program Files\Inno Setup 5\Compil32.exe"  /cc  "c:\dicomvcl\DicomVCL\Setup\DicomEasyRegD2005.iss"
del E:\D\DicomVCLRegD2005.exe
copy c:\Setup\DicomVCLRegD2005.exe E:\D\DicomVCLRegD2005.exe

"C:\Program Files\Inno Setup 5\Compil32.exe"  /cc  "c:\dicomvcl\DicomVCL\Setup\DicomEasyRegD2006.iss"
del E:\D\DicomVCLRegD2006.exe
copy c:\Setup\DicomVCLRegD2006.exe E:\D\DicomVCLRegD2006.exe

rem "C:\Program Files\Inno Setup 5\Compil32.exe"  /cc  "c:\dicomvcl\DicomVCL\Setup\DicomEasyRegPro.iss"
rem del E:\D\DicomVCLRegPro.exe
rem copy F:\Setup\DicomVCLRegPro.exe E:\D\DicomVCLRegPro.exe

"C:\Program Files\Inno Setup 5\Compil32.exe"  /cc  "c:\dicomvcl\DicomVCL\Setup\DicomEasyRegProD5.iss"
del E:\D\DicomVCLRegProD5.exe
copy F:\Setup\DicomVCLRegProD5.exe E:\D\DicomVCLRegProD5.exe

"C:\Program Files\Inno Setup 5\Compil32.exe"  /cc  "c:\dicomvcl\DicomVCL\Setup\DicomEasyRegProD6.iss"
del E:\D\DicomVCLRegProD6.exe
copy c:\Setup\DicomVCLRegProD6.exe E:\D\DicomVCLRegProD6.exe

"C:\Program Files\Inno Setup 5\Compil32.exe"  /cc  "c:\dicomvcl\DicomVCL\Setup\DicomEasyRegProD7.iss"
del E:\D\DicomVCLRegProD7.exe
copy c:\Setup\DicomVCLRegProD7.exe E:\D\DicomVCLRegProD7.exe

"C:\Program Files\Inno Setup 5\Compil32.exe"  /cc  "c:\dicomvcl\DicomVCL\Setup\DicomEasyRegProD8.iss"
del E:\D\DicomVCLRegProD2005.exe
copy c:\Setup\DicomVCLRegProD2005.exe E:\D\DicomVCLRegProD2005.exe

"C:\Program Files\Inno Setup 5\Compil32.exe"  /cc  "c:\dicomvcl\DicomVCL\Setup\DicomEasyRegProD9.iss"
del E:\D\DicomVCLRegProD2006.exe
copy c:\Setup\DicomVCLRegProD2006.exe E:\D\DicomVCLRegProD2006.exe

pause


