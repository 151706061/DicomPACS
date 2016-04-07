ALTER TABLE ASU.TRECIPE_DLO_EXP_KATL
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TRECIPE_DLO_EXP_KATL CASCADE CONSTRAINTS
/

--
-- TRECIPE_DLO_EXP_KATL  (Table) 
--
CREATE TABLE ASU.TRECIPE_DLO_EXP_KATL
(
  FK_ID      NUMBER,
  C_KAT      VARCHAR2(4 BYTE),
  NAME_KAT   VARCHAR2(250 BYTE),
  C_KATL     VARCHAR2(4 BYTE),
  DATE_BEG   DATE,
  MSG_TEXT   VARCHAR2(200 BYTE),
  DESTROYED  NUMBER                             DEFAULT 0
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

COMMENT ON TABLE ASU.TRECIPE_DLO_EXP_KATL IS 'ДЛО. Справочник федеральных категорий граждан, имеющих право на ГСП'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_KATL.C_KAT IS 'Код категории гражданина, имеющего право на ГСП. Определяется согласно таблице 9 Приложения к Порядку обмена информацией между отделениями Пенсионного фонда РФ и территориальными'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_KATL.NAME_KAT IS 'Наименование категории гражданина, имеющего право на ГСП'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_KATL.C_KATL IS 'Код категории гражданина, имеющего право на ГСП'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_KATL.DATE_BEG IS 'Дата начала действия категории'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_KATL.MSG_TEXT IS 'Примечание'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_KATL.DESTROYED IS 'Признак удаления записи'
/


--
-- TRECIPE_DLO_EXP_TYPE_KATL_PK  (Index) 
--
--  Dependencies: 
--   TRECIPE_DLO_EXP_KATL (Table)
--
CREATE UNIQUE INDEX ASU.TRECIPE_DLO_EXP_TYPE_KATL_PK ON ASU.TRECIPE_DLO_EXP_KATL
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
-- TRECIPE_DLO_EXP_KATL_INS  (Trigger) 
--
--  Dependencies: 
--   TRECIPE_DLO_EXP_KATL (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECIPE_DLO_EXP_KATL_INS"
 BEFORE
  INSERT
 ON ASU.TRECIPE_DLO_EXP_KATL REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  if (:new.fk_id is null) then
    select ASU.SEQ_TRECIPE_DLO_EXP_KATL.nextval into :new.fk_id from dual;
  end if;
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TRECIPE_DLO_EXP_KATL 
-- 
ALTER TABLE ASU.TRECIPE_DLO_EXP_KATL ADD (
  CONSTRAINT TRECIPE_DLO_EXP_TYPE_KATL_PK
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

