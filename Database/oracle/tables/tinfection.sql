ALTER TABLE ASU.TINFECTION
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TINFECTION CASCADE CONSTRAINTS
/

--
-- TINFECTION  (Table) 
--
--  Dependencies: 
--   TVAC_TEST (Table)
--
CREATE TABLE ASU.TINFECTION
(
  FK_ID           INTEGER                       NOT NULL,
  FC_NAME         VARCHAR2(150 BYTE)            NOT NULL,
  REMARK          VARCHAR2(1000 BYTE),
  FL_NATION       INTEGER                       NOT NULL,
  FN_YEAR_EFFECT  INTEGER,
  FK_VACTEST      INTEGER
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          40K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOLOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TINFECTION IS 'Инфекции :: Справочник
Author: Ura'
/

COMMENT ON COLUMN ASU.TINFECTION.FK_ID IS 'SEQUENCE=[SEQ_INFECTION]'
/

COMMENT ON COLUMN ASU.TINFECTION.FC_NAME IS 'Название инфекции'
/

COMMENT ON COLUMN ASU.TINFECTION.REMARK IS 'Краткое описание'
/

COMMENT ON COLUMN ASU.TINFECTION.FL_NATION IS '0- Не входит в календарь прививок Россия, 1 - входит в календарь прививок'
/

COMMENT ON COLUMN ASU.TINFECTION.FN_YEAR_EFFECT IS 'Срок действия иммунитета в годах'
/

COMMENT ON COLUMN ASU.TINFECTION.FK_VACTEST IS 'Проба по умолчанию'
/


--
-- PK_TINFECTION  (Index) 
--
--  Dependencies: 
--   TINFECTION (Table)
--
CREATE UNIQUE INDEX ASU.PK_TINFECTION ON ASU.TINFECTION
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
-- TINFECTION_FC_NAME  (Index) 
--
--  Dependencies: 
--   TINFECTION (Table)
--
CREATE UNIQUE INDEX ASU.TINFECTION_FC_NAME ON ASU.TINFECTION
(FC_NAME)
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
-- TINFECTION_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TINFECTION (Table)
--
CREATE OR REPLACE TRIGGER ASU."TINFECTION_BEFORE_INSERT" BEFORE INSERT
ON ASU.TINFECTION FOR EACH ROW
begin
     --  Column "FK_ID" uses sequence SEQ_INFECTION
       IF :NEW.FK_ID IS NULL
       THEN
          SELECT SEQ_INFECTION.NEXTVAL INTO :NEW.FK_ID from dual;
       END IF;
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TINFECTION 
-- 
ALTER TABLE ASU.TINFECTION ADD (
  CONSTRAINT PK_TINFECTION
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
-- Foreign Key Constraints for Table TINFECTION 
-- 
ALTER TABLE ASU.TINFECTION ADD (
  CONSTRAINT FK_TINFECTION$TVAC_TEST 
 FOREIGN KEY (FK_VACTEST) 
 REFERENCES ASU.TVAC_TEST (FK_ID))
/

