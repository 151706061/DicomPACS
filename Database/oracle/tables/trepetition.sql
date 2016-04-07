ALTER TABLE ASU.TREPETITION
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TREPETITION CASCADE CONSTRAINTS
/

--
-- TREPETITION  (Table) 
--
--  Dependencies: 
--   TCATEGORY (Table)
--   TSTANDART_HEAL (Table)
--
CREATE TABLE ASU.TREPETITION
(
  FK_ID             NUMBER(6)                   NOT NULL,
  FK_CATEGORY       INTEGER                     NOT NULL,
  FK_STANDART_HEAL  INTEGER,
  REPETIT           INTEGER                     NOT NULL
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          1440K
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

COMMENT ON TABLE ASU.TREPETITION IS 'Кратность (Количество повторений) в стандартах лечения
Author: Ura'
/

COMMENT ON COLUMN ASU.TREPETITION.FK_ID IS 'SEQUENCE=[SEQ_REPETITION]'
/

COMMENT ON COLUMN ASU.TREPETITION.FK_CATEGORY IS 'ссылка на категорию'
/

COMMENT ON COLUMN ASU.TREPETITION.FK_STANDART_HEAL IS 'ссылка на стандарт лечения'
/

COMMENT ON COLUMN ASU.TREPETITION.REPETIT IS 'ЗНачение повторения'
/


--
-- IX_TREPETITON$FKS  (Index) 
--
--  Dependencies: 
--   TREPETITION (Table)
--
CREATE INDEX ASU.IX_TREPETITON$FKS ON ASU.TREPETITION
(FK_CATEGORY, FK_STANDART_HEAL)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          1600K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- PK_TREPETITION  (Index) 
--
--  Dependencies: 
--   TREPETITION (Table)
--
CREATE UNIQUE INDEX ASU.PK_TREPETITION ON ASU.TREPETITION
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          1280K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TREPETITION$BI  (Trigger) 
--
--  Dependencies: 
--   TREPETITION (Table)
--
CREATE OR REPLACE TRIGGER ASU."TREPETITION$BI" before insert
on ASU.TREPETITION for each row
begin
    --  Column "FK_ID" uses sequence SEQ_REPETITION
    if :new.FK_ID is null then
      select SEQ_REPETITION.NEXTVAL INTO :new.FK_ID  from dual;
    end if;
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TREPETITION 
-- 
ALTER TABLE ASU.TREPETITION ADD (
  CONSTRAINT PK_TREPETITION
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          1280K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

-- 
-- Foreign Key Constraints for Table TREPETITION 
-- 
ALTER TABLE ASU.TREPETITION ADD (
  CONSTRAINT FK_TREPETITION$TCATEGORY 
 FOREIGN KEY (FK_CATEGORY) 
 REFERENCES ASU.TCATEGORY (FK_ID),
  CONSTRAINT FK_TREPETITION$TSTANDART_HE 
 FOREIGN KEY (FK_STANDART_HEAL) 
 REFERENCES ASU.TSTANDART_HEAL (FK_ID))
/

