DROP PACKAGE BODY ASU.PKG_MEDVYDTOTAL
/

--
-- PKG_MEDVYDTOTAL  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_MEDVYDTOTAL" 
IS
--
-- Purpose: Отчет о кол-ве медикаментов израсходованных МО за период
-- Sobjanin A.A. sobjanin_alex@chat.ru
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  ------------------------------------------
-- Sam          27.09.2001
  CURSOR cPostavshikTMP
  IS
    SELECT *
      FROM tresmedpostavshik_tmp
     WHERE fl_need = 1;
  CURSOR cUchGr
  IS
    SELECT distinct ug.FK_ID, ug.FC_NAME
      FROM ASU.TUCHGR ug, ASU.TRESMEDVYDTOTAL_TMP rmvt, ASU.TMEDKART mk, ASU.TMEDIC m
     WHERE (    ug.FK_ID = m.FK_UCHGRID
            AND mk.FK_ID = rmvt.FK_MEDKARTID
            AND m.FK_ID = mk.FK_MEDICID)
     ORDER BY ug.fc_name;
  CURSOR cMedKart (pfk_uchgrid IN NUMBER)
  IS
    SELECT distinct rmvt.fk_medkartid, rmvt.fc_name, rmvt.fc_serial, pkgtedizm.getnamebyid ( (pkgmedkart.getuchedizm (fk_medicid))) AS fc_edizm
      FROM tresmedvydtotal_tmp rmvt
     WHERE rmvt.fk_uchgrid = pfk_uchgrid;
  CURSOR cNapr
  IS
    SELECT DISTINCT n.fk_id, n.fc_name
      FROM tnapr n, TRESMEDVYDTOTAL_TMP rmvt
     WHERE rmvt.fk_naprid = n.fk_id;
-----------------------------------------------------------------------------------------------------------------------
  PROCEDURE PopulateTempTable (pFD1 IN DATE, pFD2 IN DATE)
  IS
  BEGIN
    DELETE
      FROM tresmedvydtotal_tmp;
    INSERT INTO tresmedvydtotal_tmp
                (fn_kol, fk_medkartid, fk_naprid, fc_name, fc_serial, fk_medicid, fk_uchgrid)
      SELECT SUM (rmc.fn_kol) AS fn_kol, fk_medkartid, rm.fk_naprid, mk.fc_name, mk.fc_serial, mk.fk_medicid, m.fk_uchgrid
        FROM tresmedcont rmc, tresmed rm, tmedkart mk, tmedic m, tresmedpostavshik_tmp, tresmedmedic_tmp rmm
       WHERE rm.fk_id = rmc.fk_resmedid
         AND rm.fd_data BETWEEN pFD1 AND pFD2
         AND mk.fk_id = rmc.fk_medkartid
         AND rm.fk_apostavshikid = tresmedpostavshik_tmp.fk_id
         AND tresmedpostavshik_tmp.fl_need = 1
         AND m.fk_id = mk.fk_medicid
         AND rmm.fk_id = m.fk_id
         AND rmc.fk_medicid = rmm.fk_id
         AND rmm.fl_need = 1
       GROUP BY rmc.fk_medkartid, rm.fk_naprid, mk.fc_name, mk.fc_serial, mk.fk_medicid, m.fk_uchgrid;
  END PopulateTempTable;
-----------------------------------------------------------------------------------------------------------------------
  FUNCTION GetKol (pfk_medkartid IN NUMBER, pfk_naprid IN NUMBER)
    RETURN NUMBER
  IS
    CURSOR c (pfk_medkartid IN NUMBER, pfk_naprid IN NUMBER)
    IS
      SELECT FN_KOL
        FROM TRESMEDVYDTOTAL_TMP
       WHERE (    FK_NAPRID = pFK_NAPRID
              AND FK_MEDKARTID = pFK_MEDKARTID);
    result   NUMBER;
  BEGIN
    OPEN c (pfk_medkartid, pfk_naprid);
    FETCH c INTO result;
    CLOSE c;
    RETURN NVL (result, 0);
  END GetKol;
-----------------------------------------------------------------------------------------------------------------------
  FUNCTION Do_MedVydTotal (pFD1 IN DATE, pFD2 IN DATE)
    RETURN CLOB
  IS
    cl          CLOB;
    aNaprID     TNaprFK_ID;
    aNaprNAME   TNaprFC_NAME;
    sTmp        VARCHAR2 (32767);
    nTmp        NUMBER (9, 3);
    nSum        NUMBER (9, 3);
    i           BINARY_INTEGER;
  BEGIN
    return pkg_medlogtotal.do_medvydtotal(pfd1,pfd2);
    progress_bar.SetMinValue (0);
    progress_bar.SetMaxValue (7);
    progress_bar.setStrOut ('Определение перечня медикаментов входящих в отчет');
    progress_bar.stepit (0);
    pkg_medvyd.SelectMedic;
    progress_bar.stepit (5);
    progress_bar.setStrOut ('Формирование отчета');
    PopulateTempTable (pFD1, pFD2);
    progress_bar.stepit (0);
    DBMS_LOB.createtemporary (cl, TRUE, 2);
    OPEN cNapr;
    FETCH cNapr BULK COLLECT INTO aNaprID, aNaprName;
    CLOSE cNapr;
    sTmp  :=
      '<html xmlns:o="urn:schemas-microsoft-com:office:office"xmlns:x="urn:schemas-microsoft-com:office:excel"xmlns="http://www.w3.org/TR/REC-html40"> ' || '<head> ' ||
        '<meta http-equiv=Content-Type content="text/html; charset=windows-1251"> ' ||
        '<meta name=Generator content="Microsoft Excel 10"> ' ||
        '<meta name=ProgId content=Excel.Sheet> ' ||
        '<title>Расход медикамнтов</title> ' ||
        '<!--[if gte mso 9]><xml> <o:DocumentProperties>  <o:LastAuthor>Sobjanin A.A.</o:LastAuthor> </o:DocumentProperties></xml><![endif]--> ' ||
        '<style><!--table ' ||
        '{mso-displayed-decimal-separator:"\,";mso-displayed-thousand-separator:" ";} ' ||
        '@page{MSO-HEADER-MSO-FOOTER-MSO-PAGE-ORIENTATION:LANDSCAPE;} ' ||
        'TR      {MSO-HEIGHT-SOURCE:AUTO;} ' ||
        'COL     {MSO-WIDTH-SOURCE:AUTO;} ' ||
        'BR      {MSO-DATA-PLACEMENT:SAME-CELL;} ' ||
        '.STYLE0{MSO-NUMBER-FORMAT:GENERAL;TEXT-ALIGN:GENERAL;VERTICAL-ALIGN:BOTTOM;WHITE-SPACE:NOWRAP;MSO-ROTATE:0;MSO-BACKGROUND-SOURCE:AUTO;MSO-PATTERN:AUTO;COLOR:WINDOWTEXT;FONT-SIZE:10.0PT; ' ||
        '        FONT-WEIGHT:400;FONT-STYLE:NORMAL;TEXT-DECORATION:NONE;FONT-FAMILY:"ARIAL CYR";MSO-GENERIC-FONT-FAMILY:AUTO;MSO-FONT-CHARSET:204;BORDER:NONE;MSO-PROTECTION:LOCKED VISIBLE;MSO-STYLE-NAME:Обычный;MSO-STYLE-ID:0;} ' ||
        'TD      {MSO-STYLE-PARENT:STYLE0;PADDING-TOP:1PX;PADDING-RIGHT:1PX;PADDING-LEFT:1PX;MSO-IGNORE:PADDING;COLOR:WINDOWTEXT;FONT-SIZE:10.0PT;FONT-WEIGHT:400;FONT-STYLE:NORMAL;TEXT-DECORATION:NONE;FONT-FAMILY:"ARIAL CYR"; ' ||
        '        MSO-GENERIC-FONT-FAMILY:AUTO;MSO-FONT-CHARSET:204;MSO-NUMBER-FORMAT:GENERAL;TEXT-ALIGN:GENERAL;VERTICAL-ALIGN:BOTTOM;BORDER:NONE;MSO-BACKGROUND-SOURCE:AUTO;MSO-PATTERN:AUTO; ' ||
        '        MSO-PROTECTION:LOCKED VISIBLE;WHITE-SPACE:NOWRAP;MSO-ROTATE:0;} ' ||
        '.XL24   {MSO-STYLE-PARENT:STYLE0;COLOR:BLACK;BACKGROUND:WHITE;MSO-PATTERN:AUTO NONE;} ' ||
        '.XL25   {MSO-STYLE-PARENT:STYLE0;COLOR:BLACK;FONT-SIZE:14.0PT;BACKGROUND:WHITE;MSO-PATTERN:AUTO NONE;} ' ||
        '.XL26   {MSO-STYLE-PARENT:STYLE0;COLOR:BLACK;BACKGROUND:WHITE;MSO-PATTERN:AUTO NONE;WHITE-SPACE:NORMAL;} ' ||
        '.XL27   {MSO-STYLE-PARENT:STYLE0;COLOR:BLACK;TEXT-ALIGN:CENTER;BORDER-TOP:NONE;BORDER-RIGHT:.5PT SOLID BLACK;BORDER-BOTTOM:.5PT SOLID BLACK;BORDER-LEFT:.5PT SOLID BLACK; ' ||
        '        BACKGROUND:WHITE;MSO-PATTERN:AUTO NONE;WHITE-SPACE:NORMAL;} ' ||
        '.XL28   {MSO-STYLE-PARENT:STYLE0;COLOR:BLACK;BORDER-TOP:NONE;BORDER-RIGHT:.5PT SOLID BLACK;BORDER-BOTTOM:.5PT SOLID BLACK;BORDER-LEFT:.5PT SOLID WINDOWTEXT; ' ||
        '        BACKGROUND:WHITE;MSO-PATTERN:AUTO NONE;WHITE-SPACE:NORMAL;} ' ||
        '.XL29   {MSO-STYLE-PARENT:STYLE0;COLOR:BLACK;TEXT-ALIGN:LEFT;BORDER-TOP:NONE;BORDER-RIGHT:.5PT SOLID BLACK;BORDER-BOTTOM:.5PT SOLID BLACK;BORDER-LEFT:.5PT SOLID BLACK; ' ||
        '        BACKGROUND:WHITE;MSO-PATTERN:AUTO NONE;WHITE-SPACE:NORMAL;} ' ||
        '.XL30   {MSO-STYLE-PARENT:STYLE0;COLOR:BLACK;TEXT-ALIGN:CENTER;BORDER-TOP:NONE;BORDER-RIGHT:.5PT SOLID WINDOWTEXT;BORDER-BOTTOM:.5PT SOLID BLACK; ' ||
        '        BORDER-LEFT:.5PT SOLID BLACK;BACKGROUND:WHITE;MSO-PATTERN:AUTO NONE;WHITE-SPACE:NORMAL;} ' ||
        '.XL31   {MSO-STYLE-PARENT:STYLE0;FONT-WEIGHT:700;TEXT-ALIGN:CENTER;VERTICAL-ALIGN:MIDDLE;BORDER-TOP:.5PT SOLID WINDOWTEXT;BORDER-RIGHT:.5PT SOLID WINDOWTEXT; ' ||
        '        BORDER-BOTTOM:NONE;BORDER-LEFT:.5PT SOLID WINDOWTEXT;BACKGROUND:SILVER;MSO-PATTERN:AUTO NONE;WHITE-SPACE:NORMAL;} ' ||
        '.XL32   {MSO-STYLE-PARENT:STYLE0;COLOR:BLACK;FONT-WEIGHT:700;TEXT-ALIGN:CENTER;VERTICAL-ALIGN:MIDDLE;BORDER-TOP:.5PT SOLID WINDOWTEXT;BORDER-RIGHT:.5PT SOLID BLACK; ' ||
        '        BORDER-BOTTOM:NONE;BORDER-LEFT:NONE;BACKGROUND:SILVER;MSO-PATTERN:AUTO NONE;WHITE-SPACE:NORMAL;} ' ||
        '.XL33   {MSO-STYLE-PARENT:STYLE0;COLOR:BLACK;FONT-WEIGHT:700;TEXT-ALIGN:CENTER;VERTICAL-ALIGN:MIDDLE;BORDER-TOP:.5PT SOLID WINDOWTEXT;BORDER-RIGHT:.5PT SOLID BLACK; ' ||
        '        BORDER-BOTTOM:NONE;BORDER-LEFT:.5PT SOLID BLACK;BACKGROUND:SILVER;MSO-PATTERN:AUTO NONE;WHITE-SPACE:NORMAL;} ' ||
        '.XL34   {MSO-STYLE-PARENT:STYLE0;COLOR:BLACK;FONT-WEIGHT:700;TEXT-ALIGN:CENTER;VERTICAL-ALIGN:MIDDLE;BORDER-TOP:.5PT SOLID WINDOWTEXT;BORDER-RIGHT:NONE; ' ||
        '        BORDER-BOTTOM:.5PT SOLID BLACK;BORDER-LEFT:.5PT SOLID BLACK;BACKGROUND:SILVER;MSO-PATTERN:AUTO NONE;WHITE-SPACE:NORMAL;} ' ||
        '.XL35   {MSO-STYLE-PARENT:STYLE0;COLOR:BLACK;FONT-WEIGHT:700;TEXT-ALIGN:CENTER;VERTICAL-ALIGN:MIDDLE;BORDER-TOP:.5PT SOLID WINDOWTEXT;BORDER-RIGHT:.5PT SOLID BLACK; ' ||
        '        BORDER-BOTTOM:.5PT SOLID BLACK;BORDER-LEFT:NONE;BACKGROUND:SILVER;MSO-PATTERN:AUTO NONE;WHITE-SPACE:NORMAL;} ' ||
        '.XL36   {MSO-STYLE-PARENT:STYLE0;COLOR:BLACK;FONT-WEIGHT:700;TEXT-ALIGN:CENTER;VERTICAL-ALIGN:MIDDLE;BORDER-TOP:.5PT SOLID WINDOWTEXT; ' ||
        '        BORDER-RIGHT:.5PT SOLID WINDOWTEXT;BORDER-BOTTOM:NONE;BORDER-LEFT:.5PT SOLID BLACK;BACKGROUND:SILVER;MSO-PATTERN:AUTO NONE;WHITE-SPACE:NORMAL;} ' ||
        '.XL37   {MSO-STYLE-PARENT:STYLE0;FONT-WEIGHT:700;TEXT-ALIGN:CENTER;VERTICAL-ALIGN:MIDDLE;BORDER-TOP:NONE;BORDER-RIGHT:.5PT SOLID WINDOWTEXT;BORDER-BOTTOM:.5PT SOLID WINDOWTEXT; ' ||
        '        BORDER-LEFT:.5PT SOLID WINDOWTEXT;BACKGROUND:SILVER;MSO-PATTERN:AUTO NONE;WHITE-SPACE:NORMAL;} ' ||
        '.XL38   {MSO-STYLE-PARENT:STYLE0;COLOR:BLACK;FONT-WEIGHT:700;TEXT-ALIGN:CENTER;VERTICAL-ALIGN:MIDDLE;BORDER-TOP:NONE; ' ||
        '        BORDER-RIGHT:.5PT SOLID BLACK;BORDER-BOTTOM:.5PT SOLID WINDOWTEXT;BORDER-LEFT:NONE;BACKGROUND:SILVER;MSO-PATTERN:AUTO NONE;WHITE-SPACE:NORMAL;} ' ||
        '.XL39   {MSO-STYLE-PARENT:STYLE0;TEXT-ALIGN:CENTER;VERTICAL-ALIGN:MIDDLE;BORDER-TOP:NONE;BORDER-RIGHT:.5PT SOLID BLACK;BORDER-BOTTOM:.5PT SOLID WINDOWTEXT; ' ||
        '        BORDER-LEFT:.5PT SOLID BLACK;BACKGROUND:SILVER;MSO-PATTERN:AUTO NONE;WHITE-SPACE:NORMAL;} ' ||
        '.XL40   {MSO-STYLE-PARENT:STYLE0;COLOR:BLACK;FONT-WEIGHT:700;TEXT-ALIGN:CENTER;VERTICAL-ALIGN:MIDDLE;BORDER-TOP:.5PT SOLID BLACK;BORDER-RIGHT:.5PT SOLID BLACK; ' ||
        '        BORDER-BOTTOM:.5PT SOLID WINDOWTEXT;BORDER-LEFT:.5PT SOLID BLACK;BACKGROUND:SILVER;MSO-PATTERN:AUTO NONE;WHITE-SPACE:NORMAL;} ' ||
        '.XL41   {MSO-STYLE-PARENT:STYLE0;COLOR:BLACK;FONT-WEIGHT:700;TEXT-ALIGN:CENTER;VERTICAL-ALIGN:MIDDLE;BORDER-TOP:NONE;BORDER-RIGHT:.5PT SOLID BLACK;BORDER-BOTTOM:.5PT SOLID WINDOWTEXT; ' ||
        '        BORDER-LEFT:.5PT SOLID BLACK;BACKGROUND:SILVER;MSO-PATTERN:AUTO NONE;WHITE-SPACE:NORMAL;} ' ||
        '.XL42   {MSO-STYLE-PARENT:STYLE0;COLOR:BLACK;FONT-WEIGHT:700;TEXT-ALIGN:CENTER;VERTICAL-ALIGN:MIDDLE;BORDER-TOP:NONE;BORDER-RIGHT:.5PT SOLID WINDOWTEXT; ' ||
        '        BORDER-BOTTOM:.5PT SOLID WINDOWTEXT;BORDER-LEFT:.5PT SOLID BLACK;BACKGROUND:SILVER;MSO-PATTERN:AUTO NONE;WHITE-SPACE:NORMAL;} ' ||
        '--></STYLE> ' ||
        '<!--[IF GTE MSO 9]><XML> ' ||
        '<X:EXCELWORKBOOK><X:EXCELWORKSHEETS><X:EXCELWORKSHEET> ' ||
        '    <X:NAME>MEDRASH</X:NAME> ' ||
        '    <X:WORKSHEETOPTIONS> ' ||
        '      <X:FITTOPAGE><X:FITTOPAGE/> <X:PRINT><X:FITHEIGHT>1000</X:FITHEIGHT> ' ||
        '      <X:VALIDPRINTERINFO/>     ' ||
        '      </X:PRINT> ' ||
        '      <X:SELECTED/> ' ||
        '      <X:DONOTDISPLAYGRIDLINES/> ' ||
        '      <X:PROTECTCONTENTS>FALSE</X:PROTECTCONTENTS> ' ||
        '      <X:PROTECTOBJECTS>FALSE</X:PROTECTOBJECTS> ' ||
        '      <X:PROTECTSCENARIOS>FALSE</X:PROTECTSCENARIOS> ' ||
        '    </X:WORKSHEETOPTIONS> ' ||
        '  </X:EXCELWORKSHEET></X:EXCELWORKSHEETS> ' ||
        '  <X:PROTECTSTRUCTURE>FALSE</X:PROTECTSTRUCTURE> ' ||
        '  <X:PROTECTWINDOWS>FALSE</X:PROTECTWINDOWS> ' ||
        '  </X:EXCELWORKBOOK> ' ||
        '</XML><![ENDIF]--> ' ||
        '</HEAD> ' ||
        '<body link=blue vlink=purple class=xl24 bgcolor="#FFFFFF"> ' ||
        '<table x:str border=0 cellpadding=0 cellspacing=0 width=100% style=''border-collapse:collapse;table-layout:fixed''> ' ||
        '  <tr>  ' ||
        '    <td class=xl25 colspan=4 style=''mso-ignore:colspan''>Расход медикаментов FC_DATE</td> ' ||
        '    <td class=xl24>&nbsp;</td> ' ||
        '    <td class=xl24>&nbsp;</td> ' ||
        '    <td class=xl24>&nbsp;</td> ' ||
        '  </tr> ' ||
        '  <tr>  ' ||
        '    <td colspan=2 class=xl26>&nbsp;</td> ' ||
        '    <td>&nbsp</td> ' ||
        '    <td colspan=4 class=xl24 style=''mso-ignore:colspan''>&nbsp;</td> ' ||
        '  </tr><tr><td colspan=6> ';
    sTmp  := REPLACE (sTmp, 'FC_DATE', get_decodedperiod (pFD1, pFD2));
    DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
    DBMS_LOB.Append (cl, pkg_medvyd.GetParamList);
    sTmp  := ' </td> </tr>';
    sTmp  :=
      '  <tr>   <td rowspan=2 width=90 class=xl31 style=''border-bottom:.5pt solid black;border-top:.5pt solid windowtext;border-right:.5pt solid black;width:68pt''>Сер №</td>' ||
        '    <td rowspan=2 class=xl32 style=''border-bottom:.5pt solid black''>Наименование</td> ' ||
        '    <td rowspan=2 class=xl33 style=''border-bottom:.5pt solid black''>Ед.Изм.</td> ' ||
        '    <td colspan=FN_SPAN class=xl34 style=''border-right:.5pt solid black;border-left:none''>Группа пациентов</td>' ||
        '    <td rowspan=2 class=xl33 style=''border-bottom:.5pt solid black''>Расход</td>' ||
        '    <td rowspan=2 class=xl36 style=''border-bottom:.5pt solid black''>Итого расход</td>' ||
        '  </tr>';
    sTmp  := REPLACE (sTmp, 'FN_SPAN', aNaprName.COUNT);
    DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
    i     := aNaprName.FIRST;-- get subscript of first element
    WHILE i IS NOT NULL LOOP
      sTmp  := '<td class=xl40 style=''border-top:none;border-left:none''>FC_GR1</td>';
      sTmp  := REPLACE (sTmp, 'FC_GR1', aNaprName (i));
      DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
      i     := aNaprName.NEXT (i);-- get subscript of next element
    END LOOP;
    sTmp  := '  </tr>';
    DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
    FOR f IN cUchGr LOOP
      sTmp  :='<tr class =xl29><td colspan="4"><b>'||f.fc_name||'</b></td></tr>';
      DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
      FOR m IN cMedkart (f.fk_id) LOOP
        sTmp  :=
          '<tr><td class=xl29 style=''border-left:.5pt solid windowtext;;border-top:.5pt solid windowtext;''  >FC_SERIAL</td>                                                                     ' ||
            '<td class=xl29 style=''border-left:none;border-top:.5pt solid windowtext;'' >FC_MEDKART</td>'||
            '<td class=xl29 style=''border-left:none;border-top:.5pt solid windowtext;'' >FC_EDIZM</td>';
        sTmp  := REPLACE (sTmp, 'FC_SERIAL', m.fc_serial);
        sTmp  := REPLACE (sTmp, 'FC_MEDKART', m.fc_name);
        sTmp  := REPLACE (sTmp, 'FC_EDIZM', m.fc_edizm);
        nSum  := 0;
        i     := aNaprID.FIRST;-- get subscript of first element
        WHILE i IS NOT NULL LOOP
          sTmp  := sTmp || '<td class=xl27 style=''border-left:none;border-top:.5pt solid windowtext;'' >FN_GR</td>';
          nTmp  := getKol (m.fk_medkartid, aNaprID (i));
          nSum  := nSum + nTmp;
          sTmp  := REPLACE (sTmp, 'FN_GR', get_decode (nTmp, 0, '&nbsp;', nTmp));
          i     := aNaprName.NEXT (i);-- get subscript of next element
        END LOOP;
        nTmp  := 0;
        FOR i IN cPostavshikTMP LOOP
          nTmp  := nTmp + nvl(pkgmedkart.getrashuch (m.fk_medkartid, pFD1, pFD2, i.fk_id),0);
        END LOOP;
        nSum  := nSum + nTmp;
        sTmp  :=
          sTmp || '<td class=xl27 style=''border-left:none;border-top:.5pt solid windowtext;'' >FN_RASH</td>                                                                       ' ||
            '<td class=xl30 style=''border-left:none;border-top:.5pt solid windowtext;'' >FN_ITOG</td></tr>';
        sTmp  := REPLACE (sTmp, 'FN_RASH', get_decode (nTmp, 0, '&nbsp;', nTmp));
        sTmp  := REPLACE (sTmp, 'FN_ITOG', get_decode (nSum, 0, '&nbsp;', nSum));
        DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
      END LOOP;
    END LOOP;
    sTmp  := '</table></body></html>';
    DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
    RETURN cl;
  END Do_MedVydTotal;
END;-- Package Body PKG_MEDVYDTOTAL
/

SHOW ERRORS;


