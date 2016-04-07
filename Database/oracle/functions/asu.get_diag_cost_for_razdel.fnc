DROP FUNCTION ASU.GET_DIAG_COST_FOR_RAZDEL
/

--
-- GET_DIAG_COST_FOR_RAZDEL  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSTANDART (Table)
--   TSTANDART_COST (Table)
--   TSTANDART_ICD10 (Table)
--   TSTANDART_RAZDEL (Table)
--   TICD10 (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_DIAG_COST_FOR_RAZDEL" (pDiagCode IN VARCHAR2,
                           pRazdelSyn IN VARCHAR2,
                           pDate IN DATE DEFAULT SYSDATE) RETURN FLOAT IS

   -- created 20070306 by Serg
   -- mod     20070319 by Serg
 CURSOR C
 IS
/*SELECT MAX(SC.FN_COST)
       FROM (SELECT FK_ID,
                    FN_COST,
                    FK_STANDARTID
                    FROM TSTANDART_COST
--                    WHERE TRUNC(pDate) >= TRUNC(FD_DATE1)
--                    AND TRUNC(pDate) <= TRUNC(NVL(FD_DATE2, SYSDATE))
                    ) SC,
            TSTANDART S,
            TSTANDART_ICD10 SI,
            TICD10 I,
            (SELECT SR.FK_ID
                    FROM TSTANDART_RAZDEL SR
                    WHERE SR.FC_SYNONYM = pRazdelSyn) R
       WHERE I.FK_ID = SI.FK_ICD10
       AND S.FK_ID = SI.FK_STANDART
       AND SC.FK_STANDARTID = S.FK_ID
       AND S.FK_RAZDEL = R.FK_ID
--       AND TRUNC(pDate) >= TRUNC(SC.FD_DATE1) 
--       AND TRUNC(pDate) <= TRUNC(NVL(SC.FD_DATE2, SYSDATE))
       AND UPPER(I.FC_KOD) LIKE SUBSTR(UPPER(pDiagCode), 1, 3);*/
       SELECT MAX(SC.FN_COST)
       FROM (SELECT FK_ID,
                    FN_COST,
                    FK_STANDARTID
                    FROM TSTANDART_COST
                    WHERE pDate >= FD_DATE1
--                    AND TRUNC(pDate) <= TRUNC(NVL(FD_DATE2, SYSDATE))
                    ) SC,
            (SELECT S.FK_ID 
                    FROM TSTANDART S,
                         TSTANDART_ICD10 SI,
                         TICD10 I,
                         (SELECT SR.FK_ID
                                 FROM TSTANDART_RAZDEL SR
                                 WHERE SR.FC_SYNONYM = pRazdelSyn) R
                    WHERE I.FK_ID = SI.FK_ICD10
                    AND S.FK_ID = SI.FK_STANDART
                    AND S.FK_RAZDEL = R.FK_ID
                    AND UPPER(I.FC_KOD) LIKE SUBSTR(UPPER(pDiagCode), 1, 3)) SS
                    WHERE SC.FK_STANDARTID = SS.FK_ID;
 D FLOAT;

 BEGIN
  OPEN C;
  FETCH C INTO D;
  CLOSE C;
  RETURN nvl(D, 0);
 END;
/

SHOW ERRORS;


