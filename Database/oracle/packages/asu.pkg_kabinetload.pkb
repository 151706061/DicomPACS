DROP PACKAGE BODY ASU.PKG_KABINETLOAD
/

--
-- PKG_KABINETLOAD  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_KABINETLOAD" 
IS

--
-- Purpose: Ежедневный отчет о нагрузке кабинетов за сутки
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  ------------------------------------------
-- Sobjanin A.A. 14.12.2000     Create

/*-------------------------------------------------------------------------------------------*\
|               Prepare_NazTable
\*-------------------------------------------------------------------------------------------*/
   PROCEDURE Prepare_NazTable (
      pFD1   IN   DATE,
      pFD2   IN   DATE
   )
   IS
   BEGIN
      DELETE FROM tmp_nazages;
      INSERT INTO tmp_nazages
                  (fn_count, fk_roomid, fk_otdid, fd_ins, fn_age, fk_smid)
         SELECT   /*+ rule*/
                  COUNT (vres.fk_id) fn_count, vnaz.FK_ROOMID, tsotr.fk_otdid, TRUNC (fd_ins) AS fd_ins,
                  TRUNC (fn_age) AS fn_age, vnaz.fk_smid
         FROM     treslech vres,
                  tnazlech vnaz,
                  (SELECT     fk_id
                   FROM       tsmid
                   WHERE      tsmid.fl_showanal = 1
                   START WITH fk_id IN (get_procid, get_konsid, get_issledid)
                   CONNECT BY PRIOR fk_id = fk_owner) qSMID,
                  tmp_pacages,
                  tsotr
         WHERE    qSMID.fk_id = vnaz.fk_smid
AND               tsotr.fk_id = vnaz.fk_ispolid
AND               vnaz.fk_id = vres.fk_nazid
AND               vres.FD_INS BETWEEN TRUNC (pFD1) AND TRUNC (pFD2 + 1)
AND               vnaz.fk_pacid = tmp_pacages.fk_pacid
AND               vres.fk_sos = get_vipnaz
         GROUP BY vnaz.FK_ROOMID, tsotr.fk_otdid, TRUNC (fd_ins), TRUNC (fn_age), vnaz.fk_smid;
   END;


/*-------------------------------------------------------------------------------------------*\
|               Prepare_KonsIssTable
\*-------------------------------------------------------------------------------------------*/
   PROCEDURE Prepare_KonsIssTable (
      pFD1   IN   DATE,
      pFD2   IN   DATE
   )
   IS
   BEGIN
      DELETE FROM tmp_nazages;
      INSERT INTO tmp_nazages
                  (fn_count, fk_roomid, fk_otdid, fd_ins, fn_age, fk_smid)
         SELECT   /*+ rule*/
                  COUNT (vres.fk_id) fn_count, fk_ispolid, NULL, TRUNC (fd_ins) AS fd_ins, TRUNC (fn_age) AS fn_age,
                  vnaz.fk_smid
         FROM     vres,
                  vnaz,
                  (SELECT     fk_id
                   FROM       tsmid
                   START WITH fk_id IN (get_issledid, get_konsid)
                   CONNECT BY PRIOR fk_id = fk_owner) qSMID,
                  tmp_pacages
         WHERE    qSMID.fk_id = vnaz.fk_smid
AND               vnaz.fk_id = vres.fk_nazid
AND               vres.FD_INS BETWEEN TRUNC (pFD1) AND TRUNC (pFD2 + 1)
AND               vnaz.fk_pacid = tmp_pacages.fk_pacid
AND               vres.fk_sos = get_vipnaz
         GROUP BY vnaz.FK_ROOMID, fk_ispolid, TRUNC (fd_ins), TRUNC (fn_age), vnaz.fk_smid
/*ADVICE(73): Elements in the SELECT list (either columns or expressions) are not qualified by a table/view name [403] */
                                                                                          ;
   END;


/*-------------------------------------------------------------------------------------------*\
|               GetNagr
\*-------------------------------------------------------------------------------------------*/

   FUNCTION GetNagr (
      proomid   IN   NUMBER,
      psmid     IN   NUMBER
   )
      RETURN NUMBER
   IS
      CURSOR cNaz (
         lproomid   IN   NUMBER,
         lpsmid     IN   NUMBER
      )
      IS
         SELECT SUM (tnazvrach.fn_normproc)
         FROM   tnazvrach
         WHERE  tnazvrach.fk_kabinetid = lproomid
AND             tnazvrach.fk_smid = lpsmid;

      CURSOR cKab (
         lproomid   IN   NUMBER
      )
      IS
         SELECT SUM (tnazvrach.fn_normproc)
         FROM   tnazvrach
         WHERE  tnazvrach.fk_kabinetid = lproomid;

      nRes   NUMBER;
   BEGIN
      IF    psmid IS NOT NULL
         OR psmid != 0 THEN
         OPEN cNaz (proomid, psmid);
         FETCH cNaz INTO nRes;
         CLOSE cNaz;
      ELSE
         OPEN cKab (proomid);
         FETCH cKab INTO nRes;
         CLOSE cKab;
      END IF;
      RETURN NVL (nRes, 0);
   END GetNagr;


/*-------------------------------------------------------------------------------------------*\
|               IsExistsKabInOtd
\*-------------------------------------------------------------------------------------------*/
   FUNCTION IsExistsKabInOtd (
      pFK_OTDID   IN   NUMBER,
      pFK_OWNER   IN   NUMBER
   )
      RETURN BOOLEAN
   IS
      b   BOOLEAN := FALSE;
   BEGIN
      FOR i IN cKabInOtd (pFK_OTDID, pFK_OWNER) LOOP
         b := TRUE;
      END LOOP;
      RETURN b;
   END;


/*-------------------------------------------------------------------------------------------*\
|               CountNumNazInKab
\*-------------------------------------------------------------------------------------------*/
   FUNCTION CountNumNazInKab (
      pFK_KABINETID   IN   NUMBER,
      pFK_OTDID       IN   NUMBER,
      pFK_OWNER       IN   NUMBER
   )
      RETURN INTEGER
/*ADVICE(149): Consider using PLS_INTEGER instead of INTEGER and BINARY_INTEGER if on Oracle 7.3 or above [302] */

   IS
      b   INTEGER
/*ADVICE(153): Consider using PLS_INTEGER instead of INTEGER and BINARY_INTEGER if on Oracle 7.3 or above [302] */
                  := 0;
   BEGIN
      FOR i IN cNazInKab (pFK_KABINETID, pFK_OTDID, pFK_OWNER) LOOP
         b := b + 1;
      END LOOP;
      RETURN b;
   END;


/*-------------------------------------------------------------------------------------------*\
|               IsExistsKonsInVrach
\*-------------------------------------------------------------------------------------------*/
   FUNCTION CountKonsInVrach (
      pFK_VRACHID   IN   NUMBER,
      pFK_OWNER     IN   NUMBER
   )
      RETURN NUMBER
   IS
      b   NUMBER := 0;
   BEGIN
      FOR i IN cKonsInVrach (pFK_VRACHID, pFK_OWNER) LOOP
         b := b + 1;
      END LOOP;
      RETURN b;
   END;


/*-------------------------------------------------------------------------------------------*\
|               CountNazOtd
\*-------------------------------------------------------------------------------------------*/
   FUNCTION CountNazOtd (
      pFD             IN   DATE,
      pFK_OTDID       IN   NUMBER,
      pFK_OWNER       IN   NUMBER,
      pFN_StartVozr   IN   NUMBER,
      pFN_EndVozr     IN   NUMBER
   )
      RETURN NUMBER
   IS
      CURSOR cCountNazOtd (
         pFD             IN   DATE,
         pFK_OTDID       IN   NUMBER,
         pFK_OWNER       IN   NUMBER,
         pFN_StartVozr   IN   NUMBER,
         pFN_EndVozr     IN   NUMBER
      )
      IS
         SELECT /*+ rule*/
                SUM (tmp_nazages.fn_count)
         FROM   tmp_nazages, tsmid
         WHERE  tsmid.fk_id = tmp_nazages.fk_smid
AND             get_rootid (tsmid.fk_id) = pFK_OWNER
AND             fk_otdid = pFK_OTDID
AND             FD_INS BETWEEN TRUNC (pFD) AND TRUNC (ROUND (pFD) + 1)
AND             fn_age BETWEEN pfn_startvozr AND pfn_endvozr;

      nRes   NUMBER;
   BEGIN
      OPEN cCountNazOtd (pFD, pFK_OTDID, pFK_OWNER, pfn_startvozr, pfn_endvozr);
      FETCH cCountNazOtd INTO nRes;
      CLOSE cCountNazOtd;
      RETURN NVL (nRes, 0);
   END;


/*-------------------------------------------------------------------------------------------*\
|               CountNazKab
\*-------------------------------------------------------------------------------------------*/
   FUNCTION CountNazKab (
      pFD             IN   DATE,
      pFK_OTDID       IN   NUMBER,
      pFK_KABINETID   IN   NUMBER,
      pFK_OWNER       IN   NUMBER,
      pFN_StartVozr   IN   NUMBER,
      pFN_EndVozr     IN   NUMBER
   )
      RETURN NUMBER
   IS
      CURSOR cCountNazKab (
         pFD             IN   DATE,
         pFK_OTDID       IN   NUMBER,
         pFK_KABINETID   IN   NUMBER,
         pFK_OWNER       IN   NUMBER,
         pFN_StartVozr   IN   NUMBER,
         pFN_EndVozr     IN   NUMBER
      )
      IS
         SELECT /*+ rule*/
                SUM (tmp_nazages.fn_count)
         FROM   tmp_nazages, tsmid
         WHERE  tsmid.fk_id = tmp_nazages.fk_smid
AND             get_rootid (tsmid.fk_id) = pFK_OWNER
AND             FD_INS BETWEEN TRUNC (pFD) AND TRUNC (ROUND (pFD) + 1)
AND             fk_otdid = pFK_OTDID
AND             fk_roomid = pFK_KABINETID
AND             fn_age BETWEEN pfn_startvozr AND pfn_endvozr;

      nRes   NUMBER;
   BEGIN
      OPEN cCountNazKab (pFD, pFK_OTDID, pFK_KABINETID, pFK_OWNER, pfn_startvozr, pfn_endvozr);
      FETCH cCountNazKab INTO nRes;
      CLOSE cCountNazKab;
      RETURN NVL (nRes, 0);
   END;


/*-------------------------------------------------------------------------------------------*\
|               CountNazInKab
\*-------------------------------------------------------------------------------------------*/
   FUNCTION CountNazInKab (
      pFD             IN   DATE,
      pFK_KABINETID   IN   NUMBER,
      pFK_OTDID       IN   NUMBER,
      pFK_SMID        IN   NUMBER,
      pFN_StartVozr   IN   NUMBER,
      pFN_EndVozr     IN   NUMBER
   )
      RETURN NUMBER
   IS
      CURSOR cCountNazInKab (
         pFD             IN   DATE,
         pFK_KABINETID   IN   NUMBER,
         pFK_OTDID       IN   NUMBER,
         pFK_SMID        IN   NUMBER,
         pFN_StartVozr   IN   NUMBER,
         pFN_EndVozr     IN   NUMBER
      )
      IS
         SELECT /*+ rule*/
                SUM (tmp_nazages.fn_count)
         FROM   tmp_nazages
         WHERE  FD_INS BETWEEN TRUNC (pFD) AND TRUNC (ROUND (pFD) + 1)
AND             fk_otdid = pFK_OTDID
AND             fk_roomid = pFK_KABINETID
AND             fk_smid = pFK_SMID
AND             fn_age BETWEEN pfn_startvozr AND pfn_endvozr;

      nRes   NUMBER;
   BEGIN
      OPEN cCountNazInKab (pFD, pFK_KABINETID, pFK_OTDID, pFK_SMID, pfn_startvozr, pfn_endvozr);
      FETCH cCountNazInKab INTO nRes;
      CLOSE cCountNazInKab;
      RETURN NVL (nRes, 0);
   END;


/*-------------------------------------------------------------------------------------------*\
|               CountLabPeolpes
\*-------------------------------------------------------------------------------------------*/
   FUNCTION CountLabPeolpes (
      pFD             IN   DATE,
      pFN_StartVozr   IN   NUMBER,
      pFN_EndVozr     IN   NUMBER
   )
      RETURN NUMBER
   IS
      CURSOR cCountLabPeolpes (
         pFD             IN   DATE,
         pFN_StartVozr   IN   NUMBER,
         pFN_EndVozr     IN   NUMBER
      )
      IS
         SELECT COUNT (DISTINCT tnazan.fk_pacid)
         FROM   tnazan, tmp_pacages
         WHERE  fk_nazsosid = get_vipnaz
AND             fd_run = pFD
--         AND get_pacageonvyb (fk_pacid) BETWEEN pfn_startvozr AND pfn_endvozr
AND             tnazan.fk_pacid = tmp_pacages.fk_pacid
AND             fn_age BETWEEN pfn_startvozr AND pfn_endvozr;

      nRes   NUMBER;
   BEGIN
      OPEN cCountLabPeolpes (pFD, pFN_StartVozr, pFN_EndVozr);
      FETCH cCountLabPeolpes INTO nRes;
      CLOSE cCountLabPeolpes;
      RETURN NVL (nRes, 0);
   END;


/*-------------------------------------------------------------------------------------------*\
|               CountLabBiohIssled
\*-------------------------------------------------------------------------------------------*/
   FUNCTION CountLabBiohIssled (
      pFD             IN   DATE,
      pFN_StartVozr   IN   NUMBER,
      pFN_EndVozr     IN   NUMBER
   )
      RETURN NUMBER
   IS
      CURSOR cCountLabBiohIssled (
         pFD             IN   DATE,
         pFN_StartVozr   IN   NUMBER,
         pFN_EndVozr     IN   NUMBER
      )
      IS
         SELECT COUNT (texpan.fk_id)
         FROM   texpan, tnazan, tmp_pacages
         WHERE  fk_nazsosid = get_vipnaz
AND             fd_run = pFD
AND             texpan.fk_nazid = tnazan.fk_id
AND             get_synbyid (get_lab_razd (texpan.fk_smid)) = 'RAZ_BIOHIM'
--         AND get_pacageonvyb (tnazan.fk_pacid) BETWEEN pfn_startvozr AND pfn_endvozr
AND             tnazan.fk_pacid = tmp_pacages.fk_pacid
AND             fn_age BETWEEN pfn_startvozr AND pfn_endvozr;

      nRes   NUMBER;
   BEGIN
      OPEN cCountLabBiohIssled (pFD, pFN_StartVozr, pFN_EndVozr);
      FETCH cCountLabBiohIssled INTO nRes;
      CLOSE cCountLabBiohIssled;
      RETURN NVL (nRes, 0);
   END;


/*-------------------------------------------------------------------------------------------*\
|               CountLabKlinIssled
\*-------------------------------------------------------------------------------------------*/
   FUNCTION CountLabKlinIssled (
      pFD             IN   DATE,
      pFN_StartVozr   IN   NUMBER,
      pFN_EndVozr     IN   NUMBER
   )
      RETURN NUMBER
   IS
      CURSOR CountLabKlinIssled (
         pFD             IN   DATE,
         pFN_StartVozr   IN   NUMBER,
         pFN_EndVozr     IN   NUMBER
      )
      IS
         SELECT COUNT (tnazan.fk_id)
         FROM   tnazan, tmp_pacages
         WHERE  fk_nazsosid = get_vipnaz
AND             fd_run = pFD
AND             get_synbyid (get_lab_razd (tnazan.fk_smid)) = 'RAZ_BIOHIM'
--        AND get_pacageonvyb (tnazan.fk_pacid) BETWEEN pfn_startvozr AND pfn_endvozr
AND             tnazan.fk_pacid = tmp_pacages.fk_pacid
AND             fn_age BETWEEN pfn_startvozr AND pfn_endvozr;

      nRes   NUMBER;
   BEGIN
      OPEN CountLabKlinIssled (pFD, pFN_StartVozr, pFN_EndVozr);
      FETCH CountLabKlinIssled INTO nRes;
      CLOSE CountLabKlinIssled;
      RETURN NVL (nRes, 0);
   END;


/*-------------------------------------------------------------------------------------------*\
|               CountNagrVrach
\*-------------------------------------------------------------------------------------------*/
   FUNCTION CountNagrVrach (
      pfk_vrachid   IN   NUMBER,
      pFD_DATA      IN   DATE,
      pFN_AGE1      IN   NUMBER,
      pFN_AGE2      IN   NUMBER
   )
      RETURN NUMBER
   IS
      CURSOR c (
         pfk_vrachid   IN   NUMBER,
         pFD_DATA      IN   DATE,
         pFN_AGE1      IN   NUMBER,
         pFN_AGE2      IN   NUMBER
      )
      IS
         SELECT COUNT (tkarta.fk_id)
         FROM   tkarta, tperesel, tvrach, tsotr
         WHERE  tkarta.fk_id = tperesel.fk_pacid
AND             tvrach.fk_pacid = tkarta.fk_id
AND             tvrach.fl_vid = 'M'
AND             (pFD_DATA BETWEEN tperesel.fd_data1 AND tperesel.fd_data2)
AND             tvrach.fk_vrachid = pfk_vrachid
AND             tsotr.fp_vrach = 1
AND             tsotr.fk_id = tvrach.fk_vrachid
AND             MONTHS_BETWEEN ((pFD_DATA), tkarta.fd_rojd) / 12 BETWEEN pFN_AGE1 AND pFN_AGE2;

      res   NUMBER;
   BEGIN
      OPEN c (pfk_vrachid, pFD_DATA, pFN_AGE1, pFN_AGE2);
      FETCH c INTO res;
      CLOSE c;
      RETURN NVL (Res, 0);
   END CountNagrVrach;


/*-------------------------------------------------------------------------------------------*\
|               CountNagrOtd
\*-------------------------------------------------------------------------------------------*/
   FUNCTION CountNagrOtd (
      pfk_otdid   IN   NUMBER,
      pFD_DATA    IN   DATE,
      pFN_AGE1    IN   NUMBER,
      pFN_AGE2    IN   NUMBER
   )
      RETURN NUMBER
   IS
      CURSOR c (
         pfk_otdid   IN   NUMBER,
         pFD_DATA    IN   DATE,
         pFN_AGE1    IN   NUMBER,
         pFN_AGE2    IN   NUMBER
      )
      IS
         SELECT COUNT (tkarta.fk_id)
         FROM   tkarta, tperesel, tvrach, tsotr
         WHERE  tkarta.fk_id = tperesel.fk_pacid
AND             tvrach.fk_pacid = tkarta.fk_id
AND             tvrach.fl_vid = 'M'
AND             (pFD_DATA BETWEEN tperesel.fd_data1 AND tperesel.fd_data2)
AND             tvrach.fk_vrachid = tsotr.fk_id
AND             tsotr.fk_otdid = pfk_otdid
AND             tsotr.fp_vrach = 1
AND             MONTHS_BETWEEN ((pFD_DATA), tkarta.fd_rojd) / 12 BETWEEN pFN_AGE1 AND pFN_AGE2;

      res   NUMBER;
   BEGIN
      OPEN c (pfk_otdid, pFD_DATA, pFN_AGE1, pFN_AGE2);
      FETCH c INTO res;
      CLOSE c;
      RETURN NVL (Res, 0);
   END;


/*-------------------------------------------------------------------------------------------*\
|               AddSum
\*-------------------------------------------------------------------------------------------*/
   FUNCTION addSum (
      nSum     IN   NUMBER,
      bItogo   IN   BOOLEAN,
      nNorm    IN   NUMBER := 0
   )
      RETURN VARCHAR2
   IS
      sTmp       VARCHAR2 (32767);
      nPercent   VARCHAR2 (200);
   BEGIN
      IF bItogo THEN
         sTmp := ' <td height="26" width="15%">';
         sTmp := sTmp || get_decode (nSum, 0, '&nbsp;', nSum) || '</td>'; --итого
      END IF;
      IF    nNorm = 0
         OR nNorm IS NULL THEN
         /*норма*/
         sTmp := sTmp || '<td height="26" width="15%"> &nbsp;</td>                                     '
                 || /*%нагрузки*/ '<td height="26" width="15%">&nbsp;</td></tr>';
      ELSE
         nPercent := TO_CHAR (nSum / nNorm, 'FM99990D09');
         sTmp := sTmp || '<td height="26" width="15%">' || nNorm || '</td>                                     '
                 || '<td height="26" width="15%">' || nPercent || '</td></tr>';
      END IF;
      RETURN sTmp;
   END;


/*====================== M A I N ============================================================*\
/*-------------------------------------------------------------------------------------------*\
|               CountNazOtd
\*-------------------------------------------------------------------------------------------*/
   FUNCTION get_loadkab (
      pFD1   IN   DATE,
      pFD2   IN   DATE
   )
      RETURN NUMBER
   IS
      nTmp      NUMBER;
      nSum      NUMBER;
      sTmp      VARCHAR2 (32767);
      cl        CLOB;
      -- возраст для детей
      nChilds   NUMBER; --
   BEGIN
      nTMp := PROGRESS_BAR.Init;
      nTmp := 0;
      PROGRESS_BAR.setminvalue (0);
      PROGRESS_BAR.setmaxvalue (11);
      PROGRESS_BAR.SetStrOut ('Расчет сроков выбытия и возрастов пациентов');
      PROGRESS_BAR.StepIt (0);
      mkb10.prepare_agetable;
      PROGRESS_BAR.StepIt (1);
      PROGRESS_BAR.SetStrOut ('Проц.');
      PROGRESS_BAR.StepIT (0);
      Prepare_NazTable (pFD1, pFD2);
      nChilds := PKG_SMINI.READSTRING ('CONFIG', 'N_CHILDBEFORE', 18);
      DBMS_LOB.createtemporary (cl, TRUE, 2);
      sTmp :=
            '<html>' || '<head>' || '<title>Отчет по нагрузке кабинетов</title>'
            || '<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">' || '<style><!-- '
            || ' td            {height:14.0pt;border:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt} '
            || ' .sm_table     {border-collapse:collapse;border:none;mso-border-alt:solid windowtext .5pt;mso-padding-alt:0cm 5.4pt 0cm 5.4pt} '
            || ' pre           {margin:0cm;margin-bottom:0pt;font-size:10.0pt;font-family:"Courier New"; mso-fareast-font-family:"Courier New";}'
            || ' tr            {height:14.0pt;}'
            || '@page Section1 {size:595.3pt 841.9pt;margin:1.0cm 1.0cm 2.0cm 2.0cm;mso-header-margin:0cm;mso-footer-margin:0cm;mso-paper-source:0;} '
            || '--></style></head>' || '<body bgcolor="#FFFFFF">'
            || '<h2>Отчет о загрузке кабинетов за период с FC_DATE1 по FC_DATE2.</h2>'
            || '<table class="sm_table" align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">'
            || ' <thead> <tr> ' || '    <td rowspan="2" height="26" width="55%">Наименование кабинета </td>'
            || '    <td colspan="FN_COLSPAN" height="26" width="15%">Факт. нагрузка</td>';
      IF pFD2 - pFD1 <> 0 THEN
         sTmp := sTmp || '    <td rowspan="2" height="26" width="15%">Итого</td>';
      END IF;
      sTmp := sTmp || '    <td rowspan="2" height="26" width="15%">Норма</td>'
              || '    <td rowspan="2" height="26" width="15%">% нагрузки</td>' || '</tr><tr>';
      FOR pFD IN 0 .. pFD2 - pFD1 LOOP
         sTmp := sTmp || '<td height="26">' || TO_CHAR (pFD1 + pFD, 'dd.mm') || '</td>';
      END LOOP;
      sTmp := sTmp || '</tr></thead>';
      sTmp := REPLACE (sTmp, 'FC_DATE1', TO_CHAR (pFD1, 'dd.mm.yyyy'));
      sTmp := REPLACE (sTmp, 'FC_DATE2', TO_CHAR (pFD2, 'dd.mm.yyyy'));
      sTmp := REPLACE (sTmp, 'FN_COLSPAN', pFD2 - pFD1 + 1);
      DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
      -- по процедурам
      sTmp := '  <tr><td height="26" width="55%"><H3>Процедуры </h3></td>';
      FOR pFD IN 0 .. pFD2 - pFD1 LOOP
         sTmp := sTmp || '<td height="26" width="15%">&nbsp;</td>';
      END LOOP;
      sTmp := sTmp || '<td height="26" width="15%">&nbsp;</td>' || '<td height="26" width="15%">&nbsp;</td>';
      IF pFD2 - pFD1 <> 0 THEN
         sTmp := sTmp || '<td height="26" width="15%">&nbsp;</td>';
      END IF;
      sTmp := sTMP || '</tr><thead>';
      DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
      FOR o IN cOtd LOOP
         IF IsExistsKabInOtd (o.fk_id, get_procid) THEN
            -- всего
            PROGRESS_BAR.SetStrOut ('Проц. (всего):'|| o.fc_name);
            PROGRESS_BAR.StepIT (0);
            sTmp := '<tr><td height="26" width="55%"><h3>' || o.fc_name || '</h3></td>';
            nSum := 0;
            FOR pFD IN 0 .. pFD2 - pFD1 LOOP
               nTmp := CountNazOtd (pfd1 + pFD, o.fk_id, get_procid, 0, 2000);
               sTmp := sTmp || '    <td height="26" width="15%">' || get_decode (nTmp, 0, '&nbsp;', nTmp) || '</td>';
               --факт нагрузка
               nSum := nSum + nTmp;
            END LOOP pFD;
/*ADVICE(599): Nested LOOPs should all be labeled [406] */

            sTmp := sTmp || AddSum (nSum, pFD2 - pFD1 <> 0);
            -- дети
            PROGRESS_BAR.SetStrOut ('Проц. (дети):'|| o.fc_name);
            PROGRESS_BAR.StepIT (0);
            sTmp := sTmp || '<tr><td height="26" width="55%"><pre>' || LPAD (' ', LENGTH (o.fc_name)) || '(дети)</pre></td>';
            nSum := 0;
            FOR pFD IN 0 .. pFD2 - pFD1 LOOP
               nTmp := CountNazOtd (pfd1 + pFD, o.fk_id, get_procid, 0, nChilds);
               sTmp := sTmp || '    <td height="26" width="15%">' || get_decode (nTmp, 0, '&nbsp;', nTmp) || '</td>';
               --факт нагрузка
               nSum := nSum + nTmp;
            END LOOP;
/*ADVICE(613): Nested LOOPs should all be labeled [406] */

            sTmp := sTmp || AddSum (nSum, pFD2 - pFD1 <> 0);
            -- взрослые
            PROGRESS_BAR.SetStrOut ('Проц.(взрослые):'|| o.fc_name);
            PROGRESS_BAR.StepIT (0);
            sTmp := sTmp || '<tr><td height="26" width="55%"><pre>' || LPAD (' ', LENGTH (o.fc_name)) || '(взр.)</pre></td>';
            nSum := 0;
            FOR pFD IN 0 .. pFD2 - pFD1 LOOP
               nTmp := CountNazOtd (pfd1 + pFD, o.fk_id, get_procid, nChilds, 2000);
               sTmp := sTmp || '    <td height="26" width="15%">' || get_decode (nTmp, 0, '&nbsp;', nTmp) || '</td>';
               --факт нагрузка
               nSum := nSum + nTmp;
            END LOOP;
/*ADVICE(627): Nested LOOPs should all be labeled [406] */

            sTmp := sTmp || AddSum (nSum, pFD2 - pFD1 <> 0);
            DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
            FOR k IN cKabInOtd (o.fk_id, get_procid) LOOP
               IF CountNumNazInKab (k.fk_kabinetid, o.fk_id, get_procid) > 1 THEN
                  --всего
                  sTmp :=
                     '<tr><td height="26" width="55%"><pre><p align = "left"><b>   ' || k.fc_name || '</b></p></pre></td>';
                  PROGRESS_BAR.SetStrOut ('Проц.:'|| o.fc_name || '...' || k.fc_name);
                  PROGRESS_BAR.StepIT (0);
                  nSum := 0;
                  FOR pFD IN 0 .. pFD2 - pFD1 LOOP
                     nTmp := CountNazKab (pfd1 + pFD, o.fk_id, k.fk_kabinetid, get_procid, 0, 2000);
                     sTmp := sTmp || '    <td height="26" width="15%">' || get_decode (nTmp, 0, '&nbsp;', nTmp) || '</td>';
                     --факт нагрузка
                     nSum := nSum + nTmp;
                  END LOOP;
/*ADVICE(645): Nested LOOPs should all be labeled [406] */

                  sTmp := sTmp || AddSum (nSum, pFD2 - pFD1 <> 0, GetNagr(k.fk_kabinetid, null));
                  --дети
                  PROGRESS_BAR.SetStrOut ('Проц.(дети):'|| o.fc_name || '...' || k.fc_name);
                  PROGRESS_BAR.StepIT (0);
                  sTmp := sTmp || '<tr><td height="26" width="55%"><pre>   ' || LPAD (' ', LENGTH (k.fc_name))
                          || '(дети)</pre></td>';
                  nSum := 0;
                  FOR pFD IN 0 .. pFD2 - pFD1 LOOP
                     nTmp := CountNazKab (pfd1 + pFD, o.fk_id, k.fk_kabinetid, get_procid, 0, nChilds);
                     sTmp := sTmp || '    <td height="26" width="15%">' || get_decode (nTmp, 0, '&nbsp;', nTmp) || '</td>';
                     --факт нагрузка
                     nSum := nSum + nTmp;
                  END LOOP;
/*ADVICE(660): Nested LOOPs should all be labeled [406] */

                  sTmp := sTmp || AddSum (nSum, pFD2 - pFD1 <> 0);
                  -- взрослые
                  PROGRESS_BAR.SetStrOut ('Проц.(взр.):'|| o.fc_name || '...' || k.fc_name);
                  PROGRESS_BAR.StepIT (0);
                  sTmp := sTmp || '<tr><td height="26" width="55%"><pre>   ' || LPAD (' ', LENGTH (k.fc_name))
                          || '(взр.)</pre></td>';
                  nSum := 0;
                  FOR pFD IN 0 .. pFD2 - pFD1 LOOP
                     nTmp := CountNazKab (pfd1 + pFD, o.fk_id, k.fk_kabinetid, get_procid, nChilds, 2000);
                     sTmp := sTmp || '    <td height="26" width="15%">' || get_decode (nTmp, 0, '&nbsp;', nTmp) || '</td>';
                     --факт нагрузка
                     nSum := nSum + nTmp;
                  END LOOP;
/*ADVICE(675): Nested LOOPs should all be labeled [406] */

                  sTmp := sTmp || AddSum (nSum, pFD2 - pFD1 <> 0);
                  DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
                  FOR n IN cNazInKab (k.fk_kabinetid, o.fk_id, get_procid) LOOP
                     -- всего
                     sTmp := '<tr><td height="26" width="55%"><pre>      ' || n.fc_name || '</pre></td>';
                     PROGRESS_BAR.SetStrOut (SUBSTR ('Проц.:'|| o.fc_name || '...' || k.fc_name || ' ' || n.fc_name,
                                                                                                                   100));
                     PROGRESS_BAR.StepIT (0);
                     nSum := 0;
                     FOR pFD IN 0 .. pFD2 - pFD1 LOOP
                        nTmp := CountNazInKab (pFD1 + pfd, k.fk_kabinetid, o.fk_id, n.fk_smid, 0, 2000);
                        sTmp := sTmp || '    <td height="26" width="15%">' || get_decode (nTmp, 0, '&nbsp;', nTmp) || '</td>';
                        --факт нагрузка
                        nSum := nSum + nTmp;
                     END LOOP;
/*ADVICE(692): Nested LOOPs should all be labeled [406] */

                     sTmp := sTmp || AddSum (nSum, pFD2 - pFD1 <> 0, GetNagr(k.fk_kabinetid, n.fk_smid));
                     -- дети
                     PROGRESS_BAR.SetStrOut (
                        SUBSTR ('Проц.(дет.):'|| o.fc_name || '...' || k.fc_name || ' ' || n.fc_name, 100)
                     );
                     PROGRESS_BAR.StepIT (0);
                     sTmp := sTmp || '<tr><td height="26" width="55%"><pre>      ' || LPAD (' ', LENGTH (n.fc_name))
                             || '(дети)</pre></td>';
                     nSum := 0;
                     FOR pFD IN 0 .. pFD2 - pFD1 LOOP
                        nTmp := CountNazInKab (pFD1 + pfd, k.fk_kabinetid, o.fk_id, n.fk_smid, 0, nChilds);
                        sTmp := sTmp || '    <td height="26" width="15%">' || get_decode (nTmp, 0, '&nbsp;', nTmp) || '</td>';
                        --факт нагрузка
                        nSum := nSum + nTmp;
                     END LOOP;
/*ADVICE(709): Nested LOOPs should all be labeled [406] */

                     sTmp := sTmp || AddSum (nSum, pFD2 - pFD1 <> 0);
                     -- взрослые
                     PROGRESS_BAR.SetStrOut (
                        SUBSTR ('Проц.(взр.):'|| o.fc_name || '...' || k.fc_name || ' ' || n.fc_name, 100)
                     );
                     PROGRESS_BAR.StepIT (0);
                     sTmp := sTmp || '<tr><td height="26" width="55%"><pre>      ' || LPAD (' ', LENGTH (n.fc_name))
                             || '(взр.)</pre></td>';
                     nSum := 0;
                     FOR pFD IN 0 .. pFD2 - pFD1 LOOP
                        nTmp := CountNazInKab (pfd1 + pFD, k.fk_kabinetid, o.fk_id, n.fk_smid, nChilds, 2000);
                        sTmp := sTmp || '    <td height="26" width="15%">' || get_decode (nTmp, 0, '&nbsp;', nTmp) || '</td>';
                        --факт нагрузка
                        nSum := nSum + nTmp;
                     END LOOP;
/*ADVICE(726): Nested LOOPs should all be labeled [406] */

                     sTmp := sTmp || AddSum (nSum, pFD2 - pFD1 <> 0);
                     DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
                  END LOOP cNazInKab;
/*ADVICE(731): Nested LOOPs should all be labeled [406] */

               ELSE --
                  FOR n IN cNazInKab (k.fk_kabinetid, o.fk_id, get_procid) LOOP
                     PROGRESS_BAR.SetStrOut (SUBSTR ('Проц.:'|| o.fc_name || '...' || k.fc_name, 100));
                     PROGRESS_BAR.StepIT (0);
                     sTmp :=
                         '<tr><td height="26" width="55%"><pre><b>   ' || k.fc_name || ' </b>' || n.fc_name || '</pre></td>';
                     nSum := 0;
                     FOR pFD IN 0 .. pFD2 - pFD1 LOOP
                        nTmp := CountNazKab (pfd1 + pFD, o.fk_id, k.fk_kabinetid, get_procid, 0, 2000);
                        sTmp := sTmp || '    <td height="26" width="15%">' || get_decode (nTmp, 0, '&nbsp;', nTmp) || '</td>';
                        --факт нагрузка
                        nSum := nSum + nTmp;
                     END LOOP;
/*ADVICE(746): Nested LOOPs should all be labeled [406] */

                     sTmp := sTmp || AddSum (nSum, pFD2 - pFD1 <> 0);
                     --дети
                     PROGRESS_BAR.SetStrOut (SUBSTR ('Проц.(дет.):'|| o.fc_name || '...' || k.fc_name, 100));
                     PROGRESS_BAR.StepIT (0);
                     sTmp := sTmp || '<tr><td height="26" width="55%"><pre>   ' || LPAD (' ', LENGTH (k.fc_name))
                             || '(дети)</pre></td>';
                     nSum := 0;
                     FOR pFD IN 0 .. pFD2 - pFD1 LOOP
                        nTmp := CountNazKab (pfd1 + pFD, o.fk_id, k.fk_kabinetid, get_procid, 0, nChilds);
                        sTmp := sTmp || '    <td height="26" width="15%">' || get_decode (nTmp, 0, '&nbsp;', nTmp) || '</td>';
                        --факт нагрузка
                        nSum := nSum + nTmp;
                     END LOOP;
/*ADVICE(761): Nested LOOPs should all be labeled [406] */

                     sTmp := sTmp || AddSum (nSum, pFD2 - pFD1 <> 0);
                     -- взрослые
                     PROGRESS_BAR.SetStrOut (SUBSTR ('Проц.(взр.):'|| o.fc_name || '...' || k.fc_name, 100));
                     PROGRESS_BAR.StepIT (0);
                     sTmp := sTmp || '<tr><td height="26" width="55%"><pre>   ' || LPAD (' ', LENGTH (k.fc_name))
                             || '(взр.)</pre></td>';
                     nSum := 0;
                     FOR pFD IN 0 .. pFD2 - pFD1 LOOP
                        nTmp := CountNazKab (pfd1 + pFD, o.fk_id, k.fk_kabinetid, get_procid, nChilds, 2000);
                        sTmp := sTmp || '    <td height="26" width="15%">' || get_decode (nTmp, 0, '&nbsp;', nTmp) || '</td>';
                        --факт нагрузка
                        nSum := nSum + nTmp;
                     END LOOP;
/*ADVICE(776): Nested LOOPs should all be labeled [406] */

                     sTmp := sTmp || AddSum (nSum, pFD2 - pFD1 <> 0);
                     DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
                  END LOOP cNazInKab;
/*ADVICE(781): Nested LOOPs should all be labeled [406] */

               END IF;
            END LOOP;
/*ADVICE(785): Nested LOOPs should all be labeled [406] */

         END IF;
      END LOOP;
      PROGRESS_BAR.SetStrOut ('Обработка лаборатории');
      PROGRESS_BAR.StepIT (3);
      /* по лаборатории шапка */
      sTmp := '  <tr><td height="26" width="55%"><H3>Лаборатория (чел.)</h3></td>';
      nSum := 0;
      FOR pFD IN 0 .. pFD2 - pFD1 LOOP
         nTmp := CountLabPeolpes (pFD1 + pFD, 0, 2000);
         sTmp := sTmp || '    <td height="26" width="15%"><pre>' || get_decode (nTmp, 0, '&nbsp;', nTmp) || '</pre></td>';
         nSum := nSum + nTmp;
      END LOOP;
      sTmp := sTmp || AddSum (nSum, pFD2 - pFD1 <> 0);
      DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
      -- по лаборатории всего детей
      sTmp := '  <tr><td height="26" width="55%"><pre>    (детей)</pre></td>';
      nSum := 0;
      FOR pFD IN 0 .. pFD2 - pFD1 LOOP
         nTmp := CountLabPeolpes (pFD1 + pFD, 0, nChilds);
         sTmp := sTmp || '    <td height="26" width="15%"><pre>' || get_decode (nTmp, 0, '&nbsp;', nTmp) || '</pre></td>';
         nSum := nSum + nTmp;
      END LOOP;
      sTmp := sTmp || AddSum (nSum, pFD2 - pFD1 <> 0);
      DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
      -- по лаборатории всего взрослых
      sTmp := '  <tr><td height="26" width="55%"><pre>    (взр.)</pre></td>';
      nSum := 0;
      FOR pFD IN 0 .. pFD2 - pFD1 LOOP
         nTmp := CountLabPeolpes (pFD1 + pFD, nChilds, 2000);
         sTmp := sTmp || '    <td height="26" width="15%"><pre>' || get_decode (nTmp, 0, '&nbsp;', nTmp) || '</pre></td>';
         nSum := nSum + nTmp;
      END LOOP;
      sTmp := sTmp || AddSum (nSum, pFD2 - pFD1 <> 0);
      DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
      --по лаборатории биохим. исследований
      sTmp := '  <tr><td height="26" width="55%"><H5>Биохимические анализы (проц.)</h5></td>';
      nSum := 0;
      FOR pFD IN 0 .. pFD2 - pFD1 LOOP
         nTmp := CountLabBiohIssled (pFD1 + pFD, 0, 2000);
         sTmp := sTmp || '    <td height="26" width="15%"><pre>' || get_decode (nTmp, 0, '&nbsp;', nTmp) || '</pre></td>';
         nSum := nSum + nTmp;
      END LOOP;
      sTmp := sTmp || AddSum (nSum, pFD2 - pFD1 <> 0);
      DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
      -- биохим. исследований детей
      sTmp := '  <tr><td height="26" width="55%"><pre>    (детей)</pre></td>';
      nSum := 0;
      FOR pFD IN 0 .. pFD2 - pFD1 LOOP
         nTmp := CountLabBiohIssled (pFD1 + pFD, 0, nChilds);
         sTmp := sTmp || '    <td height="26" width="15%"><pre>' || get_decode (nTmp, 0, '&nbsp;', nTmp) || '</pre></td>';
         nSum := nSum + nTmp;
      END LOOP;
      sTmp := sTmp || AddSum (nSum, pFD2 - pFD1 <> 0);
      DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
      -- биохим. исследований взрослых
      sTmp := '  <tr><td height="26" width="55%"><pre>    (взр.)</pre></td>';
      nSum := 0;
      FOR pFD IN 0 .. pFD2 - pFD1 LOOP
         nTmp := CountLabBiohIssled (pFD1 + pFD, nChilds, 2000);
         sTmp := sTmp || '    <td height="26" width="15%"><pre>' || get_decode (nTmp, 0, '&nbsp;', nTmp) || '</pre></td>';
         nSum := nSum + nTmp;
      END LOOP;
      sTmp := sTmp || AddSum (nSum, pFD2 - pFD1 <> 0);
      DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
      --по лаборатории клин. исследований
      sTmp := '  <tr><td height="26" width="55%"><H5>Клинические анализы (проц.)</h4></td>';
      nSum := 0;
      FOR pFD IN 0 .. pFD2 - pFD1 LOOP
         nTmp := CountLabKlinIssled (pFD1 + pFD, 0, 2000);
         sTmp := sTmp || '    <td height="26" width="15%"><pre>' || get_decode (nTmp, 0, '&nbsp;', nTmp) || '</pre></td>';
         nSum := nSum + nTmp;
      END LOOP;
      sTmp := sTmp || AddSum (nSum, pFD2 - pFD1 <> 0);
      DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
      -- клин. исследований детей
      sTmp := '  <tr><td height="26" width="55%"><pre>    (детей)</pre></td>';
      nSum := 0;
      FOR pFD IN 0 .. pFD2 - pFD1 LOOP
         nTmp := CountLabKlinIssled (pFD1 + pFD, 0, nChilds);
         sTmp := sTmp || '    <td height="26" width="15%"><pre>' || get_decode (nTmp, 0, '&nbsp;', nTmp) || '</pre></td>';
         nSum := nSum + nTmp;
      END LOOP;
      sTmp := sTmp || AddSum (nSum, pFD2 - pFD1 <> 0);
      DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
      -- клин. исследований взрослых
      sTmp := '  <tr><td height="26" width="55%"><pre>    (взр.)</pre></td>';
      nSum := 0;
      FOR pFD IN 0 .. pFD2 - pFD1 LOOP
         nTmp := CountLabKlinIssled (pFD1 + pFD, nChilds, 2000);
         sTmp := sTmp || '    <td height="26" width="15%"><pre>' || get_decode (nTmp, 0, '&nbsp;', nTmp) || '</pre></td>';
         nSum := nSum + nTmp;
      END LOOP;
      sTmp := sTmp || AddSum (nSum, pFD2 - pFD1 <> 0);
      DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
      /*конец обработки лаборатории*/
      PROGRESS_BAR.SetStrOut ('Обработка нагрузки на врачей');
      PROGRESS_BAR.StepIT (1);
      Prepare_KonsIssTable (pFD1, pFD2);
      /*Начало обработки консультаций и нагрузок на врачей*/
      FOR o IN cOtd LOOP
         IF MKB10.CountLechInOtd (o.fk_id) > 0 THEN
            --всего по отделению
            sTmp := '  <tr> ' || '    <td height="26" width="55%"><H3>FC_OTD - Прием:</td>';
            sTmp := REPLACE (sTmp, 'FC_OTD', o.fc_name);
            nSum := 0;
            FOR pFD IN 0 .. pFD2 - pFD1 LOOP
               sTmp := sTmp || '<td height="26" width="15%">FN_PRIEMALL</td>';
               nTmp := countNagrOtd (o.fk_id, pFD1 + pFD, 0, 2000);
               sTmp := REPLACE (sTmp, 'FN_PRIEMALL', Get_decode (nTmp, 0, '&nbsp;', nTmp));
               nSum := nSum + nTmp;
            END LOOP;
/*ADVICE(898): Nested LOOPs should all be labeled [406] */

            sTmp := sTmp || AddSum (nSum, pFD2 - pFD1 <> 0);
            DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
            --дети по отделению
            sTmp := '<tr><td height="26" width="55%"><pre>    (детей)</td>';
            nSum := 0;
            FOR pFD IN 0 .. pFD2 - pFD1 LOOP
               sTmp := sTmp || '<td height="26" width="15%">FN_PRIEMALL</td>';
               nTmp := countNagrOtd (o.fk_id, pFD1 + pFD, 0, nChilds);
               sTmp := REPLACE (sTmp, 'FN_PRIEMALL', Get_decode (nTmp, 0, '&nbsp;', nTmp));
               nSum := nSum + nTmp;
            END LOOP;
/*ADVICE(911): Nested LOOPs should all be labeled [406] */

            sTmp := sTmp || AddSum (nSum, pFD2 - pFD1 <> 0);
            DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
            --взрослые по отделению
            sTmp := '<tr><td height="26" width="55%"><pre>    (взр.)</td>';
            nSum := 0;
            FOR pFD IN 0 .. pFD2 - pFD1 LOOP
               sTmp := sTmp || '<td height="26" width="15%">FN_PRIEMALL</td>';
               nTmp := countNagrOtd (o.fk_id, pFD1 + pFD, nChilds, 2000);
               sTmp := REPLACE (sTmp, 'FN_PRIEMALL', Get_decode (nTmp, 0, '&nbsp;', nTmp));
               nSum := nSum + nTmp;
            END LOOP;
/*ADVICE(924): Nested LOOPs should all be labeled [406] */

            sTmp := sTmp || AddSum (nSum, pFD2 - pFD1 <> 0);
            DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
            -- по врачам
            FOR v IN MKB10.cLechInOtd (o.fk_id) LOOP
               --всего у врача
               PROGRESS_BAR.SetStrOut ('Врач:'|| v.FC_FIO);
               sTmp := '<td height="26" width="55%"><b>FC_FIO</b> Прием:</td>';
               sTmp := REPLACE (sTmp, 'FC_FIO', v.fc_fio);
               nSum := 0;
               FOR pFD IN 0 .. pFD2 - pFD1 LOOP
                  sTmp := sTmp || '<td height="26" width="15%">FN_PRIEMALL</td>';
                  nTmp := CountNagrVrach (v.fk_id, pFD1 + pFD, 0, 2000);
                  sTmp := REPLACE (sTmp, 'FN_PRIEMALL', Get_decode (nTmp, 0, '&nbsp;', nTmp));
                  nSum := nSum + nTmp;
               END LOOP;
/*ADVICE(941): Nested LOOPs should all be labeled [406] */

               sTmp := sTmp || AddSum (nSum, pFD2 - pFD1 <> 0);
               DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
               --детей у врача
               sTmp := '<td height="26" width="55%"><pre>    (детей)</td>';
               nSum := 0;
               FOR pFD IN 0 .. pFD2 - pFD1 LOOP
                  sTmp := sTmp || '<td height="26" width="15%">FN_PRIEMALL</td>';
                  nTmp := CountNagrVrach (v.fk_id, pFD1 + pFD, 0, nChilds);
                  sTmp := REPLACE (sTmp, 'FN_PRIEMALL', Get_decode (nTmp, 0, '&nbsp;', nTmp));
                  nSum := nSum + nTmp;
               END LOOP;
/*ADVICE(954): Nested LOOPs should all be labeled [406] */

               sTmp := sTmp || AddSum (nSum, pFD2 - pFD1 <> 0);
               DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
               --взрослых у врача
               sTmp := '<td height="26" width="55%"><pre>    (взр.)</td>';
               nSum := 0;
               FOR pFD IN 0 .. pFD2 - pFD1 LOOP
                  sTmp := sTmp || '<td height="26" width="15%">FN_PRIEMALL</td>';
                  nTmp := CountNagrVrach (v.fk_id, pFD1 + pFD, nChilds, 2000);
                  sTmp := REPLACE (sTmp, 'FN_PRIEMALL', Get_decode (nTmp, 0, '&nbsp;', nTmp));
                  nSum := nSum + nTmp;
               END LOOP;
/*ADVICE(967): Nested LOOPs should all be labeled [406] */

               sTmp := sTmp || AddSum (nSum, pFD2 - pFD1 <> 0);
               DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);

/*консультации*/
               IF CountKonsInVrach (v.fk_id, get_konsid) > 1 THEN
                  --консультаций всего
                  sTmp := '  <tr><td height="26" width="55%">Консультации:</td>';
                  nSum := 0;
                  FOR pFD IN 0 .. pFD2 - pFD1 LOOP
                     sTmp := sTmp || '<td height="26" width="15%">FN_PRIEMALL</td>';
                     nTmp := get_VrachNagrKons (v.fk_id, pFD1 + pFD, 0, 2000, get_konsid);
                     sTmp := REPLACE (sTmp, 'FN_PRIEMALL', Get_decode (nTmp, 0, '&nbsp;', nTmp));
                     nSum := nSum + nTmp;
                  END LOOP;
/*ADVICE(983): Nested LOOPs should all be labeled [406] */

                  sTmp := sTmp || AddSum (nSum, pFD2 - pFD1 <> 0);
                  DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
                  --консультаций дети всего
                  sTmp := '<tr><td height="26" width="55%"><pre>    (детей)</td>';
                  nSum := 0;
                  FOR pFD IN 0 .. pFD2 - pFD1 LOOP
                     sTmp := sTmp || '<td height="26" width="15%">FN_PRIEMALL</td>';
                     nTmp := get_VrachNagrKons (v.fk_id, pFD1 + pFD, 0, nChilds, get_konsid);
                     sTmp := REPLACE (sTmp, 'FN_PRIEMALL', Get_decode (nTmp, 0, '&nbsp;', nTmp));
                     nSum := nSum + nTmp;
                  END LOOP;
/*ADVICE(996): Nested LOOPs should all be labeled [406] */

                  sTmp := sTmp || AddSum (nSum, pFD2 - pFD1 <> 0);
                  DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
                  --консультаций взрослые всего
                  sTmp := '<tr><td height="26" width="55%"><pre>    (взр.)</td>';
                  nSum := 0;
                  FOR pFD IN 0 .. pFD2 - pFD1 LOOP
                     sTmp := sTmp || '<td height="26" width="15%">FN_PRIEMALL</td>';
                     nTmp := get_VrachNagrKons (v.fk_id, pFD1 + pFD, nChilds, 2000, get_konsid);
                     sTmp := REPLACE (sTmp, 'FN_PRIEMALL', Get_decode (nTmp, 0, '&nbsp;', nTmp));
                     nSum := nSum + nTmp;
                  END LOOP;
/*ADVICE(1009): Nested LOOPs should all be labeled [406] */

                  sTmp := sTmp || AddSum (nSum, pFD2 - pFD1 <> 0);
                  DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
               END IF;
               FOR k IN cKonsInVrach (v.fk_id, get_konsid) LOOP
                  --консультаций у врача
                  sTmp := '  <tr><td height="26" width="55%">Консультация FC_NAZ:</td>';
                  sTmp := REPLACE (sTmp, 'FC_NAZ', k.fc_naz);
                  nSum := 0;
                  FOR pFD IN 0 .. pFD2 - pFD1 LOOP
                     sTmp := sTmp || '<td height="26" width="15%">FN_PRIEMALL</td>';
                     nTmp := get_VrachNagrKons (v.fk_id, pFD1 + pFD, 0, 2000, k.fk_smid);
                     sTmp := REPLACE (sTmp, 'FN_PRIEMALL', Get_decode (nTmp, 0, '&nbsp;', nTmp));
                     nSum := nSum + nTmp;
                  END LOOP;
/*ADVICE(1025): Nested LOOPs should all be labeled [406] */

                  sTmp := sTmp || AddSum (nSum, pFD2 - pFD1 <> 0);
                  DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
                  --консультаций дети  у врача
                  sTmp := '<tr><td height="26" width="55%"><pre>    (детей)</td>';
                  nSum := 0;
                  FOR pFD IN 0 .. pFD2 - pFD1 LOOP
                     sTmp := sTmp || '<td height="26" width="15%">FN_PRIEMALL</td>';
                     nTmp := get_VrachNagrKons (v.fk_id, pFD1 + pFD, 0, nChilds, k.fk_smid);
                     sTmp := REPLACE (sTmp, 'FN_PRIEMALL', Get_decode (nTmp, 0, '&nbsp;', nTmp));
                     nSum := nSum + nTmp;
                  END LOOP;
/*ADVICE(1038): Nested LOOPs should all be labeled [406] */

                  sTmp := sTmp || AddSum (nSum, pFD2 - pFD1 <> 0);
                  DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
                  --консультаций взрослые  у врача
                  sTmp := '<tr><td height="26" width="55%"><pre>    (взр.)</td>';
                  nSum := 0;
                  FOR pFD IN 0 .. pFD2 - pFD1 LOOP
                     sTmp := sTmp || '<td height="26" width="15%">FN_PRIEMALL</td>';
                     nTmp := get_VrachNagrKons (v.fk_id, pFD1 + pFD, nChilds, 2000, k.fk_smid);
                     sTmp := REPLACE (sTmp, 'FN_PRIEMALL', Get_decode (nTmp, 0, '&nbsp;', nTmp));
                     nSum := nSum + nTmp;
                  END LOOP;
/*ADVICE(1051): Nested LOOPs should all be labeled [406] */

                  sTmp := sTmp || AddSum (nSum, pFD2 - pFD1 <> 0);
                  DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
               END LOOP k;
/*ADVICE(1056): Nested LOOPs should all be labeled [406] */


/*исследования*/
               IF CountKonsInVrach (v.fk_id, get_issledid) > 1 THEN
                  --исследования всего
                  sTmp := '  <tr><td height="26" width="55%">Исследования:</td>';
                  nSum := 0;
                  FOR pFD IN 0 .. pFD2 - pFD1 LOOP
                     sTmp := sTmp || '<td height="26" width="15%">FN_PRIEMALL</td>';
                     nTmp := get_VrachNagrKons (v.fk_id, pFD1 + pFD, 0, 2000, get_issledid);
                     sTmp := REPLACE (sTmp, 'FN_PRIEMALL', Get_decode (nTmp, 0, '&nbsp;', nTmp));
                     nSum := nSum + nTmp;
                  END LOOP;
/*ADVICE(1070): Nested LOOPs should all be labeled [406] */

                  sTmp := sTmp || AddSum (nSum, pFD2 - pFD1 <> 0);
                  DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
                  --исследования дети всего
                  sTmp := '<tr><td height="26" width="55%"><pre>    (детей)</td>';
                  nSum := 0;
                  FOR pFD IN 0 .. pFD2 - pFD1 LOOP
                     sTmp := sTmp || '<td height="26" width="15%">FN_PRIEMALL</td>';
                     nTmp := get_VrachNagrKons (v.fk_id, pFD1 + pFD, 0, nChilds, get_issledid);
                     sTmp := REPLACE (sTmp, 'FN_PRIEMALL', Get_decode (nTmp, 0, '&nbsp;', nTmp));
                     nSum := nSum + nTmp;
                  END LOOP;
/*ADVICE(1083): Nested LOOPs should all be labeled [406] */

                  sTmp := sTmp || AddSum (nSum, pFD2 - pFD1 <> 0);
                  DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
                  --исследования взрослые всего
                  sTmp := '<tr><td height="26" width="55%"><pre>    (взр.)</td>';
                  nSum := 0;
                  FOR pFD IN 0 .. pFD2 - pFD1 LOOP
                     sTmp := sTmp || '<td height="26" width="15%">FN_PRIEMALL</td>';
                     nTmp := get_VrachNagrKons (v.fk_id, pFD1 + pFD, nChilds, 2000, get_issledid);
                     sTmp := REPLACE (sTmp, 'FN_PRIEMALL', Get_decode (nTmp, 0, '&nbsp;', nTmp));
                     nSum := nSum + nTmp;
                  END LOOP;
/*ADVICE(1096): Nested LOOPs should all be labeled [406] */

                  sTmp := sTmp || AddSum (nSum, pFD2 - pFD1 <> 0);
                  DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
               END IF;
               FOR k IN cKonsInVrach (v.fk_id, get_issledid) LOOP
                  --исследования у врача
                  sTmp := '  <tr><td height="26" width="55%">Ислледование: FC_NAZ:</td>';
                  sTmp := REPLACE (sTmp, 'FC_NAZ', k.fc_naz);
                  nSum := 0;
                  FOR pFD IN 0 .. pFD2 - pFD1 LOOP
                     sTmp := sTmp || '<td height="26" width="15%">FN_PRIEMALL</td>';
                     nTmp := get_VrachNagrKons (v.fk_id, pFD1 + pFD, 0, 2000, k.fk_smid);
                     sTmp := REPLACE (sTmp, 'FN_PRIEMALL', Get_decode (nTmp, 0, '&nbsp;', nTmp));
                     nSum := nSum + nTmp;
                  END LOOP;
/*ADVICE(1112): Nested LOOPs should all be labeled [406] */

                  sTmp := sTmp || AddSum (nSum, pFD2 - pFD1 <> 0);
                  DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
                  --исследования дети  у врача
                  sTmp := '<tr><td height="26" width="55%"><pre>    (детей)</td>';
                  nSum := 0;
                  FOR pFD IN 0 .. pFD2 - pFD1 LOOP
                     sTmp := sTmp || '<td height="26" width="15%">FN_PRIEMALL</td>';
                     nTmp := get_VrachNagrKons (v.fk_id, pFD1 + pFD, 0, nChilds, k.fk_smid);
                     sTmp := REPLACE (sTmp, 'FN_PRIEMALL', Get_decode (nTmp, 0, '&nbsp;', nTmp));
                     nSum := nSum + nTmp;
                  END LOOP;
/*ADVICE(1125): Nested LOOPs should all be labeled [406] */

                  sTmp := sTmp || AddSum (nSum, pFD2 - pFD1 <> 0);
                  DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
                  --исследования взрослые  у врача
                  sTmp := '<tr><td height="26" width="55%"><pre>    (взр.)</td>';
                  nSum := 0;
                  FOR pFD IN 0 .. pFD2 - pFD1 LOOP
                     sTmp := sTmp || '<td height="26" width="15%">FN_PRIEMALL</td>';
                     nTmp := get_VrachNagrKons (v.fk_id, pFD1 + pFD, nChilds, 2000, k.fk_smid);
                     sTmp := REPLACE (sTmp, 'FN_PRIEMALL', Get_decode (nTmp, 0, '&nbsp;', nTmp));
                     nSum := nSum + nTmp;
                  END LOOP;
/*ADVICE(1138): Nested LOOPs should all be labeled [406] */

                  sTmp := sTmp || AddSum (nSum, pFD2 - pFD1 <> 0);
                  DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
               END LOOP k;
/*ADVICE(1143): Nested LOOPs should all be labeled [406] */


--------------------
            END LOOP v;
/*ADVICE(1148): Nested LOOPs should all be labeled [406] */

         END IF;
      END LOOP o;
      PROGRESS_BAR.SetStrOut ('Конец обработки');
      PROGRESS_BAR.STEPIT (6);
      sTmp := '</table>';
      DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
      INSERT INTO tclobs
                  (fc_clob)
      VALUES      (cl)
      RETURNING   fk_id
      INTO        nTmp;
      COMMIT;
      RETURN nTmp;
   END get_loadkab;
END PKG_KABINETLOAD; -- Package Body PKG_KABINETLOAD
/

SHOW ERRORS;


