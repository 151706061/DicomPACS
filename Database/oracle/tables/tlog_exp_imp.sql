ALTER TABLE ASU.TLOG_EXP_IMP
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TLOG_EXP_IMP CASCADE CONSTRAINTS
/

--
-- TLOG_EXP_IMP  (Table) 
--
CREATE TABLE ASU.TLOG_EXP_IMP
(
  FK_ID       NUMBER                            NOT NULL,
  FC_TABLE    VARCHAR2(50 BYTE),
  FK_NEW_ID   NUMBER,
  FK_OLD_ID   NUMBER,
  FC_RESULT   VARCHAR2(3000 BYTE),
  FL_RES      NUMBER(1),
  FD_DATE     DATE                              DEFAULT sysdate,
  FC_UNIQ     VARCHAR2(150 BYTE),
  FN_NUM_UPD  NUMBER
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

COMMENT ON TABLE ASU.TLOG_EXP_IMP IS 'Ћогирование работы модул€ Ёкспорт/»мпорт'
/

COMMENT ON COLUMN ASU.TLOG_EXP_IMP.FK_ID IS 'key'
/

COMMENT ON COLUMN ASU.TLOG_EXP_IMP.FC_TABLE IS 'название таблицы'
/

COMMENT ON COLUMN ASU.TLOG_EXP_IMP.FK_NEW_ID IS 'key новой записи, залитой в oracle'
/

COMMENT ON COLUMN ASU.TLOG_EXP_IMP.FK_OLD_ID IS 'key донора'
/

COMMENT ON COLUMN ASU.TLOG_EXP_IMP.FC_RESULT IS 'результат обновлени€/добавлени€'
/

COMMENT ON COLUMN ASU.TLOG_EXP_IMP.FL_RES IS 'флаг : 1-выполнен успешно;  0 - выполнен с ошибками'
/

COMMENT ON COLUMN ASU.TLOG_EXP_IMP.FD_DATE IS 'дата выполнени€'
/

COMMENT ON COLUMN ASU.TLOG_EXP_IMP.FC_UNIQ IS 'строка уникальных полей'
/

COMMENT ON COLUMN ASU.TLOG_EXP_IMP.FN_NUM_UPD IS 'номер обновлени€'
/


--
-- TLOG_EXP_IMP_ID  (Index) 
--
--  Dependencies: 
--   TLOG_EXP_IMP (Table)
--
CREATE UNIQUE INDEX ASU.TLOG_EXP_IMP_ID ON ASU.TLOG_EXP_IMP
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
-- TLOG_EXP_IMP_BEFOR_INSERT  (Trigger) 
--
--  Dependencies: 
--   TLOG_EXP_IMP (Table)
--
CREATE OR REPLACE TRIGGER ASU."TLOG_EXP_IMP_BEFOR_INSERT" 
  before insert on asu.tlog_exp_imp
  REFERENCING OLD AS OLD NEW AS NEW
  FOR EACH ROW
BEGIN

 IF :NEW.FK_ID IS NULL THEN
  SELECT SEQ_TLOG_EXP_IMP.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
 END IF;

end TLog_exp_imp_befor_insert;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TLOG_EXP_IMP 
-- 
ALTER TABLE ASU.TLOG_EXP_IMP ADD (
  CONSTRAINT TLOG_EXP_IMP_ID
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

