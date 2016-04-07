DROP FUNCTION ASU.GET_PAC_TIPROOMID
/

--
-- GET_PAC_TIPROOMID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSRTIPROOM (Table)
--   TPERESEL (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PAC_TIPROOMID" 
  ( id in number)
  RETURN  varchar2 IS
cursor c(id in number)
is
select tsrtiproom.fk_vidid from tperesel,tsrtiproom
where tperesel.fk_pacid=id and
      tsrtiproom.fk_palataid=tperesel.fk_palataid;
 n varchar2(15);
begin

open c (id);
fetch c into n;
close c;
return n;
END; -- Function GET_PAC_TIPROOM
/

SHOW ERRORS;


