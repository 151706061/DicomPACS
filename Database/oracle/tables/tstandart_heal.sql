ALTER TABLE ASU.TSTANDART_HEAL
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TSTANDART_HEAL CASCADE CONSTRAINTS
/

--
-- TSTANDART_HEAL  (Table) 
--
--  Dependencies: 
--   THEAL (Table)
--   TSTANDART (Table)
--
CREATE TABLE ASU.TSTANDART_HEAL
(
  FK_ID        NUMBER(6)                        NOT NULL,
  FK_STANDART  INTEGER                          NOT NULL,
  FK_HEAL      INTEGER                          NOT NULL,
  PERCENT      INTEGER                          NOT NULL
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          960K
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

COMMENT ON TABLE ASU.TSTANDART_HEAL IS 'Связь между стандартами и лечебными процедурами. (Между таблицами THEAL и TSTANDART)
Author: Ura'
/

COMMENT ON COLUMN ASU.TSTANDART_HEAL.FK_ID IS 'SEQUENCE=[SEQ_STANDART_HEAL]'
/

COMMENT ON COLUMN ASU.TSTANDART_HEAL.FK_STANDART IS 'Ссылка на TSTANDART'
/

COMMENT ON COLUMN ASU.TSTANDART_HEAL.FK_HEAL IS 'ссылка на THEAL'
/

COMMENT ON COLUMN ASU.TSTANDART_HEAL.PERCENT IS 'Процент назначения (-1 означает по назанчению)'
/


--
-- IX_TSTANDART_HEAL$FK_HEAL  (Index) 
--
--  Dependencies: 
--   TSTANDART_HEAL (Table)
--
CREATE INDEX ASU.IX_TSTANDART_HEAL$FK_HEAL ON ASU.TSTANDART_HEAL
(FK_HEAL)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          800K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- IX_TSTANDART_HEAL$FK_STANDART  (Index) 
--
--  Dependencies: 
--   TSTANDART_HEAL (Table)
--
CREATE INDEX ASU.IX_TSTANDART_HEAL$FK_STANDART ON ASU.TSTANDART_HEAL
(FK_STANDART)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          800K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- IX_TSTANDART_HEAL$PERCENT  (Index) 
--
--  Dependencies: 
--   TSTANDART_HEAL (Table)
--
CREATE INDEX ASU.IX_TSTANDART_HEAL$PERCENT ON ASU.TSTANDART_HEAL
(PERCENT)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          960K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- PK_TSTANDART_HEAL  (Index) 
--
--  Dependencies: 
--   TSTANDART_HEAL (Table)
--
CREATE UNIQUE INDEX ASU.PK_TSTANDART_HEAL ON ASU.TSTANDART_HEAL
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          800K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TSTANDART_HEAL$BI  (Trigger) 
--
--  Dependencies: 
--   TSTANDART_HEAL (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSTANDART_HEAL$BI" before insert
on ASU.TSTANDART_HEAL for each row
begin
    --  Column "FK_ID" uses sequence SEQ_STANDART_HEAL
    if :new.FK_ID is null then
      select SEQ_STANDART_HEAL.NEXTVAL INTO :new.FK_ID  from dual;
    end if;
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TSTANDART_HEAL 
-- 
ALTER TABLE ASU.TSTANDART_HEAL ADD (
  CONSTRAINT PK_TSTANDART_HEAL
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          800K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

-- 
-- Foreign Key Constraints for Table TSTANDART_HEAL 
-- 
ALTER TABLE ASU.TSTANDART_HEAL ADD (
  CONSTRAINT FK_TSTANDART_HEAL$THEAL 
 FOREIGN KEY (FK_HEAL) 
 REFERENCES ASU.THEAL (FK_ID) DISABLE,
  CONSTRAINT FK_TSTANDART_HEAL$TSTANDART 
 FOREIGN KEY (FK_STANDART) 
 REFERENCES ASU.TSTANDART (FK_ID) DISABLE)
/

