echo off
echo First Exit All Delphi
pause

ren DicomPack.inc  MyDicomPack.inc
ren DicomPack_TRIAL.inc DicomPack.inc

del "C:\Program Files\Borland\Delphi5\dicom\*.*" /Q
del "C:\Program Files\Borland\Delphi6\dicom\*.*" /Q
del "C:\Program Files\Borland\Delphi7\dicom\*.*" /Q
del "c:\Program Files\Borland\BDS\3.0\dicom\*.*" /Q
del "c:\Program Files\Borland\BDS\4.0\dicom\*.*" /Q

"C:\Program Files\Borland\Delphi5\Bin\Dcc32.exe"  DicomVCLD5.dpk
pause

"C:\Program Files\Borland\Delphi6\Bin\Dcc32.exe"  DicomVCLD6.dpk
pause

"C:\Program Files\Borland\Delphi7\Bin\Dcc32.exe"  DicomVCLD7.dpk
pause

"C:\Program Files\Borland\BDS\3.0\Bin\Dcc32.exe"  DicomVCLD2005.dpk
pause

"C:\Program Files\Borland\BDS\4.0\Bin\Dcc32.exe"  DicomVCLD2006.dpk
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


ren DicomPack.inc DicomPack_TRIAL.inc
ren MyDicomPack.inc DicomPack.inc 

call "c:\dicomvcl\DicomVCL\_clean.bat"

pause

"C:\Program Files\Inno Setup 5\Compil32.exe"  /cc  "c:\dicomvcl\DicomVCL\Setup\DicomEasy.iss"
del E:\D\DicomVCL.exe 
copy c:\Setup\DicomVCL.exe E:\D\DicomVCL.exe 

"C:\Program Files\Inno Setup 5\Compil32.exe"  /cc  "c:\dicomvcl\DicomVCL\Setup\DicomEasyD5.iss"
del E:\D\DicomVCL_D5.exe 
copy c:\Setup\DicomVCL_D5.exe E:\D\DicomVCL_D5.exe 

"C:\Program Files\Inno Setup 5\Compil32.exe"  /cc  "c:\dicomvcl\DicomVCL\Setup\DicomEasyD6.iss"
del E:\D\DicomVCL_D6.exe 
copy c:\Setup\DicomVCL_D6.exe E:\D\DicomVCL_D6.exe 

"C:\Program Files\Inno Setup 5\Compil32.exe"  /cc  "c:\dicomvcl\DicomVCL\Setup\DicomEasyD7.iss"
del E:\D\DicomVCL_D7.exe 
copy c:\Setup\DicomVCL_D7.exe E:\D\DicomVCL_D7.exe 

"C:\Program Files\Inno Setup 5\Compil32.exe"  /cc  "c:\dicomvcl\DicomVCL\Setup\DicomEasyD2K5.iss"
del E:\D\DicomVCL_D2005.exe 
copy c:\Setup\DicomVCL_D2005.exe E:\D\DicomVCL_D2005.exe 

"C:\Program Files\Inno Setup 5\Compil32.exe"  /cc  "c:\dicomvcl\DicomVCL\Setup\DicomEasyD2K6.iss"
del E:\D\DicomVCL_D2006.exe 
copy c:\Setup\DicomVCL_D2006.exe E:\D\DicomVCL_D2006.exe 

pause