ALTER TABLE ASU.TUSL_DBF
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TUSL_DBF CASCADE CONSTRAINTS
/

--
-- TUSL_DBF  (Table) 
--
CREATE TABLE ASU.TUSL_DBF
(
  OWN                 NUMBER(1),
  TYPE_FIN            NUMBER(1),
  GLOBAL_ID           NUMBER(19),
  YEAR                NUMBER(4),
  MONTH               NUMBER(2),
  LPU_ID              NUMBER(10),
  LPU_NAPR            NUMBER(10),
  TFOMS_ID            NUMBER(10),
  PERSON_IDL          NUMBER(19),
  ID_ILL              NUMBER(19),
  ID_ILL_U            NUMBER(19),
  POLICYSER           VARCHAR2(10 BYTE),
  POLICYNUM           VARCHAR2(20 BYTE),
  TYPE_USL            NUMBER(1),
  DATE_B_U            DATE,
  DATE_E_U            DATE,
  V_MU                NUMBER(3),
  PR_MP               NUMBER(3),
  KOD_MU              NUMBER(1),
  KOL_MU              NUMBER(5,2),
  TYPE_EO             NUMBER(2),
  KOD_EO              VARCHAR2(20 BYTE),
  KOL_EO              NUMBER(5),
  COST_EO             NUMBER(10,2),
  SUM_EO              NUMBER(10,2),
  N_QU                NUMBER(1),
  N_TOOTH             NUMBER(1),
  P_TOOTH             VARCHAR2(6 BYTE),
  N_QU2               NUMBER(1),
  N_TOOTH2            NUMBER(1),
  P_TOOTH2            VARCHAR2(6 BYTE),
  N_QU3               NUMBER(1),
  N_TOOTH3            NUMBER(1),
  P_TOOTH3            VARCHAR2(6 BYTE),
  N_QU4               NUMBER(1),
  N_TOOTH4            NUMBER(1),
  P_TOOTH4            VARCHAR2(6 BYTE),
  N_QU5               NUMBER(1),
  N_TOOTH5            NUMBER(1),
  P_TOOTH5            VARCHAR2(6 BYTE),
  N_QU6               NUMBER(1),
  N_TOOTH6            NUMBER(1),
  P_TOOTH6            VARCHAR2(6 BYTE),
  N_QU7               NUMBER(1),
  N_TOOTH7            NUMBER(1),
  P_TOOTH7            VARCHAR2(6 BYTE),
  N_QU8               NUMBER(1),
  N_TOOTH8            NUMBER(1),
  P_TOOTH8            VARCHAR2(6 BYTE),
  DOC_CD_U            VARCHAR2(20 BYTE),
  PRVSM_U             NUMBER(4),
  P_ID_ILL            NUMBER(2),
  LPU_INTR            NUMBER(10),
  COST_MODER          NUMBER(10,2),
  SUM_MODERN          NUMBER(10,2),
  Z$NAZ_ID            NUMBER,
  Z$FL_POLY           NUMBER(1),
  FK_ID               NUMBER(15)                NOT NULL,
  FK_SLUCHID          NUMBER(15),
  FK_PREGROUPSLUCHID  NUMBER(15),
  FK_GROUPUSL         NUMBER(1)                 DEFAULT 0,
  FK_KOYKAVIDID       NUMBER(15),
  FK_SOTRID           NUMBER(15),
  COST_MODER_F        NUMBER(10,2),
  MODERN_CODE         VARCHAR2(20 BYTE),
  DATE_B_U_TIME       DATE,
  DATE_E_U_TIME       DATE,
  FK_PACID            NUMBER(15)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          16K
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

COMMENT ON TABLE ASU.TUSL_DBF IS 'Загруженные из USA файла услуги (создана для решения задачи загрузки ошибок ОФОМС) Author:Efimov'
/

COMMENT ON COLUMN ASU.TUSL_DBF.OWN IS 'Признак места страхования '
/

COMMENT ON COLUMN ASU.TUSL_DBF.GLOBAL_ID IS 'Глобальный номер застрахованного на территории ХМАО '
/

COMMENT ON COLUMN ASU.TUSL_DBF.YEAR IS 'Отчетный период'
/

COMMENT ON COLUMN ASU.TUSL_DBF.MONTH IS 'Отчетный период'
/

COMMENT ON COLUMN ASU.TUSL_DBF.LPU_ID IS 'Справочник LPU'
/

COMMENT ON COLUMN ASU.TUSL_DBF.TFOMS_ID IS 'Для застрахованных на территории ХМАО-Югра =86, для застрахованных на иных территориях РФ, согласно справочника TFOMS'
/

COMMENT ON COLUMN ASU.TUSL_DBF.PERSON_IDL IS 'Определяется в ЛПУ, уникальный в рамках ЛПУ'
/

COMMENT ON COLUMN ASU.TUSL_DBF.ID_ILL IS 'Уникальный номер для каждого случая заболевания в рамках отдельного ЛПУ'
/

COMMENT ON COLUMN ASU.TUSL_DBF.POLICYSER IS 'Серия полиса'
/

COMMENT ON COLUMN ASU.TUSL_DBF.POLICYNUM IS 'Номер полиса'
/

COMMENT ON COLUMN ASU.TUSL_DBF.TYPE_USL IS '1-стационар (плановая госпитализация)
  2-поликлиника
  3-дневной стационар
  4 – стационар (экстренная госпитализация)
'
/

COMMENT ON COLUMN ASU.TUSL_DBF.DATE_B_U IS 'Дата начала выполнения услуги'
/

COMMENT ON COLUMN ASU.TUSL_DBF.DATE_E_U IS 'Дата конца выполнения услуги'
/

COMMENT ON COLUMN ASU.TUSL_DBF.V_MU IS 'Вид медицинской помощи (Справочник PMSP)'
/

COMMENT ON COLUMN ASU.TUSL_DBF.KOD_MU IS 'Код единицы учета медицинской помощи (Справочник EU_MP)'
/

COMMENT ON COLUMN ASU.TUSL_DBF.KOL_MU IS 'Количество единиц учета медицинской помощи'
/

COMMENT ON COLUMN ASU.TUSL_DBF.TYPE_EO IS 'Тип единицы оплаты (Справочник EDOP)'
/

COMMENT ON COLUMN ASU.TUSL_DBF.KOD_EO IS 'Код единицы оплаты'
/

COMMENT ON COLUMN ASU.TUSL_DBF.KOL_EO IS 'Количество по полю (KOD_ EO)'
/

COMMENT ON COLUMN ASU.TUSL_DBF.COST_EO IS 'Цена единицы оплаты'
/

COMMENT ON COLUMN ASU.TUSL_DBF.SUM_EO IS 'Предъявленная  ЛПУ сумма оплаты'
/

COMMENT ON COLUMN ASU.TUSL_DBF.N_QU IS 'Номер сегмента (квадранта) соответствующей стороны верхней и нижней челюсти (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF.N_TOOTH IS 'Номер зуба (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF.P_TOOTH IS 'Поверхность зуба (PZ)'
/

COMMENT ON COLUMN ASU.TUSL_DBF.N_QU2 IS 'Номер сегмента (квадранта) соответствующей стороны верхней и нижней челюсти (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF.N_TOOTH2 IS 'Номер зуба (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF.P_TOOTH2 IS 'Поверхность зуба (PZ)'
/

COMMENT ON COLUMN ASU.TUSL_DBF.N_QU3 IS 'Номер сегмента (квадранта) соответствующей стороны верхней и нижней челюсти (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF.N_TOOTH3 IS 'Номер зуба (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF.P_TOOTH3 IS 'Поверхность зуба (PZ)'
/

COMMENT ON COLUMN ASU.TUSL_DBF.N_QU4 IS 'Номер сегмента (квадранта) соответствующей стороны верхней и нижней челюсти (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF.N_TOOTH4 IS 'Номер зуба (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF.P_TOOTH4 IS 'Поверхность зуба (PZ)'
/

COMMENT ON COLUMN ASU.TUSL_DBF.N_QU5 IS 'Номер сегмента (квадранта) соответствующей стороны верхней и нижней челюсти (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF.N_TOOTH5 IS 'Номер зуба (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF.P_TOOTH5 IS 'Поверхность зуба (PZ)'
/

COMMENT ON COLUMN ASU.TUSL_DBF.N_QU6 IS 'Номер сегмента (квадранта) соответствующей стороны верхней и нижней челюсти (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF.N_TOOTH6 IS 'Номер зуба (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF.P_TOOTH6 IS 'Поверхность зуба (PZ)'
/

COMMENT ON COLUMN ASU.TUSL_DBF.N_QU7 IS 'Номер сегмента (квадранта) соответствующей стороны верхней и нижней челюсти (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF.N_TOOTH7 IS 'Номер зуба (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF.P_TOOTH7 IS 'Поверхность зуба (PZ)'
/

COMMENT ON COLUMN ASU.TUSL_DBF.N_QU8 IS 'Номер сегмента (квадранта) соответствующей стороны верхней и нижней челюсти (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF.N_TOOTH8 IS 'Номер зуба (ZF)'
/

COMMENT ON COLUMN ASU.TUSL_DBF.P_TOOTH8 IS 'Поверхность зуба (PZ)'
/

COMMENT ON COLUMN ASU.TUSL_DBF.Z$NAZ_ID IS 'Служебное поле'
/

COMMENT ON COLUMN ASU.TUSL_DBF.Z$FL_POLY IS 'Служебное поле 1 - поликлиника 0 - стационар'
/

COMMENT ON COLUMN ASU.TUSL_DBF.FK_ID IS 'SEQ_TUSL_DBF'
/

COMMENT ON COLUMN ASU.TUSL_DBF.FK_SLUCHID IS 'TSLUCH_DBF.FK_ID'
/

COMMENT ON COLUMN ASU.TUSL_DBF.FK_PREGROUPSLUCHID IS 'Если случай, к которому относится услуга был сгруппирован с другими в случай группу, то FK_SLUCHID услуги будет скопировано в FK_PREGROUPSLUCHID, а в FK_SLUCHID будет записан  TSLUCH_DBF.FK_ID случая-группы'
/

COMMENT ON COLUMN ASU.TUSL_DBF.FK_GROUPUSL IS '0 - обычная услуга, 1 - услуга-группа, добавленная в результате группировки, в рамках случая, подряд идущих услуг с одинаковым кодом'
/

COMMENT ON COLUMN ASU.TUSL_DBF.FK_KOYKAVIDID IS 'Служебное поле сслыка на fk_koykavidid для стационара (заменяется на указанные в tperesel) Значение -5 устанавливается для стационарных операций'
/


--
-- I_TUSL_DBF_GROUPUSL  (Index) 
--
--  Dependencies: 
--   TUSL_DBF (Table)
--
CREATE INDEX ASU.I_TUSL_DBF_GROUPUSL ON ASU.TUSL_DBF
(FK_GROUPUSL)
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
-- I_TUSL_DBF_ID_ILL  (Index) 
--
--  Dependencies: 
--   TUSL_DBF (Table)
--
CREATE INDEX ASU.I_TUSL_DBF_ID_ILL ON ASU.TUSL_DBF
(ID_ILL)
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
-- I_TUSL_DBF_POLY  (Index) 
--
--  Dependencies: 
--   TUSL_DBF (Table)
--
CREATE INDEX ASU.I_TUSL_DBF_POLY ON ASU.TUSL_DBF
(Z$FL_POLY)
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
-- I_TUSL_DBF_PREGROUPSLUCHID  (Index) 
--
--  Dependencies: 
--   TUSL_DBF (Table)
--
CREATE INDEX ASU.I_TUSL_DBF_PREGROUPSLUCHID ON ASU.TUSL_DBF
(FK_PREGROUPSLUCHID)
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
-- I_TUSL_DBF_SLUCHID  (Index) 
--
--  Dependencies: 
--   TUSL_DBF (Table)
--
CREATE INDEX ASU.I_TUSL_DBF_SLUCHID ON ASU.TUSL_DBF
(FK_SLUCHID)
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
-- I_TUSL_DBF_TYPE_EO  (Index) 
--
--  Dependencies: 
--   TUSL_DBF (Table)
--
CREATE INDEX ASU.I_TUSL_DBF_TYPE_EO ON ASU.TUSL_DBF
(TYPE_EO)
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
-- K_TUSL_DBF_ID  (Index) 
--
--  Dependencies: 
--   TUSL_DBF (Table)
--
CREATE UNIQUE INDEX ASU.K_TUSL_DBF_ID ON ASU.TUSL_DBF
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
-- TUSL_DBF_INSERT  (Trigger) 
--
--  Dependencies: 
--   TUSL_DBF (Table)
--
CREATE OR REPLACE TRIGGER ASU."TUSL_DBF_INSERT" 
 BEFORE
  INSERT
 ON ASU.TUSL_DBF REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  IF :new.fk_id IS NULL THEN
    SELECT asu.SEQ_TUSL_DBF.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  END IF;
End;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TUSL_DBF 
-- 
ALTER TABLE ASU.TUSL_DBF ADD (
  CONSTRAINT K_TUSL_DBF_ID
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

