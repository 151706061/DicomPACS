DROP FUNCTION ASU.GET_HTML_HEADERV
/

--
-- GET_HTML_HEADERV  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_HTML_HEADERV" (pFL_LANDSCAPE IN NUMBER:=1)
  RETURN  VARCHAR2 IS
BEGIN
  IF pFL_LANDSCAPE=1 THEN
    RETURN       ' <html xmlns:x="urn:schemas-microsoft-com:office:excel"> '||
        ' <head> '||
        ' <meta http-equiv=Content-Type content="text/html; charset=windows-1251"> '||
        ' <style> '||
        ' <!-- '||
        ' .sm_td {border:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt} ' ||
        ' .sm_table{border-collapse:collapse;border:none;mso-border-alt:solid windowtext .5pt;mso-padding-alt:0cm 5.4pt 0cm 5.4pt} '||
        ' @page  '||
        ' { mso-page-orientation:landscape; }  '||
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
    RETURN       ' <html xmlns:x="urn:schemas-microsoft-com:office:excel"> '||
        ' <head> '||
        ' <meta http-equiv=Content-Type content="text/html; charset=windows-1251"> '||
        ' <style> '||
        ' <!-- '||
        ' .sm_td {border:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt} ' ||
        ' .sm_table{border-collapse:collapse;border:none;mso-border-alt:solid windowtext .5pt;mso-padding-alt:0cm 5.4pt 0cm 5.4pt} '||
        ' @page  '||
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
end;
/

SHOW ERRORS;


