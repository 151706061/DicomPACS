DROP PACKAGE BODY ASU.PKG_CREATE_EPIKRIZ
/

--
-- PKG_CREATE_EPIKRIZ  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_CREATE_EPIKRIZ" IS

/*----------------------------------------------------------------------------*/
CURSOR cGetEpikrizClob(pFK_PACID in number, pFK_ID in NUMBER) IS
SELECT fc_clob
  FROM tclobs, tepikriz
 WHERE fk_pacid = pFK_PACID AND tclobs.fk_id = tepikriz.fk_clobid AND tepikriz.fk_id = pFK_ID;
/*----------------------------------------------------------------------------*/
TYPE TPacList IS TABLE OF BINARY_INTEGER INDEX BY BINARY_INTEGER;
  arPacList TPacList;
  arNullList TPacList;

/*----------------------------------------------------------------------------*/
/*--------------ГЛАВНАЯ ФУНКЦИЯ-----------------------------------------------*/
/*----------------------------------------------------------------------------*/
FUNCTION get_EPIKRIZ(pFC_PACID IN VARCHAR2, pFK_PACID IN NUMBER, pFK_ID IN NUMBER, pFN_VIEW IN NUMBER, pFC_NAME IN VARCHAR2) RETURN NUMBER IS
CURSOR cEpText IS SELECT fk_epclobid FROM tepikriz WHERE fk_pacid = pfk_pacid AND fk_id = pFK_ID;
CURSOR cIB IS SELECT * FROM TS_PRINTIB_TMP WHERE FL_PRINT = 1 ORDER BY FN_ORDER;
  sTmp      VARCHAR2(32767);
  cl        CLOB;
  clTemp    CLOB;
  resID     NUMBER;
  lFL_DIAGn NUMBER;
  EndStr VARCHAR2(32767):= '</BODY></HTML>';

BEGIN
  DoInitPacList(pFC_PACID); --Вызов функции, которая формирует массив

/*-----------------Непосред. формиров. эпикриза-------------------------------*/
  DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);

  sTmp := getEpikrizHeaderText(pFK_PACID, 1, pFN_VIEW, pFC_NAME, pFC_PACID);      --1 Шапка эпикриза
  DBMS_LOB.WRITEAPPEND(cl, LENGTH(sTmp), sTmp);

  DBMS_LOB.APPEND(cl, getVrachZakl(pFK_PACID, pFK_ID));                           --2 Заключение врача
  DBMS_LOB.APPEND(cl, getResAnIbText(pFK_PACID));                                 --3 Результаты анализов +
  DBMS_LOB.APPEND(cl, getResNazIbTextEpikriz(pFK_PACID, GET_ISSLEDID,             --4 Результаты диагностических исследований +
                                     'Результаты диагностических исследований'));
  DBMS_LOB.APPEND(cl, getResNazIbTextEpikriz(pFK_PACID, GET_KONSID,               --5 Консультации специалистов +
                                              'Консультации специалистов'));
  DBMS_LOB.APPEND(cl, getStatNazIbClob(pFK_PACID, 1));                            --6 Проведенное лечение
  /* commented by Sill 10.02.06 */
--  DBMS_LOB.append(cl, GetNazMed(pFK_PACID));                                    --7 Лист медикаментозных назначений
  DBMS_LOB.append(cl, getVrachRek(pFK_PACID, pFK_ID));                            --8 Рекомендации лечащего врача
  sTmp := getPodpisiIbText(pFK_PACID);                                            --9 Подписи
  DBMS_LOB.WRITEAPPEND(cl, LENGTH(sTmp), sTmp);
  DBMS_LOB.WRITEAPPEND(cl, LENGTH(EndStr), EndStr);

  INSERT INTO tclobs (fk_id, fc_clob)
  VALUES (-1, cl)
  RETURNING fk_id INTO resID;
 RETURN resid;
END;
/*----------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------*/

PROCEDURE DoSetEpikriz(pFK_PACID     IN NUMBER,
                       pfk_clobid    IN NUMBER,
                       pfk_epclobid  IN NUMBER,
                       pfk_rekclobid IN NUMBER,
                       pFL_PODPIS    IN NUMBER,
                       pFK_VRACHID   IN NUMBER,
                       pFK_ID        IN NUMBER) IS --KOLYA
    nID          NUMBER;
CURSOR cEpikriz IS SELECT count(FK_ID)
                     FROM TEPIKRIZ
                    WHERE FK_PACID = pFK_PACID;-- by TimurLan
BEGIN
     OPEN cEpikriz;
    FETCH cEpikriz
     INTO nID;
    CLOSE cEpikriz;

    IF nID IS NULL THEN
      INSERT INTO TEPIKRIZ (FK_PACID, FK_CLOBID, FK_EPCLOBID, FK_REKCLOB, FP_EPIKRIZ, FL_PODPIS, FK_VRACHID)
      VALUES (pFK_PACID, pFK_CLOBID, pFK_EPCLOBID, pFK_REKCLOBID, 1, pFL_PODPIS, pFK_VRACHID);
    ELSE
      UPDATE TEPIKRIZ
         SET FK_PACID    = pFK_PACID,
             FK_CLOBID   = pFK_CLOBID,
             FK_EPCLOBID = pFK_EPCLOBID,
             FK_REKCLOB  = pFK_REKCLOBID,
             FP_EPIKRIZ  = 1,
             FL_PODPIS   = pFL_PODPIS,
             FK_VRACHID  = pFK_VRACHID
       WHERE TEPIKRIZ.FK_ID = pFK_ID; --KOLYA
    END IF;
  END;
/*-----------------------ШАПКА ЭПИКРИЗА---------------------------------------*/
/*----------------------------------------------------------------------------*/
FUNCTION getEpikrizHeaderText(pFK_PACID IN NUMBER, bDIAG IN NUMBER, bHEADER IN NUMBER, pFC_NAME IN VARCHAR2, pFC_PACID IN VARCHAR2) RETURN VARCHAR2 IS
CURSOR cMain IS
             SELECT PKG_REGIST_PACFUNC.GET_PAC_IB(pFK_PACID) FC_IB,
                    TPEOPLES.FC_FAM, TPEOPLES.FC_IM, TPEOPLES.FC_OTCH,
                    TPEOPLES.FP_SEX, TPEOPLES.FD_ROJD,
                    PKG_REGIST_PACFUNC.GET_PAC_INCOME(pFK_PACID) FD_IN,
                    PKG_REGIST_PACFUNC.GET_PAC_PLANOUTCOME(pFK_PACID) FD_OUT,
                    PKG_REGIST_PACFUNC.GET_PAC_DAYS(pFK_PACID) FN_KDN,
                    PKG_REGIST_PEPLFUNC.GET_PEPL_AGE_MONTH(TPEOPLES.FK_ID) FC_AGE
             FROM TPEOPLES,
                  (SELECT FK_PEPLID FROM TKARTA WHERE FK_ID = pFK_PACID
                    UNION
                   SELECT FK_PEPLID FROM TAMBULANCE WHERE FK_ID = pFK_PACID) T
             WHERE TPEOPLES.FK_ID(+) = T.FK_PEPLID;
             
s VARCHAR2(32767) := '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">'||CHR(13)||
                     '<html xmlns:o="urn:schemas-microsoft-com:office:office"'||CHR(13)||
                     'xmlns:w="urn:schemas-microsoft-com:office:word"'||CHR(13)||
                     'xmlns="http://www.w3.org/TR/REC-html40">'||CHR(13)||
                     '<head><meta http-equiv=Content-Type content="text/html; charset=windows-1251">'||CHR(13)||
                     '<meta name=ProgId content=Word.Document>'||CHR(13)||
                     '<title>МИС ПАЦИЕНТ - Выписной эпикриз ##VALUE01</title></head>'||CHR(13)||
                     '<body><table width=100% border=0>'||CHR(13)||
                     '<tr>'||CHR(13)||
                     '<td align="center"><font style=''color:navy''><b>'||GET_COUNTRY(UPPER(ASU.PKG_SMINI.READSTRING('CONFIG', 'S_COUNTRY', '')))||'</td>'||CHR(13)||
                     '</tr>'||CHR(13)||
                     '<tr>'||CHR(13)||
                     '<td><div align=center><font style=''color:navy''><b>'||GET_REGION(UPPER(ASU.PKG_SMINI.READSTRING('CONFIG', 'S_REGION', '')))||'<BR>'||CHR(13)||
                     '<font style=''font-size:14.0pt;color:red''><b>'||REPLACE(UPPER(ASU.PKG_SMINI.READSTRING('CONFIG', 'S_FULLNAME', '')), chr(10), '<BR>')||'</b></font></div></td>'||CHR(13)||
                     '</tr><tr>'||CHR(13)||
                     '<td align=center><font style=''color:navy''><b>'||'"'||NVL(GET_VRACHFCOTDEL(get_pacvrach(pFK_PACID))||'"',' ')||'</td>'||CHR(13)||
                     '</tr></table>'||CHR(13)||
                     --Добавочная таблица
                     '<table width=100% border=0>'||CHR(13)||
                     '<tr>'||CHR(13)||
                     '<td align="right" width="50%" font style=''font-size:8.0pt''>'||'&nbsp;&nbsp;'||ASU.PKG_SMINI.READSTRING('CONFIG', 'S_KORPUS', '')||' '||
                     GET_REGION(UPPER(ASU.PKG_SMINI.READSTRING('CONFIG', 'S_REGION', '')))||' '||'г.'||' '||GET_TOWN(UPPER(ASU.PKG_SMINI.READSTRING('CONFIG', 'S_TOWN', '')))||
                     '</td>'||CHR(13)||
                     '<td align="left" width="50%" font style=''font-size:8.0pt''>'||'&nbsp;&nbsp;'||'<b>'||'Тел:'||'</b>'||' '||'"'||NVL(GET_VRACHFCOTDEL(get_pacvrach(pFK_PACID))||'"',' ')||' '||GET_VRACHTEL(get_pacvrach(pFK_PACID))||'</td>'||CHR(13)||
                     
                     '</tr>'||CHR(13)||
                     '<tr>'||CHR(13)||
                     '<td align="right" width="50%" font style=''font-size:8.0pt''>'||'&nbsp;&nbsp;'||GET_STREET(UPPER(ASU.PKG_SMINI.READSTRING('CONFIG', 'S_STREET', '')))||','||' '||UPPER(ASU.PKG_SMINI.READSTRING('CONFIG', 'S_HOUSE', ''))||'</td>'||CHR(13)||
                     '<td align="left" width="50%" font style=''font-size:8.0pt''>'||'&nbsp;&nbsp;'||'<b>'||'E-mail:'||'</b>'||' '||ASU.PKG_SMINI.READSTRING('CONFIG', 'S_EMAIL', '')||'</td>'||CHR(13)||
                     '</tr>'||CHR(13)||
                     '<tr>'||CHR(13)||
                     '<td align="right" width="50%" font style=''font-size:8.0pt''><b>'||'&nbsp;&nbsp;'||'Тел:'||'</b>'||' '||ASU.PKG_SMINI.READSTRING('CONFIG', 'S_PHONE', '')||','||' '||'<b>'||'Факс:'||'</b>'||' '||ASU.PKG_SMINI.READSTRING('CONFIG', 'S_FAX', '')||'</td>'||CHR(13)||
                     '</tr>'||CHR(13)||
                     '<tr></tr>'||CHR(13)||
                     '</table>'||CHR(13)||
                     
                     '<table width=100% border=0>'||CHR(13)||
                     '<tr>'||CHR(13)||
                     '<td><b>'||'&nbsp;&nbsp;'||TO_CHAR(sysdate, 'dd.mm.yyyy', 'nls_date_language=russian')||' '||'г.'||'</b></td></tr><tr>
                     <td align=center><font style=''font-size:14.0pt''><b>'||pFC_NAME||' '|| 'эпикриз ##VALUE01</b></font></td>'||CHR(13)||
                     '</tr></table>'||CHR(13);
s1 VARCHAR2(32767) := '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">'||CHR(13)||
                     '<html xmlns:o="urn:schemas-microsoft-com:office:office"'||CHR(13)||
                     'xmlns:w="urn:schemas-microsoft-com:office:word"'||CHR(13)||
                     'xmlns="http://www.w3.org/TR/REC-html40">'||CHR(13)||
                     '<head><meta http-equiv=Content-Type content="text/html; charset=windows-1251">'||CHR(13)||
                     '<meta name=ProgId content=Word.Document>'||CHR(13)||
                     '<title>МИС ПАЦИЕНТ - Выписной эпикриз ##VALUE01</title></head>'||CHR(13)||
                     '<body>'||CHR(13)||
                     '<table width=100% border=0>'||CHR(13)||
                     '<tr>'||CHR(13)||
                     '<td><b>'||'&nbsp;&nbsp;'||TO_CHAR(sysdate, 'dd.mm.yyyy', 'nls_date_language=russian')||' '||'г.'||'</b></td></tr><tr>
                     <td align=center><font style=''font-size:14.0pt''><b>'||pFC_NAME||' '|| 'эпикриз ##VALUE01</b></font></td>'||CHR(13)||
                     '</tr></table>'||CHR(13);
BEGIN
  IF bHEADER = 1 THEN
   FOR p in cMain LOOP
    s := REPLACE(s,'##VALUE01',p.FC_IB);
    IF p.FP_SEX = 0 THEN
     s := s || '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               В'||' '||'"'||NVL(GET_VRACHFCOTDEL(get_pacvrach(pFK_PACID))||'"',' ')||' '||
               'находилась на лечении пациентка:'||' ';
    ELSE
     s := s ||  '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                В'||' '||'"'||NVL(GET_VRACHFCOTDEL(get_pacvrach(pFK_PACID))||'"',' ')||' '||
                'находился на лечении пациент:'||' ';
    END IF;
    s := s ||'<b>'|| p.FC_FAM || ' ' || p.FC_IM || ' ' || p.FC_OTCH ||'</b>'||' '||
              PKG_REGIST_PACFUNC.GET_PAC_AGE_NOW (pFK_PACID)||' '||'лет,'||' ';
    s := s ||'И/Б №'||' '||'<b>'||PKG_REGIST_PACFUNC.GET_PAC_IB(pFK_PACID)||'</b>';

    s := s ||' c '||TO_CHAR(p.FD_IN, 'dd.mm.yyyy')||'&nbsp;&nbsp;'||' по '||'&nbsp;&nbsp;'||
                    TO_CHAR(p.FD_OUT, 'dd.mm.yyyy')||'&nbsp;&nbsp;'||'ВСЕГО:'||' '||p.FN_KDN||' '||'дней'||'<BR>';
    s := s ||'<BR>';
    s := s ||'<b>'||'Домашний адрес:'||'</b>'||' '||PKG_REGIST_PACFUNC.GET_PAC_ADRFULL(pFK_PACID)||'<BR>';
    s := s ||'<b>'||'Место работы:'||'</b>'||' '||PKG_REGIST_PACFUNC.GET_PAC_WORKPLACE (pFK_PACID)||'<BR>';
    s := s ||'<BR>';
    s := s ||'<div ID=IB_INVISIBLE><b>'||'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ДИАГНОЗ:'||'</b>'||' ';

    IF bDIAG = 1 THEN -- =1
     FOR n in 1..arPacList.COUNT LOOP -- kolya
      IF asu.do_diagbytype(pFK_PACID, 2, 1, arPacList(n)) IS NOT NULL THEN
       s := s || asu.do_diagbytype(pFK_PACID, 2, 1, arPacList(n));
       IF asu.do_diagbytype(pFK_PACID, 2, 2, arPacList(n)) IS NOT NULL THEN
        s := s || '<b>'||' Осложнение: ' ||'</b>'||asu.do_diagbytype(pFK_PACID, 2, 2, arPacList(n));
       END IF;
       IF asu.do_diagbytype(pFK_PACID, 2, 0, arPacList(n)) IS NOT NULL THEN
        s := s || '<b>'||' Сопутствующий диагноз: ' ||'</b>'|| asu.do_diagbytype(pFK_PACID, 2, 0, arPacList(n))||CHR(13);
       END IF;
      END IF;
     END LOOP;
     s1 := s1||'</div>';
    END IF;
   END LOOP;
  RETURN s;
  ELSE
   FOR p in cMain LOOP
    s1 := REPLACE(s1,'##VALUE01',p.FC_IB);
    IF p.FP_SEX = 0 THEN
     s1 := s1 || '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 В'||' '||'"'||NVL(GET_VRACHFCOTDEL(get_pacvrach(pFK_PACID))||'"',' ')||' '||
                 'находилась на лечении пациентка:'||' ';
    ELSE
     s1 := s1 || '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 В'||' '||'"'||NVL(GET_VRACHFCOTDEL(get_pacvrach(pFK_PACID))||'"',' ')||' '||
                 'находился на лечении пациент:'||' ';
    END IF;
    s1 := s1 ||'<b>'|| p.FC_FAM || ' ' || p.FC_IM || ' ' || p.FC_OTCH ||'</b>'||' '|| PKG_REGIST_PACFUNC.GET_PAC_AGE_NOW (pFK_PACID)||' '||'лет,'||' ';
    s1 := s1 ||'И/Б №'||' '||'<b>'||PKG_REGIST_PACFUNC.GET_PAC_IB(pFK_PACID)||'</b>';
    s1 := s1 ||' c '||TO_CHAR(p.FD_IN, 'dd.mm.yyyy')||'&nbsp;&nbsp;'||' по '||'&nbsp;&nbsp;'||
                       TO_CHAR(p.FD_OUT, 'dd.mm.yyyy')||'&nbsp;&nbsp;'||'ВСЕГО:'||' '||p.FN_KDN||' '||'дней'||'<BR>';
    s1 := s1 ||'<BR>';
    s1 := s1 ||'<b>'||'Домашний адрес:'||'</b>'||' '||PKG_REGIST_PACFUNC.GET_PAC_ADRFULL(pFK_PACID)||'<BR>';
    s1 := s1 ||'<b>'||'Место работы:'||'</b>'||' '||PKG_REGIST_PACFUNC.GET_PAC_WORKPLACE (pFK_PACID)||'<BR>';
    s1 := s1 ||'<BR>';
    s1 := s1 ||'<div ID=IB_INVISIBLE><b>'||'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ДИАГНОЗ:'||'</b>'||' ';

    IF bDIAG = 1 THEN --=1
     FOR n in 1..arPacList.COUNT LOOP -- kolya
      IF asu.do_diagbytype(pFK_PACID, 2, 1, arPacList(n)) IS NOT NULL THEN
       s1 := s1 || asu.do_diagbytype(pFK_PACID, 2, 1, arPacList(n));
       IF asu.do_diagbytype(pFK_PACID, 2, 2, arPacList(n)) IS NOT NULL THEN
        s1 := s1 || '<b>'||' Осложнение: ' ||'</b>'||asu.do_diagbytype(pFK_PACID, 2, 2, arPacList(n));
       END IF;
       IF asu.do_diagbytype(pFK_PACID, 2, 0, arPacList(n)) IS NOT NULL THEN
        s1 := s1 || '<b>'||' Сопутствующий диагноз: '||'</b>' || asu.do_diagbytype(pFK_PACID, 2, 0, arPacList(n))||CHR(13);
       END IF;
      END IF;
     END LOOP;
        s1 := s1||'</div>';
    END IF;
   END LOOP;
  RETURN s1;
 END IF;
END;

/*-------------------------Номер полного клоба с эпикризом--------------------*/
/*----------------------------------------------------------------------------*/
FUNCTION getFullEpikrizTextClobID(pFK_PACID IN NUMBER,
                                  pfl_diagn IN NUMBER,
                                  pfl_zakl  IN NUMBER,
                                  pFL_lab   IN NUMBER,
                                  pfl_diag  IN NUMBER,
                                  pfl_lech  IN NUMBER,
                                  pfl_kons  IN NUMBER,
                                  pFK_ID    IN NUMBER) RETURN NUMBER IS

CURSOR cEpText IS SELECT fk_epclobid
                  FROM tepikriz
                  WHERE fk_pacid = pfk_pacid
                    AND fk_id = pFK_ID;

    sTmp      VARCHAR2(32767);
    cl        CLOB;
    clTemp    CLOB;
    resID     NUMBER;
    lFL_DIAGn NUMBER;
    lFL_zakl  NUMBER;
    lFL_lab   NUMBER;
    lfl_diag  NUMBER;
    lfl_lech  NUMBER;
    lfl_kons  NUMBER;
  BEGIN
    lFL_ZAKL  := pFL_ZAKL;
    lFL_lab   := pFL_lab;
    lfl_diagn := pfl_diagn;
    lfl_diag  := pfl_diag;
    lfl_lech  := pfl_lech;
    lfl_kons  := pfl_kons;
    --если запрашивается только текст, без переформирования эпикриза
    IF lFL_ZAKL = -1 AND lFL_lab = -1 AND lfl_diagn = -1 AND lfl_diag = -1 AND lfl_lech = -1 AND lfl_kons = -1 THEN
      OPEN cEpText;
      FETCH cEpText INTO resid;
      IF resid IS NOT NULL THEN
        CLOSE cEpText;
        RETURN resid;
      END IF;
      CLOSE cEpText;
      lFL_ZAKL  := 1;
      lFL_lab   := 1;
      lfl_diagn := 1;
      lfl_diag  := 1;
      lfl_lech  := 1;
      lfl_kons  := 1;
    END IF;
    DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);
    sTmp := getEpikrizHeaderText(pFK_PACID, lFL_DIAGN, 1, 'Выписной', 22117322);                          --1 + Шапка эпикриза
    DBMS_LOB.WRITEAPPEND(cl, LENGTH(sTmp), sTmp);
    IF lFL_ZAKL = 1 THEN DBMS_LOB.APPEND(cl, getVrachZakl(pFK_PACID, pFK_ID));      --2 + Заключение лечащего врача
    END IF;
    IF lfl_lab = 1 THEN DBMS_LOB.APPEND(cl, getResAnIbText2(pFK_PACID, ''));            --3 ? Результаты анализов
    END IF;
    IF lfl_diag = 1 THEN DBMS_LOB.APPEND(cl, getResNazIbTextEpikriz(pFK_PACID, get_issledid,  --4 ?
                                             'Результаты диагностических исследований'));
    END IF;
    IF lfl_kons = 1 THEN DBMS_LOB.APPEND(cl, getResNazIbTextEpikriz(pFK_PACID, get_konsid,    --5 ?
                                             'Консультации специалистов'));
    END IF;
    IF lfl_lech = 1 THEN DBMS_LOB.APPEND(cl, getStatNazIbClob(pFK_PACID, 1));                 --6 ? Отпущенные процедуры
    END IF;
  /* commented by Sill 10.02.06 */
--    DBMS_LOB.append(cl, GetNazMed(pFK_PACID));                                     --7 ? Лист медикаментозных назначений
    DBMS_LOB.append(cl, getVrachRek(pFK_PACID, pFK_ID));                           --8 + Рекомендации лечащего врача
    sTmp := getPodpisiIbText(pFK_PACID);                                           --9 ? Подписи
    DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);

    INSERT INTO tclobs (fk_id, fc_clob)
    VALUES (-1, cl)
    RETURNING fk_id INTO resID;

 RETURN resid;
END;
  
/*----------------------ЗЛВ---------------------------------------------------*/
/*----------------------------------------------------------------------------*/
FUNCTION getVrachZakl(pFK_PACID IN NUMBER, pFK_ID IN NUMBER) RETURN CLOB IS
    sTmp   VARCHAR2(32767);
    cl     CLOB;
    clTemp CLOB;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);


    DoZaklText(pFK_PACID, pFK_ID);
    OPEN cGetEpikrizClob(pFK_PACID, pFK_ID);
    FETCH cGetEpikrizClob INTO clTemp;
    CLOSE cGetEpikrizClob;

    IF clTemp IS NOT NULL THEN
       DBMS_LOB.APPEND(cl, clTemp);
       IF DBMS_LOB.GETLENGTH(cl) <> 0 THEN
          DBMS_LOB.FREETEMPORARY(cl);
          DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);
        sTmp := '<p><h3 align = "center">Заключение лечащего врача</h3></p>';
        DBMS_LOB.WRITEAPPEND(cl, LENGTH(sTmp), sTmp);
        DBMS_LOB.APPEND(cl, clTemp);
       END IF;
    END IF;

RETURN cl;
END getVrachZakl;
  
/*-----------------РЕЗУЛЬТАТЫ АНАЛИЗОВ----------------------------------------*/
/*----------------------------------------------------------------------------*/
FUNCTION getResAnIbText2(pFK_PACID IN NUMBER, pFC_PACID IN VARCHAR2) RETURN CLOB IS
    sTmp    VARCHAR2(32767);
    cl      CLOB;
    bExists NUMBER := 0;

CURSOR c(ID IN NUMBER) IS SELECT fc_clob
             FROM tresan, tclobs
            WHERE fl_zakl = 1
              AND tresan.fK_blobid2 = tclobs.fk_id
              AND fk_pacid = pFK_PACID 
              AND tresan.fk_nazid IN (id)
         ORDER BY fd_ins;

BEGIN
  DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);

  sTmp := '<p><h3 align="center">Результаты анализов</h3></p>';
  DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);

 FOR n in 1..arPacList.COUNT LOOP
   FOR i IN c(arPacList(n)) LOOP
      bExists := 1;
      DBMS_LOB.APPEND(cl, i.fc_clob);
   END LOOP;
 END LOOP;

 IF bExists = 0 THEN
    DBMS_LOB.FREETEMPORARY(cl);
    DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);
    sTmp := '<p></p>';                              --НЕ ПРОВОДИЛИСЬ !
    DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
 END IF;
RETURN cl;
END;
  
/*----РЕЗУЛЬТАТЫ ДИАГНОСТИЧЕСКИХ ИССЛЕДОВАНИЙ И КОНСУЛЬТАЦИИ СПЕЦИАЛИСТОВ-----*/
/*----------------------------------------------------------------------------*/
FUNCTION getResNazIbTextEpikriz(pFK_PACID IN NUMBER, nStartID  IN NUMBER, sCaption  IN VARCHAR2) RETURN CLOB IS
CURSOR c(ID IN NUMBER) IS
SELECT TO_CHAR(FD_RUN, 'DD.MM.YYYY') AS FD_DATE,
             GET_FULLPATH(VNAZ.FK_SMID) AS NAME,
             TRICHVIEWDATA.FB_TEXT AS FC_RES,
             VNAZ.FK_ID AS FK_NAZID,
             VNAZ.FK_NAZSOSID AS SOS,
             VNAZ.FK_ISPOLID AS ISPOL,
             FL_SHOWDIAGPREDZAKL
        FROM TSMID, VNAZ, TRICHVIEWDATA
       WHERE VNAZ.FK_PACID = PFK_PACID
         AND VNAZ.FK_SMID = TSMID.FK_ID
         AND VNAZ.FK_ID = TRICHVIEWDATA.FK_PACID
         AND VNAZ.FK_NAZSOSID IN (GET_VIPNAZ, GET_NEYAV)
         AND VNAZ.FK_ID IN (ID)
         AND NSTARTID IN (SELECT FK_ID
                            FROM TSMID
                           START WITH FK_ID = VNAZ.FK_SMID
                          CONNECT BY PRIOR FK_OWNER = FK_ID)
       ORDER BY FD_DATE ASC;

CURSOR cPics(pFK_NAZID IN NUMBER) IS
      SELECT b.fk_id, b.fc_coment, p.fc_ext, p.fn_height, p.fn_width, dbms_lob.getlength(b.fb_b) bSize
        FROM tblobs b, tpics p
       WHERE p.fk_nazid = pFK_NAZID
         AND b.fk_id = p.fk_blobid
         AND fl_showib = 1;

CURSOR cFiles(pFK_NAZID IN NUMBER) IS
      SELECT TFILES.*, TBLOBS.FC_COMENT, DBMS_LOB.GETLENGTH(TBLOBS.FB_B) BSIZE
        FROM TFILES, TBLOBS
       WHERE TFILES.FK_NAZID = pFK_NAZID
         AND TBLOBS.FK_ID(+) = TFILES.FK_BLOBID
         AND TFILES.FL_SHOWIB = 1;

  cl                  CLOB;
  resID               NUMBER;
  sTmp                VARCHAR2(32767);
  sDiag               VARCHAR2(32767);
  bExists             NUMBER := 0;
  fl_showdiagpredzakl NUMBER;
  nWidth              INTEGER;
  nHeight             INTEGER;
  nRatio              NUMBER;
  
BEGIN
  DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);
  sTmp := '<p><h3 align="center">' || sCaption || '</h3></p>'; --поместили посередине заголовок исследования
  DBMS_LOB.WRITEAPPEND(cl, LENGTH(sTmp), sTmp);

  FOR n IN 1..arPacList.COUNT LOOP
   FOR i IN c(arPacList(n)) LOOP
    IF i.sos = get_neyav THEN
     bExists := 1;
     sTmp    := '<b> Дата выполнения: ' || i.fd_date || '<br><b>' || i.name || ': <font color=red><u>' || ' Пациент не явился.</u></font></b></b>';
     DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    ELSE
     bExists := 1;
     sTmp    := '<br><b>' || i.name || '</b>' || '<i>' || ' ' || i.fd_date || '</i>' || '<br>';

    FOR n IN 1..arPacList.COUNT LOOP 
     sDiag := asu.do_diagbytype(pFK_PACID, 4, 1, i.fk_nazid, 1) || ' ';
     IF asu.do_diagbytype(pFK_PACID, 4, 2, i.fk_nazid, 1) IS NOT NULL THEN
      sDiag:=sDiag||'<b>'||'Осложнение:'||' '||'</b>'||asu.do_diagbytype(pFK_PACID, 4, 2, i.fk_nazid, 1);
     END IF;
     IF asu.do_diagbytype(pFK_PACID, 4, 0, i.fk_nazid, 1) IS NOT NULL THEN
      sDiag:=sDiag||'<b>'||'Сопутствующий:'||' '||'</b>'||asu.do_diagbytype(pFK_PACID, 4, 0, i.fk_nazid, 1);
     END IF;
    END LOOP;

    DBMS_LOB.WRITEAPPEND(cl, LENGTH(sTmp), sTmp);
--    DBMS_LOB.APPEND(cl,CLOB_REPLACE(ASU.PKG_URA.get_vnaz_result(arPacList(n)),CHR(10),'<br>'));
    DBMS_LOB.APPEND(cl,CLOB_REPLACE(I.FC_RES,CHR(10),'<br>'));
    IF sDiag <> ' ' AND i.fl_showdiagpredzakl = 1 THEN
     sTmp := ' ';
     IF DBMS_LOB.getlength(CLOB_REPLACE(ASU.PKG_URA.get_vnaz_result(arPacList(n)),CHR(10),'<br>')) <> 0 THEN
      sTmp := sTmp || '<br><b>Диагноз:</b>' || sDiag;
     ELSE
      sTmp := sTmp || '<b>Диагноз:</b>' || sDiag;
     END IF;
    ELSE
     sTmp := ' ';
    END IF;

--    sTmp := sTmp || '<font face="Courier New, Courier, mono"><br> ' || i.fc_res || '</font>'; -- kolya 26.08.2005 Теперь результат собирается из pkg_ura

    IF sDiag <> ' ' AND (i.fl_showdiagpredzakl = 0 OR i.fl_showdiagpredzakl IS NULL) THEN
     sTmp := ' ';
     IF DBMS_LOB.getlength(CLOB_REPLACE(ASU.PKG_URA.get_vnaz_result(arPacList(n)),CHR(10),'<br>')) <> 0 THEN
      sTmp := sTmp || '<br><b>Диагноз:</b>' || sDiag;
     ELSE
      sTmp := sTmp || '<b>Диагноз:</b>' || sDiag;
     END IF;
    ELSE
     sTmp := ' ';
    END IF;
    
    DBMS_LOB.WRITEAPPEND(cl, LENGTH(sTmp), sTmp);

--   здесь вставить тэги для картинки <img src="me.jpg" width="490" height="503"> -- заремувлено kolya, пока используется без вложений
     /*FOR j IN cPics(i.fk_nazid) LOOP
      nWidth  := j.fn_width;
      nHeight := j.fn_height;
      IF nWidth > 640 THEN
       nRatio  := 640 / nWidth;
       nWidth  := 640;
       nHeight := nHeight * nRatio;
      END IF;
      IF nHeight > 488 THEN
       nRatio  := 488 / nHeight;
       nHeight := 488;
       nWidth  := nWidth * nRatio;
      END IF;
      IF j.bSize > 0 THEN
       sTmp := '<br><img src=' || j.fk_id || j.fc_ext ||' width="' || nWidth || '" height="' || nHeight || '"></img><br>' || j.fc_coment || '<br>';
      ELSE
       sTmp := '<br><img src=noimage.jpg></img><br>' || j.fc_coment || '<br>';
      END IF;
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
     END LOOP;
     FOR j IN cFiles(i.fk_nazid) LOOP
      IF j.bSize > 0 THEN
       sTmp := '<div><p>Вложенный документ ' || j.FC_NAME || '<br>' || j.FC_COMENT || '</div>';
      ELSE
       sTmp := '<div><p>Вложенный документ ' || j.FC_NAME || ' - отсутствует.<br>' || j.FC_COMENT || '</div>';
      END IF;
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
     END LOOP;*/



     sTmp:='<br>Специалист: '||INITCAP(do_vrachfio(i.ispol))||' _____________________';
     sTmp:= sTmp || '<br>';
     DBMS_LOB.WRITEAPPEND (cl, LENGTH (sTmp), sTmp);
    END IF;
   END LOOP;
  END LOOP;
  IF bExists = 0 THEN
   DBMS_LOB.FREETEMPORARY(cl);
   DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);
   sTmp := '<p></p>';                              --НЕ ПРОВОДИЛИСЬ !
   DBMS_LOB.WRITEAPPEND(cl, LENGTH(sTmp), sTmp);
  END IF;

  RETURN cl;
END;

/*----------------------ОТПУЩЕННЫЕ ПРОЦЕДУРЫ----------------------------------*/
/*----------------------------------------------------------------------------*/
FUNCTION getStatNazIbClob(pFK_PACID IN NUMBER, bEp IN NUMBER) RETURN CLOB IS
CURSOR c(pFK_PACID IN NUMBER, ID IN NUMBER) IS
      SELECT get_fullpath(fk_smid) || ' ' || PKG_NAZ.GET_NAZPARAM1(FK_ID) AS naim,
             DECODE(pkg_manager.get_nazproc_count_ib(fk_id),0,1,pkg_manager.get_nazproc_count_ib(fk_id)) AS fn_count,
             get_nazdone(fk_id) AS fn_done
        FROM tnazlech
       WHERE fk_pacid = pFK_PACID
         AND fk_smid not in (SELECT FK_ID FROM TSMID START WITH FK_ID = GET_SYNID('STOM_PROC') CONNECT BY PRIOR FK_ID = FK_OWNER)-- by TimurLan
         AND get_nazdone(fk_id) >= 0
         AND FK_ID IN (id)
       ORDER BY fd_naz;

  sTmp    VARCHAR2(32767);
  cl      CLOB;
  BExists NUMBER := 0;

BEGIN
  DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);
  IF pFK_PACID IS NULL THEN
   sTmp := '<p><h3 align = "center">Проведенное лечение</h3></p>';
   DBMS_LOB.WRITEAPPEND(cl, LENGTH(sTmp), sTmp);
   IF bep = 1 THEN
    sTmp := '<table style=''font-size:10.0pt''  align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" cellpadding="0" cellspacing="0">' ||
            '<tr><td align="center"><b>Наименование</b></td></tr>';
   ELSE
    sTmp := '<table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">' ||
            '<tr><td align="center"><b>Наименование</b></td>'||
            '<td align="center"><b>Количество</b></td></tr>';
   END IF;
   DBMS_LOB.WRITEAPPEND(cl, LENGTH(sTmp), sTmp);

   FOR n IN 1..arPacList.COUNT LOOP
     sTmp := '<tr><td colspan=2 align="left">';
     DBMS_LOB.WRITEAPPEND(cl, LENGTH(sTmp), sTmp);
     DBMS_LOB.APPEND(cl, SET_GET_RAZD_BREAK(arPacList(n)));
     sTmp := '</td></tr>';
     DBMS_LOB.WRITEAPPEND(cl, LENGTH(sTmp), sTmp);
     FOR i IN c(arPacList(n), arPacList(n)) LOOP
       bExists := 1;
       IF bep = 1 THEN
        sTmp := '<tr><td align="left">' || i.naim || '</td></tr>';
       ELSE
        sTmp := '<tr><td align="left">' || i.naim || '</td>'||
                '<td align="center">' || get_decode(i.fn_count, 1, '&nbsp', i.fn_done) || '</td></tr>';
       END IF;
       DBMS_LOB.WRITEAPPEND(cl, LENGTH(sTmp), sTmp);
     END LOOP;
     IF bExists = 0 THEN
      sTmp := '<tr><td colspan=2 align="left">Не проводилось</td></tr>';
      DBMS_LOB.WRITEAPPEND(cl, LENGTH(sTmp), sTmp);
     END IF;
   END LOOP;
   sTmp := '</table>';
   DBMS_LOB.WRITEAPPEND(cl, LENGTH(sTmp), sTmp);
  ELSE
    sTmp := '<p><h3 align = "center">Проведенное лечение</h3></p>';
    DBMS_LOB.WRITEAPPEND(cl, LENGTH(sTmp), sTmp);
    IF bep = 1 THEN
     sTmp := '<table style=''font-size:10.0pt''  align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">' ||
             '<tr><td align="center"><b>Наименование</b></td></tr>';
    ELSE
     sTmp := '<table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">' ||
             '<tr><td align="center"><b>Наименование</b></td>'||
                '<td align="center"><b>Количество</b></td></tr>';
    END IF;
    DBMS_LOB.WRITEAPPEND(cl, LENGTH(sTmp), sTmp);

    FOR n in 1..arPacList.COUNT LOOP
      FOR i IN c(pFK_PACID, arPacList(n)) LOOP
        bExists := 1;
        IF bep = 1 THEN
          sTmp := '<tr><td align="left">' || i.naim || '</td></tr>';
        ELSE
          sTmp := '<tr><td align="left">' || i.naim || '</td>'||
                  '<td align="center">' || get_decode(i.fn_count, 1, '&nbsp', i.fn_done) || '</td></tr>';
        END IF;
        DBMS_LOB.WRITEAPPEND(cl, LENGTH(sTmp), sTmp);
      END LOOP;
    END LOOP;
    sTmp := '</table>';
    DBMS_LOB.WRITEAPPEND(cl, LENGTH(sTmp), sTmp);
    IF bExists = 0 THEN
     DBMS_LOB.FREETEMPORARY(cl);
     DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);
     sTmp := '<p></p>';                              --НЕ ПРОВОДИЛИСЬ !
     DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
    END IF;
  END IF;
 RETURN cl;
END;

/*-------------------------ЛИСТ МЕДИКАМЕНТОЗНЫХ НАЗНАЧЕНИЙ--------------------*/
/*----------------------------------------------------------------------------*/

/* COMMENTED BY SILL 10.02.06 */

/*FUNCTION GetNazMed(pFK_PACID IN NUMBER) RETURN CLOB IS
CURSOR cNM(pFK_PACID IN NUMBER) IS SELECT rownum, tnazmed.*
                                     FROM tnazmed
                                    WHERE fk_pacid = pFK_PACID
                                 ORDER BY fd_date;

CURSOR cNMCont(pFK_NAZMEDID IN NUMBER) IS SELECT v$medic.fc_name,
                                                 DECODE(tnazmedlech.colvo, 0, NULL, v$medic.fc_eiid) AS fc_eiid,
                                                 DECODE(tnazmedlech.colvo, 0, NULL, tnazmedlech.colvo) AS colvo
                                            FROM tnazmedlech, v$medic
                                           WHERE tnazmedlech.naz_id = pFK_NAZMEDID
                                             AND v$medic.medicid = tnazmedlech.medic_id;
  cl      CLOB;
  sTmp    VARCHAR2(32767);
  bExists NUMBER := 0;
BEGIN
    DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);
    if pFK_PACID IS NULL THEN
      sTmp := '<p><h3 align="center">Лист медикаментозных назначений</h3></p>';
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
      FOR n in 1..arPacList.COUNT LOOP
        DBMS_LOB.APPEND(cl, SET_GET_RAZD_BREAK(arPacList(n)));
        sTmp := '<ul>';
        dbms_lob.writeappend(cl, length(sTMp), sTmp);
        FOR nm IN cNM(arPacList(n)) LOOP
          bExists := 1;
          sTmp := '<li><B>' || TO_CHAR(nm.rownum) || ')</B> - ' || to_char(nm.fd_date, 'dd.mm.yyyy');
          FOR NMCont IN cNMCont(nm.fk_id) LOOP
            sTmp := sTmp || ' ' || nmcont.fc_name;
            IF NMCont.colvo IS NOT NULL THEN
              sTmp := sTmp || ' по ' || NMCont.colvo || ' ' || LOWER(NMCont.fc_eiid);
            END IF;
            sTmp := sTmp || ', ';
          END LOOP NMCont;
          sTmp := substr(sTmp, 1, length(sTmp) - 2);
          sTmp := sTmp || ' - ' || nm.FN_PERDAY || ' раз в день, в течение ' || nm.FN_DAY || ' дней. ' || nm.FC_COMMENT;
          if nm.fp_status = get_nazcancel THEN
            sTmp := sTmp || '<br> Отменено ' || to_char(nm.fd_otmena, 'dd.mm.yyyy') || '.' || nm.fc_whyotmena;
            if (nm.fn_vidano != 0) or (nm.fn_vidano is not null) then
              sTmp := sTmp || ', отпущенно ' || nm.fn_vidano || ' приёмов.';
            end if;
          end if;
          dbms_lob.writeappend(cl, length(sTMp), sTmp);
        END LOOP nm;
        IF bExists = 0 THEN
          DBMS_LOB.FREETEMPORARY(cl);
          DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);
          sTmp := '<p></p>';                              --НЕ ПРОВОДИЛИСЬ !
          DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
        END IF;
        sTmp := '</ul>';
        dbms_lob.writeappend(cl, length(sTMp), sTmp);
      END LOOP;
    ELSE
      sTmp := '<p><h3 align="center">Лист медикаментозных назначений</h3></p><ul>';
      DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
      FOR nm IN cNM(pFK_PACID) LOOP
        bExists := 1;
        sTmp := '<li><B>' || TO_CHAR(nm.rownum) || ')</B> - ' || to_char(nm.fd_date, 'dd.mm.yyyy');
        FOR NMCont IN cNMCont(nm.fk_id) LOOP
          sTmp := sTmp || ' ' || nmcont.fc_name;
          IF NMCont.colvo IS NOT NULL THEN
            sTmp := sTmp || ' по ' || NMCont.colvo || ' ' || LOWER(NMCont.fc_eiid);
          END IF;
        sTmp := sTmp || ', ';
        END LOOP NMCont;
        sTmp := substr(sTmp, 1, length(sTmp) - 2);
        sTmp := sTmp || ' - ' || nm.FN_PERDAY || ' раз в день, в течение ' || nm.FN_DAY || ' дней. ' || nm.FC_COMMENT;
        if nm.fp_status = get_nazcancel THEN
          sTmp := sTmp || '<br> Отменено ' || to_char(nm.fd_otmena, 'dd.mm.yyyy') || '.' || nm.fc_whyotmena;
          if (nm.fn_vidano != 0) or (nm.fn_vidano is not null) then
            sTmp := sTmp || ', отпущенно ' || nm.fn_vidano || ' приёмов.';
          end if;
        end if;
        dbms_lob.writeappend(cl, length(sTMp), sTmp);
      END LOOP nm;
      sTmp := '</ul>';
      dbms_lob.writeappend(cl, length(sTMp), sTmp);
      IF bExists = 0 THEN
        DBMS_LOB.FREETEMPORARY(cl);
        DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);
        sTmp := '<p></p>';                                 --НЕ ПРОВОДИЛИСЬ !
        DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
      END IF;
    END IF;
RETURN cl;
END;*/


/*------------------РЕКОМЕНДАЦИИ ЛВ-------------------------------------------*/
/*----------------------------------------------------------------------------*/
FUNCTION getVrachRek(pFK_PACID IN NUMBER, pFK_ID IN NUMBER) RETURN CLOB IS
CURSOR c(pFK_PACID IN NUMBER, pFK_ID IN NUMBER) IS SELECT fc_clob
                                                     FROM tclobs, tepikriz
                                                    WHERE fk_pacid = pFK_PACID
                                                      AND fk_rekclob = tclobs.fk_id
                                                      AND tepikriz.fk_id = pFK_ID;
 sTmp   VARCHAR2(1000);
 cl     CLOB;
 clTemp CLOB;
BEGIN
  DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);

  OPEN c(pFK_PACID, pFK_ID);
  FETCH c INTO clTemp;
  CLOSE c;
   IF clTemp IS NOT NULL THEN
      DBMS_LOB.APPEND(cl, clTemp);
      IF DBMS_LOB.GETLENGTH(cl) <> 0 THEN
         DBMS_LOB.FREETEMPORARY(cl);
         DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);
         sTmp := '<p><h3 align = "center">Рекомендации лечащего врача</h3></p>';
         DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
         DBMS_LOB.append(cl, clTemp);
      END IF;
   END IF;
RETURN cl;
END getVrachRek;

/*---------------------ПОДПИСИ------------------------------------------------*/
/*----------------------------------------------------------------------------*/
FUNCTION getPodpisiIbText(pFK_PACID IN NUMBER) RETURN VARCHAR2 IS
    sTmp VARCHAR2(20000);
    bLechVrach NUMBER;
  BEGIN
    IF do_vrachfio(get_pacvrach(pFK_PACID)) <>
       get_zavotdfio(get_pacvrach(pFK_PACID)) THEN
      sTmp := '<P><table width="100%" border="0" cellspacing="0" cellpadding="0"> ' ||
              '<tr> ' ||
              '<td width="41%"><b>##VALUE19</b></td> ' ||
              '<td width="59%">/' || do_vrachfio(get_pacvrach(pFK_PACID)) || '/</td>' ||
              '</tr> ' || '  <tr> ' ||
              '<td width="41%"><b>Зав. отделением ##VALUE20</b></td> ' ||
              '<td width="59%">/' || get_zavotdfio(get_pacvrach(pFK_PACID)) || '/</td> ' ||
              '</tr> ' ||
              '</table> ';
      begin
        SELECT NVL(FP_VRACH,1) into bLechVrach FROM TSOTR WHERE FK_ID = PKG_REGIST_PACFUNC.GET_PAC_VRACHID(pFK_PACID);
        if bLechVrach = 1 then
          sTmp := REPLACE(sTmp,'##VALUE19','Лечащий врач');
        else
          sTmp := REPLACE(sTmp,'##VALUE19','Заполнил');
        end if;
        sTmp := REPLACE(sTmp,'##VALUE20','"'||NVL(GET_VRACHFCOTDEL(get_pacvrach(pFK_PACID))||'"',' '));
      exception when others then null;
      end;
    ELSE
      sTmp := '<P><table width="100%" border="0" cellspacing="0" cellpadding="0"> ' ||
              '<tr> ' ||
              '<td width="41%"><b>##VALUE19,<BR>Зав. отделением ##VALUE20</b></td> ' ||
              '<td width="59%">/' ||
              do_vrachfio(get_pacvrach(pFK_PACID)) || '/</td>' ||
              '</tr> ' ||
              '</table> ';
      BEGIN
        SELECT NVL(FP_VRACH,1) into bLechVrach FROM TSOTR WHERE FK_ID = PKG_REGIST_PACFUNC.GET_PAC_VRACHID(pFK_PACID);
        if bLechVrach = 1 then
          sTmp := REPLACE(sTmp,'##VALUE19','Лечащий врач');
        else
          sTmp := REPLACE(sTmp,'##VALUE19','Заполнил');
        end if;
        sTmp := REPLACE(sTmp,'##VALUE20','"'||NVL(GET_VRACHFCOTDEL(get_pacvrach(pFK_PACID))||'"',' '));
      exception when others then null;
      END;
    END IF;
 RETURN sTmp;
END;

/*-------------------РАЗДЕЛ ИБ------------------------------------------------*/
/*----------------------------------------------------------------------------*/
FUNCTION SET_GET_RAZD_BREAK(pFK_PACID IN NUMBER) RETURN CLOB IS
    clTemp CLOB;
    sTemp VARCHAR2(32767):= '<p><font style=''font-size:8.0pt;font-family:"Courier New"''><u>Раздел ИБ '||PKG_REGIST_PACFUNC.GET_PAC_IB(pFK_PACID)||' ('||PKG_REGIST_PACFUNC.GET_PAC_VRACHFIO(pFK_PACID)||'):</u></font><BR>';
  BEGIN
    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(sTemp), sTemp);
    RETURN clTemp;
  END;
  
/*-----------------------------?????------------------------------------------*/
/*----------------------------------------------------------------------------*/
PROCEDURE DoZaklText(pFK_PACID IN NUMBER, pFK_ID IN NUMBER) IS -- Modified by TimurLan
CURSOR cGetZaklClob(pFK_PACID IN NUMBER) IS SELECT fc_clob
                                              FROM tclobs, tepikriz
                                             WHERE fk_pacid = pFK_PACID
                                               AND tclobs.fk_id = tepikriz.fk_clobid;

CURSOR cLast IS SELECT get_ibrazdeltext(fk_tibid, get_smidowner(get_synid('TECHBOLEZNI')),'') AS fc_comment
                  FROM ttechbolezni
                 WHERE fk_pacid = pFK_PACID
                   AND fp_stom = 0
       ORDER BY ROWNUM DESC;

  sTmp    VARCHAR2(32767);
  clTemp  CLOB;
  cl      CLOB;
  nClobID INTEGER;
    
BEGIN
 OPEN cGetEpikrizClob(pFK_PACID, pFK_ID);
 FETCH cGetEpikrizClob INTO clTemp;
 CLOSE cGetEpikrizClob;

  IF clTemp IS NULL THEN
    OPEN cLast;
    FETCH cLast INTO sTmp;
    CLOSE cLast;
  IF sTmp IS NOT NULL THEN
    DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);
    DBMS_LOB.WRITEAPPEND(cl, LENGTH(sTmp), sTmp);

    INSERT INTO tclobs (fk_id, fc_clob)
    VALUES (-1, cl)
    RETURNING FK_ID INTO nClobID;
    INSERT INTO TEPIKRIZ (FK_PACID, FK_CLOBID, FP_EPIKRIZ)
    VALUES (pFK_PACID, nClobID, 1);
  END IF;
  ELSE
   null;
  END IF;
END;

/*------------------------------ИБ--------------------------------------------*/
/*----------------------------------------------------------------------------*/
FUNCTION getFullIbClobID_by_SET(pFC_PACID IN VARCHAR2,
                                pFN_MODE IN NUMBER DEFAULT 0,
                                pFN_TYPE IN NUMBER DEFAULT 1,
                                pFN_CALLTYPE IN NUMBER DEFAULT 0,
                                pFK_PACID IN NUMBER,
                                pFN_VIEW IN NUMBER) RETURN NUMBER IS
    
CURSOR cIB IS SELECT * FROM TS_PRINTIB_TMP WHERE FL_PRINT = 1 ORDER BY FN_ORDER;
 cTemp     VARCHAR2(32767);
 cl        CLOB;
 clTemp    CLOB;
 i         NUMBER := 0;
 clID      NUMBER;
BEGIN
   IF pFN_CALLTYPE = 0 THEN DoInitPacList(pFC_PACID); --если обыкновенная ИБ

   INSERT INTO TCLOBS (FC_CLOB) VALUES (EMPTY_CLOB())
   RETURNING FK_ID, FC_CLOB INTO clID, cl;

   DBMS_LOB.OPEN(cl, DBMS_LOB.LOB_READWRITE);

   IF pFN_MODE = 1 and arPacList.COUNT > 1 then --параллельный режим (группируем по разделам)
    DBMS_LOB.APPEND (cl, SET_getIbHeader(pFC_PACID,pFN_MODE,pFN_TYPE));
    FOR p in cIB LOOP
     BEGIN
      DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
       EXECUTE IMMEDIATE 'DECLARE ' || 'BEGIN ' || ' :clTemp:=textib.' ||
                         p.FC_FUNC || '(NULL,:pFN_MODE); ' || 'END;'
       USING IN OUT clTemp, pFN_MODE;
       DBMS_LOB.APPEND(cl, clTemp);
       DBMS_LOB.FREETEMPORARY(clTemp);
            exception
              when others then
                null;
            end;
      END LOOP;
      else --последовательный режим
        FOR n in 1..arPacList.COUNT LOOP
          DBMS_LOB.APPEND (cl, SET_getIbHeader(arPacList(n),pFN_MODE,pFN_TYPE));
          FOR p in cIB LOOP
            begin
              DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
              EXECUTE IMMEDIATE 'DECLARE ' || 'BEGIN ' || ' :clTemp:=textib.' ||
                                p.FC_FUNC || '(:pFK_PACID); ' || 'END;'
                USING IN OUT clTemp, arPacList(n);
              DBMS_LOB.APPEND(cl, clTemp);
              DBMS_LOB.FREETEMPORARY(clTemp);
            exception
              when others then
                null;
            end;
          END LOOP;
        END LOOP;
      end if;

      DBMS_LOB.APPEND(cl, SET_getIbEnder(pFC_PACID,pFN_MODE,pFN_TYPE));
      DBMS_LOB.CLOSE(cl);
      RETURN clID;
    ELSE -- если Амбулаторная ИБ
    
      RETURN getFullIbClobID_by_SET1(pFC_PACID,pFN_MODE,pFN_TYPE,pFN_CALLTYPE, pFK_PACID, pFN_VIEW);
    END IF;

END;

/*----------------------------------------------------------------------------*/
PROCEDURE DoInitPacList(cFK_PACID IN VARCHAR2) IS --Создаем массив
 cTemp     VARCHAR2(32767);
 i         NUMBER := 0;
BEGIN
  cTemp:=cFK_PACID;
  arPacList:=arNullList;
 LOOP
 EXIT WHEN cTemp is null;
   i:=i+1;
   arPacList(i):=decodeFC_PacID(cTemp);--заполняем массив переданными FK_PACID
 END LOOP;
END;

/*----------------------------------------------------------------------------*/
FUNCTION decodeFC_PacID(cFK_PACID IN OUT VARCHAR2) RETURN NUMBER IS
 nPacid NUMBER;
BEGIN
 IF INSTR (cFK_PACID,',') > 0 THEN
  nPacId := TO_NUMBER(SUBSTR (cFK_PACID,1,INSTR (cFK_PACID,',')-1));
  cFK_PACID := SUBSTR (cFK_PACID,INSTR (cFK_PACID,',')+1,LENGTH(cFK_PACID));
 ELSE
  nPacId := TO_NUMBER(cFK_PACID);
  cFK_PACID := null;
 END IF;
RETURN nPacId;
END;

/*------------------ШАПКА ИСТОРИИ БОЛЕЗНИ (ИБ)--------------------------------*/
/*----------------------------------------------------------------------------*/
FUNCTION SET_getIbHeader(pFC_PACID IN VARCHAR2,pFN_MODE IN NUMBER DEFAULT 0,pFN_TYPE IN NUMBER DEFAULT 1) RETURN CLOB IS
    clTemp CLOB;
    cTemp  VARCHAR2(32767);
    i      NUMBER := 0;
BEGIN
 if INSTR (pFC_PACID,',') = 0 then null;
 else DoInitPacList(pFC_PACID);
 end if;

 DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);

 if pFN_TYPE = 1 then
  if INSTR (pFC_PACID,',') = 0 then cTemp := getIbHeaderNormal(pFC_PACID);
  else cTemp := getIbHeaderNormal(pFC_PACID);
  end if;
 elsif pFN_TYPE = 2 then
  if INSTR (pFC_PACID,',') = 0 then cTemp := '<P>Амбулаторная карта '||GET_IB(pFC_PACID)||'</P>';
  else
   FOR i in 1..arPacList.COUNT LOOP
    cTemp := cTemp||'<P>'||TO_CHAR(i)||' Амбулаторная карта '||GET_IB(arPacList(i))||'</P>';
   END LOOP;
  end if;
 elsif pFN_TYPE = 3 then
  if INSTR (pFC_PACID,',') = 0 then cTemp := '<P>Выписка из ИБ '||GET_IB(pFC_PACID)||'</P>';
  else
   FOR i in 1..arPacList.COUNT LOOP
    cTemp := cTemp||'<P>'||TO_CHAR(i)||' Выписка из ИБ '||GET_IB(arPacList(i))||'</P>';
   END LOOP;
  end if;
 end if;

 DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(cTemp), cTemp);
RETURN clTemp;
END;

/*--------------------НОРМАЛЬНАЯ ШАПКА ИСТОРИИ БОЛЕЗНИ (ИБ)-------------------*/
/*----------------------------------------------------------------------------*/
FUNCTION getIbHeaderNormal(pFK_PACID IN NUMBER) RETURN VARCHAR2 IS
    s VARCHAR2(32767) :=
         '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">'||
         '<html xmlns:o="urn:schemas-microsoft-com:office:office"'||
         'xmlns:w="urn:schemas-microsoft-com:office:word"'||
         'xmlns="http://www.w3.org/TR/REC-html40">'||
         '<head><meta http-equiv=Content-Type content="text/html; charset=windows-1251">'||
         '<meta name=ProgId content=Word.Document>'||
         '<title>МИС ПАЦИЕНТ - Выписной эпикриз №##VALUE01</title></head>'||CHR(13)||
         '<body><table width=100% border=0>' ||
         '<tr>' ||
         '<td colspan=4><div align=right><font style=''font-size:8.0pt''>Учетная форма 3-кур<BR>Утв. МЗ СССР 02.06.82г. №522</font></div></td>' ||
         '</tr><tr>' ||
         '<td colspan=4><table width=100% border=0>' ||
         '<tr>' ||
         '<!--<td width=90><img src=c://asu/000.jpg></img></td>-->' ||
         '<td><div align=center><font style=''color:navy''><b>Ханты-Мансийский автономный округ<BR><BR><i>государственное учреждение здравоохранения</i></b></font><BR>' ||
         '<font style=''font-size:14.0pt;color:red''><b>ОКРУЖНАЯ КЛИНИЧЕСКАЯ БОЛЬНИЦА</b></font></div></td>' ||
         '</tr></table>' ||
         '</td>' ||
         '</tr><tr>' ||
         '<td colspan=4><p align=center><font style=''font-size:14.0pt''><BR><b>Выписной эпикриз № ##VALUE02</b></font></p></td>'||
         '</tr></table>'||CHR(13);
   
    CURSOR cMain IS
    SELECT PKG_REGIST_PACFUNC.GET_PAC_IB(pFK_PACID) FC_IB,
           GET_OTDNAME(GET_VRACHOTD(PKG_REGIST_PACFUNC.GET_PAC_VRACHID(pFK_PACID))) FC_OTDEL,
           PKG_REGIST_PACFUNC.GET_PAC_VRACHFIO(pFK_PACID) FC_VRACH,
           PKG_REGIST_PACFUNC.GET_PAC_VRACHID(pFK_PACID) FK_VRACHID,
           PKG_REGIST_PACFUNC.GET_PAC_FCPALATA(pFK_PACID) FC_PALATA,
           TPEOPLES.FC_FAM, TPEOPLES.FC_IM, TPEOPLES.FC_OTCH, T.FC_PUT,
           PKG_REGIST_PEPLFUNC.GET_PEPL_ADRFULL(TPEOPLES.FK_ID) FC_ADR,
           PKG_REGIST_PEPLFUNC.GET_PEPL_WORKPLACE(TPEOPLES.FK_ID) FC_RABOTA,
           PKG_REGIST_PACFUNC.GET_PAC_INCOME(pFK_PACID) FD_IN,
           PKG_REGIST_PACFUNC.GET_PAC_PLANOUTCOME(pFK_PACID) FD_OUT,
           PKG_REGIST_PACFUNC.GET_PAC_DAYS(pFK_PACID) FN_KDN,
           PKG_REGIST_PEPLFUNC.GET_PEPL_AGE_MONTH(TPEOPLES.FK_ID) FC_AGE, TPEOPLES.FP_SEX,
           TPRIZN.FC_NAME FC_PRIZN,
           'Пол: '||LOWER(PKG_REGIST_PEPLFUNC.GET_PEPL_SEX(TPEOPLES.FK_ID)) FC_GROUP_SEX
      FROM TPEOPLES, TPRIZN,
             (SELECT FK_PRIZN, FC_PUT, FK_PEPLID FROM TKARTA WHERE FK_ID = pFK_PACID
              UNION
              SELECT FK_PRIZN, FC_PUT, FK_PEPLID FROM TAMBULANCE WHERE FK_ID = pFK_PACID
              ) T
       WHERE TPEOPLES.FK_ID(+) = T.FK_PEPLID
         AND TPRIZN.FK_ID(+) = T.FK_PRIZN;
    bLechVrach NUMBER;
  BEGIN
   FOR p in cMain LOOP
      s := REPLACE(s,'##VALUE01',p.FC_IB);
      IF p.FP_SEX = 0 THEN
        s := s || '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   Уважаемый коллега, в'||' '||'"'||NVL(GET_VRACHFCOTDEL(get_pacvrach(pFK_PACID))||'"',' ')||' '||
                   'ОКБ находилась на лечении пациентка:'||' ';
      ELSE
        s := s ||  '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   Уважаемый коллега, в'||' '||'"'||NVL(GET_VRACHFCOTDEL(get_pacvrach(pFK_PACID))||'"',' ')||' '||
                   'ОКБ находился на лечении пациент:'||' ';
      END IF;
      s := s ||'<b>'|| p.FC_FAM || ' ' || p.FC_IM || ' ' || p.FC_OTCH ||'</b>'||' '||
                PKG_REGIST_PACFUNC.GET_PAC_AGE_NOW (pFK_PACID)||' '||'лет,'||' ';
      s := s ||'И/Б №'||' '||'<b>'||PKG_REGIST_PACFUNC.GET_PAC_IB(pFK_PACID)||'</b>';

      s := s ||' c '||TO_CHAR(p.FD_IN, 'dd.mm.yyyy')||'&nbsp;&nbsp;'||' по '||'&nbsp;&nbsp;'||
                      TO_CHAR(p.FD_OUT, 'dd.mm.yyyy')||'&nbsp;&nbsp;'||'ВСЕГО:'||' '||p.FN_KDN||' '||'дней'||'<BR>';
      s := s ||'<BR>';
      s := s ||'<b>'||'Домашний адрес:'||'</b>'||' '||PKG_REGIST_PACFUNC.GET_PAC_ADRFULL(pFK_PACID)||'<BR>';
      s := s ||'<b>'||'Место работы:'||'</b>'||' '||PKG_REGIST_PACFUNC.GET_PAC_WORKPLACE (pFK_PACID)||'<BR>';
      s := s ||'<BR>';
      s := s ||'<b>'||'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ДИАГНОЗ:'||'</b>'||' ';

     
  IF asu.do_diagbytype(pFK_PACID, 2, 1) IS NOT NULL THEN s := s || asu.do_diagbytype(pFK_PACID, 2, 1);
   IF asu.do_diagbytype(pFK_PACID, 2, 0) IS NOT NULL THEN
                                           s := s || ' Сопутствующий диагноз: ' || asu.do_diagbytype(pFK_PACID, 2, 0);
   END IF;
  ELSE s := s || ' Практически здоров. ';
  END IF;
 END LOOP;
RETURN s;
END;

/*-----------------------KOHEЦ------------------------------------------------*/
/*----------------------------------------------------------------------------*/
FUNCTION SET_getIbEnder(pFC_PACID IN VARCHAR2,pFN_MODE IN NUMBER DEFAULT 0,pFN_TYPE IN NUMBER DEFAULT 1) RETURN CLOB IS
    clTemp CLOB;
    cTemp  VARCHAR2(32767):= '</BODY></HTML>';
  BEGIN
    DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
    DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(cTemp), cTemp);
 RETURN clTemp;
END;

/*---------------------BY_SET1------------------------------------------------*/
/*----------------------------------------------------------------------------*/
FUNCTION getFullIbClobID_by_SET1(pFC_PACID IN VARCHAR2,pFN_MODE IN NUMBER DEFAULT 0,pFN_TYPE IN NUMBER DEFAULT 1,pFN_CALLTYPE IN NUMBER DEFAULT 1, pFK_PACID IN NUMBER, pFN_VIEW IN NUMBER) RETURN NUMBER IS
CURSOR cIB IS SELECT * FROM TS_PRINTIB_TMP WHERE FL_PRINT = 1 ORDER BY FN_ORDER;
    cTemp     VARCHAR2(32767);
    cl        CLOB;
    clTemp    CLOB;
    i         NUMBER := 0;
    clID      NUMBER;
BEGIN
    if pFN_CALLTYPE = 1 then --если обыкновенная Амбулаторная ИБ
      DoInitPacList(pFC_PACID);

      INSERT INTO TCLOBS (FC_CLOB)
      VALUES (EMPTY_CLOB())
      RETURNING FK_ID, FC_CLOB INTO clID, cl;

      DBMS_LOB.OPEN(cl, DBMS_LOB.LOB_READWRITE);

      if pFN_MODE = 1 and arPacList.COUNT > 1 then --параллельный режим (группируем по разделам)
        DBMS_LOB.APPEND (cl, SET_getIbHeader(pFC_PACID,pFN_MODE,pFN_TYPE));
        FOR p in cIB LOOP
          begin
              DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
              EXECUTE IMMEDIATE 'DECLARE ' || 'BEGIN ' || ' :clTemp:=PKG_TEXTIB.' ||
                                p.FC_FUNC || '(NULL,:pFN_MODE); ' || 'END;'
                USING IN OUT clTemp, pFN_MODE;
              DBMS_LOB.APPEND(cl, clTemp);
              DBMS_LOB.FREETEMPORARY(clTemp);
            exception
              when others then
                null;
            end;
          
        END LOOP;
      else --последовательный режим
        FOR n in 1..arPacList.COUNT LOOP
          DBMS_LOB.APPEND (cl, SET_getIbHeader(arPacList(n),pFN_MODE,pFN_TYPE));
          FOR p in cIB LOOP
            begin
              DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
              EXECUTE IMMEDIATE 'DECLARE ' || 'BEGIN ' || ' :clTemp:=PKG_TEXTIB.' ||
                                p.FC_FUNC || '(:pFK_PACID); ' || 'END;'
                USING IN OUT clTemp, arPacList(n);
              DBMS_LOB.APPEND(cl, clTemp);
              DBMS_LOB.FREETEMPORARY(clTemp);
            exception
              when others then
                null;
            end;
          END LOOP;
        END LOOP;
      end if;

      DBMS_LOB.APPEND(cl, SET_getIbEnder(pFC_PACID,pFN_MODE,pFN_TYPE));
      DBMS_LOB.CLOSE(cl);
      RETURN clID;
    else -- если Амбулаторная ИБ по назначениям
      RETURN getFullIbClobID_by_SET2(pFC_PACID,pFN_MODE,pFN_TYPE,pFN_CALLTYPE, pFK_PACID, pFN_VIEW);
    end if;
END;
  
/*---------------------BY_SET2------------------------------------------------*/
/*----------------------------------------------------------------------------*/
FUNCTION getFullIbClobID_by_SET2(pFC_PACID IN VARCHAR2,pFN_MODE IN NUMBER DEFAULT 0,pFN_TYPE IN NUMBER DEFAULT 1,pFN_CALLTYPE IN NUMBER DEFAULT 2, pFK_PACID IN NUMBER, pFN_VIEW IN NUMBER) RETURN NUMBER IS
CURSOR cIB IS SELECT * FROM TS_PRINTIB_TMP WHERE FL_PRINT = 1 ORDER BY FN_ORDER;
    cTemp     VARCHAR2(32767);
    cl        CLOB;
    clTemp    CLOB;
    i         NUMBER := 0;
    clID      NUMBER;
    str       VARCHAR2(32767);
  BEGIN
    if pFN_CALLTYPE = 2 then DoInitPacList(pFC_PACID);

      INSERT INTO TCLOBS (FC_CLOB)
      VALUES (EMPTY_CLOB())
      RETURNING FK_ID, FC_CLOB INTO clID, cl;
      DBMS_LOB.OPEN(cl, DBMS_LOB.LOB_READWRITE);

IF pFN_VIEW = 1 THEN
  DBMS_LOB.APPEND (cl, SET_getIbHeader2(arPacList(1),pFN_MODE,pFN_TYPE));
END IF;

      FOR n in 1..arPacList.COUNT LOOP
        begin
          DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
          clTemp := GET_NAZ_RESULT(arPacList(n));
          DBMS_LOB.APPEND(cl, clTemp);
          DBMS_LOB.FREETEMPORARY(clTemp);
        exception
          when others then
            null;
        end;
      END LOOP;

/*KOLYA 01.02.05*/
 --     str:=getPodpisiIbText(pFK_PACID);
 --     DBMS_LOB.APPEND(cl, SET_getIbEnder(pFC_PACID,pFN_MODE,pFN_TYPE));
      DBMS_LOB.CLOSE(cl);
      RETURN clID;
    else
      RETURN getFullIbClobID_by_SET3(pFC_PACID,pFN_MODE,pFN_TYPE,pFN_CALLTYPE, pFK_PACID, pFN_VIEW);
    end if;
  END;

/*--------------------BY_SET3-------------------------------------------------*/
/*----------------------------------------------------------------------------*/
FUNCTION getFullIbClobID_by_SET3(pFC_PARAM IN VARCHAR2,pFN_MODE IN NUMBER DEFAULT 0,pFN_TYPE IN NUMBER DEFAULT 1,pFN_CALLTYPE IN NUMBER DEFAULT 2, pFK_PACID IN NUMBER, pFN_VIEW IN NUMBER) RETURN NUMBER IS
CURSOR cIB IS SELECT * FROM TS_PRINTIB_TMP WHERE FL_PRINT = 1 ORDER BY FN_ORDER;
    cTemp     VARCHAR2(32767);
    cl        CLOB;
    clTemp    CLOB;
    i         NUMBER := 0;
    clID      NUMBER;
    nPeplID   NUMBER;
  BEGIN
    if pFN_CALLTYPE = 3 then

      INSERT INTO TCLOBS (FC_CLOB)
      VALUES (EMPTY_CLOB())
      RETURNING FK_ID, FC_CLOB INTO clID, cl;
      DBMS_LOB.OPEN(cl, DBMS_LOB.LOB_READWRITE);

      nPeplId:=TO_NUMBER(SUBSTR(pFC_PARAM,INSTR(pFC_PARAM,'[')+1,INSTR(pFC_PARAM,';')-1-INSTR(pFC_PARAM,'[')));

/*KOLYA 01.06.05--------------------------------------------------------------*/
IF pFN_VIEW = 1 THEN -- 1 - с шапкой эпикриза, 0 - без шапки
      cTemp:=getIbHeader3(nPeplId);
ELSE
      cTemp:='';
END IF;
/*KOLYA-----------------------------------------------------------------------*/
      DBMS_LOB.WRITEAPPEND(cl, LENGTH(cTemp), cTemp);
      DBMS_LOB.APPEND(cl, SET_getIbEnder(nPeplId,pFN_MODE,pFN_TYPE));
      DBMS_LOB.WRITEAPPEND(cl, LENGTH(pFC_PARAM), pFC_PARAM);
      DBMS_LOB.CLOSE(cl);
      RETURN clID;
    else
      RETURN -1;
    end if;
END;

/*-----------------------------IB_HEADER2-------------------------------------*/
/*----------------------------------------------------------------------------*/
FUNCTION SET_getIbHeader2(pFC_PACID IN VARCHAR2,pFN_MODE IN NUMBER DEFAULT 0,pFN_TYPE IN NUMBER DEFAULT 1) RETURN CLOB IS
    clTemp  CLOB;
    cTemp   VARCHAR2(32767);
    i       NUMBER := 0;
    nPeplID BINARY_INTEGER;
    CURSOR C is
      SELECT VNAZ.FK_PACID FROM VNAZ WHERE VNAZ.FK_ID = TO_NUMBER(pFC_PACID)
       UNION
      SELECT TTECHBOLEZNI.FK_PACID FROM TTECHBOLEZNI WHERE TTECHBOLEZNI.FK_ID = TO_NUMBER(pFC_PACID);
  BEGIN
    if TO_NUMBER(pFC_PACID) > 0 then
      if pFN_TYPE = 2 then
        FOR p IN c LOOP
          cTemp := p.FK_PACID;
          BEGIN
            SELECT * INTO nPeplID FROM
             (SELECT FK_PEPLID FROM TKARTA WHERE FK_ID = cTemp
              UNION
              SELECT FK_PEPLID FROM TAMBULANCE WHERE FK_ID = cTemp
              UNION
              SELECT FK_PACID FK_PEPLID FROM TDOC WHERE FK_ID = cTemp);
            cTemp := getIbHeader3(nPeplID);
          EXCEPTION WHEN NO_DATA_FOUND THEN
            cTemp := 'Ошибка функции SET_getIbHeader2. Параметр pFN_TYPE=2; pFC_PACID='||pFC_PACID;
          END;
          EXIT;
        END LOOP;
      else
        FOR p IN c LOOP
          cTemp := p.FK_PACID;
          EXIT;
        END LOOP;
        cTemp := getIbHeaderNormal(cTemp);
      end if;
      DBMS_LOB.CREATETEMPORARY(clTemp, TRUE, DBMS_LOB.call);
      DBMS_LOB.WRITEAPPEND(clTemp, LENGTH(cTemp), cTemp);
      RETURN clTemp;
    end if;
END;

/*----------------NAZ_RESULT--------------------------------------------------*/
/*----------------------------------------------------------------------------*/
FUNCTION GET_NAZ_RESULT(pFK_NAZID IN NUMBER) RETURN CLOB IS
    cl CLOB;
    nRootID BINARY_INTEGER;
    sTmp VARCHAR2(32767);
    sDiag VARCHAR2(32767);
    nWidth NUMBER;
    nHeight NUMBER;
    nRatio NUMBER;

    CURSOR cKonsIssl(pFK_NAZID IN NUMBER) is
      SELECT vnaz.fk_pacid,
             TO_CHAR(fd_ins, 'dd.mm.yyyy') AS fd_date,
             get_fullpath(vnaz.fk_smid) AS name,
             get_textvsbr(fc_res) as fc_res,
             fk_nazid,
             vnaz.fk_smid,
             fl_showdiagpredzakl,
             vnaz.fk_nazsosid as sos,
             vres.fk_vrachid as ispol,-- 25.12.2003 by TimurLan
             tsmid.fc_synonim
        FROM vnaz, tsmid, vres
       WHERE vnaz.fk_id = pFK_NAZID
         AND vnaz.fk_smid = tsmid.fk_id
         AND vnaz.fk_nazsosid = get_vipnaz
         AND vres.fk_nazid(+) = vnaz.fk_id
       ORDER BY tsmid.fn_order;

    CURSOR cPics(pFK_NAZID IN NUMBER) IS
      SELECT b.fk_id, b.fc_coment, p.fc_ext, p.fn_height, p.fn_width, dbms_lob.getlength(b.fb_b) bSize
        FROM tblobs b, tpics p
       WHERE p.fk_nazid = pFK_NAZID AND b.fk_id = p.fk_blobid AND fl_showib = 1;

    CURSOR cFiles(pFK_NAZID IN NUMBER) IS
      SELECT TFILES.*,TBLOBS.FC_COMENT,DBMS_LOB.GETLENGTH(TBLOBS.FB_B) BSIZE
        FROM TFILES,TBLOBS
       WHERE TFILES.FK_NAZID = pFK_NAZID AND TBLOBS.FK_ID(+) = TFILES.FK_BLOBID AND TFILES.FL_SHOWIB = 1;

    CURSOR cAnal(pFK_NAZID IN NUMBER) IS
          SELECT fc_clob
            FROM tresan, tclobs
           WHERE tresan.fk_nazid = pFK_NAZID
             AND fl_zakl = 1
             AND tclobs.fk_id = tresan.fk_blobid;

    CURSOR cLech(pFK_NAZID IN NUMBER) IS
      SELECT get_fullpath(fk_smid) || ' ' || PKG_NAZ.GET_NAZPARAM1(FK_ID) AS naim, DECODE(pkg_manager.get_nazproc_count_ib(fk_id),0,1,pkg_manager.get_nazproc_count_ib(fk_id)) AS fn_count, get_nazdone(fk_id) AS fn_done
        FROM tnazlech
       WHERE tnazlech.fk_id = pFK_NAZID
         AND fk_nazsosid = get_vipnaz
         AND fk_smid not in (SELECT FK_ID FROM TSMID START WITH FK_ID = GET_SYNID('STOM_PROC') CONNECT BY PRIOR FK_ID = FK_OWNER)-- by TimurLan
         AND get_nazdone(fk_id) >= 0;

    CURSOR cTechBol(pFK_NAZID IN NUMBER) IS
      SELECT *
        FROM ttechbolezni
       WHERE fk_id = pFK_NAZID;

    CURSOR cRoot is
      SELECT get_rootid(VNAZ.FK_SMID) FK_ROOTID from VNAZ WHERE FK_ID = pFK_NAZID;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(cl, TRUE, DBMS_LOB.call);

    FOR p in cRoot LOOP
      nRootID := p.FK_ROOTID;
      EXIT;
    END LOOP;

    if nRootID = get_konsid or nRootID = get_issledid then
      FOR i IN cKonsIssl(pFK_NAZID) LOOP
        if i.sos = get_neyav then
          sTmp    := '<P><B>' || i.name || '</B> <I>' || i.fd_date || '</I><BR><b><font color=red><u>' ||'Пациент не явился.</u></font></b></P>';
          DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
        else
          sTmp    := '<P><B>' || i.name || '</B> <I>' || i.fd_date || '</I>';
          sDiag   := asu.do_diagbytype(i.FK_PACID, 4, 1, i.fk_nazid, 1) || ' ' || asu.do_diagbytype(i.FK_PACID, 4, 0, i.fk_nazid, 1);
          IF sDiag <> ' ' AND i.fl_showdiagpredzakl = 1 THEN
            sTmp := sTmp || '<br><B>Диагноз:</b>' || sDiag;
          END IF;
          sTmp := sTmp || '<br>' || i.fc_res;
          IF sDiag <> ' ' AND (i.fl_showdiagpredzakl = 0 OR i.fl_showdiagpredzakl IS NULL) THEN
            sTmp := sTmp || '<br><B>Заключение:</b>' || sDiag;
          END IF;
          DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);

          FOR j IN cFiles(i.fk_nazid) LOOP
            if j.bSize > 0 then
              sTmp := '<div><p>Вложенный документ ' || j.FC_NAME || '<br>' || j.FC_COMENT || '</div>';
            else
              sTmp := '<div><p>Вложенный документ ' || j.FC_NAME || ' - отсутствует.<br>' || j.FC_COMENT || '</div>';
            end if;
            DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
          END LOOP;

            sTmp:='<br>Специалист: '||INITCAP(do_vrachfio(i.ispol));

          DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
        END IF;
      END LOOP;
    elsif nRootID = get_analid then
      FOR i IN cAnal(pFK_NAZID) LOOP
        sTmp := '<p>';
        DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
        DBMS_LOB.APPEND(cl, i.FC_CLOB); /**/
      END LOOP;
    elsif nRootID = get_procid then
      FOR i IN cLech(pFK_NAZID) LOOP
        sTmp := '<p>Процедура: ' || i.naim || '<br>'|| 'Проведено: ' || get_decode(i.fn_count, 1, 'Да', i.fn_done) || '</p>';
        DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
      END LOOP;
    elsif nRootID = get_synid('TECHBOLEZNI') then
      FOR i IN cTechBol(pFK_NAZID) LOOP
        sTmp := '<p>Прием проведен ' || TO_CHAR(i.fd_date,'dd.mm.yyyy') ||
                REPLACE(REPLACE(get_ibrazdeltext(i.fk_tibid, get_smidowner(get_synid('TECHBOLEZNI')), ''), '..', '.'), CHR(10), '<BR>');
        sDiag := asu.do_diagbytype(null, 3, 1, i.fk_id, 1) || ' ' || asu.do_diagbytype(null, 3, 0, i.fk_id, 1);
        IF sDiag <> ' ' THEN
          sTmp := sTmp || '<br>Диагноз:' || sDiag;
        END IF;
        sTmp := sTmp || '<br>' || do_vrachfio(i.fk_vrachid);
        DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
      END LOOP;
    elsif nRootID = get_synid('STOM_KONS') then
      FOR i IN cTechBol(pFK_NAZID) LOOP
        sTmp := '<p>Прием проведен ' || TO_CHAR(i.fd_date,'dd.mm.yyyy') ||'<br>'||
                REPLACE(REPLACE(get_ibrazdeltext(i.fk_tibid, /*get_smidowner(*/get_synid('STOM_KONS')/*)*/, ''), '..', '.'), CHR(10), '<BR>');
        sDiag := asu.do_diagbytype(i.FK_PACID, 3, 1, i.fk_id, 1) || ' ' || asu.do_diagbytype(i.FK_PACID, 3, 0, i.fk_id, 1);
        --sDiag := asu.do_diagbytype(null, 3, 1, i.fk_id, 1) || ' ' || asu.do_diagbytype(null, 3, 0, i.fk_id, 1);
        IF sDiag <> ' ' THEN
          sTmp := sTmp || '<br>Диагноз:' || sDiag;
        END IF;
        DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);

        sTmp := '<br>' || do_vrachfio(i.fk_vrachid);
        DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
      END LOOP;
    END IF;

    RETURN cl;
END;

/*--------------------------IB_HEADER3----------------------------------------*/
/*----------------------------------------------------------------------------*/
FUNCTION getIbHeader3(pFK_PEPLID IN NUMBER) RETURN VARCHAR2 IS
    s VARCHAR2(32767) := '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">'||CHR(13)||
         '<html xmlns:o="urn:schemas-microsoft-com:office:office"'||CHR(13)||
         'xmlns:w="urn:schemas-microsoft-com:office:word"'||CHR(13)||
         'xmlns="http://www.w3.org/TR/REC-html40">'||CHR(13)||
         '<head><meta http-equiv=Content-Type content="text/html; charset=windows-1251">'||CHR(13)||
         '<meta name=ProgId content=Word.Document>'||CHR(13)||
         '<title>МИС ПАЦИЕНТ - ВЫПИСНОЙ ЭПИКРИЗ АМБУЛАТОРНОГО БОЛЬНОГО ##VALUE04 ##VALUE07 ##VALUE09</title></head>'||CHR(13)||
         '<body><table width=100% border=0>'||CHR(13)||
         '<tr>'||CHR(13)||
         '<td colspan=4><table width=100% border=0>'||CHR(13)||
         '<tr>'||CHR(13)||
         '<!--<td width=90><img src=c://asu/000.jpg></img></td>-->'||CHR(13)||
         '<td><div align=center><font style=''color:navy''><b>Ханты-Мансийский автономный округ<BR><BR><i>государственное учреждение здравоохранения</i></b></font><BR>'||CHR(13)||
         '<font style=''font-size:14.0pt;color:red''><b>ОКРУЖНАЯ КЛИНИЧЕСКАЯ БОЛЬНИЦА</b></font></div></td>'||CHR(13)||
         '</tr></table>'||CHR(13)||
         '</td>'||CHR(13)||
         '</tr><tr>'||CHR(13)||
         '<td colspan=4><p align=center><font style=''font-size:14.0pt''><BR><b>Выписной эпикриз ##VALUE01</b></font></p></td>'||CHR(13)||
         '</tr></table>'||CHR(13);

CURSOR cMain IS SELECT PKG_REGIST_PACFUNC.GET_PAC_IB(TKARTA.FK_ID) FC_IB,
                       TKARTA.fp_sex, TKARTA.FK_ID AS FKID,
                       PKG_REGIST_PACFUNC.GET_PAC_INCOME(TKARTA.FK_ID) FD_IN,
                       PKG_REGIST_PACFUNC.GET_PAC_PLANOUTCOME(TKARTA.FK_ID) FD_OUT,
                       PKG_REGIST_PACFUNC.GET_PAC_DAYS(TKARTA.FK_ID) FN_KDN,
                       TPEOPLES.FC_FAM, TPEOPLES.FC_IM, TPEOPLES.FC_OTCH,
                       PKG_REGIST_PEPLFUNC.GET_PEPL_ADRFULL(TPEOPLES.FK_ID) ||' тел '|| TPEOPLES.FC_PHONE FC_ADR,
                       PKG_REGIST_PEPLFUNC.GET_PEPL_WORKPLACE(TPEOPLES.FK_ID) FC_RABOTA,
                       TPEOPLES.FD_ROJD,
                       'Код больного '||pFK_PEPLID||'. Пол: '||LOWER(PKG_REGIST_PEPLFUNC.GET_PEPL_SEX(TPEOPLES.FK_ID)) FC_SEX
                FROM TPEOPLES, tkarta
               WHERE TPEOPLES.FK_ID = pFK_PEPLID
                 AND TKARTA.fk_peplid = pFK_PEPLID;

CURSOR cDiags IS SELECT TSMID.FC_NAME, TSMID.FK_MKB10, FD_DATE
                   FROM (SELECT TDIAG.FK_SMDIAGID, MAX(TDIAG.FD_DATE) FD_DATE
                   FROM TDIAG
                  WHERE FK_PACID IN
                     (SELECT FK_ID FROM TKARTA WHERE FK_PEPLID = pFK_PEPLID
                       UNION
                      SELECT FK_ID FROM TAMBULANCE WHERE FK_PEPLID = pFK_PEPLID
                       UNION
                      SELECT FK_ID FROM TDOC WHERE FK_PACID = pFK_PEPLID)
                    AND TDIAG.FP_TYPE = 2
                    AND TDIAG.FL_MAIN = 1
                    AND TDIAG.FL_SHOWIB = 1
               GROUP BY TDIAG.FK_SMDIAGID), TSMID
      WHERE TSMID.FK_ID = FK_SMDIAGID
      ORDER BY FD_DATE DESC;

    bLechVrach NUMBER;
    bDiag BOOLEAN:=FALSE;

BEGIN
  FOR p in cMain LOOP
      s := REPLACE(s,'##VALUE01',p.FC_IB);
      IF p.FP_SEX = 0 THEN
        s := s || '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   Уважаемый коллега, в'||' '||'"'||NVL(GET_VRACHFCOTDEL(get_pacvrach(p.FKID))||'"',' ')||' '||
                   'ОКБ находилась на лечении пациентка:'||' ';
      ELSE
        s := s ||  '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   Уважаемый коллега, в'||' '||'"'||NVL(GET_VRACHFCOTDEL(get_pacvrach(P.FKID))||'"',' ')||' '||
                   'ОКБ находился на лечении пациент:'||' ';
      END IF;
      s := s ||'<b>'|| p.FC_FAM || ' ' || p.FC_IM || ' ' || p.FC_OTCH ||'</b>'||' '||
                PKG_REGIST_PACFUNC.GET_PAC_AGE_NOW (P.FKID)||' '||'лет,'||' ';
      s := s ||'И/Б №'||' '||'<b>'||PKG_REGIST_PACFUNC.GET_PAC_IB(P.FKID)||'</b>';

      s := s ||' c '||TO_CHAR(p.FD_IN, 'dd.mm.yyyy')||'&nbsp;&nbsp;'||' по '||'&nbsp;&nbsp;'||
                      TO_CHAR(p.FD_OUT, 'dd.mm.yyyy')||'&nbsp;&nbsp;'||'ВСЕГО:'||' '||p.FN_KDN||' '||'дней'||'<BR>';
      s := s ||'<BR>';
      s := s ||'<b>'||'Домашний адрес:'||'</b>'||' '||PKG_REGIST_PACFUNC.GET_PAC_ADRFULL(P.FKID)||'<BR>';
      s := s ||'<b>'||'Место работы:'||'</b>'||' '||PKG_REGIST_PACFUNC.GET_PAC_WORKPLACE (P.FKID)||'<BR>';
      s := s ||'<BR>';
      s := s ||'<b>'||'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ДИАГНОЗ:'||'</b>'||' ';


  IF asu.do_diagbytype(P.FKID, 2, 1) IS NOT NULL THEN s := s || asu.do_diagbytype(P.FKID, 2, 1);
   IF asu.do_diagbytype(P.FKID, 2, 0) IS NOT NULL THEN
                                           s := s || ' Сопутствующий диагноз: ' || asu.do_diagbytype(P.FKID, 2, 0);
   END IF;
  ELSE s := s || ' Практически здоров. ';
  END IF;
 END LOOP;

RETURN s;
END;

/*------------------------------------------------------------------------------------------------------------------*\
 |               getResAnIbText РЕЗУЛЬТАТЫ ЛАБОРАТОРНЫХ ИССЛЕДОВАНИЙ
\*------------------------------------------------------------------------------------------------------------------*/
   FUNCTION getResAnIbText(pFK_PACID IN NUMBER) RETURN CLOB IS
    CURSOR c(pFK_PACID IN NUMBER, ID IN NUMBER) IS
      SELECT fc_clob, FK_NAZID
        FROM tresan, tclobs
       WHERE fl_zakl = 1
         AND tresan.fK_blobid = tclobs.fk_id
         AND fk_pacid = pFK_PACID
         AND FK_NAZID IN (ID)
       ORDER BY fd_ins;
    sTmp    VARCHAR2(32767);
    cl      CLOB;
    aExists BOOLEAN := FALSE;
    bExists BOOLEAN := FALSE;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(cl, TRUE, 2);

    IF pFK_PACID IS NULL THEN
      FOR n in 1..arPacList.COUNT LOOP
        bExists := FALSE;
        FOR i IN c(arPacList(n), arPacList(n)) LOOP
          if not aExists then
            sTmp := '<p><h3 align="center">РЕЗУЛЬТАТЫ ЛАБОРАТОРНЫХ ИССЛЕДОВАНИЙ</h3></p>';
            DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
            aExists := TRUE;
          end if;
          if not bExists then
            DBMS_LOB.APPEND(cl, SET_GET_RAZD_BREAK(arPacList(n)));
            bExists := TRUE;
          end if;
          DBMS_LOB.append(cl, i.fc_clob);
        END LOOP;
      END LOOP;
    ELSE
     FOR n in 1..arPacList.COUNT LOOP
      FOR i IN c(pFK_PACID, arPacList(n)) LOOP
        if not aExists then
          sTmp := '<p><h3 align="center">РЕЗУЛЬТАТЫ ЛАБОРАТОРНЫХ ИССЛЕДОВАНИЙ</h3></p>';
          DBMS_LOB.writeappend(cl, LENGTH(sTmp), sTmp);
          aExists := TRUE;
        end if;
        DBMS_LOB.append(cl, i.fc_clob);
      END LOOP;
     END LOOP;
    END IF;
    RETURN cl;
  END;

/*FUNCTION get_STRPACID(pFK_PACID IN NUMBER, pFC_PACID IN VARCHAR2) RETURN VARCHAR2 IS
CURSOR c(ID IN NUMBER) IS SELECT GET_FULLPATH(VRES.FK_SMID) || ' от ' || TO_CHAR(FD_INS, 'DD.MM.YYYY:') FC_NAME,
               SUBSTR(GET_TEXTVSBR(FC_RES),INSTR(UPPER(GET_TEXTVSBR(FC_RES)),'РЕКОМЕНДАЦИИ',12,1),LENGTH(GET_TEXTVSBR(FC_RES)) - INSTR(UPPER(GET_TEXTVSBR(FC_RES)),'РЕКОМЕНДАЦИИ',12,1) + 1) FC_RES
          FROM VRES, TSMID, VNAZ
         WHERE VRES.FK_PACID = pFK_PACID
           AND VRES.FK_NAZID in (ID)
           AND VRES.FK_SMID = TSMID.FK_ID
           AND VRES.FK_NAZID = VNAZ.FK_ID
           AND VNAZ.FK_NAZSOSID = GET_VIPNAZ
           AND GET_KONSID IN (SELECT --FK_ID
                      /*          FROM TSMID
                               START WITH FK_ID = VRES.FK_SMID
                              CONNECT BY PRIOR FK_OWNER = FK_ID)
         ORDER BY TSMID.FN_ORDER, FD_INS;
Text VARCHAR2(32767);
BEGIN
DoInitPacList(pFC_PACID);

 FOR n in 1..arPacList.COUNT LOOP
   FOR i IN c(arPacList(n)) LOOP
    Text:=i.fc_res;
   END LOOP;
 END LOOP;
RETURN Text;
END;*/
END;
/

SHOW ERRORS;


