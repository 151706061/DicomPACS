ALTER TABLE ASU.TSLUCH_DBF
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TSLUCH_DBF CASCADE CONSTRAINTS
/

--
-- TSLUCH_DBF  (Table) 
--
CREATE TABLE ASU.TSLUCH_DBF
(
  OWN                 NUMBER(1),
  TYPE_FIN            NUMBER(1),
  TFOMS_ID            NUMBER(10),
  YEAR                NUMBER(4),
  MONTH               NUMBER(2),
  TER_OKATO           VARCHAR2(5 BYTE),
  LPU_ID              NUMBER(10),
  LPU_NAPR            NUMBER(10),
  LPU_INTR            NUMBER(10),
  GLOBAL_ID           NUMBER(19),
  PERSON_IDL          NUMBER(19),
  ID_ILL              NUMBER(19),
  POLICYSER           VARCHAR2(10 BYTE),
  POLICYNUM           VARCHAR2(20 BYTE),
  FAM                 VARCHAR2(25 BYTE),
  IM                  VARCHAR2(25 BYTE),
  OTCH                VARCHAR2(25 BYTE),
  DATE_B_DAY          DATE,
  POL                 VARCHAR2(1 BYTE),
  DIA_SD              VARCHAR2(8 BYTE),
  DIA_O               VARCHAR2(8 BYTE),
  DIA_C               VARCHAR2(8 BYTE),
  DIA_E               VARCHAR2(8 BYTE),
  DATE_S              DATE,
  DATE_E              DATE,
  DATE_NAPR           DATE,
  Q_U                 NUMBER(1),
  V_MU                NUMBER(3),
  PR_MP               NUMBER(3),
  TYPE_MP             NUMBER(1),
  DESTROY             NUMBER(2),
  Q_Z                 NUMBER(1),
  RES_G               NUMBER(3),
  RESG_DOP            NUMBER(3),
  DISP                NUMBER(1),
  NOVOR               VARCHAR2(9 BYTE),
  TOTAL               NUMBER(10,2),
  N_NAPR              VARCHAR2(19 BYTE),
  N_MAP               VARCHAR2(19 BYTE),
  N_MAP_AMB           VARCHAR2(19 BYTE),
  OPER_ID             NUMBER(1),
  NARKOZ_ID           NUMBER(2),
  SMK_NAME            VARCHAR2(50 BYTE),
  SN_PASP             VARCHAR2(20 BYTE),
  D_TYPE              VARCHAR2(5 BYTE),
  P_ID_ILL            NUMBER(2),
  TFOMS_REG           NUMBER(10),
  DATE_NPOL           DATE,
  DATE_EPOL           DATE,
  STAT_P              NUMBER(1),
  FAMP                VARCHAR2(30 BYTE),
  IMP                 VARCHAR2(20 BYTE),
  OTP                 VARCHAR2(20 BYTE),
  C_OKSM              VARCHAR2(3 BYTE),
  C_DOC               NUMBER(2),
  S_DOC               VARCHAR2(9 BYTE),
  N_DOC               VARCHAR2(8 BYTE),
  R_NAME              VARCHAR2(150 BYTE),
  C_NAME              VARCHAR2(150 BYTE),
  Q_NP                NUMBER(2),
  NP_NAME             VARCHAR2(150 BYTE),
  Q_UL                NUMBER(2),
  UL_NAME             VARCHAR2(150 BYTE),
  DOM                 VARCHAR2(7 BYTE),
  KOR                 VARCHAR2(5 BYTE),
  KV                  VARCHAR2(5 BYTE),
  STAT_Z              NUMBER(2),
  PRVS                NUMBER(4),
  VID_P               NUMBER(1),
  Q_OGRN              VARCHAR2(15 BYTE),
  STANDARD            NUMBER(1),
  MR                  VARCHAR2(100 BYTE),
  SNILS               VARCHAR2(14 BYTE),
  OKATOG              VARCHAR2(11 BYTE),
  OKATOP              VARCHAR2(11 BYTE),
  POLP                VARCHAR2(1 BYTE),
  DRP                 DATE,
  TYPE_V_MU           NUMBER(1),
  MODERN              NUMBER(1),
  SUM_MODERN          NUMBER(10,2),
  Z$FL_POLY           NUMBER(1),
  FK_ID               NUMBER(15)                NOT NULL,
  FN_ROWNUM           NUMBER(15),
  FK_GROUPSLUCHID     NUMBER(15),
  SMO                 NUMBER(15),
  FN_DISP_FSTAGE_NAZ  NUMBER                    DEFAULT 0,
  DISP_KAT            NUMBER(2),
  GZ                  NUMBER(1),
  DISP_RES            NUMBER(1),
  FK_USLVIDID         NUMBER(15),
  FK_PACID            NUMBER(15),
  AMB_PR              NUMBER(2)
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

COMMENT ON TABLE ASU.TSLUCH_DBF IS 'Слепок DBF файла выгрузки случаев (RSA)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.OWN IS 'Признак места страхования (1- застрахован на территории ХМАО-Югра
2- застрахован на иной территории РФ
)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.TFOMS_ID IS 'Код территории страхования (Справочник TFOMS)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.YEAR IS 'Год подачи реестра'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.MONTH IS 'Месяц подачи реестра'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.LPU_ID IS 'Код ЛПУ (Справочник LPU)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.GLOBAL_ID IS 'Глобальный номер застрахованного на территории ХМАО '
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.PERSON_IDL IS 'Локальный номер застрахованного в ЛПУ'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.ID_ILL IS 'Идентификационный номер случая'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.POLICYSER IS 'Серия полиса пациента'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.POLICYNUM IS 'Номер полиса'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.FAM IS 'Фамилия пациента'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.IM IS 'Имя пациента'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.OTCH IS 'Отчество пациента'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.DATE_B_DAY IS 'Дата рождения пациента'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.POL IS 'Пол пациента (М или Ж в верхнем регистре)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.DIA_SD IS 'Диагноз предварительный (В случае направления из другого ЛПУ DS направившего ЛПУ)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.DIA_O IS 'Диагноз осложнения'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.DIA_C IS 'Диагноз сопутствующий'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.DIA_E IS 'Диагноз окончательный'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.DATE_S IS 'Дата начала заболевания'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.DATE_E IS 'Дата окончания заболевания'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.Q_U IS 'Тип услуги.  Заполняется в случае значения поля OWN=2 (1-стационар, 2-поликлиника, 3-дневной стационар, 4-стационар плановый)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.DESTROY IS 'Травма (Обязательно к заполнению в  случае заключительного диагноза S.00-S.99 или T.00-T.98
Справочник DESTROY)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.Q_Z IS 'Код характера заболевания (Справочник KH_ZABOL)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.RES_G IS 'Код результата обращения (Справочник REZ_OBR)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.RESG_DOP IS 'Дополнение к исходу состояния (Справочник REZOBR_DOP)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.DISP IS 'Поставлен на Д учет
(1 -состоит 2-поставлен, 3-снят)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.TOTAL IS 'Сумма, предъявленная к оплате из ЛПУ'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.N_MAP IS 'Номер карты выбытия из стационара'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.N_MAP_AMB IS 'Номер карты амбулаторного приема'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.OPER_ID IS 'Признак оперативное вмешательство (1 –проводилось, 0- не производилось)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.NARKOZ_ID IS 'Анестезия (Справочник MORPHEY)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.SMK_NAME IS 'Наименование Страховщика. Заполняется в случае значения поля OWN=2'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.D_TYPE IS 'Особый случай. Заполняется в случае значения поля OWN=2'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.MR IS 'Место рождения. Заполняется если OWN=2'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.SNILS IS 'СНИЛС. Заполняется если OWN=2'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.Z$FL_POLY IS 'Служебное поле 1 - поликлиника 0 - стационар'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.FK_ID IS 'SEQ_TSLUCH_DBF'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.FN_ROWNUM IS 'Порядковый номер'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.FK_GROUPSLUCHID IS 'Если случай входит в группу, то это FK_ID случая-группы'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.SMO IS 'Тип страховой компании, Справочник ОФОМС - SMO'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.FN_DISP_FSTAGE_NAZ IS 'Назнчение, соответствующее первому этапу диспансеризации, 0 - значит это не диспансеризация или второй этап'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.DISP_KAT IS 'Категория граждан, подлежащих диспансеризации (Справочник DISP_KAT)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.GZ IS 'Группы состояния здоровья граждан по итогам диспансеризации, проф. осмотра, дисп. наблюдения (Справочник GZ)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.DISP_RES IS 'Направление гражданина на II этап диспансеризации (1- направлен на II этап диспансеризации 0 – II этап диспансеризации не нужен)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.FK_PACID IS 'Виды посещений при оказании медицинской помощи в амбулаторных условиях в рамках программ ОМС Справочник FK_PACID'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF.AMB_PR IS 'Виды посещений при оказании медицинской помощи в амбулаторных условиях в рамках программ ОМС Справочник AMB_PR'
/


--
-- I_SLUCH_DBF_BY_KEY  (Index) 
--
--  Dependencies: 
--   TSLUCH_DBF (Table)
--
CREATE UNIQUE INDEX ASU.I_SLUCH_DBF_BY_KEY ON ASU.TSLUCH_DBF
(YEAR, MONTH, LPU_ID, ID_ILL, P_ID_ILL, 
FK_GROUPSLUCHID)
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
-- I_SLUCH_DBF_DISP_NAZ  (Index) 
--
--  Dependencies: 
--   TSLUCH_DBF (Table)
--
CREATE INDEX ASU.I_SLUCH_DBF_DISP_NAZ ON ASU.TSLUCH_DBF
(FN_DISP_FSTAGE_NAZ)
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
-- I_SLUCH_DBF_GROUPSLUCHID  (Index) 
--
--  Dependencies: 
--   TSLUCH_DBF (Table)
--
CREATE INDEX ASU.I_SLUCH_DBF_GROUPSLUCHID ON ASU.TSLUCH_DBF
(FK_GROUPSLUCHID)
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
-- I_SLUCH_DBF_ID_ILL_P_ID_ILL  (Index) 
--
--  Dependencies: 
--   TSLUCH_DBF (Table)
--
CREATE INDEX ASU.I_SLUCH_DBF_ID_ILL_P_ID_ILL ON ASU.TSLUCH_DBF
(ID_ILL, P_ID_ILL)
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
-- I_SLUCH_DBF_POLY  (Index) 
--
--  Dependencies: 
--   TSLUCH_DBF (Table)
--
CREATE INDEX ASU.I_SLUCH_DBF_POLY ON ASU.TSLUCH_DBF
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
-- I_SLUCH_DBF_Q_U  (Index) 
--
--  Dependencies: 
--   TSLUCH_DBF (Table)
--
CREATE INDEX ASU.I_SLUCH_DBF_Q_U ON ASU.TSLUCH_DBF
(Q_U)
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
-- I_SLUCH_DBF_ROWNUM  (Index) 
--
--  Dependencies: 
--   TSLUCH_DBF (Table)
--
CREATE INDEX ASU.I_SLUCH_DBF_ROWNUM ON ASU.TSLUCH_DBF
(FN_ROWNUM)
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
-- K_TSLUCH_DBF_ID  (Index) 
--
--  Dependencies: 
--   TSLUCH_DBF (Table)
--
CREATE UNIQUE INDEX ASU.K_TSLUCH_DBF_ID ON ASU.TSLUCH_DBF
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
-- TSLUCH_DBF_INSERT  (Trigger) 
--
--  Dependencies: 
--   TSLUCH_DBF (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSLUCH_DBF_INSERT" 
 BEFORE
  INSERT
 ON asu.TSLUCH_DBF
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  IF :new.fk_id IS NULL THEN
    SELECT asu.SEQ_TSLUCH_DBF.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  end if;
End;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TSLUCH_DBF 
-- 
ALTER TABLE ASU.TSLUCH_DBF ADD (
  CONSTRAINT K_TSLUCH_DBF_ID
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

