DROP TRIGGER ASU.THEAL_SMID$BI
/

--
-- THEAL_SMID$BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   THEAL_SMID (Table)
--   SEQ_HEAL_SMID (Sequence)
--
CREATE OR REPLACE TRIGGER ASU."THEAL_SMID$BI" 
 BEFORE
  INSERT
 ON theal_smid
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  if :new.FK_ID IS NULL then
     select SEQ_HEAL_SMID.NEXTVAL INTO :new.FK_ID  from dual;
  end if;

end;
/
SHOW ERRORS;


