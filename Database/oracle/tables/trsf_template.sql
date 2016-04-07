ALTER TABLE ASU.TRSF_TEMPLATE
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TRSF_TEMPLATE CASCADE CONSTRAINTS
/

--
-- TRSF_TEMPLATE  (Table) 
--
CREATE TABLE ASU.TRSF_TEMPLATE
(
  FK_ID             NUMBER                      NOT NULL,
  FC_NAME           VARCHAR2(255 BYTE)          NOT NULL,
  FD_CREATE         DATE                        NOT NULL,
  FL_DEL            NUMBER(1)                   DEFAULT 0                     NOT NULL,
  FP_TYPE           NUMBER                      NOT NULL,
  FK_DOCTYPE        NUMBER                      NOT NULL,
  FL_SK             NUMBER(1)                   NOT NULL,
  FL_USL            NUMBER(1)                   NOT NULL,
  FL_OPER           NUMBER(1)                   NOT NULL,
  FL_KDN            NUMBER(1)                   NOT NULL,
  FC_TITLE          VARCHAR2(2000 BYTE)         NOT NULL,
  FP_GROUPBY        NUMBER                      NOT NULL,
  FL_SIGNATURE      NUMBER(1)                   NOT NULL,
  FK_SNG_OPTION     NUMBER                      DEFAULT -1                    NOT NULL,
  FN_ORDER          NUMBER                      DEFAULT 0                     NOT NULL,
  FK_SOTR_CREATE    NUMBER                      NOT NULL,
  FK_SK_COMPANYID   NUMBER                      DEFAULT -1                    NOT NULL,
  FK_PEOPLEID       NUMBER                      DEFAULT -1                    NOT NULL,
  FK_SOTR_DEL       NUMBER                      DEFAULT -1                    NOT NULL,
  FL_SF_CODE        NUMBER                      DEFAULT 0                     NOT NULL,
  FL_SF_CODE_SOGAZ  NUMBER                      DEFAULT 0                     NOT NULL,
  FL_KSG            NUMBER(1)                   DEFAULT 0
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
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

COMMENT ON TABLE ASU.TRSF_TEMPLATE IS 'Шаблоны настроек для реестров и счёт-фактур. Author: Neronov A.S. 16.06.2011'
/

COMMENT ON COLUMN ASU.TRSF_TEMPLATE.FL_KSG IS '1 - считать КСГ'
/

COMMENT ON COLUMN ASU.TRSF_TEMPLATE.FK_ID IS 'SEQUENCE=[SEQ_TRSF_TEMPLATE]'
/

COMMENT ON COLUMN ASU.TRSF_TEMPLATE.FC_NAME IS 'Название шаблона'
/

COMMENT ON COLUMN ASU.TRSF_TEMPLATE.FD_CREATE IS 'Дата создания шаблона'
/

COMMENT ON COLUMN ASU.TRSF_TEMPLATE.FL_DEL IS '1 - удален'
/

COMMENT ON COLUMN ASU.TRSF_TEMPLATE.FP_TYPE IS 'Тип пациентов (0 - Стац, 1 - Амб, 2 - Дневной Стац, 3 - Все)'
/

COMMENT ON COLUMN ASU.TRSF_TEMPLATE.FK_DOCTYPE IS 'Вид оплаты TTYPEDOC.FK_ID'
/

COMMENT ON COLUMN ASU.TRSF_TEMPLATE.FL_SK IS '1 - страховая компания, 0 - пациент'
/

COMMENT ON COLUMN ASU.TRSF_TEMPLATE.FL_USL IS '1 - считать мед. услуги'
/

COMMENT ON COLUMN ASU.TRSF_TEMPLATE.FL_OPER IS '1 - считать операции'
/

COMMENT ON COLUMN ASU.TRSF_TEMPLATE.FL_KDN IS '1 - считать КДН'
/

COMMENT ON COLUMN ASU.TRSF_TEMPLATE.FC_TITLE IS 'Заголовок реестра'
/

COMMENT ON COLUMN ASU.TRSF_TEMPLATE.FP_GROUPBY IS 'Группировка по (0 - по пациенту, 1 - по услуге)'
/

COMMENT ON COLUMN ASU.TRSF_TEMPLATE.FL_SIGNATURE IS '1 - выводить подписи'
/

COMMENT ON COLUMN ASU.TRSF_TEMPLATE.FK_SNG_OPTION IS 'Дополнительные параметры для СургутНефтеГаз'
/

COMMENT ON COLUMN ASU.TRSF_TEMPLATE.FN_ORDER IS 'Для сортировки списка шаблонов'
/

COMMENT ON COLUMN ASU.TRSF_TEMPLATE.FK_SOTR_CREATE IS 'ID сотрудника, который создал шаблон'
/

COMMENT ON COLUMN ASU.TRSF_TEMPLATE.FK_SK_COMPANYID IS 'ID страховой компании TCOMPANY.FK_ID'
/

COMMENT ON COLUMN ASU.TRSF_TEMPLATE.FK_PEOPLEID IS 'ID пациента TPEOPLES.FK_ID'
/

COMMENT ON COLUMN ASU.TRSF_TEMPLATE.FK_SOTR_DEL IS 'ID сотрудника, который удалил шаблон'
/

COMMENT ON COLUMN ASU.TRSF_TEMPLATE.FL_SF_CODE IS '1 - отображать код услуги в СФ'
/

COMMENT ON COLUMN ASU.TRSF_TEMPLATE.FL_SF_CODE_SOGAZ IS '1 - отображать код СОГАЗа в СФ'
/


--
-- TRSF_TEMPLATE_BY_ID  (Index) 
--
--  Dependencies: 
--   TRSF_TEMPLATE (Table)
--
CREATE UNIQUE INDEX ASU.TRSF_TEMPLATE_BY_ID ON ASU.TRSF_TEMPLATE
(FK_ID)
NOLOGGING
TABLESPACE INDX
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
-- TRSF_TEMPLATE_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TRSF_TEMPLATE (Table)
--
CREATE OR REPLACE TRIGGER ASU.TRSF_TEMPLATE_BEFORE_INSERT
 BEFORE
 INSERT
 ON ASU.TRSF_TEMPLATE  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
Begin
  SELECT SEQ_TRSF.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TRSF_TEMPLATE 
-- 
ALTER TABLE ASU.TRSF_TEMPLATE ADD (
  CONSTRAINT TRSF_TEMPLATE_BY_ID
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
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

