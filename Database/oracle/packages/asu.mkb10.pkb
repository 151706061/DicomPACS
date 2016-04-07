DROP PACKAGE BODY ASU.MKB10
/

--
-- MKB10  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."MKB10" 
IS
  PROCEDURE prepare_agetable
  IS
  BEGIN
    DELETE
      FROM tmp_pacages;
    INSERT INTO tmp_pacages
      SELECT fk_id, MONTHS_BETWEEN (get_pacplanoutcome (fk_id), fd_rojd) / 12, fp_reslech, get_pacplanoutcome (fk_id), get_pacvrach (fk_id), get_vrachotd (get_pacvrach (fk_id))
        FROM tkarta
       WHERE fp_tek_coc IN (2, 3);
    DELETE
      FROM tmp_pacages
     WHERE fk_vrachid IS NULL
        OR fk_vrachid < 1;
  END;
/*------------------------------------------------------------------------------------------------*\
| CountPacWithDiag
\*------------------------------------------------------------------------------------------------*/
--сколько человек у врача за период с диагнозом в заданном диапозоне
  FUNCTION CountPacWithDiag (pFK_VRACHID IN NUMBER, pFD1 DATE, pFD2 DATE, sMKB10 VARCHAR2, pResLech1 IN NUMBER DEFAULT 0, pResLech2 IN NUMBER DEFAULT 4)
    RETURN NUMBER
  IS
    CURSOR cCountPacWithDiag (pFK_VRACHID IN NUMBER, pFD1 DATE, pFD2 DATE, sMKB10 VARCHAR2, pResLech1 IN NUMBER, pResLech2 IN NUMBER)
    IS
      SELECT   /*+ RULE*/COUNT (K.FK_ID)
        FROM ASU.TSMID S, ASU.TKARTA K, ASU.TDIAG D
       WHERE (D.FK_PACID = K.FK_ID)
         AND (D.FK_SMDIAGID = S.FK_ID)
         AND (D.FP_TYPE = 2)
         AND (D.FL_MAIN = 1)
         AND D.FK_VRACHID = pFK_VRACHID
         AND (S.FK_MKB10 = sMKB10)
         AND (  sMKB10 = FK_MKB10
             OR sMKB10 BETWEEN SUBSTR (FK_MKB10, 1, 3) AND SUBSTR (FK_MKB10, 5, 3))
         AND GET_PACPLANOUTCOME (K.FK_ID) BETWEEN pFD1 AND pFD2
         AND FP_RESLECH BETWEEN pResLech1 AND pResLech2;
    nres   NUMBER;
  BEGIN
    OPEN cCountPacWithDiag (pFK_VRACHID, pFD1, pFD2, sMKB10, pResLech1, pResLech2);
    FETCH cCountPacWithDiag INTO nRes;
    CLOSE cCountPacWithDiag;
    RETURN nRes;
  END;
/*------------------------------------------------------------------------------------------------*\
| CountPacZdorov
\*------------------------------------------------------------------------------------------------*/
--сколько людей без диагноза
  FUNCTION CountPacZdorov (pFK_VRACHID IN NUMBER, pFD1 DATE, pFD2 DATE, pResLech1 IN NUMBER DEFAULT 0, pResLech2 IN NUMBER DEFAULT 4)
    RETURN NUMBER
  IS
    CURSOR cCountPacZdorov (pFK_VRACHID IN NUMBER, pFD1 DATE, pFD2 DATE, pResLech1 IN NUMBER, pResLech2 IN NUMBER)
    IS
      SELECT   /*+ RULE*/COUNT (K.FK_ID)
        FROM ASU.TKARTA K
       WHERE NOT EXISTS (SELECT fk_id
                           FROM tdiag d
                          WHERE fk_pacid = k.fk_id
                            AND (D.FP_TYPE = 2)
                            AND (D.FL_MAIN = 1)
                            and fk_smdiagid<>get_synid('PRAKT_ZDOROV'))
         AND get_pacvrach (k.fk_id) = pFK_VRACHID
         AND GET_PACPLANOUTCOME (K.FK_ID) BETWEEN pFD1 AND pFD2
         AND FP_RESLECH BETWEEN pResLech1 AND pResLech2;
    nres   NUMBER;
  BEGIN
    OPEN cCountPacZdorov (pFK_VRACHID, pFD1, pFD2, pResLech1, pResLech2);
    FETCH cCountPacZdorov INTO nRes;
    CLOSE cCountPacZdorov;
    RETURN nRes;
  END;
/*------------------------------------------------------------------------------------------------*\
| CountPacWithDiagOther
\*------------------------------------------------------------------------------------------------*/
--сколько людей с диагнозом который не попадает в промежутки указанные в TREPMKB10
  FUNCTION CountPacWithDiagOther (pFK_VRACHID IN NUMBER, pFD1 DATE, pFD2 DATE, pResLech1 IN NUMBER DEFAULT 0, pResLech2 IN NUMBER DEFAULT 4)
    RETURN NUMBER
  IS
    CURSOR cCountPacWithDiagOther (pFK_VRACHID IN NUMBER, pFD1 DATE, pFD2 DATE, pResLech1 IN NUMBER, pResLech2 IN NUMBER)
    IS
      SELECT   /*+rule INDEX_FFS(K TKARTAINDEXID)*/COUNT (K.FK_ID)
        FROM ASU.TKARTA K, tdiag d, tsmid s
       WHERE d.fk_pacid = k.fk_id
         AND (D.FP_TYPE = 2)
         AND (D.FL_MAIN = 1)
         AND s.FK_ID = d.FK_SMDIAGID
         AND get_pacvrach (k.fk_id) = pFK_VRACHID
         AND NOT EXISTS (SELECT 1
                           FROM trepmkb10 r
                          WHERE r.FC_MKB10 = s.FK_MKB10
                             OR r.FC_MKB10 BETWEEN SUBSTR (s.FK_MKB10, 1, 3) AND SUBSTR (s.FK_MKB10, 5, 3))
         AND FP_RESLECH BETWEEN pResLech1 AND pResLech2
         AND GET_PACPLANOUTCOME (K.FK_ID) BETWEEN pFD1 AND pFD2;
    nres   NUMBER;
  BEGIN
    OPEN cCountPacWithDiagOther (pFK_VRACHID, pFD1, pFD2, pResLech1, pResLech2);
    FETCH cCountPacWithDiagOther INTO nRes;
    CLOSE cCountPacWithDiagOther;
    RETURN nRes;
  END;
/*------------------------------------------------------------------------------------------------*\
| CountKDNVrach
\*------------------------------------------------------------------------------------------------*/
  FUNCTION CountKDNVrach (pFK_VRACHID IN NUMBER, pFD1 DATE, pFD2 DATE, pResLech1 IN NUMBER DEFAULT 0, pResLech2 IN NUMBER DEFAULT 4)
    RETURN NUMBER
  IS
    CURSOR cCountKDNVrach (pFK_VRACHID IN NUMBER, pFD1 DATE, pFD2 DATE, pResLech1 IN NUMBER, pResLech2 IN NUMBER)
    IS
      SELECT SUM (tperesel.fd_data2 - tperesel.fd_data1)
        FROM tkarta, tvrach, tperesel
       WHERE tkarta.fk_id = tvrach.fk_pacid
         AND tkarta.fk_id = tperesel.fk_pacid
         AND tvrach.fk_vrachid = pFK_VRACHID
         AND tvrach.fl_vid = 'M'
         AND FP_RESLECH BETWEEN pResLech1 AND pResLech2
         AND get_pacplanoutcome (tkarta.fk_id) BETWEEN pFd1 AND pFd2;
    nRes   NUMBER;
  BEGIN
    OPEN cCountKDNVrach (pFK_VRACHID, pFD1, pFD2, pResLech1, pResLech2);
    FETCH cCountKDNVrach INTO nRes;
    CLOSE cCountKDNVrach;
    RETURN nRes;
  END;
/*------------------------------------------------------------------------------------------------*\
| CountLechInOtd
\*------------------------------------------------------------------------------------------------*/
  FUNCTION CountLechInOtd (pFK_OTDID IN NUMBER)
    RETURN NUMBER
  IS
    CURSOR cCountLechInOtd (pFK_OTDID IN NUMBER)
    IS
      SELECT COUNT (DISTINCT tsotr.fk_id)
        FROM tsotr
       WHERE fk_otdid = pFK_OTDID
         AND FP_VRACH = 1;
    nRes   NUMBER;
  BEGIN
    OPEN cCountLechInOtd (pFK_OTDID);
    FETCH cCountLechInOtd INTO nRes;
    CLOSE cCountLechInOtd;
    RETURN nRes;
  END;
/*------------------------------------------------------------------------------------------------*\
| IS_INPERIOD
\*------------------------------------------------------------------------------------------------*/
  FUNCTION IS_INPERIOD (sMKB10 IN VARCHAR2, fk_smid IN NUMBER)
    RETURN NUMBER
  IS
    sTmp   tsmid.fk_mkb10%TYPE;
  BEGIN
    IF LENGTH (sMKB10) NOT IN (3, 7) THEN
      raise_application_error (-20003, 'Неверный промежуток MКБ-10 допустимые длины 3 и 7 символов' || sMKB10);
    END IF;
    BEGIN
      SELECT fk_mkb10
        INTO sTmp
        FROM tsmid
       WHERE fk_id = fk_smid;
      IF     LENGTH (sMKB10) = 3
         AND sTmp = sMKB10 THEN
        RETURN 1;
      END IF;
      IF     LENGTH (sMKB10) = 7
         AND sTMP BETWEEN SUBSTR (sMKB10, 1, 3) AND SUBSTR (sMKB10, 5, 3) THEN
        RETURN 1;
      END IF;
      RETURN 0;
    EXCEPTION
      WHEN OTHERS THEN
        RAISE;
    END;
  END;
/*------------------------------------------------------------------------------------------------*\
| SanMKB10
\*------------------------------------------------------------------------------------------------*/
  FUNCTION SanMKB10 (pFD1 DATE, pFD2 DATE)
    RETURN NUMBER
  IS
    nTmp      NUMBER;
    sTmp      VARCHAR2(32767);
    cl        CLOB;
    nRes      NUMBER(9,0);
    i         INTEGER;
    nOtdPac   INTEGER         := 0;
    nOtdKDN   INTEGER         := 0;
  BEGIN
    INSERT INTO tclobs (fk_id, fc_clob, FC_COMMENT)
         VALUES (-1, EMPTY_CLOB (), 'Ежемесячный отчет врачей по заболеваемости c ' || pFD1 || ' по ' || pFD2)
      RETURNING FK_ID, FC_CLOB INTO nRes, CL;
    sTmp := '<html><head><title>Ежемесячный отчет врачей по заболеваемости</title> ' ||
            '<meta http-equiv="Content-Type" content="text/html; charset=windows-1251"> ' ||
            '<style><!-- ' ||
            ' .sm_td {width:119.6pt;border:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt} ' ||
            ' .sm_table{border-collapse:collapse;border:none;mso-border-alt:solid windowtext .5pt;mso-padding-alt:0cm 5.4pt 0cm 5.4pt} ' ||
            '--></style></head> ' ||
            '<body bgcolor="#FFFFFF" text="#000000"> ' ||
            '<h3 align="left">Отчет врачей по заболеваемости за период с FD_DATA1 по FD_DATA2</h3>' ||
            '<table class = "sm_table" width="100%" border="1" cellpadding="0"> ' ||
            ' <tr> ' ||
            ' <td class=sm_td rowspan="2"><div align="center"><B>№п.п.</B></div></td> ' ||
            ' <td class=sm_td rowspan="2"><div align="center"><B>Класс бол. по МКБ-Х</B></div></td> ' ||
            ' <td class=sm_td rowspan="2"><div align="center"><B>Наименованием болезней (по диагнозу медучреждения)</B></div></td> ' ||
            ' <td class=sm_td rowspan="2"><div align="center"><B>Шифры по МКБ</B></div></td>';
    sTmp := REPLACE (sTmp, 'FD_DATA1', TO_CHAR (pFD1, 'dd.mm.yyyy'));
    sTmp := REPLACE (sTmp, 'FD_DATA2', TO_CHAR (pFD2, 'dd.mm.yyyy'));
    FOR o IN pkg_kabinetload.cOtd
    LOOP
      nTmp := CountLechInOtd (o.fk_id);
      IF nTmp > 0 THEN   --если есть лечащие врачи в этом отделении
        sTmp := sTmp || ' <td class=sm_td colspan="FN_SPAN"><div align="center"><B>FC_OTD</B></div></td>';
        sTmp := REPLACE (sTmp, 'FN_SPAN', nTmp + 1);
        sTmp := REPLACE (sTmp, 'FC_OTD', o.fc_name);
      END IF;
    END LOOP o;
    --вторая строчка с фамилиями врачей
    sTmp := sTmp || '</tr><tr>';
    FOR o IN pkg_kabinetload.cOtd
    LOOP
      nTmp := CountLechInOtd (o.fk_id);
      IF nTmp > 0 THEN   --если есть лечащие врачи в этом отделении
        FOR v IN cLechInOtd (o.fk_id)
        LOOP
          sTmp := sTmp || '<td class=sm_td><div align="center"><B>FC_FIO</B></div></td>';
          sTmp := REPLACE (sTmp, 'FC_FIO', v.fc_fio);
        END LOOP v;
        sTmp := sTmp || '<td class=sm_td><div align="center"><B>Всего к/дн.</B></div></td>';
      END IF;
    END LOOP o;
    sTmp := sTmp || '</tr>';
    dbms_lob.writeappend (cl, LENGTH (sTmp), sTmp);
-- return nRes;
    --рассчет
    i := 0;
    FOR d IN cRepMkb10
    LOOP
      inc (i);
      sTmp := '<tr><td class=sm_td>FN_ROWNUM</td><td class=sm_td align = "center">FC_CLASS</td><td class=sm_td>FC_DIAG</td><td class=sm_td align = "left">FC_MKB10</td>';
      sTmp := REPLACE (sTmp, 'FN_ROWNUM', d.FN_ROWNUM);
      sTmp := REPLACE (sTmp, 'FC_CLASS', d.FC_CLASS);
      sTmp := REPLACE (sTmp, 'FC_DIAG', d.FC_NAME);
      sTmp := REPLACE (sTmp, 'FC_MKB10', d.FC_MKB10);
      dbms_lob.writeappend (cl, LENGTH (sTmp), sTmp);
      FOR o IN pkg_kabinetload.cOtd
      LOOP
        nTmp := CountLechInOtd (o.fk_id);
        IF nTmp > 0 THEN   --если есть лечащие врачи в этом отделении
          sTmp := '';
          FOR v IN cLechInOtd (o.fk_id)
          LOOP
            sTmp := sTmp || '<td class=sm_td><div align="center">FN_COUNT</div></td>';
            nTmp := CountPacWithDiag (v.fk_id, pFD1, pFD2, d.FC_MKB10);
            sTmp := REPLACE (sTmp, 'FN_COUNT', get_decode (nTmp, 0, '&nbsp', nTmp));
          END LOOP v;
          --всего к.дн.
--сделать потом, не ясна цифра?????????
          sTmp := sTmp || '<td class=sm_td><div align="center">FN_COUNT</div></td>';
          sTmp := REPLACE (sTmp, 'FN_COUNT', '&nbsp;');
          dbms_lob.writeappend (cl, LENGTH (sTmp), sTmp);
        END IF;
      END LOOP o;
      sTmp := '</tr>';
    END LOOP d;
    --прочие болезни
    inc (i);
    sTmp := '</tr><tr>' ||
            ' <td class=sm_td >' ||
            TO_CHAR (i) ||
            '</td> ' ||
            ' <td class=sm_td ><div align="left">&nbsp</div></td> ' ||
            ' <td class=sm_td ><div align="left">Прочие болезни не включенные в перечень</div></td> ' ||
            ' <td class=sm_td ><div align="center">&nbsp</div></td>';
    dbms_lob.writeappend (cl, LENGTH (sTmp), sTmp);
    FOR o IN pkg_kabinetload.cOtd
    LOOP
      nTmp := CountLechInOtd (o.fk_id);
      IF nTmp > 0 THEN   --если есть лечащие врачи в этом отделении
        sTmp := '';
        FOR v IN cLechInOtd (o.fk_id)
        LOOP
          sTmp := sTmp || '<td class=sm_td><div align="center">FN_COUNT</div></td>';
          nTmp := CountPacWithDiagOther (v.fk_id, pFD1, pFD2);
          sTmp := REPLACE (sTmp, 'FN_COUNT', get_decode (nTmp, 0, '&nbsp', nTmp));
          sTmp := REPLACE (sTmp, 'FC_FIO', v.fc_fio);
        END LOOP v;
        sTmp := sTmp || '<td class=sm_td><div align="center">&nbsp</div></td>';
        dbms_lob.writeappend (cl, LENGTH (sTmp), sTmp);
      END IF;
    END LOOP o;
    --здоровые
    inc (i);
    sTmp := '</tr><tr>' ||
            ' <td class=sm_td >' ||
            TO_CHAR (i) ||
            '</td> ' ||
            ' <td class=sm_td ><div align="left">&nbsp</div></td> ' ||
            ' <td class=sm_td ><div align="left">Практически здоровые</div></td> ' ||
            ' <td class=sm_td ><div align="center">&nbsp</div></td>';
    dbms_lob.writeappend (cl, LENGTH (sTmp), sTmp);
    FOR o IN pkg_kabinetload.cOtd
    LOOP
      nTmp := CountLechInOtd (o.fk_id);
      IF nTmp > 0 THEN   --если есть лечащие врачи в этом отделении
        sTmp := '';
        FOR v IN cLechInOtd (o.fk_id)
        LOOP
          sTmp := sTmp || '<td class=sm_td><div align="center">FN_COUNT</div></td>';
          nTmp := CountPacZdorov (v.fk_id, pFD1, pFD2);
          sTmp := REPLACE (sTmp, 'FN_COUNT', get_decode (nTmp, 0, '&nbsp', nTmp));
          sTmp := REPLACE (sTmp, 'FC_FIO', v.fc_fio);
        END LOOP v;
        sTmp := sTmp || '<td class=sm_td><div align="center">&nbsp</div></td>';
        dbms_lob.writeappend (cl, LENGTH (sTmp), sTmp);
      END IF;
    END LOOP o;
    --всего
    inc (i);
    sTmp := '</tr><tr>' ||
            ' <td class=sm_td ><i>' ||
            TO_CHAR (i) ||
            '</i></td> ' ||
            ' <td class=sm_td ><div align="center">&nbsp</div></td> ' ||
            ' <td class=sm_td ><div align="left"><i>Всего:</i></div></td> ' ||
            ' <td class=sm_td ><div align="center">&nbsp</div></td>';
    dbms_lob.writeappend (cl, LENGTH (sTmp), sTmp);
    FOR o IN pkg_kabinetload.cOtd
    LOOP
      nTmp := CountLechInOtd (o.fk_id);
      IF nTmp > 0 THEN   --если есть лечащие врачи в этом отделении
        sTmp := '';
        FOR v IN cLechInOtd (o.fk_id)
        LOOP
          sTmp := sTmp || '<td class=sm_td><div align="center"><i>FN_COUNT</i></div></td>';
          nTmp := get_vrachnagr (v.fk_id, pFD1, pFD2, 0, 2000);
          DBMS_OUTPUT.put_line ('VrachNagr FK_VRACHID =' || v.fk_id || ' ' || nTmp);
          sTmp := REPLACE (sTmp, 'FN_COUNT', get_decode (nTmp, 0, '&nbsp', nTmp));
        END LOOP v;
        sTmp := sTmp || '<td class=sm_td><div align="center"><i>&nbsp</i></div></td>';
        dbms_lob.writeappend (cl, LENGTH (sTmp), sTmp);
      END IF;
    END LOOP o;
--койко дни по врачам
    inc (i);
    sTmp := '</tr><tr><td class=sm_td >' ||
            TO_CHAR (i) ||
            '</td> ' ||
            ' <td class=sm_td ><div align="center">&nbsp</div></td> ' ||
            ' <td class=sm_td ><div align="left">К.\дн.:</div></td> ' ||
            ' <td class=sm_td ><div align="center">&nbsp</div></td>';
    dbms_lob.writeappend (cl, LENGTH (sTmp), sTmp);
    FOR o IN pkg_kabinetload.cOtd
    LOOP
      nTmp := CountLechInOtd (o.fk_id);
      IF nTmp > 0 THEN   --если есть лечащие врачи в этом отделении
        sTmp := '';
        FOR v IN cLechInOtd (o.fk_id)
        LOOP
          sTmp := sTmp || '<td class=sm_td><div align="center">FN_COUNT</div></td>';
          nTmp := get_vrachnagrkdn (v.fk_id, pFD1, pFD2, 0, 2000);
          sTmp := REPLACE (sTmp, 'FN_COUNT', get_decode (nTmp, 0, '&nbsp', nTmp));
        END LOOP v;
        sTmp := sTmp || '<td class=sm_td><div align="center">&nbsp</div></td>';
        dbms_lob.writeappend (cl, LENGTH (sTmp), sTmp);
      END IF;
    END LOOP o;
    --таблица с итогами внизу
    sTmp := '</tr></table><h3 align="left">По отделениям<h3></table>' ||
            '<table class="sm_table" width="95%" border="1" cellpadding="0">' ||
            ' <tr>' ||
            ' <td colspan ="3" class="sm_td" width="80%"><div align="left"><b>Наименование отдeления</b></div> </td>' ||
            ' <td colspan ="3" class="sm_td" width="10%"><div align="center"><b>Пациентов</b></div></td>' ||
            ' <td colspan ="3" class="sm_td" width="10%"><div align="center"><b>Проведено к.\дн.</b></div></td>' ||
            ' </tr>';
    dbms_lob.writeappend (cl, LENGTH (sTmp), sTmp);
    --таблица с итогом по отделениям
    FOR o IN pkg_kabinetload.cOtd
    LOOP
      nTmp := CountLechInOtd (o.fk_id);
      IF nTmp > 0 THEN   --если есть лечащие врачи в этом отделении
        sTmp := ' <tr>' ||
                ' <td colspan ="3" class="sm_td" width="80%"><div align="left">FC_NAME</div></td>' ||
                ' <td colspan ="3" class="sm_td" width="10%"><div align="center">FN_PAC</div></td>' ||
                ' <td colspan ="3" class="sm_td" width="10%"><div align="center">FN_KDN</div></td>' ||
                ' </tr>';
        sTmp := REPLACE (sTmp, 'FC_NAME', o.fc_name);
        SELECT NVL (SUM (get_vrachnagr (FK_ID, pFD1, pFD2)), 0)
          INTO nTmp
          FROM tsotr
         WHERE fk_otdid = o.fk_id;
        sTmp := REPLACE (sTmp, 'FN_PAC', nTmp);
        nOtdPac := nOtdPac + nTmp;
        SELECT NVL (SUM (get_vrachnagrkdn (FK_ID, pFD1, pFD2)), 0)
          INTO nTmp
          FROM tsotr
         WHERE fk_otdid = o.fk_id;
        sTmp := REPLACE (sTmp, 'FN_KDN', nTmp);
        nOtdKDN := nOtdKdn + nTmp;
        dbms_lob.writeappend (cl, LENGTH (sTmp), sTmp);
      END IF;
    END LOOP o;
    --итого по санаторию
    sTmp := ' <tr>' ||
            ' <td colspan ="3" class="sm_td" width="80%" ><div align="left"><i>Всего</i></div></td>' ||
            ' <td colspan ="3" class="sm_td" width="10%"><div align="center"><i>FN_PAC</i></div></td>' ||
            ' <td colspan ="3" class="sm_td" width="10%"><div align="center"><i>FN_KDN</i></div></td>' ||
            ' </tr>' ||
            '</table></body></html>';
    sTmp := REPLACE (sTmp, 'FN_PAC', NVL (nOtdPac, 0));
    sTmp := REPLACE (sTmp, 'FN_KDN', NVL (nOtdKDN, 0));
    dbms_lob.writeappend (cl, LENGTH (sTmp), sTmp);
    RETURN nRes;
  END;
/*------------------------------------------------------------------------------------------------*\
| ResLechMKB10
\*------------------------------------------------------------------------------------------------*/
  FUNCTION ResLechMKB10 (pFD1 DATE, pFD2 DATE, pVrachID IN NUMBER)
    RETURN NUMBER
  IS
    nTmp   NUMBER;
    sTmp   VARCHAR2(32767);
    cl     CLOB;
    nRes   NUMBER(9,0);
    i      INTEGER;
  BEGIN
    prepare_agetable;
    INSERT INTO tclobs (fk_id, fc_clob, FC_COMMENT)
         VALUES (-1, EMPTY_CLOB (), 'Результаты лечениия по нозологии c ' || pFD1 || ' по ' || pFD2)
      RETURNING FK_ID, FC_CLOB INTO nRes, CL;
    sTmp := '<html><head><title>Результаты лечениия по нозологии</title> ' ||
            '<meta http-equiv="Content-Type" content="text/html; charset=windows-1251"> ' ||
            '<style><!-- ' ||
            ' .sm_td {width:119.6pt;border:solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt} ' ||
            ' .sm_table{border-collapse:collapse;border:none;mso-border-alt:solid windowtext .5pt;mso-padding-alt:0cm 5.4pt 0cm 5.4pt} ' ||
            '--></style></head> ' ||
            '<body bgcolor="#FFFFFF" text="#000000"> ' ||
            '<h3 align="left">Результаты лечениия по нозологии с FD_DATA1 по FD_DATA2. <br> ' ||
            'Врач FC_VRACH</h3>' ||
            '<table class = "sm_table" width="100%" border="1" cellpadding="0"> ' ||
            ' <tr> ' ||
            '   <td class=sm_td rowspan="2"><div align="center"><B>№п.п.</B></div></td> ' ||
            '   <td class=sm_td rowspan="2"><div align="center"><B>Класс бол. по МКБ-Х</B></div></td> ' ||
            '   <td class=sm_td rowspan="2"><div align="center"><B>Наименованием болезней (по диагнозу медучреждени)</B></div></td> ' ||
            '   <td class=sm_td rowspan="2"><div align="center"><B>Шифры по МКБ</B></div></td>' ||
            '   <td class=sm_td colspan="4"><div align="center"><B>Результат лечения</B></div></td>' ||
            '   <td class=sm_td rowspan="2"><div align="center"><B>Всего</B></div></td>' ||
            ' </tr><tr> ' ||
            '    <td class=sm_td align="center">Значительное улучшение</td>' ||
            '    <td class=sm_td align="center">Улучшение</td>' ||
            '    <td class=sm_td align="center">Без улучшения</td>' ||
            '    <td class=sm_td align="center">Ухудшение</td>' ||
            ' </tr>';
    sTmp := REPLACE (sTmp, 'FD_DATA1', TO_CHAR (pFD1, 'dd.mm.yyyy'));
    sTmp := REPLACE (sTmp, 'FD_DATA2', TO_CHAR (pFD2, 'dd.mm.yyyy'));
    sTmp := REPLACE (sTmp, 'FC_VRACH', DO_VRACHFIO (pVrachID));
    dbms_lob.writeappend (cl, LENGTH (sTmp), sTmp);
    --рассчет
    i := 0;
    FOR d IN cRepMkb10
    LOOP
      inc (i);
      sTmp := '<tr>' ||
              ' <td class=sm_td>FN_ROWNUM</td>' ||
              ' <td class=sm_td align = "center">FC_CLASS</td>' ||
              ' <td class=sm_td>FC_DIAG</td>' ||
              ' <td class=sm_td align = "left">FC_MKB10</td>' ||
              ' <td class=sm_td align = "center">FC_0</td>' ||
              ' <td class=sm_td align = "center">FC_1</td>' ||
              ' <td class=sm_td align = "center">FC_2</td>' ||
              ' <td class=sm_td align = "center">FC_3</td>' ||
              ' <td class=sm_td align = "center">FC_TOTAL</td>' ||
              '</tr>';
      sTmp := REPLACE (sTmp, 'FN_ROWNUM', d.FN_ROWNUM);
      sTmp := REPLACE (sTmp, 'FC_CLASS', d.FC_CLASS);
      sTmp := REPLACE (sTmp, 'FC_DIAG', d.FC_NAME);
      sTmp := REPLACE (sTmp, 'FC_MKB10', d.FC_MKB10);
      nTmp := CountPacWithDiag (pVrachID, pFD1, pFD2, d.FC_MKB10);
      sTmp := REPLACE (sTmp, 'FC_TOTAL', get_decode (nTmp, 0, '&nbsp', nTmp));
      FOR nReslech IN 0 .. 3
      LOOP
        nTmp := CountPacWithDiag (pVrachID, pFD1, pFD2, d.FC_MKB10, nResLech, nResLech);
        sTmp := REPLACE (sTmp, 'FC_' || nResLech, get_decode (nTmp, 0, '&nbsp', nTmp));
      END LOOP nResLech;
      dbms_lob.writeappend (cl, LENGTH (sTmp), sTmp);
    END LOOP d;
    --прочие болезни
    inc (i);
    sTmp := '<tr>' ||
            ' <td class=sm_td>FN_ROWNUM</td>' ||
            ' <td class=sm_td align = "center">&nbsp</td>' ||
            ' <td class=sm_td>Прочие заболевания</td>' ||
            ' <td class=sm_td align = "left">&nbsp</td>' ||
            ' <td class=sm_td align = "center">FC_0</td>' ||
            ' <td class=sm_td align = "center">FC_1</td>' ||
            ' <td class=sm_td align = "center">FC_2</td>' ||
            ' <td class=sm_td align = "center">FC_3</td>' ||
            ' <td class=sm_td align = "center">FC_TOTAL</td>' ||
            '</tr>';
    sTmp := REPLACE (sTmp, 'FN_ROWNUM', i);
    nTmp := CountPacWithDiagOther (pVrachID, pFD1, pFD2);
    sTmp := REPLACE (sTmp, 'FC_TOTAL', get_decode (nTmp, 0, '&nbsp', nTmp));
    FOR nReslech IN 0 .. 3
    LOOP
      nTmp := CountPacWithDiagOther (pVrachID, pFD1, pFD2, nResLech, nResLech);
      sTmp := REPLACE (sTmp, 'FC_' || nResLech, get_decode (nTmp, 0, '&nbsp', nTmp));
    END LOOP nResLech;
    dbms_lob.writeappend (cl, LENGTH (sTmp), sTmp);
    --здоровые
    inc (i);
    sTmp := '<tr>' ||
            ' <td class=sm_td>FN_ROWNUM</td>' ||
            ' <td class=sm_td align = "center">&nbsp</td>' ||
            ' <td class=sm_td>Практически здоровые</td>' ||
            ' <td class=sm_td align = "left">&nbsp</td>' ||
            ' <td class=sm_td align = "center">FC_0</td>' ||
            ' <td class=sm_td align = "center">FC_1</td>' ||
            ' <td class=sm_td align = "center">FC_2</td>' ||
            ' <td class=sm_td align = "center">FC_3</td>' ||
            ' <td class=sm_td align = "center">FC_TOTAL</td>' ||
            '</tr>';
    sTmp := REPLACE (sTmp, 'FN_ROWNUM', i);
    nTmp := CountPacZdorov (pVrachID, pFD1, pFD2);
    sTmp := REPLACE (sTmp, 'FC_TOTAL', get_decode (nTmp, 0, '&nbsp', nTmp));
    FOR nReslech IN 0 .. 3
    LOOP
      nTmp := CountPacZdorov (pVrachID, pFD1, pFD2, nResLech, nResLech);
      sTmp := REPLACE (sTmp, 'FC_' || nResLech, get_decode (nTmp, 0, '&nbsp', nTmp));
    END LOOP nResLech;
    dbms_lob.writeappend (cl, LENGTH (sTmp), sTmp);
    --всего
    inc (i);
    sTmp := '<tr>' ||
            ' <td class=sm_td>FN_ROWNUM</td>' ||
            ' <td class=sm_td align = "center">&nbsp</td>' ||
            ' <td class=sm_td>Итого</td>' ||
            ' <td class=sm_td align = "left">&nbsp</td>' ||
            ' <td class=sm_td align = "center">FC_0</td>' ||
            ' <td class=sm_td align = "center">FC_1</td>' ||
            ' <td class=sm_td align = "center">FC_2</td>' ||
            ' <td class=sm_td align = "center">FC_3</td>' ||
            ' <td class=sm_td align = "center">FC_TOTAL</td>' ||
            '</tr></table>';
    sTmp := REPLACE (sTmp, 'FN_ROWNUM', i);
    nTmp := get_vrachnagr (pVrachID, pFD1, pFD2, 0, 2000, 0, 4);
    sTmp := REPLACE (sTmp, 'FC_TOTAL', get_decode (nTmp, 0, '&nbsp', nTmp));
    FOR nReslech IN 0 .. 3
    LOOP
      nTmp := get_vrachnagr (pVrachID, pFD1, pFD2, 0, 2000, nResLech, nResLech);
      sTmp := REPLACE (sTmp, 'FC_' || nResLech, get_decode (nTmp, 0, '&nbsp', nTmp));
    END LOOP nResLech;
    dbms_lob.writeappend (cl, LENGTH (sTmp), sTmp);
    sTmp := '<p>Итого историй:FN_IB</p><p>Итого койкодней:FN_KDN</p>' || '<p>Итого койкодней на историю:FNKDNIB</p>';
    nTmp := get_vrachnagr (pVrachID, pFD1, pFD2, 0, 2000, 0, 4);
    sTmp := REPLACE (sTmp, 'FN_IB', get_decode (nTmp, 0, '&nbsp', nTmp));
    i := get_vrachnagrkdn (pVrachID, pFD1, pFD2, 0, 2000);
    sTmp := REPLACE (sTmp, 'FN_KDN', get_decode (nTmp, 0, '&nbsp', i));
    sTmp := REPLACE (sTmp, 'FNKDNIB', get_decode (nTmp, 0, 0, get_decode (i / nTmp, 0, '&nbsp', ROUND (i / nTmp * 100) / 100)));
    dbms_lob.writeappend (cl, LENGTH (sTmp), sTmp);
    RETURN nRes;
  END;
END;
/

SHOW ERRORS;


