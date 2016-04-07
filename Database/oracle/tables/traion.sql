DROP TABLE ASU.TRAION CASCADE CONSTRAINTS
/

--
-- TRAION  (Table) 
--
CREATE TABLE ASU.TRAION
(
  FK_ID       NUMBER(16)                        NOT NULL,
  FC_NAME     VARCHAR2(30 BYTE),
  FL_DEFAULT  NUMBER(1)                         DEFAULT 0
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

COMMENT ON TABLE ASU.TRAION IS 'Справочник "Районы" by TimurLan '
/

COMMENT ON COLUMN ASU.TRAION.FK_ID IS 'SEQUENCE=[SEQ_TRAION]'
/

COMMENT ON COLUMN ASU.TRAION.FC_NAME IS 'название'
/

COMMENT ON COLUMN ASU.TRAION.FL_DEFAULT IS 'знач. по-умолчанию'
/


--
-- TRAION_BY_FK_ID  (Index) 
--
--  Dependencies: 
--   TRAION (Table)
--
CREATE UNIQUE INDEX ASU.TRAION_BY_FK_ID ON ASU.TRAION
(FK_ID)
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
-- TRAION_LOG  (Trigger) 
--
--  Dependencies: 
--   TRAION (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRAION_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TRAION  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  nTemp NUMBER;
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('TRAION', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_id), :new.fk_id);
    PKG_LOG.Do_log('TRAION', 'FC_NAME', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fc_name), :new.fk_id);
  elsif DELETING then
    PKG_LOG.Do_log('TRAION', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
    PKG_LOG.Do_log('TRAION', 'FC_NAME', 'DELETE', PKG_LOG.GET_VALUE(:old.FC_NAME), null, :old.fk_id);
  elsif UPDATING then
    PKG_LOG.Do_log('TRAION', 'FK_ID', 'UPDATE', PKG_LOG.GET_VALUE(:old.fk_id), PKG_LOG.GET_VALUE(:new.fk_id), :old.fk_id);
    if UPDATING ('FC_NAME') AND PKG_LOG.GET_VALUE(:old.FC_NAME) <> PKG_LOG.GET_VALUE(:new.FC_NAME) then
      PKG_LOG.Do_log('TRAION', 'FC_NAME', 'UPDATE', PKG_LOG.GET_VALUE(:old.FC_NAME), PKG_LOG.GET_VALUE(:new.FC_NAME), :old.fk_id);
    end if;
  end if;
  null;
END TRAION_LOG;
/
SHOW ERRORS;


--
-- TRAION_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TRAION (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRAION_BEFORE_INSERT" 
  BEFORE INSERT ON ASU.TRAION   REFERENCING OLD AS OLD NEW AS NEW
  FOR EACH ROW
Begin
  SELECT SEQ_TRAION.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


