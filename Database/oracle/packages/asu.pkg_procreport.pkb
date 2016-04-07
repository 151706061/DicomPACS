DROP PACKAGE BODY ASU.PKG_PROCREPORT
/

--
-- PKG_PROCREPORT  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_PROCREPORT" IS
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- NEBARY (Create 08.10.2002)                                                                                                                                                         -
--        (Modify 13.05.2003)                                                                                                                                                         -
-- Возвращает CLOB - отчет по процедурам в HTML                                                                                                                                       -
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  TYPE DateTable IS TABLE OF DATE INDEX BY BINARY_INTEGER;

  CURSOR cKabSotrProc IS SELECT t.*, LEVEL FROM tkabsotrproc t
    WHERE fl_showrep=1
    START WITH fk_id IN (1,2,3)
    CONNECT BY PRIOR fk_id=fk_owner;

  CR        VARCHAR2(2):=CHR(13)||CHR(10);
  ZagrTable OKabZagr_Table;
  SmidTable OKabZagr_Table;

  bChilds   BOOLEAN;
  bDaysOnly BOOLEAN;
  DatesCnt  NUMBER;
  nChildAge NUMBER; -- Возраст ребенка
  sChild    VARCHAR2(50);
  nDaysCnt  NUMBER;
  DateBegin DateTable;
  DateEnd   DateTable;

  nProgressMax     NUMBER;          -- Количество итераций
  nProgressPos     NUMBER;          -- Текущая итерация
  sProgressName    VARCHAR2(32767); -- Название трубки "ProgressBar"
  sProgressCancel  VARCHAR2(32767); -- Название трубки "Cancel"

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Все функции для работы ProgressBar -------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  PROCEDURE SET_PROGRESSVAL IS
    nTmp NUMBER;
  BEGIN
    DBMS_PIPE.PURGE(sProgressName);
    DBMS_PIPE.PACK_MESSAGE(nProgressMax);
    DBMS_PIPE.PACK_MESSAGE(nProgressPos);
    nTmp:=DBMS_PIPE.SEND_MESSAGE(sProgressName);
  END;
  FUNCTION GET_PROGRESSMAX(pProgressName IN VARCHAR2) RETURN NUMBER IS
    nRes NUMBER;
    nTmp NUMBER;
    sTmp VARCHAR2(4000);
  BEGIN
    nTmp:=DBMS_PIPE.RECEIVE_MESSAGE(pProgressName,0);
    IF nTmp=0 THEN
      DBMS_PIPE.UNPACK_MESSAGE(nRes);
      DBMS_PIPE.UNPACK_MESSAGE(nTmp);
    END IF;
    RETURN nRes;
  END;
  FUNCTION GET_PROGRESSPOS(pProgressName IN VARCHAR2) RETURN NUMBER IS
    nRes NUMBER;
    nTmp NUMBER;
  BEGIN
    nTmp:=DBMS_PIPE.RECEIVE_MESSAGE(pProgressName,0);
    IF nTmp=0 THEN
      DBMS_PIPE.UNPACK_MESSAGE(nTmp);
      DBMS_PIPE.UNPACK_MESSAGE(nRes);
    END IF;
    RETURN nRes;
  END;
  PROCEDURE CANCEL_REPORT(pProgressCancel IN VARCHAR2)
  IS
    nTmp NUMBER;
  BEGIN
    DBMS_PIPE.PURGE(pProgressCancel);
    DBMS_PIPE.PACK_MESSAGE(-2000); --Признак Cancel
    nTmp:=DBMS_PIPE.SEND_MESSAGE(pProgressCancel);
  END;
  FUNCTION IS_CANCEL RETURN BOOLEAN IS
    nRes NUMBER;
  BEGIN
    nRes:=DBMS_PIPE.RECEIVE_MESSAGE(sProgressCancel,0);
    IF nRes=0 THEN
      DBMS_PIPE.UNPACK_MESSAGE(nRes);
      DBMS_PIPE.RESET_BUFFER;
    END IF;
    IF nRes=-2000 THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
  END;
  FUNCTION GET_NOREPORT RETURN CLOB IS
    cRes CLOB;
  BEGIN
    DBMS_LOB.CREATETEMPORARY(cRes, TRUE, DBMS_LOB.SESSION);
    DBMS_LOB.WRITE(cRes,9,1,'NO_REPORT');
    RETURN cRes;
  END;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Вспомогательные функции                                                                                                                                                            -
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Правильно преобразует Float в String
  FUNCTION get_rightpercent(pPercent IN NUMBER) RETURN VARCHAR2 IS
    sRes VARCHAR2(10);
    nPos NUMBER;
  BEGIN
    sRes:=REPLACE(to_char(trunc(pPercent,2)), ',', '.');
    nPos:=instr(sRes,'.');
    IF nPos=1 THEN sRes:='0'||sRes; END IF;
    RETURN sRes;
  END;

-- Возвращает название месяца из периода
  FUNCTION get_monthname(pDate IN VARCHAR2) RETURN VARCHAR2 IS
    sRes VARCHAR2(10);
  BEGIN
    SELECT decode(substr(pDate,4,2),'01','Январь','02','Февраль','03','Март','04','Апрель','05','Май','06','Июнь',
                        '07','Июль','08','Август','09','Сентябрь','10','Октябрь','11','Ноябрь','12','Декабрь') INTO sRes FROM dual;
    RETURN sRes||CR||substr(pDate,7,4);
  END;

-- Возвращает количество детей
  FUNCTION get_childscount(nOwnerID IN NUMBER) RETURN NUMBER IS
    CURSOR cCount IS SELECT COUNT(*) FROM tkabsotrproc
                     START WITH FK_OWNER=nOwnerID
                     CONNECT BY PRIOR FK_ID=FK_OWNER;
    nRes NUMBER;
  BEGIN
    OPEN cCount; FETCH cCount INTO nRes; CLOSE cCount;
    RETURN nRes;
  END;

-- Удаляет дерево из таблицы
  PROCEDURE do_deletetree(pID IN NUMBER) IS
  BEGIN
    DELETE FROM tkabsotrproc WHERE fk_id IN (SELECT fk_id FROM tkabsotrproc
                                             START WITH fk_id=pID
                                             CONNECT BY PRIOR fk_id=fk_owner);
  END;

-- Копирует ветку в указанный адрес
  PROCEDURE do_copytree(pSrcID IN NUMBER, pDestID IN NUMBER) IS
    CURSOR ccOne IS SELECT * FROM tkabsotrproc WHERE fk_id=pSrcID;
    CURSOR ccAll IS SELECT * FROM tkabsotrproc WHERE fk_owner=pSrcID;
    nTmp   NUMBER;
    nOwner NUMBER;
  BEGIN
    FOR c IN ccOne LOOP
      INSERT INTO tkabsotrproc(fc_name, fk_smid, fk_sotrid, fk_kabinetid, fk_owner)
             VALUES(c.fc_name, c.fk_smid, c.fk_sotrid, c.fk_kabinetid, pDestID)
             RETURNING fk_id INTO nOwner;
    END LOOP;
    FOR c IN ccAll LOOP
      IF (get_childscount(c.fk_id)<>0) THEN
        do_copytree(c.fk_id, nOwner);
      ELSE
      INSERT INTO tkabsotrproc(fc_name, fk_smid, fk_sotrid, fk_kabinetid, fk_owner)
             VALUES(c.fc_name, c.fk_smid, c.fk_sotrid, c.fk_kabinetid, nOwner);
      END IF;
    END LOOP;
  END;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Возвращает УЕТ на данный SMID ------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  FUNCTION get_uet(pSMID IN NUMBER, bDoChilds IN BOOLEAN) RETURN NUMBER IS
    nRes NUMBER;
    nTmp NUMBER;
  BEGIN
    nRes:=0;
    IF bDoChilds THEN
      SELECT NVL(fn_edchild,0) INTO nTmp FROM tsmid
        WHERE fk_id=pSMID;
    ELSE
      SELECT NVL(fn_ed,0) INTO nTmp FROM tsmid
        WHERE fk_id=pSMID;
    END IF;
    nRes:=nRes+nTmp;
    RETURN nRes;
  END;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Возвращает норму на данного кабинет-исполнит-назначения ----------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  FUNCTION get_normproc(pID IN NUMBER) RETURN NUMBER IS
    CURSOR cNorm IS SELECT fk_kabinetid, fk_sotrid, fk_smid FROM tkabsotrproc
      WHERE fk_kabinetid IS NOT NULL
      AND fk_sotrid IS NOT NULL
      AND fk_smid IS NOT NULL
      START WITH fk_id=pID
      CONNECT BY PRIOR fk_id=fk_owner;
    nRes NUMBER;
    nTmp NUMBER;
  BEGIN
    nRes:=0;
    FOR c IN cNorm LOOP
      SELECT nvl(fn_normproc,0) INTO nTmp FROM tnazvrach
        WHERE fk_kabinetid=c.fk_kabinetid
        AND fk_sotrid=c.fk_sotrid
        AND fk_smid=c.fk_smid;
      nRes:=nRes+nTmp;
    END LOOP;
    RETURN nRes*nDaysCnt;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN RETURN 0;
  END;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Создает дерево на основе данных из таблицы tnazvrach -------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  PROCEDURE do_createtreefromtnazvrach IS
    CURSOR cKabinets(pType VARCHAR2) IS SELECT DISTINCT fk_kabinetid FROM tnazvrach
      WHERE get_smidtype(fk_smid)=pType;
    CURSOR cSotrs(pKabinetID NUMBER, pType VARCHAR2) IS SELECT DISTINCT fk_sotrid FROM tnazvrach
      WHERE fk_kabinetid=pKabinetID
      AND get_smidtype(fk_smid)=pType;
    CURSOR cProc(pKabinetID NUMBER, pSotrID NUMBER, pType VARCHAR2) IS SELECT fk_smid FROM tnazvrach
      WHERE fk_kabinetid=pKabinetID
      AND fk_sotrid=pSotrID
      AND get_smidtype(fk_smid)=pType;
    CURSOR cProcName(pSMID NUMBER) IS SELECT fc_name FROM tsmid WHERE fk_id=pSMID;
    nOwn  NUMBER;
    nKab  NUMBER;
    nSotr NUMBER;
    cTmp  VARCHAR2(32767);
    sType VARCHAR2(4);
  BEGIN
    DELETE FROM tkabsotrproc WHERE fl_main=1 AND fk_id<>0;
    FOR I IN 1..3 LOOP
      IF I=1 THEN sType:='proc'; ELSIF I=2 THEN sType:='kons'; ELSE sType:='issl'; END IF;
      INSERT INTO tkabsotrproc(fc_name, fk_owner, fl_main) VALUES(sType, 0, 1) RETURNING fk_id INTO nOwn;
      FOR c1 IN cKabinets(sType) LOOP
        INSERT INTO tkabsotrproc(fc_name, fk_kabinetid, fk_owner, fl_main) VALUES(get_kabname(c1.fk_kabinetid), c1.fk_kabinetid, nOwn, 1) RETURNING fk_id INTO nKab;
        FOR c2 IN cSotrs(c1.fk_kabinetid, sType) LOOP
          INSERT INTO tkabsotrproc(fc_name, fk_sotrid, fk_kabinetid, fk_owner, fl_main) VALUES(do_vrachfio(c2.fk_sotrid), c2.fk_sotrid, c1.fk_kabinetid, nKab, 1) RETURNING fk_id INTO nSotr;
          FOR c3 IN cProc(c1.fk_kabinetid, c2.fk_sotrid, sType) LOOP
            OPEN cProcName(c3.fk_smid); FETCH cProcName INTO cTmp; CLOSE cProcName;
            INSERT INTO tkabsotrproc(fc_name, fk_smid, fk_sotrid, fk_kabinetid, fk_owner, fl_main) VALUES(cTmp, c3.fk_smid, c2.fk_sotrid, c1.fk_kabinetid, nSotr, 1);
          END LOOP;
        END LOOP;
      END LOOP;
    END LOOP;
    COMMIT;
  END;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Получение предварительного просмотра -----------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  FUNCTION get_preview(pChilds IN NUMBER) RETURN CLOB IS
    cRes CLOB;
    sTmp VARCHAR2(32767);
  BEGIN
    dbms_lob.createtemporary(cRes, TRUE, dbms_lob.session);
    sTmp:=
      '<html><head>'||CR||
      '<meta http-equiv=Content-Type content="text/html; charset=windows-1251">'||CR||
      '<title></title></head>'||CR||
      '<body>'||CR||
      '<table style=''font-family: Courier'' width=100% border=1 cellspacing=0 cellpadding=0>'||CR;
    DBMS_LOB.WRITE(cRes, length(sTmp), 1, sTmp);
    FOR c IN cKabSotrProc LOOP
      IF c.LEVEL=1 THEN
        sTmp:=' <tr style=''background:black;color:white;font:bold''>'||CR;
      ELSIF c.LEVEL=2 THEN
        sTmp:=' <tr style=''background:buttonface;font:bold''>'||CR;
      ELSIF c.LEVEL=3 THEN
        sTmp:=' <tr style=''background:#2598D6;color:white;font:bold''>'||CR;
      ELSIF c.LEVEL=4 THEN
        sTmp:=' <tr style=''font:bold;''>'||CR;
      ELSE
        sTmp:=' <tr>'||CR;
      END IF;
      dbms_lob.writeappend(cRes, length(sTmp), sTmp);
      SELECT decode(c.LEVEL, 2, '  '||c.fc_name, 3, '    '||c.fc_name, 4, '      '||c.fc_name, 5, '        '||c.fc_name, c.fc_name) INTO sTmp FROM dual;
      sTmp:=REPLACE(sTmp,'Консультация "','');
      sTmp:=REPLACE(sTmp,'Исследование "','');
      sTmp:=REPLACE(sTmp,'Анализ "','');
      sTmp:=REPLACE(sTmp,'Процедура "','');
      sTmp:=REPLACE(sTmp,'"','');
      sTmp:='  <td valign=top align=left><p>'||REPLACE(sTmp,' ',' ')||'</p></td>'||CR;
      sTmp:=sTmp||' </tr>'||CR;
      dbms_lob.writeappend(cRes, length(sTmp), sTmp);
      IF pChilds=1 THEN
        sTmp:=' <tr style=''font-size:10px''>'||CR;
        sTmp:=sTmp||'  <td valign=top align=left><p>          Взрослых</p></td>'||CR;
        sTmp:=sTmp||' </tr>'||CR;
        sTmp:=sTmp||' <tr style=''font-size:10px''>'||CR;
        sTmp:=sTmp||'  <td valign=top align=left><p>          '||sChild||'</p></td>'||CR;
        sTmp:=sTmp||' </tr>'||CR;
        dbms_lob.writeappend(cRes, length(sTmp), sTmp);
      END IF;
    END LOOP;
    sTmp:='</table></body></html>';
    dbms_lob.writeappend(cRes, length(sTmp), sTmp);
    RETURN cRes;
  END;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Подготовить необходимое для отчета -------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  PROCEDURE do_prepare(pDates IN VARCHAR2) IS
    CURSOR cProc IS SELECT fk_id, fk_smid, fk_vrachid, fd_ins, 1 AS fp_what, get_pacageonvyb(fk_pacid) AS fn_age
           FROM treslech
           WHERE fd_ins BETWEEN DateBegin(1) AND DateEnd(DatesCnt)
           AND fk_sos=get_vypnazsosid
           AND fk_smid IN (SELECT fk_smid FROM tkabsotrproc
                           START WITH fk_id=1
                           CONNECT BY PRIOR fk_id=fk_owner);
    CURSOR cKons IS SELECT fk_id, fk_smid, fk_vrachid, fd_ins, 2 AS fp_what, get_pacageonvyb(fk_pacid) AS fn_age
           FROM treskons
           WHERE fd_ins BETWEEN DateBegin(1) AND DateEnd(DatesCnt)
           AND fk_sos=get_vypnazsosid
           AND fk_smid IN (SELECT fk_smid FROM tkabsotrproc
                           START WITH fk_id=2
                           CONNECT BY PRIOR fk_id=fk_owner);
    CURSOR cIssl IS SELECT fk_id, fk_smid, fk_vrachid, fd_ins, 3 AS fp_what, get_pacageonvyb(fk_pacid) AS fn_age
           FROM tresis
           WHERE fd_ins BETWEEN DateBegin(1) AND DateEnd(DatesCnt)
           AND fk_sos=get_vypnazsosid
           AND fk_smid IN (SELECT fk_smid FROM tkabsotrproc
                           START WITH fk_id=3
                           CONNECT BY PRIOR fk_id=fk_owner);
    CURSOR cSMID IS SELECT fn_what, fk_smid, fk_sotrid FROM tkabsotrproc
           WHERE fk_owner=-2;
    nCount BINARY_INTEGER;
    I      BINARY_INTEGER;
    J      NUMBER;
  BEGIN
    SELECT fn_2, 'Детей '||fc_name INTO nChildAge, sChild FROM tvozr WHERE fk_id=1;

    IF bDaysOnly THEN
      DatesCnt:=TRUNC(LENGTH(pDates)/11);
    ELSE
      DatesCnt:=TRUNC(LENGTH(pDates)/22);
    END IF;
    nDaysCnt:=0;

    IF bDaysOnly THEN
      FOR J IN 1..DatesCnt LOOP
        nDaysCnt:=DatesCnt;
        DateBegin(J):=TO_DATE(SUBSTR(pDates,INSTR(pDates,';',1,J)+1,10)||' 00.00.00','DD.MM.YYYY HH24.MI.SS'); -- на начало суток
        DateEnd(J):=TO_DATE(SUBSTR(pDates,INSTR(pDates,';',1,J)+1,10)||' 23.59.59','DD.MM.YYYY HH24.MI.SS'); -- на конец суток
      END LOOP;
    ELSE
      FOR J IN 1..DatesCnt LOOP
        nDaysCnt:=nDaysCnt+(TO_DATE(SUBSTR(pDates,INSTR(pDates,'-',1,J)+1,10),'DD.MM.YYYY')-TO_DATE(SUBSTR(pDates,INSTR(pDates,';',1,J)+1,10),'DD.MM.YYYY')+1);
        DateBegin(J):=TO_DATE(SUBSTR(pDates,INSTR(pDates,';',1,J)+1,10)||' 00.00.00','DD.MM.YYYY HH24.MI.SS'); -- на начало суток
        DateEnd(J):=TO_DATE(SUBSTR(pDates,INSTR(pDates,'-',1,J)+1,10)||' 23.59.59','DD.MM.YYYY HH24.MI.SS'); -- на конец суток
      END LOOP;
    END IF;

    nCount:=1;
    FOR C1 IN cProc LOOP
      IF nCount=1 THEN
        ZagrTable:=OKabZagr_Table(OKabZagr(c1.fk_id, c1.fk_smid, c1.fk_vrachid, c1.fd_ins, c1.fp_what, c1.fn_age));
      ELSE
        ZagrTable.EXTEND; ZagrTable(nCount):=OKabZagr(c1.fk_id, c1.fk_smid, c1.fk_vrachid, c1.fd_ins, c1.fp_what, c1.fn_age);
      END IF;
      nCount:=nCount+1;
    END LOOP;
    FOR C2 IN cKons LOOP
      IF nCount=1 THEN
        ZagrTable:=OKabZagr_Table(OKabZagr(c2.fk_id, c2.fk_smid, c2.fk_vrachid, c2.fd_ins, c2.fp_what, c2.fn_age));
      ELSE
        ZagrTable.EXTEND; ZagrTable(nCount):=OKabZagr(c2.fk_id, c2.fk_smid, c2.fk_vrachid, c2.fd_ins, c2.fp_what, c2.fn_age);
      END IF;
      nCount:=nCount+1;
    END LOOP;
    FOR C3 IN cIssl LOOP
      IF nCount=1 THEN
        ZagrTable:=OKabZagr_Table(OKabZagr(c3.fk_id, c3.fk_smid, c3.fk_vrachid, c3.fd_ins, c3.fp_what, c3.fn_age));
      ELSE
        ZagrTable.EXTEND; ZagrTable(nCount):=OKabZagr(c3.fk_id, c3.fk_smid, c3.fk_vrachid, c3.fd_ins, c3.fp_what, c3.fn_age);
      END IF;
      nCount:=nCount+1;
    END LOOP;

    nCount:=1;
    FOR C IN cSMID LOOP
      IF nCount=1 THEN
        SmidTable:=OKabZagr_Table(OKabZagr(c.fn_what, c.fk_smid, c.fk_sotrid, NULL, NULL, NULL));
      ELSE
        SmidTable.EXTEND; SmidTable(nCount):=OKabZagr(c.fn_what, c.fk_smid, c.fk_sotrid, NULL, NULL, NULL);
      END IF;
      nCount:=nCount+1;
    END LOOP;
  END;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Нагрузка на врача/на врача * УЕТ ---------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  FUNCTION get_nagr(pVrachID IN NUMBER, DatesNum IN NUMBER, pStart IN NUMBER, pEnd IN NUMBER) RETURN NUMBER IS
    CURSOR cNagr IS SELECT COUNT(tkarta.fk_id) FROM tkarta, tperesel, tvrach, tsotr
      WHERE tvrach.fk_pacid = tkarta.fk_id
      AND tvrach.fl_vid = 'M'
      AND tperesel.fk_pacid=tkarta.fk_id
      AND DateBegin(DatesNum) BETWEEN tperesel.fd_data1 AND tperesel.fd_data2
      AND DateEnd(DatesNum) BETWEEN tperesel.fd_data1 AND tperesel.fd_data2
      AND tvrach.fk_vrachid=pVrachiD
      AND tsotr.fp_vrach = 1
      AND tsotr.fk_id = tvrach.fk_vrachid
      AND get_pacageonvyb(tkarta.fk_id) BETWEEN pStart AND pEnd;
    nRes NUMBER;
  BEGIN
    OPEN cNagr; FETCH cNagr INTO nRes; CLOSE cNagr;
    RETURN nRes;
  END;

  FUNCTION get_nagrUET(pID IN NUMBER, DatesNum IN NUMBER, pStart IN NUMBER, pEnd IN NUMBER) RETURN NUMBER IS
    CURSOR cNorm IS SELECT fk_sotrid, fk_smid FROM tkabsotrproc
      WHERE fk_kabinetid IS NOT NULL
      AND fk_sotrid IS NOT NULL
      AND fk_smid IS NOT NULL
      START WITH fk_id=pID
      CONNECT BY PRIOR fk_id=fk_owner;
    CURSOR cNagr(pVrachID IN NUMBER) IS SELECT COUNT(tkarta.fk_id) FROM tkarta, tperesel, tvrach, tsotr
      WHERE tvrach.fk_pacid = tkarta.fk_id
      AND tvrach.fl_vid = 'M'
      AND tperesel.fk_pacid=tkarta.fk_id
      AND DateBegin(DatesNum) BETWEEN tperesel.fd_data1 AND tperesel.fd_data2
      AND DateEnd(DatesNum) BETWEEN tperesel.fd_data1 AND tperesel.fd_data2
      AND tvrach.fk_vrachid=pVrachiD
      AND tsotr.fp_vrach = 1
      AND tsotr.fk_id = tvrach.fk_vrachid
      AND get_pacageonvyb(tkarta.fk_id) BETWEEN pStart AND pEnd;
    nRes NUMBER;
  BEGIN
    FOR C IN cNorm LOOP
      OPEN cNagr(C.fk_sotrid); FETCH cNagr INTO nRes; CLOSE cNagr;
      IF pEnd=nChildAge THEN
        nRes:=nRes*get_uet(C.fk_smid, TRUE);
      ELSE
        nRes:=nRes*get_uet(C.fk_smid, FALSE);
      END IF;
    END LOOP;
    RETURN nRes;
  END;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Наименования трубок ----------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  PROCEDURE GET_PIPENAMES(pProgressName OUT VARCHAR2, pProgressCancel OUT VARCHAR2)
  IS
  BEGIN
    sProgressName:=dbms_pipe.unique_session_name||'_PROGRESS';
    sProgressCancel:=dbms_pipe.unique_session_name||'_CANCEL';
    pProgressName:=sProgressName;
    pProgressCancel:=sProgressCancel;
  END;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Main -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  FUNCTION get_report(pDates IN VARCHAR2, pChilds IN NUMBER, pDaysOnly IN NUMBER) RETURN CLOB IS
    CURSOR cKabSotrProc IS SELECT t.*, LEVEL FROM tkabsotrproc t
           WHERE fl_showrep=1
           START WITH fk_id IN (1,2,3)
           CONNECT BY PRIOR fk_id=fk_owner;
    cRes  CLOB;
    sTmp  VARCHAR2(32767);
    nTmp  NUMBER;
    nWhat NUMBER;
    nCnt  NUMBER;
    nSum  NUMBER;
    nNorm NUMBER;
  BEGIN
    IF pChilds=1 THEN bChilds:=TRUE; ELSE bChilds:=FALSE; END IF;
    IF pDaysOnly=1 THEN bDaysOnly:=TRUE; ELSE bDaysOnly:=FALSE; END IF;
    get_pipenames(sTmp,sTmp);
    do_prepare(pDates);

    -- Заголовок
    DBMS_LOB.CREATETEMPORARY(cRes, TRUE, DBMS_LOB.SESSION);
    sTmp:=
      '<html><head>'||CR||
      '<meta http-equiv=Content-Type content="text/html; charset=windows-1251">'||CR||
      '<title></title></head>'||CR||
      '<body>'||CR||
      '<table style=''font-family: Courier; border:none'' width=100% border=1 cellspacing=0 cellpadding=0>'||CR;
    DBMS_LOB.WRITE(cRes, LENGTH(sTmp), 1, sTmp);
    sTmp:=' <tr style=''border:none;font:bold''>'||CR;
    sTmp:=sTmp||'  <td colspan='||TO_CHAR(1+DatesCnt+3)||'><p>Отчет по загрузке кабинетов</p></td>'||CR;
    sTmp:=sTmp||' </tr>'||CR;
    DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
    sTmp:=' <tr style=''font:bold;background:buttonface''>'||CR;
    sTmp:=sTmp||'  <td align=center valign=center rowspan=2><p>НАИМЕНОВАНИЕ</p></td>'||CR;
    sTmp:=sTmp||'  <td align=center valign=center colspan='||TO_CHAR(DatesCnt)||'><p>фактическая нагрузка</p></td>'||CR;
    sTmp:=sTmp||'  <td align=center valign=center rowspan=2><p>Итого</p></td>'||CR;
    sTmp:=sTmp||'  <td align=center valign=center rowspan=2><p>Норма</p></td>'||CR;
    sTmp:=sTmp||'  <td align=center valign=center rowspan=2><p>Нагрузка %</p></td>'||CR;
    sTmp:=sTmp||' </tr>'||CR;
    DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);

    -- Перечень периодов в заголовке
    sTmp:=' <tr style=''font:bold;background:black;color:white''>'||CR;
    FOR nTmp IN 1..DatesCnt LOOP
      IF bDaysOnly THEN
        sTmp:=sTmp||'  <td align=center valign=center><p>'||SUBSTR(pDates,INSTR(pDates,';',1,nTmp)+1,5)||'<br>'||SUBSTR(pDates,INSTR(pDates,';',1,nTmp)+7,4)||'</p></td>'||CR;
      ELSE
        sTmp:=sTmp||'  <td align=center valign=center><p>'||get_monthname(SUBSTR(pDates,INSTR(pDates,';',1,nTmp)+1,21))||'</p></td>'||CR;
      END IF;
    END LOOP;
    sTmp:=sTmp||' </tr>'||CR;
    DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);

    -- Нумерация
    sTmp:=' <tr style=''font:bold''>'||CR;
    FOR nTmp IN 1..DatesCnt+4 LOOP
      sTmp:=sTmp||'  <td align=center valign=center><p>'||TO_CHAR(nTmp)||'</p></td>'||CR;
    END LOOP;
    sTmp:=sTmp||' </tr>'||CR;
    DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);

    -- ProgressBar
    SELECT COUNT(*) INTO nProgressMax FROM tkabsotrproc
      WHERE fl_showrep=1
      START WITH fk_id IN (1,2,3)
      CONNECT BY PRIOR fk_id=fk_owner;
    nProgressPos:=0;
    set_progressval;

    -- Тело отчета
    FOR c IN cKabSotrProc LOOP
      nProgressPos:=nProgressPos+1;
      set_progressval;
      IF is_cancel THEN RETURN get_noreport; END IF;

      -- ::LEVEL:: 1-(Процедура, Консультация, Исследование), 2-Группа, 3-Верхний уровень самих назначений (обычно кабинеты)

      --Первая колонка
      IF c.LEVEL=1 THEN
        sTmp:=' <tr style=''background:black;color:white;font:bold''>'||CR;
        nWhat:=c.fk_id;
      ELSIF c.LEVEL=2 THEN
        sTmp:=' <tr style=''background:buttonface;font:bold''>'||CR;
      ELSIF c.LEVEL=3 THEN
        sTmp:=' <tr style=''background:#2598D6;color:white;font:bold''>'||CR;
      ELSIF c.LEVEL=4 THEN
        sTmp:=' <tr style=''font:bold''>'||CR;
      ELSE
        sTmp:=' <tr>'||CR;
      END IF;

      DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
      IF (c.LEVEL=4) AND (nWhat=2) THEN
        -- Перед именем врача поставим надпись "Консультация"
        sTmp:='      '||'Консультация '||c.fc_name;
      ELSE
        SELECT DECODE(c.LEVEL, 2, '  '||c.fc_name, 3, '    '||c.fc_name, 4, '      '||c.fc_name, 5, '        '||c.fc_name, c.fc_name) INTO sTmp FROM DUAL;
      END IF;

      -- Цифры отчета
      IF (c.LEVEL=3) AND (nWhat=2) THEN -- Прием
        sTmp:='  <td valign=top align=left><p>'||REPLACE(sTmp||' Прием',' ',' ')||'</p></td>'||CR;
        nSum:=0;
        DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
        FOR nTmp IN 1..DatesCnt LOOP
          nCnt:=get_nagr(c.fk_sotrid, nTmp, 0, 2000);
          SELECT '  <td valign=top align=left><p>'||DECODE(nCnt,0,' ',TO_CHAR(nCnt))||'</p></td>'||CR INTO sTmp FROM DUAL;
          nSum:=nSum+nCnt;
          DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
        END LOOP;
        SELECT '  <td valign=top align=left><p>'||DECODE(nSum,0,' ',TO_CHAR(nSum))||'</p></td>'||CR INTO sTmp FROM DUAL;
        sTmp:=sTmp||'  <td valign=top align=left><p> </p></td>'||CR;
        sTmp:=sTmp||'  <td valign=top align=left><p> </p></td>'||CR;
        sTmp:=sTmp||' </tr>'||CR;
        DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
        -- Разбиение прима по детям
        IF bChilds THEN
          --Первая колонка приема
          sTmp:=' <tr style=''font-size:10px''>'||CR;
          sTmp:=sTmp||'  <td valign=top align=left><p>          Взрослых</p></td>'||CR;
          DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
          --Цифры отчета приема для взрослых
          nSum:=0;
          FOR nTmp IN 1..DatesCnt LOOP
            nCnt:=get_nagr(c.fk_sotrid, nTmp, 0, nChildAge);
            SELECT '  <td valign=top align=left><p>'||decode(nCnt,0,' ',to_char(nCnt))||'</p></td>'||CR INTO sTmp FROM dual;
            nSum:=nSum+nCnt;
            DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
          END LOOP;
          SELECT '  <td valign=top align=left><p>'||decode(nSum,0,' ',to_char(nSum))||'</p></td>'||CR INTO sTmp FROM dual;
          sTmp:=sTmp||'  <td valign=top align=left><p> </p></td>'||CR;
          sTmp:=sTmp||'  <td valign=top align=left><p> </p></td>'||CR;
          sTmp:=sTmp||' </tr>'||CR;
          DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
          sTmp:=' <tr style=''font-size:10px''>'||CR;
          sTmp:=sTmp||'  <td valign=top align=left><p>          '||sChild||'</p></td>'||CR;
          DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
          --Цифры отчета приема для детей
          nSum:=0;
          FOR nTmp IN 1..DatesCnt LOOP
            nCnt:=get_nagr(c.fk_sotrid, nTmp, nChildAge+0.01, 2000);
            SELECT '  <td valign=top align=left><p>'||decode(nCnt,0,' ',to_char(nCnt))||'</p></td>'||CR INTO sTmp FROM dual;
            nSum:=nSum+nCnt;
            DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
          END LOOP;
          SELECT '  <td valign=top align=left><p>'||decode(nSum,0,' ',to_char(nSum))||'</p></td>'||CR INTO sTmp FROM dual;
          sTmp:=sTmp||'  <td valign=top align=left><p> </p></td>'||CR;
          sTmp:=sTmp||'  <td valign=top align=left><p> </p></td>'||CR;
          sTmp:=sTmp||' </tr>'||CR;
          DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
        END IF;
      ELSE -- Все остальные помимо приема
        sTmp:='  <td valign=top align=left><p>'||REPLACE(sTmp,' ',' ')||'</p></td>'||CR;
        nSum:=0;
        DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
        FOR nTmp IN 1..DatesCnt LOOP
          SELECT COUNT(T.fk_id) INTO nCnt FROM TABLE(CAST(ZagrTable AS OKabZagr_Table)) T, TABLE(CAST(SmidTable AS OKabZagr_Table)) S
           WHERE T.fp_what=nWhat
             AND S.fk_id=c.fk_id
             AND T.fk_smid=S.fk_smid
             AND T.fd_date BETWEEN DateBegin(nTmp) AND DateEnd(nTmp)
             AND T.fk_sotrid=S.fk_sotrid;
          SELECT '  <td valign=top align=left><p>'||DECODE(nCnt,0,' ',TO_CHAR(nCnt))||'</p></td>'||CR INTO sTmp FROM DUAL;
          nSum:=nSum+nCnt;
          DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
        END LOOP;
        SELECT '  <td valign=top align=left><p>'||decode(nSum,0,' ',to_char(nSum))||'</p></td>'||CR INTO sTmp FROM dual;
        nNorm:=get_normproc(c.fk_id);
        IF nNorm=0 THEN
          sTmp:=sTmp||'  <td valign=top align=left><p> </p></td>'||CR;
          sTmp:=sTmp||'  <td valign=top align=left><p> </p></td>'||CR;
        ELSE
          sTmp:=sTmp||'  <td valign=top align=left><p>'||to_char(nNorm)||'</p></td>'||CR;
          sTmp:=sTmp||'  <td valign=top align=left><p>'||get_rightpercent((nSum/nNorm)*100)||'</p></td>'||CR;
        END IF;
        sTmp:=sTmp||' </tr>'||CR;
        DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
        -- Разбиение по детям
        IF bChilds THEN
          --Первая колонка
          sTmp:=' <tr style=''font-size:10px''>'||CR;
          sTmp:=sTmp||'  <td valign=top align=left><p>          Взрослых</p></td>'||CR;
          DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
          --Цифры отчета для взрослых
          nSum:=0;
          FOR nTmp IN 1..DatesCnt LOOP
          SELECT COUNT(T.fk_id) INTO nCnt FROM TABLE(CAST(ZagrTable AS OKabZagr_Table)) T, TABLE(CAST(SmidTable AS OKabZagr_Table)) S
           WHERE T.fp_what=nWhat
             AND S.fk_id=c.fk_id
             AND T.fn_age>nChildAge
             AND T.fk_smid=S.fk_smid
             AND T.fd_date BETWEEN DateBegin(nTmp) AND DateEnd(nTmp)
             AND T.fk_sotrid=S.fk_sotrid;
            SELECT '  <td valign=top align=left><p>'||decode(nCnt,0,' ',to_char(nCnt))||'</p></td>'||CR INTO sTmp FROM dual;
            nSum:=nSum+nCnt;
            DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
          END LOOP;
          SELECT '  <td valign=top align=left><p>'||decode(nSum,0,' ',to_char(nSum))||'</p></td>'||CR INTO sTmp FROM dual;
          nNorm:=get_normproc(c.fk_id);
          IF nNorm=0 THEN
            sTmp:=sTmp||'  <td valign=top align=left><p> </p></td>'||CR;
            sTmp:=sTmp||'  <td valign=top align=left><p> </p></td>'||CR;
          ELSE
            sTmp:=sTmp||'  <td valign=top align=left><p>'||to_char(nNorm)||'</p></td>'||CR;
            sTmp:=sTmp||'  <td valign=top align=left><p>'||get_rightpercent((nSum/nNorm)*100)||'</p></td>'||CR;
          END IF;
          sTmp:=sTmp||' </tr>'||CR;
          DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
          sTmp:=' <tr style=''font-size:10px''>'||CR;
          sTmp:=sTmp||'  <td valign=top align=left><p>          '||sChild||'</p></td>'||CR;
          DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
          --Цифры отчета для детей
          nSum:=0;
          FOR nTmp IN 1..DatesCnt LOOP
          SELECT COUNT(T.fk_id) INTO nCnt FROM TABLE(CAST(ZagrTable AS OKabZagr_Table)) T, TABLE(CAST(SmidTable AS OKabZagr_Table)) S
           WHERE T.fp_what=nWhat
             AND S.fk_id=c.fk_id
             AND T.fn_age<=nChildAge
             AND T.fk_smid=S.fk_smid
             AND T.fd_date BETWEEN DateBegin(nTmp) AND DateEnd(nTmp)
             AND T.fk_sotrid=S.fk_sotrid;
            SELECT '  <td valign=top align=left><p>'||decode(nCnt,0,' ',to_char(nCnt))||'</p></td>'||CR INTO sTmp FROM dual;
            nSum:=nSum+nCnt;
            DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
          END LOOP;
          SELECT '  <td valign=top align=left><p>'||decode(nSum,0,' ',to_char(nSum))||'</p></td>'||CR INTO sTmp FROM dual;
          nNorm:=get_normproc(c.fk_id);
          IF nNorm=0 THEN
            sTmp:=sTmp||'  <td valign=top align=left><p> </p></td>'||CR;
            sTmp:=sTmp||'  <td valign=top align=left><p> </p></td>'||CR;
          ELSE
            sTmp:=sTmp||'  <td valign=top align=left><p>'||to_char(nNorm)||'</p></td>'||CR;
            sTmp:=sTmp||'  <td valign=top align=left><p>'||get_rightpercent((nSum/nNorm)*100)||'</p></td>'||CR;
          END IF;
          sTmp:=sTmp||' </tr>'||CR;
          DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
        END IF;
      END IF;
    END LOOP;

    --Конец всему
    sTmp:='</table></body></html>';
    DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
    IF ZagrTable IS NOT NULL THEN ZagrTable.DELETE; END IF;
    RETURN cRes;
  END;

--------------------------------------------------------------------------------
-- Main ------------------------------------------------------------------------
--------------------------------------------------------------------------------
  FUNCTION get_report_uet(pDates IN VARCHAR2, pChilds IN NUMBER, pDaysOnly IN NUMBER) RETURN CLOB IS
    CURSOR cKabSotrProc IS SELECT t.*, LEVEL FROM tkabsotrproc t
           WHERE fl_showrep=1
           START WITH fk_id IN (1,2,3)
           CONNECT BY PRIOR fk_id=fk_owner;
    cRes    CLOB;
    sTmp    VARCHAR2(32767);
    nTmp    NUMBER;
    nWhat   NUMBER;
    nCnt    NUMBER;
    nSum    NUMBER;
    nCntUET NUMBER;
    nSumUET NUMBER;
    nNorm   NUMBER;
  BEGIN
    IF is_cancel THEN NULL; END IF;
    IF pChilds=1 THEN bChilds:=TRUE; ELSE bChilds:=FALSE; END IF;
    IF pDaysOnly=1 THEN bDaysOnly:=TRUE; ELSE bDaysOnly:=FALSE; END IF;
    get_pipenames(sTmp,sTmp);
    do_prepare(pDates);

    --Заголовок
    DBMS_LOB.CREATETEMPORARY(cRes, TRUE, DBMS_LOB.SESSION);
    sTmp:=
      '<html><head>'||CR||
      '<meta http-equiv=Content-Type content="text/html; charset=windows-1251">'||CR||
      '<title></title></head>'||CR||
      '<body>'||CR||
      '<table style=''font-family: Courier; border:none'' width=100% border=1 cellspacing=0 cellpadding=0>'||CR;
    DBMS_LOB.WRITE(cRes, LENGTH(sTmp), 1, sTmp);
    sTmp:=' <tr style=''border:none;font:bold''>'||CR;
    sTmp:=sTmp||'  <td colspan='||TO_CHAR(1+DatesCnt*2+3)||'><p>Отчет по загрузке кабинетов</p></td>'||CR;
    sTmp:=sTmp||' </tr>'||CR;
    DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
    sTmp:=' <tr style=''font:bold;background:buttonface''>'||CR;
    sTmp:=sTmp||'  <td align=center valign=center rowspan=3><p>НАИМЕНОВАНИЕ</p></td>'||CR;
    sTmp:=sTmp||'  <td align=center valign=center colspan='||TO_CHAR(DatesCnt*2)||'><p>фактическая нагрузка</p></td>'||CR;
    sTmp:=sTmp||'  <td align=center valign=center rowspan=3><p>Итого</p></td>'||CR;
    sTmp:=sTmp||'  <td align=center valign=center rowspan=3><p>Норма</p></td>'||CR;
    sTmp:=sTmp||'  <td align=center valign=center rowspan=3><p>Нагрузка %</p></td>'||CR;
    sTmp:=sTmp||' </tr>'||CR;
    DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
    --Перечень периодов в заголовке
    sTmp:=' <tr style=''font:bold;background:black;color:white''>'||CR;
    FOR nTmp IN 1..DatesCnt LOOP
      IF bDaysOnly THEN
        sTmp:=sTmp||'  <td align=center valign=center colspan="2"><p>'||substr(pDates,instr(pDates,';',1,nTmp)+1,5)||'<br>'||substr(pDates,instr(pDates,';',1,nTmp)+7,4)||'</p></td>'||CR;
      ELSE
        sTmp:=sTmp||'  <td align=center valign=center colspan="2"><p>'||get_monthname(substr(pDates,instr(pDates,';',1,nTmp)+1,21))||'</p></td>'||CR;
      END IF;
    END LOOP;
    sTmp:=sTmp||' </tr>'||CR;
    dbms_lob.writeappend(cRes, length(sTmp), sTmp);
    --Перечисление - чел/УЕТ
    sTmp:=' <tr style=''font:bold''>'||CR;
    FOR nTmp IN 1..DatesCnt LOOP
      sTmp:='  <td align=center valign=center><p>Чел.</p></td>'||CR;
      sTmp:=sTmp||'  <td align=center valign=center><p>УЕТ</p></td>'||CR;
    DBMS_LOB.WRITEAPPEND(cRes, length(sTmp), sTmp);
    END LOOP;
    sTmp:=' </tr>'||CR;
    DBMS_LOB.WRITEAPPEND(cRes, length(sTmp), sTmp);
    --Нумерация
    sTmp:=' <tr style=''font:bold''>'||CR;
    FOR nTmp IN 1..DatesCnt*2+4 LOOP
      sTmp:=sTmp||'  <td align=center valign=center><p>'||to_char(nTmp)||'</p></td>'||CR;
    END LOOP;
    sTmp:=sTmp||' </tr>'||CR;
    dbms_lob.writeappend(cRes, length(sTmp), sTmp);

    --Основное тело отчета
    SELECT COUNT(*) INTO nProgressMax FROM tkabsotrproc
      WHERE fl_showrep=1
      START WITH fk_id IN (1,2,3)
      CONNECT BY PRIOR fk_id=fk_owner;
    nProgressPos:=0;
    set_progressval;
    FOR c IN cKabSotrProc LOOP
      nProgressPos:=nProgressPos+1;
      set_progressval;
      IF is_cancel THEN RETURN get_noreport; END IF;
      --Первая колонка
      IF c.LEVEL=1 THEN
        sTmp:=' <tr style=''background:black;color:white;font:bold''>'||CR;
        nWhat:=c.fk_id;
      ELSIF c.LEVEL=2 THEN
        sTmp:=' <tr style=''background:buttonface;font:bold''>'||CR;
      ELSIF c.LEVEL=3 THEN
        sTmp:=' <tr style=''background:#2598D6;color:white;font:bold''>'||CR;
      ELSIF c.LEVEL=4 THEN
        sTmp:=' <tr style=''font:bold''>'||CR;
      ELSE
        sTmp:=' <tr>'||CR;
      END IF;
      DBMS_LOB.WRITEAPPEND(cRes, length(sTmp), sTmp);
      IF (c.LEVEL=4) AND (nWhat=2) THEN
        sTmp:='      '||'Консультация '||c.fc_name;
      ELSE
        SELECT DECODE(c.LEVEL, 2, '  '||c.fc_name, 3, '    '||c.fc_name, 4, '      '||c.fc_name, 5, '        '||c.fc_name, c.fc_name) INTO sTmp FROM dual;
      END IF;
      --Цифры отчета
      IF (c.LEVEL=3) AND (nWhat=2) THEN
        sTmp:='  <td valign=top align=left><p>'||REPLACE(sTmp||' Прием',' ',' ')||'</p></td>'||CR;
        nSum:=0;
        DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
        FOR nTmp IN 1..DatesCnt LOOP
          nCnt:=get_nagr(c.fk_sotrid, nTmp, 0, 2000);
          SELECT '  <td valign=top align=left><p>'||decode(nCnt,0,' ',to_char(nCnt))||'</p></td>'||CR INTO sTmp FROM DUAL;
          nSum:=nSum+nCnt;
          nCntUET:=get_nagrUET(c.fk_id, nTmp, 0, nChildAge)+get_nagrUET(c.fk_id, nTmp, nChildAge+0.01, 2000);
          SELECT sTmp||'  <td valign=top align=left><p>'||decode(nCntUET,0,' ',to_char(nCntUET))||'</p></td>'||CR INTO sTmp FROM DUAL;
          nSumUET:=nSumUET+nCntUET;
          DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
        END LOOP;
        SELECT '  <td valign=top align=left><p>'||decode(nSum,0,' ',to_char(nSum))||'</p></td>'||CR INTO sTmp FROM dual;
        sTmp:=sTmp||'  <td valign=top align=left><p> </p></td>'||CR;
        sTmp:=sTmp||'  <td valign=top align=left><p> </p></td>'||CR;
        sTmp:=sTmp||' </tr>'||CR;
        DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
        -- Разбиение по детям
        IF bChilds THEN
          --Первая колонка
          sTmp:=' <tr style=''font-size:10px''>'||CR;
          sTmp:=sTmp||'  <td valign=top align=left><p>          Взрослых</p></td>'||CR;
          DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
          --Цифры отчета для детей
          nSum:=0;
          nSumUET:=0;
          FOR nTmp IN 1..DatesCnt LOOP
            nCnt:=get_nagr(c.fk_sotrid, nTmp, 0, nChildAge);
            SELECT '  <td valign=top align=left><p>'||decode(nCnt,0,' ',to_char(nCnt))||'</p></td>'||CR INTO sTmp FROM dual;
            nSum:=nSum+nCnt;
            nCntUET:=get_nagrUET(c.fk_id, nTmp, 0, nChildAge);
            SELECT sTmp||'  <td valign=top align=left><p>'||decode(nCntUET,0,' ',to_char(nCntUET))||'</p></td>'||CR INTO sTmp FROM dual;
            nSumUET:=nSumUET+nCntUET;
            DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
          END LOOP;
          SELECT '  <td valign=top align=left><p>'||decode(nSum,0,' ',to_char(nSum))||'</p></td>'||CR INTO sTmp FROM dual;
          sTmp:=sTmp||'  <td valign=top align=left><p> </p></td>'||CR;
          sTmp:=sTmp||'  <td valign=top align=left><p> </p></td>'||CR;
          sTmp:=sTmp||' </tr>'||CR;
          DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
          sTmp:=' <tr style=''font-size:10px''>'||CR;
          sTmp:=sTmp||'  <td valign=top align=left><p>          '||sChild||'</p></td>'||CR;
          DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
          --Цифры отчета для взрослых
          nSum:=0;
          FOR nTmp IN 1..DatesCnt LOOP
            nCnt:=get_nagr(c.fk_sotrid, nTmp, nChildAge+0.01, 2000);
            SELECT '  <td valign=top align=left><p>'||decode(nCnt,0,' ',to_char(nCnt))||'</p></td>'||CR INTO sTmp FROM dual;
            nSum:=nSum+nCnt;
            nCntUET:=get_nagrUET(c.fk_id, nTmp, nChildAge+0.01, 2000);
            SELECT sTmp||'  <td valign=top align=left><p>'||decode(nCntUET,0,' ',to_char(nCntUET))||'</p></td>'||CR INTO sTmp FROM dual;
            nSumUET:=nSumUET+nCntUET;
            DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
          END LOOP;
          SELECT '  <td valign=top align=left><p>'||decode(nSum,0,' ',to_char(nSum))||'</p></td>'||CR INTO sTmp FROM dual;
          sTmp:=sTmp||'  <td valign=top align=left><p> </p></td>'||CR;
          sTmp:=sTmp||'  <td valign=top align=left><p> </p></td>'||CR;
          sTmp:=sTmp||' </tr>'||CR;
          DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
        END IF;
      ELSE
        sTmp:='  <td valign=top align=left><p>'||REPLACE(sTmp,' ',' ')||'</p></td>'||CR;
        nSum:=0;
        DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
        FOR nTmp IN 1..DatesCnt LOOP
          SELECT COUNT(T.fk_id) INTO nCnt FROM TABLE(CAST(ZagrTable AS OKabZagr_Table)) T, TABLE(CAST(SmidTable AS OKabZagr_Table)) S
           WHERE T.fp_what=nWhat
             AND S.fk_id=c.fk_id
             AND T.fk_smid=S.fk_smid
             AND T.fd_date BETWEEN DateBegin(nTmp) AND DateEnd(nTmp)
             AND T.fk_sotrid=S.fk_sotrid;
          SELECT '  <td valign=top align=left><p>'||decode(nCnt,0,' ',to_char(nCnt))||'</p></td>'||CR INTO sTmp FROM dual;
          nSum:=nSum+nCnt;

          nCntUET:=0;
          FOR C2 IN (SELECT T.fk_smid, COUNT(T.fk_id) AS fn_count FROM TABLE(CAST(ZagrTable AS OKabZagr_Table)) T, TABLE(CAST(SmidTable AS OKabZagr_Table)) S
                      WHERE T.fp_what=nWhat
                        AND S.fk_id=c.fk_id
                        AND T.fn_age>nChildAge
                        AND T.fk_smid=S.fk_smid
                        AND T.fd_date BETWEEN DateBegin(nTmp) AND DateEnd(nTmp)
                        AND T.fk_sotrid=S.fk_sotrid
                      GROUP BY T.fk_smid) LOOP
            nCntUET:=nCntUET+get_uet(C2.fk_smid, FALSE)*C2.fn_count;
          END LOOP;
          FOR C2 IN (SELECT T.fk_smid, COUNT(T.fk_id) AS fn_count FROM TABLE(CAST(ZagrTable AS OKabZagr_Table)) T, TABLE(CAST(SmidTable AS OKabZagr_Table)) S
                      WHERE T.fp_what=nWhat
                        AND S.fk_id=c.fk_id
                        AND T.fn_age<=nChildAge
                        AND T.fk_smid=S.fk_smid
                        AND T.fd_date BETWEEN DateBegin(nTmp) AND DateEnd(nTmp)
                        AND T.fk_sotrid=S.fk_sotrid
                      GROUP BY T.fk_smid) LOOP
            nCntUET:=nCntUET+get_uet(C2.fk_smid, TRUE)*C2.fn_count;
          END LOOP;
          SELECT sTmp||'  <td valign=top align=left><p>'||decode(nCntUET,0,' ',to_char(nCntUET))||'</p></td>'||CR INTO sTmp FROM dual;
          nSumUET:=nSumUET+nCntUET;
          DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
        END LOOP;
        SELECT '  <td valign=top align=left><p>'||decode(nSum,0,' ',to_char(nSum))||'</p></td>'||CR INTO sTmp FROM dual;
        nNorm:=get_normproc(c.fk_id);
        IF nNorm=0 THEN
          sTmp:=sTmp||'  <td valign=top align=left><p> </p></td>'||CR;
          sTmp:=sTmp||'  <td valign=top align=left><p> </p></td>'||CR;
        ELSE
          sTmp:=sTmp||'  <td valign=top align=left><p>'||to_char(nNorm)||'</p></td>'||CR;
          sTmp:=sTmp||'  <td valign=top align=left><p>'||get_rightpercent((nSum/nNorm)*100)||'</p></td>'||CR;
        END IF;
        sTmp:=sTmp||' </tr>'||CR;
        DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
        -- Разбиение по детям
        IF bChilds THEN
          --Первая колонка
          sTmp:=' <tr style=''font-size:10px''>'||CR;
          sTmp:=sTmp||'  <td valign=top align=left><p>          Взрослых</p></td>'||CR;
          DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
          --Цифры отчета для взрослых
          nSum:=0;
          FOR nTmp IN 1..DatesCnt LOOP
            SELECT COUNT(T.fk_id) INTO nCnt FROM TABLE(CAST(ZagrTable AS OKabZagr_Table)) T, TABLE(CAST(SmidTable AS OKabZagr_Table)) S
             WHERE T.fp_what=nWhat
               AND S.fk_id=c.fk_id
               AND T.fn_age>nChildAge
               AND T.fk_smid=S.fk_smid
               AND T.fd_date BETWEEN DateBegin(nTmp) AND DateEnd(nTmp)
               AND T.fk_sotrid=S.fk_sotrid;
            SELECT '  <td valign=top align=left><p>'||decode(nCnt,0,' ',to_char(nCnt))||'</p></td>'||CR INTO sTmp FROM dual;
            nSum:=nSum+nCnt;
            nCntUET:=0;
            FOR C2 IN (SELECT T.fk_smid, COUNT(T.fk_id) AS fn_count FROM TABLE(CAST(ZagrTable AS OKabZagr_Table)) T, TABLE(CAST(SmidTable AS OKabZagr_Table)) S
                        WHERE T.fp_what=nWhat
                          AND S.fk_id=c.fk_id
                          AND T.fn_age>nChildAge
                          AND T.fk_smid=S.fk_smid
                          AND T.fd_date BETWEEN DateBegin(nTmp) AND DateEnd(nTmp)
                          AND T.fk_sotrid=S.fk_sotrid
                        GROUP BY T.fk_smid) LOOP
              nCntUET:=nCntUET+get_uet(C2.fk_smid, FALSE)*C2.fn_count;
            END LOOP;
            SELECT sTmp||'  <td valign=top align=left><p>'||decode(nCntUET,0,' ',to_char(nCntUET))||'</p></td>'||CR INTO sTmp FROM dual;
            nSumUET:=nSumUET+nCntUET;
            DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
          END LOOP;
          SELECT '  <td valign=top align=left><p>'||decode(nSum,0,' ',to_char(nSum))||'</p></td>'||CR INTO sTmp FROM dual;
          nNorm:=get_normproc(c.fk_id);
          IF nNorm=0 THEN
            sTmp:=sTmp||'  <td valign=top align=left><p> </p></td>'||CR;
            sTmp:=sTmp||'  <td valign=top align=left><p> </p></td>'||CR;
          ELSE
            sTmp:=sTmp||'  <td valign=top align=left><p>'||to_char(nNorm)||'</p></td>'||CR;
            sTmp:=sTmp||'  <td valign=top align=left><p>'||get_rightpercent((nSum/nNorm)*100)||'</p></td>'||CR;
          END IF;
          sTmp:=sTmp||' </tr>'||CR;
          DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
          sTmp:=' <tr style=''font-size:10px''>'||CR;
          sTmp:=sTmp||'  <td valign=top align=left><p>          '||sChild||'</p></td>'||CR;
          DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
          --Цифры отчета для детей
          nSum:=0;
          FOR nTmp IN 1..DatesCnt LOOP
            SELECT COUNT(T.fk_id) INTO nCnt FROM TABLE(CAST(ZagrTable AS OKabZagr_Table)) T, TABLE(CAST(SmidTable AS OKabZagr_Table)) S
             WHERE T.fp_what=nWhat
               AND S.fk_id=c.fk_id
               AND T.fn_age<=nChildAge
               AND T.fk_smid=S.fk_smid
               AND T.fd_date BETWEEN DateBegin(nTmp) AND DateEnd(nTmp)
               AND T.fk_sotrid=S.fk_sotrid;
            SELECT '  <td valign=top align=left><p>'||decode(nCnt,0,' ',to_char(nCnt))||'</p></td>'||CR INTO sTmp FROM dual;
            nSum:=nSum+nCnt;
            nCntUET:=0;
            FOR C2 IN (SELECT T.fk_smid, COUNT(T.fk_id) AS fn_count FROM TABLE(CAST(ZagrTable AS OKabZagr_Table)) T, TABLE(CAST(SmidTable AS OKabZagr_Table)) S
                        WHERE T.fp_what=nWhat
                          AND S.fk_id=c.fk_id
                          AND T.fn_age<=nChildAge
                          AND T.fk_smid=S.fk_smid
                          AND T.fd_date BETWEEN DateBegin(nTmp) AND DateEnd(nTmp)
                          AND T.fk_sotrid=S.fk_sotrid
                        GROUP BY T.fk_smid) LOOP
              nCntUET:=nCntUET+get_uet(C2.fk_smid, TRUE)*C2.fn_count;
            END LOOP;
            SELECT sTmp||'  <td valign=top align=left><p>'||decode(nCntUET,0,' ',to_char(nCntUET))||'</p></td>'||CR INTO sTmp FROM dual;
            nSumUET:=nSumUET+nCntUET;
            DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
          END LOOP;
          SELECT '  <td valign=top align=left><p>'||decode(nSum,0,' ',to_char(nSum))||'</p></td>'||CR INTO sTmp FROM dual;
          nNorm:=get_normproc(c.fk_id);
          IF nNorm=0 THEN
            sTmp:=sTmp||'  <td valign=top align=left><p> </p></td>'||CR;
            sTmp:=sTmp||'  <td valign=top align=left><p> </p></td>'||CR;
          ELSE
            sTmp:=sTmp||'  <td valign=top align=left><p>'||to_char(nNorm)||'</p></td>'||CR;
            sTmp:=sTmp||'  <td valign=top align=left><p>'||get_rightpercent((nSum/nNorm)*100)||'</p></td>'||CR;
          END IF;
          sTmp:=sTmp||' </tr>'||CR;
          DBMS_LOB.WRITEAPPEND(cRes, LENGTH(sTmp), sTmp);
        END IF;
      END IF;
    END LOOP;
    --Конец всему
    sTmp:='</table></body></html>';
    dbms_lob.writeappend(cRes, length(sTmp), sTmp);
    IF ZagrTable IS NOT NULL THEN ZagrTable.DELETE; END IF;
    IF SmidTable IS NOT NULL THEN SmidTable.DELETE; END IF;
    RETURN cRes;
  END;
END;
/

SHOW ERRORS;


