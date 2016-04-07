DROP TRIGGER ASU.THEAL_MEDIC_INSERT
/

--
-- THEAL_MEDIC_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   THEAL_MEDIC (Table)
--   SEQ_HEAL_SMID (Sequence)
--
CREATE OR REPLACE TRIGGER ASU."THEAL_MEDIC_INSERT"
 BEFORE
  INSERT
 ON ASU.THEAL_MEDIC REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH row
begin
  if :new.FK_ID IS NULL then
     select asu.SEQ_HEAL_SMID.NEXTVAL INTO :new.FK_ID  from dual;
  end if;
end;
/
SHOW ERRORS;


