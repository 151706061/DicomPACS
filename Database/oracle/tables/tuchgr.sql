DROP TABLE ASU.TUCHGR CASCADE CONSTRAINTS
/

--
-- TUCHGR  (Table) 
--
CREATE TABLE ASU.TUCHGR
(
  FC_NAME     VARCHAR2(255 BYTE),
  FK_ID       NUMBER(9),
  FL_OTCH     NUMBER(1)                         DEFAULT 1,
  FC_COMMENT  VARCHAR2(2000 BYTE)
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

COMMENT ON TABLE ASU.TUCHGR IS 'справочник учетных групп в аптеке'
/

COMMENT ON COLUMN ASU.TUCHGR.FC_NAME IS 'Учетная группа'
/

COMMENT ON COLUMN ASU.TUCHGR.FK_ID IS 'SEQUENCE=[SEQ_TUCHGR]'
/

COMMENT ON COLUMN ASU.TUCHGR.FL_OTCH IS 'Включат в отчет'
/

COMMENT ON COLUMN ASU.TUCHGR.FC_COMMENT IS 'Описание'
/


--
-- TUCHGR_INS  (Trigger) 
--
--  Dependencies: 
--   TUCHGR (Table)
--
CREATE OR REPLACE TRIGGER ASU."TUCHGR_INS" 
BEFORE INSERT
ON tuchgr
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
Begin
  select seq_tuchgr.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


--
-- TUCHGR_DEL  (Trigger) 
--
--  Dependencies: 
--   TUCHGR (Table)
--
CREATE OR REPLACE TRIGGER ASU."TUCHGR_DEL" 
BEFORE  DELETE
ON tuchgr
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
DECLARE
   nTmp   ROWID;
BEGIN
   IF pkgtuchgr.isExistsMedic(:old.fk_id) = 1 THEN
      raise_application_error (-20001, 'Вы не можете удалить фармакологиеческую группу, т.к. есть учетные единицы которые принадлежат этой группе');
   END IF;
END;
/
SHOW ERRORS;


