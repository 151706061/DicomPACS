echo off
ren DicomPack.inc  MyDicomPack.inc
ren DicomPack_REG.inc DicomPack.inc


del "c:\Program Files\Borland\BDS\4.0\cbdicom\*.*" /Q
del "c:\Program Files\Borland\CBuilder6\dicom\*.*" /Q
del "c:\Program Files\CodeGear\RAD Studio\5.0\cbdicom\*.*" /Q


echo run "c:\Program Files\Borland\CBuilder6\Bin\Bcc32.exe"  DicomVCLCB6.bpk
ECHO and change Cnscrtl.HPP comment _tolower yourself
echo run copyto
pause

ren DicomPack.inc DicomPack_REG.inc
ren MyDicomPack.inc DicomPack.inc 

copy *.dfm "c:\Program Files\Borland\CBuilder6\dicom\*.*"
copy *.res "c:\Program Files\Borland\CBuilder6\dicom\*.*"
copy *.dcr "c:\Program Files\Borland\CBuilder6\dicom\*.*"
copy *.hpp "c:\Program Files\Borland\CBuilder6\dicom\*.*"

call "c:\dicomvcl\DicomVCL\_clean.bat"

"C:\Program Files\Inno Setup 5\Compil32.exe"  /cc  "c:\dicomvcl\DicomVCL\Setup\DicomEasyRegCB6.iss"
del E:\D\DicomVCLRegCB6.exe 
copy c:\Setup\DicomVCLRegCB6.exe E:\D\DicomVCLRegCB6.exe 

"C:\Program Files\Inno Setup 5\Compil32.exe"  /cc  "c:\dicomvcl\DicomVCL\Setup\DicomEasyRegProCB6.iss"
del E:\D\DicomVCLRegProCB6.exe 
copy c:\Setup\DicomVCLRegProCB6.exe E:\D\DicomVCLRegProCB6.exe 

pause

