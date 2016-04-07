echo off
ren DicomPack.inc  MyDicomPack.inc
ren DicomPack_REG.inc DicomPack.inc


del "c:\Program Files\Borland\BDS\4.0\cbdicom\*.*" /Q
del "c:\Program Files\Borland\CBuilder6\dicom\*.*" /Q
del "c:\Program Files\CodeGear\RAD Studio\5.0\cbdicom\*.*" /Q

echo run "C:\Program Files\Borland\BDS\4.0\Bin\Dcc32.exe"  DicomVCLCB2006.dpk
ECHO and change Cnscrtl.HPP comment _tolower yourself
echo run copyto
pause

ren DicomPack.inc DicomPack_REG.inc
ren MyDicomPack.inc DicomPack.inc 

copy *.dfm "c:\Program Files\Borland\BDS\4.0\cbdicom\*.*"
copy *.res "c:\Program Files\Borland\BDS\4.0\cbdicom\*.*"
copy *.dcr "c:\Program Files\Borland\BDS\4.0\cbdicom\*.*"
copy *.hpp "c:\Program Files\Borland\BDS\4.0\cbdicom\*.*"

call "c:\dicomvcl\DicomVCL\_clean.bat"


"C:\Program Files\Inno Setup 5\Compil32.exe"  /cc  "c:\dicomvcl\DicomVCL\Setup\DicomEasyRegCB2006.iss"
del E:\D\DicomVCLRegCB2006.exe 
copy c:\Setup\DicomVCLRegCB2006.exe E:\D\DicomVCLRegCB2006.exe 

"C:\Program Files\Inno Setup 5\Compil32.exe"  /cc  "c:\dicomvcl\DicomVCL\Setup\DicomEasyRegProCB2006.iss"
del E:\D\DicomVCLRegProCB2006.exe 
copy c:\Setup\DicomVCLRegProCB2006.exe E:\D\DicomVCLRegProCB2006.exe 

pause

