ALTER TABLE ASU.TRECEPTION_PVN
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TRECEPTION_PVN CASCADE CONSTRAINTS
/

--
-- TRECEPTION_PVN  (Table) 
--
--  Dependencies: 
--   TRECEPTION (Table)
--
CREATE TABLE ASU.TRECEPTION_PVN
(
  FK_ID         INTEGER                         NOT NULL,
  FK_RECEPTION  INTEGER                         NOT NULL,
  FN            NUMBER                          NOT NULL,
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

COMMENT ON TABLE ASU.TRECEPTION_PVN IS 'Значения параметра типа NUMBER для результатов
Author: Ura'
/

COMMENT ON COLUMN ASU.TRECEPTION_PVN.FK_ID IS 'SEQUENCE=[SEQ_NAZN_PV]'
/

COMMENT ON COLUMN ASU.TRECEPTION_PVN.FK_RECEPTION IS 'Ссылка на прием'
/

COMMENT ON COLUMN ASU.TRECEPTION_PVN.FN IS 'Значение типа NUMBER'
/

COMMENT ON COLUMN ASU.TRECEPTION_PVN.FK_SMID IS 'ссылка на параметр в SMID'
/


--
-- PK_TRECEPTION_PVN  (Index) 
--
--  Dependencies: 
--   TRECEPTION_PVN (Table)
--
CREATE UNIQUE INDEX ASU.PK_TRECEPTION_PVN ON ASU.TRECEPTION_PVN
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
-- TRECEPTION_PVN_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TRECEPTION_PVN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECEPTION_PVN_BEFORE_INSERT" 
 BEFORE INSERT
ON asu.treception_pvn FOR EACH ROW
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;
begin
    --  Column "FK_ID" uses sequence SEQ_NAZN_PV
    if :new.FK_ID is null then
      select SEQ_NAZN_PV.NEXTVAL INTO :new.FK_ID from dual;
    end if;
--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TRECEPTION_PVN 
-- 
ALTER TABLE ASU.TRECEPTION_PVN ADD (
  CONSTRAINT PK_TRECEPTION_PVN
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
-- Foreign Key Constraints for Table TRECEPTION_PVN 
-- 
ALTER TABLE ASU.TRECEPTION_PVN ADD (
  CONSTRAINT CK_TRECEPTION_PVN__TRECEPTI 
 FOREIGN KEY (FK_RECEPTION) 
 REFERENCES ASU.TRECEPTION (FK_ID))
/

