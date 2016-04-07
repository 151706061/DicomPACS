DROP FUNCTION ASU.GET_COUNTPRODLNALKDN
/

--
-- GET_COUNTPRODLNALKDN  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_COUNTPRODLNALKDN" 
  ( dat IN date)
  RETURN  number IS
cursor c1 is select sum(fn_kol) from tsroky where fd_data1=dat and fk_pryb=5;
res  number;
BEGIN
  open c1;
  fetch c1 into res;
  close c1;
  if res is null then
    res:=0;
  end if;
  return res;
END;
/

SHOW ERRORS;


