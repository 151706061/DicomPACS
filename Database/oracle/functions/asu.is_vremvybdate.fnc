DROP FUNCTION ASU.IS_VREMVYBDATE
/

--
-- IS_VREMVYBDATE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--
CREATE OR REPLACE FUNCTION ASU."IS_VREMVYBDATE" 
  (pacid in number,
   dat in date)
  RETURN  number IS
 cursor c1 is select count(fk_ID) res from tsroky where fk_pacid=pacid and fd_data1=dat and fk_vyb=7;
 result number;
BEGIN
  open c1;
  fetch c1 into result;
  close c1;
  if result>0 then
    result:=1;
  end if;
  return result;
END;
/

SHOW ERRORS;


