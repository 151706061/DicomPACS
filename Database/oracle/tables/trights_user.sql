ALTER TABLE ASU.TRIGHTS_USER
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TRIGHTS_USER CASCADE CONSTRAINTS
/

--
-- TRIGHTS_USER  (Table) 
--
--  Dependencies: 
--   TRIGHTS (Table)
--
CREATE TABLE ASU.TRIGHTS_USER
(
  FK_ID     INTEGER                             NOT NULL,
  FK_RIGHT  INTEGER                             NOT NULL,
  FK_SOTR   INTEGER                             NOT NULL,
  FN_ALLOW  INTEGER                             DEFAULT 1                     NOT NULL
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

COMMENT ON TABLE ASU.TRIGHTS_USER IS 'Права пользователя - имеют высший приоритет'
/

COMMENT ON COLUMN ASU.TRIGHTS_USER.FK_ID IS 'SEQUENCE=[SEQ_USER_RIGHTS]'
/

COMMENT ON COLUMN ASU.TRIGHTS_USER.FN_ALLOW IS '0 запрещено 1 разрешено'
/


--
-- IX_RIGHTS_USER_U  (Index) 
--
--  Dependencies: 
--   TRIGHTS_USER (Table)
--
CREATE UNIQUE INDEX ASU.IX_RIGHTS_USER_U ON ASU.TRIGHTS_USER
(FK_RIGHT, FK_SOTR)
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
-- PK_TRIGHTS_USER  (Index) 
--
--  Dependencies: 
--   TRIGHTS_USER (Table)
--
CREATE UNIQUE INDEX ASU.PK_TRIGHTS_USER ON ASU.TRIGHTS_USER
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
-- TRIGHTS_USER_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TRIGHTS_USER (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRIGHTS_USER_BEFORE_INSERT" 
 BEFORE INSERT
ON asu.trights_user FOR EACH ROW
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
-- Non Foreign Key Constraints for Table TRIGHTS_USER 
-- 
ALTER TABLE ASU.TRIGHTS_USER ADD (
  CONSTRAINT PK_TRIGHTS_USER
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
-- Foreign Key Constraints for Table TRIGHTS_USER 
-- 
ALTER TABLE ASU.TRIGHTS_USER ADD (
  CONSTRAINT CK_TRIGHTS_USER__TRIGHTS 
 FOREIGN KEY (FK_RIGHT) 
 REFERENCES ASU.TRIGHTS (FK_ID))
/

