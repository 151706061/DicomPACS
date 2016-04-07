DROP TABLE ASU.TPOVTOR CASCADE CONSTRAINTS
/

--
-- TPOVTOR  (Table) 
--
CREATE TABLE ASU.TPOVTOR
(
  FK_ID       NUMBER(9)                         DEFAULT -1                    NOT NULL,
  FK_SMID     NUMBER(9)                         DEFAULT -1                    NOT NULL,
  FD_DATE     DATE,
  FN_COUNT    NUMBER,
  FN_CONTROL  NUMBER,
  FN_SAN      NUMBER
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          520K
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

COMMENT ON TABLE ASU.TPOVTOR IS 'Таблица с количествами повторных исследований'
/

COMMENT ON COLUMN ASU.TPOVTOR.FK_ID IS 'SEQUENCE=[SEQ_TPOVTOR]'
/

COMMENT ON COLUMN ASU.TPOVTOR.FK_SMID IS 'Код смид'
/

COMMENT ON COLUMN ASU.TPOVTOR.FD_DATE IS 'Дата за которое...'
/

COMMENT ON COLUMN ASU.TPOVTOR.FN_COUNT IS 'Количество повторных иследований'
/

COMMENT ON COLUMN ASU.TPOVTOR.FN_CONTROL IS 'Количество исследований для контроля качества'
/

COMMENT ON COLUMN ASU.TPOVTOR.FN_SAN IS 'Количество санитарно-гигиенических исследований'
/


--
-- TOVTOR_BY_ID  (Index) 
--
--  Dependencies: 
--   TPOVTOR (Table)
--
CREATE UNIQUE INDEX ASU.TOVTOR_BY_ID ON ASU.TPOVTOR
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
-- TPOVTOR_BY_ID_SMID  (Index) 
--
--  Dependencies: 
--   TPOVTOR (Table)
--
CREATE UNIQUE INDEX ASU.TPOVTOR_BY_ID_SMID ON ASU.TPOVTOR
(FK_ID, FK_SMID)
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
-- TPOVTOR_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TPOVTOR (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPOVTOR_BEFORE_INSERT" 
  BEFORE INSERT
  ON asu.TPOVTOR
  REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
Begin
  SELECT SEQ_TPOVTOR.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


