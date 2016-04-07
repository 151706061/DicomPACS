DROP PACKAGE BODY ASU.LAB_REPORTS
/

--
-- LAB_REPORTS  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."LAB_REPORTS" 
IS
--
-- Purpose: Попытка объединить все (Основные) отчеты по лаборатории
--
--By Philip A. Milovanov
/*------------------------------------------------------------------------------------------------*/
  FUNCTION get_temptablename
    RETURN VARCHAR2
  IS
  BEGIN
    RETURN 'LAB_REPORTS' || TO_CHAR (SYSDATE, 'ddmmyyyyhh24miss');
  END;

  FUNCTION get_laborantinfo (pfd_date IN DATE, pfk_smid IN NUMBER)
    RETURN NUMBER
  IS
    CURSOR cpac (pfd_regist DATE, pfk_lsmid NUMBER)
    IS
      SELECT          /*+RULE*/
             DISTINCT fn_probe, fk_pacid, get_pacfio (fk_pacid) fc_fio, get_pacfcpalata (fk_pacid) fc_palata,
                      get_ib (fk_pacid) fk_ib, get_pacsex (fk_pacid) fc_sex, get_pacvozr (fk_pacid) fc_vozr
                 FROM tnazan, (SELECT fn_probe, fk_nazid fk_vpacid, is_ambulance (fk_pacid) fl_amb
                                 FROM tlabreg
                                WHERE fd_regist <= pfd_regist)
                WHERE fk_id = fk_vpacid
--            AND get_lab_razd (
                      AND get_lab_otd (get_smidfromnaz (fk_id)) = pfk_smid AND fl_amb = 0 AND fk_nazsosid = 4
      UNION ALL
      SELECT
             DISTINCT fn_probe, fk_pacid, get_ambfio (fk_pacid) fc_fio, 'Амб.' fc_palata, get_ambib (fk_pacid) fk_ib,
                      get_ambsex (fk_pacid) fc_sex, get_ambvozr (fk_pacid) fc_vozr
                 FROM tnazan, (SELECT fn_probe, fk_nazid fk_vpacid, is_ambulance (fk_pacid) fl_amb
                                 FROM tlabreg
                                WHERE fd_regist <= pfd_regist)
                WHERE fk_id = fk_vpacid
--            AND get_lab_razd (
                      AND get_lab_otd (get_smidfromnaz (fk_id)) = pfk_smid
--                 AND GET_OWNER_FROM_SMID (GET_SMIDFROMNAZ (FK_ID) ) = GET_BIOHIMID
                      AND fl_amb = 1 AND fk_nazsosid = 4
             ORDER BY 3;

    CURSOR cnaz (pfd_regist DATE, pfk_lsmid NUMBER, pfk_pacid NUMBER)
    IS
      SELECT
             get_name_from_smid (get_smidfromnaz (fk_nazid)) fc_name,
             pkg_smid.get_bold (get_smidfromnaz (fk_nazid)) fp_bold
        FROM tnazan, tlabreg
       WHERE tnazan.fk_id = tlabreg.fk_nazid AND tnazan.fk_nazsosid = 4 AND tlabreg.fk_pacid = pfk_pacid
--            AND get_lab_razd (
             AND get_lab_otd (get_smidfromnaz (tlabreg.fk_nazid)) = pfk_lsmid AND tlabreg.fd_regist <= pfd_regist;

    cc CLOB;
    str VARCHAR2 (4000);
    str1 VARCHAR2 (4000);
    nc NUMBER;
    b BOOLEAN;
  BEGIN
    DBMS_LOB.createtemporary (cc, TRUE, DBMS_LOB.SESSION);
    str :=
      '<html><head><meta http-equiv="Content-Type" content="text/html; charset=windows-1251"></head>'
      || '<P ALIGN="CENTER"><B><font size="+1">Клинико - диагностическая лаборатория санатория "'
      || pkg_smini.readstring ('CONFIG', 'S_NAME', '') || '"</font></B><BR>';
    str :=
      str || '<ALIGN="CENTER"><font size="+2">Сведения лаборантам на ' || TO_CHAR (pfd_date, 'dd.mm.yyyy')
      || ' по разделу: ' || get_name_from_smid (pfk_smid) || '.</font></P>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    str :=
      '<table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">';
    str :=
      str
      || '<TR align="center"><TD><B>№:</B></TD><TD><B>№ и.б.:</B></TD><TD><B>Ф.И.О.:</B></TD><TD><B>Пол:</B></TD><TD WIDTH="50%"><B>Данные:</B></TD></TR>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);

    FOR pacrec IN cpac (pfd_date, pfk_smid)
    LOOP
--     raise_application_error(-20002,'Ok');
      str :=
        '<TR align="center"><TD>' || pacrec.fn_probe || '</TD><TD>;' || pacrec.fk_ib || '</TD><TD ALIGN="LEFT"><B>;'
        || pacrec.fc_fio || '</B></TD><TD>;' || SUBSTR (pacrec.fc_sex, 1, 1) || '</TD><TD><font size="2">';
      DBMS_LOB.writeappend (cc, LENGTH (str), str);
      str := '';
      b := TRUE;

      FOR nazrec IN cnaz (pfd_date, pfk_smid, pacrec.fk_pacid)
      LOOP
        IF cnaz%ROWCOUNT > 0
        THEN
          IF nazrec.fp_bold = 1
          THEN
            str1 := '<B>' || nazrec.fc_name || '</B>';
          ELSE
            str1 := nazrec.fc_name;
          END IF;

          IF b
          THEN
            str := str || str1;
            b := FALSE;
          ELSE
            str := str || ', ' || str1;
          END IF;
        END IF;
      END LOOP;

      IF LENGTH (str) > 0
      THEN
        str := str || '.</font></TD></TR>';
      ELSE
        str := ';</font></TD></TR>';
      END IF;

      DBMS_LOB.writeappend (cc, LENGTH (str), str);
    END LOOP;

    str := '</TABLE></HTML>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);

    INSERT INTO tclobs
                (fc_clob)
         VALUES (cc)
      RETURNING fk_id
           INTO nc;

    RETURN nc;
  END;

/*------------------------------------------------------------------------------------------------*/
  FUNCTION get_laborantinfo2 (pfd_date IN DATE)
    RETURN NUMBER
  IS
    CURSOR cpac (pfd_regist DATE)
    IS
      SELECT    /*+RULE*/
             DISTINCT fn_probe, fk_pacid, get_pacfio (fk_pacid) fc_fio, get_pacfcpalata (fk_pacid) fc_palata,
                      get_ib (fk_pacid) fk_ib, get_pacsex (fk_pacid) fc_sex, get_pacvozr (fk_pacid) fc_vozr,
                      get_lab_razd (get_smidfromnaz (fk_id)) AS nazrazd
                 FROM tnazan, (SELECT fn_probe, fk_nazid fk_vpacid, is_ambulance (fk_pacid) fl_amb
                                 FROM tlabreg
                                WHERE fd_regist = pfd_regist)
                WHERE fk_id = fk_vpacid
--            AND get_lab_razd (

                      --            AND get_lab_otd (
--                   get_smidfromnaz (
--                      fk_id
--                   )
--                ) =
--                   pfk_smid
                      AND fl_amb = 0
      UNION ALL
      SELECT
             DISTINCT fn_probe, fk_pacid, get_ambfio (fk_pacid) fc_fio, 'Амб.' fc_palata, get_ambib (fk_pacid) fk_ib,
                      get_ambsex (fk_pacid) fc_sex, get_ambvozr (fk_pacid) fc_vozr,
                      get_lab_razd (get_smidfromnaz (fk_id)) AS nazrazd
                 FROM tnazan, (SELECT fn_probe, fk_nazid fk_vpacid, is_ambulance (fk_pacid) fl_amb
                                 FROM tlabreg
                                WHERE fd_regist = pfd_regist)
                WHERE fk_id = fk_vpacid
--            AND get_lab_razd (

                      --            AND get_lab_otd (
--                            get_smidfromnaz (
--                               fk_id
--                            )
--                         ) =
--                            pfk_smid

                      --                 AND GET_OWNER_FROM_SMID (GET_SMIDFROMNAZ (FK_ID) ) = GET_BIOHIMID
                      AND fl_amb = 1
             ORDER BY 1;

    CURSOR cnaz (pfd_regist DATE,
                                 --pfk_lsmid NUMBER,
                                 pfk_pacid NUMBER)
    IS
      SELECT
             get_name_from_smid (get_smidfromnaz (fk_nazid)) fc_name
        FROM tlabreg
       WHERE fk_pacid = pfk_pacid
--            AND get_lab_razd (

             --              AND get_lab_otd (
--                   get_smidfromnaz (
--                      fk_nazid
--                   )
--                ) =
--                   pfk_lsmid
             AND fd_regist = pfd_regist;

    cc CLOB;
    str VARCHAR2 (4000);
    nc NUMBER;
  BEGIN
    DBMS_LOB.createtemporary (cc, TRUE, DBMS_LOB.SESSION);
    str :=
      '<html><head><meta http-equiv="Content-Type" content="text/html; charset=windows-1251"></head>'
      || '<P ALIGN="CENTER"><B><font size="+1">Клинико - диагностическая лаборатория санатория "'
      || pkg_smini.readstring ('CONFIG', 'S_NAME', '') || '"</font></B><BR>';
    str :=
      str || '<ALIGN="CENTER"><font size="+2">Сведения лаборантам на ' || TO_CHAR (pfd_date, 'dd.mm.yyyy')
      ||
--             ' по разделу: ' ||
--             get_name_from_smid (pfk_smid) ||
--             '.</font></P>';
      '</font></P>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    str :=
      '<table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">';
    str :=
      str
      || '<TR align="center"><TD><B>№:</B></TD><TD><B>№ и.б.:</B></TD><TD><B>Ф.И.О.:</B></TD><TD><B>Пол:</B></TD><TD WIDTH="50%"><B>Данные:</B></TD></TR>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);

    FOR pacrec IN cpac (pfd_date)
    LOOP
--     raise_application_error(-20002,'Ok');
      str :=
        '<TR align="center"><TD>' || pacrec.fn_probe || '</TD><TD>;' || pacrec.fk_ib || '</TD><TD ALIGN="LEFT">;'
        || pacrec.fc_fio || '</TD><TD>;' || SUBSTR (pacrec.fc_sex, 1, 1) || '</TD><TD>;</TD></TR>';
      DBMS_LOB.writeappend (cc, LENGTH (str), str);

      FOR nazrec IN cnaz (pfd_date, pacrec.fk_pacid)
      LOOP
        IF cnaz%ROWCOUNT = 1
        THEN
          str :=
            '<TR align="center"><TD>;</TD><TD>' || pacrec.fc_palata || '</TD><TD ALIGN="LEFT">' || nazrec.fc_name
            || '</TD><TD>;</TD><TD>;</TD></TR>';
        ELSE
          str :=
            '<TR align="center"><TD>;</TD><TD>;</TD><TD ALIGN="LEFT">' || nazrec.fc_name
            || '</TD><TD>;</TD><TD>;</TD></TR>';
        END IF;

        DBMS_LOB.writeappend (cc, LENGTH (str), str);
      END LOOP;
    END LOOP;

    str := '</TABLE></HTML>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);

    INSERT INTO tclobs
                (fc_clob)
         VALUES (cc)
      RETURNING fk_id
           INTO nc;

    RETURN nc;
  END;

/*------------------------------------------------------------------------------------------------*/
  FUNCTION get_biohimfio (pfd_date IN DATE)
    RETURN NUMBER
  IS
    nc NUMBER;
    cc CLOB;
    str VARCHAR2 (32767);
    s VARCHAR2 (32767);
  BEGIN
    DBMS_LOB.createtemporary (cc, TRUE, DBMS_LOB.SESSION);
    str :=
      '<html><head><meta http-equiv="Content-Type" content="text/html; charset=windows-1251"></head>'
      || '<P ALIGN="CENTER"><B><font size="+1">Клинико - диагностическая лаборатория санатория "'
      || pkg_smini.readstring ('CONFIG', 'S_NAME', 'Не известен') || '"</font></B><BR>';
    str :=
      str || '<ALIGN="CENTER"><font size="+2">Сведения о пациентах для проведения биохимических исследований на '
      || TO_CHAR (pfd_date, 'dd.mm.yyyy') || '.</font></P>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    str :=
      '<table align="center" width="90%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">';
    str :=
      str
      || '<TR align="center"><TD><B>№ пробы:</B></TD><TD><B>№ и.б.:</B></TD><TD><B>Ф.И.О.:</B></TD><TD><B>Пол:</B></TD><TD><B>Возр.:</B></TD><TD><B>№ палаты:</B></TD><TD><B>Врач:</B></TD></TR>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);

    FOR p IN cbiofio (pfd_date)
    LOOP
      str :=
        '<TR align="center"><TD><B>' || p.fc_bio || ';</B></TD><TD><B>' || p.fc_ib || ';</B></TD><TD ALIGN="LEFT">'
        || p.fc_fio || ';</TD><TD>' || p.fc_sex || ';</TD><TD><B>' || p.fc_vozr || '</B>;</TD><TD>' || p.fc_palata
        || ';</TD><TD>' || p.fc_vrach || ';</TD></TR>';
      DBMS_LOB.writeappend (cc, LENGTH (str), str);
      s := '';

      OPEN cdiag (p.fk_pacid);

      FETCH cdiag
       INTO s;

      CLOSE cdiag;

      str :=
        '<TR align="center"><TD COLSPAN="7"><P ALIGN="LEFT"><FONT SIZE="-2">Основной диагноз: ' || s
        || ';</FONT></P></TD></TR>';
      DBMS_LOB.writeappend (cc, LENGTH (str), str);
    END LOOP;

    str := '</TABLE></HTML>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);

    INSERT INTO tclobs
                (fc_clob)
         VALUES (cc)
      RETURNING fk_id
           INTO nc;

    RETURN nc;
  END;

/*------------------------------------------------------------------------------------------------*/
  FUNCTION get_biohimissl (pfd_date IN DATE)
    RETURN NUMBER
  IS
    nc NUMBER;
    cc CLOB;
    str VARCHAR2 (32767);
    s VARCHAR2 (32767);
    plt tnumtable;
    i NUMBER;
    n NUMBER;
    ctype VARCHAR2 (100);
    nres VARCHAR2 (100);
    nres2 VARCHAR2 (100);
    cres VARCHAR2 (100);
    ccombo VARCHAR2 (100);
    cctype VARCHAR2 (100);
    str2 VARCHAR2 (32767);
    str3 VARCHAR2 (32767);
    ncs NUMBER := 0;
    ncountpl NUMBER := 0;
  BEGIN
    DBMS_LOB.createtemporary (cc, TRUE, DBMS_LOB.SESSION);
    str :=
      ' <html xmlns:x="urn:schemas-microsoft-com:office:excel"> ' || CHR (13) || ' <head> ' || CHR (13)
      || ' <meta http-equiv=Content-Type content="text/html; charset=windows-1251"> ' || CHR (13) || ' <style> '
      || CHR (13) || ' <!-- ' || CHR (13)
      || ' .sm_td {width:119.6pt;border:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt} ' || CHR (13)
      || ' .sm_table{border-collapse:collapse;border:none;mso-border-alt:solid windowtext .5pt;mso-padding-alt:0cm 5.4pt 0cm 5.4pt} '
      || CHR (13) || ' @page  ' || CHR (13) || ' { mso-page-orientation:landscape; ' || CHR (13)
      || ' mso-header-data:"\0022Arial CYR\,полужирный\0022 - диагностическая лаборатория санатория \0022'
      || pkg_smini.readstring ('CONFIG', 'S_NAME', 'Не известен')
      || '\0022 \000A\0022Arial CYR\,обычный\0022 биохимических исследований на ' || TO_CHAR (pfd_date, 'dd.mm.yyyy')
      || '\.";' || ' mso-footer-data:" стр\.  из "; ' || CHR (13) || ' margin:.92in .2in .88in .24in; ' || CHR (13)
      || ' mso-header-margin:.5in; ' || CHR (13) || ' mso-footer-margin:.5in;}  ' || CHR (13) || ' @page Section1  '
      || CHR (13) || ' { mso-page-orientation:landscape;  ' || CHR (13) || '   size:841.9pt 595.3pt; }  ' || CHR (13)
      || ' div.Section1  ' || CHR (13) || ' {page:Section1;} ' || CHR (13) || ' --> ' || CHR (13) || ' </style> '
      || CHR (13) || ' <xml> ' || CHR (13) || '  <x:ExcelWorkbook> ' || CHR (13) || '   <x:ExcelWorksheets> '
      || CHR (13) || '    <x:ExcelWorksheet> ' || CHR (13) || '     <x:Name>Лист1</x:Name> ' || CHR (13)
      || '     <x:WorksheetOptions> ' || CHR (13) || '      <x:Print> ' || CHR (13) || '       <x:ValidPrinterInfo/> '
      || CHR (13) || '      </x:Print> ' || CHR (13) || '     </x:WorksheetOptions> ' || CHR (13)
      || '    </x:ExcelWorksheet> ' || CHR (13) || '   </x:ExcelWorksheets> ' || CHR (13) || '  </x:ExcelWorkbook> '
      || CHR (13) || '  <x:ExcelName> ' || CHR (13) || '   <x:Name>Print_Titles</x:Name> ' || CHR (13)
      || '   <x:SheetIndex>1</x:SheetIndex> ' || CHR (13) || '   <x:Formula>=Лист1!$A:$A,Лист1!$1:$2</x:Formula> '
      || CHR (13) || '  </x:ExcelName> ' || CHR (13) || ' </xml> ' || CHR (13) || ' </head> ' || CHR (13)
      || '<BODY><DIV class="Section1">' || CHR (13);
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    str := '<table align="center" cellpadding="0" cellspacing="0" class="sm_table">' || CHR (13);
    str :=
      str
      || '<TR align="center"><TD ROWSPAN="2" class="sm_td" WIDTH=28 style=''width:21pt''>№:</TD><TD ROWSPAN="2" class="sm_td">Ф.И.О.:</TD>'
      || CHR (13);
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    str2 := '<TR>';
    str := '';
    ncountpl := 1;

    FOR p IN cbioissl
    LOOP
      IF p.LEVEL = 1
      THEN
        IF ncs > 1
        THEN
          str := REPLACE (str, 'COUNT_TO_PAN', ncs);
          str2 := str2 || str3;
        ELSIF ncs = 1
        THEN
          str := REPLACE (str, 'COLSPAN="COUNT_TO_PAN"', 'ROWSPAN="' || 2 || '"');
        END IF;

        str3 := '';
        ncs := 0;

        IF p.fk_mkb9 IS NULL
        THEN
          str :=
            str || '<TD class="sm_td"  COLSPAN="COUNT_TO_PAN" WIDTH=54 style=''border-left:none;width:41pt''>'
            || p.fc_name || '</TD>' || CHR (13);
        ELSE
          str :=
            str || '<TD class="sm_td"  COLSPAN="COUNT_TO_PAN" WIDTH=54 style=''border-left:none;width:41pt''>'
            || p.fk_mkb9 || '</TD>' || CHR (13);
        END IF;
      ELSE
        IF p.fk_mkb9 IS NULL
        THEN
          str3 :=
            str3 || '<TD class="sm_td"  WIDTH=54 style=''border-left:none;width:41pt''>' || p.fc_name || '</TD>'
            || CHR (13);
        ELSE
          str3 :=
            str3 || '<TD class="sm_td"  WIDTH=54 style=''border-left:none;width:41pt''>' || p.fk_mkb9 || '</TD>'
            || CHR (13);
        END IF;

        ncs := ncs + 1;
        plt (ncountpl) := p.fk_id;
        ncountpl := ncountpl + 1;
      END IF;
    END LOOP;

    IF ncs > 1
    THEN
      str := REPLACE (str, 'COUNT_TO_PAN', ncs);
      str2 := str2 || str3;
    ELSIF ncs = 1
    THEN
      str := REPLACE (str, 'COLSPAN="COUNT_TO_PAN"', 'ROWSPAN="' || 2 || '"');
    END IF;

    str := str || '</TR>' || CHR (13) || str2 || '</TR>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);

    FOR p IN cbiopac (pfd_date)
    LOOP
      str :=
        '<TR><TD class="sm_td"  ALIGN="CENTER" WIDTH=28 style=''width:21pt'' >' || p.fc_bio
        || '</TD><TD class="sm_td">' || p.fc_fio || '</TD>' || CHR (13);
      DBMS_LOB.writeappend (cc, LENGTH (str), str);

      FOR i IN plt.FIRST .. plt.LAST
      LOOP
        OPEN cispac (pfd_date, p.fk_pacid, plt (i));

        FETCH cispac
         INTO n;

        CLOSE cispac;

        ctype := '';
        nres := '';
        nres2 := '';
        cres := '';
        ccombo := '';
        cctype := '';

        OPEN cgetval (p.fk_pacid, plt (i), pfd_date);

        FETCH cgetval
         INTO ctype, nres, nres2, cres, ccombo, cctype;

        CLOSE cgetval;

        str :=
          '<TD class="sm_td"  ALIGN="LEFT" WIDTH=54 style=''border-left:none;width:41pt''><FONT SIZE="-1">' || CHR (13);
        DBMS_LOB.writeappend (cc, LENGTH (str), str);
        str := '';

        IF (cres IS NOT NULL OR nres IS NOT NULL OR nres2 IS NOT NULL) AND n > 0
        THEN
          IF ctype = 'NUMBER'
          THEN
            str := nres;
          ELSIF ctype = 'VARCHAR2'
          THEN
            str := cres;
          ELSIF ctype = 'DUALNUM'
          THEN
            str := nres || ' - ' || nres2;
          ELSIF ctype = 'COMBOBOX'
          THEN
            IF cctype = 'NUMBER'
            THEN
              str := nres || ' ' || ccombo;
            ELSIF cctype = 'VARCHAR2'
            THEN
              str := cres || ' ' || ccombo;
            ELSIF cctype = 'DUALNUM'
            THEN
              str := nres || ' - ' || nres2 || ' ' || ccombo;
            ELSE
              str := ccombo;
            END IF;
          END IF;
        ELSIF n > 0
        THEN
          str := '*';
        END IF;

        str := str || ';</FONT></TD>' || CHR (13);
        DBMS_LOB.writeappend (cc, LENGTH (str), str);
      END LOOP;
    END LOOP;

    FOR z IN 98 .. 99
    LOOP
      str :=
        '<TR><TD class="sm_td"  ALIGN="CENTER"  WIDTH=28 style=''width:21pt'' >' || z
        || '</TD><TD class="sm_td">;</TD>' || CHR (13);
      DBMS_LOB.writeappend (cc, LENGTH (str), str);

      FOR i IN 1 .. plt.COUNT
      LOOP
        OPEN ciscontr (pfd_date, plt (i));

        FETCH ciscontr
         INTO n;

        CLOSE ciscontr;

        IF n > 0
        THEN
          str :=
            '<TD class="sm_td"  ALIGN="LEFT" WIDTH=54 style=''border-left:none;width:41pt''><FONT SIZE="2">*</FONT></TD>'
            || CHR (13);
        ELSE
          str :=
            '<TD class="sm_td"  ALIGN="LEFT" WIDTH=54 style=''border-left:none;width:41pt''><FONT SIZE="2">;</FONT></TD>'
            || CHR (13);
        END IF;

        DBMS_LOB.writeappend (cc, LENGTH (str), str);
      END LOOP;
    END LOOP;

/* FOR z IN 98..99 LOOP
     str:='<TR><TD class="sm_td"  ALIGN="CENTER">'||98||'</TD>';
     DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
     FOR i IN 1..plT.COUNT LOOP
       str:='<TD class="sm_td"  ALIGN="LEFT"><FONT SIZE="2">*</FONT></TD>';
       DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
     END LOOP;
   END LOOP;
*/
    str := '</TR></TABLE></DIV></BODY></HTML>' || CHR (13);
    DBMS_LOB.writeappend (cc, LENGTH (str), str);

    INSERT INTO tclobs
                (fc_clob)
         VALUES (cc)
      RETURNING fk_id
           INTO nc;

    RETURN nc;
  END;

/*------------------------------------------------------------------------------------------------*/
  FUNCTION get_count_razd (pfk_smid IN NUMBER, pfl_amb IN NUMBER, pfd_date1 IN DATE, pfd_date2 IN DATE)
    RETURN NUMBER
  IS
    CURSOR c (psmid NUMBER, pamb NUMBER, pdate1 DATE, pdate2 DATE)
    IS
      SELECT COUNT (fk_id)
        FROM tresan
       WHERE fd_ins BETWEEN pdate1 AND pdate2 AND is_ambulance (fk_pacid) = pamb
             AND fk_smid IN (SELECT     fk_id
                                   FROM tsmid
                                  WHERE fl_stat IN (1, 2)
                             START WITH fk_id = psmid
                             CONNECT BY PRIOR fk_id = fk_owner);

    n NUMBER;
  BEGIN
    OPEN c (pfk_smid, pfl_amb, pfd_date1, pfd_date2);

    FETCH c
     INTO n;

    CLOSE c;

    RETURN n;
  END;

/*------------------------------------------------------------------------------------------------*/
  FUNCTION get_count_razd_pat (pfk_smid IN NUMBER, pfl_amb IN NUMBER, pfd_date1 IN DATE, pfd_date2 IN DATE)
    RETURN NUMBER
  IS
    CURSOR c (psmid NUMBER, pamb NUMBER, pdate1 DATE, pdate2 DATE)
    IS
      SELECT COUNT (fk_id)
        FROM tresan
       WHERE get_patalogy_level (fk_patid) > 0 AND fd_ins BETWEEN pdate1 AND pdate2 AND is_ambulance (fk_pacid) = pamb
             AND fk_smid IN (SELECT     fk_id
                                   FROM tsmid
                                  WHERE fl_stat IN (1, 2)
                             START WITH fk_id = psmid
                             CONNECT BY PRIOR fk_id = fk_owner);

    n NUMBER;
  BEGIN
    OPEN c (pfk_smid, pfl_amb, pfd_date1, pfd_date2);

    FETCH c
     INTO n;

    CLOSE c;

    RETURN n;
  END;

/*------------------------------------------------------------------------------------------------*/
  FUNCTION get_count_razd_patfirst (pfk_smid IN NUMBER, pfl_amb IN NUMBER, pfd_date1 IN DATE, pfd_date2 IN DATE)
    RETURN NUMBER
  IS
    CURSOR c (psmid NUMBER, pamb NUMBER, pdate1 DATE, pdate2 DATE)
    IS
      SELECT COUNT (fk_id)
        FROM tresan
       WHERE fl_patfirst = 1 AND fd_ins BETWEEN pdate1 AND pdate2 AND is_ambulance (fk_pacid) = pamb
             AND fk_smid IN (SELECT     fk_id
                                   FROM tsmid
                                  WHERE fl_stat IN (1, 2)
                             START WITH fk_id = psmid
                             CONNECT BY PRIOR fk_id = fk_owner);

    n NUMBER;
  BEGIN
    OPEN c (pfk_smid, pfl_amb, pfd_date1, pfd_date2);

    FETCH c
     INTO n;

    CLOSE c;

    RETURN n;
  END;

/*------------------------------------------------------------------------------------------------*/
  FUNCTION get_count_razd_povtor (pfk_smid IN NUMBER, pfd_date1 IN DATE, pfd_date2 IN DATE)
    RETURN NUMBER
  IS
    CURSOR c (psmid NUMBER, pdate1 DATE, pdate2 DATE)
    IS
      SELECT SUM (fn_count)
        FROM tpovtor
       WHERE fd_date BETWEEN pdate1 AND pdate2 AND fk_smid IN (SELECT     fk_id
                                                                     FROM tsmid
                                                                    WHERE fl_stat IN (2)
                                                               START WITH fk_id = psmid
                                                               CONNECT BY PRIOR fk_id = fk_owner);

    n NUMBER;
  BEGIN
    OPEN c (pfk_smid, pfd_date1, pfd_date2);

    FETCH c
     INTO n;

    CLOSE c;

    IF n IS NULL
    THEN
      n := 0;
    END IF;

    RETURN n;
  END;

/*------------------------------------------------------------------------------------------------*/
  FUNCTION get_doneisslrazd (pfd_date1 IN DATE, pfd_date2 IN DATE, pfk_smid IN NUMBER)
    RETURN NUMBER
  IS
    nc NUMBER;
    cc CLOB;
    str VARCHAR2 (32767);
    s VARCHAR2 (32767);
    plt tnumtable;
    i NUMBER;
    n NUMBER;

    CURSOR cgetissl (psmid NUMBER)
    IS
      SELECT     fk_id, fl_stat
            FROM tsmid
           WHERE fl_stat IN (1, 2)
      START WITH fk_id = psmid
      CONNECT BY PRIOR fk_id = fk_owner;

    TYPE tplissl IS TABLE OF cgetissl%ROWTYPE
      INDEX BY BINARY_INTEGER;

    plissl tplissl;
  BEGIN
    DBMS_LOB.createtemporary (cc, TRUE, DBMS_LOB.SESSION);
    str :=
      '<html><head><meta http-equiv="Content-Type" content="text/html; charset=windows-1251"></head>'
      || '<P ALIGN="CENTER"><B><font size="+1">Клинико - диагностическая лаборатория санатория "'
      || pkg_smini.readstring ('CONFIG', 'S_NAME', 'Не известен') || '"</font></B><BR>';
    str :=
      str || '<ALIGN="CENTER"><font size="+2">Отчет о проведенных исследованиях по разделу '
      || get_name_from_smid (pfk_smid) || '</font><br>';
    str := str || 'за период с ' || TO_CHAR (pfd_date1, 'dd.mm.yyyy') || ' по ' || TO_CHAR (pfd_date2, 'dd.mm.yyyy');
    DBMS_LOB.writeappend (cc, LENGTH (str), str);

    FOR p IN cgetissl (pfk_smid)
    LOOP
      plissl (cgetissl%ROWCOUNT).fk_id := p.fk_id;
      plissl (cgetissl%ROWCOUNT).fl_stat := p.fl_stat;
    END LOOP;

    str :=
      '<table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    str :=
      '<tr> <td rowspan="2" ALIGN="CENTER"><B>Дата:<BR>Исследование:</B></td><td colspan="4">;</td></tr><tr><td ALIGN="CENTER"><B>1</B></td><td ALIGN="CENTER"><B>*</B></td><td ALIGN="CENTER"><B>**</B></td><td ALIGN="CENTER"><B>2</B></td></tr>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);

    FOR i IN 1 .. plissl.COUNT
    LOOP
      str :=
        '<TR><TD><B>' || get_name_from_smid (plissl (i).fk_id) || '</B></TD>' || '<TD ALIGN="CENTER">'
        || get_count_razd (plissl (i).fk_id, 0, pfd_date1, pfd_date2) || '</TD>' || '<TD ALIGN="CENTER">'
        || get_count_razd_pat (plissl (i).fk_id, 1, pfd_date1, pfd_date2) || '</TD>' || '<TD ALIGN="CENTER">'
        || get_count_razd_patfirst (plissl (i).fk_id, 1, pfd_date1, pfd_date2) || '</TD>' || '<TD ALIGN="CENTER">'
        || get_count_razd (plissl (i).fk_id, 1, pfd_date1, pfd_date2) || '</TD>' || '</TR>';
      DBMS_LOB.writeappend (cc, LENGTH (str), str);
    END LOOP;

    str :=
      '<TR><TD><B>Итого:</B></TD>' || '<TD ALIGN="CENTER">' || get_count_razd (pfk_smid, 0, pfd_date1, pfd_date2)
      || '</TD>' || '<TD ALIGN="CENTER">' || get_count_razd_pat (pfk_smid, 1, pfd_date1, pfd_date2) || '</TD>'
      || '<TD ALIGN="CENTER">' || get_count_razd_patfirst (pfk_smid, 1, pfd_date1, pfd_date2) || '</TD>'
      || '<TD ALIGN="CENTER">' || get_count_razd (pfk_smid, 1, pfd_date1, pfd_date2) || '</TD>' || '</TR>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    i := get_count_razd (pfk_smid, 0, pfd_date1, pfd_date2) + get_count_razd (pfk_smid, 1, pfd_date1, pfd_date2);
    str := '<TR><TD><B>Всего (1+2):</B></TD>' || '<TD ALIGN="CENTER" COLSPAN="4"> ' || i || '</TD></TR>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    str :=
      '<TR><TD COLSPAN="5">;</TD></TR><TR> <TD ROWSPAN="2"><B>Исследования повт. и к/кач.: </B></TD><TD COLSPAN="4">;</TD></TR><TR><TD COLSPAN="2" ALIGN="CENTER"><B>Повт.:</B></TD><TD COLSPAN="2" ALIGN="CENTER"><B>К/кач.:</B></TD></TR>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);

    FOR i IN 1 .. plissl.COUNT
    LOOP
      IF plissl (i).fl_stat = 2
      THEN
        str :=
          '<TR><TD><B>' || get_name_from_smid (plissl (i).fk_id) || '</B></TD><TD ALIGN="CENTER" COLSPAN="2">'
          || get_count_razd_povtor (plissl (i).fk_id, pfd_date1, pfd_date2)
          || ';</TD><TD COLSPAN="2" ALIGN="CENTER">;</TD></TR>';
        DBMS_LOB.writeappend (cc, LENGTH (str), str);
      END IF;
    END LOOP;

    i := get_count_razd_povtor (pfk_smid, pfd_date1, pfd_date2);
    str := '<TR><TD><B>Всего:</B></TD>' || '<TD ALIGN="CENTER" COLSPAN="4"> ' || i || '</TD></TR>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    str := '</TABLE></HTML>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);

    INSERT INTO tclobs
                (fc_clob)
         VALUES (cc)
      RETURNING fk_id
           INTO nc;

    RETURN nc;
  END;

/*------------------------------------------------------------------------------------------------*/
  FUNCTION get_proc_ohvat (pfn_year IN NUMBER, pfn_type IN NUMBER)
    RETURN NUMBER
  IS
    CURSOR c1 (pdata1 DATE, pdata2 DATE)
    IS
      SELECT COUNT (DISTINCT fk_pacid)
        FROM tnazan, (SELECT get_vipnaz fk_nazvip
                        FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                       FROM DUAL)
       WHERE fk_nazsosid = fk_nazvip AND fk_razdid <> fk_biohimid AND fd_run BETWEEN pdata1 AND pdata2;

    CURSOR c2 (pdata1 DATE, pdata2 DATE)
    IS
      SELECT COUNT (DISTINCT fk_pacid)
        FROM tnazan, (SELECT get_vipnaz fk_nazvip
                        FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                       FROM DUAL)
       WHERE fk_nazsosid = fk_nazvip AND fk_razdid = fk_biohimid AND fd_run BETWEEN pdata1 AND pdata2;

    CURSOR c3 (pdata1 DATE, pdata2 DATE)
    IS
      SELECT COUNT (DISTINCT fk_pacid)
        FROM tnazan, (SELECT get_vipnaz fk_nazvip
                        FROM DUAL)
       WHERE fk_nazsosid = fk_nazvip AND fd_run BETWEEN pdata1 AND pdata2;

    ntotal NUMBER;
    i NUMBER;
  BEGIN
    ntotal :=
      get_count_income_period (TO_DATE ('01.01' || pfn_year, 'dd.mm.yyyy'),
                               TO_DATE ('31.12' || pfn_year, 'dd.mm.yyyy'));

    IF pfn_type = 1
    THEN
      OPEN c1 (TO_DATE ('01.01' || pfn_year, 'dd.mm.yyyy'), TO_DATE ('31.12' || pfn_year, 'dd.mm.yyyy'));

      FETCH c1
       INTO i;

      CLOSE c1;
    ELSIF pfn_type = 2
    THEN
      OPEN c2 (TO_DATE ('01.01' || pfn_year, 'dd.mm.yyyy'), TO_DATE ('31.12' || pfn_year, 'dd.mm.yyyy'));

      FETCH c2
       INTO i;

      CLOSE c2;
    ELSIF pfn_type = 3
    THEN
      OPEN c3 (TO_DATE ('01.01' || pfn_year, 'dd.mm.yyyy'), TO_DATE ('31.12' || pfn_year, 'dd.mm.yyyy'));

      FETCH c3
       INTO i;

      CLOSE c3;
    END IF;

    IF ntotal = 0
    THEN
      RETURN 0;
    ELSE
      RETURN (i / ntotal) * 100;
    END IF;
  END;

/*------------------------------------------------------------------------------------------------*/
  FUNCTION get_count_issl_year (pfn_year IN NUMBER, pfn_type IN NUMBER)
    RETURN NUMBER
  IS
    CURSOR c1 (pdata1 DATE, pdata2 DATE)
    IS
      SELECT SUM (fn_vcount * get_ed_from_smid (fk_smid))
        FROM (SELECT   fk_smid, COUNT (fk_smid) fn_vcount
                  FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                  FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                                 FROM DUAL)
                 WHERE fk_nazsosid = fk_nazvip AND fk_razdid <> fk_biohimid AND fd_run BETWEEN pdata1 AND pdata2
              GROUP BY fk_smid);

    CURSOR c2 (pdata1 DATE, pdata2 DATE)
    IS
      SELECT SUM (fn_count)
        FROM (SELECT SUM ((fn_vcount + 1) * get_ed_from_smid (fk_smid)) fn_count
                FROM (SELECT   COUNT (fk_smid) fn_vcount, fk_smid, fd_run
                          FROM texpan,
                               (SELECT DISTINCT fk_id fk_vnazid, fd_run
                                           FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                                           FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                                                          FROM DUAL),
                                                (SELECT get_synid ('ANAL_BIOHIM') fk_analbiohimid
                                                   FROM DUAL)
                                          WHERE fk_nazsosid = fk_nazvip AND fk_smid = fk_analbiohimid
                                                AND fk_razdid = fk_biohimid AND fd_run BETWEEN pdata1 AND pdata2)
                         WHERE fk_nazid = fk_vnazid
                      GROUP BY fk_smid, fd_run)
              UNION ALL
              SELECT SUM ((fn_vcount) * get_ed_from_smid (fk_smid)) fn_count
                FROM (SELECT   COUNT (fk_smid) fn_vcount, fk_smid, fd_run
                          FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                          FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                                         FROM DUAL),
                               (SELECT get_synid ('ANAL_BIOHIM') fk_analbiohimid
                                  FROM DUAL)
                         WHERE fk_nazsosid = fk_nazvip AND fk_razdid = fk_biohimid AND fk_smid <> fk_analbiohimid
                               AND fd_run BETWEEN pdata1 AND pdata2
                      GROUP BY fk_smid, fd_run));

    CURSOR c3 (pdata1 DATE, pdata2 DATE)
    IS
      SELECT SUM (fn_count)
        FROM (SELECT SUM ((fn_vcount + 1) * get_ed_from_smid (fk_smid)) fn_count
                FROM (SELECT   COUNT (fk_smid) fn_vcount, fk_smid, fd_run
                          FROM texpan,
                               (SELECT DISTINCT fk_id fk_vnazid, fd_run
                                           FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                                           FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                                                          FROM DUAL),
                                                (SELECT get_synid ('ANAL_BIOHIM') fk_analbiohimid
                                                   FROM DUAL)
                                          WHERE fk_nazsosid = fk_nazvip AND fk_razdid = fk_biohimid
                                                AND fk_smid = fk_analbiohimid AND fd_run BETWEEN pdata1 AND pdata2)
                         WHERE fk_nazid = fk_vnazid
                      GROUP BY fk_smid, fd_run)
              UNION ALL
              SELECT SUM ((fn_vcount) * get_ed_from_smid (fk_smid)) fn_count
                FROM (SELECT   COUNT (fk_smid) fn_vcount, fk_smid, fd_run
                          FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                          FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                                         FROM DUAL),
                               (SELECT get_synid ('ANAL_BIOHIM') fk_analbiohimid
                                  FROM DUAL)
                         WHERE fk_nazsosid = fk_nazvip AND fk_razdid = fk_biohimid AND fk_smid <> fk_analbiohimid
                               AND fd_run BETWEEN pdata1 AND pdata2
                      GROUP BY fk_smid, fd_run)
              UNION ALL
              SELECT SUM (fn_vcount * get_ed_from_smid (fk_smid)) fn_count
                FROM (SELECT   COUNT (fk_smid) fn_vcount, fk_smid
                          FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                          FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                                         FROM DUAL)
                         WHERE fk_nazsosid = fk_nazvip AND fk_razdid <> fk_biohimid
                               AND fd_run BETWEEN pdata1 AND pdata2
                      GROUP BY fk_smid));

    i NUMBER;
  BEGIN
    IF pfn_type = 1
    THEN   --Клиника
      OPEN c1 (TO_DATE ('01.01' || pfn_year, 'dd.mm.yyyy'), TO_DATE ('31.12' || pfn_year, 'dd.mm.yyyy'));

      FETCH c1
       INTO i;

      CLOSE c1;
    ELSIF pfn_type = 2
    THEN   --Биохимия
      OPEN c2 (TO_DATE ('01.01' || pfn_year, 'dd.mm.yyyy'), TO_DATE ('31.12' || pfn_year, 'dd.mm.yyyy'));

      FETCH c2
       INTO i;

      CLOSE c2;
    ELSIF pfn_type = 3
    THEN   --Всего
      OPEN c3 (TO_DATE ('01.01' || pfn_year, 'dd.mm.yyyy'), TO_DATE ('31.12' || pfn_year, 'dd.mm.yyyy'));

      FETCH c3
       INTO i;

      CLOSE c3;
    END IF;

    RETURN i;
  END;

/*------------------------------------------------------------------------------------------------*/
  FUNCTION get_proizv_lab_vitiaz (pfn_year IN NUMBER, pfn_count IN NUMBER, pfk_vrachid IN NUMBER)
    RETURN NUMBER
  IS
    nc NUMBER;
    cc CLOB;
    str VARCHAR2 (32767);
    styear NUMBER;
    tyears tnumtable;
    n NUMBER;
  BEGIN
    styear := pfn_year - pfn_count + 1;

    FOR i IN 1 .. pfn_count
    LOOP
      tyears (i) := styear + i - 1;
    END LOOP;

    DBMS_LOB.createtemporary (cc, TRUE, DBMS_LOB.SESSION);
    str :=
      '<html><head><meta http-equiv="Content-Type" content="text/html; charset=windows-1251">' || '<style><!-- '
      || ' .sm_td {width:119.6pt;border:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt} '
      || ' .sm_table{border-collapse:collapse;border:none;mso-border-alt:solid windowtext .5pt;mso-padding-alt:0cm 5.4pt 0cm 5.4pt} '
      || '--></style></head>' || '<P ALIGN="CENTER"><B><font size="+1">Клинико - диагностическая лаборатория ЛОК "'
      || pkg_smini.readstring ('CONFIG', 'S_NAME', 'Не известен') || '"</font></B><BR>';
    str := str || '<ALIGN="CENTER"><font size="+2">Производительность лаборатории </font><br>';
    str := str || 'за период с ' || styear || ' г. по ' || pfn_year || ' г.';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    str := '<table align="center" width="100%" border="1" class = "sm_table" cellpadding="0" cellspacing="0">';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    str :=
      '<TR ALIGN="CENTER"><TD class="sm_td " COLSPAN="' || tyears.COUNT || '"><B>Клинических анализов:</B></TD>'
      || '<TD class="sm_td " COLSPAN="' || tyears.COUNT || '"><B>Биохимических анализов:</B></TD>'
      || '<TD class="sm_td " COLSPAN="' || tyears.COUNT || '"><B>Всего:</B></TD>' || '<TD class="sm_td " COLSPAN="'
      || tyears.COUNT || '"><B>% охвата клинических:</B></TD>' || '<TD class="sm_td " COLSPAN="' || tyears.COUNT
      || '"><B>% охвата биохимических:</B></TD>' || '<TD class="sm_td " COLSPAN="' || tyears.COUNT
      || '"><B>% охвата всего:</B></TD></TR>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    str := '<TR ALIGN="CENTER">';

    FOR j IN 1 .. 6
    LOOP
      FOR i IN 1 .. tyears.COUNT
      LOOP
        str := str || '<TD class="sm_td ">' || tyears (i) || '</TD>';
      END LOOP;
    END LOOP;

    str := str || '</TR><TR ALIGN="CENTER">';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);

    FOR j IN 1 .. 3
    LOOP
      FOR i IN 1 .. tyears.COUNT
      LOOP
        n := get_count_issl_year (tyears (i), j);

        IF n IS NULL
        THEN
          n := 0;
        END IF;

        str := '<TD class="sm_td ">' || n || ';</TD>';
        DBMS_LOB.writeappend (cc, LENGTH (str), str);
      END LOOP;
    END LOOP;

    FOR j IN 1 .. 3
    LOOP
      FOR i IN 1 .. tyears.COUNT
      LOOP
        str := '<TD class="sm_td ">' || TO_CHAR (get_proc_ohvat (tyears (i), j), '990.00') || '%;</TD>';
        DBMS_LOB.writeappend (cc, LENGTH (str), str);
      END LOOP;
    END LOOP;

    str := '</TR>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    str := '</TABLE></HTML>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);

    INSERT INTO tclobs
                (fc_clob)
         VALUES (cc)
      RETURNING fk_id
           INTO nc;

    RETURN nc;
  END;

/*------------------------------------------------------------------------------------------------*/
  FUNCTION get_count_klin_vozr_pac (pfd_date IN DATE, pfn_vozr IN NUMBER, pfl_bigger IN NUMBER, pfn_type IN NUMBER)
    RETURN NUMBER
  IS
    CURSOR c1
    IS
      SELECT COUNT (DISTINCT fk_pacid)
        FROM tnazan, (SELECT get_vipnaz fk_nazvip
                        FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                       FROM DUAL)
       WHERE fk_nazsosid = fk_nazvip AND fk_razdid <> fk_biohimid AND fd_run = pfd_date
             AND get_age_date (fk_pacid, pfd_date) >= pfn_vozr;

    CURSOR c11
    IS
      SELECT COUNT (DISTINCT fk_pacid)
        FROM tnazan, (SELECT get_vipnaz fk_nazvip
                        FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                       FROM DUAL)
       WHERE fk_nazsosid = fk_nazvip AND fk_razdid <> fk_biohimid AND fd_run = pfd_date
             AND get_age_date (fk_pacid, pfd_date) < pfn_vozr;

    CURSOR c2
    IS
      SELECT /*+RULE*/
             COUNT (DISTINCT fk_pacid)
        FROM (SELECT fk_pacid
                FROM texpan,
                     (SELECT DISTINCT fk_id fk_vnazid, fk_pacid
                                 FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                                 FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                                                FROM DUAL)
                                WHERE fk_nazsosid = fk_nazvip AND fk_razdid = fk_biohimid AND fd_run = pfd_date)
               WHERE fk_nazid = fk_vnazid AND get_age_date (fk_pacid, pfd_date) >= pfn_vozr
              UNION ALL
              SELECT fk_pacid
                FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                               FROM DUAL), (SELECT get_synid ('ANAL_BIOHIM') fk_analbiohimid
                                                              FROM DUAL)
               WHERE fk_nazsosid = fk_nazvip AND fk_razdid = fk_biohimid AND fk_smid <> fk_analbiohimid
                     AND fd_run = pfd_date AND get_age_date (fk_pacid, pfd_date) >= pfn_vozr);

    CURSOR c21
    IS
      SELECT /*+RULE*/
             COUNT (DISTINCT fk_pacid)
        FROM (SELECT fk_pacid
                FROM texpan,
                     (SELECT DISTINCT fk_id fk_vnazid, fk_pacid
                                 FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                                 FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                                                FROM DUAL)
                                WHERE fk_nazsosid = fk_nazvip AND fk_razdid = fk_biohimid AND fd_run = pfd_date)
               WHERE fk_nazid = fk_vnazid AND get_age_date (fk_pacid, pfd_date) < pfn_vozr
              UNION ALL
              SELECT fk_pacid
                FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                               FROM DUAL), (SELECT get_synid ('ANAL_BIOHIM') fk_analbiohimid
                                                              FROM DUAL)
               WHERE fk_nazsosid = fk_nazvip AND fk_razdid = fk_biohimid AND fk_smid <> fk_analbiohimid
                     AND fd_run = pfd_date AND get_age_date (fk_pacid, pfd_date) < pfn_vozr);

    CURSOR c3
    IS
      SELECT /*+RULE*/
             COUNT (DISTINCT fk_pacid)
        FROM (SELECT DISTINCT fk_pacid
                         FROM texpan,
                              (SELECT DISTINCT fk_id fk_vnazid, fk_pacid
                                          FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                                          FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                                                         FROM DUAL)
                                         WHERE fk_nazsosid = fk_nazvip AND fk_razdid = fk_biohimid
                                               AND fd_run = pfd_date)
                        WHERE fk_nazid = fk_vnazid
              UNION ALL
              SELECT DISTINCT fk_pacid
                         FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                         FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                                        FROM DUAL), (SELECT get_synid ('ANAL_BIOHIM') fk_analbiohimid
                                                                       FROM DUAL)
                        WHERE fk_nazsosid = fk_nazvip AND fk_razdid = fk_biohimid AND fk_smid <> fk_analbiohimid
                              AND fd_run = pfd_date
              UNION ALL
              SELECT DISTINCT fk_pacid
                         FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                         FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                                        FROM DUAL)
                        WHERE fk_nazsosid = fk_nazvip AND fk_razdid <> fk_biohimid AND fd_run = pfd_date);

    CURSOR c4
    IS
      SELECT /*+RULE*/
             COUNT (DISTINCT fk_pacid)
        FROM (SELECT fk_pacid
                FROM texpan,
                     (SELECT DISTINCT fk_id fk_vnazid, fk_pacid
                                 FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                                 FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                                                FROM DUAL)
                                WHERE fk_nazsosid = fk_nazvip AND fk_razdid = fk_biohimid AND fd_run = pfd_date)
               WHERE fk_nazid = fk_vnazid
              UNION ALL
              SELECT fk_pacid
                FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                               FROM DUAL), (SELECT get_synid ('ANAL_BIOHIM') fk_analbiohimid
                                                              FROM DUAL)
               WHERE fk_nazsosid = fk_nazvip AND fk_razdid = fk_biohimid AND fk_smid <> fk_analbiohimid
                     AND fd_run = pfd_date);

    i NUMBER;
  BEGIN
    IF pfn_type = 1
    THEN   --Клиника
      IF pfl_bigger = 1
      THEN
        OPEN c1;

        FETCH c1
         INTO i;

        CLOSE c1;
      ELSE
        OPEN c11;

        FETCH c11
         INTO i;

        CLOSE c11;
      END IF;
    ELSIF pfn_type = 2
    THEN   --Биохимия
      IF pfl_bigger = 1
      THEN
        OPEN c2;

        FETCH c2
         INTO i;

        CLOSE c2;
      ELSE
        OPEN c21;

        FETCH c21
         INTO i;

        CLOSE c21;
      END IF;
    ELSIF pfn_type = 3
    THEN   --Всего
      OPEN c3;

      FETCH c3
       INTO i;

      CLOSE c3;
    ELSIF pfn_type = 4
    THEN   --Всего по биохимии
      OPEN c4;

      FETCH c4
       INTO i;

      CLOSE c4;
    END IF;

    RETURN i;
  END;

/*------------------------------------------------------------------------------------------------*/
  FUNCTION get_count_klin_vozr_issl (pfd_date IN DATE, pfn_vozr IN NUMBER, pfl_bigger IN NUMBER, pfn_type IN NUMBER)
    RETURN NUMBER
  IS
    CURSOR c1
    IS
      SELECT SUM (fn_vcount * get_ed_from_smid (fk_smid))
        FROM (SELECT   COUNT (fk_smid) fn_vcount, fk_smid
                  FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                  FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                                 FROM DUAL)
                 WHERE fk_nazsosid = fk_nazvip AND fk_razdid <> fk_biohimid AND fd_run = pfd_date
                       AND get_age_date (fk_pacid, pfd_date) >= pfn_vozr
              GROUP BY fk_smid);

    CURSOR c11
    IS
      SELECT SUM (fn_vcount * get_ed_from_smid (fk_smid))
        FROM (SELECT   COUNT (fk_smid) fn_vcount, fk_smid
                  FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                  FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                                 FROM DUAL)
                 WHERE fk_nazsosid = fk_nazvip AND fk_razdid <> fk_biohimid AND fd_run = pfd_date
                       AND get_age_date (fk_pacid, pfd_date) < pfn_vozr
              GROUP BY fk_smid);

    CURSOR c2
    IS
      SELECT SUM (fn_count)
        FROM (SELECT SUM ((fn_vcount /*+1*/) * get_ed_from_smid (fk_smid)) fn_count
                FROM (SELECT   COUNT (fk_smid) fn_vcount, fk_smid
                          FROM texpan,
                               (SELECT DISTINCT fk_id fk_vnazid
                                           FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                                           FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                                                          FROM DUAL),
                                                (SELECT get_synid ('ANAL_BIOHIM') fk_analbiohimid
                                                   FROM DUAL)
                                          WHERE fk_nazsosid = fk_nazvip AND fk_razdid = fk_biohimid
                                                AND fk_smid = fk_analbiohimid AND fd_run = pfd_date
                                                AND get_age_date (fk_pacid, pfd_date) >= pfn_vozr)
                         WHERE fk_nazid = fk_vnazid
                      GROUP BY fk_smid)
              UNION ALL
              SELECT SUM ((fn_vcount) * get_ed_from_smid (fk_smid))
                FROM (SELECT   COUNT (fk_smid) fn_vcount, fk_smid
                          FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                          FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                                         FROM DUAL),
                               (SELECT get_synid ('ANAL_BIOHIM') fk_analbiohimid
                                  FROM DUAL)
                         WHERE fk_nazsosid = fk_nazvip AND fk_razdid = fk_biohimid AND fk_smid <> fk_analbiohimid
                               AND fd_run = pfd_date AND get_age_date (fk_pacid, pfd_date) >= pfn_vozr
                      GROUP BY fk_smid));

    CURSOR c21
    IS
      SELECT SUM (fn_count)
        FROM (SELECT SUM ((fn_vcount /*+1*/) * get_ed_from_smid (fk_smid)) fn_count
                FROM (SELECT   COUNT (fk_smid) fn_vcount, fk_smid
                          FROM texpan,
                               (SELECT DISTINCT fk_id fk_vnazid
                                           FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                                           FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                                                          FROM DUAL),
                                                (SELECT get_synid ('ANAL_BIOHIM') fk_analbiohimid
                                                   FROM DUAL)
                                          WHERE fk_nazsosid = fk_nazvip AND fk_razdid = fk_biohimid
                                                AND fd_run = pfd_date AND tnazan.fk_smid = fk_analbiohimid
                                                AND get_age_date (fk_pacid, pfd_date) < pfn_vozr)
                         WHERE fk_nazid = fk_vnazid
                      GROUP BY fk_smid)
              UNION ALL
              SELECT SUM ((fn_vcount) * get_ed_from_smid (fk_smid))
                FROM (SELECT   COUNT (fk_smid) fn_vcount, fk_smid
                          FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                          FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                                         FROM DUAL),
                               (SELECT get_synid ('ANAL_BIOHIM') fk_analbiohimid
                                  FROM DUAL)
                         WHERE fk_nazsosid = fk_nazvip AND fk_razdid = fk_biohimid AND fk_smid <> fk_analbiohimid
                               AND fd_run = pfd_date AND get_age_date (fk_pacid, pfd_date) < pfn_vozr
                      GROUP BY fk_smid));

    CURSOR c3
    IS
      SELECT SUM (fn_count)
        FROM (SELECT SUM ((fn_vcount + 1) * get_ed_from_smid (fk_smid)) fn_count
                FROM (SELECT   COUNT (fk_smid) fn_vcount, fk_smid
                          FROM texpan,
                               (SELECT DISTINCT fk_id fk_vnazid
                                           FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                                           FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                                                          FROM DUAL),
                                                (SELECT get_synid ('ANAL_BIOHIM') fk_analbiohimid
                                                   FROM DUAL)
                                          WHERE fk_nazsosid = fk_nazvip AND fk_razdid = fk_biohimid
                                                AND fk_smid = fk_analbiohimid AND fd_run = pfd_date)
                         WHERE fk_nazid = fk_vnazid
                      GROUP BY fk_smid)
              UNION ALL
              SELECT SUM ((fn_vcount) * get_ed_from_smid (fk_smid))
                FROM (SELECT   COUNT (fk_smid) fn_vcount, fk_smid
                          FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                          FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                                         FROM DUAL),
                               (SELECT get_synid ('ANAL_BIOHIM') fk_analbiohimid
                                  FROM DUAL)
                         WHERE fk_nazsosid = fk_nazvip AND fk_razdid = fk_biohimid AND fk_smid <> fk_analbiohimid
                               AND fd_run = pfd_date
                      GROUP BY fk_smid)
              UNION ALL
              SELECT SUM (fn_vcount * get_ed_from_smid (fk_smid))
                FROM (SELECT   COUNT (fk_smid) fn_vcount, fk_smid
                          FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                          FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                                         FROM DUAL)
                         WHERE fk_nazsosid = fk_nazvip AND fk_razdid <> fk_biohimid AND fd_run = pfd_date
                      GROUP BY fk_smid));

    CURSOR c4
    IS
      SELECT SUM (fn_count)
        FROM (SELECT SUM ((fn_vcount + 1) * get_ed_from_smid (fk_smid)) fn_count
                FROM (SELECT   COUNT (fk_smid) fn_vcount, fk_smid
                          FROM texpan,
                               (SELECT DISTINCT fk_id fk_vnazid
                                           FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                                           FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                                                          FROM DUAL),
                                                (SELECT get_synid ('ANAL_BIOHIM') fk_analbiohimid
                                                   FROM DUAL)
                                          WHERE fk_nazsosid = fk_nazvip AND fk_razdid = fk_biohimid
                                                AND fd_run = pfd_date AND tnazan.fk_smid = fk_analbiohimid)
                         WHERE fk_nazid = fk_vnazid
                      GROUP BY fk_smid)
              UNION ALL
              SELECT SUM ((fn_vcount) * get_ed_from_smid (fk_smid))
                FROM (SELECT   COUNT (fk_smid) fn_vcount, fk_smid
                          FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                          FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                                         FROM DUAL),
                               (SELECT get_synid ('ANAL_BIOHIM') fk_analbiohimid
                                  FROM DUAL)
                         WHERE fk_nazsosid = fk_nazvip AND fk_razdid = fk_biohimid AND fk_smid <> fk_analbiohimid
                               AND fd_run = pfd_date
                      GROUP BY fk_smid));

    i NUMBER;
  BEGIN
    IF pfn_type = 1
    THEN   --Клиника
      IF pfl_bigger = 1
      THEN
        OPEN c1;

        FETCH c1
         INTO i;

        CLOSE c1;
      ELSE
        OPEN c11;

        FETCH c11
         INTO i;

        CLOSE c11;
      END IF;
    ELSIF pfn_type = 2
    THEN   --Биохимия
      IF pfl_bigger = 1
      THEN
        OPEN c2;

        FETCH c2
         INTO i;

        CLOSE c2;
      ELSE
        OPEN c21;

        FETCH c21
         INTO i;

        CLOSE c21;
      END IF;
    ELSIF pfn_type = 3
    THEN   --Всего
      OPEN c3;

      FETCH c3
       INTO i;

      CLOSE c3;
    ELSIF pfn_type = 4
    THEN   --Всего биохимия
      OPEN c4;

      FETCH c4
       INTO i;

      CLOSE c4;
    END IF;

    RETURN i;
  END;

/*------------------------------------------------------------------------------------------------*/
  FUNCTION get_count_lab_period (pfd_data1 IN DATE, pfd_data2 IN DATE, pfn_type IN NUMBER)
    RETURN NUMBER
  IS
    CURSOR c
    IS
      SELECT /*+RULE*/
             COUNT (DISTINCT fk_pacid)
        FROM (SELECT fk_pacid
                FROM texpan,
                     (SELECT DISTINCT fk_id fk_vnazid, fk_pacid
                                 FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                                 FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                                                FROM DUAL)
                                WHERE fk_nazsosid = fk_nazvip AND fk_razdid = fk_biohimid
                                      AND fd_run BETWEEN pfd_data1 AND pfd_data2)
               WHERE fk_nazid = fk_vnazid
              UNION ALL
              SELECT fk_pacid
                FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                               FROM DUAL), (SELECT get_synid ('ANAL_BIOHIM') fk_analbiohimid
                                                              FROM DUAL)
               WHERE fk_nazsosid = fk_nazvip AND fk_razdid = fk_biohimid AND fk_smid <> fk_analbiohimid
                     AND fd_run BETWEEN pfd_data1 AND pfd_data2
              UNION ALL
              SELECT fk_pacid
                FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                               FROM DUAL)
               WHERE fk_nazsosid = fk_nazvip AND fk_razdid <> fk_biohimid AND fd_run BETWEEN pfd_data1 AND pfd_data2);

    CURSOR c1
    IS
      SELECT SUM (fn_count)
        FROM (SELECT SUM ((fn_vcount + 1) * get_ed_from_smid (fk_smid)) fn_count
                FROM (SELECT   COUNT (fk_smid) fn_vcount, fk_smid, fd_run
                          FROM texpan,
                               (SELECT DISTINCT fk_id fk_vnazid, fd_run
                                           FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                                           FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                                                          FROM DUAL),
                                                (SELECT get_synid ('ANAL_BIOHIM') fk_analbiohimid
                                                   FROM DUAL)
                                          WHERE fk_nazsosid = fk_nazvip AND fk_razdid = fk_biohimid
                                                AND fk_smid = fk_analbiohimid
                                                AND fd_run BETWEEN pfd_data1 AND pfd_data2)
                         WHERE fk_nazid = fk_vnazid
                      GROUP BY fk_smid, fd_run)
              UNION ALL
              SELECT SUM ((fn_vcount) * get_ed_from_smid (fk_smid))
                FROM (SELECT   COUNT (fk_smid) fn_vcount, fk_smid, fd_run
                          FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                          FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                                         FROM DUAL),
                               (SELECT get_synid ('ANAL_BIOHIM') fk_analbiohimid
                                  FROM DUAL)
                         WHERE fk_nazsosid = fk_nazvip AND fk_razdid = fk_biohimid AND fk_smid <> fk_analbiohimid
                               AND fd_run BETWEEN pfd_data1 AND pfd_data2
                      GROUP BY fk_smid, fd_run)
              UNION ALL
              SELECT SUM (fn_vcount * get_ed_from_smid (fk_smid))
                FROM (SELECT   COUNT (fk_smid) fn_vcount, fk_smid
                          FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                          FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                                         FROM DUAL)
                         WHERE fk_nazsosid = fk_nazvip AND fk_razdid <> fk_biohimid
                               AND fd_run BETWEEN pfd_data1 AND pfd_data2
                      GROUP BY fk_smid));

    i NUMBER;
  BEGIN
    IF pfn_type = 1
    THEN
      OPEN c;

      FETCH c
       INTO i;

      CLOSE c;
    ELSE
      OPEN c1;

      FETCH c1
       INTO i;

      CLOSE c1;
    END IF;

    RETURN i;
  END;

/*------------------------------------------------------------------------------------------------*/
  FUNCTION get_count_period_otdel_vozr (pfd_data1 IN DATE, pfd_data2 IN DATE, pfn_type IN NUMBER, pfn_vozr IN NUMBER,
  pfl_bigger IN NUMBER)
    RETURN NUMBER
  IS
    CURSOR ckpa
    IS
      SELECT COUNT (DISTINCT fk_pacid)
        FROM tnazan, (SELECT get_vipnaz fk_nazvip
                        FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                       FROM DUAL)
       WHERE fk_nazsosid = fk_nazvip AND fk_razdid <> fk_biohimid AND fd_run BETWEEN pfd_data1 AND pfd_data2
             AND get_age_date (fk_pacid, fd_run) >= pfn_vozr;

    CURSOR ckpd
    IS
      SELECT COUNT (DISTINCT fk_pacid)
        FROM tnazan, (SELECT get_vipnaz fk_nazvip
                        FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                       FROM DUAL)
       WHERE fk_nazsosid = fk_nazvip AND fk_razdid <> fk_biohimid AND fd_run BETWEEN pfd_data1 AND pfd_data2
             AND get_age_date (fk_pacid, fd_run) < pfn_vozr;

    CURSOR ckia
    IS
      SELECT SUM (fn_vcount * get_ed_from_smid (fk_smid))
        FROM (SELECT   COUNT (fk_smid) fn_vcount, fk_smid
                  FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                  FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                                 FROM DUAL)
                 WHERE fk_nazsosid = fk_nazvip AND fk_razdid <> fk_biohimid AND fd_run BETWEEN pfd_data1 AND pfd_data2
                       AND get_age_date (fk_pacid, fd_run) >= pfn_vozr
              GROUP BY fk_smid);

    CURSOR ckid
    IS
      SELECT SUM (fn_vcount * get_ed_from_smid (fk_smid))
        FROM (SELECT   COUNT (fk_smid) fn_vcount, fk_smid
                  FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                  FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                                 FROM DUAL)
                 WHERE fk_nazsosid = fk_nazvip AND fk_razdid <> fk_biohimid AND fd_run BETWEEN pfd_data1 AND pfd_data2
                       AND get_age_date (fk_pacid, fd_run) < pfn_vozr
              GROUP BY fk_smid);

    CURSOR cbpa
    IS
      SELECT /*+RULE*/
             COUNT (DISTINCT fk_pacid)
        FROM (SELECT fk_pacid
                FROM texpan,
                     (SELECT DISTINCT fk_id fk_vnazid, fk_pacid
                                 FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                                 FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                                                FROM DUAL)
                                WHERE fk_nazsosid = fk_nazvip AND fk_razdid = fk_biohimid
                                      AND get_age_date (fk_pacid, fd_run) >= pfn_vozr
                                      AND fd_run BETWEEN pfd_data1 AND pfd_data2)
               WHERE fk_nazid = fk_vnazid
--                 AND GET_PACVOZR (FK_PACID) >= pFN_VOZR
              UNION ALL
              SELECT fk_pacid
                FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                               FROM DUAL), (SELECT get_synid ('ANAL_BIOHIM') fk_analbiohimid
                                                              FROM DUAL)
               WHERE fk_nazsosid = fk_nazvip AND fk_razdid = fk_biohimid AND fk_smid <> fk_analbiohimid
                     AND fd_run BETWEEN pfd_data1 AND pfd_data2 AND get_age_date (fk_pacid, fd_run) >= pfn_vozr);

    CURSOR cbpd
    IS
      SELECT /*+RULE*/
             COUNT (DISTINCT fk_pacid)
        FROM (SELECT fk_pacid
                FROM texpan,
                     (SELECT DISTINCT fk_id fk_vnazid, fk_pacid
                                 FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                                 FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                                                FROM DUAL)
                                WHERE fk_nazsosid = fk_nazvip AND fk_razdid = fk_biohimid
                                      AND get_age_date (fk_pacid, fd_run) < pfn_vozr
                                      AND fd_run BETWEEN pfd_data1 AND pfd_data2)
               WHERE fk_nazid = fk_vnazid
--                 AND GET_PACVOZR (FK_PACID) < pFN_VOZR
              UNION ALL
              SELECT fk_pacid
                FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                               FROM DUAL), (SELECT get_synid ('ANAL_BIOHIM') fk_analbiohimid
                                                              FROM DUAL)
               WHERE fk_nazsosid = fk_nazvip AND fk_razdid = fk_biohimid AND fk_smid <> fk_analbiohimid
                     AND fd_run BETWEEN pfd_data1 AND pfd_data2 AND get_age_date (fk_pacid, fd_run) < pfn_vozr);

    CURSOR cbia
    IS
      SELECT SUM (fn_count)
        FROM (SELECT SUM ((fn_vcount) * get_ed_from_smid (fk_smid)) fn_count
                FROM (SELECT   COUNT (fk_smid) fn_vcount, fk_smid, fd_run
                          FROM texpan,
                               (SELECT DISTINCT fk_id fk_vnazid, fd_run
                                           FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                                           FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                                                          FROM DUAL),
                                                (SELECT get_synid ('ANAL_BIOHIM') fk_analbiohimid
                                                   FROM DUAL)
                                          WHERE fk_nazsosid = fk_nazvip AND fk_razdid = fk_biohimid
                                                AND fk_smid = fk_analbiohimid
                                                AND fd_run BETWEEN pfd_data1 AND pfd_data2
                                                AND get_age_date (fk_pacid, fd_run) >= pfn_vozr)
                         WHERE fk_nazid = fk_vnazid
                      GROUP BY fk_smid, fd_run)
              UNION ALL
              SELECT SUM ((fn_vcount) * get_ed_from_smid (fk_smid))
                FROM (SELECT   COUNT (fk_smid) fn_vcount, fk_smid, fd_run
                          FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                          FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                                         FROM DUAL),
                               (SELECT get_synid ('ANAL_BIOHIM') fk_analbiohimid
                                  FROM DUAL)
                         WHERE fk_nazsosid = fk_nazvip AND fk_razdid = fk_biohimid AND fk_smid <> fk_analbiohimid
                               AND fd_run BETWEEN pfd_data1 AND pfd_data2
                               AND get_age_date (fk_pacid, fd_run) >= pfn_vozr
                      GROUP BY fk_smid, fd_run));

    CURSOR cbid
    IS
      SELECT SUM (fn_count)
        FROM (SELECT SUM ((fn_vcount) * get_ed_from_smid (fk_smid)) fn_count
                FROM (SELECT   COUNT (fk_smid) fn_vcount, fk_smid, fd_run
                          FROM texpan,
                               (SELECT DISTINCT fk_id fk_vnazid, fd_run
                                           FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                                           FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                                                          FROM DUAL),
                                                (SELECT get_synid ('ANAL_BIOHIM') fk_analbiohimid
                                                   FROM DUAL)
                                          WHERE fk_nazsosid = fk_nazvip AND fk_razdid = fk_biohimid
                                                AND fk_smid = fk_analbiohimid
                                                AND fd_run BETWEEN pfd_data1 AND pfd_data2
                                                AND get_age_date (fk_pacid, fd_run) < pfn_vozr)
                         WHERE fk_nazid = fk_vnazid
                      GROUP BY fk_smid, fd_run)
              UNION ALL
              SELECT SUM ((fn_vcount) * get_ed_from_smid (fk_smid))
                FROM (SELECT   COUNT (fk_smid) fn_vcount, fk_smid, fd_run
                          FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                          FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                                         FROM DUAL),
                               (SELECT get_synid ('ANAL_BIOHIM') fk_analbiohimid
                                  FROM DUAL)
                         WHERE fk_nazsosid = fk_nazvip AND fk_razdid = fk_biohimid AND fk_smid <> fk_analbiohimid
                               AND fd_run BETWEEN pfd_data1 AND pfd_data2 AND get_age_date (fk_pacid, fd_run) <
                                                                                                               pfn_vozr
                      GROUP BY fk_smid, fd_run));

-----
    CURSOR ctpa
    IS
      SELECT /*+RULE*/
             COUNT (DISTINCT fk_pacid)
        FROM (SELECT fk_pacid
                FROM texpan,
                     (SELECT DISTINCT fk_id fk_vnazid, fk_pacid
                                 FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                                 FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                                                FROM DUAL)
                                WHERE fk_nazsosid = fk_nazvip AND fk_razdid = fk_biohimid
                                      AND fd_run BETWEEN pfd_data1 AND pfd_data2
                                      AND get_age_date (fk_pacid, fd_run) >= pfn_vozr)
               WHERE fk_nazid = fk_vnazid
              UNION ALL
              SELECT fk_pacid
                FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                               FROM DUAL), (SELECT get_synid ('ANAL_BIOHIM') fk_analbiohimid
                                                              FROM DUAL)
               WHERE fk_nazsosid = fk_nazvip AND fk_razdid = fk_biohimid AND fk_smid <> fk_analbiohimid
                     AND fd_run BETWEEN pfd_data1 AND pfd_data2 AND get_age_date (fk_pacid, fd_run) >= pfn_vozr
              UNION ALL
              SELECT fk_pacid
                FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                               FROM DUAL)
               WHERE fk_nazsosid = fk_nazvip AND fk_razdid <> fk_biohimid AND fd_run BETWEEN pfd_data1 AND pfd_data2
                     AND get_age_date (fk_pacid, fd_run) >= pfn_vozr);

    CURSOR ctpd
    IS
      SELECT /*+RULE*/
             COUNT (DISTINCT fk_pacid)
        FROM (SELECT fk_pacid
                FROM texpan,
                     (SELECT DISTINCT fk_id fk_vnazid, fk_pacid
                                 FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                                 FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                                                FROM DUAL),
                                      (SELECT get_synid ('ANAL_BIOHIM') fk_analbiohimid
                                         FROM DUAL)
                                WHERE fk_nazsosid = fk_nazvip AND fk_razdid = fk_biohimid AND fk_smid = fk_analbiohimid
                                      AND fd_run BETWEEN pfd_data1 AND pfd_data2
                                      AND get_age_date (fk_pacid, fd_run) < pfn_vozr)
               WHERE fk_nazid = fk_vnazid
              UNION ALL
              SELECT fk_pacid
                FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                               FROM DUAL), (SELECT get_synid ('ANAL_BIOHIM') fk_analbiohimid
                                                              FROM DUAL)
               WHERE fk_nazsosid = fk_nazvip AND fk_razdid = fk_biohimid AND fk_smid <> fk_analbiohimid
                     AND fd_run BETWEEN pfd_data1 AND pfd_data2 AND get_age_date (fk_pacid, fd_run) < pfn_vozr
              UNION ALL
              SELECT fk_pacid
                FROM tnazan, (SELECT get_vipnaz fk_nazvip
                                FROM DUAL), (SELECT get_synid ('RAZ_BIOHIM') fk_biohimid
                                               FROM DUAL)
               WHERE fk_nazsosid = fk_nazvip AND fk_razdid <> fk_biohimid AND fd_run BETWEEN pfd_data1 AND pfd_data2
                     AND get_age_date (fk_pacid, fd_run) < pfn_vozr);

    i NUMBER;
  BEGIN
    IF pfn_type = 1
    THEN   --Клиника люди
      IF pfl_bigger = 1
      THEN
        OPEN ckpa;

        FETCH ckpa
         INTO i;

        CLOSE ckpa;
      ELSE
        OPEN ckpd;

        FETCH ckpd
         INTO i;

        CLOSE ckpd;
      END IF;
    ELSIF pfn_type = 2
    THEN   --Клиника исследования
      IF pfl_bigger = 1
      THEN
        OPEN ckia;

        FETCH ckia
         INTO i;

        CLOSE ckia;
      ELSE
        OPEN ckid;

        FETCH ckid
         INTO i;

        CLOSE ckid;
      END IF;
    ELSIF pfn_type = 3
    THEN   --Биохимия люди
      IF pfl_bigger = 1
      THEN
        OPEN cbpa;

        FETCH cbpa
         INTO i;

        CLOSE cbpa;
      ELSE
        OPEN cbpd;

        FETCH cbpd
         INTO i;

        CLOSE cbpd;
      END IF;
    ELSIF pfn_type = 4
    THEN   --Биохимия исследования
      IF pfl_bigger = 1
      THEN
        OPEN cbia;

        FETCH cbia
         INTO i;

        CLOSE cbia;
      ELSE
        OPEN cbid;

        FETCH cbid
         INTO i;

        CLOSE cbid;
      END IF;
    ELSIF pfn_type = 5
    THEN   --Всего взрослых
      OPEN ctpa;

      FETCH ctpa
       INTO i;

      CLOSE ctpa;
    ELSIF pfn_type = 6
    THEN   --Всего детей
      OPEN ctpd;

      FETCH ctpd
       INTO i;

      CLOSE ctpd;
    END IF;

    RETURN i;
  END;

/*------------------------------------------------------------------------------------------------*/
  FUNCTION get_daily_work_vitiaz (pfd_data1 IN DATE, pfd_data2 IN DATE, pfk_vrachid IN NUMBER)
    RETURN NUMBER
  IS
    nc NUMBER;
    cc CLOB;
    str VARCHAR2 (32767);
    tdates tdatetable;
    nt NUMBER;
    n NUMBER;
  BEGIN
    FOR i IN 1 .. (TRUNC (pfd_data2) - TRUNC (pfd_data1)) + 1
    LOOP
      tdates (i) := pfd_data1 + i - 1;
    END LOOP;

    DBMS_LOB.createtemporary (cc, TRUE, DBMS_LOB.SESSION);
    str :=
      '<html><head><meta http-equiv="Content-Type" content="text/html; charset=windows-1251">' || '<style><!-- '
      || ' .sm_td {width:119.6pt;border:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt} '
      || ' .sm_table{border-collapse:collapse;border:none;mso-border-alt:solid windowtext .5pt;mso-padding-alt:0cm 5.4pt 0cm 5.4pt} '
      || '--></style></head>' || '<P ALIGN="CENTER"><B><font size="+1">Клинико - диагностическая лаборатория ЛОК "'
      || pkg_smini.readstring ('CONFIG', 'S_NAME', 'Не известен') || '"</font></B><BR>';
    str := str || '<ALIGN="CENTER"><font size="+2">Ежедневный отчёт о работе лаборатории</font><br>';
    str := str || 'за период с ' || TO_CHAR (pfd_data1, 'dd.mm.yyyy') || ' по ' || TO_CHAR (pfd_data2, 'dd.mm.yyyy');
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    str := '<P><table align="center" width="100%" border="1" class = "sm_table" cellpadding="0" cellspacing="0">';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);

    FOR i IN 0 .. tdates.COUNT - 1
    LOOP
      IF (i / 6) = TRUNC (i / 6)
      THEN
        --Шапка
        str := '<TR ALIGN="CENTER"><TD class="sm_td" ALIGN="LEFT"><B>Дни:</B></TD>';
        DBMS_LOB.writeappend (cc, LENGTH (str), str);
        nt := 1;

        FOR j IN 1 .. 6
        LOOP
          EXIT WHEN i + j > tdates.COUNT;
          nt := nt + 2;
          str := '<TD class="sm_td" COLSPAN="2"><B>' || TO_CHAR (tdates (i + j), 'dd.mm.yyyy') || '</B></TD>';
          DBMS_LOB.writeappend (cc, LENGTH (str), str);
        END LOOP;

        str := '</TR>';
        DBMS_LOB.writeappend (cc, LENGTH (str), str);
        str := '<TR ALIGN="CENTER"><TD class="sm_td" ALIGN="LEFT"><B>Анализы:</B></TD>';
        DBMS_LOB.writeappend (cc, LENGTH (str), str);

        FOR j IN 1 .. 6
        LOOP
          EXIT WHEN i + j > tdates.COUNT;
          str := '<TD class="sm_td"><B>Людей:</B></TD><TD class="sm_td"><B>Анализов:</B></TD>';
          DBMS_LOB.writeappend (cc, LENGTH (str), str);
        END LOOP;

        str := '</TR>';
        DBMS_LOB.writeappend (cc, LENGTH (str), str);
        --EOf Шапка
        --Данные
        --Клинические взр.
        str := '<TR ALIGN="CENTER"><TD class="sm_td" ALIGN="LEFT"><B>Клинические (взр.):</B></TD>';
        DBMS_LOB.writeappend (cc, LENGTH (str), str);

        FOR j IN 1 .. 6
        LOOP
          EXIT WHEN i + j > tdates.COUNT;
          n := get_count_klin_vozr_issl (tdates (i + j), 16, 1, 1);

          IF n IS NULL
          THEN
            n := 0;
          END IF;

          str :=
            '<TD class="sm_td">' || get_count_klin_vozr_pac (tdates (i + j), 16, 1, 1) || '</TD><TD class="sm_td">' || n
            || '</TD>';
          DBMS_LOB.writeappend (cc, LENGTH (str), str);
        END LOOP;

        str := '</TR>';
        DBMS_LOB.writeappend (cc, LENGTH (str), str);
        --       Клинические дет.
        str := '<TR ALIGN="CENTER"><TD class="sm_td" ALIGN="LEFT"><B>Клинические (дет.):</B></TD>';
        DBMS_LOB.writeappend (cc, LENGTH (str), str);

        FOR j IN 1 .. 6
        LOOP
          EXIT WHEN i + j > tdates.COUNT;
          n := get_count_klin_vozr_issl (tdates (i + j), 16, 0, 1);

          IF n IS NULL
          THEN
            n := 0;
          END IF;

          str :=
            '<TD class="sm_td">' || get_count_klin_vozr_pac (tdates (i + j), 16, 0, 1) || '</TD><TD class="sm_td">' || n
            || '</TD>';
          DBMS_LOB.writeappend (cc, LENGTH (str), str);
        END LOOP;

        str := '</TR>';
        DBMS_LOB.writeappend (cc, LENGTH (str), str);
        --Биохимия взр.
        str := '<TR ALIGN="CENTER"><TD class="sm_td" ALIGN="LEFT"><B>Биохимические (взр.):</B></TD>';
        DBMS_LOB.writeappend (cc, LENGTH (str), str);

        FOR j IN 1 .. 6
        LOOP
          EXIT WHEN i + j > tdates.COUNT;
          n := get_count_klin_vozr_issl (tdates (i + j), 16, 1, 2);

          IF n IS NULL
          THEN
            n := 0;
          END IF;

          str :=
            '<TD class="sm_td">' || get_count_klin_vozr_pac (tdates (i + j), 16, 1, 2) || '</TD><TD class="sm_td">' || n
            || '</TD>';
          DBMS_LOB.writeappend (cc, LENGTH (str), str);
        END LOOP;

        str := '</TR>';
        DBMS_LOB.writeappend (cc, LENGTH (str), str);
        --Биохимия дет.
        str := '<TR ALIGN="CENTER"><TD class="sm_td" ALIGN="LEFT"><B>Биохимические (дет.):</B></TD>';
        DBMS_LOB.writeappend (cc, LENGTH (str), str);

        FOR j IN 1 .. 6
        LOOP
          EXIT WHEN i + j > tdates.COUNT;
          n := get_count_klin_vozr_issl (tdates (i + j), 16, 0, 2);

          IF n IS NULL
          THEN
            n := 0;
          END IF;

          str :=
            '<TD class="sm_td">' || get_count_klin_vozr_pac (tdates (i + j), 16, 0, 2) || '</TD><TD class="sm_td">' || n
            || '</TD>';
          DBMS_LOB.writeappend (cc, LENGTH (str), str);
        END LOOP;

        str := '</TR>';
        DBMS_LOB.writeappend (cc, LENGTH (str), str);
        --Total
        --Биохимия всего.
        str := '<TR ALIGN="CENTER"><TD class="sm_td" ALIGN="LEFT"><B>Биохимические (всего):</B></TD>';
        DBMS_LOB.writeappend (cc, LENGTH (str), str);

        FOR j IN 1 .. 6
        LOOP
          EXIT WHEN i + j > tdates.COUNT;
          n := get_count_klin_vozr_issl (tdates (i + j), 16, 0, 4);

          IF n IS NULL
          THEN
            n := 0;
          END IF;

          str :=
            '<TD class="sm_td">' || get_count_klin_vozr_pac (tdates (i + j), 16, 0, 4) || '</TD><TD class="sm_td">' || n
            || '</TD>';
          DBMS_LOB.writeappend (cc, LENGTH (str), str);
        END LOOP;

        str := '</TR>';
        DBMS_LOB.writeappend (cc, LENGTH (str), str);
        --Total
        str := '<TR ALIGN="CENTER"><TD class="sm_td" ALIGN="LEFT"><B>Итого:</B></TD>';
        DBMS_LOB.writeappend (cc, LENGTH (str), str);

        FOR j IN 1 .. 6
        LOOP
          EXIT WHEN i + j > tdates.COUNT;
          n := get_count_klin_vozr_issl (tdates (i + j), 16, 1, 3);

          IF n IS NULL
          THEN
            n := 0;
          END IF;

          str :=
            '<TD class="sm_td">' || get_count_klin_vozr_pac (tdates (i + j), 16, 1, 3) || '</TD><TD class="sm_td">' || n
            || '</TD>';
          DBMS_LOB.writeappend (cc, LENGTH (str), str);
          progress_bar.stepit;
        END LOOP;

        str := '</TR><TR><TD class="sm_td" COLSPAN="' || nt || '">;</TD></TR>';
        DBMS_LOB.writeappend (cc, LENGTH (str), str);
      END IF;
    END LOOP;

    str := '</TABLE></P>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    str := '<P><table align="LEFT" width="60%" border="0"  cellpadding="0" cellspacing="0">';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    str :=
      '<TR ALIGN="LEFT"><TD ROWSPAN="2" COLSPAN="2"><B>Итого за отчетный период:</B></TD><TD>Людей:</TD><TD>'
      || get_count_lab_period (pfd_data1, pfd_data2, 1) || '</TD></TR>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    n := get_count_lab_period (pfd_data1, pfd_data2, 2);

    IF n IS NULL
    THEN
      n := 0;
    END IF;

    str := '<TR ALIGN="LEFT"><TD>Анализов:</TD><TD>' || n || '</TD></TR>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    str :=
      '<TR ALIGN="LEFT"><TD ROWSPAN="4"><B>Клинический отдел:</B></TD><TD ROWSPAN="2">Взрослые:</TD><TD>Людей:</TD><TD>'
      || get_count_period_otdel_vozr (pfd_data1, pfd_data2, 1, 16, 1) || '</TD></TR>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    n := get_count_period_otdel_vozr (pfd_data1, pfd_data2, 2, 16, 1);

    IF n IS NULL
    THEN
      n := 0;
    END IF;

    str := '<TR ALIGN="LEFT"><TD>Анализов:</TD><TD>' || n || '</TD></TR>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    str :=
      '<TR ALIGN="LEFT"><TD ROWSPAN="2">Дети:</TD><TD>Людей:</TD><TD>'
      || get_count_period_otdel_vozr (pfd_data1, pfd_data2, 1, 16, 0) || '</TD></TR>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    n := get_count_period_otdel_vozr (pfd_data1, pfd_data2, 2, 16, 0);

    IF n IS NULL
    THEN
      n := 0;
    END IF;

    str := '<TR ALIGN="LEFT"><TD>Анализов:</TD><TD>' || n || '</TD></TR>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    str :=
      '<TR ALIGN="LEFT"><TD ROWSPAN="4"><B>Биохимический отдел:</B></TD><TD ROWSPAN="2">Взрослые:</TD><TD>Людей:</TD><TD>'
      || get_count_period_otdel_vozr (pfd_data1, pfd_data2, 3, 16, 1) || '</TD></TR>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    n := get_count_period_otdel_vozr (pfd_data1, pfd_data2, 4, 16, 1);

    IF n IS NULL
    THEN
      n := 0;
    END IF;

    str := '<TR ALIGN="LEFT"><TD>Анализов:</TD><TD>' || n || '</TD></TR>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    str :=
      '<TR ALIGN="LEFT"><TD ROWSPAN="2">Дети:</TD><TD>Людей:</TD><TD>'
      || get_count_period_otdel_vozr (pfd_data1, pfd_data2, 3, 16, 0) || '</TD></TR>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    n := get_count_period_otdel_vozr (pfd_data1, pfd_data2, 4, 16, 0);

    IF n IS NULL
    THEN
      n := 0;
    END IF;

    str := '<TR ALIGN="LEFT"><TD>Анализов:</TD><TD>' || n || '</TD></TR>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    str :=
      '<TR ALIGN="LEFT"><TD ROWSPAN="2"><B>Итого за отчетный период:</B></TD><TD COLSPAN="2">Взрослые:</TD><TD>'
      || get_count_period_otdel_vozr (pfd_data1, pfd_data2, 5, 16, 0) || '</TD></TR>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    str :=
      '<TR ALIGN="LEFT"><TD COLSPAN="2">Дети:</TD><TD>' || get_count_period_otdel_vozr (pfd_data1, pfd_data2, 6, 16, 0)
      || '</TD></TR>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    str := '</TABLE></P></HTML>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);

    INSERT INTO tclobs
                (fc_clob)
         VALUES (cc)
      RETURNING fk_id
           INTO nc;

    RETURN nc;
  END;

/*------------------------------------------------------------------------------------------------*/
  FUNCTION get_lab_work_issl_vitiaz (pfd_data1 IN DATE, pfd_data2 IN DATE, pfk_vrachid IN NUMBER)
    RETURN NUMBER
  IS
    nc NUMBER;
    cc CLOB;
    str VARCHAR2 (32767);
    tdates tdatetable;
    nt NUMBER;
  BEGIN
    FOR i IN 1 .. (TRUNC (pfd_data2) - TRUNC (pfd_data1)) + 1
    LOOP
      tdates (i) := pfd_data1 + i - 1;
    END LOOP;

    DBMS_LOB.createtemporary (cc, TRUE, DBMS_LOB.SESSION);
    str :=
      '<html><head><meta http-equiv="Content-Type" content="text/html; charset=windows-1251"></head>'
      || '<P ALIGN="CENTER"><B><font size="+1">Клинико - диагностическая лаборатория ЛОК "'
      || pkg_smini.readstring ('CONFIG', 'S_NAME', 'Не известен') || '"</font></B><BR>';
    str := str || '<ALIGN="CENTER"><font size="+2">Ежедневный отчёт о работе лаборатории</font><br>';
    str := str || 'за период с ' || TO_CHAR (pfd_data1, 'dd.mm.yyyy') || ' по ' || TO_CHAR (pfd_data2, 'dd.mm.yyyy');
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    str :=
      '<P><table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    str :=
      '<TR ALIGN="CENTER"><TD ROWSPAN="2"><B>Наименование исследования:</B></TD><TD COLSPAN="3"><B>Кол-во пациентов</B></TD><TD COLSPAN="3"><B>Кол-во исследований</B></TD></TR>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    str :=
      '<TR ALIGN="CENTER"><TD><B>Врослые:</B></TD><TD><B>Дети:</B></TD><TD><B>С патологией:</B></TD><TD><B>Врослые:</B></TD><TD><B>Дети:</B></TD><TD><B>С патологией:</B></TD></TR>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    str := '</TABLE></P></HTML>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);

    INSERT INTO tclobs
                (fc_clob)
         VALUES (cc)
      RETURNING fk_id
           INTO nc;

    RETURN nc;
  END;

-------------------------Количество фактических исследований и анализов по контролю качества---------------------------
  FUNCTION get_fuck_povt_contr_lab_dub (pfn_year IN NUMBER, pfn_count IN NUMBER, pfk_vrachid IN NUMBER)
    RETURN NUMBER
  IS
    nc NUMBER;
    cc CLOB;
    str VARCHAR2 (32767);
    styear NUMBER;
    tyears tnumtable;
    n NUMBER;

/*    CURSOR c (pOWNER NUMBER) IS
      SELECT FK_ID
        FROM TSMID
       WHERE GET_LAB_OTDEL(FK_ID)=pOWNER and FL_SHOWANAL=1 AND FL_STAT=1
       ORDER BY FN_ORDER;
*/
    CURSOR c (pid NUMBER)
    IS
      SELECT     fk_id, fc_name
            FROM tsmid
           WHERE fl_showanal = 1 AND fl_stat = 1
      START WITH fk_id = pid
      CONNECT BY PRIOR fk_id = fk_owner
        ORDER BY fn_order;

    CURSOR cotdel (pid NUMBER)
    IS
      SELECT     fk_id, fc_name
            FROM tsmid
           WHERE fl_showanal = 0 AND fl_stat = 1
      START WITH fk_id = pid
      CONNECT BY PRIOR fk_id = fk_owner
        ORDER BY fn_order;

    strout VARCHAR2 (200);
    ntootdel NUMBER;
    ncalc NUMBER;
    ncheck NUMBER;

    CURSOR ccheck (pid NUMBER)
    IS
      SELECT     COUNT (fk_id)
            FROM tsmid
           WHERE fl_showanal = 1 AND fl_stat = 1
      START WITH fk_id = pid
      CONNECT BY PRIOR fk_id = fk_owner;

    nrow NUMBER;
  BEGIN
    styear := pfn_year - pfn_count + 1;

    FOR i IN 1 .. pfn_count
    LOOP
      tyears (i) := styear + i - 1;
    END LOOP;

    DBMS_LOB.createtemporary (cc, TRUE, DBMS_LOB.SESSION);
    str :=
      get_html_header (0) || '<BODY><div class=Section1> '
      || '<P ALIGN="CENTER"><B><font size="+1">Клинико - диагностическая лаборатория санатория "'
      || pkg_smini.readstring ('CONFIG', 'S_NAME', 'Не известен') || '"</font></B><BR>';
    str :=
      str
      || '<ALIGN="CENTER"><font size="+1">Количество фактических исследований, повторов и анализов по контролю качества </font><br>';
    str := str || 'за период с ' || styear || ' г. по ' || pfn_year || ' г.';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    str := '<table align="center" border="1" class = "sm_table" cellpadding="0" cellspacing="0">';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    str :=
      '<TR ALIGN="CENTER">   <td height=17 class=xl25 border="1" width=36 style=''''height:12.75pt;width:27pt''''height:12.75pt;width:19pt>№:</td>'
      || '<td class=xl27 border="1" width=385 style=''''border-left:none;width:289pt''''height:12.75pt;width:350pt>;</TD>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    str := '';

    FOR i IN 1 .. tyears.COUNT
    LOOP
      str := str || '<TD class="sm_td " width="10%">' || tyears (i) || '</TD>';
    END LOOP;

    str := str || '</TR>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    nrow := 1;

    FOR j IN 1 .. 9
    LOOP
      str := '<TR ALIGN="LEFT"><TD class="sm_td ">' || nrow || '</TD>';

      IF j = 1
      THEN
        str := str || '<TD class="sm_td "><B>Всего по КДЛ:</B></TD>';
        strout := 'Всего по КДЛ';
      ELSIF j = 2
      THEN
        str := str || '<TD class="sm_td ">Из них фактических исследований:</TD>';
        strout := 'Из них фактических исследований';
      ELSIF j = 3
      THEN
        str := str || '<TD class="sm_td ">В %:</TD>';
        strout := '% фактических исследований';
      ELSIF j = 4
      THEN
        str := str || '<TD class="sm_td ">Повторы:</TD>';
        strout := 'Повторы';
      ELSIF j = 5
      THEN
        str := str || '<TD class="sm_td ">В %:</TD>';
        strout := '% повторов';
      ELSIF j = 6
      THEN
        str := str || '<TD class="sm_td ">К/к:</TD>';
        strout := 'К/к';
      ELSIF j = 7
      THEN
        str := str || '<TD class="sm_td ">В %:</TD>';
        strout := 'В %';
      ELSIF j = 8
      THEN
        str := str || '<TD class="sm_td ">Санитарно-гигиенические:</TD>';
        strout := 'Санитарно-гигиенические';
      ELSIF j = 9
      THEN
        str := str || '<TD class="sm_td ">В %:</TD>';
        strout := '% санитарно-гигиенических';
      ELSIF j = 10
      THEN
        str := str || '<TD class="sm_td ">Патологических результатов:</TD>';
        strout := 'Патологических результатов';
      ELSIF j = 11
      THEN
        str := str || '<TD class="sm_td ">% патологических результатов:</TD>';
        strout := '% патологических результатов';
      ELSIF j = 12
      THEN
        str := str || '<TD class="sm_td ">Из них впервые выявленных патологий:</TD>';
        strout := 'Из них впервые выявленных патологий';
      ELSIF j = 13
      THEN
        str := str || '<TD class="sm_td ">Впервые выявленных патологий в %:</TD>';
        strout := 'Из них впервые выявленных патологий в %';
      END IF;

      FOR i IN 1 .. tyears.COUNT
      LOOP
        progress_bar.setstrout (strout || ' за ' || tyears (i) || ' год');
        progress_bar.stepit;
        str :=
          str || '<TD class="sm_td " ALIGN="CENTER">'
          || REPLACE (TO_CHAR (pkg_lab_stat_funcs.get_count_issl_fuck_povt_contr (TO_DATE ('01.01.' || tyears (i),
                                                                                           'dd.mm.yyyy'),
                                                                                  TO_DATE ('31.12.' || tyears (i),
                                                                                           'dd.mm.yyyy'),
                                                                                  (-1), j, (-1)),
                               'FM99999999990.09'),
                      '.', ',')
          || '</TD>';
      END LOOP;

      str := str || '</TR>';
      DBMS_LOB.writeappend (cc, LENGTH (str), str);
      nrow := nrow + 1;
    END LOOP;

    FOR p IN cotdel (get_synid ('RAZ_ANAL'))
    LOOP
      OPEN ccheck (p.fk_id);

      FETCH ccheck
       INTO ncheck;

      CLOSE ccheck;

      IF ncheck = 0
      THEN
        ntootdel := 13;
      ELSE
        ntootdel := 7;
      END IF;

      IF get_synid ('OTDEL_BAKTER') = p.fk_id
      THEN
        ntootdel := 15;
      END IF;

      FOR j IN 1 .. ntootdel
      LOOP
        str := '<TR ALIGN="LEFT"><TD class="sm_td ">' || nrow || '</TD>';

        IF j = 1
        THEN
          str := str || '<TD class="sm_td "><B>Всего по ' || get_name_from_smid (p.fk_id) || ':</B></TD>';
          strout := 'Всего по ' || get_name_from_smid (p.fk_id);
          ncalc := j;
        ELSIF j = 2
        THEN
          str := str || '<TD class="sm_td ">Из них фактических исследований:</TD>';
          strout := 'Из них фактических исследований';
          ncalc := j;
        ELSIF j = 3
        THEN
          str := str || '<TD class="sm_td ">В %:</TD>';
          strout := '% фактических исследований';
          ncalc := j;
        ELSIF j = 4
        THEN
          str := str || '<TD class="sm_td ">Повторы:</TD>';
          strout := 'Повторы';
          ncalc := j;
        ELSIF j = 5
        THEN
          str := str || '<TD class="sm_td ">В %:</TD>';
          strout := '% повторов';
          ncalc := j;
        ELSIF j = 6
        THEN
          str := str || '<TD class="sm_td ">К/к:</TD>';
          strout := 'К/к';
          ncalc := j;
        ELSIF j = 7
        THEN
          str := str || '<TD class="sm_td ">В %:</TD>';
          strout := '% к/к';
          ncalc := j;
        ELSIF j = 8
        THEN
          str := str || '<TD class="sm_td ">Патологических результатов:</TD>';
          strout := 'Патологических результатов';
          ncalc := 10;
        ELSIF j = 9
        THEN
          str := str || '<TD class="sm_td ">% патологических результатов:</TD>';
          strout := '% патологических результатов';
          ncalc := 11;
        ELSIF j = 10
        THEN
          str := str || '<TD class="sm_td ">Впервые выявленных патологий:</TD>';
          strout := 'Из них впервые выявленных патологий';
          ncalc := 12;
        ELSIF j = 11
        THEN
          str := str || '<TD class="sm_td ">Впервые выявленных патологий в %:</TD>';
          strout := 'Из них впервые выявленных патологий в %';
          ncalc := 13;
        ELSIF j = 12
        THEN
          str := str || '<TD class="sm_td ">Санитарно-гигиенические:</TD>';
          strout := 'Санитарно-гигиенические';
          ncalc := 8;
        ELSIF j = 13
        THEN
          str := str || '<TD class="sm_td ">В %:</TD>';
          strout := '% санитарно-гигиенических';
          ncalc := 9;
        ELSIF j = 14
        THEN
          str := str || '<TD class="sm_td ">Патологических результатов:</TD>';
          strout := 'Патологических результатов';
          ncalc := -1;
        ELSIF j = 15
        THEN
          str := str || '<TD class="sm_td ">% патологических результатов:</TD>';
          strout := '% патологических результатов';
          ncalc := -1;
        END IF;

        FOR i IN 1 .. tyears.COUNT
        LOOP
          progress_bar.setstrout (strout || ' за ' || tyears (i) || ' год');
          progress_bar.stepit;
          str :=
            str || '<TD class="sm_td " ALIGN="CENTER">'
            || REPLACE (TO_CHAR (pkg_lab_stat_funcs.get_count_issl_fuck_povt_contr (TO_DATE ('01.01.' || tyears (i),
                                                                                             'dd.mm.yyyy'),
                                                                                    TO_DATE ('31.12.' || tyears (i),
                                                                                             'dd.mm.yyyy'),
                                                                                    p.fk_id, ncalc, p.fk_id),
                                 'FM99999999990.09'),
                        '.', ',')
            || '</TD>';
        END LOOP;

        str := str || '</TR>';

        IF get_synid ('OTDEL_BAKTER', 0) <> p.fk_id AND j > 11
        THEN
          NULL;
        ELSE
          DBMS_LOB.writeappend (cc, LENGTH (str), str);
          nrow := nrow + 1;
        END IF;
      END LOOP;

      FOR z IN c (p.fk_id)
      LOOP
        FOR j IN 1 .. 6
        LOOP
          str := '<TR ALIGN="LEFT"><TD class="sm_td ">' || nrow || '</TD>';

          IF j = 1
          THEN
            str := str || '<TD class="sm_td "><B>Всего по ' || get_name_from_smid (z.fk_id) || ':</B></TD>';
            strout := 'Всего по ' || get_name_from_smid (z.fk_id);
            ncalc := 2;
          ELSIF j = 2
          THEN
            str := str || '<TD class="sm_td ">В %:</TD>';
            strout := '% фактических исследований';
            ncalc := 14;
          ELSIF j = 3
          THEN
            str := str || '<TD class="sm_td ">Патологических результатов:</TD>';
            strout := 'Патологических результатов';
            ncalc := 10;
          ELSIF j = 4
          THEN
            str := str || '<TD class="sm_td ">% патологических результатов:</TD>';
            strout := '% патологических результатов';
            ncalc := 11;
          ELSIF j = 5
          THEN
            str := str || '<TD class="sm_td ">Из них впервые выявленных патологий:</TD>';
            strout := 'Из них впервые выявленных патологий';
            ncalc := 12;
          ELSIF j = 6
          THEN
            str := str || '<TD class="sm_td ">Из них впервые выявленных патологий в %:</TD>';
            strout := 'Из них впервые выявленных патологий в %';
            ncalc := 13;
          END IF;

          FOR i IN 1 .. tyears.COUNT
          LOOP
            progress_bar.setstrout (strout || ' за ' || tyears (i) || ' год');
            progress_bar.stepit;

            IF ncalc <> 14
            THEN
              str :=
                str || '<TD class="sm_td " ALIGN="CENTER">'
                || REPLACE (TO_CHAR (pkg_lab_stat_funcs.get_count_issl_fuck_povt_contr (TO_DATE ('01.01.' || tyears (i),
                                                                                                 'dd.mm.yyyy'),
                                                                                        TO_DATE ('31.12.' || tyears (i),
                                                                                                 'dd.mm.yyyy'),
                                                                                        z.fk_id, ncalc, -1),
                                     'FM99999999990.09'),
                            '.', ',')
                || '</TD>';
            ELSE
              BEGIN
                str :=
                  str || '<TD class="sm_td " ALIGN="CENTER">'
                  || REPLACE (TO_CHAR ((pkg_lab_stat_funcs.get_count_issl_fuck_povt_contr (TO_DATE ('01.01.'
                                                                                                    || tyears (i),
                                                                                                    'dd.mm.yyyy'),
                                                                                           TO_DATE ('31.12.'
                                                                                                    || tyears (i),
                                                                                                    'dd.mm.yyyy'),
                                                                                           z.fk_id, 2, -1)
                                        / pkg_lab_stat_funcs.get_count_issl_fuck_povt_contr (TO_DATE ('01.01.'
                                                                                                      || tyears (i),
                                                                                                      'dd.mm.yyyy'),
                                                                                             TO_DATE ('31.12.'
                                                                                                      || tyears (i),
                                                                                                      'dd.mm.yyyy'),
                                                                                             p.fk_id, 2, p.fk_id))
                                       * 100,
                                       'FM99999999990.09'),
                              '.', ',')
                  || '</TD>';
              EXCEPTION
                WHEN OTHERS
                THEN
                  str := str || '<TD class="sm_td " ALIGN="CENTER">0</TD>';
              END;
--              str  := str||'<TD class="sm_td " ALIGN="CENTER">' || REPLACE(TO_CHAR(PKG_LAB_STAT_FUNCS.GET_COUNT_ISSL_FUCK_POVT_CONTR (TO_DATE('01.01.'||tYears (i),'dd.mm.yyyy'),TO_DATE('31.12.'||tYears (i),'dd.mm.yyyy'),Z.FK_ID,1,-1),'FM99999999990.09'),'.',',') ||' '||PKG_LAB_STAT_FUNCS.GET_COUNT_ISSL_FUCK_POVT_CONTR (TO_DATE('01.01.'||tYears (i),'dd.mm.yyyy'),TO_DATE('31.12.'||tYears (i),'dd.mm.yyyy'),p.FK_ID,2,p.FK_ID)|| '</TD>';
            END IF;
          END LOOP;

          str := str || '</TR>';
          DBMS_LOB.writeappend (cc, LENGTH (str), str);
          nrow := nrow + 1;
        END LOOP;
      END LOOP;
    END LOOP;

    str := '</TABLE></DIV></BODY></HTML>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);

    INSERT INTO tclobs
                (fc_clob)
         VALUES (cc)
      RETURNING fk_id
           INTO nc;

    RETURN nc;
  END;

-------------------------Сравнительная таблица лабораторных показателей по взрослому отделению---------------------------
  FUNCTION get_lab_pokaz_dub (pfn_year IN NUMBER, pfn_count IN NUMBER, pfk_vrachid IN NUMBER)
    RETURN NUMBER
  IS
    nc NUMBER;
    cc CLOB;
    str VARCHAR2 (32767);
    styear NUMBER;
    tyears tnumtable;
    n NUMBER;

    CURSOR c (pid NUMBER)
    IS
      SELECT     fk_id, fc_name
            FROM tsmid
           WHERE fl_showanal = 0 AND fl_stat = 1
      START WITH fk_id = pid
      CONNECT BY PRIOR fk_id = fk_owner
        ORDER BY fn_order;

    CURSOR cprizn
    IS
      SELECT fk_id, fc_name
        FROM tprizn;

    strout VARCHAR2 (200);
  BEGIN
--    PKG_LAB_STAT_FUNCS.DO_REFRESH_VNAZAN;
--    PKG_LAB_STAT_FUNCS.DO_REFRESH_VRESPAT;
--    PKG_LAB_STAT_FUNCS.DO_REFRESH_VPOVTOR;
--    PKG_LAB_STAT_FUNCS.DO_REFRESH_VCONTROL;
--    PKG_LAB_STAT_FUNCS.DO_REFRESH_VRESAN;
    styear := pfn_year - pfn_count + 1;

    FOR i IN 1 .. pfn_count
    LOOP
      tyears (i) := styear + i - 1;
    END LOOP;

    DBMS_LOB.createtemporary (cc, TRUE, DBMS_LOB.SESSION);
    str :=   /*      '<html><head><meta http-equiv="Content-Type" content="text/html; charset=windows-1251">' || '<style><!-- ' || ' .sm_td {width:119.6pt;border:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt} ' ||
                     ' .sm_table{border-collapse:collapse;border:none;mso-border-alt:solid windowtext .5pt;mso-padding-alt:0cm 5.4pt 0cm 5.4pt} ' ||
                     '--></style></head>' ||
             */
      get_html_header (0)
      || '<BODY> <DIV class=Section1><P ALIGN="CENTER"><B><font size="+1">Клинико - диагностическая лаборатория санатория "'
      || pkg_smini.readstring ('CONFIG', 'S_NAME', 'Не известен') || '"</font></B><BR>';
    str :=
      str
      || '<ALIGN="CENTER"><font size="+1">Сравнительная таблица лабораторных показателей по взрослому отделению</font><br>';
    str := str || 'за период с ' || styear || ' г. по ' || pfn_year || ' г.';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    str := '<table align="center" border="1" class = "sm_table" cellpadding="0" cellspacing="0">';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    str := '<TR ALIGN="CENTER"> <TD class="sm_td " width="329"> ;</TD>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    str := '';

    FOR i IN 1 .. tyears.COUNT
    LOOP
      str := str || '<TD class="sm_td " width="10%">' || tyears (i) || '</TD>';
    END LOOP;

    str := str || '</TR>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);
    str := '<TR><TD class="sm_td">Количество выписанных:</TD>';

    FOR i IN 1 .. tyears.COUNT
    LOOP
      str :=
        str || '<TD class="sm_td " ALIGN="CENTER">'
        || get_count_out_period (TO_DATE ('01.01.' || tyears (i), 'dd.mm.yyyy'),
                                 TO_DATE ('31.12.' || tyears (i), 'dd.mm.yyyy'))
        || '</TD>';
    END LOOP;

    str := str || '</TR>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);

    FOR p IN c (get_synid ('RAZ_ANAL'))
    LOOP
      FOR j IN 1 .. 18
      LOOP
        IF j = 1
        THEN
          str :=
            '<TR ALIGN="LEFT"><TD class="sm_td " COLSPAN="' || (tyears.COUNT + 1) || '"><B>' || p.fc_name
            || ':</B></TD></TR>';
        ELSIF j = 2
        THEN
          str := '<TR ALIGN="LEFT"><TD class="sm_td ">Количество обследованных:</TD>';
          strout := 'Количество обследованных';
        ELSIF j = 3
        THEN
          str := '<TR ALIGN="LEFT"><TD class="sm_td ">% охвата:</TD>';
          strout := '% охвата';
        ELSIF j = 4
        THEN
          str := '<TR ALIGN="LEFT"><TD class="sm_td "><B>Количество исследований клинических:</B></TD>';
          strout := 'Количество исследований клинических';
        ELSIF j = 5
        THEN
          str := '<TR ALIGN="LEFT"><TD class="sm_td ">Количество исследований на одного обследованного:</TD>';
          strout := 'Количество исследований на одного обследованного';
        ELSIF j = 6
        THEN
          str := '<TR ALIGN="LEFT"><TD class="sm_td ">Количество исследований на одного выписанного:</TD>';
          strout := 'Количество исследований на одного выписанного';
        ELSIF j = 7
        THEN
          str := '<TR ALIGN="LEFT"><TD class="sm_td ">Количество лиц с патологией:</TD>';
          strout := 'Количество лиц с патологией';
        ELSIF j = 8
        THEN
          str := '<TR ALIGN="LEFT"><TD class="sm_td ">% лиц с патологией от обследованных:</TD>';
          strout := '% лиц с патологией от обследованных';
        ELSIF j = 9
        THEN
          str := '<TR ALIGN="LEFT"><TD class="sm_td ">Количество патологических результатов:</TD>';
          strout := 'Количество патологических результатов';
        ELSIF j = 10
        THEN
          str := '<TR ALIGN="LEFT"><TD class="sm_td ">% патологических результатов:</TD>';
          strout := '% патологических результатов';
        ELSIF j = 11
        THEN
          str := '<TR ALIGN="LEFT"><TD class="sm_td ">Повторно обследовано всего:</TD>';
          strout := 'Повторно обследовано всего';
        ELSIF j = 12
        THEN
          str := '<TR ALIGN="LEFT"><TD class="sm_td ">% повторно оследованных к выписанным:</TD>';
          strout := '% повторно оследованных к выписанным';
        ELSIF j = 13
        THEN
          str := '<TR ALIGN="LEFT"><TD class="sm_td ">% повторно оследованных к обследованным:</TD>';
          strout := '% повторно оследованных к обследованным';
        ELSIF j = 14
        THEN
          str := '<TR ALIGN="LEFT"><TD class="sm_td ">Повторно обследовано лиц с патологией:</TD>';
          strout := 'Повторно обследовано лиц с патологией';
        ELSIF j = 15
        THEN
          str := '<TR ALIGN="LEFT"><TD class="sm_td ">Лиц с положительной динамикой:</TD>';
          strout := 'Лиц с положительной динамикой';
        ELSIF j = 16
        THEN
          str := '<TR ALIGN="LEFT"><TD class="sm_td ">Количество исслед. по контролю качества:</TD>';
          strout := 'Количество исслед. по контролю качества';
        ELSIF j = 17
        THEN
          str := '<TR ALIGN="LEFT"><TD class="sm_td ">Количество дублирующих исслед.:</TD>';
          strout := 'Количество дублирующих исслед.';
        ELSIF j = 18
        THEN
          str := '<TR ALIGN="LEFT"><TD class="sm_td ">Количество санитарно-гигиенич исслед.:</TD>';
          strout := 'Количество санитарно-гигиенич исслед';
        END IF;

        IF j <> 1
        THEN
          FOR i IN 1 .. tyears.COUNT
          LOOP
            progress_bar.setstrout (strout || ' за ' || tyears (i) || ' год');
            progress_bar.stepit;
            str :=
              str || '<TD class="sm_td " ALIGN="CENTER">'
              || REPLACE (TO_CHAR (pkg_lab_stat_funcs.get_count_lab_pokaz_dub (TO_DATE ('01.01.' || tyears (i),
                                                                                        'dd.mm.yyyy'),
                                                                               TO_DATE ('31.12.' || tyears (i),
                                                                                        'dd.mm.yyyy'),
                                                                               p.fk_id, j),
                                   'FM99999999990.09'),
                          '.', ',')
              || '</TD>';
          END LOOP;

          IF j = 2
          THEN
            FOR h IN cprizn
            LOOP
              str := str || '</TR>';
              DBMS_LOB.writeappend (cc, LENGTH (str), str);
              str := '<TR ALIGN="LEFT"><TD class="sm_td "><I>в т.ч. ' || h.fc_name || ':</I></TD>';
              strout := 'В т.ч. ' || h.fc_name;

              FOR i IN 1 .. tyears.COUNT
              LOOP
                progress_bar.setstrout (strout || ' за ' || tyears (i) || ' год');
                progress_bar.stepit;
                str :=
                  str || '<TD class="sm_td " ALIGN="CENTER">'
                  || REPLACE (TO_CHAR (pkg_lab_stat_funcs.get_count_lab_pokaz_dub (TO_DATE ('01.01.' || tyears (i),
                                                                                            'dd.mm.yyyy'),
                                                                                   TO_DATE ('31.12.' || tyears (i),
                                                                                            'dd.mm.yyyy'),
                                                                                   p.fk_id, j, h.fk_id),
                                       'FM99999999990.09'),
                              '.', ',')
                  || '</TD>';
              END LOOP;
            END LOOP;
          END IF;
        END IF;

        str := str || '</TR>';
        DBMS_LOB.writeappend (cc, LENGTH (str), str);
      END LOOP;
    END LOOP;

    str := '</DIV></BODY></TABLE></HTML>';
    DBMS_LOB.writeappend (cc, LENGTH (str), str);

    INSERT INTO tclobs
                (fc_clob)
         VALUES (cc)
      RETURNING fk_id
           INTO nc;

    RETURN nc;
  END;

-------------------------Производственная деятельность лаборатории---------------------------
  FUNCTION get_lab_proizv_dub (pfn_year IN NUMBER, pfn_count IN NUMBER, pfk_vrachid IN NUMBER)
    RETURN NUMBER
  IS
  BEGIN
    RETURN lab_full_otch.get_report (pfn_year, pfn_count);
  END;

-------------------------Отчет о проведенных исследованиях по разделу ---------------------------
  FUNCTION get_lab_prov_issl_razd_dub (pfd_data1 IN DATE, pfd_data2 IN DATE, pfk_razdid IN NUMBER,
  pfk_vrachid IN NUMBER)
    RETURN NUMBER
  IS
  BEGIN
    RETURN lab_otch_razdel.get_report (pfd_data1, pfd_data2, pfk_razdid);
  END;

/*-------------------------Отчет о работе отдела за период----------------------------------------*/
  FUNCTION get_lab_work_otdel_dub (pfd_data1 IN DATE, pfd_data2 IN DATE, pfk_razdid IN NUMBER, pfk_vrachid IN NUMBER)
    RETURN NUMBER
  IS
  BEGIN
    RETURN lab_work_otdel_full.get_report (pfd_data1, pfd_data2, pfk_razdid);
  END;

/*------------------------------------------------------------------------------------------------*/
  FUNCTION get_print_result (pfk_pacid IN NUMBER, pft_clobs IN ct_year)
    RETURN CLOB
  IS
    pc_return CLOB;
    pc_str VARCHAR2 (32000);

    CURSOR c
    IS
    /*  SELECT fc_clob
        FROM tclobs
       WHERE fk_id IN (SELECT fk_blobid
                         FROM tresan
                        WHERE fl_zakl = 1 AND fk_nazid IN (SELECT column_value
                                                             FROM TABLE (CAST (pft_clobs AS ct_year))))*/
                                                             SELECT lab_reports.GET_NAZ_RESULT(column_value) fc_clob, get_fullpath(GET_SMIDFROMNAZ(column_value)) fc_name
                                                             from (select column_value FROM TABLE (CAST (pft_clobs AS ct_year)));
  BEGIN
    DBMS_LOB.createtemporary (pc_return, TRUE, DBMS_LOB.SESSION);
    pc_str :=
      '<HTML><HEAD><meta http-equiv="Content-Type" content="text/html; charset=windows-1251"></HEAD><BODY>'
      || '<P ALIGN="CENTER"><B>Клинико-диагностическая лаборатория "'
      || pkg_smini.readstring ('CONFIG', 'S_NAME', 'Не известен') || '"</B></P>'
      || '<P><table width="100%" border="0" align="CENTER" bordercolordark="#FFFFFF" bordercolorlight="#000000" cellpadding="0" cellspacing="0">'
      || '<TR><TD ALIGN="RIGHT" WIDTH="25%">Ф.И.О. пациента:</TD><TD ALIGN="LEFT"><B> ' || get_fio (pfk_pacid)
      || '</B></TD>' || '<TD ALIGN="RIGHT" WIDTH="25%">Отделение пациента:</TD><TD ALIGN="LEFT"><B> '
      || pkg_regist_pacfunc.get_pac_fckorp (pfk_pacid) || '</B></TD></TR>'
      || '<TR><TD ALIGN="RIGHT" WIDTH="25%">Пол пациента:</TD><TD ALIGN="LEFT"><B> '
      || REPLACE (REPLACE (get_sex (pfk_pacid), 0, 'Женский'), 1, 'Мужской') || '</B></TD>'
      || '<TD ALIGN="RIGHT" WIDTH="25%">Палата пациента:</TD><TD ALIGN="LEFT"><B> '
      || pkg_regist_pacfunc.get_pac_fcpalata (pfk_pacid) || '</B></TD></TR>'
      || '<TR><TD ALIGN="RIGHT" WIDTH="25%">Возраст пациента:</TD><TD ALIGN="LEFT"><B> ' || get_vozr (pfk_pacid)
      || '</B></TD>' || '<TD ALIGN="RIGHT" WIDTH="25%">Ф.И.О. лечащего врача:</TD><TD ALIGN="LEFT"><B> '
      || do_vrachfio (get_pacvrach (pfk_pacid)) || '</B></TD></TR></TABLE></P>';
    DBMS_LOB.writeappend (pc_return, LENGTH (pc_str), pc_str);

    FOR cc IN c
    LOOP
      if DBMS_LOB.getlength(cc.fc_clob) > 3 then
        pc_str := '<br/>';
      else
        pc_str := '<BR/><B>'||cc.fc_name||' данные отсутствуют</B></center>';
      end if;
      DBMS_LOB.writeappend (pc_return, LENGTH (pc_str), pc_str);
      DBMS_LOB.append (pc_return, cc.fc_clob);
    END LOOP;

    pc_str := '</body></html>';
    DBMS_LOB.writeappend (pc_return, LENGTH (pc_str), pc_str);
    RETURN pc_return;
    DBMS_LOB.freetemporary(pc_return);
  END get_print_result;
/*------------------------------------------------------------------------------------------------*/
  FUNCTION GET_SIMPL (pfk_nazid IN NUMBER)
    RETURN CLOB
  IS
    CURSOR cD (pFK_SMID NUMBER) IS
      SELECT TO_CHAR (FD_INS, 'dd.mm.yyyy'), GET_FULLPATH (pFK_SMID)
        FROM TRESAN
       WHERE FK_NAZID = pFK_NAZID
         AND FL_ZAKL <> 1;
    CURSOR cGetHeader (pFK_SMID NUMBER) IS
      SELECT FC_NAME, FC_ED_IZM, GET_NORM (pFK_SMID, GET_PACID_FROM_NAZID (pFK_NAZID),SYSDATE) , FC_TYPE
        FROM TSMID
       WHERE FK_ID = pFK_SMID;
    CURSOR cGetVal (pFK_SMID NUMBER) IS
      SELECT GET_NAME_FROM_SMID (FK_BLOBID), TO_CHAR (FN_RES), FC_RES, GET_PATNAME (fk_patid), fk_patid
        FROM TRESAN
       WHERE FK_SMID = pFK_SMID
         AND FK_NAZID = pFK_NAZID
         AND FL_ZAKL <> 1;
    CURSOR cGetZakl (pFK_NAZID NUMBER) IS
      SELECT FC_RES
        FROM TRESAN
       WHERE FK_NAZID = pFK_NAZID
         AND FL_ZAKL = 1;

  pc_str      VARCHAR2 (32767);
  pc_ins      VARCHAR2 (32767);
  pc_smidname VARCHAR2 (32767);
  pc_name     VARCHAR2 (32767);
  pc_ed_izm   VARCHAR2 (32767);
  pc_norm     VARCHAR2 (32767);
  pc_type     VARCHAR2 (100);
  pc_resn     VARCHAR2 (100);
  pc_resc     VARCHAR2 (100);
  pc_patname  VARCHAR2 (32767);
  pk_SMID     NUMBER;
  pc_return   CLOB;
  pn_patid    NUMBER;
  pc_zakl     VARCHAR2(4000);
  pn_count NUMBER;
BEGIN
  DBMS_LOB.createtemporary (pc_return, TRUE, DBMS_LOB.SESSION);
  select count(1) INTO pn_count
    from tresan
   where fk_nazid = pfk_nazid;
  if pn_count = 0 then
    pc_str := ' ';
    DBMS_LOB.WRITEAPPEND (pc_return, LENGTH (pc_str), pc_str);
    RETURN pc_return;
  end if;
    pk_SMID   := GET_SMIDFROMNAZ (pFK_NAZID);
    OPEN cD (pk_SMID);
      FETCH cD INTO pc_ins, pc_smidname;
    CLOSE cD;
    pc_str := pc_smidname || ';;<B>' || pc_ins ||'</B>';
    pc_str := pc_str ||
      '<table width="100%" border="1" align="center" bordercolordark="#FFFFFF" bordercolorlight="#000000" cellpadding="0" cellspacing="0">'
      ||'<TR ALIGN="CENTER"><TD WIDTH="30%">Наименование:</TD><TD WIDTH="10%">Ед.изм.:</TD>'
      ||'<TD WIDTH="15%">Норма:</TD><TD WIDTH="25%">Результат:</TD><TD WIDTH="20%">Примечание:</TD></TR>';
  DBMS_LOB.writeappend(pc_return, LENGTH (pc_str),pc_str);
  OPEN cGetHeader (pk_SMID);
  FETCH cGetHeader INTO pc_name, pc_ed_izm, pc_norm, pc_type;
  CLOSE cGetHeader;
  IF pc_name IS NULL THEN
    pc_name   := ';';
  END IF;
  IF pc_ed_izm IS NULL THEN
    pc_ed_izm   := ';';
  END IF;
  IF pc_norm IS NULL THEN
    pc_norm   := ';';
  END IF;
  pc_str     :=
    '<TR ALIGN="CENTER"><TD WIDTH="30%"><B>' || pc_name || '</B></TD><TD WIDTH="10%">' || pc_ed_izm
    || '</TD><TD WIDTH="15%">' || pc_norm || '</TD><TD WIDTH="25%">';
  DBMS_LOB.writeappend(pc_return, LENGTH (pc_str), pc_str);
  pc_name       := '';

  OPEN cGetVal (pk_SMID);
  FETCH cGetVal INTO pc_name, pc_resn, pc_resc, pc_patname, pn_patid;
  CLOSE cGetVal;

  IF pc_resn IS NULL THEN
    pc_resn   := ';';
  END IF;
  IF length(pc_resc) = 0 THEN
    pc_resc := ';';
  END IF;

  IF pc_type = 'NUMBER' THEN
    pc_str   := pc_resn || '</TD><TD WIDTH="20%">';
  ELSIF pc_type = 'VARCHAR2' THEN
    pc_str   := pc_resc || '</TD><TD WIDTH="20%">';
  ELSIF pc_type = 'COMBOBOX' THEN
    pc_str   := pc_name || '</TD><TD WIDTH="20%">';
  ELSE
    pc_str   := ';</TD><TD WIDTH="20%">';
  END IF;
  DBMS_LOB.writeappend(pc_return, LENGTH (pc_str), pc_str);
  IF pn_patid <> 0 THEN
    pc_str   := pc_patname || '</TD></TR>';
  ELSE
    pc_str   := ';</TD></TR>';
  END IF;
  DBMS_LOB.WRITEAPPEND (pc_return, LENGTH (pc_str), pc_str);

  OPEN cGetZakl (pFK_NAZID);
  FETCH cGetZakl INTO pc_zakl;
  CLOSE cGetZakl;
  pc_str     := '</TABLE><BR><I>Заключение врача:</I><BR>' || pc_zakl;
  DBMS_LOB.WRITEAPPEND (pc_return, LENGTH (pc_str), pc_str);
  RETURN pc_return;
  END;
/*------------------------------------------------------------------------------------------------*/
  FUNCTION GET_TABLE (pfk_nazid IN NUMBER)
    RETURN CLOB
  IS
  CURSOR cD (pFK_SMID NUMBER) IS
    SELECT TO_CHAR (FD_INS, 'dd.mm.yyyy'), GET_FULLPATH (pFK_SMID)
      FROM TRESAN
     WHERE FK_NAZID = pFK_NAZID;
      -- AND FL_ZAKL <> 1;
  CURSOR cGetHeader (pFK_SMID NUMBER) IS
    SELECT FK_ID, FC_NAME, FC_ED_IZM, GET_NORM (FK_ID, GET_PACID_FROM_NAZID (pFK_NAZID) ,SYSDATE) , FC_TYPE
      FROM TSMID
     WHERE FK_OWNER = pFK_SMID
     ORDER BY FN_ORDER;
  CURSOR cGetFolder (pFK_SMID NUMBER) IS
    SELECT FK_ID, FC_NAME, FC_ED_IZM, GET_NORM (FK_ID, GET_PACID_FROM_NAZID (pFK_NAZID) ,SYSDATE), FC_TYPE
      FROM TSMID
     WHERE FK_OWNER = pFK_SMID
     ORDER BY FN_ORDER;
  CURSOR cGetVal (pFK_SMID NUMBER) IS
    SELECT GET_NAME_FROM_SMID (FK_BLOBID), TO_CHAR (FN_RES, 'FM99999999990.0999'), FC_RES, GET_PATNAME (fk_patid), fk_patid, GET_TYPE_FROM_SMID (FK_BLOBID),
                    TO_CHAR (FN_RES2, 'FM99999999990.0999')
      FROM TRESAN
     WHERE FK_SMID = pFK_SMID
       AND FK_NAZID = pFK_NAZID;
  --     AND FL_ZAKL <> 1;
  CURSOR cGetZakl (pFK_NAZID NUMBER) IS
    SELECT FC_RES
      FROM TRESAN
     WHERE FK_NAZID = pFK_NAZID
       AND FL_ZAKL = 1;
  CURSOR cGetFolderPat (pOwner NUMBER, pNazID NUMBER) IS
    SELECT GET_PATNAME (FK_PATID)
      FROM (SELECT FK_PATID, GET_PATALOGY_LEVEL (FK_PATID) FP_PATL
              FROM TSMID, TRESAN
             WHERE TRESAN.FK_SMID = TSMID.FK_ID
               AND FK_NAZID = pNAZID
               AND TSMID.FK_OWNER = pOWNER)
              -- AND FL_ZAKL <> 1)
     WHERE fp_patl > 0
     ORDER BY fp_patl;
  pc_str    VARCHAR2 (32767);
  pc_name   VARCHAR2 (32767);
  pc_date   VARCHAR2 (32767);
  c         VARCHAR2 (32767);
  c1        VARCHAR2 (32767);
  c2        VARCHAR2 (32767);
  c3        VARCHAR2 (32767);
  pc_Type     VARCHAR2 (100);
  pk_SMID   NUMBER;
  pn_SMRID  NUMBER;
  n         NUMBER;
  pc_return CLOB;
  pn_Res2     VARCHAR2 (100);
  pc_cType    VARCHAR2 (100);
  pc_pat    VARCHAR2(255);
  pn_count NUMBER;
BEGIN
  DBMS_LOB.createtemporary (pc_return, TRUE, DBMS_LOB.SESSION);
  select count(1) INTO pn_count
    from tresan
   where fk_nazid = pfk_nazid;
  if pn_count = 0 then
    pc_str := ' ';
    DBMS_LOB.WRITEAPPEND (pc_return, LENGTH (pc_str), pc_str);
    RETURN pc_return;
  end if;

  pk_SMID  := GET_SMIDFROMNAZ (pFK_NAZID);
  OPEN cD (pk_SMID);
  FETCH cD INTO pc_name, pc_date;
  CLOSE cD;
  pc_str := pc_name|| ';;<B>' || pc_date ||'</B>'||
    '<table width="100%" border="1" align="center" bordercolordark="#FFFFFF" bordercolorlight="#000000" cellpadding="0" cellspacing="0">'
    ||'<TR ALIGN="CENTER"><TD WIDTH="30%">Наименование:</TD><TD WIDTH="10%">Ед.изм.:</TD>'
    ||'<TD WIDTH="15%">Норма:</TD><TD WIDTH="25%">Результат:</TD><TD WIDTH="20%">Примечание:</TD></TR>';
  DBMS_LOB.WRITEAPPEND (pc_return, LENGTH (pc_str), pc_str);

  OPEN cGetHeader (pk_SMID);
  LOOP
    FETCH cGetHeader INTO pn_SMRID, c, c1, c2, pc_Type;
    EXIT WHEN cGetHeader%NOTFOUND;
    IF c IS NULL THEN
      c  := ';';
    END IF;
    IF c1 IS NULL THEN
      c1  := ';';
    END IF;
    IF c2 IS NULL THEN
      c2  := ';';
    END IF;
    pc_str  := '<TR ALIGN="LEFT"><TD WIDTH="30%"><B>' || c || '</B></TD><TD WIDTH="10%" ALIGN="CENTER">' || c1 || '</TD><TD WIDTH="15%"ALIGN="CENTER">' || c2 || '</TD><TD WIDTH="25%"ALIGN="CENTER">';

    IF pc_Type = 'FOLDER' THEN
      pc_str  := pc_str || ';</TD><TD WIDTH="20%" ALIGN="CENTER">';
  --    DBMS_LOB.WRITEAPPEND (pc_return, LENGTH (pc_str), pc_str);
  --    pc_str:='';
      OPEN  cGetFolderPat(pn_SMRID,pFK_NAZID);
        FETCH cGetFolderPat INTO pc_pat;
      CLOSE cGetFolderPat;
      pc_str:=pc_str||pc_pat||';</TD></TR>';

    --  DBMS_LOB.WRITEAPPEND (pc_return, LENGTH (pc_str), pc_str);
      OPEN cGetFolder (pn_SMRID);
      LOOP
        FETCH cGetFolder INTO pn_SMRID, c, c1, c2, pc_Type;
        EXIT WHEN cGetFolder%NOTFOUND;

        IF c IS NULL THEN
          c  := ';';
        END IF;
        IF c1 IS NULL THEN
          c1  := ';';
        END IF;
        IF c2 IS NULL THEN
          c2  := ';';
        END IF;
        pc_str     :=
          '<TR ALIGN="LEFT"><TD WIDTH="30%">;;<B>' || c || '</B></TD><TD WIDTH="10%" ALiGN="CENTER">' || c1 || '</TD><TD WIDTH="15%" ALIGN="CENTER">' || c2 ||
            '</TD><TD WIDTH="25%" ALIGN="CENTER">';
        c       := '';
        c1      := '';
        c2      := '';
        c3      := '';
        pc_cType  := '';
        pn_Res2   := '';
        OPEN cGetVal (pn_SMRID);
        FETCH cGetVal INTO c, c1, c2, c3, n, pc_cType, pn_Res2;
        CLOSE cGetVal;
        IF     c IS NULL
           AND c1 IS NULL
           AND c2 IS NULL THEN
          NULL;
        ELSE
          DBMS_LOB.WRITEAPPEND (pc_return, LENGTH (pc_str), pc_str);
          IF c IS NULL THEN
            c  := ';';
          END IF;
          IF c1 IS NULL THEN
            c1  := ';';
          END IF;
          IF c2 IS NULL THEN
            c2  := ';';
          END IF;
          IF c3 IS NULL THEN
            c3  := ';';
          END IF;
          IF pc_Type = 'NUMBER' THEN
            pc_str  := c1 || '</TD><TD WIDTH="20%"ALIGN="CENTER">';
          ELSIF pc_Type = 'VARCHAR2' THEN
            pc_str  := c2 || '</TD><TD WIDTH="20%"ALIGN="CENTER">';
          ELSIF pc_Type = 'COMBOBOX' THEN
            IF pc_cType = 'NUMBER' THEN
              pc_str  := c1 || ' ' || c || '</TD><TD WIDTH="20%"ALIGN="CENTER">';
            ELSIF pc_cType = 'VARCHAR2' THEN
              pc_str  := c2 || ' ' || c || '</TD><TD WIDTH="20%"ALIGN="CENTER">';
            ELSIF pc_cType = 'DUALNUM' THEN
              pc_str  := c1 || ' - ' || pn_Res2 || ' ' || c || '</TD><TD WIDTH="20%"ALIGN="CENTER">';
            ELSE
              pc_str  := c || '</TD><TD WIDTH="20%"ALIGN="CENTER">';
            END IF;
          ELSIF pc_Type = 'DUALNUM' THEN
            pc_str  := c1 || ' - ' || pn_Res2 || ' ' || c || '</TD><TD WIDTH="20%"ALIGN="CENTER">';
          ELSE
            pc_str  := ';</TD><TD WIDTH="20%"ALIGN="CENTER">';
          END IF;
          DBMS_LOB.WRITEAPPEND (pc_return, LENGTH (pc_str), pc_str);
          IF n <> 0 THEN
            pc_str  := c3 || '</TD></TR>';
          ELSE
            pc_str  := ';</TD></TR>';
          END IF;
          DBMS_LOB.WRITEAPPEND (pc_return, LENGTH (pc_str), pc_str);
        END IF;
      END LOOP;
      CLOSE cGetFolder;
    ELSE
      c       := '';
      c1      := '';
      c2      := '';
      c3      := '';
      pc_cType  := '';
      pn_Res2   := '';
      OPEN cGetVal (pn_SMRID);
      FETCH cGetVal INTO c, c1, c2, c3, n, pc_cType, pn_Res2;
      CLOSE cGetVal;
      IF    c IS NOT NULL
         OR c1 IS NOT NULL
         OR c2 IS NOT NULL THEN
        IF c IS NULL THEN
          c  := ';';
        END IF;
        IF c1 IS NULL THEN
          c1  := ';';
        END IF;
        IF c2 IS NULL THEN
          c2  := ';';
        END IF;
        IF c3 IS NULL THEN
          c3  := ';';
        END IF;
        IF pc_Type = 'NUMBER' THEN
          pc_str  := pc_str || c1 || '</TD><TD WIDTH="20%"ALIGN="CENTER">';
        ELSIF pc_Type = 'VARCHAR2' THEN
          pc_str  := pc_str || c2 || '</TD><TD WIDTH="20%"ALIGN="CENTER">';
        ELSIF pc_Type = 'COMBOBOX' THEN
          IF pc_cType = 'NUMBER' THEN
            pc_str  := pc_str || c1 || ' ' || c || '</TD><TD WIDTH="20%"ALIGN="CENTER">';
          ELSIF pc_cType = 'VARCHAR2' THEN
            pc_str  := pc_str || c2 || ' ' || c || '</TD><TD WIDTH="20%"ALIGN="CENTER">';
          ELSIF pc_cType = 'DUALNUM' THEN
            pc_str  := pc_str || c1 || ' - ' || pn_Res2 || ' ' || c || '</TD><TD WIDTH="20%"ALIGN="CENTER">';
          ELSE
            pc_str  := pc_str || c || '</TD><TD WIDTH="20%"ALIGN="CENTER">';
          END IF;
        ELSIF pc_Type = 'DUALNUM' THEN
          pc_str  := pc_str || c1 || ' - ' || pn_Res2 || ' ' || c || '</TD><TD WIDTH="20%"ALIGN="CENTER">';
        ELSE
          pc_str  := pc_str || ';</TD><TD WIDTH="20%"ALIGN="CENTER">';
        END IF;
--        DBMS_LOB.WRITE (cl, LENGTH (str), DBMS_LOB.GETLENGTH (cl) + 1, str);
        IF n <> 0 THEN
          pc_str  := pc_str || c3 || '</TD></TR>';
        ELSE
          pc_str  := pc_str || ';</TD></TR>';
        END IF;
        DBMS_LOB.WRITEAPPEND (pc_return, LENGTH (pc_str), pc_str);
      END IF;
    END IF;
  END LOOP;
  CLOSE cGetHeader;
  c3     := NULL;
  OPEN cGetZakl (pFK_NAZID);
  FETCH cGetZakl INTO c3;
  CLOSE cGetZakl;
  IF TRIM (c3) IS NOT NULL THEN
    pc_str  := '</TABLE><BR><I>Заключение врача:</I><BR>' || c3;
  ELSE
    pc_str  := '</TABLE>';
  END IF;
  DBMS_LOB.WRITEAPPEND (pc_return, LENGTH (pc_str), pc_str);
  RETURN pc_return;
  DBMS_LOB.freetemporary(pc_return);
  END GET_TABLE;
/*------------------------------------------------------------------------------------------------*/
  FUNCTION GET_MTABLE (pfk_nazid IN NUMBER)
    RETURN CLOB
  IS
    TYPE nCID IS TABLE OF NUMBER
    INDEX BY BINARY_INTEGER;
  CURSOR cD (pFK_SMID NUMBER) IS
    SELECT/*+rule*/ TO_CHAR (FD_INS, 'dd.mm.yyyy'), GET_FULLPATH (pFK_SMID)
      FROM TRESAN
     WHERE FK_NAZID = pFK_NAZID
       AND FL_ZAKL <> 1;
  CURSOR cGetHeader (pFK_SMID NUMBER) IS
    SELECT/*+rule*/ FK_ID, FC_NAME, FC_ED_IZM, GET_NORM (FK_ID, GET_PACID_FROM_NAZID (pFK_NAZID), SYSDATE), FC_TYPE
      FROM TSMID
     WHERE FK_OWNER = pFK_SMID
       AND FC_TYPE <> 'COLUMNS'
     ORDER BY FN_ORDER;
  CURSOR cGetFolder (pFK_SMID NUMBER) IS
    SELECT/*+rule*/ FK_ID, FC_NAME, FC_ED_IZM, GET_NORM (FK_ID, GET_PACID_FROM_NAZID (pFK_NAZID), SYSDATE), FC_TYPE
      FROM TSMID
     WHERE FK_OWNER = pFK_SMID
       AND FC_TYPE <> 'COLUMNS'
     ORDER BY FN_ORDER;
  CURSOR cGetVal (pFK_SMID NUMBER, pFK_COLID NUMBER) IS
    SELECT/*+rule*/ GET_NAME_FROM_SMID (FK_BLOBID), TO_CHAR (FN_RES, 'FM99999999990.0999'), FC_RES, GET_TYPE_FROM_SMID (FK_BLOBID), TO_CHAR (FN_RES2, 'FM99999999990.0999')
      FROM TRESAN
     WHERE FK_SMID = pFK_SMID
       AND FK_NAZID = pFK_NAZID
       AND FL_ZAKL <> 1
       AND FK_COLID = pFK_COLID;
  CURSOR cGetZakl (pFK_NAZID NUMBER) IS
    SELECT/*+rule*/ FC_RES
      FROM TRESAN
     WHERE FK_NAZID = pFK_NAZID
       AND FL_ZAKL = 1;
  CURSOR cGetColRoot (pFK_SMID NUMBER) IS
    SELECT FK_ID
      FROM TSMID
     WHERE FK_OWNER = pFK_SMID
       AND FC_TYPE = 'COLUMNS'
     ORDER BY FN_ORDER;
  CURSOR cGetColIDS (pFK_SMID NUMBER) IS
    SELECT FK_ID
      FROM TSMID
     WHERE FK_OWNER = pFK_SMID
       AND FC_TYPE = 'COLUMN'
     ORDER BY FN_ORDER;
  CURSOR cGetColNames (pFK_SMID NUMBER) IS
    SELECT FC_NAME
      FROM TSMID
     WHERE FK_OWNER = pFK_SMID
       AND FC_TYPE = 'COLUMN'
     ORDER BY FN_ORDER;
  CURSOR cGetPat (pFK_SMID NUMBER) IS
    SELECT/*+rule*/ GET_PATNAME (fk_patid) FC_PAT, GET_PATALOGY_LEVEL (fk_patid) FN_PATL
      FROM TRESAN
     WHERE FK_SMID = pFK_SMID
       AND FK_NAZID = pFK_NAZID
       AND FL_ZAKL <> 1
     ORDER BY FN_PATL DESC;
  CURSOR cGetFolderPat (pOwner NUMBER, pNazID NUMBER) IS
    SELECT GET_PATNAME (FK_PATID)
      FROM (SELECT FK_PATID, GET_PATALOGY_LEVEL (FK_PATID) FP_PATL
              FROM TSMID, TRESAN
             WHERE TRESAN.FK_SMID = TSMID.FK_ID
               AND FK_NAZID = pNAZID
               AND TSMID.FK_OWNER = pOWNER
               AND FL_ZAKL <> 1)
     WHERE fp_patl > 0
     ORDER BY fp_patl;

  str VARCHAR2 (32767);
  c VARCHAR2 (32767);
  c1 VARCHAR2 (32767);
  c2 VARCHAR2 (32767);
  c3 VARCHAR2 (32767);
  cType VARCHAR2 (100);
  nSMID NUMBER;
  nSMRID NUMBER;
  n NUMBER;
  pc_return CLOB;
  nRes NUMBER;
  nColID NUMBER;
  nColsID nCID;
  nColCount NUMBER := 0;
  nRes2 VARCHAR2 (100);
  i NUMBER;
  ccType VARCHAR2 (100);
  bFilled BOOLEAN;
  pn_count NUMBER;
BEGIN
  DBMS_LOB.createtemporary (pc_return, TRUE, DBMS_LOB.SESSION);
  select count(1) INTO pn_count
    from tresan
   where fk_nazid = pfk_nazid;
  if pn_count = 0 then
    str := ' ';
    DBMS_LOB.WRITEAPPEND (pc_return, LENGTH (str), str);
    RETURN pc_return;
  end if;

  nSMID  := GET_SMIDFROMNAZ (pFK_NAZID);
  OPEN cGetColRoot (nSMID);
  FETCH cGetColRoot INTO nColID;
  CLOSE cGetColRoot;
  OPEN cD (nSMID);
  FETCH cD INTO c, c1;
  CLOSE cD;
  str := c || ';<B>' || c1 ||'</B>';
  DBMS_LOB.WRITEAPPEND (pc_return, LENGTH (str), str);
  str := '<table width="100%" border="1" align="center" bordercolordark="#FFFFFF" bordercolorlight="#000000" cellpadding="0" cellspacing="0">'
         ||'<TR ALIGN="CENTER"><TD>Наименование:</TD><TD >Ед.изм.:</TD><TD >Норма:</TD>';
  DBMS_LOB.WRITEAPPEND (pc_return, LENGTH (str), str);
  FOR p IN cGetColNames (nColID) LOOP
    str        := '<TD>' || p.FC_NAME || ':</TD>';
    DBMS_LOB.WRITEAPPEND (pc_return, LENGTH (str), str);
    nColCount  := nColCount + 1;
  END LOOP;
  str    := '<TD >Примечание:</TD></TR>';
  DBMS_LOB.WRITEAPPEND (pc_return, LENGTH (str), str);
--Заполнение PL таблицы кодами колонок
  FOR p IN cGetColIDS (nColID) LOOP
    nColsID (cGetColIDS%ROWCOUNT - 1)  := p.FK_ID;
  END LOOP;
--End
  OPEN cGetHeader (nSMID);
  LOOP
    FETCH cGetHeader INTO nSMRID, c, c1, c2, cType;
    EXIT WHEN cGetHeader%NOTFOUND;
    IF c IS NULL THEN
      c  := ';';
    END IF;
    IF c1 IS NULL THEN
      c1  := ';';
    END IF;
    IF c2 IS NULL THEN
      c2  := ';';
    END IF;
    str  := '<TR ALIGN="LEFT"><TD ><B>' || c || '</B></TD><TD ALIGN="CENTER">' || c1 || '</TD><TD ALIGN="CENTER">' || c2;
    IF cType = 'FOLDER' THEN
      DBMS_LOB.WRITEAPPEND (pc_return, LENGTH (str), str);
      FOR i IN 0 .. nColCount - 1 LOOP
        str  := '</TD><TD ALIGN="CENTER">;';
        DBMS_LOB.WRITEAPPEND (pc_return, LENGTH (str), str);
      END LOOP;
---------------
      str  := ';</TD><TD WIDTH="20%" ALIGN="CENTER">';
      DBMS_LOB.WRITEAPPEND (pc_return, LENGTH (str), str);
      str  := '';
      OPEN cGetFolderPat (nSMRID, pFK_NAZID);
      FETCH cGetFolderPat INTO str;
      CLOSE cGetFolderPat;
      str  := str || ';</TD></TR>';
      DBMS_LOB.WRITEAPPEND (pc_return, LENGTH (str), str);
-----------
      OPEN cGetFolder (nSMRID);
      LOOP
        FETCH cGetFolder INTO nSMRID, c, c1, c2, cType;
        EXIT WHEN cGetFolder%NOTFOUND;
        IF c IS NULL THEN
          c  := ';';
        END IF;
        IF c1 IS NULL THEN
          c1  := ';';
        END IF;
        IF c2 IS NULL THEN
          c2  := ';';
        END IF;
        str      := '<TR ALIGN="LEFT"><TD >;;<B>' || c || '</B></TD><TD ALIGN="CENTER">' || c1 || '</TD><TD ALIGN="CENTER">' || c2;
        bFilled  := FALSE;

        FOR i IN 0 .. nColCount - 1 LOOP
          str    := str || '</TD><TD ALIGN="CENTER">';
          c      := '';
          c1     := '';
          c2     := '';
          c3     := '';
          nRes2  := '';
          OPEN cGetVal (nSMRID, nColsID (i) );
          FETCH cGetVal INTO c, c1, c2, ccType, nRes2;
          CLOSE cGetVal;
          IF c IS NULL THEN
            c  := ';';
          ELSE
            bFilled:=TRUE;
          END IF;
          IF c1 IS NULL THEN
            c1  := ';';
          ELSE
            bFilled  := TRUE;
          END IF;
          IF c2 IS NULL THEN
            c2  := ';';
          ELSE
            bFilled  := TRUE;
          END IF;
          IF nRes2 IS NULL THEN
            nRes2  := ';';
          ELSE
            bFilled  := TRUE;
          END IF;
          IF cType = 'NUMBER' THEN
            str  := str || c1;
          ELSIF cType = 'VARCHAR2' THEN
            str  := str || c2;
          ELSIF cType = 'COMBOBOX' THEN
            IF ccType = 'NUMBER' THEN
              str  := str || c1 || ' ' || c;
            ELSIF ccType = 'VARCHAR2' THEN
              str  := str || c2 || ' ' || c;
            ELSIF ccType = 'DUALNUM' THEN
              str  := str || c1 || ' - ' || nRes2 || ' ' || c;
            ELSE
              str  := str || c;
            END IF;
          ELSIF cType = 'DUALNUM' THEN
            str  := str || c1 || ' - ' || nRes2;
          ELSE
            str  := str || ';';
          END IF;
        END LOOP;
        n        := 0;
        OPEN cGetPat (nSMRID);
        FETCH cGetPat INTO c3, n;
        CLOSE cGetPat;
        IF n > 0 THEN
          str      := str || '</TD><TD ALIGN="CENTER">' || c3 || ';</TD></TR>';
          bFilled  := TRUE;

        ELSE
          str  := str || '</TD><TD ALIGN="CENTER">;</TD></TR>';
        END IF;
        IF bFilled THEN
          DBMS_LOB.WRITEAPPEND (pc_return, LENGTH (str), str);
        END IF;
      END LOOP;
      CLOSE cGetFolder;
    ELSE
      bFilled  := FALSE;
      FOR i IN 0 .. nColCount - 1 LOOP
        str    := str || '</TD><TD ALIGN="CENTER">';
        c      := '';
        c1     := '';
        c2     := '';
        c3     := '';
        nRes2  := '';
        OPEN cGetVal (nSMRID, nColsID (i) );
        FETCH cGetVal INTO c, c1, c2, ccType, nRes2;
        CLOSE cGetVal;
        IF c IS NULL THEN
          c  := ';';
        END IF;
        IF c1 IS NULL THEN
          c1  := ';';
        ELSE
          bFilled  := TRUE;
        END IF;
        IF c2 IS NULL THEN
          c2  := ';';
        ELSE
          bFilled  := TRUE;
        END IF;
        IF nRes2 IS NULL THEN
          nRes2  := ';';
        ELSE
          bFilled  := TRUE;
        END IF;
        IF cType = 'NUMBER' THEN
          str  := str || c1;
        ELSIF cType = 'VARCHAR2' THEN
          str  := str || c2;
        ELSIF cType = 'COMBOBOX' THEN
          IF ccType = 'NUMBER' THEN
            str  := str || c1 || ' ' || c;
          ELSIF ccType = 'VARCHAR2' THEN
            str  := str || c2 || ' ' || c;
          ELSIF ccType = 'DUALNUM' THEN
            str  := str || c1 || ' - ' || nRes2 || ' ' || c;
          ELSE
            str  := str || c;
          END IF;
        ELSIF cType = 'DUALNUM' THEN
          str  := str || c1 || ' - ' || nRes2;
        ELSE
          str  := str || ';';
        END IF;
      END LOOP;
      FOR rec IN cGetPat (nSMRID) LOOP
        IF rec.FN_PATL > 0 THEN
          i   := rec.FN_PATL;
          c3  := rec.FC_PAT;
        END IF;
      END LOOP;
      IF n <> 0 THEN
        str      := str || '</TD><TD ALIGN="CENTER">' || c3 || ';</TD></TR>';
        bFilled  := TRUE;
      ELSE
        str  := str || '</TD><TD ALIGN="CENTER">;</TD></TR>';
      END IF;
      IF bFilled THEN
        DBMS_LOB.WRITEAPPEND(pc_return, LENGTH (str), str);
      END IF;
    END IF;
  END LOOP;
  CLOSE cGetHeader;
  c3     := NULL;
  OPEN cGetZakl (pFK_NAZID);
  FETCH cGetZakl INTO c3;
  CLOSE cGetZakl;
  IF TRIM (c3) IS NOT NULL THEN
    str  := '</TABLE><BR><I>Заключение врача:</I><BR>' || c3;
  ELSE
    str  := '</TABLE>';
  END IF;
  DBMS_LOB.WRITEAPPEND (pc_return, LENGTH (str), str);
  RETURN pc_return;
  DBMS_LOB.freetemporary(pc_return);
  END GET_MTABLE;
/*------------------------------------------------------------------------------------------------*/
  FUNCTION GET_NAZ_RESULT (pfk_nazid IN NUMBER)
    RETURN CLOB
  IS
    CURSOR cCheck IS
      SELECT FC_TYPE
        FROM TSMID
       WHERE FK_ID=(select FK_smid
                      from tnazan
                     where fk_id = pfk_nazid);
    CURSOR cVrach IS
      SELECT GET_SPECNAME(FK_VRACHID)||' '||GET_SOTRNAME(FK_VRACHID)
        FROM TRESAN
       WHERE FK_NAZID = pfk_nazid
         AND FL_ZAKL = 1;
    pc_type VARCHAR2(255);
    pc_vrach VARCHAR2(400);
    pc_return CLOB;
  BEGIN
    DBMS_LOB.createtemporary (pc_return, TRUE, DBMS_LOB.SESSION);
    open cCheck;
     fetch cCheck into pc_type;
    close cCheck;
    IF pc_type not IN ('TABLE','MTABLE') THEN
      DBMS_LOB.append (pc_return, GET_SIMPL(pFK_NAZID));
    ELSIF pc_type = 'TABLE' THEN
      DBMS_LOB.append (pc_return, GET_TABLE(pFK_NAZID));
    ELSIF pc_type = 'MTABLE' THEN
      DBMS_LOB.append (pc_return, GET_MTABLE(pFK_NAZID));
    END IF;
    open cVrach;
      fetch cVrach into pc_vrach;
      if length(pc_vrach) < 2 or pc_vrach is null then
        pc_vrach := ' ';
      else
        pc_vrach := '<BR>Заполнил:'||pc_vrach||'<BR><BR>';
      end if;
    close cVrach;
    DBMS_LOB.writeappend(pc_return,length(pc_vrach),pc_vrach);
    RETURN pc_return;
    DBMS_LOB.freetemporary(pc_return);
  END GET_NAZ_RESULT;
/*------------------------------------------------------------------------------------------------*/
  FUNCTION GET_ALL_NAZ_ON_DATE (pfd_date IN DATE,
                                pfk_pacid IN NUMBER,
                                pfk_razdid IN NUMBER)
    RETURN VARCHAR2
  IS
    pc_str VARCHAR2(32000) default '';
    cursor c is
      select GET_SMIDNAME(fk_smid) fc_name from tnazan
       where tnazan.fd_run = pfd_date
         and fk_pacid = pfk_pacid
         and pkg_regist_pacfunc.get_pac_korpid(fk_pacid) = pfk_razdid
    order by fk_smid;
  BEGIN
    progress_bar.setstrout (' '||pkg_regist_pacfunc.get_pac_fio (pfk_pacid));
    progress_bar.stepit;
    FOR cc IN c LOOP
      pc_str := pc_str||cc.fc_name||' <BR/>';
    END LOOP;
    pc_str := substr(pc_str,1,length(pc_str)-5);
    RETURN pc_str;
  END;
/*------------------------------------------------------------------------------------------------*/
  FUNCTION GET_ZAYAVKA (pfk_otdelid IN NUMBER,
                        pfd_date    IN DATE)
    RETURN NUMBER
  IS
    pb_result CLOB;
    pn_result NUMBER;
    pc_str VARCHAR2(32000) default ' ';
    pc_korp VARCHAR2(4000);

    cursor c_data is
      SELECT pkg_regist_pacfunc.get_pac_ib (t.fk_pacid) fk_ib,
             pkg_regist_pacfunc.get_pac_fio (t.fk_pacid) fc_fio,
             pkg_regist_pacfunc.get_pac_fcpalata (t.fk_pacid) fc_palata,
             pkg_regist_pacfunc.get_pac_sex(t.fk_pacid) fc_sex,
             pkg_regist_pacfunc.get_pac_age_now(t.fk_pacid) fn_age,
             lab_reports.get_all_naz_on_date (pfd_date, t.fk_pacid,pfk_otdelid) fc_nazan
        FROM (SELECT DISTINCT fk_pacid
                FROM tnazan
               WHERE tnazan.fd_run = pfd_date
                 and pkg_regist_pacfunc.get_pac_korpid(fk_pacid) = pfk_otdelid) t;
  BEGIN
    select fc_name into pc_korp
      from tkorp
     where fk_id = pfk_otdelid;
    DBMS_LOB.createtemporary (pb_result, TRUE, DBMS_LOB.SESSION);
    -- вставляем шапку отчета
    pc_str :=
      get_html_header || '<BODY><P ALIGN="CENTER"><B><font size="+1">Заявка в клиническую лабораторию "'
      || pkg_smini.readstring ('CONFIG', 'S_NAME', 'Не известен')
      || '"</font></B><BR><ALIGN="CENTER">на ' || TO_CHAR (pfd_date, 'dd.mm.yyyy')
      || '<ALIGN/><BR><ALIGN="CENTER">'||pc_korp||'<ALIGN/>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    pc_str :=
      '<table width="100%" border="1" cellpadding="0" cellspacing="0">'
      || '<TR>'
      || '<TH width="3%">№:</TH>'
      || '<TH width="7%">№ И/Б:</TH>'
      || '<TH width="30%">ФИО:</TH>'
      || '<TH width="5%">№ Палаты:</TH>'
      || '<TH width="5%">Пол:</TH>'
      || '<TH width="5%">Возраст</TH>'
      || '<TH width="40%">Назначения:</TH>'
      || '<TH width="5%">Примечания:</TH></TR>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    /**/

    for cc in c_data loop
      pc_str := ' ';
      pc_str := '<TR><TD>'||c_data%ROWCOUNT||'</TD><TD>'||cc.fk_ib||'</TD><TD>'||cc.fc_fio
                 ||'</TD><TD>'||cc.fc_palata||'</TD><TD>'||cc.fc_sex
                 ||'</TD><TD align="center">'||cc.fn_age||'</TD><TD>'||cc.fc_nazan||'</TD><TD>;'||'</TD></TR>';
      DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);
    end loop;
    /**/
    pc_str := '</table>';
    pc_str := pc_str || '</BODY>';
    pc_str := pc_str || '</HTML>';
    DBMS_LOB.writeappend (pb_result, LENGTH (pc_str), pc_str);

    INSERT INTO tclobs
                (fc_clob)
         VALUES (pb_result)
      RETURNING fk_id
           INTO pn_result;

    RETURN pn_result;
  END;
/*----------------------------------------------------------------------------*/
END;
/

SHOW ERRORS;


