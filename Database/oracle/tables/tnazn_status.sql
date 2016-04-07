ALTER TABLE ASU.TNAZN_STATUS
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TNAZN_STATUS CASCADE CONSTRAINTS
/

--
-- TNAZN_STATUS  (Table) 
--
CREATE TABLE ASU.TNAZN_STATUS
(
  FK_ID    INTEGER                              NOT NULL,
  FC_NAME  VARCHAR2(50 BYTE)                    NOT NULL
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

COMMENT ON TABLE ASU.TNAZN_STATUS IS 'Типы статусов назначений
Author: Ura'
/

COMMENT ON COLUMN ASU.TNAZN_STATUS.FC_NAME IS 'Название'
/


--
-- PK_TNAZN_STATUS  (Index) 
--
--  Dependencies: 
--   TNAZN_STATUS (Table)
--
CREATE UNIQUE INDEX ASU.PK_TNAZN_STATUS ON ASU.TNAZN_STATUS
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
-- TNAZN_STATUS_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TNAZN_STATUS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZN_STATUS_BEFORE_INSERT" 
 BEFORE
 INSERT
 ON asu.tnazn_status
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
begin
  Return;
--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TNAZN_STATUS 
-- 
ALTER TABLE ASU.TNAZN_STATUS ADD (
  CONSTRAINT PK_TNAZN_STATUS
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

