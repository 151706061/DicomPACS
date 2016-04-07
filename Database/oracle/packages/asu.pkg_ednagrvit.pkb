DROP PACKAGE BODY ASU.PKG_EDNAGRVIT
/

--
-- PKG_EDNAGRVIT  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_EDNAGRVIT" 
IS
  CURSOR cSMID(pFK_OWNER in number)
  IS
    SELECT fk_id, fc_name, level
      FROM tsmid
     WHERE fl_showanal = 1
--    and exists (select fk_id from tnazvrach where fk_smid = tsmid.fk_id)
--     START WITH fk_owner = pfk_owner
    START WITH fk_owner in (pfk_owner)
    CONNECT BY PRIOR fk_id = fk_owner;
------------------------------------------------------------------------------------------------------------------
  FUNCTION GetCountPac (pFK_SMID IN NUMBER, pFD1 IN DATE, pFD2 IN DATE, nAge1 IN NUMBER, nAge2 IN NUMBER)
    RETURN NUMBER
  IS
    CURSOR c (pFK_SMID IN NUMBER, pFD1 IN DATE, pFD2 IN DATE, nAge1 IN NUMBER, nAge2 IN NUMBER)
    IS
      SELECT COUNT (distinct treslech.fk_nazid)
        FROM tnazlech,
             (SELECT fk_id
                FROM tsmid
               START WITH fk_id = pFK_SMID
              CONNECT BY PRIOR fk_id = fk_owner) qSMID, tnazvrach, treslech, tmp_pacages
       WHERE tnazlech.fk_smid = qSMID.fk_id
         AND tnazvrach.fk_smid = tnazlech.fk_smid
         AND tnazlech.fk_nazsosid = get_vipnaz
         AND tnazlech.fk_id = treslech.fk_nazid
         AND tnazlech.fk_pacid = tmp_pacages.fk_pacid
         AND tmp_pacages.fd_vyb BETWEEN pFD1 AND pFD2
         AND tmp_pacages.fn_age BETWEEN nAge1 AND nAge2;
    result   NUMBER;
  BEGIN
    OPEN c (pFK_SMID, pFD1, pFD2, nAge1, nAge2);
    FETCH c INTO result;
    CLOSE c;
    RETURN result;
  END GetCountPac;
------------------------------------------------------------------------------------------------------------------
  FUNCTION GetCountProc (pFK_SMID IN NUMBER, pFD1 IN DATE, pFD2 IN DATE, nAge1 IN NUMBER, nAge2 IN NUMBER)
    RETURN NUMBER
  IS
    CURSOR c (pFK_SMID IN NUMBER, pFD1 IN DATE, pFD2 IN DATE, nAge1 IN NUMBER, nAge2 IN NUMBER)
    IS
      SELECT COUNT (treslech.fk_id)
        FROM tnazlech,
             (SELECT fk_id
                FROM tsmid
               START WITH fk_id = pFK_SMID
              CONNECT BY PRIOR fk_id = fk_owner) qSMID, tnazvrach, treslech, tmp_pacages
       WHERE tnazlech.fk_smid = qSMID.fk_id
         AND tnazvrach.fk_smid = tnazlech.fk_smid
         AND tnazlech.fk_nazsosid = get_vipnaz
         AND tnazlech.fk_id = treslech.fk_nazid
         AND tnazlech.fk_pacid = tmp_pacages.fk_pacid
         AND tmp_pacages.fd_vyb BETWEEN pFD1 AND pFD2
         AND tmp_pacages.fn_age BETWEEN nAge1 AND nAge2;
    result   NUMBER;
  BEGIN
    OPEN c (pFK_SMID, pFD1, pFD2, nAge1, nAge2);
    FETCH c INTO result;
    CLOSE c;
    RETURN result;
  END GetCountProc;
------------------------------------------------------------------------------------------------------------------
  FUNCTION DoEdNagrVit (pFD1 IN DATE, pFD2 IN DATE)
    RETURN CLOB
  IS
    cl           CLOB;
    nChilds      NUMBER;
    nOutPeriod   NUMBER;
    sTmp varchar2(32767);
    nRow integer :=0;
    nPerv integer;
    nVTOR integer;
    nPervChild integer;
    nVTORChild integer;
  BEGIN
    PROGRESS_BAR.SetMinValue(0);
    for i in cSMID(get_procid) loop
      nRow:=nRow+1;
    end loop;
    PROGRESS_BAR.SetMaxValue(nRow+20);
    nRow:=1;
    PROGRESS_BAR.SetStrOut('Расчет сроков выбытия и возрастов пациентов');
    PROGRESS_BAR.StepIt(0);
    nOutPeriod  := NVL(GET_COUNT_OUT_PERIOD (pFD1, pFD2),0);
    nChilds     := PKG_SMINI.READSTRING ('CONFIG', 'N_CHILDBEFORE', 18);
    mkb10.prepare_agetable;
    PROGRESS_BAR.StepIt(20);
    DBMS_LOB.createtemporary (cl, TRUE, 3);
    sTmp:=
          '<html xmlns:o="urn:schemas-microsoft-com:office:office"'||
          'xmlns:x="urn:schemas-microsoft-com:office:excel"'||
          'xmlns="http://www.w3.org/TR/REC-html40">'||
          '<head>'||
          '<meta http-equiv=Content-Type content="text/html; charset=windows-1251">'||
          '<meta name=ProgId content=Excel.Sheet>'||
          '<meta name=Generator content="Microsoft Excel 10">'||
          '<title>Отчет по отпущенным процедурам</title>'||
          '<!--[if gte mso 9]><xml>'||
          ' <o:DocumentProperties>'||
          '  <o:LastAuthor>Sobjanin</o:LastAuthor>'||
          ' </o:DocumentProperties>'||
          ' <o:OfficeDocumentSettings>'||
          '  <o:DownloadComponents/>'||
          ' </o:OfficeDocumentSettings>'||
          '</xml><![endif]-->'||
          '<style>'||
          '<!--table'||
          '        {mso-displayed-decimal-separator:"\,";'||
          '        mso-displayed-thousand-separator:" ";}'||
          '@page'||
          '        {margin:.98in .79in .98in .79in;'||
          '        mso-header-margin:.5in;'||
          '        mso-footer-margin:.5in;'||
          '        mso-page-orientation:landscape;}'||
          'tr'||
          '        {mso-height-source:auto;}'||
          'col'||
          '        {mso-width-source:auto;}'||
          'br'||
          '        {mso-data-placement:same-cell;}'||
          '.style0'||
          '        {mso-number-format:General;'||
          '        text-align:general;'||
          '        vertical-align:bottom;'||
          '        white-space:nowrap;'||
          '        mso-rotate:0;'||
          '        mso-background-source:auto;'||
          '        mso-pattern:auto;'||
          '        color:windowtext;'||
          '        font-weight:400;'||
          '        font-style:normal;'||
          '        text-decoration:none;'||
          '        font-family:"Arial Cyr";'||
          '        mso-generic-font-family:auto;'||
          '        mso-font-charset:204;'||
          '        border:none;'||
          '        mso-protection:locked visible;'||
          '        mso-style-name:Обычный;'||
          '        mso-style-id:0;}'||
          'td     {mso-style-parent:style0;'||
          '        padding-top:1px;'||
          '        padding-right:1px;'||
          '        padding-left:1px;'||
          '        mso-ignore:padding;'||
          '        color:windowtext;'||
          '        font-weight:400;'||
          '        font-style:normal;'||
          '        text-decoration:none;'||
          '        font-family:"Arial Cyr";'||
          '        mso-generic-font-family:auto;'||
          '        mso-font-charset:204;'||
          '        mso-number-format:General;'||
          '        text-align:general;'||
          '        vertical-align:bottom;'||
          '        border:none;'||
          '        mso-background-source:auto;'||
          '        mso-pattern:auto;'||
          '        mso-protection:locked visible;'||
          '        white-space:nowrap;'||
          '        mso-rotate:0;}'||
          '.xl24   {mso-style-parent:style0;'||
          '        color:black;'||
          '        background:white;'||
          '        mso-pattern:auto none;}'||
          '.xl25   {mso-style-parent:style0;'||
          '        color:black;'||
          '        background:white;'||
          '        mso-pattern:auto none;'||
          '        white-space:normal;}'||
          '.xl26   {mso-style-parent:style0;'||
          '        color:black;'||
          '        text-align:center;'||
          '        vertical-align:middle;'||
          '        border-top:none;'||
          '        border-right:.5pt solid windowtext;'||
          '        border-bottom:.5pt solid windowtext;'||
          '        border-left:.5pt solid windowtext;'||
          '        background:silver;'||
          '        mso-pattern:auto none;'||
          '        white-space:normal;}'||
          '.xl27  {mso-style-parent:style0;'||
          '        color:black;'||
          '        text-align:center;'||
          '        vertical-align:middle;'||
          '        border-top:none;'||
          '        border-right:.5pt solid windowtext;'||
          '        border-bottom:.5pt solid windowtext;'||
          '        border-left:none;'||
          '        background:silver;'||
          '        mso-pattern:auto none;'||
          '        white-space:normal;}'||
          '.xl28   {mso-style-parent:style0;'||
          '        color:black;'||
          '        font-weight:700;'||
          '        font-family:"Times New Roman", serif;'||
          '        mso-font-charset:204;'||
          '        text-align:center;'||
          '        background:white;'||
          '        mso-pattern:auto none;}'||
          '.xl29  {mso-style-parent:style0;'||
          '        color:black;'||
          '        font-weight:700;'||
          '        font-family:"Times New Roman", serif;'||
          '        mso-font-charset:204;'||
          '        text-align:center;'||
          '        border-top:none;'||
          '        border-right:none;'||
          '        border-bottom:.5pt solid windowtext;'||
          '        border-left:none;'||
          '        background:white;'||
          '        mso-pattern:auto none;}'||
          '.xl30  {mso-style-parent:style0;'||
          '        color:black;'||
          '        font-weight:700;'||
          '        font-family:"Times New Roman", serif;'||
          '        mso-font-charset:204;'||
          '        text-align:center;'||
          '        border-top:.5pt solid windowtext;'||
          '        border-right:.5pt solid windowtext;'||
          '        border-bottom:none;'||
          '        border-left:.5pt solid windowtext;'||
          '        background:white;'||
          '        mso-pattern:auto none;'||
          '        white-space:normal;}'||
          '.xl31   {mso-style-parent:style0;'||
          '        color:black;'||
          '        font-weight:700;'||
          '        font-family:"Times New Roman", serif;'||
          '        mso-font-charset:204;'||
          '        text-align:center;'||
          '        border-top:none;'||
          '        border-right:.5pt solid windowtext;'||
          '        border-bottom:.5pt solid windowtext;'||
          '        border-left:.5pt solid windowtext;'||
          '        background:white;'||
          '        mso-pattern:auto none;'||
          '        white-space:normal;}'||
          '.xl32   {mso-style-parent:style0;'||
          '        color:black;'||
          '        font-weight:700;'||
          '        font-family:"Times New Roman", serif;'||
          '        mso-font-charset:204;'||
          '        border-top:.5pt solid windowtext;'||
          '        border-right:.5pt solid windowtext;'||
          '        border-bottom:none;'||
          '        border-left:.5pt solid windowtext;'||
          '        background:white;'||
          '        mso-pattern:auto none;'||
          '        white-space:normal;}'||
          '.xl33   {mso-style-parent:style0;'||
          '        color:black;'||
          '        font-weight:700;'||
          '        font-family:"Times New Roman", serif;'||
          '        mso-font-charset:204;'||
          '        border-top:none;'||
          '        border-right:.5pt solid windowtext;'||
          '        border-bottom:.5pt solid windowtext;'||
          '        border-left:.5pt solid windowtext;'||
          '        background:white;'||
          '        mso-pattern:auto none;'||
          '        white-space:normal;}'||
          '.xl34  {mso-style-parent:style0;'||
          '        color:black;'||
          '        text-align:right;'||
          '        background:white;'||
          '        mso-pattern:auto none;}'||
          'h1 {font-size: 12px; font-weight: bold;   font-family: "Times New Roman", Times, serif; font-style: normal; line-height: normal;margin-top:0cm;margin-bottom:0cm;}'||
          'h2 {font-size: 12px; font-weight: normal; font-family: "Times New Roman", Times, serif; font-style: normal; line-height: normal;margin-top:0cm;margin-bottom:0cm;}'||
          'h3 {font-size: 11px; font-weight: normal; font-family: "Times New Roman", Times, serif; font-style: normal; line-height: normal;margin-top:0cm;margin-bottom:0cm;}'||
          'h4 {font-size: 10px; font-weight: normal; font-family: "Times New Roman", Times, serif; font-style: normal; line-height: normal;margin-top:0cm;margin-bottom:0cm;}'||
          '--></style><!--[if gte mso 9]><xml>'||
          ' <x:ExcelWorkbook>'||
          '  <x:ExcelWorksheets>'||
          '   <x:ExcelWorksheet>'||
          '    <x:Name>ednagrvit</x:Name>'||
          '    <x:WorksheetOptions>'||
          '     <x:FitToPage/>'||
          '     <x:FitToPage/>'||
          '     <x:Print>'||
          '      <x:FitHeight>1000</x:FitHeight>'||
          '      <x:ValidPrinterInfo/>'||
          '      <x:PaperSizeIndex>9</x:PaperSizeIndex>'||
          '     </x:Print>'||
          '     <x:Selected/>'||
          '     <x:DoNotDisplayGridlines/>'||
          '     <x:Panes>'||
          '      <x:Pane>'||
          '       <x:Number>3</x:Number>'||
          '       <x:ActiveCol>5</x:ActiveCol>'||
          '       <x:RangeSelection>$F$1:$H$1</x:RangeSelection>'||
          '      </x:Pane>'||
          '     </x:Panes>'||
          '     <x:ProtectContents>False</x:ProtectContents>'||
          '     <x:ProtectObjects>False</x:ProtectObjects>'||
          '     <x:ProtectScenarios>False</x:ProtectScenarios>'||
          '    </x:WorksheetOptions>'||
          '   </x:ExcelWorksheet>'||
          '  </x:ExcelWorksheets>'||
          '  <x:WindowHeight>10170</x:WindowHeight>'||
          '  <x:WindowWidth>13020</x:WindowWidth>'||
          '  <x:WindowTopX>720</x:WindowTopX>'||
          '  <x:WindowTopY>270</x:WindowTopY>'||
          '  <x:ProtectStructure>False</x:ProtectStructure>'||
          '  <x:ProtectWindows>False</x:ProtectWindows>'||
          ' </x:ExcelWorkbook>'||
          '</xml><![endif]-->'||
          '</head>'||
          '<body link=blue vlink=purple class=xl24>'||
          '<table x:str border=0 cellpadding=0 cellspacing=0 width=903 style=''border-collapse:collapse;table-layout:fixed;width:678pt''>'||
          '  <col class=xl24 width=75 style=''mso-width-source:userset;mso-width-alt:2742; width:56pt''> '||
          '   <col class=xl24 width=327 style=''mso-width-source:userset;mso-width-alt:11958;width:245pt''>'||
          '  <col class=xl24 width=80 style=''mso-width-source:userset;mso-width-alt:2925;width:60pt''> '||
          '  <col class=xl24 width=84 style=''mso-width-source:userset;mso-width-alt:3072;width:63pt''> '||
          '  <col class=xl24 width=78 style=''mso-width-source:userset;mso-width-alt:2852;width:59pt''> '||
          '  <col class=xl24 width=58 style=''mso-width-source:userset;mso-width-alt:2121;width:44pt''> '||
          '  <col class=xl24 width=110 style=''mso-width-source:userset;mso-width-alt:4022;width:83pt''> '||
          '  <col class=xl24 width=91 style=''mso-width-source:userset;mso-width-alt:3328;width:68pt''> '||
          '  <tr> '||
          '    <td height=17 class=xl24 style=''width:56pt'' width="72">&nbsp;</td>'||
          '    <td class=xl24 width=304 style=''width:245pt''>&nbsp;</td>'||
          '    <td class=xl24 width=102 style=''width:60pt''>&nbsp;</td>'||
          '    <td class=xl24 width=96 style=''width:63pt''>&nbsp;</td>'||
          '    <td class=xl24 width=81 style=''width:59pt''>&nbsp;</td>'||
          '    <td colspan=3 class=xl34 style=''width:195pt''>FC_CLIENT</td>'||
          '  </tr>'||
          '  <tr> '||
          '    <td colspan=8 class=xl28 height="39">Oтчет по отпущенным процедурам за FC_DATE</td>'||
          '  </tr>'||
          '  <tr> '||
          '    <td colspan=8 class=xl29 height="27"> '||
          '      <p><font size="4">(пролечено FN_TOTALPAC)</font></p>'||
          '      <p>&nbsp;</p>'||
          '    </td>'||
          '  </tr>'||
          '  <tr class=xl25> '||
          '    <td height=60 class=xl26 style=''width:56pt'' width="72">№п.п.</td>'||
          '    <td class=xl27 width=304 style=''width:245pt''>Отпускаемые процедуры</td>'||
          '    <td class=xl27 width=122 style=''width:65pt''>Первичные чел.</td>'||
          '    <td class=xl27 width=96 style=''width:63pt''>Повторные (чел.)</td>'||
          '    <td class=xl27 width=81 style=''width:59pt''>Всего процедур</td>'||
          '    <td class=xl27 width=39 style=''width:44pt''>ФТ Ед.</td>'||
          '    <td class=xl27 width=108 style=''width:83pt''>Процедур на 1 чел</td>'||
          '    <td class=xl27 width=108 style=''width:68pt''>% охвата видом лечения</td>'||
          '  </tr>';
    sTmp:=replace(sTmp, 'FC_CLIENT',PKG_SMINI.READSTRING ('MANAGER_DOC', 'CLIENT_NAME', 18));
    sTmp:=replace(sTmp, 'FN_TOTALPAC',nOutPeriod);
    sTmp:=replace(sTmp, 'FC_DATE', get_decodedperiod(pFD1, pFD2));
    dbms_lob.writeappend(cl, Length(sTmp), sTmp);
    for i in cSMID(get_procid) loop
      nPerv :=GetCountPac(i.fk_id, pFD1, pFD2, nChilds, 2000);
      nPervChild :=GetCountPac(i.fk_id, pFD1, pFD2, 0, nChilds-0.00000000000000001);
      nVTOR :=GetCountProc(i.fk_id, pFD1, pFD2, nChilds, 2000);
      nVTORChild :=GetCountProc(i.fk_id, pFD1, pFD2, 0, nChilds-0.00000000000000001);
      PROGRESS_BAR.SetStrOut(substr('Обработка: '||i.fc_name, 1, 99));
      PROGRESS_BAR.StepIt;
      sTmp:=
            '  <tr style=''mso-height-source:userset;''> '||
            '    <td class=xl30 width=72 style=''border-bottom:.5pt solid black;border-top:none;width:56pt''><LEVEL>FN_ROW</LEVEL></td>'||
            '    <td class=xl32 width=304 style=''border-bottom:.5pt solid black;border-top:none;width:245pt''><LEVEL>FC_PROC</LEVEL></td>'||
            '    <td class=xl30 width=102 style=''border-bottom:.5pt solid black;border-top:none;width:60pt''><LEVEL>FN_PERV</LEVEL></td>'||
            '    <td class=xl30 width=96 style=''border-bottom:.5pt solid black;border-top:none;width:63pt''><LEVEL>FN_VTOR</LEVEL></td>'||
            '    <td class=xl30 width=81 style=''border-bottom:.5pt solid black;border-top:none;width:59pt''><LEVEL>FN_PROC</LEVEL></td>'||
            '    <td class=xl30 width=39 style=''border-bottom:.5pt solid black;border-top:none;width:44pt''><LEVEL>FN_ED</LEVEL></td>'||
            '    <td class=xl30 width=108 style=''border-bottom:.5pt solid black;border-top:none;width:83pt''><LEVEL>FN_PERMEN</LEVEL></td>'||
            '    <td class=xl30 width=108 style=''border-bottom:.5pt solid black;border-top:none;width:68pt''><LEVEL>FN_OHVAT</LEVEL></td></tr>';
            sTmp:=replace(sTmp, 'FN_ROW', nRow);
            sTmp:=replace(sTmp, 'FC_PROC', i.fc_name);
            sTmp:=replace(sTmp, 'LEVEL', 'h'||i.level);
            if (nPerv+nPervChild) is not null or
               nPerv+nPervChild!=0
            then
              sTmp:=replace(sTmp, 'FN_PERV', nPerv+nPervChild);
            else
              sTmp:=replace(sTmp, 'FN_PERV', '&nbsp;');
            end if;
            if nVTOR+nVTORChild is not null or
               nVTOR+nVTORChild!=0
            then
              sTmp:=replace(sTmp, 'FN_VTOR', nVTOR+nVTORChild);
            else
              sTmp:=replace(sTmp, 'FN_VTOR', '&nbsp;');
            end if;
            if nPerv+nPervChild+nVTOR+nVTORChild is not null or
               nPerv+nPervChild+nVTOR+nVTORChild!=0
            then
              sTmp:=replace(sTmp, 'FN_PROC', nPerv+nPervChild+nVTOR+nVTORChild);
            else
              sTmp:=replace(sTmp, 'FN_PROC', '&nbsp;');
            end if;
            if (pkg_smid.get_edchild(i.fk_id) is not null and
               pkg_smid.get_edchild(i.fk_id)<>0) or (pkg_smid.get_ed(i.fk_id) is not null and
               pkg_smid.get_ed(i.fk_id)<>0)
            then
              sTmp:=replace(sTmp, 'FN_ED', (nPervChild+nVTORChild)*pkg_smid.get_edchild(i.fk_id)+(nPerv+nVTOR)*pkg_smid.get_ed(i.fk_id));
            else
              sTmp:=replace(sTmp, 'FN_ED', '&nbsp;');
            end if;
            if (nPerv+nPervChild+nVTOR+nVTORChild) is not null and
               (nPerv+nPervChild+nVTOR+nVTORChild) <> 0
            then
              sTmp:=replace(sTmp, 'FN_PERMEN', to_char((nPerv+nPervChild+nVTOR+nVTORChild)/(nPerv+nPervChild), 'FM99990.09'));
              sTmp:=replace(sTmp, 'FN_OHVAT', to_char(100*(nPerv+nPervChild+nVTOR+nVTORChild)/nOutPeriod, 'FM99990.09'));
            else
              sTmp:=replace(sTmp, 'FN_PERMEN', '&nbsp;');
              sTmp:=replace(sTmp, 'FN_OHVAT', '&nbsp;');
            end if;
           nRow:=nRow+1;
    dbms_lob.writeappend(cl, Length(sTmp), sTmp);
    end loop i;
    sTmp:=
        '  <tr> </tr><![if supportMisalignedColumns]> '||
        '  <tr height=0 style=''display:none''>  '||
        '    <td width=72 style=''width:56pt''></td> '||
        '    <td width=304 style=''width:245pt''></td> '||
        '    <td width=102 style=''width:60pt''></td> '||
        '    <td width=96 style=''width:63pt''></td> '||
        '    <td width=81 style=''width:59pt''></td> '||
        '    <td width=39 style=''width:44pt''></td> '||
        '    <td width=108 style=''width:83pt''></td> '||
        '    <td width=108 style=''width:68pt''></td> '||
        '  </tr><![endif]></table></body></html>';
    dbms_lob.writeappend(cl, Length(sTmp), sTmp);
    RETURN cl;
  END DoEdNagrVit;
END;-- Package Body PKG_EDNAGRVIT
/

SHOW ERRORS;


