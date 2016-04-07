ALTER TABLE ASU.TRIGHTS_GROUPS
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TRIGHTS_GROUPS CASCADE CONSTRAINTS
/

--
-- TRIGHTS_GROUPS  (Table) 
--
--  Dependencies: 
--   TRIGHTS (Table)
--   TUSER_GROUPS (Table)
--
CREATE TABLE ASU.TRIGHTS_GROUPS
(
  FK_ID          INTEGER                        NOT NULL,
  FK_RIGHT       INTEGER                        NOT NULL,
  FK_USER_GROUP  INTEGER,
  FN_ALLOW       INTEGER                        DEFAULT 1                     NOT NULL
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

COMMENT ON TABLE ASU.TRIGHTS_GROUPS IS 'Права групп - имеют высший приоритет'
/

COMMENT ON COLUMN ASU.TRIGHTS_GROUPS.FK_ID IS 'SEQUENCE=[SEQ_USER_RIGHTS]'
/

COMMENT ON COLUMN ASU.TRIGHTS_GROUPS.FN_ALLOW IS '0 запрещено 1 разрешено'
/


--
-- IX_RIGHTS_GROUPS_U  (Index) 
--
--  Dependencies: 
--   TRIGHTS_GROUPS (Table)
--
CREATE UNIQUE INDEX ASU.IX_RIGHTS_GROUPS_U ON ASU.TRIGHTS_GROUPS
(FK_RIGHT, FK_USER_GROUP)
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
-- PK_TRIGHTS_GROUPS  (Index) 
--
--  Dependencies: 
--   TRIGHTS_GROUPS (Table)
--
CREATE UNIQUE INDEX ASU.PK_TRIGHTS_GROUPS ON ASU.TRIGHTS_GROUPS
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
-- TRIGHTS_GROUPS_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TRIGHTS_GROUPS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRIGHTS_GROUPS_BEFORE_INSERT" 
 BEFORE INSERT
ON asu.trights_groups FOR EACH ROW
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
begin
    --  Column "FK_ID" uses sequence SEQ_USER_RIGHTS
    if :new.FK_ID is null then
      select SEQ_USER_RIGHTS.NEXTVAL INTO :new.FK_ID from dual;
    end if;
--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TRIGHTS_GROUPS 
-- 
ALTER TABLE ASU.TRIGHTS_GROUPS ADD (
  CONSTRAINT PK_TRIGHTS_GROUPS
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
-- Foreign Key Constraints for Table TRIGHTS_GROUPS 
-- 
ALTER TABLE ASU.TRIGHTS_GROUPS ADD (
  CONSTRAINT CK_TRIGHTS_GROUPS__TUSER_GR 
 FOREIGN KEY (FK_USER_GROUP) 
 REFERENCES ASU.TUSER_GROUPS (FK_ID),
  CONSTRAINT CK_TRIGHTS_GROUPS__TRIGHTS 
 FOREIGN KEY (FK_RIGHT) 
 REFERENCES ASU.TRIGHTS (FK_ID))
/

