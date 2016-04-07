DROP PROCEDURE ASU.DO_PLAN_CHECK_FOR_ZASELENIYE
/

--
-- DO_PLAN_CHECK_FOR_ZASELENIYE  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSRTIPROOM (Table)
--   DO_CHECK_FREE_MESTA_FOR_PLAN (Function)
--
CREATE OR REPLACE PROCEDURE ASU."DO_PLAN_CHECK_FOR_ZASELENIYE" -- Created by TimurLan
 (pFD_DATE IN DATE,pFK_TYPEPUT IN NUMBER,pFN_COL OUT NUMBER,pFN_FREE OUT NUMBER)
IS
 CURSOR cCount IS
  SELECT SUM(FN_MESTA)
    FROM TSRTIPROOM,(select MAX(fk_id) as id from TSRTIPROOM where FK_VIDID=pFK_TYPEPUT group by fk_palataid)
   WHERE FK_ID=ID
     AND FL_REMONT = 0;
 CURSOR cMain IS
  SELECT FK_PALATAID,FN_MESTA
    FROM TSRTIPROOM,(select MAX(fk_id) as id from TSRTIPROOM where FK_VIDID=pFK_TYPEPUT group by fk_palataid)
   WHERE FK_ID=ID
     AND FL_REMONT = 0
   ORDER BY FK_PALATAID;
  nCount NUMBER;
  nFree NUMBER;
  dDate1 DATE;
  dDate2 DATE;
BEGIN
  nCount:=0;
  dDate1:=TRUNC(pFD_DATE,'MI');
  dDate2:=dDate1+7-1/(24*60);
  OPEN cCount;
  Fetch cCount into pFN_COL;
  CLOSE cCount;
  FOR p IN cMain LOOP
    nFree := DO_CHECK_FREE_MESTA_FOR_PLAN(-1,p.FK_PALATAID,dDate1,dDate2);
    if nFree > 0 then
      WHILE nFree > 0 LOOP
--        COMMIT;
        nFree:=nFree-1;
        nCount:=nCount+1;
      END LOOP;
    end if;
  END LOOP;
  pFN_FREE:=nCount;
END;
/

SHOW ERRORS;


