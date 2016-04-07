ALTER TABLE ASU.TRECEPTION_FBLOBS
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TRECEPTION_FBLOBS CASCADE CONSTRAINTS
/

--
-- TRECEPTION_FBLOBS  (Table) 
--
--  Dependencies: 
--   TFILE_CONTENTS (Table)
--   TRECEPTION (Table)
--
CREATE TABLE ASU.TRECEPTION_FBLOBS
(
  FK_ID         INTEGER                         NOT NULL,
  FK_FILE       INTEGER,
  FK_RECEPTION  INTEGER                         NOT NULL
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

COMMENT ON TABLE ASU.TRECEPTION_FBLOBS IS 'Связка приемов с файлами'
/

COMMENT ON COLUMN ASU.TRECEPTION_FBLOBS.FK_ID IS 'SEQUENCE=[SEQ_RECEPTION_FBLOBS]'
/

COMMENT ON COLUMN ASU.TRECEPTION_FBLOBS.FK_FILE IS 'Может бытьNull (так вот задумано)'
/


--
-- IX_NAZN_FBLOBS_U2  (Index) 
--
--  Dependencies: 
--   TRECEPTION_FBLOBS (Table)
--
CREATE UNIQUE INDEX ASU.IX_NAZN_FBLOBS_U2 ON ASU.TRECEPTION_FBLOBS
(FK_FILE, FK_RECEPTION)
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
-- PK_TRECEPTION_FBLOBS  (Index) 
--
--  Dependencies: 
--   TRECEPTION_FBLOBS (Table)
--
CREATE UNIQUE INDEX ASU.PK_TRECEPTION_FBLOBS ON ASU.TRECEPTION_FBLOBS
(FK_ID)
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
-- TRECEPTION_FBLOBS_BEFOREINSERT  (Trigger) 
--
--  Dependencies: 
--   TRECEPTION_FBLOBS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECEPTION_FBLOBS_BEFOREINSERT" 
 BEFORE INSERT
ON asu.treception_fblobs FOR EACH ROW
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
begin
    --  Column "FK_ID" uses sequence SEQ_RECEPTION_FBLOBS
    if :new.FK_ID is null then
      select SEQ_RECEPTION_FBLOBS.NEXTVAL INTO :new.FK_ID from dual;
    end if;
--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TRECEPTION_FBLOBS 
-- 
ALTER TABLE ASU.TRECEPTION_FBLOBS ADD (
  CONSTRAINT PK_TRECEPTION_FBLOBS
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
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
               ))
/

-- 
-- Foreign Key Constraints for Table TRECEPTION_FBLOBS 
-- 
ALTER TABLE ASU.TRECEPTION_FBLOBS ADD (
  CONSTRAINT CK_TRECEPTION_FBLO__TFILE_CO 
 FOREIGN KEY (FK_FILE) 
 REFERENCES ASU.TFILE_CONTENTS (FK_ID),
  CONSTRAINT CK_TRECEPTION_FBLO__TRECEPTI 
 FOREIGN KEY (FK_RECEPTION) 
 REFERENCES ASU.TRECEPTION (FK_ID))
/

