ALTER TABLE ASU.TFARMGR
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TFARMGR CASCADE CONSTRAINTS
/

--
-- TFARMGR  (Table) 
--
CREATE TABLE ASU.TFARMGR
(
  FC_NAME     VARCHAR2(255 BYTE),
  FK_ID       NUMBER(9)                         NOT NULL,
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

COMMENT ON TABLE ASU.TFARMGR IS 'Справочник фармокологических групп в аптеке'
/

COMMENT ON COLUMN ASU.TFARMGR.FC_NAME IS 'Фармокологическая группа'
/

COMMENT ON COLUMN ASU.TFARMGR.FK_ID IS 'SEQUENCE=[SEQ_TFARMGR]'
/

COMMENT ON COLUMN ASU.TFARMGR.FC_COMMENT IS 'Описание'
/


--
-- TFARMGR_PKY  (Index) 
--
--  Dependencies: 
--   TFARMGR (Table)
--
CREATE UNIQUE INDEX ASU.TFARMGR_PKY ON ASU.TFARMGR
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          512K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TFARMGR  (Trigger) 
--
--  Dependencies: 
--   TFARMGR (Table)
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TFARMGR (Sequence)
--
CREATE OR REPLACE TRIGGER ASU."TFARMGR" 
BEFORE INSERT
ON tfarmgr
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
Begin
  select seq_tfarmgr.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


--
-- TFAMRGR_DEL  (Trigger) 
--
--  Dependencies: 
--   TFARMGR (Table)
--
CREATE OR REPLACE TRIGGER ASU."TFAMRGR_DEL" 
BEFORE  DELETE
ON tfarmgr
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
DECLARE
   nTmp   ROWID;
BEGIN
   IF pkgtfarmgr.isExistsMedic(:old.fk_id) = 1 THEN
      raise_application_error (-20001, 'Вы не можете удалить фармакологиеческую группу, т.к. есть учетные единицы которые принадлежат этой группе');
   END IF;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TFARMGR 
-- 
ALTER TABLE ASU.TFARMGR ADD (
  CONSTRAINT TFARMGR_PKY
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          512K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

