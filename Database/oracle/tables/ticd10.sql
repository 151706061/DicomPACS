ALTER TABLE ASU.TICD10
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TICD10 CASCADE CONSTRAINTS
/

--
-- TICD10  (Table) 
--
--  Dependencies: 
--   TICD10 (Table)
--
CREATE TABLE ASU.TICD10
(
  FK_ID       INTEGER                           NOT NULL,
  FK_PARENT   INTEGER,
  FC_NAME     VARCHAR2(250 BYTE)                NOT NULL,
  FC_KOD      VARCHAR2(10 BYTE)                 NOT NULL,
  FC_SYMB     VARCHAR2(1 BYTE),
  FC_DESC     CLOB,
  FC_KOD1     VARCHAR2(10 BYTE),
  FL_CAN_DEL  NUMBER(1)                         DEFAULT null
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          2440K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
LOB (FC_DESC) STORE AS 
      ( TABLESPACE  USR 
        ENABLE      STORAGE IN ROW
        CHUNK       8192
        PCTVERSION  10
        NOCACHE
        NOLOGGING
        INDEX       (
          TABLESPACE USR
          STORAGE    (
                      INITIAL          64K
                      NEXT             1
                      MINEXTENTS       1
                      MAXEXTENTS       UNLIMITED
                      PCTINCREASE      0
                      BUFFER_POOL      DEFAULT
                     ))
        STORAGE    (
                    INITIAL          64K
                    NEXT             1M
                    MINEXTENTS       1
                    MAXEXTENTS       UNLIMITED
                    PCTINCREASE      0
                    BUFFER_POOL      DEFAULT
                   )
      )
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TICD10 IS 'International Classification of Diseases (русская аббревиатура - МКБ) - версия 10
Author: Ura'
/

COMMENT ON COLUMN ASU.TICD10.FK_ID IS 'SEQUENCE=[SEQ_ICD10]'
/

COMMENT ON COLUMN ASU.TICD10.FK_PARENT IS 'ссылка на родителя'
/

COMMENT ON COLUMN ASU.TICD10.FC_NAME IS 'Название'
/

COMMENT ON COLUMN ASU.TICD10.FC_KOD IS 'Код по классификаци МКБ может достигать длины 10'
/

COMMENT ON COLUMN ASU.TICD10.FC_SYMB IS 'доп символ (*,+)'
/

COMMENT ON COLUMN ASU.TICD10.FC_DESC IS 'Описание'
/

COMMENT ON COLUMN ASU.TICD10.FC_KOD1 IS 'Код без символа'
/


--
-- IDX$$_00910003  (Index) 
--
--  Dependencies: 
--   TICD10 (Table)
--
CREATE INDEX ASU.IDX$$_00910003 ON ASU.TICD10
(UPPER(SUBSTR("ASU"."GET_FULLMKB10"("FC_KOD"),1,20)), FK_PARENT, FK_ID)
NOLOGGING
TABLESPACE USR
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
-- PK_TICD10  (Index) 
--
--  Dependencies: 
--   TICD10 (Table)
--
CREATE UNIQUE INDEX ASU.PK_TICD10 ON ASU.TICD10
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          384K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TICD10$FC_KOD  (Index) 
--
--  Dependencies: 
--   TICD10 (Table)
--
CREATE INDEX ASU.TICD10$FC_KOD ON ASU.TICD10
(FC_KOD)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          384K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TICD10$FC_KOD1  (Index) 
--
--  Dependencies: 
--   TICD10 (Table)
--
CREATE INDEX ASU.TICD10$FC_KOD1 ON ASU.TICD10
(FC_KOD1)
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
-- TICD10$FC_NAME  (Index) 
--
--  Dependencies: 
--   TICD10 (Table)
--
CREATE INDEX ASU.TICD10$FC_NAME ON ASU.TICD10
(FC_NAME)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          1M
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TICD10$FK_PARENT  (Index) 
--
--  Dependencies: 
--   TICD10 (Table)
--
CREATE INDEX ASU.TICD10$FK_PARENT ON ASU.TICD10
(FK_PARENT)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          384K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TICD10$FUNCMKB10  (Index) 
--
--  Dependencies: 
--   TICD10 (Table)
--
CREATE INDEX ASU.TICD10$FUNCMKB10 ON ASU.TICD10
(SUBSTR("ASU"."GET_FULLMKB10"("FC_KOD"),1,20))
NOLOGGING
TABLESPACE USR
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
-- TICD10$UPPER_FUNCMKB10  (Index) 
--
--  Dependencies: 
--   TICD10 (Table)
--
CREATE INDEX ASU.TICD10$UPPER_FUNCMKB10 ON ASU.TICD10
(UPPER(SUBSTR("ASU"."GET_FULLMKB10"("FC_KOD"),1,20)))
NOLOGGING
TABLESPACE USR
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
-- TIB_TICD10  (Trigger) 
--
--  Dependencies: 
--   TICD10 (Table)
--
CREATE OR REPLACE TRIGGER ASU."TIB_TICD10" before insert
on TICD10 for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "FK_ID" uses sequence SEQ_ICD10
    if :new.FK_ID is null then
      select SEQ_ICD10.NEXTVAL INTO :new.FK_ID from dual;
    end if;  

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TICD10 
-- 
ALTER TABLE ASU.TICD10 ADD (
  CONSTRAINT PK_TICD10
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          384K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

-- 
-- Foreign Key Constraints for Table TICD10 
-- 
ALTER TABLE ASU.TICD10 ADD (
  CONSTRAINT CK_TICD10__TICD10 
 FOREIGN KEY (FK_PARENT) 
 REFERENCES ASU.TICD10 (FK_ID))
/

GRANT REFERENCES, SELECT ON ASU.TICD10 TO EXCHANGE
/

GRANT REFERENCES, SELECT ON ASU.TICD10 TO EXCH43
/

