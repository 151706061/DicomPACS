ALTER TABLE ASU.TEXSLUCH_ERR_STOR
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TEXSLUCH_ERR_STOR CASCADE CONSTRAINTS
/

--
-- TEXSLUCH_ERR_STOR  (Table) 
--
CREATE TABLE ASU.TEXSLUCH_ERR_STOR
(
  FK_ID           NUMBER(15)                    NOT NULL,
  YEAR            NUMBER(4),
  MONTH           NUMBER(2),
  LPU_ID          NUMBER(10),
  PERSON_IDL      NUMBER(19),
  ID_ILL          NUMBER(19)                    NOT NULL,
  P_ID_ILL        NUMBER(2),
  FC_CODE         VARCHAR2(8 BYTE),
  FK_SLUCHID      NUMBER(15),
  FN_IS_LOAD      NUMBER(1),
  FC_MSG_ERR      VARCHAR2(256 BYTE),
  FC_FIELDS       VARCHAR2(256 BYTE),
  FK_USLID        NUMBER(15),
  FK_SLUCHLOADID  NUMBER(15),
  GLOBAL_ID       NUMBER(19),
  VO              NUMBER(1),
  POLICYSER       VARCHAR2(10 BYTE),
  POLICYNUM       VARCHAR2(20 BYTE),
  TYPE_FILE       VARCHAR2(3 BYTE),
  ID_ILL_U        NUMBER(19)
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

COMMENT ON TABLE ASU.TEXSLUCH_ERR_STOR IS 'Список ошибок относящихся к выгрузке в DBF Author:Efimov'
/

COMMENT ON COLUMN ASU.TEXSLUCH_ERR_STOR.FK_ID IS 'SEQ_TEXSLUCH_ERR'
/

COMMENT ON COLUMN ASU.TEXSLUCH_ERR_STOR.YEAR IS 'Год подачи реестра'
/

COMMENT ON COLUMN ASU.TEXSLUCH_ERR_STOR.MONTH IS 'Месяц подачи реестра'
/

COMMENT ON COLUMN ASU.TEXSLUCH_ERR_STOR.LPU_ID IS 'Код ЛПУ'
/

COMMENT ON COLUMN ASU.TEXSLUCH_ERR_STOR.PERSON_IDL IS 'Локальный номер застрахованного в ЛПУ'
/

COMMENT ON COLUMN ASU.TEXSLUCH_ERR_STOR.ID_ILL IS 'Идентификационный номер случая'
/

COMMENT ON COLUMN ASU.TEXSLUCH_ERR_STOR.P_ID_ILL IS 'Порядковый номер идентификационного номера случая'
/

COMMENT ON COLUMN ASU.TEXSLUCH_ERR_STOR.FC_CODE IS 'Код ошибки по данным ОФОМС'
/

COMMENT ON COLUMN ASU.TEXSLUCH_ERR_STOR.FK_SLUCHID IS 'TSLUCH_DBF.FK_ID - заполнено только если ошибка получена в результате расчёта, а не из dbf  из ОФОМС'
/

COMMENT ON COLUMN ASU.TEXSLUCH_ERR_STOR.FN_IS_LOAD IS '1 - ошибка загружена из dbf полученных в рузультате загрузки реестра случаев на сайт ОФОМС, любое другое значнеие - ошибка получена в результате расчёта'
/

COMMENT ON COLUMN ASU.TEXSLUCH_ERR_STOR.FC_MSG_ERR IS 'Расшифровка ошибки по данным ОФОМС'
/

COMMENT ON COLUMN ASU.TEXSLUCH_ERR_STOR.FC_FIELDS IS 'Поля по которым было установлено наличие ошибки'
/

COMMENT ON COLUMN ASU.TEXSLUCH_ERR_STOR.FK_USLID IS 'TUSL_DBF.FK_ID - заполнено только если ошибка получена в результате расчёта, а не из dbf  из ОФОМС'
/

COMMENT ON COLUMN ASU.TEXSLUCH_ERR_STOR.FK_SLUCHLOADID IS 'TSLUCH_LOAD_DBF.FK_ID - заполнено только если ошибка получена в результате загрузки из dbf  из ОФОМС'
/


--
-- I_TEXCHSLUCH_ERR_STOR_ID_ILL  (Index) 
--
--  Dependencies: 
--   TEXSLUCH_ERR_STOR (Table)
--
CREATE INDEX ASU.I_TEXCHSLUCH_ERR_STOR_ID_ILL ON ASU.TEXSLUCH_ERR_STOR
(LPU_ID, P_ID_ILL)
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
-- I_TEXSLUCH_ERR_STOR_CODE  (Index) 
--
--  Dependencies: 
--   TEXSLUCH_ERR_STOR (Table)
--
CREATE INDEX ASU.I_TEXSLUCH_ERR_STOR_CODE ON ASU.TEXSLUCH_ERR_STOR
(FC_CODE)
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
-- I_TEXSLUCH_ERR_STOR_SLUCHID  (Index) 
--
--  Dependencies: 
--   TEXSLUCH_ERR_STOR (Table)
--
CREATE INDEX ASU.I_TEXSLUCH_ERR_STOR_SLUCHID ON ASU.TEXSLUCH_ERR_STOR
(FK_SLUCHID, FK_SLUCHLOADID)
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
-- I_TEXSLUCH_ERR_STOR_USLID  (Index) 
--
--  Dependencies: 
--   TEXSLUCH_ERR_STOR (Table)
--
CREATE INDEX ASU.I_TEXSLUCH_ERR_STOR_USLID ON ASU.TEXSLUCH_ERR_STOR
(FK_USLID)
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
-- K_TEXSLUCH_ERR_STOR_ID  (Index) 
--
--  Dependencies: 
--   TEXSLUCH_ERR_STOR (Table)
--
CREATE UNIQUE INDEX ASU.K_TEXSLUCH_ERR_STOR_ID ON ASU.TEXSLUCH_ERR_STOR
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
-- Non Foreign Key Constraints for Table TEXSLUCH_ERR_STOR 
-- 
ALTER TABLE ASU.TEXSLUCH_ERR_STOR ADD (
  CONSTRAINT K_TEXSLUCH_ERR_STOR_ID
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

