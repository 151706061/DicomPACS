DROP PACKAGE BODY ASU.PKG_HTML
/

--
-- PKG_HTML  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_HTML" is
  -- Private type declarations
--  type <TypeName> is <Datatype>;

  -- Private constant declarations
--  <ConstantName> constant <Datatype> := <Value>;
  -- Private variable declarations
--  <VariableName> <Datatype>;
  -- Function and procedure implementations
/*  function <FunctionName>(<Parameter> <Datatype>) return <Datatype> is
    <LocalVariable> <Datatype>;
  begin
    <Statement>;
    return(<Result>);
  end;*/
  function GET_HEAD (pTYPE in VARCHAR2,--0
                     pTITLE in VARCHAR2,-- 1
                     pP_MLEFT in VARCHAR2,-- 2
                     pP_FSIZE in VARCHAR2,-- 3
                     pP_FFAMILY in VARCHAR2,-- 4
                     pLI_MLEFT in VARCHAR2,-- 5
                     pLI_FSIZE in VARCHAR2,-- 6
                     pLI_FFAMILY in VARCHAR2,-- 7
                     pDIV_MLEFT in VARCHAR2,-- 8
                     pDIV_FSIZE in VARCHAR2,-- 9
                     pDIV_FFAMILY in VARCHAR2,-- 10
                     pPAGE_WIDTH in VARCHAR2,-- 11
                     pPAGE_HEIGHT in VARCHAR2,-- 12
                     pPAGE_ORIENTATION in VARCHAR2,-- 13
                     pPAGE_MTOP in VARCHAR2,-- 14       --!!! 4 word input in milimeters; orientation default is portrait
                     pPAGE_MRIGHT in VARCHAR2,-- 15     --!!! 4 excel in inches; default is landscape
                     pPAGE_MDOWN in VARCHAR2,-- 16      --!!! (10 mm = 39 inch & 1 inch is equal to 2.54 centimeters)
                     pPAGE_MLEFT in VARCHAR2,-- 17      --!!!
                     pTABLE_WIDTH in VARCHAR2,-- 18
                     pTABLE_BORDER in VARCHAR2,-- 19
                     pTABLE_MSBORDER in VARCHAR2,-- 20
                     pTD_TEXTALIGN in VARCHAR2,-- 21
                     pTD_VERTICALALIGN in VARCHAR2,-- 22
                     pTD_BORDER in VARCHAR2,-- 23
                     pTD_MSBORDER in VARCHAR2,-- 24
                     pTD_PTOP in VARCHAR2,-- 25
                     pTD_PRIGHT in VARCHAR2,-- 26
                     pTD_PDOWN in VARCHAR2,-- 27
                     pTD_PLEFT in VARCHAR2-- 28
                     ) return VARCHAR2 is
    cResult VARCHAR2(32767);
    cTemp VARCHAR2(32767);
  begin
    if pTYPE = 'word' then
      cTemp:='<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">'||
             '<html xmlns:o="urn:schemas-microsoft-com:office:office" '||
             'xmlns:w="urn:schemas-microsoft-com:office:word" '||
             'xmlns="http://www.w3.org/TR/REC-html40"> '||
             '<head> '||
             '<meta http-equiv=Content-Type content="text/html; charset=windows-1251"> '||
             '<meta name=ProgId content=Word.Document> ';
    elsif pTYPE = 'excel' then
      cTemp:='<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">'||
             '<html xmlns:o="urn:schemas-microsoft-com:office:office" '||
             'xmlns:x="urn:schemas-microsoft-com:office:excel" '||
             'xmlns="http://www.w3.org/TR/REC-html40"> '||
             '<head> '||
             '<meta http-equiv=Content-Type content="text/html; charset=windows-1251"> '||
             '<meta name=ProgId content=Excel.Sheet> ';
    else
      Return '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html><head><meta http-equiv="Content-Type" content="text/html; charset=windows-1251"></head>';
    end if;
    cResult:= cTemp ||
             '<title>'||pTITLE||'</title> '||
             '<style> '||
             '<!-- '||
             ' /* Style Definitions */ '||
             'p,li,div '||
             '	{mso-style-parent:""; '||
             '	margin:0mm; '||
             '	margin-bottom:.0001pt; '||
             '	font-size:12.0pt; '||
             '	font-family:Times New Roman; '||
             '	mso-fareast-font-family:Times New Roman;} '||
             'p.user '||
             '	{mso-style-parent:"p"; '||
             '	margin-left:'||NVL(pP_MLEFT,'0')||'mm; '||
             '	font-size:'||NVL(pP_FSIZE,'12.0')||'pt; '||
             '	font-family:'||NVL(pP_FFAMILY,'Times New Roman')||';} '||
             'li.user '||
             '	{mso-style-parent:"li"; '||
             '	margin-left:'||NVL(pLI_MLEFT,'0')||'mm; '||
             '	font-size:'||NVL(pLI_FSIZE,'12.0')||'pt; '||
             '	font-family:'||NVL(pLI_FFAMILY,'Times New Roman')||';} '||
             'div.user '||
             '	{mso-style-parent:"div"; '||
             '	margin-left:'||NVL(pDIV_MLEFT,'0')||'mm; '||
             '	font-size:'||NVL(pDIV_FSIZE,'12.0')||'pt; '||
             '	font-family:'||NVL(pDIV_FFAMILY,'Times New Roman')||';} '||
             'table '||
             '	{width:99.9%; '||
             '	border-collapse:collapse; '||
             '	border:none; '||
             '	mso-border-alt:solid windowtext .5pt;} '||
             'tr '||
             '	{mso-height-source:auto;} '||
             'td	'||
             '	{mso-width-source:auto; '||
             '  text-align:center; '||
             '  vertical-align:middle; '||
             '	border:solid windowtext .5pt; '||
             '	mso-border-alt:solid windowtext .5pt; '||
             '	padding:0mm 2mm 0mm 2mm;} '||
             'table.user '||
             '	{mso-style-parent:"table"; '||
             '	width:'||NVL(pTABLE_WIDTH,'99.9')||'%; '||
             '	border:'||NVL(pTABLE_BORDER,'solid windowtext .5pt')||'; '||
             '	mso-border-alt:'||NVL(pTABLE_MSBORDER,'solid windowtext .5pt')||';} '||
             'td.user '||
             '	{mso-style-parent:"td"; '||
             '  text-align:'||NVL(pTD_TEXTALIGN,'center')||'; '||
             '  vertical-align:'||NVL(pTD_VERTICALALIGN,'middle')||'; '||
             '	border:'||NVL(pTD_BORDER,'solid windowtext .5pt')||'; '||
             '	mso-border-alt:'||NVL(pTD_MSBORDER,'solid windowtext .5pt')||'; '||
             '	padding:'||NVL(pTD_PTOP,'0')||'mm '||NVL(pTD_PRIGHT,'2')||'mm '||NVL(pTD_PDOWN,'0')||'mm '||NVL(pTD_PLEFT,'2')||'mm;} '||
             'td.g '||
             '  {mso-style-parent:"td"; '||
             '  mso-rotate:0;} '||
             'td.v '||
             '  {mso-style-parent:"td"; '||
             '  mso-rotate:90;} ';
    if pTYPE = 'word' then
      cResult := cResult ||
             '@page user '||
             '	{size:'||NVL(pPAGE_WIDTH,'210')||'mm '||NVL(pPAGE_HEIGHT,'297')||'mm; '||
             '	mso-page-orientation:'||NVL(pPAGE_ORIENTATION,'portrait')||'; '||
             '	margin:'||NVL(pPAGE_MTOP,'20')||'mm '||NVL(pPAGE_MRIGHT,'20')||'mm '||NVL(pPAGE_MDOWN,'20')||'mm '||NVL(pPAGE_MLEFT,'30')||'mm;} '||
             'div.User '||
             '	{page:user;} '||
             '--> '||
             '</style> '||
             '</head> ';
    else
      cResult := cResult ||
             '@page '||
             '	{margin:'||NVL(pPAGE_MTOP,'.78')||'in '||NVL(pPAGE_MRIGHT,'.78')||'in '||NVL(pPAGE_MDOWN,'.78')||'in '||NVL(pPAGE_MLEFT,'1.17')||'in; '||
             '  mso-page-orientation:'||NVL(pPAGE_ORIENTATION,'landscape')||';} '||
             '--> '||
             '</style> '||
             '<!--[if gte mso 9]><xml> '||
             ' <x:ExcelWorkbook> '||
             '  <x:ExcelWorksheets> '||
             '   <x:ExcelWorksheet> '||
             '    <x:WorksheetOptions> '||
             '     <x:Print> '||
             '      <x:ValidPrinterInfo/> '||
             '      <x:PaperSizeIndex>9</x:PaperSizeIndex> '||
             '     </x:Print> '||
             '    </x:WorksheetOptions> '||
             '   </x:ExcelWorksheet> '||
             '  </x:ExcelWorksheets> '||
             ' </x:ExcelWorkbook> '||
             '</xml><![endif]--> '||
             '</head> ';
    end if;
    return cResult;
  end;
end PKG_HTML;
/

SHOW ERRORS;


