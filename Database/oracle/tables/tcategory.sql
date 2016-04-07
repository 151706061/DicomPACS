ALTER TABLE ASU.TCATEGORY
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TCATEGORY CASCADE CONSTRAINTS
/

--
-- TCATEGORY  (Table) 
--
--  Dependencies: 
--   TSTANDART (Table)
--
CREATE TABLE ASU.TCATEGORY
(
  FK_ID        NUMBER(6)                        NOT NULL,
  FK_STANDART  INTEGER                          NOT NULL,
  FC_NAME      VARCHAR2(50 BYTE),
  NUM          INTEGER                          NOT NULL,
  PERIOD       INTEGER                          NOT NULL
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

COMMENT ON TABLE ASU.TCATEGORY IS 'Категории степени тяжести заболеваний, от них зависят сроки лечения
Используются в стандартах лечения
Author: Ura'
/

COMMENT ON COLUMN ASU.TCATEGORY.FK_ID IS 'SEQUENCE=[SEQ_CATEGORY]'
/

COMMENT ON COLUMN ASU.TCATEGORY.FK_STANDART IS 'Ссылка на стандарт'
/

COMMENT ON COLUMN ASU.TCATEGORY.FC_NAME IS 'Название, может быт пустым'
/

COMMENT ON COLUMN ASU.TCATEGORY.NUM IS 'Порядковый номер'
/

COMMENT ON COLUMN ASU.TCATEGORY.PERIOD IS 'Срок лечения в днях'
/


--
-- IX_TCATEGORY$FK_STANDART  (Index) 
--
--  Dependencies: 
--   TCATEGORY (Table)
--
CREATE INDEX ASU.IX_TCATEGORY$FK_STANDART ON ASU.TCATEGORY
(FK_STANDART)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- PK_TCATEGORY  (Index) 
--
--  Dependencies: 
--   TCATEGORY (Table)
--
CREATE UNIQUE INDEX ASU.PK_TCATEGORY ON ASU.TCATEGORY
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TCATEGORY$BI  (Trigger) 
--
--  Dependencies: 
--   TCATEGORY (Table)
--
CREATE OR REPLACE TRIGGER ASU."TCATEGORY$BI" before insert
on ASU.TCATEGORY for each row
begin
    --  Column "FK_ID" uses sequence SEQ_CATEGORY
    if :new.FK_ID is null then
      select SEQ_CATEGORY.NEXTVAL INTO :new.FK_ID  from dual;
    end if;
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TCATEGORY 
-- 
ALTER TABLE ASU.TCATEGORY ADD (
  CONSTRAINT PK_TCATEGORY
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          160K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

-- 
-- Foreign Key Constraints for Table TCATEGORY 
-- 
ALTER TABLE ASU.TCATEGORY ADD (
  CONSTRAINT FK_TCATEGORY$TSTANDART 
 FOREIGN KEY (FK_STANDART) 
 REFERENCES ASU.TSTANDART (FK_ID))
/

