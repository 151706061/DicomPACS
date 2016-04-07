DROP TABLE ASU.TTUBPARAM CASCADE CONSTRAINTS
/

--
-- TTUBPARAM  (Table) 
--
CREATE TABLE ASU.TTUBPARAM
(
  FK_ID                NUMBER(15)               NOT NULL,
  FK_NAZID             NUMBER,
  FK_PERIODID_REC      NUMBER,
  FN_COUNTYEAR         NUMBER(3),
  FD_BEGIN             DATE,
  FK_PERIODID_OUT_REC  NUMBER,
  FD_END               DATE,
  FN_DAYS_REC          NUMBER(15),
  FK_PLACE             NUMBER
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
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TTUBPARAM IS '“аблица, содержаща€ в себе параметры периодичности флюорографических осмотров пациента, поставленного на туберкулезный учет'
/

COMMENT ON COLUMN ASU.TTUBPARAM.FK_ID IS '”никальный код'
/

COMMENT ON COLUMN ASU.TTUBPARAM.FK_NAZID IS 'VNAZ.FK_ID (ссылка на постановку на учет в тубдиспансере)'
/

COMMENT ON COLUMN ASU.TTUBPARAM.FK_PERIODID_REC IS 'TSMID.FK_ID (ссылка на периодичность при рецидиве)'
/

COMMENT ON COLUMN ASU.TTUBPARAM.FN_COUNTYEAR IS 'ѕродолжительность периодичности при рецидиве(лет)'
/

COMMENT ON COLUMN ASU.TTUBPARAM.FD_BEGIN IS 'Ќачина€ с какой даты отсчитывать периодичность при рецидиве'
/

COMMENT ON COLUMN ASU.TTUBPARAM.FK_PERIODID_OUT_REC IS 'TSMID.FK_ID (ссылка на периодичность при отсутствии рецидиве)'
/

COMMENT ON COLUMN ASU.TTUBPARAM.FD_END IS '«аканчива€ какой датой считать окончание рецидива'
/

COMMENT ON COLUMN ASU.TTUBPARAM.FN_DAYS_REC IS ' ол-во дней через которые необходимо проходить флюорографию'
/

COMMENT ON COLUMN ASU.TTUBPARAM.FK_PLACE IS 'tsmid.fk_id (место обслуживани€)'
/


--
-- TTUBPARAM_BY_BEGINEND  (Index) 
--
--  Dependencies: 
--   TTUBPARAM (Table)
--
CREATE INDEX ASU.TTUBPARAM_BY_BEGINEND ON ASU.TTUBPARAM
(FD_BEGIN, FD_END)
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
-- TTUBPARAM_BY_NAZID  (Index) 
--
--  Dependencies: 
--   TTUBPARAM (Table)
--
CREATE INDEX ASU.TTUBPARAM_BY_NAZID ON ASU.TTUBPARAM
(FK_NAZID)
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
-- TTUBPARAM_DELETE  (Trigger) 
--
--  Dependencies: 
--   TTUBPARAM (Table)
--
CREATE OR REPLACE TRIGGER ASU."TTUBPARAM_DELETE" 
 BEFORE
  DELETE
 ON asu.ttubparam
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
  DELETE FROM ASU.TPLANTUB WHERE FK_TUBID = :OLD.FK_ID;
END;
/
SHOW ERRORS;


--
-- TTUBPARAM_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TTUBPARAM (Table)
--
CREATE OR REPLACE TRIGGER ASU."TTUBPARAM_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON asu.ttubparam
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
  SELECT SEQ_TTUBPARAM.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
END;
/
SHOW ERRORS;


