DROP FUNCTION ASU.GET_PODPISID
/

--
-- GET_PODPISID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSOTR (Synonym)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PODPISID" 
  ( nSMID IN number, nVRACHID in number)
  RETURN  number IS
 --возвращает код врача которые должен подписывать пункт в СМИД
 --если в FK_DEFAULT=0 or fk_default is null  то возвращает переданный код врача
 --(т.е. он должен сам подписывать)
 cursor c1 is select fk_id from tsotr where fk_id=(select fk_default from tsmid where fk_id=nSMID);
 res number;
BEGIN
    open c1;
    fetch c1 into res;
    if (res=0) or (res is null) then
      close c1;
      return res;
    else
      close c1;
     return res;
    end if;
END;
/

SHOW ERRORS;


