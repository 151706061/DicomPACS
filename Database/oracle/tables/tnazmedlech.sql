ALTER TABLE ASU.TNAZMEDLECH
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TNAZMEDLECH CASCADE CONSTRAINTS
/

--
-- TNAZMEDLECH  (Table) 
--
CREATE TABLE ASU.TNAZMEDLECH
(
  FK_ID              NUMBER(10)                 NOT NULL,
  FK_NAZMEDID        NUMBER(10)                 NOT NULL,
  FN_DOZA            NUMBER,
  FK_MEDICID         NUMBER(10),
  FC_REMARK          VARCHAR2(500 BYTE),
  FK_DOZUNITS        NUMBER(10),
  FN_KOL             NUMBER,
  FK_TREB_DPC        NUMBER(10),
  FK_MEDICID_BACKUP  NUMBER                     DEFAULT -1,
  FK_KOLUNITS        NUMBER,
  FN_PRICE           NUMBER,
  FN_SUMM            NUMBER,
  FN_CALCDOZA        NUMBER                     DEFAULT 0
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          736K
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

COMMENT ON TABLE ASU.TNAZMEDLECH IS 'Расшифровка медицинских назначений (Sill)'
/

COMMENT ON COLUMN ASU.TNAZMEDLECH.FK_ID IS 'SEQUENCE=[SEQ_TNAZMEDLECH]'
/

COMMENT ON COLUMN ASU.TNAZMEDLECH.FK_NAZMEDID IS 'Код медицинского назначения (см. табл. TNazMed)'
/

COMMENT ON COLUMN ASU.TNAZMEDLECH.FN_DOZA IS 'Доза препарата'
/

COMMENT ON COLUMN ASU.TNAZMEDLECH.FK_MEDICID IS 'Код медикамента (см. табл. Med.TMedic)'
/

COMMENT ON COLUMN ASU.TNAZMEDLECH.FC_REMARK IS 'Примечание'
/

COMMENT ON COLUMN ASU.TNAZMEDLECH.FK_DOZUNITS IS 'Единицы измерения дозы (см. табл. Med.TMassUnits) - на случай если не заполнено соответсвующее поле в Med.TMedic'
/

COMMENT ON COLUMN ASU.TNAZMEDLECH.FN_KOL IS 'Количество препарата в мед. назначении'
/

COMMENT ON COLUMN ASU.TNAZMEDLECH.FK_TREB_DPC IS 'Код расшифровки требований'
/

COMMENT ON COLUMN ASU.TNAZMEDLECH.FK_KOLUNITS IS 'Единицы измерения кол-ва (см. табл. Med.TMassUnits)'
/

COMMENT ON COLUMN ASU.TNAZMEDLECH.FN_PRICE IS 'Цена назначаемого медикамента'
/

COMMENT ON COLUMN ASU.TNAZMEDLECH.FN_SUMM IS 'Сумма за назначение'
/

COMMENT ON COLUMN ASU.TNAZMEDLECH.FN_CALCDOZA IS 'Доза препарата, рассчитанная по шаблонам Химиотерапии (столбец добавлен для модуля Chemotherapy.dll   by Slusarenko M.D.   30.10.2013)'
/


--
-- TNAZMEDLECH_BY_ID  (Index) 
--
--  Dependencies: 
--   TNAZMEDLECH (Table)
--
CREATE UNIQUE INDEX ASU.TNAZMEDLECH_BY_ID ON ASU.TNAZMEDLECH
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
-- TNAZMEDLECH_BY_NAZMEDID  (Index) 
--
--  Dependencies: 
--   TNAZMEDLECH (Table)
--
CREATE INDEX ASU.TNAZMEDLECH_BY_NAZMEDID ON ASU.TNAZMEDLECH
(FK_NAZMEDID)
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
-- TNAZMEDLECH_FK_TREB_DPC  (Index) 
--
--  Dependencies: 
--   TNAZMEDLECH (Table)
--
CREATE UNIQUE INDEX ASU.TNAZMEDLECH_FK_TREB_DPC ON ASU.TNAZMEDLECH
(FK_TREB_DPC)
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
-- TNML_MEDIC_EI  (Index) 
--
--  Dependencies: 
--   TNAZMEDLECH (Table)
--
CREATE INDEX ASU.TNML_MEDIC_EI ON ASU.TNAZMEDLECH
(FK_MEDICID, FK_KOLUNITS, FK_DOZUNITS)
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
-- TNAZMEDLECH_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TNAZMEDLECH (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZMEDLECH_BEFORE_INSERT" 
  BEFORE INSERT ON tnazmedlech
  FOR EACH ROW
BEGIN
  IF :NEW.FK_ID IS NULL THEN
    SELECT SEQ_tnazmedlech.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  END IF;
  
  :NEW.FN_CALCDOZA := :NEW.FN_DOZA;
    
END tnazmedlech_BEFORE_INSERT;
/
SHOW ERRORS;


DROP SYNONYM MED.TNAZMEDLECH
/

--
-- TNAZMEDLECH  (Synonym) 
--
--  Dependencies: 
--   TNAZMEDLECH (Table)
--
CREATE SYNONYM MED.TNAZMEDLECH FOR ASU.TNAZMEDLECH
/


-- 
-- Non Foreign Key Constraints for Table TNAZMEDLECH 
-- 
ALTER TABLE ASU.TNAZMEDLECH ADD (
  CONSTRAINT TNAZMEDLECH_BY_ID
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

GRANT DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE ON ASU.TNAZMEDLECH TO MED
/

