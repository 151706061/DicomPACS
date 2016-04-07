ALTER TABLE ASU.TMDA_DBF
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TMDA_DBF CASCADE CONSTRAINTS
/

--
-- TMDA_DBF  (Table) 
--
CREATE TABLE ASU.TMDA_DBF
(
  FK_ID       NUMBER(15)                        NOT NULL,
  YEAR        NUMBER(4),
  MONTH       NUMBER(2),
  OWN         NUMBER(1),
  LPU_ID      NUMBER(10),
  PERSON_IDL  NUMBER(19),
  P_ID_ILL    NUMBER(2),
  ID_ILL      NUMBER(19),
  ID_ILL_U    NUMBER(19),
  POLICYSER   VARCHAR2(10 BYTE),
  POLICYNUM   VARCHAR2(20 BYTE),
  FAM         VARCHAR2(25 BYTE),
  IM          VARCHAR2(25 BYTE),
  OTCH        VARCHAR2(25 BYTE),
  DATE_B_DAY  DATE,
  DIA_E       VARCHAR2(8 BYTE),
  DATE_S      DATE,
  DATE_E      DATE,
  DATE_B_U    DATE,
  DATE_E_U    DATE,
  TYPE_USL    NUMBER(1),
  KOD_EO      VARCHAR2(20 BYTE),
  KOL_EO      NUMBER(5),
  TYPE_EO     NUMBER(2),
  IST_FIN     NUMBER(2),
  SBJ_MODERN  NUMBER(10,2),
  FED_MODERN  NUMBER(10,2),
  TRF_MODERN  NUMBER(10,2),
  SUM_MODERN  NUMBER(10,2),
  PRVSM_U     NUMBER(4),
  DOC_CD_U    VARCHAR2(20 BYTE),
  FK_SLUCHID  NUMBER(15),
  FK_USLID    NUMBER(15)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          16K
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

COMMENT ON TABLE ASU.TMDA_DBF IS 'Данные об оказанных медицинских услугах по программе модернизации (выгрузка в DBF, таблица MDA) Author:Efimov'
/

COMMENT ON COLUMN ASU.TMDA_DBF.FK_ID IS 'ASU.SEQ_TMDA_DBF'
/

COMMENT ON COLUMN ASU.TMDA_DBF.YEAR IS 'Год подачи реестра'
/

COMMENT ON COLUMN ASU.TMDA_DBF.MONTH IS 'Месяц подачи реестра'
/

COMMENT ON COLUMN ASU.TMDA_DBF.LPU_ID IS 'Код ЛПУ (Справочник LPU)'
/

COMMENT ON COLUMN ASU.TMDA_DBF.PERSON_IDL IS 'Локальный номер застрахованного в ЛПУ'
/

COMMENT ON COLUMN ASU.TMDA_DBF.ID_ILL IS 'Идентификационный номер случая'
/

COMMENT ON COLUMN ASU.TMDA_DBF.POLICYSER IS 'Серия полиса пациента'
/

COMMENT ON COLUMN ASU.TMDA_DBF.POLICYNUM IS 'Номер полиса'
/

COMMENT ON COLUMN ASU.TMDA_DBF.FAM IS 'Фамилия пациента'
/

COMMENT ON COLUMN ASU.TMDA_DBF.IM IS 'Имя пациента'
/

COMMENT ON COLUMN ASU.TMDA_DBF.OTCH IS 'Отчество пациента'
/

COMMENT ON COLUMN ASU.TMDA_DBF.DATE_B_DAY IS 'Дата рождения пациента'
/

COMMENT ON COLUMN ASU.TMDA_DBF.DIA_E IS 'Диагноз окончательный'
/

COMMENT ON COLUMN ASU.TMDA_DBF.DATE_S IS 'Дата начала заболевания'
/

COMMENT ON COLUMN ASU.TMDA_DBF.DATE_E IS 'Дата окончания заболевания'
/

COMMENT ON COLUMN ASU.TMDA_DBF.TYPE_USL IS '1-стационар (плановая госпитализация)
  2-поликлиника
  3-дневной стационар
  4 – стационар (экстренная госпитализация)
'
/

COMMENT ON COLUMN ASU.TMDA_DBF.KOD_EO IS 'Код единицы оплаты'
/

COMMENT ON COLUMN ASU.TMDA_DBF.KOL_EO IS 'Количество по полю (KOD_ EO)'
/


--
-- I_TMDA_DBF_ID_ILL  (Index) 
--
--  Dependencies: 
--   TMDA_DBF (Table)
--
CREATE INDEX ASU.I_TMDA_DBF_ID_ILL ON ASU.TMDA_DBF
(ID_ILL, P_ID_ILL)
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- I_TMDA_DBF_ID_ILL_U  (Index) 
--
--  Dependencies: 
--   TMDA_DBF (Table)
--
CREATE INDEX ASU.I_TMDA_DBF_ID_ILL_U ON ASU.TMDA_DBF
(ID_ILL_U)
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- K_TMDA_DBF_ID  (Index) 
--
--  Dependencies: 
--   TMDA_DBF (Table)
--
CREATE UNIQUE INDEX ASU.K_TMDA_DBF_ID ON ASU.TMDA_DBF
(FK_ID)
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TMDA_DBF_INSERT  (Trigger) 
--
--  Dependencies: 
--   TMDA_DBF (Table)
--
CREATE OR REPLACE TRIGGER ASU."TMDA_DBF_INSERT" 
 BEFORE
  INSERT
 ON ASU.TMDA_DBF REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  IF :new.fk_id IS NULL THEN
    SELECT asu.SEQ_TMDA_DBF.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  end if;
End;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TMDA_DBF 
-- 
ALTER TABLE ASU.TMDA_DBF ADD (
  CONSTRAINT K_TMDA_DBF_ID
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE USR
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

