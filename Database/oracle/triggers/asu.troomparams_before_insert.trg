DROP TRIGGER ASU."Troomparams_BEFORE_INSERT"
/

--
-- "Troomparams_BEFORE_INSERT"  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TROOMPARAMS (Sequence)
--   SEQ_TNAKLRASH (Sequence)
--   TROOMPARAMS (Table)
--
CREATE OR REPLACE TRIGGER ASU."Troomparams_BEFORE_INSERT"  
BEFORE INSERT
ON ASU.Troomparams
REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
declare
  cnt number;

BEGIN

  SELECT asu.seq_troomparams.nextval INTO :NEW.FK_ID FROM DUAL;

  select count(1) into cnt from asu.troomparams r where r.fk_roomtypeparamid = :new.fk_roomtypeparamid and r.fk_roomid = :new.fk_roomid and r.fk_uid is not null;

  if cnt > 0 then
   select r.fk_uid into :NEW.FK_UID from asu.troomparams r where r.fk_roomtypeparamid = :new.fk_roomtypeparamid and r.fk_roomid = :new.fk_roomid and r.fk_uid is not null;
  else
   select buh.seq_tnaklrash.nextval into :NEW.FK_UID from dual;
  end if;

END;
/
SHOW ERRORS;


