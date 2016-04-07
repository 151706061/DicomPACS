ALTER TABLE ASU.TRECIPE
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TRECIPE CASCADE CONSTRAINTS
/

--
-- TRECIPE  (Table) 
--
--  Dependencies: 
--   TRECIPEDURATION (Table)
--   TRECIPEPERCENT (Table)
--   TRECIPETYPE (Table)
--
CREATE TABLE ASU.TRECIPE
(
  FK_ID               NUMBER(10)                NOT NULL,
  FK_TYPE             NUMBER(10),
  FD_DATE             DATE                      DEFAULT Sysdate,
  FK_DURATION         NUMBER(10),
  FK_PAYTYPE          NUMBER(10),
  FK_PERCENT          NUMBER(10),
  FL_EDIT             NUMBER(1)                 DEFAULT 0,
  FN_NUM              NUMBER(10),
  FC_SERIAL           VARCHAR2(255 BYTE),
  FL_LGOT             NUMBER(1),
  FK_SOTRID           INTEGER,
  FK_PAC_LGOT_CAT     NUMBER,
  FK_PAC_ID           NUMBER,
  FD_START            DATE,
  FK_VRACH_ID         NUMBER,
  FK_LGOT_DOC_ID      NUMBER,
  FN_PRINT_COUNT      NUMBER                    DEFAULT 0,
  FN_STATUS           NUMBER,
  FC_COMMENT          VARCHAR2(100 BYTE),
  FK_DIAG             NUMBER,
  FC_DTD              VARCHAR2(50 BYTE),
  FC_SNILS            VARCHAR2(20 BYTE),
  FL_USE_DIAG_PARENT  NUMBER(1)                 DEFAULT 0,
  FL_DEL              NUMBER(1)                 DEFAULT 0,
  FK_OSMOTR_ID        NUMBER
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          160K
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

COMMENT ON TABLE ASU.TRECIPE IS 'Sill - Таблица рептов'
/

COMMENT ON COLUMN ASU.TRECIPE.FK_ID IS 'SEQUENCE=[SEQ_TRECIPE]'
/

COMMENT ON COLUMN ASU.TRECIPE.FK_TYPE IS 'Код типа рецепта (см. т. TRecipeType)'
/

COMMENT ON COLUMN ASU.TRECIPE.FD_DATE IS 'Дата регистрации'
/

COMMENT ON COLUMN ASU.TRECIPE.FK_DURATION IS 'Код срока действий (см. т. TRecipeDuration)'
/

COMMENT ON COLUMN ASU.TRECIPE.FK_PAYTYPE IS 'Код источник финансирования (см. т. TRecipePaytype)'
/

COMMENT ON COLUMN ASU.TRECIPE.FK_PERCENT IS 'Код процента оплаты (см. т. TRecipePercent)'
/

COMMENT ON COLUMN ASU.TRECIPE.FL_EDIT IS 'Признак "редактируется"'
/

COMMENT ON COLUMN ASU.TRECIPE.FN_NUM IS 'Номер рецепта'
/

COMMENT ON COLUMN ASU.TRECIPE.FC_SERIAL IS 'Серия рецепта'
/

COMMENT ON COLUMN ASU.TRECIPE.FL_LGOT IS '0 - форма (107у); 3 - форма (148-1/У-06(л) (льготный-ФЕДЕРАЛЬНЫЙ); 2 - 148-1/У-88 (льготный-РЕГИОНАЛЬНЫЙ)  (расшифровки в ASU.PKG_DLO.GET_LGOT_TYPE_NAME)'
/

COMMENT ON COLUMN ASU.TRECIPE.FK_SOTRID IS 'Код сотрудника создавшего рецепт'
/

COMMENT ON COLUMN ASU.TRECIPE.FK_PAC_LGOT_CAT IS 'категория льготности ASU.TSMID.FK_ID (OWNER FC_SYNONIM = ''LD_KATEGOR_LGOT'')'
/

COMMENT ON COLUMN ASU.TRECIPE.FK_PAC_ID IS 'ID пациента ASU.TAMBULANCE.FK_ID'
/

COMMENT ON COLUMN ASU.TRECIPE.FD_START IS 'дата создания рецепта'
/

COMMENT ON COLUMN ASU.TRECIPE.FK_VRACH_ID IS 'врач, от чьего имени делается рецепт (LOGIN.TSOTR.FK_ID)'
/

COMMENT ON COLUMN ASU.TRECIPE.FK_LGOT_DOC_ID IS 'ссылка на льготный документ ASU.TPeople_lgot'
/

COMMENT ON COLUMN ASU.TRECIPE.FN_PRINT_COUNT IS 'кол-во распечаток'
/

COMMENT ON COLUMN ASU.TRECIPE.FN_STATUS IS 'статус рецепта (расшифровки в ASU.PKG_DLO.GET_STATUS_NAME)'
/

COMMENT ON COLUMN ASU.TRECIPE.FC_COMMENT IS 'комментарий к рецепту'
/

COMMENT ON COLUMN ASU.TRECIPE.FK_DIAG IS 'диагноз, по которому выдается рецепт (asu.TDIAG.fk_id)'
/

COMMENT ON COLUMN ASU.TRECIPE.FC_DTD IS 'поле D.t.d. в льготном региональном рецепте'
/

COMMENT ON COLUMN ASU.TRECIPE.FC_SNILS IS 'СНИЛС пациента'
/

COMMENT ON COLUMN ASU.TRECIPE.FL_USE_DIAG_PARENT IS 'использовать общий диагноз (на уровень выше)'
/

COMMENT ON COLUMN ASU.TRECIPE.FL_DEL IS 'признак удаления: 1- удален, 0 - нет'
/


--
-- TRECIPE_BY_ID  (Index) 
--
--  Dependencies: 
--   TRECIPE (Table)
--
CREATE UNIQUE INDEX ASU.TRECIPE_BY_ID ON ASU.TRECIPE
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          128K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TRECIPE_FD_DATE  (Index) 
--
--  Dependencies: 
--   TRECIPE (Table)
--
CREATE INDEX ASU.TRECIPE_FD_DATE ON ASU.TRECIPE
(FD_DATE)
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
-- TRECIPE_FK_DIAG  (Index) 
--
--  Dependencies: 
--   TRECIPE (Table)
--
CREATE INDEX ASU.TRECIPE_FK_DIAG ON ASU.TRECIPE
(FK_DIAG)
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
-- TRECIPE_FK_PACID  (Index) 
--
--  Dependencies: 
--   TRECIPE (Table)
--
CREATE INDEX ASU.TRECIPE_FK_PACID ON ASU.TRECIPE
(FK_PAC_ID)
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
-- TRECIPE_FK_VRACH  (Index) 
--
--  Dependencies: 
--   TRECIPE (Table)
--
CREATE INDEX ASU.TRECIPE_FK_VRACH ON ASU.TRECIPE
(FK_VRACH_ID)
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
-- TRECIPE_SERIAL_NUM_UNIQ  (Index) 
--
--  Dependencies: 
--   TRECIPE (Table)
--
CREATE UNIQUE INDEX ASU.TRECIPE_SERIAL_NUM_UNIQ ON ASU.TRECIPE
(FN_NUM, FC_SERIAL)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          128K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TRECIPE_SERIAL_NUM_UNIQ1  (Index) 
--
--  Dependencies: 
--   TRECIPE (Table)
--
CREATE UNIQUE INDEX ASU.TRECIPE_SERIAL_NUM_UNIQ1 ON ASU.TRECIPE
(FN_NUM, FC_SERIAL, FL_DEL)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          128K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TRECIPE_UPD  (Trigger) 
--
--  Dependencies: 
--   TRECIPE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECIPE_UPD" 
 BEFORE
  UPDATE
 ON asu.trecipe
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  :NEW.FD_DATE := trunc(:NEW.FD_DATE);
end;
/
SHOW ERRORS;


--
-- TRECIPE_DEL  (Trigger) 
--
--  Dependencies: 
--   TRECIPE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECIPE_DEL" 
 BEFORE 
 DELETE
 ON ASU.TRECIPE  FOR EACH ROW
begin
  delete from ASU.TRECIPE_MEDIC rm where rm.FK_RECIPE_ID = :old.fk_id;
  delete from ASU.TRECIPE_CHANGE_HISTORY rch where rch.FK_RECIPE_ID = :old.fk_id;  
end;
/
SHOW ERRORS;


--
-- TRECIPE_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TRECIPE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECIPE_BEFORE_INSERT" 
 BEFORE 
 INSERT
 ON ASU.TRECIPE  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
WHEN (
new.fk_id is null
      )
begin
  if :new.fk_id is null then
    select seq_trecipe.nextval into :new.fk_id from dual;
  end if;
  
  if :new.fd_start is null then
    :new.fd_start := sysdate;
  end if;
  
  if :new.fd_date is null then
    :new.fd_date := trunc(sysdate);
  end if;
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TRECIPE 
-- 
ALTER TABLE ASU.TRECIPE ADD (
  CONSTRAINT TRECIPE_BY_ID
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          128K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ),
  CONSTRAINT TRECIPE_SERIAL_NUM_UNIQ1
 UNIQUE (FN_NUM, FC_SERIAL, FL_DEL)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          128K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

-- 
-- Foreign Key Constraints for Table TRECIPE 
-- 
ALTER TABLE ASU.TRECIPE ADD (
  CONSTRAINT TRECIPE_TRECIPEDURATION 
 FOREIGN KEY (FK_DURATION) 
 REFERENCES ASU.TRECIPEDURATION (FK_ID),
  CONSTRAINT TRECIPE_TRECIPEPERCENT 
 FOREIGN KEY (FK_PERCENT) 
 REFERENCES ASU.TRECIPEPERCENT (FK_ID),
  CONSTRAINT TRECIPE_TRECIPETYPE 
 FOREIGN KEY (FK_TYPE) 
 REFERENCES ASU.TRECIPETYPE (FK_ID))
/

