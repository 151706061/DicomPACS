DROP PACKAGE BODY ASU.PKG_MANAGER
/

--
-- PKG_MANAGER  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_MANAGER" IS
-- Mikrom      22.02.2001
   PROCEDURE DO_DEL_PAC_FROM_KONS(pNAZID IN NUMBER) IS
     cursor c is
       select fk_pacid, fk_smid from tnazis where fk_id=pNAZID
       union
       select fk_pacid, fk_smid from tnazkons where fk_id=pNAZID
       union
       select fk_pacid, fk_smid from tnazan where fk_id=pNAZID;
       smid number;
       pacid number;
   BEGIN
     open c;
     fetch c into pacid, smid;
     close c;
     update vnaz set fl_more_put=0 where fk_id in (select fk_id from vnaz where fk_pacid=pacid and fk_smid=smid and fl_more_put=1 and rownum=1);
     UPDATE /*+RULE*/tnazan set fl_in_raspis=0 where fk_id=pNAZID;
     UPDATE /*+RULE*/tnazis set fl_in_raspis=0 where fk_id=pNAZID;
     UPDATE /*+RULE*/tnazkons set fl_in_raspis=0 where fk_id=pNAZID;
   END;
   PROCEDURE DO_INSERT_PAC_KONS(pNAZID IN NUMBER, pDATETIME IN DATE) IS
   BEGIN
     UPDATE /*+RULE*/tnazan set fd_run=pDATETIME, fl_in_raspis=1 where fk_id=pNAZID;
     UPDATE /*+RULE*/tnazis set fd_run=pDATETIME, fl_in_raspis=1 where fk_id=pNAZID;
     UPDATE /*+RULE*/tnazkons set fd_run=pDATETIME, fl_in_raspis=1 where fk_id=pNAZID;
   END;
FUNCTION GET_NAZPROC_COUNT_IB(pID IN NUMBER) RETURN NUMBER IS
  tmp NUMBER:=0.0;
  CURSOR C1(pFKID NUMBER) IS SELECT /*+RULE*/ TIB.FN_NUM FROM TIB, TSMID WHERE TIB.FK_PACID=pFKID AND TIB.FK_SMID=TSMID.FK_ID and TSMID.FK_LOINC_CODE='-1';
BEGIN
  OPEN C1(pID);
  FETCH C1 INTO tmp;
  CLOSE C1;
  IF tmp=0 THEN
    tmp:=1;
  END IF;
  RETURN tmp;
END;
FUNCTION GET_NAZPROC_MASK(pID IN NUMBER) RETURN VARCHAR2 IS
  tmp VARCHAR2(100):='';
  CURSOR C1(pFKID NUMBER) IS SELECT FK_LOINC_CODE FROM TIB, TSMID WHERE TIB.FK_PACID=pFKID AND TIB.FK_SMID=TSMID.FK_ID
                             AND FK_LOINC_CODE<>'-1' AND NOT FK_LOINC_CODE IS NULL;
BEGIN
  OPEN C1(pID);
  FETCH C1 INTO tmp;
  IF C1%NOTFOUND THEN
    CLOSE C1;
    RETURN '1';
  END IF;
  CLOSE C1;
  RETURN tmp;
END;
PROCEDURE INSERT_SOMEPROC(pSMID IN NUMBER, pPACID IN NUMBER, pNAZID IN NUMBER, pSOSID IN NUMBER, pDAYINS IN DATE, pFK_ISPOLKABID in number default -1) IS
PRAGMA AUTONOMOUS_TRANSACTION;
  pCOUNT NUMBER:=0.0;
  pMASK VARCHAR2(100):='';
  i NUMBER:=1;
  pDATE DATE;
  pDAYNUM NUMBER:=0.0;
  pMASK_POS NUMBER:=1;
  pSUN NUMBER:=0.0;
  pIS_INS BOOLEAN;
  nISPOL_ID NUMBER:=0.0;
  CURSOR PROC_COUNT IS SELECT PKG_MANAGER.GET_NAZPROC_COUNT_IB(pNAZID) FROM DUAL;
  CURSOR PROC_MASK IS SELECT GET_NAZPROC_MASK(pNAZID) FROM DUAL;
  CURSOR NUMBER_DAY_OF_WEEK(pVAL DATE) IS SELECT TO_CHAR(pDATE, 'fmD') FROM DUAL;
  CURSOR SUNDAY_NUM IS SELECT PKG_MANAGER.GET_NUM_OF_SUNDAY FROM DUAL;
  CURSOR NAZ_ISPOL IS SELECT /*+RULE*/ FK_ISPOLID FROM TNAZLECH WHERE FK_ID=pNAZID;
BEGIN
  OPEN NAZ_ISPOL;
  FETCH NAZ_ISPOL INTO nISPOL_ID;
  CLOSE NAZ_ISPOL;
  OPEN PROC_COUNT;
  FETCH PROC_COUNT INTO pCOUNT;
  CLOSE PROC_COUNT;
  IF pCOUNT=0 OR pCOUNT<1 THEN
    RETURN;
  END IF;
  OPEN PROC_MASK;
  FETCH PROC_MASK INTO pMASK;
  CLOSE PROC_MASK;
  OPEN SUNDAY_NUM;
  FETCH SUNDAY_NUM INTO pSUN;
  CLOSE SUNDAY_NUM;
  pMASK:=TRIM(pMASK);
  IF pMASK='' OR LENGTH(pMASK)<1 OR (LENGTH(pMASK)=1 AND SUBSTR(pMASK, 1, 1)='1') THEN
    LOOP
      EXIT WHEN i>pCOUNT;
      LOOP
        pDATE:=pDAYINS+i-1;
        OPEN NUMBER_DAY_OF_WEEK(pDATE);
        FETCH NUMBER_DAY_OF_WEEK INTO pDAYNUM;
        CLOSE NUMBER_DAY_OF_WEEK;
        IF pDAYNUM<>pSUN AND pDAYNUM>0 THEN
          EXIT;
        ELSE
          i:=i+1;
          pCOUNT:=pCOUNT+1;
        END IF;
      END LOOP;
      INSERT INTO TRESLECH(FK_SMID, FD_INS, FK_PACID, FK_NAZID, FK_SOS, FK_VRACHID,FK_ISPOLKABID) VALUES (pSMID, pDATE, pPACID, pNAZID, pSOSID, nISPOL_ID,pFK_ISPOLKABID);
      COMMIT;
      i:=i+1;
    END LOOP;
  ELSIF pMASK<>'0' AND LENGTH(pMASK)>1 THEN
    i:=1;
    pMASK_POS:=1;
    LOOP
      EXIT WHEN i>pCOUNT;
      LOOP
        pDATE:=pDAYINS+i-1;
        OPEN NUMBER_DAY_OF_WEEK(pDATE);
        FETCH NUMBER_DAY_OF_WEEK INTO pDAYNUM;
        CLOSE NUMBER_DAY_OF_WEEK;
        IF pDAYNUM<>pSUN AND pDAYNUM>0 THEN
          pIS_INS:=TRUE;
          EXIT;
        ELSE
          i:=i+1;
          pCOUNT:=pCOUNT+1;
          pIS_INS:=FALSE;
        END IF;
      END LOOP;
      IF SUBSTR(pMASK, pMASK_POS, 1)<>'0' AND pIS_INS=TRUE THEN
        INSERT INTO TRESLECH(FK_SMID, FD_INS, FK_PACID, FK_NAZID, FK_SOS, FK_VRACHID, FK_ISPOLKABID) VALUES (pSMID, pDATE, pPACID, pNAZID, pSOSID, nISPOL_ID, pFK_ISPOLKABID);
        COMMIT;
        i:=i+1;
        pMASK_POS:=pMASK_POS+1;
      ELSIF pIS_INS=TRUE THEN
        i:=i+1;
        pCOUNT:=pCOUNT+1;
        pMASK_POS:=pMASK_POS+1;
      END IF;
      IF pMASK_POS>LENGTH(pMASK) THEN
        pMASK_POS:=1;
      END IF;
    END LOOP;
  ELSE
    RETURN;
  END IF;
END;


FUNCTION GET_NUM_OF_SUNDAY RETURN NUMBER IS
  tmp NUMBER:=0.0;
  CURSOR NUM_OF_DAY IS SELECT TO_CHAR(TO_DATE('04.03.2001', 'DD.MM.YYYY'),'fmD') FROM DUAL;
BEGIN
  OPEN NUM_OF_DAY;
  FETCH NUM_OF_DAY INTO tmp;
  CLOSE NUM_OF_DAY;
  RETURN tmp;
END;
FUNCTION GET_NAZPROC_SOSID(pID IN NUMBER) RETURN NUMBER IS --DEBUG
PRAGMA AUTONOMOUS_TRANSACTION;
  nPROC_DONE NUMBER:=0.0;
  nNEVIP NUMBER:=0.0;
  nVIP NUMBER:=0.0;
  nPROCESS NUMBER:=0.0;
  nPROC_COUNT NUMBER:=0.0;
  CURSOR cPROC_DONE IS SELECT /*RULE*/ COUNT(FK_ID) FROM TRESLECH WHERE FK_NAZID=pID AND FK_SOS=get_vipnaz;
  CURSOR cPROC_COUNT IS SELECT PKG_MANAGER.GET_NAZPROC_COUNT_IB(pID) FROM DUAL;
BEGIN
  SELECT get_nevip INTO nNEVIP FROM DUAL;
  SELECT get_vipnaz INTO nVIP FROM DUAL;
  SELECT get_naz_process INTO nPROCESS FROM DUAL;
  OPEN cPROC_DONE;
  FETCH cPROC_DONE INTO nPROC_DONE;
  CLOSE cPROC_DONE;
  IF nPROC_DONE=0 THEN
    RETURN nNEVIP;
  ELSE
    OPEN cPROC_COUNT;
    FETCH cPROC_COUNT INTO nPROC_COUNT;
    CLOSE cPROC_COUNT;
    IF nPROC_COUNT=nPROC_DONE THEN
      RETURN nVIP;
    ELSE
      RETURN nPROCESS;
    END IF;
  END IF;
END;
FUNCTION GET_NAZPROC_COUNT_NEVIP(pID IN NUMBER) RETURN NUMBER IS
  nCOUNT NUMBER:=0.0;
  CURSOR cNAZ_NOT_DONE IS SELECT COUNT(FK_ID) FROM TRESLECH WHERE FK_NAZID=pID AND FK_SOS=get_nevip;
BEGIN
  OPEN cNAZ_NOT_DONE;
  FETCH cNAZ_NOT_DONE INTO nCOUNT;
  CLOSE cNAZ_NOT_DONE;
  RETURN nCOUNT;
END;
FUNCTION GET_NAZPROC_COUNT_NOTINRASPIS(pID IN NUMBER) RETURN NUMBER IS
  nCOUNT NUMBER:=0.0;
  CURSOR cNAZ_NOT_IN_RASPIS IS SELECT COUNT(FK_ID) FROM TRESLECH WHERE FK_NAZID=pID AND FK_SOS=get_nevip AND FL_PATFIRST=0;
BEGIN
  OPEN cNAZ_NOT_IN_RASPIS;
  FETCH cNAZ_NOT_IN_RASPIS INTO nCOUNT;
  CLOSE cNAZ_NOT_IN_RASPIS;
  RETURN nCOUNT;
END;
PROCEDURE INSERT_PAC_PROC_IN_RASPIS(pID IN NUMBER, pPACID IN NUMBER, pNAZID IN NUMBER, pLECH_ID OUT NUMBER) IS
--PRAGMA AUTONOMOUS_TRANSACTION;
  dGRAPH_DATE DATE;
  dPROC_DATE DATE;
  nPROC_ID NUMBER:=0.0;
  nNOT_IN_RASPIS NUMBER:=0.0;
  nNazid number:=0.0;
  CURSOR cGRAPH_DATE IS SELECT /*+RULE*/ TRUNC(FD_DATE) FROM TGRAPH WHERE FK_ID=pID;
  CURSOR cPROC_ON_DATE IS SELECT /*+RULE*/ TRUNC(FD_INS), FK_ID,fk_nazid FROM TRESLECH WHERE FK_NAZID=pNAZID AND FK_SOS=get_nevip AND TRUNC(FD_INS)=TRUNC(dGRAPH_DATE) AND FL_PATFIRST=0;
  CURSOR cPROC_ANY_DATE IS SELECT /*+RULE*/ TRUNC(FD_INS), FK_ID,fk_nazid FROM TRESLECH WHERE FK_NAZID=pNAZID AND FK_SOS=get_nevip AND FL_PATFIRST=0 ORDER BY FD_INS;
  CURSOR cPAC_PROC_NOT_IN_RASPIS IS SELECT PKG_MANAGER.GET_NAZPROC_COUNT_NOTINRASPIS(pNAZID) FROM DUAL;
BEGIN
  pLECH_ID:=0;
  OPEN cGRAPH_DATE;
  FETCH cGRAPH_DATE INTO dGRAPH_DATE;
  CLOSE cGRAPH_DATE;
  OPEN cPROC_ON_DATE;
  FETCH cPROC_ON_DATE INTO dPROC_DATE, nPROC_ID,nNazid;
  IF cPROC_ON_DATE%NOTFOUND THEN
    nPROC_ID:=0;
  END IF;
  CLOSE cPROC_ON_DATE;
  IF nPROC_ID=0 THEN
    OPEN cPROC_ANY_DATE;
    FETCH cPROC_ANY_DATE INTO dPROC_DATE, nPROC_ID,nNazid;
    IF cPROC_ANY_DATE%NOTFOUND THEN
      nPROC_ID:=0;
    END IF;
    CLOSE cPROC_ANY_DATE;
  END IF;
  IF nPROC_ID=0 THEN
    RETURN;
  END IF;
  UPDATE TRESLECH /*+RULE*/ SET FL_PATFIRST=1 WHERE FK_ID=nPROC_ID;
  INSERT INTO TPACLST(FK_GRAPHID, FK_PACID,nazid) VALUES(pID, pPACID,nNazid);
  OPEN cPAC_PROC_NOT_IN_RASPIS;
  FETCH cPAC_PROC_NOT_IN_RASPIS INTO nNOT_IN_RASPIS;
  CLOSE cPAC_PROC_NOT_IN_RASPIS;
  IF nNOT_IN_RASPIS<1 THEN
    UPDATE /*+RULE*/ TNAZLECH SET FL_IN_RASPIS=1 WHERE FK_ID=pNAZID;
  ELSE
--   null;
   UPDATE /*+RULE*/ TNAZLECH SET FL_IN_RASPIS=0 WHERE FK_ID=pNAZID;
  END IF;
--  COMMIT;
  pLECH_ID:=nPROC_ID;
END;
PROCEDURE DELETE_PAC_FROM_RASPIS(pID IN NUMBER, pPACID IN NUMBER, pNAZID IN NUMBER) IS
--PRAGMA AUTONOMOUS_TRANSACTION;
  dGRAPH_DATE DATE;
  nGRAPH_ID NUMBER:=0.0;
  nPROC_ID NUMBER:=0.0;
  CURSOR cGRAPH_DATE IS SELECT /*+RULE*/ TRUNC(FD_DATE), FK_ID FROM TGRAPH WHERE FK_ID=pID;
  CURSOR cPROC_ID IS SELECT FK_ID FROM TRESLECH WHERE FK_NAZID=pNAZID AND TRUNC(FD_INS)=TRUNC(dGRAPH_DATE) /*AND FL_PATFIRST=1*/ order by FD_INS;
BEGIN
  OPEN cGRAPH_DATE;
  FETCH cGRAPH_DATE INTO dGRAPH_DATE, nGRAPH_ID;
  IF cGRAPH_DATE%NOTFOUND THEN
    nGRAPH_ID:=0;
  END IF;
  CLOSE cGRAPH_DATE;
  IF nGRAPH_ID=0 THEN
    RETURN;
  END IF;
  OPEN cPROC_ID;
  FETCH cPROC_ID INTO nPROC_ID;
  IF cPROC_ID%NOTFOUND THEN
    nPROC_ID:=0;
  END IF;
  CLOSE cPROC_ID;
--  DELETE TPACLST WHERE FK_GRAPHID=pID AND FK_PACID=pPACID; -- Vlad
  IF nPROC_ID=0 THEN
    RETURN;
  END IF;
  UPDATE TRESLECH SET FL_PATFIRST=0 WHERE FK_ID=nproc_id;
  DELETE TPACLST WHERE FK_GRAPHID=pID AND FK_PACID=pPACID;
--  COMMIT;
END;
FUNCTION GET_PROC_SOS(pNAZID IN NUMBER, pDAYINS IN DATE) RETURN VARCHAR2 IS
  SOS_ID NUMBER:=0.0;
  NAME VARCHAR2(100):='';
  CURSOR cPROC_SOS IS SELECT FK_SOS FROM TRESLECH WHERE FK_NAZID=pNAZID AND TRUNC(FD_INS)=TRUNC(pDAYINS);
BEGIN
  OPEN cPROC_SOS;
  FETCH cPROC_SOS INTO SOS_ID;
  IF cPROC_SOS%NOTFOUND THEN
    CLOSE cPROC_SOS;
    RETURN 'Неизвестно';
  END IF;
  CLOSE cPROC_SOS;
  SELECT FC_NAME INTO NAME FROM TNAZSOS WHERE FK_ID=SOS_ID;
  RETURN NAME;
END;
FUNCTION GET_PROC_SOS_ID(pNAZID IN NUMBER, pDAYINS IN DATE) RETURN NUMBER IS
  SOS_ID NUMBER:=0.0;
  CURSOR cPROC_SOS_ID IS SELECT FK_SOS FROM TRESLECH WHERE  FK_NAZID=pNAZID AND TRUNC(FD_INS)=TRUNC(pDAYINS);
BEGIN
  OPEN cPROC_SOS_ID;
  FETCH cPROC_SOS_ID INTO SOS_ID;
  CLOSE cPROC_SOS_ID;
  RETURN SOS_ID;
END;
FUNCTION GET_PROC_COUNT_TODAY(pNAZID IN NUMBER, pDAYINS IN DATE) RETURN NUMBER IS
  nPACID NUMBER:=0.0;
  nCOUNT NUMBER:=0.0;
  CURSOR cPROC_COUNT(pPACID NUMBER) IS SELECT /*+RULE*/ COUNT(FK_ID) FROM TRESLECH WHERE FK_PACID=pPACID AND FK_NAZID=pNAZID
                                                                                          AND TRUNC(FD_INS)=TRUNC(pDAYINS);
BEGIN
  SELECT FK_PACID INTO nPACID FROM TNAZLECH WHERE FK_ID=pNAZID;
  OPEN cPROC_COUNT(nPACID);
  FETCH cPROC_COUNT INTO nCOUNT;
  CLOSE cPROC_COUNT;
  RETURN nCOUNT;
END;
FUNCTION GET_PACSEX(pID IN NUMBER) RETURN VARCHAR2 IS
  nPACSEX NUMBER;
  CURSOR cPACSEX IS SELECT /*+ rule*/ FP_SEX FROM TKARTA WHERE FK_ID=pID;
BEGIN
  OPEN cPACSEX;
  FETCH cPACSEX INTO nPACSEX;
  CLOSE cPACSEX;
  IF nPACSEX=0 THEN
    RETURN 'Ж';
  ELSIF nPACSEX=1 THEN
    RETURN 'М';
  ELSE
    RETURN 'Н';
  end if;
END;
FUNCTION IS_NOT_PACVYB(pPACID IN NUMBER) RETURN NUMBER IS
  n NUMBER:=0.0;
  CURSOR cPAC_SOS IS SELECT COUNT(FK_ID) FROM TKARTA WHERE FK_ID=pPACID AND FP_TEK_COC=2 AND FL_VYB<>1;
BEGIN
  OPEN cPAC_SOS;
  FETCH cPAC_SOS INTO n;
  CLOSE cPAC_SOS;
  RETURN n;
END;
FUNCTION GET_IS_PAC_PROC_IN_RASPIS(pID IN NUMBER) RETURN NUMBER IS
  nNAZ_ID NUMBER:=0.0;
  nRASPID NUMBER:=0.0;
  CURSOR cLECH_NAZ_ID IS SELECT /*+RULE*/ FK_NAZID FROM TRESLECH WHERE FK_ID=pID;
  CURSOR cNAZ_IN_RASPIS(pNAZID NUMBER) IS SELECT /*+RULE*/ FL_IN_RASPIS FROM TNAZLECH WHERE FK_ID=pNAZID;
BEGIN
  OPEN cLECH_NAZ_ID;
  FETCH cLECH_NAZ_ID INTO nNAZ_ID;
  CLOSE cLECH_NAZ_ID;
  OPEN cNAZ_IN_RASPIS(nNAZ_ID);
  FETCH cNAZ_IN_RASPIS INTO nRASPID;
  CLOSE cNAZ_IN_RASPIS;
  RETURN nRASPID;
END;
FUNCTION IS_PAC_BUSY_IN_PERIOD(pPACID IN NUMBER, pFK_GRAPH IN NUMBER) RETURN NUMBER IS
	dFD_DATE DATE;
	nHOUR_NOW NUMBER;
	nMIN_NOW NUMBER;
	nHOUR_NEXT NUMBER;
	nMIN_NEXT NUMBER;
	nHOUR_PREV NUMBER;
	nMIN_PREV NUMBER;
	nHOUR_PAC NUMBER;
	nMIN_PAC NUMBER;
	nLENGTH NUMBER;
  CURSOR cGRAPH_NOW IS SELECT /*+RULE*/ FD_DATE, TO_NUMBER(FT_HOUR), TO_NUMBER(FT_MIN) FROM TGRAPH WHERE fk_id=pFK_GRAPH;
	CURSOR cGRAPH_NEXT(pDATE DATE, pHOUR NUMBER, pMIN NUMBER) IS SELECT /*+RULE*/ TO_NUMBER(FT_HOUR), TO_NUMBER(FT_MIN)
	                                  FROM TGRAPH
																		WHERE FD_DATE=pDATE AND TO_NUMBER(FT_HOUR)>pHOUR AND TO_NUMBER(FT_MIN)>pMIN
																		ORDER BY FT_HOUR, FT_MIN;
	CURSOR cGRAPH_PREV(pDATE DATE, pHOUR NUMBER, pMIN NUMBER) IS SELECT /*+RULE*/ TO_NUMBER(FT_HOUR), TO_NUMBER(FT_MIN)
	                                  FROM TGRAPH
																		WHERE FD_DATE=pDATE AND TO_NUMBER(FT_HOUR)<pHOUR AND TO_NUMBER(FT_MIN)<pMIN
																		ORDER BY FT_HOUR, FT_MIN desc;
	CURSOR cPAC_NAZ(pDATE DATE) IS SELECT /*+RULE*/ PKG_MANAGER.GET_SMID_TIME_LENGTH(FK_SMID), TO_NUMBER(TO_CHAR(FD_RUN, 'HH24')), TO_NUMBER(TO_CHAR(FD_RUN, 'MI'))
																 FROM TNAZKONS
			 													 WHERE FK_PACID=pPACID AND TRUNC(FD_RUN)=TRUNC(pDATE);
BEGIN
  --Получаем данные по заданному периоду
  OPEN cGRAPH_NOW;
  	FETCH cGRAPH_NOW INTO dFD_DATE, nHOUR_NOW, nMIN_NOW;
	CLOSE cGRAPH_NOW;
	--Получаем данные по следующему от заданного периода
	OPEN cGRAPH_NEXT(dFD_DATE, nHOUR_NOW, nMIN_NOW);
	  FETCH cGRAPH_NEXT INTO nHOUR_NEXT, nMIN_NEXT;
	CLOSE cGRAPH_NEXT;
	--Получаем данные по пердидущему периоду от заданного периода
	OPEN cGRAPH_PREV(dFD_DATE, nHOUR_NOW, nMIN_NOW);
	  FETCH cGRAPH_PREV INTO nHOUR_PREV, nMIN_PREV;
	CLOSE cGRAPH_PREV;
	--Получаем информацию о назначаниеях пациента на данную дату
  OPEN cPAC_NAZ(dFD_DATE);
	  LOOP
  	  FETCH cPAC_NAZ INTO nLENGTH, nHOUR_PAC, nMIN_PAC;
			EXIT WHEN cPAC_NAZ%NOTFOUND;

		END LOOP;
  CLOSE cPAC_NAZ;
END;
FUNCTION GET_SMID_TIME_LENGTH(pSMID IN NUMBER) RETURN NUMBER IS
  t NUMBER;
	CURSOR cTIME IS SELECT /*+RULE*/ TO_NUMBER(FC_TIME) FROM TSMID WHERE FK_ID=pSMID;
BEGIN
  OPEN cTIME;
	  FETCH cTIME INTO t;
	CLOSE cTIME;
	RETURN t;
END;
   FUNCTION GET_NAZ_NOTINRASPIS(pID IN NUMBER)
      RETURN NUMBER
   IS
     CURSOR c(pID in number) IS
       select /*+RULE*/ fl_in_raspis from tnazlech where fk_id=pID
       union all
       select /*+RULE*/ fl_in_raspis from tnazan where fk_id=pID
       union all
       select /*+RULE*/ fl_in_raspis from tnazis where fk_id=pID
       union all
       select /*+RULE*/ fl_in_raspis from tnazkons where fk_id=pID;
       n NUMBER;
   BEGIN
     OPEN c(pID);
     FETCH c INTO n;
     CLOSE c;
     RETURN ABS(n-1);
   END;
   FUNCTION create_temp_graph_table (
      ppacid     IN   NUMBER,
      pgraphid   IN   NUMBER,
      pnazid     IN   NUMBER,
      ppacsex    IN   NUMBER,
      pDayC      IN   NUMBER default 30
      )
      RETURN NUMBER
   IS
      CURSOR cgraph(pID IN NUMBER)
      IS
         SELECT /*+RULE*//*+ORDERED*/ fk_id,
                fl_sex,
                fn_count - get_nazcount (fk_id),
                TO_DATE (ft_hour || ':' || ft_min, 'HH24:MI') AS ft_time,
                fd_date
           FROM tgraph
          WHERE fk_raspid = pID
            AND fd_date BETWEEN SYSDATE - 1 AND SYSDATE + pDayC
          ORDER BY fd_date, ft_time;

      CURSOR cpacnazs (pdate IN DATE, pIDNaz IN NUMBER, pIDPac IN NUMBER, pSOSID IN NUMBER)
      IS
         SELECT /*+RULE*/ fk_id,
                fk_smid,
                fd_run AS fd_time
           FROM tnazan
          WHERE fk_id <> pIDNaz
            AND fk_pacid = pIDPac
            AND fl_in_raspis = 1
            AND fk_nazsosid = pSOSID
            AND TRUNC(fd_run) = pdate
         UNION
              SELECT /*+RULE*/ fk_id,
                     fk_smid,
                     fd_run AS fd_time
                FROM tnazis
               WHERE fk_id <> pIDNaz
                 AND fk_pacid = pIDPac
                 AND fl_in_raspis = 1
                 AND fk_nazsosid = pSOSID
                AND TRUNC(fd_run) = pdate
         UNION
              SELECT /*+RULE*/ fk_id,
                     fk_smid,
                     fd_run AS fd_time
                FROM tnazkons
               WHERE fk_id <>pIDNaz
                 AND fk_pacid = pIDPac
                 AND fl_in_raspis = 1
                 AND fk_nazsosid = pSOSID
           AND TRUNC(fd_run) = pdate
         UNION
              SELECT /*+RULE*/ fk_id,
                     fk_smid,
                     fd_ins AS fd_time
                FROM treslech
               WHERE fk_pacid = pIDPac
                 AND fk_nazid <> pIDNaz
                 AND fl_patfirst = 1
                 AND fk_sos = pSOSID
               AND TRUNC(fd_ins) = pdate;
--AND fd_ins = pdate;

      CURSOR cpacnaz(pID IN NUMBER)
      IS
         SELECT /*+RULE*/ fk_smid
           FROM tnazan
          WHERE fk_id = pID
         UNION
              SELECT /*+RULE*/fk_smid
                FROM tnazis
               WHERE fk_id = pID
         UNION
              SELECT /*+RULE*/fk_smid
                FROM tnazkons
               WHERE fk_id = pID
         UNION
              SELECT /*+RULE*/fk_smid
                FROM tnazlech
               WHERE fk_id = pID;

      CURSOR cperiod (sm1 IN NUMBER, sm2 IN NUMBER)
      IS
         SELECT /*+RULE*/ fn_period, fk_id
           FROM tprotiv
          WHERE fk_smid1 = sm1
            AND fk_smid2 = sm2;
      CURSOR cnazsos IS SELECT get_nevip FROM DUAL;

--Переменные графика
      pid                NUMBER;
      pfl_sex            NUMBER;
      pfn_count          NUMBER;
      pfd_time           DATE;
      pfd_date           DATE;
      pnaztime_period    NUMBER;
      pgraph_period      NUMBER;
--Переменные выбранного назначения
      psmid              NUMBER;
--Переменные списка назначений
      pnaz_fk_id         NUMBER;
      pnaz_fk_smid       NUMBER;
      pnaz_fd_time       DATE;
      psos NUMBER;
--Переменные противопоказания
      period             NUMBER;
      pnaz_period        NUMBER;
--Переменные для сравнения
      snazstop           VARCHAR2(5);
      sgraphstop         VARCHAR2(10);
      tmp_hour           VARCHAR2(2);
      tmp_min            VARCHAR2(2);
      s                  VARCHAR2(1000);
      bintersection      BOOLEAN;
      fn_val number;
			pft_minus 				 number;
--      bnotintersection   BOOLEAN;
   BEGIN
   --Получение статуса не выполненых процедур
      OPEN cnazsos;
      FETCH cnazsos INTO psos;
      CLOSE cnazsos;
   -- // Получение статуса не выполненых процедур
      OPEN cgraph(pgraphid);
         FETCH cgraph INTO pid,             --Получаем информацию о периоде
                           pfl_sex,
                           pfn_count,
                           pfd_time,
                           pfd_date;
      IF cgraph%NOTFOUND THEN
         CLOSE cgraph;
         RETURN -1;   --Несформированно расписание
      END IF;
      CLOSE cgraph;
      OPEN cgraph(pgraphid);
--Получаем информацию о выбранном к распределению назначении
      OPEN cpacnaz(pnazid);
      FETCH cpacnaz INTO psmid;
      IF cpacnaz%NOTFOUND THEN
        CLOSE cgraph;
        CLOSE cpacnaz;
        RETURN -2;  --Нет выбранного назначения
      END IF;
      CLOSE cpacnaz;
-- // Получаем информацию о выбранном к распределению назначении

      LOOP
  			--Получаем информацию о периоде
         FETCH cgraph INTO pid, pfl_sex, pfn_count, pfd_time, pfd_date;
         EXIT WHEN cgraph%NOTFOUND;
				 --Если нет места, заполняем яйчейку цифрой "0" - нельзя назначить (-занято)
         IF (pfn_count < 1) THEN
            INSERT INTO tkab_pac_graph VALUES (TRUNC(pfd_date), pid, 0, TO_CHAR (pfd_time, 'HH24:MI'));
				-- Если период является перерывом, записываем -2 (-перерыв)
         ELSIF  (pfl_sex=-2) THEN
            INSERT INTO tkab_pac_graph VALUES (TRUNC(pfd_date), pid, -2, TO_CHAR (pfd_time, 'HH24:MI'));
                -- Административный период
         ELSIF  (pfl_sex=3) THEN
            INSERT INTO tkab_pac_graph VALUES (TRUNC(pfd_date), pid, -3, TO_CHAR (pfd_time, 'HH24:MI'));
				 -- Если пол пациента не совпадает с полом периода записываем -1 (-несовместимость)
         ELSIF (pfl_sex<>ppacsex and pfl_sex<>-1) THEN
            INSERT INTO tkab_pac_graph VALUES (TRUNC(pfd_date), pid, -1, TO_CHAR (pfd_time, 'HH24:MI'));
         ELSE  -- Если есть место, пол совпадает и не перерыв, то
--Получаем инфомацию о всех назначениях пациента
            OPEN cpacnazs (TRUNC(pfd_date), pnazid, ppacid, psos);
            bintersection := FALSE; --Показвает, было ли занесенно хоть одно время.
            fn_val:=0.0;
						-- Вычисляем время проведени выбранного назначения
            pgraph_period := pkg_manager.get_graph_period (pgraphid, TRUNC(pfd_date));
--            bnotintersection := FALSE; --Переменная не пересечения
            LOOP
               --Выбираем назначение из списка назначений пациента
               FETCH cpacnazs INTO pnaz_fk_id,   --Код назначения
                                   pnaz_fk_smid, --Код названия назначения
                                   pnaz_fd_time; --Время проведения назначения
               IF cpacnazs%NOTFOUND
               THEN  -- Если нет назначений распределенных в расписании
                 IF bintersection THEN
                   EXIT;
                 ELSE
--                 IF NOT (bintersection/* OR bnotintersection*/) THEN
                   INSERT /*+RULE*/ INTO tkab_pac_graph (fd_date, fk_graphid, fn_status, fc_time)
                        VALUES (TRUNC(pfd_date), pid, pfn_count, TO_CHAR (pfd_time, 'HH24:MI'));
--                 END IF;
                   EXIT;
                 END IF;
--                 EXIT;
               END IF;
							 --Вычисляем время проведения назначения из списка всех назначений пациента
               pnaztime_period :=	pkg_manager.get_naz_time_period (pnaz_fk_id, TRUNC(pfd_date));
               IF pgraph_period=-2 THEN --Если нет расписания на указанную дату
                 raise_application_error(-20002, 'Неверно составленно расписание на '||TO_CHAR(TRUNC(pfd_date), 'DD.MM.YYYY')||', график работы должен содержать более чем один период !!!');
               END IF;
               --Выбираем противопоказание (время между назначениями)
               period := pkg_manager.get_smid_interval (psmid, pnaz_fk_smid);
               pnaz_period :=  pkg_manager.get_smid_interval (pnaz_fk_smid, psmid);
               --Вычисляем время конца назначения и конца яйчейки с учетом противопоказаний
--							 if pnaz_period<=99 then
                 tmp_hour:=to_char(TRUNC((pnaztime_period-1)/60));
                 tmp_min:=to_char((pnaztime_period-1)-(tmp_hour*60));

                 s := 'select /*+RULE*/ TO_CHAR((:pnaz_fd_time+interval ' ||
                    '''' ||
                    tmp_min ||
                    '''' ||
                    ' minute + interval '||
                    '''' ||
                    tmp_hour ||
                    '''' ||
                    ' hour ), ' ||
                    '''' ||
                    'HH24:MI' ||
                    '''' ||
                    ') from dual';
								 EXECUTE IMMEDIATE s INTO snazstop USING pnaz_fd_time;
--							 else
--							   loop
/*								   if pnaz_period>99 then
									 	 pnaz_period:=pnaz_period-99;
										 s:='select TO_CHAR(TO_DATE(:sdate, ''HH24:MI'') + interval ''99'' minute, ''HH24:MI'') from dual';
										 execute immediate s INTO snazstop using snazstop;
									 else
									   s:='select TO_CHAR(TO_DATE(:sdate, ''HH24:MI'') + interval '''||pnaz_period||''' minute, ''HH24:MI'') from dual';
										 execute immediate s INTO snazstop using snazstop;
										 exit;
									 end if;
								 end loop;
								 s:='select TO_CHAR(TO_DATE(:sdate, ''HH24:MI'') + interval '''||pnaztime_period||''' minute, ''HH24:MI'') from dual';
								 execute immediate s into snazstop using snazstop;
							 end if;*/
--               if period<=99 then
                 tmp_hour:=to_char(TRUNC(pgraph_period/60));
                 tmp_min:=to_char(pgraph_period-(tmp_hour*60));
                 s := 'select /*+RULE*/TO_CHAR((:pfd_time+interval ' ||
                    '''' ||
                    tmp_min ||
                    '''' ||
                    ' minute + interval '||
                    '''' ||
                    tmp_hour ||
                    '''' ||
                    ' hour ), ' ||
                    '''' ||
                    'HH24:MI' ||
                    '''' ||
                    ') from dual';
                 EXECUTE IMMEDIATE s INTO sgraphstop USING pfd_time;
/*							 else
							   loop
								   if period>99 then
									   period:=period-99;
										 s:='select TO_CHAR(TO_DATE(:sdate, ''HH24:MI'') + interval ''99'' minute, ''HH24:MI'') from dual';
										 execute immediate s into sgraphstop using sgraphstop;
									 else
									   s:='select TO_CHAR(TO_DATE(:sdate, ''HH24:mi'') + interval '''||period||''' minute, ''HH24:MI'') from dual';
										 execute immediate s into sgraphstop using sgraphstop;
										 exit;
									 end if;
								 end loop;
								 s:='select TO_CHAR(TO_DATE(:sdate, ''HH24:MI'') + interval '''||pgraph_period||''' minute, ''HH24:MI'') from dual';
								 execute immediate s into sgraphstop using sgraphstop;
							 end if;*/
                 --Проверяем пересечение
               IF   (TO_DATE(TO_CHAR(pnaz_fd_time, 'HH24:MI'), 'HH24:MI'), TO_DATE(snazstop, 'HH24:MI'))
                      OVERLAPS
                    (TO_DATE(TO_CHAR(pfd_time, 'HH24:MI'), 'HH24:MI'), TO_DATE(sGraphStop, 'HH24:MI'))
--                  TRUE
               THEN   --Если время пересекается
                 IF not bintersection THEN
                   INSERT INTO tkab_pac_graph (fd_date, fk_graphid, fn_status, fc_time)
                         VALUES (TRUNC(pfd_date), pid, -1*pnaz_fk_id, TO_CHAR (pfd_time, 'HH24:MI'));
                   bintersection := TRUE;
                   EXIT;
                 ELSE
                   UPDATE tkab_pac_graph set fn_status=-1*pnaz_fk_id where fd_date=TRUNC(pfd_date) and fc_time=TO_CHAR (pfd_time, 'HH24:MI');
                   EXIT;
                 END IF;
--                  bintersection := TRUE;
               ELSE   --Если время не пересекается
                 IF not bintersection THEN
                  INSERT INTO tkab_pac_graph (fd_date, fk_graphid, fn_status, fc_time)
                       VALUES ( TRUNC(pfd_date), pid, pfn_count, TO_CHAR (pfd_time, 'HH24:MI'));
                 END IF;
--                  bnotintersection := TRUE;
               END IF;
               bintersection := TRUE;
            END LOOP;
            CLOSE cpacnazs;
         END IF;
      END LOOP;
      CLOSE cgraph;
      RETURN 0;
   END;

   FUNCTION get_graph_period (pgraphid IN NUMBER, pdate DATE)
      RETURN NUMBER
   IS
      CURSOR c(graph NUMBER,pD DATE)
      IS
         SELECT /*+RULE*//*+ORDERED*/ ft_hour, ft_min
           FROM tgraph
          WHERE fk_raspid = graph
            AND TRUNC(fd_date)=TRUNC(pD)
          ORDER BY ft_hour, ft_min;

      f1   NUMBER;
      f2   NUMBER;
      m1   NUMBER;
      m2   NUMBER;
      i    NUMBER;
   BEGIN
      OPEN c(pgraphid, pdate);
      FETCH c INTO f1, m1;
      FETCH c INTO f2, m2;
      IF c%NOTFOUND THEN
        CLOSE c;
        RETURN -2;
      END IF;
      CLOSE c;
      i := (f2 - f1) * 60 + (m2 - m1);
      RETURN i;
   END;

   FUNCTION get_naz_time_period (pnazid IN NUMBER, pdate DATE)
      RETURN NUMBER
   IS
      CURSOR c(pID IN NUMBER)
      IS
         SELECT /*+RULE*/ fk_roomid, fk_ispolid
           FROM tnazan
          WHERE fk_id = pID
         UNION
              SELECT /*+RULE*/ fk_roomid, fk_ispolid
                FROM tnazis
               WHERE fk_id = pID
         UNION
              SELECT /*+RULE*/ fk_roomid, fk_ispolid
                FROM tnazkons
               WHERE fk_id = pID
         UNION
              SELECT /*+RULE*/ fk_roomid, fk_ispolid
                FROM tnazlech
               WHERE fk_id = (SELECT /*+RULE*/ fk_nazid
                                FROM treslech
                               WHERE fk_id = pID);
     cursor cnazvrach(p1 NUMBER, p2 NUMBER) is SELECT /*+RULE*/fk_id
           FROM tnazvrach
          WHERE fk_sotrid = p1
            AND fk_kabinetid = p2
          ORDER BY fk_id desc;

      cursor cgraph(pID NUMBER) IS SELECT /*+rule*/ fk_graphid FROM traspis WHERE fk_nazvrachid = pID;


      room       NUMBER;
      sotr       NUMBER;
      nazvrach   NUMBER;
      graph      NUMBER;
      i          NUMBER;
   BEGIN
      OPEN c(pnazid);
      FETCH c INTO room, sotr;
      CLOSE c;
      OPEN cnazvrach(sotr, room);
      FETCH cnazvrach INTO nazvrach;
      CLOSE cnazvrach;
      OPEN cgraph(nazvrach);
      FETCH cgraph INTO graph;
      CLOSE cgraph;
      i := pkg_manager.get_graph_period (graph, pdate);
      RETURN i;
   END;

   FUNCTION get_smid_interval (sm1 IN NUMBER, sm2 IN NUMBER)
      RETURN NUMBER
   IS
      CURSOR c(s1 IN NUMBER, s2 IN NUMBER)
      IS
         SELECT /*+RULE*/ fn_period
           FROM tprotiv
          WHERE fk_smid1 = s1
            AND fk_smid2 = s2;

      i   NUMBER;
   BEGIN
      OPEN c(sm1, sm2);
      FETCH c INTO i;

      IF c%NOTFOUND
      THEN
         i := 0;
      END IF;

      CLOSE c;
      RETURN i;
   END;

   PROCEDURE delete_for_day (pid IN NUMBER)
   IS
      pdate   DATE          := SYSDATE;
      pday    VARCHAR2(100) := '';
      phour   VARCHAR2(100) := '';
      pmin    VARCHAR2(100) := '';
      prasp   NUMBER:=0.0;

      CURSOR c1 (pfk_id NUMBER)
      IS
         SELECT /*+RULE*/ TRUNC (fd_date), ft_hour, ft_min, FK_RASPID
           FROM tgraph
          WHERE fk_id = pfk_id;
      cursor c2 (pD IN DATE) IS SELECT TO_CHAR (pD, 'fmDAY') FROM dual;
   BEGIN
      OPEN c1 (pid);
      FETCH c1 INTO pdate, phour, pmin, prasp;

      IF c1%NOTFOUND
      THEN
         RETURN;
      END IF;

      CLOSE c1;
      OPEN c2(pdate);
      FETCH c2 INTO pday;
      CLOSE c2;
      DELETE /*+RULE*/
        FROM tgraph
       WHERE fk_id IN
                (SELECT fk_id
                   FROM tgraph
                  WHERE TO_CHAR (fd_date, 'fmDAY') = pday)
         AND FK_RASPID = prasp
         AND ft_hour = phour
         AND ft_min = pmin;
   END;
PROCEDURE DO_UPDATE_NAZPROC(pNAZID IN NUMBER)
  IS
   cursor cCount(pNAZID IN NUMBER)  IS select pkg_manager.get_nazproc_count_ib(pNAZID) nCOUNT from dual;
   cursor cDone(pNAZID IN NUMBER)   IS select count(fk_id) nDONE from treslech where fk_nazid=pNAZID and fk_sos=get_vipnaz;
   cursor cNevip(pNAZID IN NUMBER)  IS select count(fk_id) nNEVIP from treslech where fk_nazid=pNAZID and fk_sos=get_nevip;
   cursor cCancel(pNAZID IN NUMBER) IS select count(fk_id) nCancel from treslech where fk_nazid=pNAZID and fk_sos=GET_NAZCANCEL;
  nCount   NUMBER;
  nDone    NUMBER;
  nNevip   NUMBER;
  nCancel  NUMBER;
BEGIN
     open cCount(pNAZID);  fetch cCount  into nCount;  close cCount;
     open cDone(pNAZID);   fetch cDone   into nDone;   close cDone;
     open cNevip(pNAZID);  fetch cNevip  into nNevip;  close cNevip;
     open cCancel(pNAZID); fetch cCancel into nCancel; close cCancel;
     if nNevip = 0 then
          if nCancel = nCount then
              update tnazlech set fk_nazsosid=GET_NAZCANCEL where fk_id=pNAZID;
              if pNAZID>0 then
                  update vnaz set fd_run=fd_naz where fk_id=pNAZID;
              END IF;
           else
              update tnazlech set fk_nazsosid=get_vipnaz where fk_id=pNAZID;
          END IF;
        else
          if (nCount > nDone) and ((nDone > 0) or (nNevip < nCount)) then
              update tnazlech set fk_nazsosid=get_naz_process where fk_id=pNAZID;
          end if;
          if (nDone < 1) and (nCount = nNevip) then
              update tnazlech set fk_nazsosid=get_nevip where fk_id=pNAZID;
          end if;
      end if;
END;
FUNCTION IS_TIME_IN_BUSY_PERIOD(pNAZVRACHID NUMBER, pDATE DATE, pTIME DATE, pPRIEMINT NUMBER)
  return NUMBER
  is
cursor c1 is
  select decode(count(*),0,0,1) cn from (
    SELECT TO_DATE (   TO_CHAR (tg.fd_date,'dd.mm.yyyy')
                                  || ' '
                                  || tg.ft_hour
                                  || ':'
                                  || tg.ft_min,
                                  'dd.mm.yyyy hh24:mi'
                                 ) psdt,  dint
      FROM tpaclst tp,
           tgraph tg,
           traspis tr,
          (SELECT MAX (ldate) - MIN (ldate) dint
             FROM (SELECT   ROWNUM rn,
                         TO_DATE (   TO_CHAR (tg1.fd_date,'dd.mm.yyyy')
                                  || ' '
                                  || tg1.ft_hour
                                  || ':'
                                  || tg1.ft_min,
                                  'dd.mm.yyyy hh24:mi'
                                 ) ldate
                    FROM tgraph tg1, traspis tr1
                   WHERE tr1.fk_nazvrachid = pNAZVRACHID
                     AND tr1.fk_graphid = tg1.fk_raspid
                     AND trunc(tg1.fd_date) = pDATE
                ORDER BY ldate)
         WHERE rn <= 2) t1
    WHERE tg.fk_id = tp.fk_graphid
      AND tr.fk_nazvrachid = pNAZVRACHID
      AND tr.fk_graphid = tg.fk_raspid
      AND trunc(tg.fd_date)= pDATE )
  where (pTIME+1/86400,pTIME+(pPRIEMINT/1440)-1/86400) overlaps (psdt,psdt+dint);
  res NUMBER;
begin
  open c1;
  fetch c1 into res;
  close c1;
  return res;
end;

FUNCTION get_graphid_period (pFK_GRAPHID IN NUMBER )
      RETURN NUMBER
   IS


      f1   NUMBER;
      f2   NUMBER;
      m1   NUMBER;
      m2   NUMBER;
      i    NUMBER;
      vH varchar2(2);
      vM varchar2(2);
      vD date;
      vR number;
      vDef number;
      cursor Get_info is
       select FT_HOUR, FT_MIN, FD_DATE,fk_raspid from
        ASU.TGRAPH where FK_ID = pFK_GRAPHID;


      CURSOR c
      IS
         SELECT /*+RULE*//*+ORDERED*/ ft_hour, ft_min
           FROM tgraph
          WHERE fk_raspid = vR
            AND TRUNC(fd_date)=TRUNC(vD)
            and FT_HOUR||':'||FT_MIN >= vH||':'||vM
          ORDER BY ft_hour, ft_min;

   BEGIN

      OPEN Get_info;
      FETCH  Get_info into Vh, vM, vD,vR;
      CLOSE  Get_info;

      vDef := -2;--get_graph_period(vR, vD);

      OPEN c;
      FETCH c INTO f1, m1;
      FETCH c INTO f2, m2;
      IF c%NOTFOUND THEN
        CLOSE c;
        RETURN vDef;
      END IF;
      CLOSE c;
      i := (f2 - f1) * 60 + (m2 - m1);
      RETURN i;
   END;

 procedure DoUpdateAfterInsert(pFK_GRAPHID in number, DefPeriod in number ) is
      vH varchar2(2);
      vM varchar2(2);
      vD date;
      vR number;
      vDef number;
      vTempFK_ID number := 0;
      WasFind number := 0;

      cursor Get_info(pFK_ID in number) is
       select FT_HOUR, FT_MIN, FD_DATE,fk_raspid from
        ASU.TGRAPH where FK_ID = pFK_ID;


      CURSOR cTimes
      IS
         SELECT /*+RULE*//*+ORDERED*/ ft_hour, ft_min, FK_ID, FD_DATE
           FROM tgraph
          WHERE fk_raspid = vR
            AND TRUNC(fd_date)=TRUNC(vD)
            --and FT_HOUR||':'||FT_MIN >= vH||':'||vM
          ORDER BY ft_hour, ft_min;
 BEgin
      OPEN Get_info(pFK_GRAPHID);
      FETCH  Get_info into Vh, vM, vD,vR;
      CLOSE  Get_info;

      for c in cTimes loop

       If WasFind = 1 then
         OPEN Get_info(c.FK_ID);
         FETCH  Get_info into Vh, vM, vD,vR;
         CLOSE  Get_info;

         UPDATE ASU.TGRAPH SET FT_END = TO_DATE( TO_CHAR(vD,'DD.MM.YYYY')||' '||Vh||':'||vM, 'DD.MM.YYYY HH24:MI')
          where FK_ID =vTempFK_ID;

         WasFind := 2;
       End if;

       --Нашли время которое вставилось
       if (c.FK_ID = pFK_GRAPHID) and (vTempFK_ID > 0) then
         OPEN Get_info(c.FK_ID);
         FETCH  Get_info into Vh, vM, vD,vR;
         CLOSE  Get_info;

         --Апдейтим время окончания предыдущего времени
         UPDATE ASU.TGRAPH SET FT_END = TO_DATE( TO_CHAR(vD,'DD.MM.YYYY')||' '||Vh||':'||vM, 'DD.MM.YYYY HH24:MI')
          where FK_ID = vTempFK_ID;

         WasFind := 1;
       else
        if (c.FK_ID = pFK_GRAPHID) then
         --Если первая запись, то нужно проапдейтить
         UPDATE ASU.TGRAPH SET FT_END = TO_DATE( TO_CHAR(vD,'DD.MM.YYYY')||' '||Vh||':'||vM, 'DD.MM.YYYY HH24:MI')+
         DefPeriod/24/60
          where FK_ID = c.FK_ID;

         WasFind := 1;
        end if;
       end if;
       vTempFK_ID := c.FK_ID;
      end loop;

      if WasFind = 1 then
        UPDATE ASU.TGRAPH SET FT_END = TO_DATE( TO_CHAR(vD,'DD.MM.YYYY')||' '||Vh||':'||vM, 'DD.MM.YYYY HH24:MI')+
         DefPeriod/24/60
          where FK_ID = pFK_GRAPHID;
      end if;

 end;


procedure DoUpdateAfterInsertShablon(pFK_GRAPHID in number, DefPeriod in number ) is
      vH varchar2(2);
      vM varchar2(2);
      vD number;
      vS number;
      vV number;


      vpH varchar2(2);
      vpM varchar2(2);
      vpD number;
      vpS number;
      vpV number;



      vDef number;
      vTempFK_ID number := 0;
      WasFind number := 0;

      cursor Get_info(pFK_ID in number) is
       select FT_HOUR, FT_MIN, FD_DATE,fk_shablon, fk_vrachkabid from
        ASU.TGRAPH_SHAB_DATA where FK_ID = pFK_ID;


      CURSOR cTimes
      IS
         SELECT /*+RULE*//*+ORDERED*/ ft_hour, ft_min, FK_ID, FD_DATE
           FROM ASU.TGRAPH_SHAB_DATA
          WHERE fk_shablon = vS and fk_vrachkabid = vV
            AND TRUNC(fd_date)=TRUNC(vD)
            --and FT_HOUR||':'||FT_MIN >= vH||':'||vM
          ORDER BY ft_hour, ft_min;
 BEgin
      OPEN Get_info(pFK_GRAPHID);
      FETCH  Get_info into Vh, vM, vD,vS,vV;
      CLOSE  Get_info;

      for c in cTimes loop


       If WasFind = 1 then
         OPEN Get_info(c.FK_ID);
         FETCH  Get_info into Vh, vM, vD,vS,vV;
         CLOSE  Get_info;


         OPEN Get_info(vTempFK_ID);
         FETCH  Get_info into Vph, vpM, vpD,vpS,vpV;
         CLOSE  Get_info;



        select (TO_DATE(TO_CHAR(sysdate,'DD.MM.YYYY')||' '||Vh||':'||vM,'DD.MM.YYYY HH24:MI' )-
         TO_DATE(TO_CHAR(sysdate,'DD.MM.YYYY')||' '||Vph||':'||vpM,'DD.MM.YYYY HH24:MI' ))*24*60
         into vDef
         from DUAL;

        UPDATE ASU.TGRAPH_SHAB_DATA SET FN_INTERVAL = vDef
          where FK_ID =vTempFK_ID;

         WasFind := 2;
       End if;



       --Нашли время которое вставилось
       if (c.FK_ID = pFK_GRAPHID) and (vTempFK_ID > 0) then
         OPEN Get_info(c.FK_ID);
         FETCH  Get_info into Vh, vM, vD,vS,vV;
         CLOSE  Get_info;

         OPEN Get_info(vTempFK_ID);
         FETCH  Get_info into Vph, vpM, vpD,vpS,vpV;
         CLOSE  Get_info;

         select (TO_DATE(TO_CHAR(sysdate,'DD.MM.YYYY')||' '||Vh||':'||vM,'DD.MM.YYYY HH24:MI' )-
         TO_DATE(TO_CHAR(sysdate,'DD.MM.YYYY')||' '||Vph||':'||vpM,'DD.MM.YYYY HH24:MI' ))*24*60
         into vDef
         from DUAL;

         --Апдейтим время окончания предыдущего времени
         UPDATE ASU.TGRAPH_SHAB_DATA SET FN_INTERVAL = vDef
          where FK_ID = vTempFK_ID;

         WasFind := 1;
       else
        if (c.FK_ID = pFK_GRAPHID) then

         --Если первая запись
         UPDATE ASU.TGRAPH_SHAB_DATA SET FN_INTERVAL = DefPeriod
          where FK_ID = pFK_GRAPHID;

         WasFind := 1;
        end if;
       end if;

       vTempFK_ID := c.FK_ID;
      end loop;


      if WasFind = 1 then
         UPDATE ASU.TGRAPH_SHAB_DATA SET FN_INTERVAL = DefPeriod
          where FK_ID = pFK_GRAPHID;
      end if;



 end;

END;
/

SHOW ERRORS;


