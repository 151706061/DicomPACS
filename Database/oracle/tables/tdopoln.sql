DROP TABLE ASU.TDOPOLN CASCADE CONSTRAINTS
/

--
-- TDOPOLN  (Table) 
--
CREATE TABLE ASU.TDOPOLN
(
  FK_ID        INTEGER                          NOT NULL,
  FC_CHAR      VARCHAR2(4000 BYTE),
  FK_SMDIAGID  INTEGER
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
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TDOPOLN IS 'Таблица содержит в себе сведения "дополнительно" к каждому диагнозу из TSMID. Created by Kolya'
/

COMMENT ON COLUMN ASU.TDOPOLN.FK_ID IS 'SEQUENCE=[SEQ_INS_TDOPOLN]'
/

COMMENT ON COLUMN ASU.TDOPOLN.FC_CHAR IS 'Запись в строке "дополнительно"'
/

COMMENT ON COLUMN ASU.TDOPOLN.FK_SMDIAGID IS 'ID диагноза из TSMID'
/


--
-- TDOPOLN_SMDIAGID  (Index) 
--
--  Dependencies: 
--   TDOPOLN (Table)
--
CREATE INDEX ASU.TDOPOLN_SMDIAGID ON ASU.TDOPOLN
(FK_SMDIAGID)
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
-- TR_INS_TDOPOLN  (Trigger) 
--
--  Dependencies: 
--   TDOPOLN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_INS_TDOPOLN" 
 BEFORE
  INSERT
 ON tdopoln
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
 select seq_ins_tdopoln.nextval into :new.fk_id from dual;
end;
/
SHOW ERRORS;


