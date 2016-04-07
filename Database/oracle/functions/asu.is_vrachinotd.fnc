DROP FUNCTION ASU.IS_VRACHINOTD
/

--
-- IS_VRACHINOTD  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSOTR (Synonym)
--
CREATE OR REPLACE FUNCTION ASU."IS_VRACHINOTD" 
  ( nsotrid in number, notdid number)
  RETURN  number IS
 cursor c1 is select count(fk_id) as r from tsotr where tsotr.fk_id=nsotrid and tsotr.fk_otDid=notdid;
 n number(4);

BEGIN
  open c1;
  fetch c1 into n;
  close c1;
  return n;
END;
/

SHOW ERRORS;


