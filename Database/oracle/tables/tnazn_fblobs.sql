DROP TABLE ASU.TNAZN_FBLOBS CASCADE CONSTRAINTS
/

--
-- TNAZN_FBLOBS  (Table) 
--
--  Dependencies: 
--   TFILE_CONTENTS (Table)
--   TNAZN (Table)
--
CREATE TABLE ASU.TNAZN_FBLOBS
(
  FK_ID       INTEGER                           NOT NULL,
  FK_BLOB_ID  INTEGER                           NOT NULL,
  FK_NAZN_ID  INTEGER                           NOT NULL
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TNAZN_FBLOBS IS 'Связка назначений с файлами'
/

COMMENT ON COLUMN ASU.TNAZN_FBLOBS.FK_ID IS 'SEQUENCE=[SEQ_NAZN_FBLOBS]'
/


--
-- IX_NAZN_FBLOBS_U  (Index) 
--
--  Dependencies: 
--   TNAZN_FBLOBS (Table)
--
CREATE UNIQUE INDEX ASU.IX_NAZN_FBLOBS_U ON ASU.TNAZN_FBLOBS
(FK_BLOB_ID, FK_NAZN_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          128K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TNAZN_FBLOBS_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TNAZN_FBLOBS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZN_FBLOBS_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON asu.tnazn_fblobs
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
begin
    --  Column "FK_ID" uses sequence SEQ_NAZN_FBLOBS
    if :new.FK_ID is null then
      select SEQ_NAZN_FBLOBS.NEXTVAL INTO :new.FK_ID from dual;
    end if;
--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
SHOW ERRORS;


-- 
-- Foreign Key Constraints for Table TNAZN_FBLOBS 
-- 
ALTER TABLE ASU.TNAZN_FBLOBS ADD (
  CONSTRAINT CK_TNAZN_FBLOBS__TFILE_BLOBS 
 FOREIGN KEY (FK_BLOB_ID) 
 REFERENCES ASU.TFILE_CONTENTS (FK_ID),
  CONSTRAINT CK_TNAZN_FBLOBS__TNAZN 
 FOREIGN KEY (FK_NAZN_ID) 
 REFERENCES ASU.TNAZN (FK_ID))
/

