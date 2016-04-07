ALTER TABLE ASU.THEAL
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.THEAL CASCADE CONSTRAINTS
/

--
-- THEAL  (Table) 
--
CREATE TABLE ASU.THEAL
(
  FK_ID         NUMBER(6)                       NOT NULL,
  CODE          VARCHAR2(15 BYTE)               NOT NULL,
  FC_NAME       VARCHAR2(500 BYTE)              NOT NULL,
  FK_PARENT     INTEGER,
  FL_TMP        NUMBER,
  FP_HEALTYPE   NUMBER,
  FN_DLIT       NUMBER,
  FK_ID_COPIED  NUMBER,
  FK_DOCTYPEID  NUMBER,
  FL_NDS        NUMBER(1)                       DEFAULT 0,
  FN_DLIT_UET   NUMBER,
  FL_SLOGN_USL  NUMBER(1)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          480K
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

COMMENT ON TABLE ASU.THEAL IS 'Лечебные и диагностические процедуры и воздействия в стандартах лечения
Author: Ura
'
/

COMMENT ON COLUMN ASU.THEAL.FN_DLIT_UET IS 'Длительность выполнения услуги в минутах УЕТ'
/

COMMENT ON COLUMN ASU.THEAL.FL_SLOGN_USL IS 'сложная услуга'
/

COMMENT ON COLUMN ASU.THEAL.FK_ID IS 'SEQUENCE=[SEQ_HEAL]'
/

COMMENT ON COLUMN ASU.THEAL.CODE IS 'Шифр'
/

COMMENT ON COLUMN ASU.THEAL.FC_NAME IS 'Название'
/

COMMENT ON COLUMN ASU.THEAL.FK_PARENT IS 'Ссылка на родителя'
/

COMMENT ON COLUMN ASU.THEAL.FL_TMP IS 'by Serg (не Linnikov)'
/

COMMENT ON COLUMN ASU.THEAL.FP_HEALTYPE IS 'Тип услуги 0 - Стандарты лечения (Жуков), 1 - ТОМПы (Линников), 2 - платные услуги (ХЗ) - Added 20090206  by Linnikov'
/

COMMENT ON COLUMN ASU.THEAL.FN_DLIT IS 'Длительность выполнения услуги в минутах'
/

COMMENT ON COLUMN ASU.THEAL.FK_DOCTYPEID IS 'TDPCTYPE.FK_ID'
/


--
-- IQ_THEAL$CODE  (Index) 
--
--  Dependencies: 
--   THEAL (Table)
--
CREATE INDEX ASU.IQ_THEAL$CODE ON ASU.THEAL
(CODE)
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
-- IQ_THEAL$FC_NAME  (Index) 
--
--  Dependencies: 
--   THEAL (Table)
--
CREATE INDEX ASU.IQ_THEAL$FC_NAME ON ASU.THEAL
(FC_NAME)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          320K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- I_THEAL_FL_TMP  (Index) 
--
--  Dependencies: 
--   THEAL (Table)
--
CREATE INDEX ASU.I_THEAL_FL_TMP ON ASU.THEAL
(FL_TMP)
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
-- I_THEAL_HEALTYPE  (Index) 
--
--  Dependencies: 
--   THEAL (Table)
--
CREATE INDEX ASU.I_THEAL_HEALTYPE ON ASU.THEAL
(FP_HEALTYPE)
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
-- IX_THEAL$FK_PARENT  (Index) 
--
--  Dependencies: 
--   THEAL (Table)
--
CREATE INDEX ASU.IX_THEAL$FK_PARENT ON ASU.THEAL
(FK_PARENT)
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
-- PK_THEAL  (Index) 
--
--  Dependencies: 
--   THEAL (Table)
--
CREATE UNIQUE INDEX ASU.PK_THEAL ON ASU.THEAL
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
-- THEAL_FK_ID_COPIED  (Index) 
--
--  Dependencies: 
--   THEAL (Table)
--
CREATE INDEX ASU.THEAL_FK_ID_COPIED ON ASU.THEAL
(FK_ID_COPIED)
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
-- THEAL$BI  (Trigger) 
--
--  Dependencies: 
--   THEAL (Table)
--
CREATE OR REPLACE TRIGGER ASU."THEAL$BI" 
  BEFORE INSERT
  ON theal
  REFERENCING OLD AS OLD NEW AS NEW
  FOR EACH ROW
BEGIN
  IF :NEW.fk_id IS NULL
  THEN
    SELECT seq_heal.NEXTVAL
      INTO :NEW.fk_id
      FROM DUAL;
  END IF;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table THEAL 
-- 
ALTER TABLE ASU.THEAL ADD (
  CONSTRAINT PK_THEAL
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

GRANT SELECT ON ASU.THEAL TO EXCH43
/

GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE ON ASU.THEAL TO WORD
/

