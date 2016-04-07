DROP FUNCTION ASU.GET_PAC_TIPROOM
/

--
-- GET_PAC_TIPROOM  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSRTIPROOM (Table)
--   TTIPROOM (Table)
--   TPERESEL (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PAC_TIPROOM" 
  ( id in number)
  RETURN  varchar2 IS
cursor c(id in number)
is
select ttiproom.fc_vid from tperesel,ttiproom,tsrtiproom
where tperesel.fk_pacid=id and
      tsrtiproom.fk_palataid=tperesel.fk_palataid and
      tsrtiproom.fk_vidid=ttiproom.fk_id;
 n varchar2(15);
begin

open c (id);
fetch c into n;
close c;
return n;
END; -- Function GET_PAC_TIPROOM
/

SHOW ERRORS;


