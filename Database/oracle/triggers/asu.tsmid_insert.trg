DROP TRIGGER ASU.TSMID_INSERT
/

--
-- TSMID_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TSMID (Sequence)
--   TSMID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSMID_INSERT" 
BEFORE INSERT
ON tsmid
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
DECLARE
  CURSOR c1 IS
    SELECT SEQ_TSMID.NEXTVAL FROM DUAL;

  id NUMBER;
BEGIN
  IF :new.fk_id IS NULL OR :new.fk_id = -1 THEN
    OPEN c1;
    FETCH c1
      INTO id;
    CLOSE c1;
    :NEW.FK_ID := ID;
  END IF;
  if :NEW.FK_guid is null then 
    :NEW.FK_guid:= sys_guid();
  end if;
END;
/
SHOW ERRORS;


