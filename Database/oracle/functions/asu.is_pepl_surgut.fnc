DROP FUNCTION ASU.IS_PEPL_SURGUT
/

--
-- IS_PEPL_SURGUT  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TADRESS (Table)
--   TKLADR (Table)
--
CREATE OR REPLACE FUNCTION ASU."IS_PEPL_SURGUT" (pPeplID NUMBER) RETURN NUMBER IS
  -- Created by Ищуков С.С. 07,09,2015
  Res VARCHAR2(7);
BEGIN
  SELECT SUBSTR(k.fc_code, 1, 7)
    INTO Res
    FROM (SELECT fk_kladr, row_number() over (ORDER BY fk_type) r
            FROM asu.tadress
           WHERE fk_pacid = pPeplID) adr
         INNER JOIN asu.tkladr k ON adr.fk_kladr = k.fk_id
   WHERE r = 1;

  IF Res = '8600001' --Код г. Сургут региона ХМАО
  THEN
    RETURN 1;
  ELSE
    RETURN 0;
  END IF;

END;
/

SHOW ERRORS;


