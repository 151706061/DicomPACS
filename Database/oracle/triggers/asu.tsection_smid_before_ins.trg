DROP TRIGGER ASU.TSECTION_SMID_BEFORE_INS
/

--
-- TSECTION_SMID_BEFORE_INS  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   TIBPRINT (Table)
--   GET_SMIDNAME (Function)
--   TSECTIONS (Table)
--   TSECTION_SMID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSECTION_SMID_BEFORE_INS" 
 BEFORE 
 INSERT
 ON ASU.TSECTION_SMID  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
declare
  nHTMLID NUMBER;
begin
  select get_smidname(:new.fk_smid) into :new.fc_caption from dual;
  select fk_ib_print into nHTMLID from tsections where fk_id=:new.fk_secid;
  if nHTMLID <>-1 then
    insert into asu.tibprint(fk_owner, fc_name, fk_smid) values(nHTMLID, get_smidname(:new.fk_smid), :new.fk_smid);
  end if;
end;
/
SHOW ERRORS;


