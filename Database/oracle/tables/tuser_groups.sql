ALTER TABLE ASU.TUSER_GROUPS
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TUSER_GROUPS CASCADE CONSTRAINTS
/

--
-- TUSER_GROUPS  (Table) 
--
CREATE TABLE ASU.TUSER_GROUPS
(
  FK_ID       INTEGER                           NOT NULL,
  FC_NAME     VARCHAR2(50 BYTE)                 NOT NULL,
  FC_COMMENT  VARCHAR2(50 BYTE)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          200K
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

COMMENT ON TABLE ASU.TUSER_GROUPS IS 'Группы пользователей'
/

COMMENT ON COLUMN ASU.TUSER_GROUPS.FK_ID IS 'SEQUENCE=[SEQ_USER_GROUPS]'
/

COMMENT ON COLUMN ASU.TUSER_GROUPS.FC_NAME IS 'Название'
/

COMMENT ON COLUMN ASU.TUSER_GROUPS.FC_COMMENT IS 'Примечание'
/


--
-- PK_TUSER_GROUPS  (Index) 
--
--  Dependencies: 
--   TUSER_GROUPS (Table)
--
CREATE UNIQUE INDEX ASU.PK_TUSER_GROUPS ON ASU.TUSER_GROUPS
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
-- TUSER_GROUPS_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TUSER_GROUPS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TUSER_GROUPS_BEFORE_INSERT" 
BEFORE INSERT
ON asu.tuser_groups FOR EACH ROW
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
begin
    --  Column "FK_ID" uses sequence SEQ_USER_GROUPS
    if :new.FK_ID is null then
      select SEQ_USER_GROUPS.NEXTVAL INTO :new.FK_ID from dual;
    end if;
--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TUSER_GROUPS 
-- 
ALTER TABLE ASU.TUSER_GROUPS ADD (
  CONSTRAINT PK_TUSER_GROUPS
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

