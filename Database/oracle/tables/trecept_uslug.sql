ALTER TABLE ASU.TRECEPT_USLUG
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TRECEPT_USLUG CASCADE CONSTRAINTS
/

--
-- TRECEPT_USLUG  (Table) 
--
--  Dependencies: 
--   TNAZN (Table)
--   TRECEPTION (Table)
--
CREATE TABLE ASU.TRECEPT_USLUG
(
  FK_ID         INTEGER                         NOT NULL,
  FK_NAZN       INTEGER                         NOT NULL,
  FK_RECEPTION  INTEGER,
  FK_USLUG      INTEGER,
  FK_SMID       INTEGER                         NOT NULL
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

COMMENT ON TABLE ASU.TRECEPT_USLUG IS 'Услуги по приему'
/

COMMENT ON COLUMN ASU.TRECEPT_USLUG.FK_ID IS 'SEQUENCE=[SEQ_TRECEPT_USLUG]'
/


--
-- PK_TRECEPT_USLUG  (Index) 
--
--  Dependencies: 
--   TRECEPT_USLUG (Table)
--
CREATE UNIQUE INDEX ASU.PK_TRECEPT_USLUG ON ASU.TRECEPT_USLUG
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
-- TRECEPT_USLUG_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TRECEPT_USLUG (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECEPT_USLUG_BEFORE_INSERT" 
 BEFORE INSERT
ON asu.trecept_uslug FOR EACH ROW
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
begin
    --  Column "FK_ID" uses sequence SEQ_TRECEPT_USLUG
    if :new.FK_ID is null then
      select SEQ_TRECEPT_USLUG.NEXTVAL INTO :new.FK_ID from dual;
    end if;
--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TRECEPT_USLUG 
-- 
ALTER TABLE ASU.TRECEPT_USLUG ADD (
  CONSTRAINT PK_TRECEPT_USLUG
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
-- Foreign Key Constraints for Table TRECEPT_USLUG 
-- 
ALTER TABLE ASU.TRECEPT_USLUG ADD (
  CONSTRAINT CK_TRECEPT_USLUG__TNAZN 
 FOREIGN KEY (FK_NAZN) 
 REFERENCES ASU.TNAZN (FK_ID),
  CONSTRAINT CK_TRECEPT_USLUG__TRECEPTI 
 FOREIGN KEY (FK_RECEPTION) 
 REFERENCES ASU.TRECEPTION (FK_ID))
/

