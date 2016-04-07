DROP PROCEDURE ASU.DO_ADD_PLANS
/

--
-- DO_ADD_PLANS  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_ADD_PLANS" 
   ( pFK_ID IN NUMBER,pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFD_DATA3 IN DATE,pFN_KOL IN NUMBER,pFK_VYB IN NUMBER,pFN_SUM IN NUMBER)
   IS
   CURSOR cTemp IS SELECT /*+ rule*/COUNT(FK_ID) FROM TSROKY WHERE FK_PACID=pFK_ID AND FK_PRYB=1;
   nTemp NUMBER;
BEGIN
  OPEN cTemp;
  FETCH cTemp into nTemp;
  CLOSE cTemp;
  if nTemp>0 then
    raise_application_error (-20005,'»меетс€ более одной записи о планирумеом заезде!');
  end if;
  INSERT INTO TSROKY(FK_PACID,FD_DATA1,FD_DATA2,FD_DATA3,FN_KOL,FK_PRYB,FK_VYB,FN_SUM)
    VALUES (pFK_ID,pFD_DATA1,pFD_DATA2,pFD_DATA3,pFN_KOL,1,pFK_VYB,pFN_SUM);
END; -- Procedure
/

SHOW ERRORS;


