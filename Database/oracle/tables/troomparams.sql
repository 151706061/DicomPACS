DROP TABLE ASU.TROOMPARAMS CASCADE CONSTRAINTS
/

--
-- TROOMPARAMS  (Table) 
--
CREATE TABLE ASU.TROOMPARAMS
(
  FK_ID               NUMBER                    NOT NULL,
  FK_ROOMTYPEPARAMID  NUMBER,
  FN_VALUE            NUMBER,
  FD_BEGIN            DATE,
  FD_END              DATE,
  FK_ROOMID           NUMBER,
  FL_ISROOM           NUMBER(1)                 DEFAULT 1,
  FK_UID              NUMBER
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOLOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON COLUMN ASU.TROOMPARAMS.FK_ROOMTYPEPARAMID IS 'ссыль на ASU.TROOMTYPEPARAM.FK_ID'
/

COMMENT ON COLUMN ASU.TROOMPARAMS.FN_VALUE IS 'значение'
/

COMMENT ON COLUMN ASU.TROOMPARAMS.FD_BEGIN IS 'дата начала действия '
/

COMMENT ON COLUMN ASU.TROOMPARAMS.FD_END IS 'дата конца действия'
/

COMMENT ON COLUMN ASU.TROOMPARAMS.FK_ROOMID IS 'ссыль на ASU.TROOM или ASU.TKABINET'
/

COMMENT ON COLUMN ASU.TROOMPARAMS.FL_ISROOM IS '1 - troom, 0 - tkabinet'
/

COMMENT ON COLUMN ASU.TROOMPARAMS.FK_UID IS 'id уникальный для FK_ROOMTYPEPARAMID и FK_ROOMID'
/


--
-- "Troomparams_BEFORE_INSERT"  (Trigger) 
--
--  Dependencies: 
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


--
-- TROOMPARAMS_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TROOMPARAMS (Table)
--
CREATE OR REPLACE TRIGGER ASU.Troomparams_BEFORE_INSERT
BEFORE INSERT
ON ASU.TROOMPARAMS REFERENCING OLD AS OLD NEW AS NEW
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


