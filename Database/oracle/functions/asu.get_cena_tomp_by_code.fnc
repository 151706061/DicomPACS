DROP FUNCTION ASU.GET_CENA_TOMP_BY_CODE
/

--
-- GET_CENA_TOMP_BY_CODE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSTANDART (Table)
--   TSTANDART_COST (Table)
--   TSTANDART_RAZDEL (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_CENA_TOMP_BY_CODE" (pTompCode  IN VARCHAR2,
                                                 pRazdelSyn IN VARCHAR2,
                                                 pDate      IN DATE DEFAULT SYSDATE)
 RETURN FLOAT IS

 -- Created 20070626 by Serg

 CURSOR C IS
  SELECT MAX(SC.FN_COST)
    FROM (SELECT FK_ID, FN_COST, FK_STANDARTID FROM TSTANDART_COST WHERE pDate >= FD_DATE1) SC,
         (SELECT S.FK_ID
            FROM TSTANDART S
           WHERE S.FC_CODE = pTompCode
             AND S.FK_RAZDEL =
                 (SELECT MAX(FK_ID) FROM TSTANDART_RAZDEL WHERE FC_SYNONYM = pRazdelSyn)) SS
   WHERE SC.FK_STANDARTID = SS.FK_ID;
 D FLOAT;

BEGIN
 OPEN C;
 FETCH C
 INTO D;
 CLOSE C;
 RETURN nvl(D, 0);
END;
/

SHOW ERRORS;


