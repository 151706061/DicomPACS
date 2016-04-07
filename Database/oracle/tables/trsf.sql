DROP TABLE ASU.TRSF CASCADE CONSTRAINTS
/

--
-- TRSF  (Table) 
--
CREATE TABLE ASU.TRSF
(
  FK_ID                           NUMBER        NOT NULL,
  FD_START                        DATE          NOT NULL,
  FD_FINISH                       DATE          NOT NULL,
  FP_TYPE                         NUMBER        NOT NULL,
  FK_DOCTYPE                      NUMBER        NOT NULL,
  FL_USL                          NUMBER(1)     NOT NULL,
  FL_OPER                         NUMBER(1)     NOT NULL,
  FL_KDN                          NUMBER(1)     NOT NULL,
  FK_SK_COMPANYID                 NUMBER        DEFAULT -1                    NOT NULL,
  FK_PEOPLEID                     NUMBER        DEFAULT -1                    NOT NULL,
  FK_SNG_OPTION                   NUMBER        DEFAULT -1                    NOT NULL,
  FC_TITLE                        VARCHAR2(2000 BYTE) NOT NULL,
  FL_SIGNATURE                    NUMBER(1)     NOT NULL,
  FK_SOTR_CREATE                  NUMBER        NOT NULL,
  FD_CREATE                       DATE          DEFAULT sysdate               NOT NULL,
  FL_DEL                          NUMBER(1)     DEFAULT 0                     NOT NULL,
  FK_SOTR_DEL                     NUMBER,
  FD_DEL                          DATE,
  FL_SF_CODE                      NUMBER(1)     DEFAULT 0                     NOT NULL,
  FL_SF_CODE_SOGAZ                NUMBER(1)     DEFAULT 0                     NOT NULL,
  FP_GROUPBY                      NUMBER        NOT NULL,
  FD_LAST_EDIT                    DATE,
  FK_SOTR_EDIT                    NUMBER,
  FN_SUM                          NUMBER        NOT NULL,
  FC_RSF_NUM                      VARCHAR2(50 BYTE),
  FD_RSF_DATE                     DATE          DEFAULT sysdate               NOT NULL,
  FK_STATUS                       NUMBER,
  FD_STATUS_DATE                  DATE,
  FK_SOTR_CHANGE_STATUS           NUMBER,
  FK_SOTR_CANCEL_PODPIS_AMBTALON  NUMBER,
  FD_CANCEL_PODPIS_AMBTALON       DATE,
  FL_KSG                          NUMBER(1)     DEFAULT 0
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
NOLOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TRSF IS 'Реестры и счет-фактуры. Author: Neronov A.S. 20.062011'
/

COMMENT ON COLUMN ASU.TRSF.FL_KSG IS '1 - считать KСГ'
/

COMMENT ON COLUMN ASU.TRSF.FK_ID IS 'SEQUENCE=[SEQ_TRSF]'
/

COMMENT ON COLUMN ASU.TRSF.FD_START IS 'Начало периода'
/

COMMENT ON COLUMN ASU.TRSF.FD_FINISH IS 'Конец периода'
/

COMMENT ON COLUMN ASU.TRSF.FP_TYPE IS 'Тип пациентов (0 - Стац, 1 - Амб, 2 - Дневной Стац, 3 - Все)'
/

COMMENT ON COLUMN ASU.TRSF.FK_DOCTYPE IS 'Вид оплаты TTYPEDOC.FK_ID'
/

COMMENT ON COLUMN ASU.TRSF.FL_USL IS '1 - считать мед. услуги'
/

COMMENT ON COLUMN ASU.TRSF.FL_OPER IS '1 - считать операции'
/

COMMENT ON COLUMN ASU.TRSF.FL_KDN IS '1 - считать КДН'
/

COMMENT ON COLUMN ASU.TRSF.FK_SK_COMPANYID IS 'ID страховой компании TCOMPANY.FK_ID'
/

COMMENT ON COLUMN ASU.TRSF.FK_PEOPLEID IS 'ID пациента TPEOPLES.FK_ID'
/

COMMENT ON COLUMN ASU.TRSF.FK_SNG_OPTION IS 'Дополнительные параметры для СургутНефтеГаз'
/

COMMENT ON COLUMN ASU.TRSF.FC_TITLE IS 'Заголовок реестра'
/

COMMENT ON COLUMN ASU.TRSF.FL_SIGNATURE IS '1 - выводить подписи'
/

COMMENT ON COLUMN ASU.TRSF.FK_SOTR_CREATE IS 'ID сотрудника, который создал'
/

COMMENT ON COLUMN ASU.TRSF.FD_CREATE IS 'Дата сохранения'
/

COMMENT ON COLUMN ASU.TRSF.FL_DEL IS '1 - удален'
/

COMMENT ON COLUMN ASU.TRSF.FK_SOTR_DEL IS 'ID сотрудника, который удалил'
/

COMMENT ON COLUMN ASU.TRSF.FD_DEL IS 'Дата удаления'
/

COMMENT ON COLUMN ASU.TRSF.FL_SF_CODE IS '1 - отображать код услуги в СФ'
/

COMMENT ON COLUMN ASU.TRSF.FL_SF_CODE_SOGAZ IS '1 - отображать код СОГАЗа в СФ'
/

COMMENT ON COLUMN ASU.TRSF.FP_GROUPBY IS 'Группировка по (0 - по пациенту, 1 - по услуге)'
/

COMMENT ON COLUMN ASU.TRSF.FD_LAST_EDIT IS 'Дата последнего изменения'
/

COMMENT ON COLUMN ASU.TRSF.FK_SOTR_EDIT IS 'ID сотрудника, который последний изменил'
/

COMMENT ON COLUMN ASU.TRSF.FN_SUM IS 'Сумма по всему реестру'
/

COMMENT ON COLUMN ASU.TRSF.FC_RSF_NUM IS 'Номер реестра'
/

COMMENT ON COLUMN ASU.TRSF.FD_RSF_DATE IS 'Дата реестра'
/

COMMENT ON COLUMN ASU.TRSF.FK_STATUS IS 'TSMID.FK_ID - Статус счета - содержимое ветки "RSF_WORK_STATUS"'
/

COMMENT ON COLUMN ASU.TRSF.FD_STATUS_DATE IS 'Дата последнего изменения статуса'
/

COMMENT ON COLUMN ASU.TRSF.FK_SOTR_CHANGE_STATUS IS 'ID сотрудника, который последний изменил статус'
/

COMMENT ON COLUMN ASU.TRSF.FK_SOTR_CANCEL_PODPIS_AMBTALON IS 'ID сотрудника, который последний отменил подпись талона, услуги из которого есть в реестре'
/

COMMENT ON COLUMN ASU.TRSF.FD_CANCEL_PODPIS_AMBTALON IS 'Дата последней отмены подписи талона, услуги из которого есть в реестре'
/


--
-- TRSF_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TRSF (Table)
--
CREATE OR REPLACE TRIGGER ASU.TRSF_BEFORE_INSERT
 BEFORE
 INSERT
 ON ASU.TRSF  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
Begin
  SELECT SEQ_TRSF.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


