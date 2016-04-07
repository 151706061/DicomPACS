ALTER TABLE ASU.TSLUCH_DBF_STOR
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TSLUCH_DBF_STOR CASCADE CONSTRAINTS
/

--
-- TSLUCH_DBF_STOR  (Table) 
--
CREATE TABLE ASU.TSLUCH_DBF_STOR
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
  FK_USLVIDID         NUMBER(15),
  DISP_KAT            NUMBER(2),
  GZ                  NUMBER(1),
  DISP_RES            NUMBER(1),
  FK_PACID            NUMBER(15),
  AMB_PR              NUMBER(2),
  FN_DISP_FSTAGE_NAZ  NUMBER                    DEFAULT 0
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

COMMENT ON TABLE ASU.TSLUCH_DBF_STOR IS 'Слепок DBF файла выгрузки случаев (RSA)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.OWN IS 'Признак места страхования (1- застрахован на территории ХМАО-Югра
2- застрахован на иной территории РФ
)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.TFOMS_ID IS 'Код территории страхования (Справочник TFOMS)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.YEAR IS 'Год подачи реестра'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.MONTH IS 'Месяц подачи реестра'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.LPU_ID IS 'Код ЛПУ (Справочник LPU)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.GLOBAL_ID IS 'Глобальный номер застрахованного на территории ХМАО '
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.PERSON_IDL IS 'Локальный номер застрахованного в ЛПУ'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.ID_ILL IS 'Идентификационный номер случая'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.POLICYSER IS 'Серия полиса пациента'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.POLICYNUM IS 'Номер полиса'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.FAM IS 'Фамилия пациента'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.IM IS 'Имя пациента'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.OTCH IS 'Отчество пациента'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.DATE_B_DAY IS 'Дата рождения пациента'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.POL IS 'Пол пациента (М или Ж в верхнем регистре)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.DIA_SD IS 'Диагноз предварительный (В случае направления из другого ЛПУ DS направившего ЛПУ)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.DIA_O IS 'Диагноз осложнения'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.DIA_C IS 'Диагноз сопутствующий'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.DIA_E IS 'Диагноз окончательный'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.DATE_S IS 'Дата начала заболевания'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.DATE_E IS 'Дата окончания заболевания'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.Q_U IS 'Тип услуги.  Заполняется в случае значения поля OWN=2 (1-стационар, 2-поликлиника, 3-дневной стационар, 4-стационар плановый)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.DESTROY IS 'Травма (Обязательно к заполнению в  случае заключительного диагноза S.00-S.99 или T.00-T.98
Справочник DESTROY)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.Q_Z IS 'Код характера заболевания (Справочник KH_ZABOL)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.RES_G IS 'Код результата обращения (Справочник REZ_OBR)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.RESG_DOP IS 'Дополнение к исходу состояния (Справочник REZOBR_DOP)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.DISP IS 'Поставлен на Д учет
(1 -состоит 2-поставлен, 3-снят)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.TOTAL IS 'Сумма, предъявленная к оплате из ЛПУ'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.N_MAP IS 'Номер карты выбытия из стационара'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.N_MAP_AMB IS 'Номер карты амбулаторного приема'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.OPER_ID IS 'Признак оперативное вмешательство (1 –проводилось, 0- не производилось)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.NARKOZ_ID IS 'Анестезия (Справочник MORPHEY)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.SMK_NAME IS 'Наименование Страховщика. Заполняется в случае значения поля OWN=2'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.D_TYPE IS 'Особый случай. Заполняется в случае значения поля OWN=2'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.MR IS 'Место рождения. Заполняется если OWN=2'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.SNILS IS 'СНИЛС. Заполняется если OWN=2'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.Z$FL_POLY IS 'Служебное поле 1 - поликлиника 0 - стационар'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.FK_ID IS 'SEQ_TSLUCH_DBF'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.FN_ROWNUM IS 'Порядковый номер'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.FK_GROUPSLUCHID IS 'Если случай входит в группу, то это FK_ID случая-группы'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.SMO IS 'Тип страховой компании, Справочник ОФОМС - SMO'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.DISP_KAT IS 'Категория граждан, подлежащих диспансеризации (Справочник DISP_KAT)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.GZ IS 'Группы состояния здоровья граждан по итогам диспансеризации, проф. осмотра, дисп. наблюдения (Справочник GZ)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.DISP_RES IS 'Направление гражданина на II этап диспансеризации (1- направлен на II этап диспансеризации 0 – II этап диспансеризации не нужен)'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.FK_PACID IS 'Виды посещений при оказании медицинской помощи в амбулаторных условиях в рамках программ ОМС Справочник FK_PACID'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.AMB_PR IS 'Виды посещений при оказании медицинской помощи в амбулаторных условиях в рамках программ ОМС Справочник AMB_PR'
/

COMMENT ON COLUMN ASU.TSLUCH_DBF_STOR.FN_DISP_FSTAGE_NAZ IS 'Назнчение, соответствующее первому этапу диспансеризации, 0 - значит это не диспансеризация или второй этап'
/


--
-- I_SLUCH_DBF_STOR_BY_KEY  (Index) 
--
--  Dependencies: 
--   TSLUCH_DBF_STOR (Table)
--
CREATE UNIQUE INDEX ASU.I_SLUCH_DBF_STOR_BY_KEY ON ASU.TSLUCH_DBF_STOR
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
-- I_SLUCH_DBF_STOR_GROUPSLUCHID  (Index) 
--
--  Dependencies: 
--   TSLUCH_DBF_STOR (Table)
--
CREATE INDEX ASU.I_SLUCH_DBF_STOR_GROUPSLUCHID ON ASU.TSLUCH_DBF_STOR
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
-- I_SLUCH_DBF_STOR_ID_ILLS  (Index) 
--
--  Dependencies: 
--   TSLUCH_DBF_STOR (Table)
--
CREATE INDEX ASU.I_SLUCH_DBF_STOR_ID_ILLS ON ASU.TSLUCH_DBF_STOR
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
-- I_SLUCH_DBF_STOR_POLY  (Index) 
--
--  Dependencies: 
--   TSLUCH_DBF_STOR (Table)
--
CREATE INDEX ASU.I_SLUCH_DBF_STOR_POLY ON ASU.TSLUCH_DBF_STOR
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
-- I_SLUCH_DBF_STOR_ROWNUM  (Index) 
--
--  Dependencies: 
--   TSLUCH_DBF_STOR (Table)
--
CREATE INDEX ASU.I_SLUCH_DBF_STOR_ROWNUM ON ASU.TSLUCH_DBF_STOR
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
-- I_TSLUCH_DBF_STOR_DISP_NAZ  (Index) 
--
--  Dependencies: 
--   TSLUCH_DBF_STOR (Table)
--
CREATE INDEX ASU.I_TSLUCH_DBF_STOR_DISP_NAZ ON ASU.TSLUCH_DBF_STOR
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
-- K_TSLUCH_DBF_STOR_ID  (Index) 
--
--  Dependencies: 
--   TSLUCH_DBF_STOR (Table)
--
CREATE UNIQUE INDEX ASU.K_TSLUCH_DBF_STOR_ID ON ASU.TSLUCH_DBF_STOR
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
-- Non Foreign Key Constraints for Table TSLUCH_DBF_STOR 
-- 
ALTER TABLE ASU.TSLUCH_DBF_STOR ADD (
  CONSTRAINT K_TSLUCH_DBF_STOR_ID
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

