DROP FUNCTION ASU.GET_NAPR_UCHR_ID
/

--
-- GET_NAPR_UCHR_ID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TIB (Table)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_NAPR_UCHR_ID" (ppacid IN NUMBER) RETURN NUMBER IS

   -- Created 20061227 by Serg

 CURSOR C
 IS
 SELECT MAX(I.FK_SMID)
        FROM TSMID S,
             TIB I
        WHERE S.FK_OWNER = (SELECT MAX(FK_ID)
                                  FROM TSMID T
                                  WHERE T.FC_SYNONIM = 'PD_NAPRAVIV_YCH')
        AND I.FK_SMID = S.FK_ID
        AND I.FK_PACID = NVL(ppacid, 0);
 nRes NUMBER;

 BEGIN
  OPEN C;
   FETCH C INTO nRes;
  CLOSE C;
  RETURN nRes;
 END;
/

SHOW ERRORS;


GRANT EXECUTE ON ASU.GET_NAPR_UCHR_ID TO EXCHANGE
/

GRANT EXECUTE ON ASU.GET_NAPR_UCHR_ID TO EXCH43
/

