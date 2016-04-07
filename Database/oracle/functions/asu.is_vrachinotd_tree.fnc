DROP FUNCTION ASU.IS_VRACHINOTD_TREE
/

--
-- IS_VRACHINOTD_TREE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSOTR (Synonym)
--   TOTDEL (Synonym)
--
CREATE OR REPLACE FUNCTION ASU."IS_VRACHINOTD_TREE"
  ( nsotrid in number, notdid number)
  RETURN  number IS
 cursor c1 is
 Select count(1) as r
   from asu.TOtdel
 where FK_ID = notdid
 connect by prior FK_OWNERID = FK_ID
  start with FK_ID =
             (SELECT FK_OTDELID from ASU.TSotr where FK_ID = nsotrid);
--  select count(fk_id) as r from tsotr where tsotr.fk_id=nsotrid and tsotr.fk_otDid=notdid;
 n number(4);

BEGIN
  open c1;
  fetch c1 into n;
  close c1;
  return n;
END;
/

SHOW ERRORS;


