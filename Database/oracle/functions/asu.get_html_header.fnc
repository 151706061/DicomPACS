DROP FUNCTION ASU.GET_HTML_HEADER
/

--
-- GET_HTML_HEADER  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_HTML_HEADER" (pFL_LANDSCAPE IN NUMBER:=1,pFL_FRAME IN NUMBER:=1)
  RETURN  VARCHAR2 IS
  str VARCHAR2(1000);
BEGIN
  IF pFL_LANDSCAPE=1 THEN
    str:=' <html xmlns:x="urn:schemas-microsoft-com:office:excel"> '||
        ' <head> '||
        ' <meta http-equiv=Content-Type content="text/html; charset=windows-1251"> '||
        ' <style> '||
        ' <!-- ';
    IF pFL_FRAME=1 THEN
      str:=str||' .sm_td {width:119.6pt;border:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt} ' ||
        ' .sm_table{border-collapse:collapse;border:none;mso-border-alt:solid windowtext .5pt;mso-padding-alt:0cm 5.4pt 0cm 5.4pt} ';
    ELSE
      str:=str||' .sm_td {width:119.6pt;border:none windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt} ' ||
        ' .sm_table{border-collapse:collapse;border:none;mso-border-alt:none windowtext .5pt;mso-padding-alt:0cm 5.4pt 0cm 5.4pt} ';
    END IF;
      str:=str||' @page  '||
        ' { mso-page-orientation:landscape; '||
        ' margin:.5in .2in .5in .2in; '||
        ' mso-header-margin:.5in; '||
        ' mso-footer-margin:.5in;}  '||
        ' @page Section1  '||
        ' { mso-page-orientation:landscape;  '||
        '   size:841.9pt 595.3pt; }  '||
        ' div.Section1  '||
        ' {page:Section1;} '||
        ' --> '||
        ' </style> '||
        ' <xml> '||
        '  <x:ExcelWorkbook> '||
        '   <x:ExcelWorksheets> '||
        '    <x:ExcelWorksheet> '||
        '     <x:WorksheetOptions> '||
        '      <x:Print> '||
        '       <x:ValidPrinterInfo/> '||
        '      </x:Print> '||
        '     </x:WorksheetOptions> '||
        '    </x:ExcelWorksheet> '||
        '   </x:ExcelWorksheets> '||
        '  </x:ExcelWorkbook> '||
        ' </xml> '||
        ' </head> ';
  ELSE
    str:=' <html xmlns:x="urn:schemas-microsoft-com:office:excel"> '||
        ' <head> '||
        ' <meta http-equiv=Content-Type content="text/html; charset=windows-1251"> '||
        ' <style> '||
        ' <!-- ';
    IF pFL_FRAME=1 THEN
      str:=str||' .sm_td {width:119.6pt;border:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt} ' ||
        ' .sm_table{border-collapse:collapse;border:none;mso-border-alt:solid windowtext .5pt;mso-padding-alt:0cm 5.4pt 0cm 5.4pt} ';
    ELSE
      str:=str||' .sm_td {width:119.6pt;border:none windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt} ' ||
        ' .sm_table{border-collapse:collapse;border:none;mso-border-alt:none windowtext .5pt;mso-padding-alt:0cm 5.4pt 0cm 5.4pt} ';
    END IF;
    str:=str||' @page  '||
        ' {  }  '||
        ' @page Section1  '||
        ' {  '||
        '  }  '||
        ' div.Section1  '||
        ' {page:Section1;} '||
        ' --> '||
        ' </style> '||
        ' <xml> '||
        '  <x:ExcelWorkbook> '||
        '   <x:ExcelWorksheets> '||
        '    <x:ExcelWorksheet> '||
        '     <x:WorksheetOptions> '||
        '      <x:Print> '||
        '       <x:ValidPrinterInfo/> '||
        '      </x:Print> '||
        '     </x:WorksheetOptions> '||
        '    </x:ExcelWorksheet> '||
        '   </x:ExcelWorksheets> '||
        '  </x:ExcelWorkbook> '||
        ' </xml> '||
        ' </head> ';
  END IF;
  RETURN str;
END; -- Function GET_HTML_HEADER
/

SHOW ERRORS;


