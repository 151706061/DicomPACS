ALTER TABLE ASU.TRECIPE_DLO_EXP_REG_KATL
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TRECIPE_DLO_EXP_REG_KATL CASCADE CONSTRAINTS
/

--
-- TRECIPE_DLO_EXP_REG_KATL  (Table) 
--
CREATE TABLE ASU.TRECIPE_DLO_EXP_REG_KATL
(
  FK_ID         NUMBER,
  C_KAT         VARCHAR2(4 BYTE),
  NAME_KAT      VARCHAR2(300 BYTE),
  C_KATL        VARCHAR2(4 BYTE),
  DATE_BEG      DATE,
  MSG_TEXT      VARCHAR2(250 BYTE),
  LGOTAREC      NUMBER,
  LISTDRUGSID   VARCHAR2(100 BYTE),
  GROUPDRUGSID  VARCHAR2(100 BYTE)
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

COMMENT ON TABLE ASU.TRECIPE_DLO_EXP_REG_KATL IS 'ДЛО. Справочник региональных категорий граждан, имеющих право на получение ЛС'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_REG_KATL.FK_ID IS 'ключ'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_REG_KATL.C_KAT IS 'Код  категории гражданина, имеющего право на получение ЛС за счёт средств регионального бюджета'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_REG_KATL.NAME_KAT IS 'Наименование  категории'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_REG_KATL.C_KATL IS 'Код категории МЗ'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_REG_KATL.DATE_BEG IS 'Дата начала категории'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_EXP_REG_KATL.MSG_TEXT IS 'Признак удаления записи'
/


--
-- TRECIPE_DLO_EXP_REG_KATL_C_KAT  (Index) 
--
--  Dependencies: 
--   TRECIPE_DLO_EXP_REG_KATL (Table)
--
CREATE UNIQUE INDEX ASU.TRECIPE_DLO_EXP_REG_KATL_C_KAT ON ASU.TRECIPE_DLO_EXP_REG_KATL
(C_KAT)
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
-- TRECIPE_DLO_EXP_REG_KATL_PK  (Index) 
--
--  Dependencies: 
--   TRECIPE_DLO_EXP_REG_KATL (Table)
--
CREATE UNIQUE INDEX ASU.TRECIPE_DLO_EXP_REG_KATL_PK ON ASU.TRECIPE_DLO_EXP_REG_KATL
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
-- TRECIPE_DLO_EXP_REG_KATL_INS  (Trigger) 
--
--  Dependencies: 
--   TRECIPE_DLO_EXP_REG_KATL (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECIPE_DLO_EXP_REG_KATL_INS"
 BEFORE
  INSERT
 ON ASU.TRECIPE_DLO_EXP_REG_KATL REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  if (:new.fk_id is null) then
    select ASU.SEQ_TRECIPE_DLO_EXP_REG_KATL.nextval into :new.fk_id from dual;
  end if;
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TRECIPE_DLO_EXP_REG_KATL 
-- 
ALTER TABLE ASU.TRECIPE_DLO_EXP_REG_KATL ADD (
  CONSTRAINT TRECIPE_DLO_EXP_REG_KATL_PK
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
               ),
  CONSTRAINT TRECIPE_DLO_EXP_REG_KATL_C_KAT
 UNIQUE (C_KAT)
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

