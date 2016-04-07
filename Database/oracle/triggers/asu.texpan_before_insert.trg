DROP TRIGGER ASU.TEXPAN_BEFORE_INSERT
/

--
-- TEXPAN_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TEXPAN (Sequence)
--   TEXPAN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TEXPAN_BEFORE_INSERT" 
BEFORE  INSERT  ON ASU.TEXPAN FOR EACH ROW
Begin
  SELECT SEQ_TEXPAN.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  /*added by A.Nakorjakov 071208 started*/
  if :new.fk_guid is null then
     :new.fk_guid := sys_guid();
  end if;
  /*added by A.Nakorjakov 071208 finished*/  
End;
/
SHOW ERRORS;


