DROP FUNCTION ASU.GET_KLADR_DISTRICT
/

--
-- GET_KLADR_DISTRICT  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TKLADR (Table)
--
CREATE OR REPLACE FUNCTION ASU.GET_KLADR_DISTRICT(pKLADR_ID NUMBER)
RETURN NUMBER IS
Res NUMBER DEFAULT NULL;

CURSOR C IS select fk_id
  from asu.tkladr
  where length(fc_code) <= 13 AND SUBSTR(fc_code, 3, 3) <> '000' AND SUBSTR(fc_code, 6, 6) = '000000' AND SUBSTR(fc_code, 12, 2) <> '51'
  connect by prior fk_owner = fk_id
  start with fk_id = pKLADR_ID
  order by fn_level desc;

BEGIN
  open C;
  fetch C into Res;
  close C;

  RETURN Res;
END;
/

SHOW ERRORS;


