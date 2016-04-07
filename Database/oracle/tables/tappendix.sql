ALTER TABLE ASU.TAPPENDIX
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TAPPENDIX CASCADE CONSTRAINTS
/

--
-- TAPPENDIX  (Table) 
--
CREATE TABLE ASU.TAPPENDIX
(
  FK_ID            NUMBER                       NOT NULL,
  FK_DOGOVOR       NUMBER,
  FK_AMBTALON      NUMBER,
  FD_OPEN          DATE,
  FD_ASSUMECLOSE   DATE,
  FC_APPNUM        VARCHAR2(100 BYTE),
  FP_SOS           NUMBER                       DEFAULT 0,
  FD_PAYASSUME     DATE,
  FK_PAYTYPE       NUMBER,
  FK_SOTRCREATE    NUMBER,
  FL_PACSUBSCRIBE  NUMBER                       DEFAULT 0
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

COMMENT ON TABLE ASU.TAPPENDIX IS 'Приложения к договорам по платным услугам'
/

COMMENT ON COLUMN ASU.TAPPENDIX.FK_ID IS 'SEQUENCE=[SEQ_TKARTA]'
/

COMMENT ON COLUMN ASU.TAPPENDIX.FK_DOGOVOR IS 'TPLAT_DOGOVOR.FK_ID'
/

COMMENT ON COLUMN ASU.TAPPENDIX.FK_AMBTALON IS 'TAMBTALON.FK_ID'
/

COMMENT ON COLUMN ASU.TAPPENDIX.FD_OPEN IS 'Срок начала действия приложения'
/

COMMENT ON COLUMN ASU.TAPPENDIX.FD_ASSUMECLOSE IS 'Предполагаемый срок окончания действия приложения'
/

COMMENT ON COLUMN ASU.TAPPENDIX.FC_APPNUM IS 'Номер приложения'
/

COMMENT ON COLUMN ASU.TAPPENDIX.FP_SOS IS '0-действующий;1-по факту выполнения всех услуг;2-расторгнут'
/

COMMENT ON COLUMN ASU.TAPPENDIX.FD_PAYASSUME IS 'Предполагаемая дата оплаты услуг приложения'
/

COMMENT ON COLUMN ASU.TAPPENDIX.FK_PAYTYPE IS 'tsmid.fk_id (предоплата, частичная оплата, полная оплата...)'
/

COMMENT ON COLUMN ASU.TAPPENDIX.FK_SOTRCREATE IS 'Сотрудник, создавший приложение'
/

COMMENT ON COLUMN ASU.TAPPENDIX.FL_PACSUBSCRIBE IS '0 - пациент ещё не подписал договор; 1 - пациент подписал договор'
/


--
-- PK_APPENDIX  (Index) 
--
--  Dependencies: 
--   TAPPENDIX (Table)
--
CREATE UNIQUE INDEX ASU.PK_APPENDIX ON ASU.TAPPENDIX
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
-- TAPPENDIX_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TAPPENDIX (Table)
--
CREATE OR REPLACE TRIGGER ASU."TAPPENDIX_BEFORE_INSERT" 
 BEFORE
 INSERT
 ON ASU.TAPPENDIX  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  SELECT SEQ_TKARTA.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TAPPENDIX 
-- 
ALTER TABLE ASU.TAPPENDIX ADD (
  CONSTRAINT PK_APPENDIX
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

