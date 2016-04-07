DROP FUNCTION ASU.GET_NAZPRICE
/

--
-- GET_NAZPRICE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZPRICE (Table)
--   VNAZ (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_NAZPRICE" (pFK_ID in number) return number is
  PRICE number;
  PACID number:=0.0;
  SMID number:=0.0;
begin
  select /*+rule*/ fk_pacid, fk_smid into PACID, SMID from vnaz where fk_id=pFK_ID;
  select /*+rule*/ fn_price into PRICE from tnazprice where fk_nazid=pFK_ID and fk_pacid=PACID and fk_smid=SMID;
  return PRICE;
end;
/

SHOW ERRORS;


