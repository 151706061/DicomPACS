DROP FUNCTION ASU.GET_TRAVMADATE
/

--
-- GET_TRAVMADATE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TIB (Table)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_TRAVMADATE" (pTalonID IN NUMBER) RETURN DATE IS
-- Ефимов В.А. 13.05.2009 на основе GET_NAPR_UCHR_ID
 CURSOR C
 IS
 SELECT MAX(I.FD_DATE)
        FROM TIB I
        WHERE I.FK_SMID = (SELECT MAX(FK_ID)
                                  FROM TSMID T
                                  WHERE T.FC_SYNONIM = 'DATA_TRAVM')
        AND I.FK_PACID = NVL(pTalonID, 0);
 nRes DATE;

 BEGIN
  OPEN C;
   FETCH C INTO nRes;
  CLOSE C;
  RETURN nRes;
 END;
/

SHOW ERRORS;


