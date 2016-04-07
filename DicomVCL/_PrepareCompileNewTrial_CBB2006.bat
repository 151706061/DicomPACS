echo off
echo First Exit All Delphi
rem pause

ren DicomPack.inc  MyDicomPack.inc
ren DicomPack_TRIAL.inc DicomPack.inc

del "c:\Program Files\Borland\BDS\4.0\cbdicom\*.*" /Q
del "c:\Program Files\Borland\CBuilder6\dicom\*.*" /Q
del "c:\CodeGear\RAD Studio\5.0\cbdicom\*.*" /Q

ECHO compile DicomVCLCB2006.bdsproj
ECHO change Cnscrtl.HPP comment _tolower 
echo run copytocbcicom
pause

ren DicomPack.inc DicomPack_TRIAL.inc
ren MyDicomPack.inc DicomPack.inc 

copy *.dfm "c:\Program Files\Borland\BDS\4.0\cbdicom\*.*"
copy *.res "c:\Program Files\Borland\BDS\4.0\cbdicom\*.*"
copy *.dcr "c:\Program Files\Borland\BDS\4.0\cbdicom\*.*"
copy *.hpp "c:\Program Files\Borland\BDS\4.0\cbdicom\*.*"

call "c:\dicomvcl\DicomVCL\_clean.bat"

echo clear demo folder please. now build install pak
pause

"C:\Program Files\Inno Setup 5\Compil32.exe"  /cc  "c:\dicomvcl\DicomVCL\Setup\DicomEasyCB2K6.iss"
del E:\D\DicomVCL_CB2006.exe 
copy c:\Setup\DicomVCL_CB2006.exe E:\D\DicomVCL_CB2006.exe 

pause