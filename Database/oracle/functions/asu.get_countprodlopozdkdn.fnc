DROP FUNCTION ASU.GET_COUNTPRODLOPOZDKDN
/

--
-- GET_COUNTPRODLOPOZDKDN  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_COUNTPRODLOPOZDKDN" 
  ( dat IN date)
  RETURN  number IS
cursor c1 is select sum(fn_kol) from tsroky where fd_data1=dat and fk_pryb=6;
res  number;
BEGIN
  open c1;
  fetch c1 into res;
  if res is null then
    res:=0;
   end if;
  close c1;
  return res;
END;
/

SHOW ERRORS;


