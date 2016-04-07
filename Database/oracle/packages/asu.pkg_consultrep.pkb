DROP PACKAGE BODY ASU.PKG_CONSULTREP
/

--
-- PKG_CONSULTREP  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_CONSULTREP" IS
--------------------------------------------------------------------------------
-- NEBARY (Create 01.07.2002; Modify 06.09.2002)
-- Возвращает CLOB - жупнал консультаций в HTML
--------------------------------------------------------------------------------
  TYPE Number_Table IS TABLE OF NUMBER INDEX BY BINARY_INTEGER;

  CR       VARCHAR2(1):=CHR(13);
  Date1    DATE;    -- начальная дата
  Date2    DATE;    -- конечная дата
  nAcc     NUMBER;  -- счетчик № п/п
  sHeader  VARCHAR2(4000):=
    '<html><head>'||CR||
    '<meta http-equiv=Content-Type content="text/html; charset=windows-1251">'||CR||
    '<title>Журнал консультаций заведующего отделением</title></head>'||CR||
    '<body>'||CR||
    '<table align=center border=1 cellspacing=0 cellpadding=0>'||CR||
    ' <tr>'||CR||
    '  <td height=100 style=''border-right:none''> </td>'||CR||
    '  <td height=100 align=center style=''border-left:none''><b>Журнал консультаций.<br>:vrachs<br>За период с :pFD1 по :pFD2<br></b></td>'||CR||
    ' </tr>'||CR;
  sVrachs  VARCHAR2(32767);
  sParams  VARCHAR2(32767);
  tParams  Number_Table;
  nParInd  BINARY_INTEGER;

--------------------------------------------------------------------------------
-- Возвращает 1 если есть консультации для врачу, для специализации ------------
--------------------------------------------------------------------------------
  FUNCTION get_IsVrachCons(nID IN NUMBER)
  RETURN NUMBER IS
    CURSOR cConsult IS SELECT fk_id FROM treskons
     WHERE fk_vrachid=nID
     AND fk_sos=get_vipnaz;
    nRes NUMBER;
  BEGIN
    OPEN cConsult; FETCH cConsult INTO nRes;
    IF cConsult%NOTFOUND THEN nRes:=0; ELSE nRes:=1; END IF;
    CLOSE cConsult;
    RETURN nRes;
  END;

  FUNCTION get_IsSpecCons(nID IN NUMBER)
  RETURN NUMBER IS
    CURSOR cConsult IS SELECT fk_id FROM treskons
     WHERE fk_vrachid IN (SELECT fk_sotrid FROM tpass
                          WHERE fk_specid=nID)
     AND fk_sos=get_vipnaz;
    nRes NUMBER;
  BEGIN
    OPEN cConsult; FETCH cConsult INTO nRes;
    IF cConsult%NOTFOUND THEN nRes:=0; ELSE nRes:=1; END IF;
    CLOSE cConsult;
    RETURN nRes;
  END;
--------------------------------------------------------------------------------
-- Возвращает Ф.И.О. по врачу --------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION get_VrachFIO(nID IN NUMBER)
  RETURN VARCHAR2 IS
    sTmp VARCHAR2(4000);
  BEGIN
    FOR c IN (SELECT fc_fam||' '||decode(substr(fc_name,0,1), NULL, '', substr(fc_name,0,1)||'. ')||decode(substr(fc_otch,0,1), NULL, '', substr(fc_otch,0,1)||'. ') AS fc_nm
             FROM tsotr
             WHERE fk_id=nID) LOOP
      sTmp:=c.fc_nm;
    END LOOP;
    SELECT NVL(sTmp,'N/A') INTO sTmp FROM dual;
    RETURN sTmp;
  END;
--------------------------------------------------------------------------------
-- Выбирает fk_vrachid из строки и список Ф.И.О. врачей для заголовка ----------
--------------------------------------------------------------------------------
  PROCEDURE do_loadparams IS
    sTmp VARCHAR2(40);
    nTmp NUMBER;
  BEGIN
    nParInd:=0;
    IF tParams.COUNT>0 THEN tParams.DELETE; END IF;
    WHILE length(sParams)>0 LOOP
      nTmp:=instr(sParams,',');
      sTmp:=substr(sParams,1,nTmp-1);
      sParams:=substr(sParams,nTmp+1);
      tParams(nParInd):=to_number(sTmp);
      nParInd:=nParInd+1;
    END LOOP;
    -- Список Ф.И.О. врачей
    IF tParams.COUNT=1 THEN sVrachs:='Консультирующий врач:'; ELSE sVrachs:='Консультирующие врачи:'; END IF;
    FOR nParInd IN 0..tParams.COUNT-1 LOOP
      sVrachs:=sVrachs||'<br>'||get_VrachFIO(tParams(nParInd));
    END LOOP;
  END;
--------------------------------------------------------------------------------
-- Возвращает возраст по пациэнту ----------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION get_pacage(nID IN NUMBER, DateNow IN DATE)
  RETURN VARCHAR2 IS
    sTmp VARCHAR2(4000);
  BEGIN
    FOR c IN (SELECT trunc(MONTHS_BETWEEN (DateNow, fd_rojd) / 12) AS fn_age
             FROM ((SELECT fk_id, fd_rojd FROM tkarta)
                    UNION
                    (SELECT fk_id, fd_rojd FROM tambulance)) T
             WHERE fk_id=nID) LOOP
      sTmp:=to_char(c.fn_age);
    END LOOP;
    SELECT NVL(sTmp,'N/A') INTO sTmp FROM dual;
    RETURN sTmp;
  END;
--------------------------------------------------------------------------------
-- Возвращает Ф.И.О. по пациэнту -----------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION get_pacFIO(nID IN NUMBER)
  RETURN VARCHAR2 IS
    sTmp VARCHAR2(4000);
  BEGIN
    FOR c IN (SELECT fc_fam||' '||decode(substr(fc_im,0,1), NULL, '', substr(fc_im,0,1)||'. ')||decode(substr(fc_otch,0,1), NULL, '', substr(fc_otch,0,1)||'. ') AS fc_name
             FROM ((SELECT fk_id, fc_fam, fc_im, fc_otch FROM tkarta)
                    UNION
                    (SELECT fk_id, fc_fam, fc_im, fc_otch FROM tambulance)) T
             WHERE fk_id=nID) LOOP
      sTmp:=c.fc_name;
    END LOOP;
    SELECT NVL(sTmp,'N/A') INTO sTmp FROM dual;
    RETURN sTmp;
  END;
--------------------------------------------------------------------------------
-- Возвращает номер ИБ и дату ИБ по пациэнту -----------------------------------
--------------------------------------------------------------------------------
  FUNCTION get_pacIB(nID IN NUMBER)
  RETURN VARCHAR2 IS
    sTmp VARCHAR2(4000);
  BEGIN
    FOR c IN (SELECT to_char(fk_ibid)||'/'||to_char(fk_iby) AS fn_ib
             FROM ((SELECT fk_id, fk_ibid, fk_iby FROM tkarta)
                    UNION
                    (SELECT fk_id, fk_ibid, fk_iby FROM tambulance)) T
             WHERE fk_id=nID) LOOP
      sTmp:=c.fn_ib;
    END LOOP;
    SELECT NVL(sTmp,'N/A') INTO sTmp FROM dual;
    RETURN sTmp;
  END;
----------------------------------------------------------------------------------------------------------
-- Разбивает большой текст на HTML ячейки, в связи с ограничением в Excell на размер текста в одной ячейке
----------------------------------------------------------------------------------------------------------
FUNCTION GET_CONCATTROW(pSource IN VARCHAR2, nCnt OUT NUMBER)
RETURN VARCHAR2 IS
  Result  VARCHAR2(32767);
  sSource VARCHAR2(32767);
  nAmt    NUMBER;
  nTmp    NUMBER;
  nOldTmp NUMBER;
BEGIN
-- Определяем позицию последней точки - после нее и будем переносить
  sSource:=' ';
  nAmt:=0;
  nTmp:=0;
  nOldTmp:=0;
  nCnt:=0;
  LOOP
    nTmp:=instr(pSource,'.',nTmp+1);
    IF nTmp-nAmt>1000 THEN
      sSource:=sSource||' <tr>'||CR;
      sSource:=sSource||'  <td align=left valign=top style=''border-bottom:none; border-top:none''><b>'||substr(pSource,nAmt+1,nOldTmp-nAmt)||'</b></td>'||CR;
      sSource:=sSource||' </tr>'||CR;
      nAmt:=nOldTmp;
      nOldTmp:=nTmp;
      nCnt:=nCnt+1;
    ELSIF (nTmp=0) OR (nTmp IS NULL) THEN
      sSource:=sSource||' <tr>'||CR;
      sSource:=sSource||'  <td align=left valign=top style=''border-top:none''><b>'||substr(pSource,nAmt+1,length(pSource)-nAmt)||'</b></td>'||CR;
      sSource:=sSource||' </tr>'||CR;
      nCnt:=nCnt+1;
      EXIT;
    ELSE
      nOldTmp:=nTmp;
    END IF;
  END LOOP;
-- Конец определения завершающей точки
  Result:=sSource;
  RETURN(Result);
END;
--------------------------------------------------------------------------------
-- Возвращает одну строку журнала ----------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION get_consrow(pFK_VRACHID IN NUMBER)
  RETURN CLOB IS

  CURSOR cConsult IS SELECT * FROM (SELECT treskons.fk_pacid, treskons.fd_ins, treskons.fc_res, treskons.fk_nazid, treskons.fk_vrachid, tsmid.fc_name FROM treskons, tsmid
                                     WHERE treskons.fk_vrachid=pFK_VRACHID
                                       AND treskons.fd_ins BETWEEN Date1 AND Date2
                                       AND treskons.fk_sos=get_vipnaz
                                       AND treskons.fk_smid=tsmid.fk_id
                                    UNION
                                    SELECT tresis.fk_pacid, tresis.fd_ins, tresis.fc_res, tresis.fk_nazid, tresis.fk_vrachid, tsmid.fc_name FROM tresis, tsmid
                                     WHERE tresis.fk_vrachid=pFK_VRACHID
                                       AND tresis.fd_ins BETWEEN Date1 AND Date2
                                       AND tresis.fk_sos=get_vipnaz
                                       AND tresis.fk_smid=tsmid.fk_id)
                                    ORDER BY fd_ins;
    sRes VARCHAR2(32767);
    cRes CLOB;
    nCnt NUMBER;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(cRes, TRUE, DBMS_LOB.SESSION);
    DBMS_LOB.WRITE(cRes, 1, 1, ' ');
    FOR C IN cConsult LOOP
      nAcc:=nAcc+1;
      sRes:=' <tr>'||CR;
      sRes:=sRes||'  <td width=5% rowspan=:rspan valign=top align=center><b>'||to_char(nAcc)||'</b></td>'||CR;
      sRes:=sRes||'  <td align=left style=''border-bottom:none''>Дата консультации: <b>'||to_char(C.fd_ins, 'DD.MM.YYYY')||'</b></td>'||CR;
      sRes:=sRes||' </tr>'||CR;
      sRes:=sRes||' <tr>'||CR;
      sRes:=sRes||'  <td align=left style=''border-bottom:none; border-top:none''>Назначение: <b>'||C.fc_name||'</b></td>'||CR;
      sRes:=sRes||' </tr>'||CR;
      sRes:=sRes||' <tr>'||CR;
      sRes:=sRes||'  <td align=left style=''border-bottom:none; border-top:none''>Ф.И.О. врача выполнившего: <b>'||get_vrachfio(c.fk_vrachid)||'</b></td>'||CR;
      sRes:=sRes||' </tr>'||CR;
      sRes:=sRes||' <tr>'||CR;
      sRes:=sRes||'  <td align=left style=''border-bottom:none; border-top:none''>Ф.И.О. больного: <b>'||get_pacfio(c.fk_pacid)||'</b></td>'||CR;
      sRes:=sRes||' </tr>'||CR;
      sRes:=sRes||' <tr>'||CR;
      sRes:=sRes||'  <td align=left style=''border-bottom:none; border-top:none''>Возраст: <b>'||get_pacage(c.fk_pacid, c.fd_ins)||'</b></td>'||CR;
      sRes:=sRes||' </tr>'||CR;
      sRes:=sRes||' <tr>'||CR;
      sRes:=sRes||'  <td align=left style=''border-bottom:none; border-top:none''>Номер И.Б.: <b>'||get_pacib(c.fk_pacid)||'</b></td>'||CR;
      sRes:=sRes||' </tr>'||CR;
      sRes:=sRes||' <tr>'||CR;
      sRes:=sRes||'  <td align=left style=''border-bottom:none; border-top:none''>Ф.И.О. лечащего врача: <b>'||get_vrachfio(get_pacvrach(c.fk_pacid))||'</b></td>'||CR;
      sRes:=sRes||' </tr>'||CR;
      sRes:=sRes||' <tr>'||CR;
      sRes:=sRes||'  <td align=left style=''border-bottom:none; border-top:none''>Диагноз, поставленный лечащим врачом: <b>'||do_diagbytype(c.fk_pacid,2,1)||'</b></td>'||CR;
      sRes:=sRes||' </tr>'||CR;
      sRes:=sRes||' <tr>'||CR;
      sRes:=sRes||'  <td align=left style=''border-bottom:none; border-top:none''>Диагноз, поставленный специалистом: <b>'||do_diagbytype(c.fk_pacid,4,1,c.fk_nazid)||'</b></td>'||CR;
      sRes:=sRes||' </tr>'||CR;
      sRes:=sRes||' <tr>'||CR;
      sRes:=sRes||'  <td align=left style=''border-bottom:none; border-top:none''>Рекомендации специалиста:</td>'||CR;
      sRes:=sRes||' </tr>'||CR;
      sRes:=sRes||get_concattrow(c.fc_res, nCnt);
      sRes:=REPLACE(sRes,':rspan',to_char(10+nCnt));
      DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sRes), sRes);
    END LOOP;
    RETURN cRes;
  END;

--------------------------------------------------------------------------------
-- Main ------------------------------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION GET_CONSULTREP(pFD1 IN DATE,pFD2 IN DATE, pParams VARCHAR2)
  RETURN CLOB
  IS
    sReport CLOB;
    sTmp    VARCHAR2(32767);
  BEGIN
    DBMS_LOB.CREATETEMPORARY(sReport, TRUE, DBMS_LOB.SESSION);
    Date1:=to_date(to_char(pFD1,'DD.MM.YYYY')||' 00.00.00','DD.MM.YYYY HH24.MI.SS'); -- на начало суток
    Date2:=to_date(to_char(pFD2,'DD.MM.YYYY')||' 23.59.59','DD.MM.YYYY HH24.MI.SS'); -- на конец суток
    SELECT MAX(fc_remark) INTO nAcc FROM tnazkons;
    sParams:=pParams;
    do_loadparams;
    sTmp:=sHeader;
    sTmp:=REPLACE(sTmp, ':pFD1', TO_CHAR(Date1, 'DD.MM.YYYY'));
    sTmp:=REPLACE(sTmp, ':pFD2', TO_CHAR(Date2, 'DD.MM.YYYY'));
    sTmp:=REPLACE(sTmp, ':vrachs', sVrachs);
    dbms_lob.WRITE(sReport, length(sTmp), 1, sTmp);
    FOR nParInd IN 0..tParams.COUNT-1 LOOP
      DBMS_LOB.APPEND(sReport, get_consrow(tParams(nParInd)));
    END LOOP;
    sTmp:='</table></body></html>';
    dbms_lob.writeappend(sReport, LENGTH(sTmp), sTmp);
    RETURN sReport;
  END;
END;
/

SHOW ERRORS;


