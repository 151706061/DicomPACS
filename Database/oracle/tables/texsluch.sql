ALTER TABLE ASU.TEXSLUCH
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TEXSLUCH CASCADE CONSTRAINTS
/

--
-- TEXSLUCH  (Table) 
--
CREATE TABLE ASU.TEXSLUCH
(
  LPU_ID       NUMBER(10),
  PERSON_IDL   NUMBER(19),
  ID_ILL       NUMBER(19)                       NOT NULL,
  P_ID_ILL     NUMBER(2),
  YEAR         NUMBER(4),
  MONTH        NUMBER(2),
  FL_CANCEL    NUMBER(1),
  FK_ID        NUMBER(15)                       NOT NULL,
  FK_POLY      NUMBER(1),
  FD_OPENED    DATE,
  FD_CLOSED    DATE,
  FC_FAM       VARCHAR2(30 BYTE),
  FC_IM        VARCHAR2(30 BYTE),
  FC_OTCH      VARCHAR2(30 BYTE),
  FD_ROJD      DATE,
  ID_ILL_GR    NUMBER(19),
  P_ID_ILL_GR  NUMBER(2)
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

COMMENT ON TABLE ASU.TEXSLUCH IS 'Список случаев для которых была предпринята попытка выгрузки в DBF Author:Efimov'
/

COMMENT ON COLUMN ASU.TEXSLUCH.LPU_ID IS 'Код ЛПУ'
/

COMMENT ON COLUMN ASU.TEXSLUCH.PERSON_IDL IS 'Локальный номер застрахованного в ЛПУ'
/

COMMENT ON COLUMN ASU.TEXSLUCH.ID_ILL IS 'Идентификационный номер случая'
/

COMMENT ON COLUMN ASU.TEXSLUCH.P_ID_ILL IS 'Порядковый номер идентификационного номера случая'
/

COMMENT ON COLUMN ASU.TEXSLUCH.YEAR IS 'Год подачи реестра'
/

COMMENT ON COLUMN ASU.TEXSLUCH.MONTH IS 'Месяц подачи реестра'
/

COMMENT ON COLUMN ASU.TEXSLUCH.FL_CANCEL IS 'Признак отмены, если 1 - выгрузка была отменена, 0 - выгрузка состоялась, для случаев входящих в группу (ID_ILL IS NOT NULL), поле не заполняется (брать по данным случая-группы)'
/

COMMENT ON COLUMN ASU.TEXSLUCH.FK_ID IS 'SEQ_TEXSLUCH'
/

COMMENT ON COLUMN ASU.TEXSLUCH.FK_POLY IS '1- поликлиника, иначе  стационар'
/

COMMENT ON COLUMN ASU.TEXSLUCH.FD_OPENED IS 'Дата начала случая'
/

COMMENT ON COLUMN ASU.TEXSLUCH.FD_CLOSED IS 'Дата окончания случая'
/

COMMENT ON COLUMN ASU.TEXSLUCH.FC_FAM IS 'Фамилия пациента'
/

COMMENT ON COLUMN ASU.TEXSLUCH.FC_IM IS 'Имя пациента'
/

COMMENT ON COLUMN ASU.TEXSLUCH.FC_OTCH IS 'Отчество пациента'
/

COMMENT ON COLUMN ASU.TEXSLUCH.FD_ROJD IS 'Дата рождения пациента'
/

COMMENT ON COLUMN ASU.TEXSLUCH.ID_ILL_GR IS 'ID_ILL - случая-группы. Если выгружается случай-группа, то в таблицу выгрузки добавляются все талоны, входящие в эту группу, они не отображаются визуально, но если случай группа был отменён, то ве случаи относящиеся к этой группе так же считаются отменёнными вне зависимости от значения fl_cancel'
/

COMMENT ON COLUMN ASU.TEXSLUCH.P_ID_ILL_GR IS 'ID_ILL_P - случая группы, см. ID_ILL_GR'
/


--
-- IDX_TEXSLUCH_CANCEL  (Index) 
--
--  Dependencies: 
--   TEXSLUCH (Table)
--
CREATE INDEX ASU.IDX_TEXSLUCH_CANCEL ON ASU.TEXSLUCH
(FL_CANCEL)
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
-- IDX_TEXSLUCH_ID_ILL  (Index) 
--
--  Dependencies: 
--   TEXSLUCH (Table)
--
CREATE INDEX ASU.IDX_TEXSLUCH_ID_ILL ON ASU.TEXSLUCH
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
-- IDX_TEXSLUCH_K  (Index) 
--
--  Dependencies: 
--   TEXSLUCH (Table)
--
CREATE UNIQUE INDEX ASU.IDX_TEXSLUCH_K ON ASU.TEXSLUCH
(LPU_ID, PERSON_IDL, ID_ILL, P_ID_ILL, YEAR, 
MONTH)
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
-- K_TEXSLUCH_ID  (Index) 
--
--  Dependencies: 
--   TEXSLUCH (Table)
--
CREATE UNIQUE INDEX ASU.K_TEXSLUCH_ID ON ASU.TEXSLUCH
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
-- TEXSLUCH_INSERT  (Trigger) 
--
--  Dependencies: 
--   TEXSLUCH (Table)
--
CREATE OR REPLACE TRIGGER ASU."TEXSLUCH_INSERT" 
 BEFORE
  INSERT
 ON asu.TEXSLUCH
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  IF :new.fk_id IS NULL THEN
    SELECT asu.SEQ_TEXSLUCH.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  end if;
End;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TEXSLUCH 
-- 
ALTER TABLE ASU.TEXSLUCH ADD (
  CONSTRAINT K_TEXSLUCH_ID
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

