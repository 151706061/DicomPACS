DROP TABLE ASU.TNAZHEAL CASCADE CONSTRAINTS
/

--
-- TNAZHEAL  (Table) 
--
CREATE TABLE ASU.TNAZHEAL
(
  FK_ID          NUMBER(15)                     NOT NULL,
  FK_NAZID       NUMBER(15),
  FK_HEALID      NUMBER(15),
  FN_HEAL_COUNT  NUMBER(15),
  FC_REMARK      VARCHAR2(255 BYTE)
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
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TNAZHEAL IS 'Таблица-связка назначения с кодом услуги'
/

COMMENT ON COLUMN ASU.TNAZHEAL.FK_ID IS 'SEQUENCE=[SEQ_TNAZHEAL]'
/

COMMENT ON COLUMN ASU.TNAZHEAL.FK_NAZID IS 'Код назначения (VNAZ.FK_ID)'
/

COMMENT ON COLUMN ASU.TNAZHEAL.FK_HEALID IS 'Код услуги (THEAL.FK_ID)'
/


--
-- TNAZHEAL_ID  (Index) 
--
--  Dependencies: 
--   TNAZHEAL (Table)
--
CREATE UNIQUE INDEX ASU.TNAZHEAL_ID ON ASU.TNAZHEAL
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
-- TNAZHEAL_NAZID  (Index) 
--
--  Dependencies: 
--   TNAZHEAL (Table)
--
CREATE INDEX ASU.TNAZHEAL_NAZID ON ASU.TNAZHEAL
(FK_NAZID)
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
-- TNAZHEAL_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TNAZHEAL (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZHEAL_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON asu.tnazheal
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN

  IF :new.fk_id IS NULL THEN
    SELECT asu.seq_tkarta.nextval INTO :NEW.FK_ID FROM DUAL;
-- Efimov V.A. 20121128 http://192.168.1.9/redmine/issues/20269 Перевёл на общую с asu.seq_tkarta сиквенцию,
-- для того, чтобы в выгрузке значение ID_ILL_U было уникальным, даже есть с назначением связано больше одной услуги.
--    SELECT SEQ_TNAZHEAL.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  END IF;
END;
/
SHOW ERRORS;


