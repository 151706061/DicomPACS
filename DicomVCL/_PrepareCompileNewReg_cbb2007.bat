echo off
ren DicomPack.inc  MyDicomPack.inc
ren DicomPack_REG.inc DicomPack.inc


del "c:\Program Files\Borland\BDS\4.0\cbdicom\*.*" /Q
del "c:\Program Files\Borland\CBuilder6\dicom\*.*" /Q
del "c:\Program Files\CodeGear\RAD Studio\5.0\cbdicom\*.*" /Q

echo run "F:\CodeGear\RAD Studio\5.0\bin\Dcc32.exe"  DicomVCLCB2007.dpk
ECHO run C++builder 2007 yourself
echo run copyto
pause

ren DicomPack.inc DicomPack_REG.inc
ren MyDicomPack.inc DicomPack.inc 

copy *.dfm "c:\Program Files\CodeGear\RAD Studio\5.0\cbdicom\*.*"
copy *.res "c:\Program Files\CodeGear\RAD Studio\5.0\cbdicom\*.*"
copy *.dcr "c:\Program Files\CodeGear\RAD Studio\5.0\cbdicom\*.*"
copy *.hpp "c:\Program Files\CodeGear\RAD Studio\5.0\cbdicom\*.*"

copy "c:\Program Files\Borland\BDS\4.0\cbdicom\Dcm32_transforms.hpp"  "c:\Program Files\CodeGear\RAD Studio\5.0\cbdicom\*.*"
copy "c:\Program Files\Borland\BDS\4.0\cbdicom\dotmath.hpp"  "c:\Program Files\CodeGear\RAD Studio\5.0\cbdicom\*.*"

call "c:\dicomvcl\DicomVCL\_clean.bat"

"C:\Program Files\Inno Setup 5\Compil32.exe"  /cc  "c:\dicomvcl\DicomVCL\Setup\DicomEasyRegCB2007.iss"
del E:\D\DicomVCLRegCB2007.exe 
copy c:\Setup\DicomVCLRegCB2007.exe E:\D\DicomVCLRegCB2007.exe 

"C:\Program Files\Inno Setup 5\Compil32.exe"  /cc  "c:\dicomvcl\DicomVCL\Setup\DicomEasyRegProCB2007.iss"
del E:\D\DicomVCLRegProCB2007.exe 
copy c:\Setup\DicomVCLRegProCB2007.exe E:\D\DicomVCLRegProCB2007.exe 

pause

