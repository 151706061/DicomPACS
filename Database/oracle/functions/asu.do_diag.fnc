DROP FUNCTION ASU.DO_DIAG
/

--
-- DO_DIAG  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TDIAG (Table)
--   TSMID (Table)
--   GET_SMIDNAME (Function)
--   TSUBDIAG (Table)
--
CREATE OR REPLACE FUNCTION ASU."DO_DIAG" (pFK_ID IN NUMBER, nCallType IN NUMBER DEFAULT 0)
RETURN VARCHAR2 AS
CURSOR curTemp IS SELECT /*+ rule*/ FC_NAME,FC_ANSWER
                    FROM TSMID,
                         (SELECT FK_SMDIAGID FROM TSUBDIAG WHERE FK_DIAGID=pFK_ID)
                   WHERE FK_ID=FK_SMDIAGID;
CURSOR curSYN IS SELECT FC_SYNONIM
                   FROM TSMID
                  WHERE FK_ID=(SELECT FK_OWNER FROM TSMID, TDIAG WHERE TDIAG.FK_ID=PFK_ID AND TSMID.FK_ID=TDIAG.FK_SMDIAGID);
cursor cDiag1 is SELECT RTRIM(TDIAG.FC_WRITE) FROM  TSMID TS,TDIAG WHERE TS.FK_ID=TDIAG.FK_SMDIAGID AND TDIAG.FK_ID=pFK_ID;                  
cursor cDiag2 is SELECT FC_WRITE FROM TDIAG WHERE FK_ID=pFK_ID;

  strTemp   VARCHAR2(1000);
  strTemp2  VARCHAR2(1000);
  strSymb   VARCHAR2(254); --254
  i         NUMBER;
  nCount    NUMBER;
  sSYN      VARCHAR2(20);
  
BEGIN
/*1 курсор*/
  OPEN curSYN;
  FETCH curSYN INTO sSYN;
  CLOSE curSYN;

  IF nCallType = 0 THEN
--   SELECT RTRIM(TDIAG.FC_WRITE) INTO strTemp FROM  TSMID TS,TDIAG WHERE TS.FK_ID=TDIAG.FK_SMDIAGID AND TDIAG.FK_ID=pFK_ID;
  -- заменим один курсор(выше) на другой(ниже) дабы избежать no_data_found
    open cDiag1;
    fetch cDiag1 into strTemp;
    if cDiag1%NOTFOUND then
      strTemp:='';
    end if;  
    close cDiag1;  
    --
  ELSE
   SELECT get_smidname(fk_owner) ||'. '||RTRIM(TDIAG.FC_WRITE) INTO strTemp FROM  TSMID TS,TDIAG WHERE TS.FK_ID=TDIAG.FK_SMDIAGID AND TDIAG.FK_ID=pFK_ID;
  END IF;
/*2 курсор*/
  OPEN curTemp;
  LOOP
    FETCH curTemp INTO strTemp2,strSymb;
    EXIT WHEN (curTemp%NOTFOUND);
    strTemp:=strTemp||strSymb;
  END LOOP;
  CLOSE curTemp;

  IF strSymb IS NOT NULL THEN
    SELECT RTRIM(strTemp,strSymb) INTO strTemp FROM DUAL;
  END IF;

--  SELECT FC_WRITE INTO strTemp2 FROM TDIAG WHERE FK_ID=pFK_ID;
  -- заменим один курсор(выше) на другой(ниже) дабы избежать no_data_found
  open cDiag2;
  fetch cDiag2 into strTemp2;
  if cDiag2%NOTFOUND then
    strTemp2:='';  
  end if;  
  close cDiag2;
  --
  IF strTemp2 IS NOT NULL THEN
   IF strTemp IS NOT NULL THEN
    strTemp:=strTemp||strSymb; 
   ELSE
    strTemp:=strTemp2;
   END IF;
  END IF;
  
  strTemp:=strTemp||'.';

  RETURN strTemp;

  EXCEPTION
  WHEN no_data_found THEN
    raise_application_error(-20000,'Запрошен отсутствующий диагноз. Обратитесь к администратору. Возможны был удален диагноз из справочника диагнозов');
    
END;
/

SHOW ERRORS;


