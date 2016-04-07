echo off
echo First Exit All Delphi
rem pause

ren DicomPack.inc  MyDicomPack.inc
ren DicomPack_TRIAL.inc DicomPack.inc

del "c:\Program Files\Borland\BDS\4.0\cbdicom\*.*" /Q
del "c:\Program Files\Borland\CBuilder6\dicom\*.*" /Q
del "c:\CodeGear\RAD Studio\5.0\cbdicom\*.*" /Q

ECHO RUN C++builder 2007 yourself
ECHO change Cnscrtl.HPP comment _tolower 
echo run copytocbcicom
pause

ren DicomPack.inc DicomPack_TRIAL.inc
ren MyDicomPack.inc DicomPack.inc 

copy *.dfm "c:\Program Files\CodeGear\RAD Studio\5.0\cbdicom\*.*"
copy *.res "c:\Program Files\CodeGear\RAD Studio\5.0\cbdicom\*.*"
copy *.dcr "c:\Program Files\CodeGear\RAD Studio\5.0\cbdicom\*.*"
copy *.hpp "c:\Program Files\CodeGear\RAD Studio\5.0\cbdicom\*.*"

copy "c:\Program Files\Borland\BDS\4.0\cbdicom\Dcm32_transforms.hpp"  "c:\Program Files\CodeGear\RAD Studio\5.0\cbdicom\*.*"
copy "c:\Program Files\Borland\BDS\4.0\cbdicom\dotmath.hpp"  "c:\Program Files\CodeGear\RAD Studio\5.0\cbdicom\*.*"

call "c:\dicomvcl\DicomVCL\_clean.bat"

echo clear demo folder please. now build install pak
pause

"C:\Program Files\Inno Setup 5\Compil32.exe"  /cc  "c:\dicomvcl\DicomVCL\Setup\DicomEasyCB2K7.iss"
del E:\D\DicomVCL_CB2007.exe 
copy c:\Setup\DicomVCL_CB2007.exe E:\D\DicomVCL_CB2007.exe 

pause