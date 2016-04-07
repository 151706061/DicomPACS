DROP FUNCTION ASU.IS_PEPL_SURGUT_RAION
/

--
-- IS_PEPL_SURGUT_RAION  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TADRESS (Table)
--   TKLADR (Table)
--
CREATE OR REPLACE FUNCTION ASU."IS_PEPL_SURGUT_RAION" (pPeplID NUMBER) RETURN NUMBER IS
  -- Created by Ищуков С.С. 01,09,2015
  Res VARCHAR2(5);
BEGIN
  SELECT SUBSTR(k.fc_code, 1, 5)
    INTO Res
    FROM (SELECT fk_kladr, row_number() over (ORDER BY fk_type) r
            FROM asu.tadress
           WHERE fk_pacid = pPeplID) adr
         INNER JOIN asu.tkladr k ON adr.fk_kladr = k.fk_id
   WHERE r = 1;

  IF Res = '86009' --Код Сургутского район региона ХМАО
  THEN
    RETURN 1;
  ELSE
    RETURN 0;
  END IF;

END;
/

SHOW ERRORS;


