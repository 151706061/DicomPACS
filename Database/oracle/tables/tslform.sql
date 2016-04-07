ALTER TABLE ASU.TSLFORM
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TSLFORM CASCADE CONSTRAINTS
/

--
-- TSLFORM  (Table) 
--
CREATE TABLE ASU.TSLFORM
(
  FK_ID                     NUMBER              NOT NULL,
  FK_REQUESTID              NUMBER,
  FK_ORGID                  NUMBER,
  FD_GET                    DATE,
  FD_OUT                    DATE,
  FL_DEL                    NUMBER              DEFAULT 0,
  FN_STATE                  NUMBER,
  FC_NUMBER                 VARCHAR2(12 BYTE),
  FC_SERIES                 VARCHAR2(2 BYTE),
  FK_SOTRID                 NUMBER,
  FD_PRINT                  DATE,
  FK_BADBLANK_REASONID      NUMBER,
  FD_LASTDATE_CHANGE_STATE  DATE                DEFAULT sysdate
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          80K
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

COMMENT ON TABLE ASU.TSLFORM IS 'Бланки листков нетрудоспособности'
/

COMMENT ON COLUMN ASU.TSLFORM.FK_ID IS 'SEQUENCE=[SEQ_TSLFORM]'
/

COMMENT ON COLUMN ASU.TSLFORM.FK_REQUESTID IS 'Код требования на бланк (используется в поликлинике)'
/

COMMENT ON COLUMN ASU.TSLFORM.FK_ORGID IS 'Код организации, выдавшей бланк'
/

COMMENT ON COLUMN ASU.TSLFORM.FD_GET IS 'Дата получения бланка (используется в поликлинике)'
/

COMMENT ON COLUMN ASU.TSLFORM.FD_OUT IS 'Дата выдачи бланка (используется в поликлинике)'
/

COMMENT ON COLUMN ASU.TSLFORM.FL_DEL IS 'Признак удаления'
/

COMMENT ON COLUMN ASU.TSLFORM.FN_STATE IS 'Состояние бланка'
/

COMMENT ON COLUMN ASU.TSLFORM.FC_NUMBER IS 'Номер бланка'
/

COMMENT ON COLUMN ASU.TSLFORM.FC_SERIES IS 'Серия бланка'
/

COMMENT ON COLUMN ASU.TSLFORM.FK_SOTRID IS 'tsotr.fk_id Сотрудник, на учете у которого находится бланк --20060826 Serg'
/

COMMENT ON COLUMN ASU.TSLFORM.FD_PRINT IS 'Дата печати'
/

COMMENT ON COLUMN ASU.TSLFORM.FK_BADBLANK_REASONID IS 'TSMID.FK_ID из ветки с синонимом LN_BADBLANK_REASON. Причина забраковки бланка (устанавливается при выборе статуса "Испорчен", FN_STATE = 6) by Slusarenko M.D. 25.11.2013'
/

COMMENT ON COLUMN ASU.TSLFORM.FD_LASTDATE_CHANGE_STATE IS 'Дата последнего изменения статуса бланка fn_state'
/


--
-- TSLFORM_PK  (Index) 
--
--  Dependencies: 
--   TSLFORM (Table)
--
CREATE UNIQUE INDEX ASU.TSLFORM_PK ON ASU.TSLFORM
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
-- TSLFORM_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TSLFORM (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSLFORM_BEFORE_INSERT" 
  BEFORE INSERT
  ON ASU.TSLFORM   REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
Begin
  SELECT SEQ_TSLFORM.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TSLFORM 
-- 
ALTER TABLE ASU.TSLFORM ADD (
  CONSTRAINT TSLFORM_PK
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

