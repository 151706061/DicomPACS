DROP PACKAGE BODY ASU.PKG_MEDGURNALS
/

--
-- PKG_MEDGURNALS  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_MEDGURNALS" 
IS

--
-- Purpose: Сбор отчетов:
--      1. журнал дефектур (замечаний по ведению истории болезни)
--      2. журнал консультаций
--      3. список людей противопоказанных к лечению по диагнозу
--      4. журнал выдачи медикаментов
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  ------------------------------------------
-- Собянин А.А.
--   журнал дефектур (замечаний по ведению истории болезни)
-- возвращает код клоба в котором лежит отчет

/*----------------------------------------------------------------------------------------------------------*\
|                       get_parname
\*----------------------------------------------------------------------------------------------------------*/
   FUNCTION get_parname (pValue IN NUMBER)
      RETURN VARCHAR2
   IS
   BEGIN
      IF pValue = 0 THEN
         RETURN 'санаторий';
      END IF;

      IF pValue > 0 THEN
         RETURN do_vrachfio (pValue);
      END IF;

      IF pValue < 0 THEN
         RETURN get_otdname (-pValue);
      END IF;
/*ADVICE(35): Last statement in function must be a RETURN [510] */

   END;
/*ADVICE(38): Function with more than one RETURN statement in the executable section [512] */



/*----------------------------------------------------------------------------------------------------------*\
|                       DoDefekt
\*----------------------------------------------------------------------------------------------------------*/
   FUNCTION DoDefekt (nFK_VRACHID IN NUMBER, FD1 IN DATE, FD2 IN DATE)
      RETURN NUMBER
   IS
      TYPE TRepRecords IS RECORD (
         fn_rownum                     NUMBER,
         FD_DATE                       DATE,
         fc_fio                        VARCHAR2 (100),
         fc_age                        VARCHAR2 (100),
         fc_ib                         VARCHAR2 (12),
         fc_vrach                      VARCHAR2 (200),
         fc_diag                       VARCHAR2 (4000),
         fc_clob                       tclobs.fc_clob%TYPE);

      TYPE RCRepRecords IS REF CURSOR
         RETURN TRepRecords;

      cPacs     RCRepRecords;
      sTmp      VARCHAR2 (32767);
      sZavOtd   VARCHAR2 (32767);
      cl        CLOB;
      nResID    NUMBER;
      rPac      TRepRecords;

      PROCEDURE Open_cPacs (pFK_VRACHID IN NUMBER, pPacs
/*ADVICE(69): An IN OUT parameter is used as IN only [103] */
                                                         IN OUT RCRepRecords
/*ADVICE(71): Local program unit reference to a external variable (use a parameter or pull in the definition) [210] */
                                                                            )
      IS
      BEGIN
         IF pFK_VRACHID > 0 THEN
            OPEN pPacs FOR
               SELECT /*+rule*/
                      TO_NUMBER (ROWNUM) AS fn_rownum, fd_date, fc_fam || ' ' || fc_im || ' ' || fc_otch AS fc_fio,
                      get_strage (get_pacageonvyb (fK_pacid)) AS fc_age, get_ib (fk_pacid) AS fc_ib,
                      do_vrachfio (get_pacvrach (fk_pacid)) AS fc_vrach,
                      do_diagbytype (fk_pacid, 2, 1) || ' ' || do_diagbytype (fk_pacid, 2, 0) AS fc_diag, fc_clob
               FROM   tclobs, tibdefekt, tkarta
               WHERE  tkarta.fk_id = tibdefekt.fk_pacid
AND                   tclobs.fk_id = tibdefekt.fk_clobid
AND                   fd_date BETWEEN fd1
/*ADVICE(86): Local program unit reference to a external variable (use a parameter or pull in the definition) [210] */
                                          AND fd2
/*ADVICE(88): Local program unit reference to a external variable (use a parameter or pull in the definition) [210] */

AND                   get_pacvrach (fk_pacid) = pFK_VRACHID
AND                   fl_podpis = 1
/*ADVICE(92): Elements in the SELECT list (either columns or expressions) are not qualified by a table/view name [403] */
                                   ;
         ELSIF pFK_VRACHID < 0 THEN
            OPEN pPacs FOR
               SELECT /*+rule*/
                      TO_NUMBER (ROWNUM) AS fn_rownum, fd_date, fc_fam || ' ' || fc_im || ' ' || fc_otch AS fc_fio,
                      get_strage (get_pacageonvyb (fK_pacid)) AS fc_age, get_ib (fk_pacid) AS fc_ib,
                      do_vrachfio (get_pacvrach (fk_pacid)) AS fc_vrach,
                      do_diagbytype (fk_pacid, 2, 1) || ' ' || do_diagbytype (fk_pacid, 2, 0) AS fc_diag, fc_clob
               FROM   tclobs, tibdefekt, tkarta
               WHERE  tkarta.fk_id = tibdefekt.fk_pacid
AND                   tclobs.fk_id = tibdefekt.fk_clobid
AND                   fd_date BETWEEN fd1
/*ADVICE(105): Local program unit reference to a external variable (use a parameter or pull in the definition) [210] */
                                          AND fd2
/*ADVICE(107): Local program unit reference to a external variable (use a parameter or pull in the definition) [210] */

AND                   get_vrachotd (get_pacvrach (fk_pacid)) = -pFK_VRACHID
AND                   fl_podpis = 1
/*ADVICE(111): Elements in the SELECT list (either columns or expressions) are not qualified by a table/view name [403] */
                                   ;
         ELSIF pFK_VRACHID = 0 THEN
            OPEN pPacs FOR
               SELECT /*+rule*/
                      ROWNUM AS fn_rownum, fd_date, fc_fam || ' ' || fc_im || ' ' || fc_otch AS fc_fio,
                      get_strage (get_pacageonvyb (fK_pacid)) AS fc_age, get_ib (fk_pacid) AS fc_ib,
                      do_vrachfio (get_pacvrach (fk_pacid)) AS fc_vrach,
                      do_diagbytype (fk_pacid, 2, 1) || ' ' || do_diagbytype (fk_pacid, 2, 0) AS fc_diag, fc_clob
               FROM   tclobs, tibdefekt, tkarta
               WHERE  tkarta.fk_id = tibdefekt.fk_pacid
AND                   tclobs.fk_id = tibdefekt.fk_clobid
AND                   fd_date BETWEEN fd1
/*ADVICE(124): Local program unit reference to a external variable (use a parameter or pull in the definition) [210] */
                                          AND fd2
/*ADVICE(126): Local program unit reference to a external variable (use a parameter or pull in the definition) [210] */

AND                   fl_podpis = 1
/*ADVICE(129): Elements in the SELECT list (either columns or expressions) are not qualified by a table/view name [403] */
                                   ;
         END IF;
      END;
   BEGIN
      sTmp :=
               '<html xmlns:v="urn:schemas-microsoft-com:vml"'
            || 'xmlns:o="urn:schemas-microsoft-com:office:office"'
            || 'xmlns:w="urn:schemas-microsoft-com:office:word"'
            || 'xmlns="http://www.w3.org/TR/REC-html40">'
            || '<head>'
            || '<meta http-equiv=Content-Type content="text/html; charset=windows-1251">'
            || '<meta name=ProgId content=Word.Document>'
            || '<meta name=Generator content="Microsoft Word 9">'
            || '<meta name=Originator content="Microsoft Word 9">'
            || '<link rel=File-List href="./example.files/filelist.xml">'
            || '<title>Журнал проверки (дефектуры) истории болезни зав. отделением</title>'
            || '<style>'
            || '<!--'
            || ' /* Style Definitions */'
            || 'p.MsoNormal, li.MsoNormal, div.MsoNormal'
            || ' {mso-style-parent:"";'
            || ' margin:0cm;'
            || ' margin-bottom:.0001pt;'
            || ' mso-pagination:widow-orphan;'
            || ' font-size:12.0pt;'
            || ' font-family:"Times New Roman";'
            || ' mso-fareast-font-family:"Times New Roman";'
            || ' color:black;}'
            || 'h1'
            || ' {margin-right:0cm;'
            || ' mso-margin-top-alt:auto;'
            || ' mso-margin-bottom-alt:auto;'
            || ' margin-left:0cm;'
            || ' mso-pagination:widow-orphan;'
            || ' mso-outline-level:1;'
            || ' font-size:24.0pt;'
            || ' font-family:"Times New Roman";'
            || ' color:black;}'
            || 'p.MsoFooter, li.MsoFooter, div.MsoFooter'
            || ' {margin:0cm;'
            || ' margin-bottom:.0001pt;'
            || ' mso-pagination:widow-orphan;'
            || ' tab-stops:center 233.85pt right 467.75pt;'
            || ' font-size:10.0pt;'
            || ' font-family:"Times New Roman";'
            || ' mso-fareast-font-family:"Times New Roman";'
            || ' color:black;}'
            || '@page Section1'
            || '{size:841.9pt 595.3pt;'
            || 'mso-page-orientation:landscape;'
            || 'margin:3.0cm 64.35pt 42.55pt 2.0cm;'
            || 'mso-header-margin:35.45pt;'
            || 'mso-footer-margin:35.45pt;'
            || 'mso-paper-source:0;}  '
            || 'div.Section1'
            || ' {page:Section1;}'
            || '-->'
            || '</style>'
            || '<!--[if gte mso 9]><xml>'
            || ' <o:shapedefaults v:ext="edit" spidmax="1027"/>'
            || '</xml><![endif]--><!--[if gte mso 9]><xml>'
            || ' <o:shapelayout v:ext="edit">'
            || '  <o:idmap v:ext="edit" data="1"/>'
            || ' </o:shapelayout></xml><![endif]-->'
            || '</head>'
            || '<body bgcolor=white lang=RU style=''tab-interval:35.4pt''>'
            || '<div class=Section1>'
            || '<h1 align=center style=''text-align:center''>Журнал проверки (дефектуры) истории болезни заведующим отделением за период'
            || '<br> с Date1 по Date2 <o:p></o:p></h1>'
            || '<p>По параметру:FC_PARNAME</p>'
            || '<div align=center>'
            || '<table border=1 cellspacing=0 cellpadding=0 style=''border-collapse:collapse; border:none;mso-border-alt:solid windowtext .5pt;mso-padding-alt:0cm 5.4pt 0cm 5.4pt''> '
            || ' <thead>'
            || '<tr> '
            || '  <td width=51 valign=top style=''border:solid windowtext .5pt;  background:white;padding:0cm 5.4pt 0cm 5.4pt''> '
            || '    №п/п </td>'
            || '  <td width=100 valign=top style=''border:solid windowtext .5pt;border-left:none;mso-border-left-alt:solid windowtext .5pt;background:white; padding:0cm 5.4pt 0cm 5.4pt''> '
            || '    Дата проверки </td>'
            || '  <td width=168 valign=top style=''border:solid windowtext .5pt; border-left:none;mso-border-left-alt:solid windowtext .5pt;background:white; padding:0cm 5.4pt 0cm 5.4pt''> '
            || '    ФИО пациента </td>'
            || '  <td width=72 valign=top style=''border:solid windowtext .5pt;  border-left:none;mso-border-left-alt:solid windowtext .5pt;background:white;  padding:0cm 5.4pt 0cm 5.4pt''> '
            || '    Возраст </td>'
            || '  <td width=84 valign=top style=''border:solid windowtext .5pt;  border-left:none;mso-border-left-alt:solid windowtext .5pt;background:white;  padding:0cm 5.4pt 0cm 5.4pt''> '
            || '    № ИБ </td>'
            || '  <td width=168 valign=top style=''border:solid windowtext .5pt; border-left:none;mso-border-left-alt:solid windowtext .5pt;background:white;  padding:0cm 5.4pt 0cm 5.4pt''> '
            || '    ФИО врача </td>'
            || '  <td width=108 valign=top style=''border:solid windowtext .5pt; border-left:none;mso-border-left-alt:solid windowtext .5pt;background:white; padding:0cm 5.4pt 0cm 5.4pt''> '
            || '    Санаторный диагноз </td>'
            || '  <td width=240 valign=top style=''border:solid windowtext .5pt; border-left:none;mso-border-left-alt:solid windowtext .5pt;background:white;  padding:0cm 5.4pt 0cm 5.4pt''> '
            || '    Замечания </td>'
            || '</tr> '
            || '</thead>';

      INSERT INTO tclobs
                  (fk_id, fc_clob)
      VALUES      (NULL, EMPTY_CLOB ())
      RETURNING   fk_id, fc_clob
      INTO        nResID, cl;

      sTmp := REPLACE (sTmp, 'Date1', TO_CHAR (fd1, 'dd.mm.yyyy'));
      sTmp := REPLACE (sTmp, 'Date2', TO_CHAR (fd2, 'dd.mm.yyyy'));
      sTmp := REPLACE (sTmp, 'FC_PARNAME', get_parname (nFK_VRACHID));
      DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
      open_cPacs (nFK_VRACHID, cPacs);

      LOOP
         FETCH cPacs INTO rPac;
         EXIT WHEN cPacs%NOTFOUND;
         sTmp :=
                  '<tr><td width=51 valign=top style=''border:solid windowtext .5pt;  background:white;padding:0cm 5.4pt 0cm 5.4pt''>FN_ROWNUM</td> '
               || '  <td width=100 valign=top style=''border:solid windowtext .5pt;border-left:none;mso-border-left-alt:solid windowtext .5pt;background:white; padding:0cm 5.4pt 0cm 5.4pt''>DATE</td> '
               || '  <td width=168 valign=top style=''border:solid windowtext .5pt; border-left:none;mso-border-left-alt:solid windowtext .5pt;background:white; padding:0cm 5.4pt 0cm 5.4pt''>PACFIO</td> '
               || '  <td width=72 valign=top style=''border:solid windowtext .5pt;  border-left:none;mso-border-left-alt:solid windowtext .5pt;background:white;  padding:0cm 5.4pt 0cm 5.4pt''>AGE</td> '
               || '  <td width=84 valign=top style=''border:solid windowtext .5pt;  border-left:none;mso-border-left-alt:solid windowtext .5pt;background:white;  padding:0cm 5.4pt 0cm 5.4pt''>PACIB</td> '
               || '  <td width=168 valign=top style=''border:solid windowtext .5pt; border-left:none;mso-border-left-alt:solid windowtext .5pt;background:white;  padding:0cm 5.4pt 0cm 5.4pt''>VRACH</td> '
               || '  <td width=108 valign=top style=''border:solid windowtext .5pt; border-left:none;mso-border-left-alt:solid windowtext .5pt;background:white; padding:0cm 5.4pt 0cm 5.4pt''>DIAG</td> '
               || '  <td width=240 valign=top style=''border:solid windowtext .5pt; border-left:none;mso-border-left-alt:solid windowtext .5pt;background:white;  padding:0cm 5.4pt 0cm 5.4pt''>';
         sTmp := REPLACE (sTmp, 'DATE', TO_CHAR (rPac.fd_date, 'dd.mm.yyyy'));
         sTmp := REPLACE (sTmp, 'FN_ROWNUM', rPac.FN_ROWNUM);
         sTmp := REPLACE (sTmp, 'PACFIO', rPac.fc_fio);
         sTmp := REPLACE (sTmp, 'AGE', rPac.fc_age);
         sTmp := REPLACE (sTmp, 'PACIB', rPac.fc_ib);
         sTmp := REPLACE (sTmp, 'VRACH', rPac.fc_vrach);
         sTmp := REPLACE (sTmp, 'DIAG', rPac.fc_diag);
         DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
         DBMS_LOB.append (cl, rPac.fc_clob);
         sTmp := '</td></tr>';
         DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
      END LOOP;

      sTmp :=
               '</table><table border=1 cellspacing=0 cellpadding=0 width="100%" style=''width:100.0%;'
            || '</div> '
            || '<p class=MsoNormal><span lang=EN-US style=''color:windowtext;mso-ansi-language:EN-US''> '
            || '<![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></p> '
            || '<p class=MsoNormal><span lang=EN-US style=''color:windowtext;mso-ansi-language:EN-US''> '
            || '<![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></p> '
            || '<table border=1 cellspacing=0 cellpadding=0 style=''border-collapse:collapse; '
            || ' border:none;mso-border-alt:solid windowtext .5pt;mso-padding-alt:0cm 5.4pt 0cm 5.4pt''> '
            || ' <tr> '
            || '  <td width="60%" style=''width:15.46%;border:solid black .75pt;padding:0cm 0cm 0cm 0cm''>'
            || '  <p class=MsoNormal><span lang=EN-US style=''color:windowtext;mso-ansi-language:EN-US''> '
            || '  Зав. отделением</span><span style=''color:windowtext''><o:p></o:p></span></p> '
            || '  </td> '
            || '   <td width="15%" style=''width:15.46%;border:solid black .75pt;padding:0cm 0cm 0cm 0cm''>'
            || '  <p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><span style=''color:windowtext''><o:p></o:p></span></p> '
            || '  </td> '
            || '   <td width="25%" style=''width:15.46%;border:solid black .75pt;padding:0cm 0cm 0cm 0cm''>'
            || '  <p class=MsoNormal><span lang=EN-US style=''color:windowtext;mso-ansi-language:EN-US''>ZAVFIO</span><span style=''color:windowtext''><o:p></o:p></span></p> '
            || '  </td> '
            || ' </tr> '
            || '</table> '
            || '<p class=MsoNormal><span style=''color:windowtext''><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></p> '
            || '</div> '
            || '</body> '
            || '</html>';

      IF nFK_VRACHID = 0 THEN
         FOR i IN  (SELECT do_vrachfio (fk_id) AS fc_fio
                    FROM   tsotr
                    WHERE  EXISTS ( SELECT fk_id
                                    FROM   tsotr ts1
                                    WHERE  get_zavotdid (fk_id) = tsotr.fk_id)) LOOP
            sZavOtd := sZavOtd || i.fc_fio || '<br>';
         END LOOP;

         sTmp := REPLACE (sTmp, 'ZAVFIO', sZavOtd);
      ELSIF nFK_vrachid < 0 THEN
         FOR i IN  (SELECT do_vrachfio (fk_id) AS fc_fio
                    FROM   tsotr
                    WHERE  EXISTS ( SELECT fk_id
                                    FROM   tsotr ts1
                                    WHERE  get_zavotdid (fk_id) = tsotr.fk_id AND fk_otdid = -nFK_VRACHID)) LOOP
            sZavOtd := sZavOtd || i.fc_fio || ' ';
         END LOOP;

         sTmp := REPLACE (sTmp, 'ZAVFIO', sZavOtd);
      ELSE
         sTmp := REPLACE (sTmp, 'ZAVFIO', get_zavotdfio (nFK_VRACHID));
      END IF;

      /*
          FOR i IN (SELECT do_vrachfio (tsotr.fk_id) AS fc_vrach, totdel.fc_name AS fc_otdel
                      FROM tsotr, totdel
                     WHERE tsotr.fk_otdid = totdel.fk_id
                       AND tsotr.fk_id = nFK_VRACHID) LOOP
            sTmp  := REPLACE (sTmp, 'OTDEL', i.fc_otdel);
            sTmp  := REPLACE (sTmp, 'ZAVFIO', i.fc_vrach);
          END LOOP;*/
      DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
      RETURN nResID;
   END;


/*----------------------------------------------------------------------------------------------------------*\
|                       DoKOnsZavOtd
\*----------------------------------------------------------------------------------------------------------*/
   FUNCTION DoKOnsZavOtd (nFK_VRACHID IN NUMBER, FD1 IN DATE, FD2 IN DATE)
      RETURN NUMBER
   IS
      CURSOR c (pFK_VRACHID IN NUMBER, FD1 IN DATE, FD2 IN DATE)
      IS
         SELECT /*+rule*/
                ROWNUM AS fn_rownum, fd_ins AS fd_date, tkarta.fc_fam || ' ' || tkarta.fc_im || ' ' || tkarta.fc_otch  AS fc_fio,
                TRUNC (get_pacageonvyb (fK_pacid)) AS fn_age, get_ib (fk_pacid) AS fc_ib,
                do_vrachfio (get_pacvrach (fk_pacid)) AS fc_vrach,
                do_diagbytype (fk_pacid, 2, 1) || ' ' || do_diagbytype (fk_pacid, 2, 0) AS fc_diag,
                do_diagbytype (fk_pacid, 4, 1, treskons.fk_nazid) || ' ' || do_diagbytype (fk_pacid, 4, 0) AS fc_zavotddiag,
                fc_clob, '' AS fc_res, treskons.fc_type
         FROM   tclobs, treskons, tkarta, tsmid
         WHERE  tkarta.fk_id = treskons.fk_pacid
AND             tclobs.fk_id = treskons.fk_blobid
AND             fd_ins BETWEEN fd1 AND fd2
AND             fk_vrachid = pFK_VRACHID
AND             fk_sos = get_vipnaz
AND             tsmid.fk_id = treskons.fk_smid
AND             tsmid.fc_synonim = 'KONS_ZAVOTD'
AND             treskons.fc_type = 'CLOB'
/*ADVICE(351): Elements in the SELECT list (either columns or expressions) are not qualified by a table/view name [403] */
         UNION ALL
         SELECT /*+rule*/
                ROWNUM AS fn_rownum, fd_ins AS fd_date, fc_fam || ' ' || fc_im || ' ' || fc_otch AS fc_fio,
                TRUNC (get_pacageonvyb (fK_pacid)) AS fn_age, get_ib (fk_pacid) AS fc_ib,
                do_vrachfio (get_pacvrach (fk_pacid)) AS fc_vrach,
                do_diagbytype (fk_pacid, 2, 1) || do_diagbytype (fk_pacid, 2, 0) AS fc_diag,
                   do_diagbytype (fk_pacid, 4, 1, treskons.fk_nazid)
                || ' '
                || do_diagbytype (fk_pacid, 4, 0, treskons.fk_nazid) AS fc_zavotddiag,
                EMPTY_CLOB () AS fc_clob, fc_res, treskons.fc_type
         FROM   treskons, tkarta, tsmid
         WHERE  tkarta.fk_id = treskons.fk_pacid
AND             fd_ins BETWEEN fd1 AND fd2
AND             fk_vrachid = pFK_VRACHID
AND             fk_sos = get_vipnaz
AND             tsmid.fk_id = treskons.fk_smid
AND             tsmid.fc_synonim = 'KONS_ZAVOTD'
AND             treskons.fc_type = 'TEXT'
union all
         SELECT /*+rule*/
                ROWNUM AS fn_rownum, fd_ins AS fd_date, tambulance.fc_fam||' '||tambulance.fc_im||' '||tambulance.fc_otch AS fc_fio,
                TRUNC (get_pacageonvyb (fK_pacid)) AS fn_age, get_ib (fk_pacid) AS fc_ib,
                do_vrachfio (get_pacvrach (fk_pacid)) AS fc_vrach,
                do_diagbytype (fk_pacid, 2, 1) || ' ' || do_diagbytype (fk_pacid, 2, 0) AS fc_diag,
                do_diagbytype (fk_pacid, 4, 1, treskons.fk_nazid) || ' ' || do_diagbytype (fk_pacid, 4, 0) AS fc_zavotddiag,
                fc_clob, '' AS fc_res, treskons.fc_type
         FROM   tclobs, treskons, tambulance, tsmid
         WHERE  tambulance.fk_id = treskons.fk_pacid
AND             tclobs.fk_id = treskons.fk_blobid
AND             fd_ins BETWEEN fd1 AND FD2
AND             fk_vrachid = pFK_VRACHID
AND             fk_sos = get_vipnaz
AND             tsmid.fk_id = treskons.fk_smid
AND             tsmid.fc_synonim = 'KONS_ZAVOTD'
AND             treskons.fc_type = 'CLOB'
/*ADVICE(351): Elements in the SELECT list (either columns or expressions) are not qualified by a table/view name [403] */
         UNION ALL
         SELECT /*+rule*/
                ROWNUM AS fn_rownum, fd_ins AS fd_date, tambulance.fc_fam || ' ' || tambulance.fc_im || ' ' || tambulance.fc_otch AS fc_fio,
                TRUNC (get_pacageonvyb (fK_pacid)) AS fn_age, get_ib (fk_pacid) AS fc_ib,
                do_vrachfio (get_pacvrach (fk_pacid)) AS fc_vrach,
                do_diagbytype (fk_pacid, 2, 1) || do_diagbytype (fk_pacid, 2, 0) AS fc_diag,
                   do_diagbytype (fk_pacid, 4, 1, treskons.fk_nazid)
                || ' '
                || do_diagbytype (fk_pacid, 4, 0, treskons.fk_nazid) AS fc_zavotddiag,
                EMPTY_CLOB () AS fc_clob, fc_res, treskons.fc_type
         FROM   treskons, tambulance, tsmid
         WHERE  tambulance.fk_id = treskons.fk_pacid
AND             fd_ins BETWEEN fd1 AND fd2
AND             fk_vrachid = pFK_VRACHID
AND             fk_sos = get_vipnaz
AND             tsmid.fk_id = treskons.fk_smid
AND             tsmid.fc_synonim = 'KONS_ZAVOTD'
AND             treskons.fc_type = 'TEXT'
/*ADVICE(371): Elements in the SELECT list (either columns or expressions) are not qualified by a table/view name [403] */
                                         ;

      sTmp     VARCHAR2 (32767);
      cl       CLOB;
      nResID   NUMBER;
   BEGIN
      sTmp :=
               '<html xmlns:v="urn:schemas-microsoft-com:vml" '
            || 'xmlns:o="urn:schemas-microsoft-com:office:office" '
            || 'xmlns:w="urn:schemas-microsoft-com:office:word" '
            || 'xmlns="http://www.w3.org/TR/REC-html40"> '
            || '<head> '
            || '<meta http-equiv=Content-Type content="text/html; charset=windows-1251"> '
            || '<meta name=ProgId content=Word.Document> '
            || '<meta name=Generator content="Microsoft Word 9"> '
            || '<meta name=Originator content="Microsoft Word 9"> '
            || '<title>Журнал проверки (дефектуры) истории болезни зав. отделением</title> '
            || '<style> '
            || '<!-- '
            || ' /* Style Definitions */ '
            || 'p.MsoNormal, li.MsoNormal, div.MsoNormal '
            || ' {mso-style-parent:""; '
            || ' margin:0cm; '
            || ' margin-bottom:.0001pt; '
            || ' mso-pagination:widow-orphan; '
            || ' font-size:10.0pt; '
            || ' font-family:"Times New Roman"; '
            || ' mso-fareast-font-family:"Times New Roman"; '
            || ' color:black;} '
            || 'h1 '
            || ' {margin-right:0cm; '
            || ' mso-margin-top-alt:auto; '
            || ' mso-margin-bottom-alt:auto; '
            || ' margin-left:0cm; '
            || ' mso-pagination:widow-orphan; '
            || ' mso-outline-level:1; '
            || ' font-size:24.0pt; '
            || ' font-family:"Times New Roman"; '
            || ' color:black;} '
            || 'p.MsoFooter, li.MsoFooter, div.MsoFooter '
            || ' {margin:0cm; '
            || ' margin-bottom:.0001pt; '
            || ' mso-pagination:widow-orphan; '
            || ' tab-stops:center 233.85pt right 467.75pt; '
            || ' font-size:10.0pt; '
            || ' font-family:"Times New Roman"; '
            || ' mso-fareast-font-family:"Times New Roman"; '
            || ' color:black;} '
            || '@page Section1 '
            || ' {size:595.3pt 841.9pt; '
            || ' margin:2.0cm 42.5pt 2.0cm 3.0cm; '
            || ' mso-header-margin:35.4pt; '
            || ' mso-footer-margin:35.4pt; '
            || ' mso-paper-source:0;} '
            || 'div.Section1 '
            || ' {page:Section1;} '
            || '--> '
            || '<!--[if gte mso 9]><xml> '
            || ' <x:ExcelWorkbook>'
            || '  <x:ExcelWorksheets>'
            || '   <x:ExcelWorksheet>'
            || '    <x:Name>~RA362</x:Name>'
            || '    <x:WorksheetOptions>'
            || '     <x:FitToPage/>'
            || '     <x:Print>'
            || '      <x:FitHeight>1000</x:FitHeight>'
            || '      <x:ValidPrinterInfo/>'
            || '      <x:PaperSizeIndex>9</x:PaperSizeIndex>'
            || '      <x:Scale>86</x:Scale>'
            || '      <x:HorizontalResolution>600</x:HorizontalResolution>'
            || '      <x:VerticalResolution>600</x:VerticalResolution>'
            || '     </x:Print>'
            || '     <x:Selected/>'
            || '     <x:DoNotDisplayGridlines/>'
            || '     <x:Panes>'
            || '      <x:Pane>'
            || '       <x:Number>3</x:Number>'
            || '       <x:ActiveRow>1</x:ActiveRow>'
            || '       <x:ActiveCol>1</x:ActiveCol>'
            || '      </x:Pane>'
            || '     </x:Panes>'
            || '     <x:ProtectContents>False</x:ProtectContents>'
            || '     <x:ProtectObjects>False</x:ProtectObjects>'
            || '     <x:ProtectScenarios>False</x:ProtectScenarios>'
            || '    </x:WorksheetOptions>'
            || '   </x:ExcelWorksheet>'
            || '  </x:ExcelWorksheets>'
            || '  <x:ProtectStructure>False</x:ProtectStructure>'
            || '  <x:ProtectWindows>False</x:ProtectWindows>'
            || ' </x:ExcelWorkbook>'
            || '</xml><![endif]--><!--[if gte mso 9]><xml>'
            || ' <w:WordDocument>'
            || '  <w:View>Print</w:View>'
            || '  <w:Zoom>BestFit</w:Zoom>'
            || ' </w:WordDocument>'
            || '</xml><![endif]--></style>'
            || '</head> '

            || '<body bgcolor=white lang=RU style=''tab-interval:35.4pt''> '
            || '<div class=Section1>  '
            || '  <h1 align=center style=''text-align:center''>Журнал консультаций заведующим отделением  '
            || '    <br>  за период с DATE1 по DATE2 <o:p></o:p></h1> '
            || '  <div align=center>  '
            || '    <table border=1 cellspacing=0 cellpadding=0 width="100%" style=''width:100.0%;border-collapse:collapse;border:none;mso-border-alt:solid black .75pt;mso-padding-alt:0cm 0cm 0cm 0cm'' bordercolorlight="#000000"bordercolordark="#FFFFFF"> '
            || '      <thead>  '
            || '      <tr>  '
            || '        <td width="15%" style=''width:15.46%;border:solid black .75pt;padding:0cm 0cm 0cm 0cm''>  '
            || '          <p class=MsoNormal align=center style=''text-align:center''><b><span style=''color:windowtext''>№ п.п.<o:p></o:p></span></b></p> '
            || '        </td> '
            || '        <td width="84%" style=''width:84.54%;border:solid black .75pt;border-left:none;mso-border-left-alt:solid black .75pt;padding:0cm 0cm 0cm 0cm''>  '
            || '          <p class=MsoNormal align=center style=''text-align:center''><b><span style=''color:windowtext''>Замечания<o:p></o:p></span></b></p> '
            || '        </td> '
            || '      </tr> '
            || '      </thead> ';

      INSERT INTO tclobs
                  (fk_id, fc_clob)
      VALUES      (NULL, EMPTY_CLOB ())
      RETURNING   fk_id, fc_clob
      INTO        nResID, cl;

      sTmp := REPLACE (sTmp, 'DATE1', TO_CHAR (fd1, 'dd.mm.yyyy'));
      sTmp := REPLACE (sTmp, 'DATE2', TO_CHAR (fd2, 'dd.mm.yyyy'));
      DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);

      --внесение данных в таблицу
      FOR i IN c (nFK_VRACHID, FD1, FD2) LOOP
         sTmp :=
                  '      <tr>  '
               || '        <td width="15%" style=''width:15.46%;border:solid black .75pt;border-top:none; mso-border-top-alt:solid black .75pt;padding:0cm 0cm 0cm 0cm''> '
               || '          <p class=MsoNormal align=center style=''text-align:center''><span style=''color:windowtext''>FN_ROWNUM<o:p></o:p></span></p> '
               || '        </td> '
               || '        <td width="84%" style=''width:84.54%;border-top:none;border-left:none;border-bottom:solid black .75pt;border-right:solid black .75pt;mso-border-top-alt:solid black .75pt;mso-border-left-alt:solid black .75pt;padding:0cm 0cm 0cm 0cm''>  '
               || '          <p class=MsoNormal><b><span style=''color:windowtext''>Дата проверки:</span></b><span style=''color:windowtext''> </span><span lang=EN-US style=''color:windowtext;mso-ansi-language:EN-US''>DATE</span><span style=''color:windowtext''><o:p></o:p></span></p> '
               || '          <p class=MsoNormal><b><span style=''color:windowtext''>Ф.И.О. больного:</span></b><span style=''color:windowtext''> </span><span lang=EN-US style=''color:windowtext; mso-ansi-language:EN-US''>PACFIO</span><span style=''color:windowtext''><o:p></o:p></span></p> '
               || '          <p class=MsoNormal><b><span style=''color:windowtext''>Возраст:</span></b><span style=''color:windowtext''> </span><span lang=EN-US style=''color:windowtext;mso-ansi-language:EN-US''>PACAGE</span><span style=''color:windowtext''><o:p></o:p></span></p> '
               || '          <p class=MsoNormal><b><span style=''color:windowtext''>№ И.Б.:</span></b><span style=''color:windowtext''> </span><span lang=EN-US style=''color:windowtext;mso-ansi-language:EN-US''>PACIB</span><span style=''color:windowtext''><o:p></o:p></span></p> '
               || '          <p class=MsoNormal><b><span style=''color:windowtext''>Ф.И.О. лечащего врача:</span></b><span style=''color:windowtext''> </span><span lang=EN-US style=''color:windowtext;mso-ansi-language:EN-US''>VRACH</span><span style=''color:windowtext''><o:p></o:p></span></p> '
               || '          <p class=MsoNormal><b><span style=''color:windowtext''>Диагноз поставленный лечащим врачом:</span></b><span style=''color:windowtext''> </span><span lang=EN-US style=''color:windowtext;mso-ansi-language:EN-US''>SANDIAG</span><span style=''color:windowtext''><o:p></o:p></span></p> '
               || '          <p class=MsoNormal><b><span style=''color:windowtext''>Диагноз предлагаемый зав. отделением: </span></b><span lang=EN-US style=''color:windowtext;mso-ansi-language:EN-US''>DIAG_ZAVOTD</span><span style=''color:windowtext''><o:p></o:p></span></p> '
               || '          <p class=MsoNormal><b><span style=''color:windowtext''>Замечания по ведению истории болезни:</span></b><span style=''color:windowtext''> </span><span lang=EN-US style=''color:windowtext;mso-ansi-language:EN-US''><br>';
         sTmp := REPLACE (sTmp, 'DATE', TO_CHAR (i.fd_date, 'dd.mm.yyyy'));
         sTmp := REPLACE (sTmp, 'FN_ROWNUM', i.FN_ROWNUM);
         sTmp := REPLACE (sTmp, 'PACFIO', i.fc_fio);
         sTmp := REPLACE (sTmp, 'PACAGE', i.fn_age);
         sTmp := REPLACE (sTmp, 'PACIB', i.fc_ib);
         sTmp := REPLACE (sTmp, 'VRACH', i.fc_vrach);
         sTmp := REPLACE (sTmp, 'SANDIAG', i.fc_diag);
         sTmp := REPLACE (sTmp, 'DIAG_ZAVOTD', i.fc_zavotddiag);
         DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
         sTmp := ''
/*ADVICE(527): In Oracle 8 strings of zero length assigned to CHAR variables will blank-pad these rather than making them
              NULL [111] */
                   ;

         IF i.fc_type = 'CLOB' THEN
            DBMS_LOB.append (cl, i.fc_clob);
         ELSE
            sTmp := REPLACE (i.fc_res, CHR (10), '<br>');
         END IF;

         sTmp := sTmp || '</span><span style=''color:windowtext''><o:p></o:p></span></p> ' || '  </td> ' || ' </tr>';
         DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
      END LOOP;

      --подпись
      sTmp :=
               '</table><table border=1 cellspacing=0 cellpadding=0 width="100%" style=''width:100.0%;'
            || '</div> '
            || '<p class=MsoNormal><span lang=EN-US style=''color:windowtext;mso-ansi-language:EN-US''> '
            || '<![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></p> '
            || '<p class=MsoNormal><span lang=EN-US style=''color:windowtext;mso-ansi-language:EN-US''> '
            || '<![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></p> '
            || '<table border=1 cellspacing=0 cellpadding=0 style=''border-collapse:collapse; '
            || ' border:none;mso-border-alt:solid windowtext .5pt;mso-padding-alt:0cm 5.4pt 0cm 5.4pt''> '
            || ' <tr> '
            || '  <td width="60%" style=''width:15.46%;border:solid black .75pt;padding:0cm 0cm 0cm 0cm''>'
            || '  <p class=MsoNormal><span style=''color:windowtext''>Зав. отделением </span><span style=''color:windowtext''><o:p></o:p></span></p> '
            || '  </td> '
            || '   <td width="15%" style=''width:15.46%;border:solid black .75pt;padding:0cm 0cm 0cm 0cm''>'
            || '  <p class=MsoNormal><![if !supportEmptyParas]>&nbsp;<![endif]><span style=''color:windowtext''><o:p></o:p></span></p> '
            || '  </td> '
            || '   <td width="25%" style=''width:15.46%;border:solid black .75pt;padding:0cm 0cm 0cm 0cm''>'
            || '  <p class=MsoNormal><span lang=EN-US style=''color:windowtext;mso-ansi-language:EN-US''>ZAVFIO</span><span style=''color:windowtext''><o:p></o:p></span></p> '
            || '  </td> '
            || ' </tr> '
            || '</table> '
            || '<p class=MsoNormal><span style=''color:windowtext''><![if !supportEmptyParas]>&nbsp;<![endif]><o:p></o:p></span></p> '
            || '</div> '
            || '</body> '
            || '</html>';

      FOR i IN  (SELECT do_vrachfio (tsotr.fk_id) AS fc_vrach, totdel.fc_name AS fc_otdel
                 FROM   tsotr, totdel
                 WHERE  tsotr.fk_otdid = totdel.fk_id AND tsotr.fk_id = nFK_VRACHID) LOOP

--      sTmp  := REPLACE (sTmp, 'OTDEL', i.fc_otdel);
         sTmp := REPLACE (sTmp, 'ZAVFIO', i.fc_vrach);
      END LOOP;

      DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
      RETURN nResID;
   END;


/*----------------------------------------------------------------------------------------------------------*\
|                       DoProtivPac
\*----------------------------------------------------------------------------------------------------------*/
   FUNCTION DoProtivPac (FD1 IN DATE, FD2 IN DATE)
      RETURN NUMBER
   IS
      CURSOR c (FD1 IN DATE, FD2 IN DATE)
      IS
         SELECT   get_ib (fk_id) AS fc_ib, get_pacfio (fk_id) AS fc_fio, do_vrachfio (get_pacvrach (fk_id)) AS FC_VRACH,
                  TO_CHAR (do_prybdate (fk_id), 'dd.mm.yyyy') AS fd_pryb,
                  TO_CHAR (get_pacplanoutcome (fk_id), 'dd.mm.yyyy') AS fd_vyb, do_diagbytype (fk_id, 2, 1) AS fc_diag,
                  GET_STRAGE (GET_PACAGEONVYB (fk_id)) AS fc_age
         FROM     (SELECT DISTINCT tkarta.fk_id, fk_ibid, fk_iby
                   FROM            tkarta, tdiag, tsmid, tsroky
                   WHERE           (   FD_DATA1 BETWEEN FD1 AND FD2
                                    OR FD_DATA3 BETWEEN FD1 AND FD2
                                    OR FD1 BETWEEN FD_DATA1 AND FD_DATA3
                                    OR FD2 BETWEEN FD_DATA1 AND FD_DATA3
                                   )
AND                                FK_PRYB IN (2, 4, 5, 6)
AND                                tsroky.fk_pacid = tkarta.fk_id
AND                                tdiag.fk_pacid = tkarta.fk_id
AND                                tdiag.fk_smdiagid = tsmid.fk_id
AND                                (tsmid.fp_pat = 1 OR fl_pokaz = 1)
/*ADVICE(605): Elements in the SELECT list (either columns or expressions) are not qualified by a table/view name [403] */
                                                                     )
         ORDER BY fk_iby, fk_ibid;

      sTmp     VARCHAR2 (32767);
      cl       CLOB;
      nResID   NUMBER;
   BEGIN
      INSERT INTO tclobs
                  (fk_id, fc_clob)
      VALUES      (NULL, EMPTY_CLOB ())
      RETURNING   fk_id, fc_clob
      INTO        nResID, cl;

      sTmp :=
               '<html xmlns:o="urn:schemas-microsoft-com:office:office" '
            || 'xmlns:w="urn:schemas-microsoft-com:office:word" '
            || 'xmlns="http://www.w3.org/TR/REC-html40"> '
            || '<head> '
            || '<meta http-equiv=Content-Type content="text/html; charset=windows-1251"> '
||'<meta name=ProgId content=Excel.Sheet>'
||'<meta name=Generator content="Microsoft Excel 9"> '

            || '<title>Список больных противопоказанных к лечению </title> '
            || '<style> <!-- @page {mso-page-orientation:landscape;} --> </style> '||

'<!--[if gte mso 9]><xml> '||
' <x:ExcelWorkbook> '||
'  <x:ExcelWorksheets> '||
'   <x:ExcelWorksheet> '||
'    <x:Name>~RA373</x:Name> '||
'    <x:WorksheetOptions> '||
'     <x:FitToPage/> '||
'     <x:Print> '||
'      <x:FitHeight>1000</x:FitHeight> '||
'      <x:ValidPrinterInfo/> '||
'      <x:PaperSizeIndex>9</x:PaperSizeIndex> '||
'      <x:Scale>86</x:Scale> '||
'      <x:HorizontalResolution>600</x:HorizontalResolution> '||
'      <x:VerticalResolution>600</x:VerticalResolution> '||
'     </x:Print> '||
'     <x:Selected/> '||
'     <x:DoNotDisplayGridlines/> '||
'     <x:Panes> '||
'      <x:Pane> '||
'       <x:Number>3</x:Number> '||
'       <x:RangeSelection>A1:G1</x:RangeSelection> '||
'      </x:Pane> '||
'     </x:Panes> '||
'     <x:ProtectContents>False</x:ProtectContents> '||
'     <x:ProtectObjects>False</x:ProtectObjects> '||
'     <x:ProtectScenarios>False</x:ProtectScenarios> '||
'    </x:WorksheetOptions> '||
'   </x:ExcelWorksheet> '||
'  </x:ExcelWorksheets> '||
'  <x:WindowHeight>10365</x:WindowHeight> '||
'  <x:WindowWidth>17100</x:WindowWidth> '||
'  <x:WindowTopX>120</x:WindowTopX> '||
'  <x:WindowTopY>75</x:WindowTopY> '||
'  <x:ProtectStructure>False</x:ProtectStructure> '||
'  <x:ProtectWindows>False</x:ProtectWindows> '||
' </x:ExcelWorkbook> '||
'</xml><![endif]--><!--[if gte mso 9]><xml> '||
' <w:WordDocument> '||
'  <w:View>Print</w:View> '||
'  <w:Zoom>BestFit</w:Zoom> '||
' </w:WordDocument> '||
'</xml><![endif]--> '




            || '</head> '
            || '<body lang=RU style=''tab-interval:35.4pt''> '
            || '<div class=Section1> '
            || '<p class=MsoNormal align=center style=''text-align:center''><span style=''font-size:16.0pt;mso-bidi-font-size:16.0pt''>Список больных противопоказанных к лечению </span> '
            || '<span lang=EN-US style=''font-size:16.0pt;mso-bidi-font-size:16.0pt;mso-ansi-language:EN-US''><br></span> '
            || '<span style=''font-size:16.0pt;mso-bidi-font-size:16.0pt''>за период с </span> '
            || '<span lang=EN-US style=''font-size:16.0pt;mso-bidi-font-size:16.0pt;mso-ansi-language:EN-US''>DATA1 по DATA2</span> '
            || '<span lang=EN-US style=''font-size:16.0pt;mso-bidi-font-size:16.0pt;mso-ansi-language:EN-US''><o:p>&nbsp</o:p></span></p> '
            || '<br>'
            || '<table border=1 cellspacing=0 cellpadding=0 width="100%" style=''width:100.0%;border-collapse:collapse;border:none;mso-border-alt:solid windowtext .5pt; mso-padding-alt:0cm 5.4pt 0cm 5.4pt''> '
            || ' <thead> <tr> '
            || '   <td width="10%" valign=top style=''width:10.38%;border:solid windowtext .5pt;  padding:0cm 5.4pt 0cm 5.4pt''> '
            || '   <p class=MsoNormal align=center style=''text-align:center''><b>№ И.Б.<o:p></o:p></b></p> </td> '
            || '   <td width="21%" valign=top style=''width:14.68%;border:solid windowtext .5pt;  border-left:none;mso-border-left-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt''> '
            || '   <p class=MsoNormal align=center style=''text-align:center''><b>Ф.И.О. пациента<o:p></o:p></b></p> </td> '
            || '   <td width="8%" valign=top style=''width:8.5%;border:solid windowtext .5pt; border-left:none;mso-border-left-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt''> '
            || '   <p class=MsoNormal align=center style=''text-align:center''><b>Возраст<o:p></o:p></b></p> </td> '
            || '   <td width="21%" valign=top style=''width:19.5%;border:solid windowtext .5pt; border-left:none;mso-border-left-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt''> '
            || '   <p class=MsoNormal align=center style=''text-align:center''><b>Ф.И.О. лечащего врача<o:p></o:p></b></p> </td> '
            || '   <td width="10%" valign=top style=''width:15.8%;border:solid windowtext .5pt; border-left:none;mso-border-left-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt''> '
            || '   <p class=MsoNormal align=center style=''text-align:center''><b>Дата прибытия<o:p></o:p></b></p> </td> '
            || '   <td width="10%" valign=top style=''width:17.04%;border:solid windowtext .5pt; border-left:none;mso-border-left-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt''> '
            || '   <p class=MsoNormal style=''margin-left:-5.4pt''><b>Дата выписки<o:p></o:p></b></p> </td> '
            || '   <td width="20%" valign=top style=''width:22.58%;border:solid windowtext .5pt;border-left:none;mso-border-left-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt''> '
            || '   <p class=MsoNormal align=center style=''text-align:center''><b>Диагноз<o:p></o:p></b></p></td> '
            || '  </tr> '
            || ' </thead>';
      sTmp := REPLACE (sTmp, 'DATA1', TO_CHAR (fd1, 'dd.mm.yyyy'));
      sTmp := REPLACE (sTmp, 'DATA2', TO_CHAR (fd2, 'dd.mm.yyyy'));
      DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);

      FOR i IN c (fd1, fd2) LOOP
         sTmp :=
                  '  <tr> '
               || --fc_ib
                  '  <td width="10%" valign=top style=''width:10.38%;border:solid windowtext .5pt;border-top:none;mso-border-top-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt''> '
               || '  <p class=MsoNormal style=''text-align:justify''> '
               || '  <span lang=EN-US style=''font-size:10.0pt;mso-bidi-font-size:10.0pt;mso-ansi-language:EN-US''>FC_IB<o:p></o:p></span></p></td> '
               || --fc_pac
                  '  <td width="14%" valign=top style=''width:14.68%;border-top:none;border-left:none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt''> '
               || '  <p class=MsoNormal style=''text-align:justify''><span lang=EN-US style=''font-size:10.0pt;mso-bidi-font-size:10.0pt;mso-ansi-language:EN-US''>FC_PAC<o:p></o:p></span></p></td> '
               || --fc_age
                  '  <td width="8%" valign=top style=''width:8.5%;border-top:none;border-left: none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt; mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt''> '
               || '  <p class=MsoNormal style=''text-align:justify''><span lang=EN-US style=''font-size:10.0pt;mso-bidi-font-size:10.0pt;mso-ansi-language:EN-US''>FC_AGE<o:p></o:p></span></p></td> '
               || --fc_vrach
                  '  <td width="19%" valign=top style=''width:19.5%;border-top:none;border-left: none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt; mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt''> '
               || '  <p class=MsoNormal style=''text-align:justify''><span lang=EN-US style=''font-size:10.0pt;mso-bidi-font-size:10.0pt;mso-ansi-language:EN-US''>FC_VRACH<o:p></o:p></span></p></td> '
               || --fd_pryb
                  '  <td width="15%" valign=top style=''width:15.8%;border-top:none;border-left: none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt''> '
               || '  <p class=MsoNormal style=''text-align:justify''><span lang=EN-US style=''font-size:10.0pt;mso-bidi-font-size:10.0pt;mso-ansi-language:EN-US''>FD_PRYB<o:p></o:p></span></p></td> '
               || --fd_vyb
                  '  <td width="17%" valign=top style=''width:17.04%;border-top:none;border-left:none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt''> '
               || '  <p class=MsoNormal style=''text-align:justify''><span lang=EN-US style=''font-size:10.0pt;mso-bidi-font-size:10.0pt;mso-ansi-language:EN-US''>FD_VYB<o:p></o:p></span></p></td> '
               || --fc_diag
                  '  <td width="22%" valign=top style=''width:22.58%;border-top:none;border-left: none;border-bottom:solid windowtext .5pt;border-right:solid windowtext .5pt;mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt''> '
               || '   <p class=MsoNormal><span lang=EN-US style=''font-size:10.0pt;mso-bidi-font-size: 10.0pt;mso-ansi-language:EN-US''>FC_DIAG<o:p></o:p></span></p> '
               || '  </tr>';
         sTmp := REPLACE (sTmp, 'FC_IB', i.fc_ib);
         sTmp := REPLACE (sTmp, 'FC_PAC', i.FC_FIO);
         sTmp := REPLACE (sTmp, 'FC_AGE', i.FC_AGE);
         sTmp := REPLACE (sTmp, 'FC_VRACH', i.FC_VRACH);
         sTmp := REPLACE (sTmp, 'FD_PRYB', i.FD_PRYB);
         sTmp := REPLACE (sTmp, 'FD_VYB', i.FD_VYB);
         sTmp := REPLACE (sTmp, 'FC_DIAG', i.FC_DIAG);
         DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
      END LOOP;

      sTmp :=
               '</table> '
            || '<br>'
            || '<br>'
            || '<table border=0 cellspacing=0 cellpadding=0 width="100%" style=''width:100.0%; border-collapse:collapse;mso-padding-alt:0cm 5.4pt 0cm 5.4pt''> '
            || ' <tr><td width="35%" valign=top style=''width:35.74%;padding:0cm 5.4pt 0cm 5.4pt''> '
            || '  <p>Заведующий ТО:</p></td> '
            || '  <td width="36%" valign=top style=''width:36.82%;padding:0cm 5.4pt 0cm 5.4pt''> '
            || '  <td width="27%" valign=top style=''width:27.44%;padding:0cm 5.4pt 0cm 5.4pt''> '
            || '  <p>FC_NACHMEDFIO</p></td> '
            || ' </tr></table> '
            || ' <br>'
            || '</div> '
            || '</body></html> ';
--      sTmp := REPLACE (sTmp, 'FC_NACHMEDFIO', get_nachmedfio);
      sTmp := REPLACE (sTmp, 'FC_NACHMEDFIO', InitCap(do_vrachfio(GET_ZAVTERAPEVT))); --mikrom
      DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
      RETURN nResID;
   END;


/*----------------------------------------------------------------------------------------------------------*\
|                       DoMedVyd
\*----------------------------------------------------------------------------------------------------------*/
   FUNCTION DoMedVyd (FD1 IN DATE, FD2 IN DATE, pFK_APOSTAVSHIKID NUMBER
/*ADVICE(748): Mode of parameter is not specified with IN parameter [521] */
                                                                        )
      RETURN NUMBER
   IS
      CURSOR cPeoples (pFD IN DATE)
      IS
         SELECT DISTINCT fk_pacid, get_pacfio (fk_pacid) AS fc_pac, TRUNC (tresmed.fd_data) AS fd_data,
                         get_ib (fk_pacid) AS fc_ib, do_vrachfio (get_pacvrach (fk_pacid)) AS fc_vrach,
                         DO_DIAGBYTYPE (FK_PACID, 2, 1) || ' ' || DO_DIAGBYTYPE (FK_PACID, 2, 0) AS fc_diag
         FROM            tresmed, tnazmed
         WHERE           tresmed.fk_nazmedid = tnazmed.fk_id
AND                      tresmed.fk_apostavshikid = pfk_apostavshikid
/*ADVICE(760): Cursor reference to a external variable (use a parameter) [209] */

AND                      TRUNC (tresmed.fd_data) = pFD
/*ADVICE(763): Elements in the SELECT list (either columns or expressions) are not qualified by a table/view name [403] */
                                                      ;

      CURSOR cMedicVyd (pFK_PACID IN NUMBER, pFD IN DATE)
      IS
         SELECT   med.pkgtmedic.getnamebyid (fk_medicid) AS fc_medic, SUM (fn_kol) AS fn_kol,
                  pkgtedizm.getnamebyid (pkgmedkart.GetUchEdIzm (fk_medicid)) AS fc_edizm,
                  do_vrachfio (tresmed.fk_sotrid) AS fc_ispolfio
         FROM     tresmedcont, tresmed, tnazmed
         WHERE    tresmedcont.fk_resmedid = tresmed.fk_id
AND               tresmed.fk_nazmedid = tnazmed.fk_id
AND               tresmed.fk_apostavshikid = pfk_apostavshikid
/*ADVICE(775): Cursor reference to a external variable (use a parameter) [209] */

AND               fk_pacid = pFK_PACID
AND               TRUNC (tresmed.fd_data) = pFD
         GROUP BY med.pkgtmedic.getnamebyid (fk_medicid),
                  pkgtedizm.getnamebyid (pkgmedkart.GetUchEdIzm (fk_medicid)),
                  do_vrachfio (tresmed.fk_sotrid);

      cl       CLOB;
      nResID   NUMBER;
      sTmp     VARCHAR2 (32767);
      nRow     PLS_INTEGER;
   BEGIN
      INSERT INTO tclobs
                  (fk_id, fc_clob)
      VALUES      (NULL, EMPTY_CLOB ())
      RETURNING   fk_id, fc_clob
      INTO        nResID, cl;

      sTmp :=
               '<html><head>'
            || '<title>Журнал выдачи медикаментов</title>'
            || '<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">'
            || '<style><!-- '
            || ' td            {height:14.0pt;border:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt} '
            || ' .sm_table     {border-collapse:collapse;border:none;mso-border-alt:solid windowtext .5pt;mso-padding-alt:0cm 5.4pt 0cm 5.4pt} '
            || ' pre           {margin:0cm;margin-bottom:0pt;font-size:10.0pt;font-family:"Courier New"; mso-fareast-font-family:"Courier New";}'
            || ' tr            {height:14.0pt;}'
            || ' @page Section1 {size:595.3pt 841.9pt;margin:1.0cm 1.0cm 2.0cm 2.0cm;mso-header-margin:0cm;mso-footer-margin:0cm;mso-paper-source:0;}'
            || ' --></style>'
            || '</head>'
            || '<body bgcolor="#FFFFFF" text="#000000">'
            || '<h2>Жрунал выдачи медикаментов за период с FD1 по FD2<br>FC_POSTAV</h2>'
            || '<table width="100%" border="1" cellpadding="0" class ="sm_table">'
            || '  <tr bgcolor="#CCCCCC"><td width="8%"> <div align="center">№ п.п.</div></td>'
            || '    <td width="9%"> <div align="center">Дата</div></td>'
            || '    <td width="5%"> <div align="center">№ И.Б.</div></td>'
            || '    <td width="9%"> <div align="center">Ф.И.О. пациента</div></td>'
            || '    <td width="10%"><div align="center">Ф.И.О. лечащего врача</div></td>'
            || '    <td width="10%"><div align="center">Диагноз лечащего врача</div></td>'
            || '    <td width="11%"><div align="center">Ф.И.О. выдавшего</div></td>'
            || '    <td width="15%"><div align="center">Наименование медикамента</div></td>'
            || '    <td width="9%"> <div align="center">Ед.Изм.</div></td>'
            || '    <td width="14%"><div align="center">Отпущенное кол-во</div></td></tr>';
      sTmp := REPLACE (sTmp, 'FD1', TO_CHAR (fd1, 'dd.mm.yyyy'));
      sTmp := REPLACE (sTmp, 'FD2', TO_CHAR (fd2, 'dd.mm.yyyy'));
      sTmp := REPLACE (sTmp, 'FC_POSTAV', PKGTAPOSTAVSHIK.GetNameByID (pFK_APOSTAVSHIKID));
      DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
      nRow := 1;

      FOR i IN 0 .. TRUNC (FD2) - TRUNC (FD1) LOOP
         FOR p IN cPeoples (FD1 + i) LOOP
            sTmp :=
                     '<tr><td width="8%">FN_ROW</td>                                                                                                             '
                  || '  <td width="9%">FD_DATA</td>'
                  || '  <td width="5%">FC_IB</td>'
                  || '  <td width="9%">FC_PAC</td>'
                  || '  <td width="10%">FC_VRACH</td>'
                  || '  <td width="10%">FC_DIAG</td>'
                  || '  <td width="11%">&nbsp;</td>'
                  || '  <td width="15%">&nbsp;</td>'
                  || '  <td width="9%">&nbsp;</td>'
                  || '  <td width="14%">&nbsp;</td></tr>';
            sTmp := REPLACE (sTmp, 'FN_ROW', nRow);
            sTmp := REPLACE (sTmp, 'FD_DATA', TO_CHAR (FD1 + i, 'dd.mm.yyyy'));
            sTmp := REPLACE (sTmp, 'FC_IB', p.fc_ib);
            sTmp := REPLACE (sTmp, 'FC_PAC', p.fc_pac);
            sTmp := REPLACE (sTmp, 'FC_VRACH', p.fc_vrach);
            sTmp := REPLACE (sTmp, 'FC_DIAG', p.fc_diag);
            DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
            inc (nRow);

            FOR m IN cMedicVyd (p.fk_pacid, FD1 + i) LOOP
               sTmp :=
                        '  <tr><td width="8%">&nbsp;</td>                                                                                                                       '
                     || '    <td width="9%">&nbsp;</td>'
                     || '    <td width="5%">&nbsp;</td>'
                     || '    <td width="9%">&nbsp;</td>'
                     || '    <td width="10%">&nbsp;</td>'
                     || '    <td width="10%">&nbsp;</td>'
                     || '    <td width="11%">FC_VYD</td>'
                     || '    <td width="15%">FC_MEDIC</td>'
                     || '    <td width="9%">FC_EDIZM</td>'
                     || '    <td width="14%">FN_KOL</td> </tr>';
               sTmp := REPLACE (sTmp, 'FC_VYD', m.fc_ispolfio);
               sTmp := REPLACE (sTmp, 'FC_MEDIC', m.fc_medic);
               sTmp := REPLACE (sTmp, 'FC_EDIZM', m.fc_edizm);
               sTmp := REPLACE (sTmp, 'FN_KOL', m.fn_kol);
               DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
            END LOOP;
/*ADVICE(865): Nested LOOPs should all be labeled [406] */

         END LOOP;
/*ADVICE(868): Nested LOOPs should all be labeled [406] */

      END LOOP;

      RETURN nResID;
   END;
END;
-- Package Body PKG_MEDGURNALS;
/

SHOW ERRORS;


