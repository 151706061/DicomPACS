ALTER TABLE ASU.TFILE_CONTENTS
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TFILE_CONTENTS CASCADE CONSTRAINTS
/

--
-- TFILE_CONTENTS  (Table) 
--
CREATE TABLE ASU.TFILE_CONTENTS
(
  FK_ID      INTEGER                            NOT NULL,
  FILE_DATA  LONG RAW                           NOT NULL,
  EXT        VARCHAR2(6 BYTE)                   NOT NULL,
  REMARK     VARCHAR2(200 BYTE),
  NAME       VARCHAR2(150 BYTE)                 NOT NULL,
  FD_DATE    DATE                               DEFAULT sysdate               NOT NULL
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

COMMENT ON TABLE ASU.TFILE_CONTENTS IS 'Файлы с содержимым'
/

COMMENT ON COLUMN ASU.TFILE_CONTENTS.FK_ID IS 'SEQUENCE=[SEQ_FILE_CONTENTS]'
/

COMMENT ON COLUMN ASU.TFILE_CONTENTS.FILE_DATA IS 'Файл'
/

COMMENT ON COLUMN ASU.TFILE_CONTENTS.EXT IS 'Расширение'
/

COMMENT ON COLUMN ASU.TFILE_CONTENTS.REMARK IS 'Примечание'
/

COMMENT ON COLUMN ASU.TFILE_CONTENTS.NAME IS 'Название'
/

COMMENT ON COLUMN ASU.TFILE_CONTENTS.FD_DATE IS 'Дата изменения'
/


--
-- PK_TFILE_CONTENTS  (Index) 
--
--  Dependencies: 
--   TFILE_CONTENTS (Table)
--
CREATE UNIQUE INDEX ASU.PK_TFILE_CONTENTS ON ASU.TFILE_CONTENTS
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
-- TFILE_CONTENT_BEFORE_UPDATE  (Trigger) 
--
--  Dependencies: 
--   TFILE_CONTENTS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TFILE_CONTENT_BEFORE_UPDATE" 
 BEFORE UPDATE
OF FK_ID
ON asu.tfile_contents FOR EACH ROW
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
    seq NUMBER;
begin
    seq := IntegrityPackage.GetNestLevel;
    :new.FD_DATE:=sysdate ;
--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
SHOW ERRORS;


--
-- TFILE_CONTENTS_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TFILE_CONTENTS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TFILE_CONTENTS_BEFORE_INSERT" 
 BEFORE INSERT
ON asu.tfile_contents FOR EACH ROW
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
begin
    --  Column "FK_ID" uses sequence SEQ_FILE_CONTENTS
    if :new.FK_ID is null then
      select SEQ_FILE_CONTENTS.NEXTVAL INTO :new.FK_ID from dual;
    end if;
--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
SHOW ERRORS;


--
-- TILE_CONTENTS_BEFORE_UPDATE  (Trigger) 
--
--  Dependencies: 
--   TFILE_CONTENTS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TILE_CONTENTS_BEFORE_UPDATE" 
 BEFORE UPDATE
OF FK_ID
ON asu.tfile_contents FOR EACH ROW
declare
    errno            integer;
    errmsg           char(200);
begin
    :new.FD_DATE:=sysdate;
    --Error handling
exception
    when others then
       raise_application_error(errno, errmsg);
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TFILE_CONTENTS 
-- 
ALTER TABLE ASU.TFILE_CONTENTS ADD (
  CONSTRAINT PK_TFILE_CONTENTS
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

