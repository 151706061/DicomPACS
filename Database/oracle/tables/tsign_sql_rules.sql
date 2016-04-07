ALTER TABLE ASU.TSIGN_SQL_RULES
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TSIGN_SQL_RULES CASCADE CONSTRAINTS
/

--
-- TSIGN_SQL_RULES  (Table) 
--
CREATE TABLE ASU.TSIGN_SQL_RULES
(
  FK_ID       INTEGER                           NOT NULL,
  FC_SQL      VARCHAR2(4000 BYTE),
  FC_TABLE    VARCHAR2(50 BYTE),
  FC_COMMENT  VARCHAR2(255 BYTE)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
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

COMMENT ON TABLE ASU.TSIGN_SQL_RULES IS 'Запросы, собирающие подписываемые строки Author: Linnikov'
/

COMMENT ON COLUMN ASU.TSIGN_SQL_RULES.FK_ID IS 'SEQ_TSIGN_SQL_RULES'
/

COMMENT ON COLUMN ASU.TSIGN_SQL_RULES.FC_SQL IS 'Запрос, возвращающий подписываемую строку'
/

COMMENT ON COLUMN ASU.TSIGN_SQL_RULES.FC_TABLE IS 'Главная таблица (FK_ID должен быть передан в качестве параметра)'
/

COMMENT ON COLUMN ASU.TSIGN_SQL_RULES.FC_COMMENT IS 'Примечание (описание того, что подписывается)'
/


--
-- TSIGN_SQL_RULES_FC_TABLE  (Index) 
--
--  Dependencies: 
--   TSIGN_SQL_RULES (Table)
--
CREATE UNIQUE INDEX ASU.TSIGN_SQL_RULES_FC_TABLE ON ASU.TSIGN_SQL_RULES
(FC_TABLE)
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
-- TSIGN_SQL_RULES_PK  (Index) 
--
--  Dependencies: 
--   TSIGN_SQL_RULES (Table)
--
CREATE UNIQUE INDEX ASU.TSIGN_SQL_RULES_PK ON ASU.TSIGN_SQL_RULES
(FK_ID)
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
-- TSIGN_SQL_RULES_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TSIGN_SQL_RULES (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSIGN_SQL_RULES_BEFORE_INSERT" 
  BEFORE INSERT
  ON ASU.TSIGN_SQL_RULES   REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
Begin
  if :NEW.FK_ID is null then
    SELECT SEQ_TSIGN_SQL_RULES.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  end if;
End;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TSIGN_SQL_RULES 
-- 
ALTER TABLE ASU.TSIGN_SQL_RULES ADD (
  CONSTRAINT TSIGN_SQL_RULES_PK
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
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
               ))
/

