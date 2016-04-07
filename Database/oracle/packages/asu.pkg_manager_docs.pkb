DROP PACKAGE BODY ASU.PKG_MANAGER_DOCS
/

--
-- PKG_MANAGER_DOCS  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_MANAGER_DOCS" IS
   FUNCTION get_proc_paclist (
      pspec     IN   NUMBER,
      pdate     IN   DATE,
      precept   IN   NUMBER
   )
      RETURN NUMBER IS
      PRAGMA AUTONOMOUS_TRANSACTION;
      nclob_id           NUMBER        := 0.0;
      c                  CLOB;
      str                VARCHAR2 (4000)
                                   := '';
      strhead            VARCHAR2 (4000)
                                   := '';
      strtablehead       VARCHAR2 (4000)
                                   := '';
      strtablecontents   VARCHAR2 (10000)
                                   := '';
      strendpage         VARCHAR2 (4000)
                                   := '';
      sname              VARCHAR (100)
                                   := '';
      ssmid              VARCHAR2 (100)
                                   := '';
      nsmid              NUMBER        := 0.0;
      sdate              VARCHAR2 (100)
                                   := '';
      nproc_count        NUMBER        := 0.0;
      nproc_done         NUMBER        := 0.0;
      sfio               VARCHAR2 (100)
                                 := 0.0;
      snaz               VARCHAR2 (1000)
                                   := '';
      ssos               VARCHAR (100)
                                 := 0.0;
      ntoday             NUMBER        := 0.0;
      ncan_write         NUMBER        := 0.0;

      CURSOR cspec_smid IS
         SELECT /*+rule*/
                tnazraspred.fk_smid,
                tsmid.fc_name
           FROM tnazraspred, tsmid
          WHERE tnazraspred.fk_spec =
                                  pspec
            AND tsmid.fk_id =
                    tnazraspred.fk_smid;

      CURSOR csmid_pac_list (psmid NUMBER) IS
         SELECT /*+rule*/
                pkg_manager.get_nazproc_count_ib (
                   tnazlech.fk_id
                ),
                get_procdone (
                   tnazlech.fk_id
                ),
                   tkarta.fc_fam
                || ' '
                || tkarta.fc_im
                || ' '
                || tkarta.fc_otch,
                pkg_manager.get_proc_sos (
                   tnazlech.fk_id,
                   TRUNC (pdate)
                ),
                pkg_manager.get_proc_count_today (
                   tnazlech.fk_id,
                   TRUNC (pdate)
                ),
                   get_fullestpath (
                      tnazlech.fk_smid
                   )
                || ' '
                || pkg_naz.get_nazparam (
                      tnazlech.fk_id
                   )
           FROM tnazlech, tkarta
          WHERE tnazlech.fk_id IN
                   (SELECT          /*+rule*/
                           DISTINCT fk_nazid
                               FROM treslech
                              WHERE fk_smid =
                                       psmid
                                AND TRUNC (
                                       fd_ins
                                    ) =
                                       TRUNC (
                                          pdate
                                       ))
            AND tnazlech.fk_pacid =
                           tkarta.fk_id;

      CURSOR csmid_pac_listrec (
         psmid   NUMBER
      ) IS
         SELECT /*+rule*/
                pkg_manager.get_nazproc_count_ib (
                   tnazlech.fk_id
                ),
                get_procdone (
                   tnazlech.fk_id
                ),
                   tkarta.fc_fam
                || ' '
                || tkarta.fc_im
                || ' '
                || tkarta.fc_otch,
                pkg_manager.get_proc_sos (
                   tnazlech.fk_id,
                   TRUNC (pdate)
                ),
                pkg_manager.get_proc_count_today (
                   tnazlech.fk_id,
                   TRUNC (pdate)
                )
           FROM tnazlech, tkarta
          WHERE tnazlech.fk_id IN
                   (SELECT          /*+rule*/
                           DISTINCT fk_nazid
                               FROM treslech
                              WHERE fk_smid =
                                       psmid
                                AND TRUNC (
                                       fd_ins
                                    ) =
                                       TRUNC (
                                          pdate
                                       ))
            AND tnazlech.fk_pacid =
                           tkarta.fk_id;
   BEGIN
    SELECT TO_CHAR(pDATE, 'DD.MM.YYYY') INTO sDATE FROM DUAL;
    INSERT INTO TCLOBS (FK_ID, FC_CLOB) VALUES (-1, EMPTY_CLOB()) RETURNING FK_ID INTO nCLOB_ID;
    COMMIT;
    SELECT /*+rule*/ FC_CLOB INTO c FROM TCLOBS WHERE FK_ID = nCLOB_ID FOR UPDATE;
    SELECT FC_VALUE INTO sNAME FROM TSMINI WHERE FC_SECTION='MANAGER_DOC' AND FC_KEY='CLIENT_NAME';
    str:=PKG_MANAGER_DOCS.GET_DOC_HEADER(sNAME);
    IF str IS NOT NULL THEN
      DBMS_LOB.WRITE (c, LENGTH (str), DBMS_LOB.GETLENGTH(c)+1, str);
    END IF;
    str:=PKG_MANAGER_DOCS.GET_DOC_STYLES1;
    IF str IS NOT NULL THEN
      DBMS_LOB.WRITE (c, LENGTH (str), DBMS_LOB.GETLENGTH(c)+1, str);
    END IF;
    str:=PKG_MANAGER_DOCS.GET_TITLE_DOC(sNAME);
    IF str IS NOT NULL THEN
      DBMS_LOB.WRITE (c, LENGTH (str), DBMS_LOB.GETLENGTH(c)+1, str);
    END IF;
    OPEN cSPEC_SMID;
    LOOP
      FETCH cSPEC_SMID INTO nSMID, sSMID;
      EXIT WHEN cSPEC_SMID%NOTFOUND;
      strHead:='<div class=Section1><p class=MsoNormal align=center style='||''''||'text-align:center'||''''||'>'||sNAME||'</p>'||
           '<p class=MsoNormal align=center style='||''''||'text-align:center'||''''||'></p>'||
           '<p class=MsoNormal align=center style='||''''||'text-align:center'||''''||'>Список пациентов на '||sDATE||'</p>'||
           '<p class=MsoNormal align=center style='||''''||'text-align:center'||''''||'>для</p>'||
           '<p class=MsoNormal align=center style='||''''||'text-align:center'||''''||'>"'||sSMID||'"'||'</p>'||
           '<p class=MsoNormal align=center style='||''''||'text-align:center'||''''||'></p>'||
           '<p class=MsoNormal align=center style='||''''||'text-align:center'||''''||'></p>'||
           '<div align="center">&nbsp;';
      strTableHead:='<table class=MsoNormal><tr><td class=MsoNormal_Head_1><h1 align="center">Ф.И.О</h1></td><td class=MsoNormal_Head_2>'||
           '<p class=MsoNormal align="center"><b>Всего</b></p></td><td class=MsoNormal_Head_3> '||
           '<p class=MsoNormal align="center"><b>Вып.</b></p></td><td class=MsoNormal_Head_4> '||
           '<p class=MsoNormal align="center"><b>На сегодня</b></p></td><td class=MsoNormal_Head_5> '||
           '<p class=MsoNormal align="center"><b>Статус</b></p></td><td class=MsoNormal_Head_6>'||
           '<p class=MsoNormal align="center">&nbsp;</p></td></tr>';
if precept=0 then
      OPEN cSMID_PAC_LIST(nSMID);
      nCAN_WRITE:=1;
      LOOP
        FETCH cSMID_PAC_LIST INTO nPROC_COUNT, nPROC_DONE, sFIO, sSOS, nTODAY, sNAZ;
        EXIT WHEN cSMID_PAC_LIST%NOTFOUND;
        strTableContents:='<tr><td class=MsoNormal_Field_1><p class=MsoNormal>'||sFIO||' '||sNAZ||'</p></td>'||
             '<td class=MsoNormal_Field_2><p class=MsoNormal>'||nPROC_COUNT||'</p></td>'||
             '<td class=MsoNormal_Field_3><p class=MsoNormal>'||nPROC_DONE||'</p></td>'||
             '<td class=MsoNormal_Field_4><p class=MsoNormal>'||nTODAY||'</p></td>'||
             '<td class=MsoNormal_Field_5><p class=MsoNormal>'||sSOS||'</p></td>'||
             '<td class=MsoNormal_Field_6><p class=MsoNormal align="center"><span lang=EN-US style='||''''||
             'mso-ansi-language:EN-US'||''''||'><input type="CHECKBOX" name="CHECKBOX"><o:p></o:p></span></p></td></tr>';
        IF nCAN_WRITE=1 THEN
          DBMS_LOB.WRITE (c, LENGTH (strHead), DBMS_LOB.GETLENGTH(c)+1, strHead);
          DBMS_LOB.WRITE (c, LENGTH (strTableHead), DBMS_LOB.GETLENGTH(c)+1, strTableHead);
          nCAN_WRITE:=0;
        END IF;
        DBMS_LOB.WRITE (c, LENGTH (strTableContents), DBMS_LOB.GETLENGTH(c)+1, strTableContents);
      END LOOP;
      strEndPage:='</table></div><span style='||''''||'font-size:12.0pt;font-family:"Times New Roman";mso-fareast-font-family:'||
           '"Times New Roman";mso-ansi-language:RU;mso-fareast-language:RU;mso-bidi-language:AR-SA'||''''||'>'||
           '<br clear=all style='||''''||'page-break-before:always'||''''||'></span>';
      IF nCAN_WRITE=0 THEN
        DBMS_LOB.WRITE (c, LENGTH (strEndPage), DBMS_LOB.GETLENGTH(c)+1, strEndPage);
      END IF;
      CLOSE cSMID_PAC_LIST;
else
      OPEN cSMID_PAC_LISTrec(nSMID);
      nCAN_WRITE:=1;
      LOOP
        FETCH cSMID_PAC_LISTrec INTO nPROC_COUNT, nPROC_DONE, sFIO, sSOS, nTODAY;
        EXIT WHEN cSMID_PAC_LISTrec%NOTFOUND;
        strTableContents:='<tr><td class=MsoNormal_Field_1><p class=MsoNormal>'||sFIO||' '||sNAZ||'</p></td>'||
             '<td class=MsoNormal_Field_2><p class=MsoNormal>'||nPROC_COUNT||'</p></td>'||
             '<td class=MsoNormal_Field_3><p class=MsoNormal>'||nPROC_DONE||'</p></td>'||
             '<td class=MsoNormal_Field_4><p class=MsoNormal>'||nTODAY||'</p></td>'||
             '<td class=MsoNormal_Field_5><p class=MsoNormal>'||sSOS||'</p></td>'||
             '<td class=MsoNormal_Field_6><p class=MsoNormal align="center"><span lang=EN-US style='||''''||
             'mso-ansi-language:EN-US'||''''||'><input type="CHECKBOX" name="CHECKBOX"><o:p></o:p></span></p></td></tr>';
        IF nCAN_WRITE=1 THEN
          DBMS_LOB.WRITE (c, LENGTH (strHead), DBMS_LOB.GETLENGTH(c)+1, strHead);
          DBMS_LOB.WRITE (c, LENGTH (strTableHead), DBMS_LOB.GETLENGTH(c)+1, strTableHead);
          nCAN_WRITE:=0;
        END IF;
        DBMS_LOB.WRITE (c, LENGTH (strTableContents), DBMS_LOB.GETLENGTH(c)+1, strTableContents);
      END LOOP;
      strEndPage:='</table></div><span style='||''''||'font-size:12.0pt;font-family:"Times New Roman";mso-fareast-font-family:'||
           '"Times New Roman";mso-ansi-language:RU;mso-fareast-language:RU;mso-bidi-language:AR-SA'||''''||'>'||
           '<br clear=all style='||''''||'page-break-before:always'||''''||'></span>';
      IF nCAN_WRITE=0 THEN
        DBMS_LOB.WRITE (c, LENGTH (strEndPage), DBMS_LOB.GETLENGTH(c)+1, strEndPage);
      END IF;
      CLOSE cSMID_PAC_LISTrec;
end if;
    END LOOP;
    str:='</div></body></html>';
    DBMS_LOB.WRITE (c, LENGTH (str), DBMS_LOB.GETLENGTH(c)+1, str);
    CLOSE cSPEC_SMID;
    COMMIT;
    RETURN nCLOB_ID;
   END;

   FUNCTION get_doc_header (
      pname   IN   VARCHAR2
   )
      RETURN VARCHAR2 IS
      res   VARCHAR2 (4000);
   BEGIN
      res :=
            '<html > <head> <meta http-equiv=Content-Type content="text/html; charset=windows-1251">'
         || '<meta name=ProgId content=Word.Document> <meta name=Generator content="Microsoft Word 9">'
         || '<meta name=Originator content="Microsoft Word 9"><title>'
         || pname
         || '</title>';
      RETURN res;
   END;

   FUNCTION get_doc_styles1
      RETURN VARCHAR2 IS
      res   VARCHAR2 (10000);
   BEGIN
      res :=
            '<style> <!-- p.MsoNormal, li.MsoNormal   {mso-style-parent:""; margin:0cm; margin-bottom:.0001pt;'
         || 'mso-pagination:widow-orphan; font-size:12.0pt; font-family:"Times New Roman"; mso-fareast-font-family:"Times New Roman";}'
         || 'h1 {mso-style-next:Обычный; margin:0cm; margin-bottom:.0001pt; mso-pagination:widow-orphan; page-break-after:avoid;'
         || 'mso-outline-level:1; font-size:12.0pt; font-family:"Times New Roman"; mso-font-kerning:0pt;} @page Section1'
         || '{size:595.3pt 841.9pt; margin:35.95pt 42.5pt 2.0cm 36.0pt; mso-header-margin:35.4pt; mso-footer-margin:35.4pt;'
         || 'mso-paper-source:0;} div.Section1 {page:Section1;} div.MsoNormal { mso-style-parent:""; margin:0cm; margin-bottom:.0001pt;'
         || 'mso-pagination:widow-orphan; font-size:12pt; font-family:"Times New Roman"; '
         || 'mso-fareast-font-family:"Times New Roman"; ; font-style: normal}';
      res :=
            res
         || 'table.MsoNormal { margin-left:14.4pt; border-collapse:collapse; mso-table-layout-alt:fixed; border:none;'
         || 'mso-border-alt: solid windowtext .5pt; mso-padding-alt:0cm 5.4pt 0cm 5.4pt} td.MsoNormal_Head_1 { width:264.35pt;'
         || 'border:solid windowtext .5pt; background:silver; padding:0cm 5.4pt 0cm 5.4pt} td.MsoNormal_Head_2 { width:63.0pt;'
         || 'border:solid windowtext .5pt; border-left:none; mso-border-left-alt:solid windowtext .5pt; background:silver;'
         || 'padding:0cm 5.4pt 0cm 5.4pt} td.MsoNormal_Head_3 { width:54.0pt; border:solid windowtext .5pt; border-left:none;'
         || 'mso-border-left-alt:solid windowtext .5pt; background:silver; padding:0cm 5.4pt 0cm 5.4pt} td.MsoNormal_Head_4 {'
         || 'width:72.0pt; border:solid windowtext .5pt; border-left:none; mso-border-left-alt:solid windowtext .5pt;'
         || 'background:silver; padding:0cm 5.4pt 0cm 5.4pt} td.MsoNormal_Head_5 { width:51.85pt; border:solid windowtext .5pt;'
         || 'border-left:none; mso-border-left-alt:solid windowtext .5pt; background:silver; padding:0cm 5.4pt 0cm 5.4pt}'
         || 'td.MsoNormal_Head_6 { width:26.2pt; border:solid windowtext .5pt;'
         || 'border-left:none; mso-border-left-alt:solid windowtext .5pt; background:silver; padding:0cm 5.4pt 0cm 5.4pt}';
      res :=
            res
         || 'td.MsoNormal_Field_1 { width:264.35pt; border:solid windowtext .5pt; border-top:none; mso-border-top-alt:solid windowtext .5pt;'
         || 'padding:0cm 5.4pt 0cm 5.4pt} td.MsoNormal_Field_2 { width:63.0pt; border-top:none; border-left:none;'
         || 'border-bottom:solid windowtext .5pt; border-right:solid windowtext .5pt; mso-border-top-alt:solid windowtext .5pt;'
         || 'mso-border-left-alt:solid windowtext .5pt; padding:0cm 5.4pt 0cm 5.4pt} td.MsoNormal_Field_3 { width:54.0pt;'
         || 'border-top:none; border-left:none; border-bottom:solid windowtext .5pt; border-right:solid windowtext .5pt;'
         || 'mso-border-top-alt:solid windowtext .5pt; mso-border-left-alt:solid windowtext .5pt; padding:0cm 5.4pt 0cm 5.4pt}'
         || 'td.MsoNormal_Field_4 { width:72.0pt; border-top:none; border-left:none; border-bottom:solid windowtext .5pt;'
         || 'border-right:solid windowtext .5pt; mso-border-top-alt:solid windowtext .5pt; mso-border-left-alt:solid windowtext .5pt;'
         || 'padding:0cm 5.4pt 0cm 5.4pt} td.MsoNormal_Field_5 { width:51.85pt; border-top:none; border-left:none;'
         || 'border-bottom:solid windowtext .5pt; border-right:solid windowtext .5pt; mso-border-top-alt:solid windowtext .5pt;'
         || 'mso-border-left-alt:solid windowtext .5pt; padding:0cm 5.4pt 0cm 5.4pt}'
         || 'td.MsoNormal_Field_6 { width:51.85pt; border-top:none; border-left:none;'
         || 'border-bottom:solid windowtext .5pt; border-right:solid windowtext .5pt; mso-border-top-alt:solid windowtext .5pt;'
         || 'mso-border-left-alt:solid windowtext .5pt; padding:0cm 5.4pt 0cm 5.4pt} --> </style>';
      RETURN res;
   END;

   FUNCTION get_doc_styles2
      RETURN VARCHAR2 IS
      res   VARCHAR2 (10000);
   BEGIN
      res :=
            '<style> <!-- p.MsoNormal, li.MsoNormal   {mso-style-parent:""; margin:0cm; margin-bottom:.0001pt;'
         || 'mso-pagination:widow-orphan; font-size:8.0pt; font-family:"Times New Roman";  mso-fareast-font-family:"Times New Roman";}'
         || 'h1 {mso-style-next:Обычный; margin:0cm; margin-bottom:.0001pt; mso-pagination:widow-orphan; page-break-after:avoid;'
         || 'mso-outline-level:1; font-size:8.0pt; font-family:"Times New Roman"; mso-font-kerning:0pt;} @page Section1'
         || '{size:595.3pt 841.9pt; margin:35.95pt 42.5pt 2.0cm 36.0pt; mso-header-margin:35.4pt; mso-footer-margin:35.4pt;'
         || 'mso-paper-source:0;} div.Section1 {page:Section1;} div.MsoNormal { mso-style-parent:""; margin:0cm; margin-bottom:.0001pt;'
         || 'mso-pagination:widow-orphan; font-size:12pt; font-family:"Times New Roman"; '
         || 'mso-fareast-font-family:"Times New Roman"; ; font-style: normal}'
         || 'p.MsoNormal_1   {mso-style-parent:""; margin:0cm; margin-bottom:.0001pt;'
         || 'mso-pagination:widow-orphan; font-size:12.0pt; font-family:"Times New Roman"; mso-fareast-font-family:"Times New Roman"}';
      res :=
            res
         || 'table.MsoNormal { margin-left:14.4pt; border-collapse:collapse; mso-table-layout-alt:fixed; border:none;'
         || 'mso-border-alt: solid windowtext .5pt; mso-padding-alt:0cm 5.4pt 0cm 5.4pt} td.MsoNormal_Head_1 { width:45.0pt;'
         || 'border:solid windowtext .5pt; background:silver; padding:0cm 5.4pt 0cm 5.4pt} td.MsoNormal_Head_2 { width:30.0pt;'
         || 'border:solid windowtext .5pt; border-left:none; mso-border-left-alt:solid windowtext .5pt; background:silver;'
         || 'padding:0cm 5.4pt 0cm 5.4pt} td.MsoNormal_Head_3 { width:140.0pt; border:solid windowtext .5pt; border-left:none;'
         || 'mso-border-left-alt:solid windowtext .5pt; background:silver; padding:0cm 5.4pt 0cm 5.4pt} td.MsoNormal_Head_4 {'
         || 'width:80.0pt; border:solid windowtext .5pt; border-left:none; mso-border-left-alt:solid windowtext .5pt;'
         || 'background:silver; padding:0cm 5.4pt 0cm 5.4pt} td.MsoNormal_Head_5 { width:51.85pt; border:solid windowtext .5pt;'
         || 'border-left:none; mso-border-left-alt:solid windowtext .5pt; background:silver; padding:0cm 5.4pt 0cm 5.4pt}'
         || 'td.MsoNormal_Head_6 { width:26.2pt; border:solid windowtext .5pt;'
         || 'border-left:none; mso-border-left-alt:solid windowtext .5pt; background:silver; padding:0cm 5.4pt 0cm 5.4pt}';
      res :=
            res
         || 'td.MsoNormal_Head_1_EM { font-size:2.0pt;width:45.0pt;border:solid windowtext .5pt; background:silver; padding:0cm 0.4pt 0cm 0.4pt}'
         || 'td.MsoNormal_Head_2_EM { font-size:2.0pt; width:30.0pt;border:solid windowtext .5pt; border-left:none; mso-border-left-alt:solid windowtext .5pt; background:silver;'
         || 'padding:0cm 0.4pt 0cm 0.4pt} td.MsoNormal_Head_3_EM { font-size:2.0pt; width:140.0pt; border:solid windowtext .5pt; border-left:none;'
         || 'mso-border-left-alt:solid windowtext .5pt; background:silver; padding:0cm 0.4pt 0cm 0.4pt} td.MsoNormal_Head_4_EM {'
         || 'font-size:2.0pt;width:80.0pt; border:solid windowtext .5pt; border-left:none; mso-border-left-alt:solid windowtext .5pt;'
         || 'background:silver; padding:0cm 0.4pt 0cm 0.4pt} td.MsoNormal_Head_5_EM { font-size:2.0pt; width:51.85pt; border:solid windowtext .5pt;'
         || 'border-left:none; mso-border-left-alt:solid windowtext .5pt; background:silver; padding:0cm 0.4pt 0cm 0.4pt}';
      res :=
            res
         || 'td.MsoNormal_Field_1 { width:45.0pt; border:solid windowtext .5pt; border-top:none; mso-border-top-alt:solid windowtext .5pt;'
         || 'padding:0cm 5.4pt 0cm 5.4pt} td.MsoNormal_Field_2 { width:30.0pt; border-top:none; border-left:none;'
         || 'border-bottom:solid windowtext .5pt; border-right:solid windowtext .5pt; mso-border-top-alt:solid windowtext .5pt;'
         || 'mso-border-left-alt:solid windowtext .5pt; padding:0cm 5.4pt 0cm 5.4pt} td.MsoNormal_Field_3 { width:140.0pt;'
         || 'border-top:none; border-left:none; border-bottom:solid windowtext .5pt; border-right:solid windowtext .5pt;'
         || 'mso-border-top-alt:solid windowtext .5pt; mso-border-left-alt:solid windowtext .5pt; padding:0cm 5.4pt 0cm 5.4pt}'
         || 'td.MsoNormal_Field_4 { width:80.0pt; border-top:none; border-left:none; border-bottom:solid windowtext .5pt;'
         || 'border-right:solid windowtext .5pt; mso-border-top-alt:solid windowtext .5pt; mso-border-left-alt:solid windowtext .5pt;'
         || 'padding:0cm 5.4pt 0cm 5.4pt} td.MsoNormal_Field_5 { width:51.85pt; border-top:none; border-left:none;'
         || 'border-bottom:solid windowtext .5pt; border-right:solid windowtext .5pt; mso-border-top-alt:solid windowtext .5pt;'
         || 'mso-border-left-alt:solid windowtext .5pt; padding:0cm 5.4pt 0cm 5.4pt}'
         || 'td.MsoNormal_Field_6 { width:51.85pt; border-top:none; border-left:none;'
         || 'border-bottom:solid windowtext .5pt; border-right:solid windowtext .5pt; mso-border-top-alt:solid windowtext .5pt;'
         || 'mso-border-left-alt:solid windowtext .5pt; padding:0cm 5.4pt 0cm 5.4pt} --> </style>';
      RETURN res;
   END;

   FUNCTION get_title_doc (
      pname   IN   VARCHAR2
   )
      RETURN VARCHAR2 IS
      res   VARCHAR2 (4000);
   BEGIN
      res :=
            '</head> <body lang=RU style='
         || ''''
         || 'tab-interval:35.4pt'
         || ''''
         || '>';
      RETURN res;
   END;

   FUNCTION get_pac_proclist (
      ppac_id   IN   NUMBER,
      nmode     IN   NUMBER
   )
      RETURN NUMBER IS
      PRAGMA AUTONOMOUS_TRANSACTION;
      c             CLOB;
      spac_name     VARCHAR2 (200)   := '';
      sname         VARCHAR2 (100)   := '';
      str           VARCHAR2 (10000)
                                   := '';
      d             DATE;
      sdate         VARCHAR2 (50)    := '';
      slast_date    VARCHAR2 (50)    := '';
      stime         VARCHAR2 (50)    := '';
      snaz          VARCHAR2 (2000)
                                   := '';
      sispol        VARCHAR (100)    := '';
      nclob_id      NUMBER           := 0.0;
      spac_vrach    VARCHAR2 (100)   := '';
      spac_palata   VARCHAR2 (100)   := '';
      n             NUMBER           := 0;


   /*sPAC_TEL VARCHAR2(100):='';*/
--  CURSOR cPAC_NAME IS SELECT /*+RULE*/ FC_FAM||' '||FC_IM||' '||FC_OTCH FROM TKARTA WHERE FK_ID=pPAC_ID;
      CURSOR cpac_name IS
         SELECT /*+rule*/
                get_fio (ppac_id)
           FROM DUAL;

      CURSOR cpac_naz IS
         SELECT   /*+rule*/
                  ROWNUM, fd_run,TO_CHAR (fd_run,'DD.MM')|| ' '|| INITCAP (SUBSTR (TO_CHAR (fd_run,'fmDY'),1,2)),
                  TO_CHAR (fd_run,'HH24:MI'),
                  get_fullpath (fk_smid),
                  do_vrachfio (fk_ispolid)|| ' '|| get_kabname (fk_roomid)
             FROM tnazkons
            WHERE fk_pacid = ppac_id
              AND fk_nazsosid =
                              get_nevip
         UNION
         SELECT   /*+rule*/
                  ROWNUM, fd_run,TO_CHAR ( fd_run,'DD.MM')|| ' '|| INITCAP (SUBSTR (TO_CHAR (fd_run,'fmDY'),1,2)),
                  TO_CHAR (fd_run,'HH24:MI'),get_fullpath (fk_smid),
                     do_vrachfio (fk_ispolid)|| ' '|| get_kabname (fk_roomid)
             FROM tnazan
            WHERE fk_pacid = ppac_id
              AND fk_nazsosid =
                              get_nevip
         UNION
         SELECT   /*+rule*/
                  ROWNUM, fd_run,
                     TO_CHAR (fd_run,'DD.MM')|| ' '|| INITCAP (SUBSTR (TO_CHAR (fd_run,'fmDY'),1,2)),
                  TO_CHAR (fd_run,'HH24:MI'),
                  get_fullpath (fk_smid),
                     do_vrachfio (fk_ispolid)|| ' '|| get_kabname (fk_roomid)
             FROM tnazis
            WHERE fk_pacid = ppac_id
              AND fk_nazsosid =
                              get_nevip
         UNION
         SELECT   /*+rule*/
                  ROWNUM, fd_ins,TO_CHAR (fd_ins,'DD.MM')|| ' '|| INITCAP (SUBSTR (TO_CHAR (fd_ins,'fmDY'),1,2)),
                  TO_CHAR (fd_ins,'HH24:MI'),
                  get_fullpath (treslech.fk_smid)|| decode(nmode,0,': '||PKG_NAZ.GET_NAZPARAM(tn.fk_id)),
--PKG_NAZ.GET_NAZPARAM(FK_NAZID)*/,
                  do_vrachfio (treslech.fk_vrachid)||' - '|| get_kabname(PKG_MANAGER_DOCS.get_kab (treslech.fk_smid,treslech.fk_vrachid))
             FROM treslech,tnazlech tn
            WHERE tn.fk_pacid = ppac_id and tn.fk_id=treslech.fk_nazid
              AND fk_sos = get_nevip
              --and fl_patfirst<>0
         ORDER BY fd_run;

      CURSOR cpac_vrach IS
         SELECT do_vrachfio (
                   get_lechvrach (
                      ppac_id
                   )
                )
           FROM DUAL;

      CURSOR cpac_palata IS
         SELECT get_pacfcpalata (
                   ppac_id
                )
           /*, GET_PACTEL(pPAC_ID)*/
           FROM DUAL;
   BEGIN
      execute immediate 'alter session set nls_date_language=RUSSIAN';
      OPEN cpac_name;
      FETCH cpac_name INTO spac_name;
      CLOSE cpac_name;

      IF nclob_id = 0 THEN
         INSERT INTO tclobs
                     (fk_id,
                      fc_clob)
              VALUES (-1,
                      EMPTY_CLOB ())
           RETURNING fk_id
                INTO nclob_id;

         COMMIT;
      END IF;

      SELECT     /*+rule*/
                 fc_clob
            INTO c
            FROM tclobs
           WHERE fk_id = nclob_id
      FOR UPDATE;

      SELECT fc_value
        INTO sname
        FROM tsmini
       WHERE fc_section = 'MANAGER_DOC'
         AND fc_key = 'CLIENT_NAME';

      str :=
         pkg_manager_docs.get_doc_header (
            sname
         );
      DBMS_LOB.WRITE (
         c,
         LENGTH (str),
           DBMS_LOB.getlength (c)
         + 1,
         str
      );
      str :=
         pkg_manager_docs.get_doc_styles2;
      DBMS_LOB.WRITE (
         c,
         LENGTH (str),
           DBMS_LOB.getlength (c)
         + 1,
         str
      );
      str :=
         pkg_manager_docs.get_title_doc (
            sname
         );
      DBMS_LOB.WRITE (
         c,
         LENGTH (str),
           DBMS_LOB.getlength (c)
         + 1,
         str
      );
      OPEN cpac_palata;
      FETCH cpac_palata INTO spac_palata /*, sPAC_TEL */;
      CLOSE cpac_palata;
      str :=
            '<img src="asu\000.jpg" align=left hspace=12 v:shapes="_x0000_s1026">'
         || '<br><p class=MsoNormal_1 align=center style='
         || ''''
         || 'text-align:right'
         || ''''
         || '>Пациент : '
         || spac_name
         || '</p>'
         || '<p class=MsoNormal_1 align=center style='
         || ''''
         || 'text-align:right'
         || ''''
         || '>Комната : '
         || spac_palata
         || '</p>'
         ||
--           '<p class=MsoNormal_1 align=center style='||''''||'text-align:right'||''''||'>Телефон : '||sPAC_TEL||'</p>'||
            '<br><br><br>';
      DBMS_LOB.WRITE (
         c,
         LENGTH (str),
           DBMS_LOB.getlength (c)
         + 1,
         str
      );
      str :=
            '<hr><br><div class=Section1><p class=MsoNormal align=center style='
         || ''''
         || 'text-align:center'
         || ''''
         || '>'
         || 'График прохождения консультаций, обследований и процедур</p></div><br>';
      DBMS_LOB.WRITE (
         c,
         LENGTH (str),
           DBMS_LOB.getlength (c)
         + 1,
         str
      );
      str :=
            '<table class=MsoNormal><tr><td class=MsoNormal_Head_1><h1 align="center">Дата</h1></td><td class=MsoNormal_Head_2>'
         || '<p class=MsoNormal align="center"><b>Вр.</b></p></td><td class=MsoNormal_Head_3> '
         || '<p class=MsoNormal align="center"><b>Назначение</b></p></td><td class=MsoNormal_Head_4> '
         || '<p class=MsoNormal align="center"><b>Исполнитель</b></p></td><td class=MsoNormal_Head_5> '
         || '<p class=MsoNormal align="center"><b>Подпись</b></p></td>';
      DBMS_LOB.WRITE (
         c,
         LENGTH (str),
           DBMS_LOB.getlength (c)
         + 1,
         str
      );
      OPEN cpac_naz;

      LOOP
         FETCH cpac_naz INTO n,
                             d,
                             sdate,
                             stime,
                             snaz,
                             sispol;
         EXIT WHEN cpac_naz%NOTFOUND;

         IF      sdate <> slast_date
             AND n <> 1 THEN
            str :=
                  '<tr><td class=MsoNormal_HEAD_1_EM></td>'
               || '<td class=MsoNormal_HEAD_2_EM></td>'
               || '<td class=MsoNormal_HEAD_3_EM></td>'
               || '<td class=MsoNormal_HEAD_4_EM></td>'
               || '<td class=MsoNormal_HEAD_5_EM></td></tr>'
               || '<tr><td class=MsoNormal_Field_1><p class=MsoNormal>'
               || sdate
               || '</p></td>'
               || '<td class=MsoNormal_Field_2><p class=MsoNormal>'
               || stime
               || '</p></td>'
               || '<td class=MsoNormal_Field_3><p class=MsoNormal>'
               || snaz
               || '</p></td>'
               || '<td class=MsoNormal_Field_4><p class=MsoNormal>'
               || sispol
               || '</p></td>'
               || '<td class=MsoNormal_Field_5><p class=MsoNormal></p></td></tr>';
         ELSE
            str :=
                  '<tr><td class=MsoNormal_Field_1><p class=MsoNormal>'
               || sdate
               || '</p></td>'
               || '<td class=MsoNormal_Field_2><p class=MsoNormal>'
               || stime
               || '</p></td>'
               || '<td class=MsoNormal_Field_3><p class=MsoNormal>'
               || snaz
               || '</p></td>'
               || '<td class=MsoNormal_Field_4><p class=MsoNormal>'
               || sispol
               || '</p></td>'
               || '<td class=MsoNormal_Field_5><p class=MsoNormal></p></td></tr>';
         END IF;

         DBMS_LOB.WRITE (
            c,
            LENGTH (str),
              DBMS_LOB.getlength (c)
            + 1,
            str
         );
         slast_date := sdate;
      END LOOP;

      CLOSE cpac_naz;
      str :=
            '</table></div><span style='
         || ''''
         || 'font-size:12.0pt;font-family:"Times New Roman";mso-fareast-font-family:'
         || '"Times New Roman";mso-ansi-language:RU;mso-fareast-language:RU;mso-bidi-language:AR-SA'
         || ''''
         || '>'
         || '</span></div>';
      DBMS_LOB.WRITE (
         c,
         LENGTH (str),
           DBMS_LOB.getlength (c)
         + 1,
         str
      );
      OPEN cpac_vrach;
      FETCH cpac_vrach INTO spac_vrach;
      CLOSE cpac_vrach;
      str :=
            '<BR><HR><BR><p class=MsoNormal_1 align=center style='
         || ''''
         || 'text-align:right'
         || ''''
         || '>'
         || 'Лечащий врач ________________ '
         || spac_vrach
         || '</p></div></body></html>';
      DBMS_LOB.WRITE (
         c,
         LENGTH (str),
           DBMS_LOB.getlength (c)
         + 1,
         str
      );
      COMMIT;
      RETURN nclob_id;
   END;


  FUNCTION GET_KAB(pSMID IN NUMBER,pSOTRID IN NUMBER) RETURN NUMBER
    is                                                                                                   --(СПИСОК НАЗНАЧЕНИЙ ПАЦИЕНТА ПО ДНЯМ)
   CURSOR c1 is select min(tn.fk_kabinetid) from tnazvrach tn where tn.fk_smid=pSMID and tn.fk_sotrid=pSOTRID;
   n NUMBER;
   begin
     OPEN c1;
     FETCH c1 INTO n;
     close c1;
     RETURN n;
   end;




END; -- Package Body PKG_MANAGER_DOCS
/

SHOW ERRORS;


