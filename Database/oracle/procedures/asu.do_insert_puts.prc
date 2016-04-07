DROP PROCEDURE ASU.DO_INSERT_PUTS
/

--
-- DO_INSERT_PUTS  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TPUTSPLANS (Table)
--   NEXT_NUMBER (Function)
--
CREATE OR REPLACE PROCEDURE ASU."DO_INSERT_PUTS" -- Created by TimurLan 4 rPutsPlan
 (pFN_KOL IN NUMBER, pFK_LISTID IN NUMBER, pFK_TYPEID IN NUMBER, pFN_KDN IN NUMBER, pFK_KORPID IN NUMBER,
 pFC_MASK IN VARCHAR2, pFC_NUM IN OUT VARCHAR2)
 IS
 nTemp NUMBER;
BEGIN
  nTemp := pFN_KOL;
  LOOP
    EXIT WHEN nTemp < 1;
    insert into
           TPUTSPLANS (FK_LISTID,FK_TYPEID,FN_KDN,FK_KORPID,FC_NUM)
         values
           (pFK_LISTID,pFK_TYPEID,pFN_KDN,pFK_KORPID,pFC_NUM);
    if pFC_NUM is not NULL then
      pFC_NUM := Next_Number(pFC_NUM,pFC_MASK);
    end if;
    nTemp := nTemp - 1;
  END LOOP;
END;
/

SHOW ERRORS;


