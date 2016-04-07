ALTER TABLE ASU.TSOTR_USER_GROUPS
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TSOTR_USER_GROUPS CASCADE CONSTRAINTS
/

--
-- TSOTR_USER_GROUPS  (Table) 
--
CREATE TABLE ASU.TSOTR_USER_GROUPS
(
  FK_ID           INTEGER                       NOT NULL,
  FK_SOTR         INTEGER,
  FK_USER_GROUPS  INTEGER                       NOT NULL
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
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TSOTR_USER_GROUPS IS 'Сотрудники в группе'
/

COMMENT ON COLUMN ASU.TSOTR_USER_GROUPS.FK_ID IS 'SEQUENCE=[SEQ_SOTR_USER_GROUPS]'
/


--
-- PK_TSOTR_USER_GROUPS  (Index) 
--
--  Dependencies: 
--   TSOTR_USER_GROUPS (Table)
--
CREATE UNIQUE INDEX ASU.PK_TSOTR_USER_GROUPS ON ASU.TSOTR_USER_GROUPS
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TSOTR_USER_GROUPS_BEFORE_INS  (Trigger) 
--
--  Dependencies: 
--   TSOTR_USER_GROUPS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSOTR_USER_GROUPS_BEFORE_INS" 
 BEFORE
  INSERT
 ON asu.tsotr_user_groups
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
begin
    --  Column "FK_ID" uses sequence SEQ_SOTR_USER_GROUPS
    if :new.FK_ID is null then
      select SEQ_SOTR_USER_GROUPS.NEXTVAL INTO :new.FK_ID from dual;
    end if;
--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TSOTR_USER_GROUPS 
-- 
ALTER TABLE ASU.TSOTR_USER_GROUPS ADD (
  CONSTRAINT PK_TSOTR_USER_GROUPS
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

