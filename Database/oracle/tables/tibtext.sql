DROP TABLE ASU.TIBTEXT CASCADE CONSTRAINTS
/

--
-- TIBTEXT  (Table) 
--
CREATE TABLE ASU.TIBTEXT
(
  FK_ID      NUMBER(15),
  FK_BLOBID  NUMBER(15),
  FK_PACID   NUMBER(15)
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

COMMENT ON TABLE ASU.TIBTEXT IS 'Таблица хранения подписанной истории болезни'
/

COMMENT ON COLUMN ASU.TIBTEXT.FK_ID IS 'SEQUENCE=[SEQ_TIBTEXT]'
/

COMMENT ON COLUMN ASU.TIBTEXT.FK_BLOBID IS 'Код по таблице TCLOBS'
/

COMMENT ON COLUMN ASU.TIBTEXT.FK_PACID IS 'Код пациента'
/


--
-- TIBTEXT_PACID_BLOBID  (Index) 
--
--  Dependencies: 
--   TIBTEXT (Table)
--
CREATE UNIQUE INDEX ASU.TIBTEXT_PACID_BLOBID ON ASU.TIBTEXT
(FK_PACID, FK_BLOBID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          256K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TIBTEXT_INS  (Trigger) 
--
--  Dependencies: 
--   TIBTEXT (Table)
--
CREATE OR REPLACE TRIGGER ASU."TIBTEXT_INS" 
  BEFORE INSERT
  ON ASU.TIBTEXT   REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
Begin
  select seq_tibtext.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


--
-- TIBTEXT_DEL  (Trigger) 
--
--  Dependencies: 
--   TIBTEXT (Table)
--
CREATE OR REPLACE TRIGGER ASU."TIBTEXT_DEL" 
AFTER DELETE
ON ASU.TIBTEXT REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
Begin
  delete from tclobs where fk_id = :old.fk_blobid;
  delete from tblobs where fk_id = :old.fk_blobid;
End;
/
SHOW ERRORS;


