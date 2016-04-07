DROP FUNCTION ASU.GET_SROKKDN
/

--
-- GET_SROKKDN  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   DOC_ABORT_DS (Function)
--   DOC_IBDS_STAC (Function)
--   DOC_IB_DS (Function)
--   PKG_WORKDAYS (Package)
--   TUSLVID (Table)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_SROKKDN" (pPacid IN NUMBER, pdate1 IN DATE,pdate2 IN DATE)

  -- Author  : Marriage
  -- Created : 09 09 2010
  -- Purpose : day count by using TWorkDay table

 RETURN NUMBER IS
  nTmp  NUMBER;
  Date1 DATE;
  Date2 DATE;
BEGIN
  Date1 := pdate1;
  IF pDate2 IS NULL
  THEN
    RETURN NULL;
  end if;

  IF Date1 IS NULL
  THEN
    RETURN NULL;
  ELSE
    Date2 := pdate2;
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
      nTmp:=ASU.PKG_WORKDAYS.workdays_between(trunc(Date1), trunc(Date2)+ 1);
   END LOOP;
  END IF;
  RETURN(nTmp);
END;
/

SHOW ERRORS;


