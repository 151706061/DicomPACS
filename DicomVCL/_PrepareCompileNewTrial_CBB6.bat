echo off
echo First Exit All Delphi
rem pause

ren DicomPack.inc  MyDicomPack.inc
ren DicomPack_TRIAL.inc DicomPack.inc

del "c:\Program Files\Borland\BDS\4.0\cbdicom\*.*" /Q
del "c:\Program Files\Borland\CBuilder6\dicom\*.*" /Q
del "c:\CodeGear\RAD Studio\5.0\cbdicom\*.*" /Q

echo "F:\Program Files\Borland\CBuilder6\Bin\Bcc32.exe"  DicomVCLCB6.bpk
ECHO change Cnscrtl.HPP comment _tolower 
echo run copytocbcicom
pause

ren DicomPack.inc DicomPack_TRIAL.inc
ren MyDicomPack.inc DicomPack.inc 

copy *.dfm "c:\Program Files\Borland\CBuilder6\dicom\*.*"
copy *.res "c:\Program Files\Borland\CBuilder6\dicom\*.*"
copy *.dcr "c:\Program Files\Borland\CBuilder6\dicom\*.*"
copy *.hpp "c:\Program Files\Borland\CBuilder6\dicom\*.*"

call "c:\dicomvcl\DicomVCL\_clean.bat"

echo clear demo folder please. now build install pak
pause

"C:\Program Files\Inno Setup 5\Compil32.exe"  /cc  "c:\dicomvcl\DicomVCL\Setup\DicomEasyCB6.iss"
del E:\D\DicomVCL_CB6.exe 
copy c:\Setup\DicomVCL_CB6.exe E:\D\DicomVCL_CB6.exe 

pause