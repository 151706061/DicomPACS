DROP FUNCTION ASU.GET_PACKDN
/

--
-- GET_PACKDN  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   DOC_ABORT_DS (Function)
--   DOC_IBDS_STAC (Function)
--   DOC_IB_DS (Function)
--   GET_PACINCOME (Function)
--   GET_PACOUTCOME (Function)
--   TUSLVID (Table)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PACKDN" (pPacid IN NUMBER, pdate IN DATE DEFAULT SYSDATE,
   pIsWork IN NUMBER DEFAULT 0, pFK_OTDEL IN NUMBER DEFAULT 0, pFK_TIPROOM IN NUMBER DEFAULT 0)

  -- Author  : Spasskiy S.N.
  -- Created : 24.10.2007 17:55:17
  -- Purpose : Подсчет койко-дней
 RETURN NUMBER IS
  nTmp  NUMBER;
  Date1 DATE;
  Date2 DATE;
BEGIN
  Date1 := trunc(asu.get_pacincome(pPacid));
  IF Date1 IS NULL
  THEN
    RETURN 0;
  ELSE
    Date2:=nvl(asu.get_pacoutcome(pPacid), SYSDATE);
    IF Date2 > pdate THEN
      date2 := pdate;
    END IF;
    ntmp := trunc(Date2) - trunc(Date1);
  END IF;
  IF nTmp <= 0
  THEN
    nTmp := 1;
  ELSE
   FOR C IN (SELECT NULL
               FROM ASU.TKARTA,
                    (SELECT FK_ID
                       FROM ASU.TUSLVID
                     CONNECT BY PRIOR FK_ID = FK_OWNERID
                      START WITH FK_ID IN (ASU.DOC_IB_DS, ASU.DOC_IBDS_STAC, ASU.DOC_ABORT_DS)) DOC
              WHERE TKARTA.FK_ID = pPacid
                AND DOC.FK_ID = FK_USLVIDID)
   LOOP
      nTmp:=nTmp+1;
   END LOOP;
  END IF;
  RETURN(nTmp);
END GET_PACKDN;
/

SHOW ERRORS;


