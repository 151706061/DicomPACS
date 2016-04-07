DROP TABLE ASU.TSECTION_SMID CASCADE CONSTRAINTS
/

--
-- TSECTION_SMID  (Table) 
--
CREATE TABLE ASU.TSECTION_SMID
(
  FK_SECID     NUMBER(10),
  FK_SMID      NUMBER(15),
  FN_ORDER     NUMBER(6)                        DEFAULT 0                     NOT NULL,
  FL_FUNCLINK  NUMBER(1)                        DEFAULT 1                     NOT NULL,
  FC_CAPTION   VARCHAR2(200 BYTE)
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

COMMENT ON COLUMN ASU.TSECTION_SMID.FK_SECID IS 'раздел -> tsections'
/

COMMENT ON COLUMN ASU.TSECTION_SMID.FK_SMID IS 'элемент из TSMID'
/

COMMENT ON COLUMN ASU.TSECTION_SMID.FN_ORDER IS 'порядок элемента в группе'
/

COMMENT ON COLUMN ASU.TSECTION_SMID.FL_FUNCLINK IS 'Показывать постоянно или при наличии'
/

COMMENT ON COLUMN ASU.TSECTION_SMID.FC_CAPTION IS 'Выводимое название'
/


--
-- TSECTION_SMID_BY_SMID_SECID  (Index) 
--
--  Dependencies: 
--   TSECTION_SMID (Table)
--
CREATE INDEX ASU.TSECTION_SMID_BY_SMID_SECID ON ASU.TSECTION_SMID
(FK_SECID, FK_SMID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          80K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TSECTION_SMID_BEFORE_INS  (Trigger) 
--
--  Dependencies: 
--   TSECTION_SMID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSECTION_SMID_BEFORE_INS" 
 BEFORE 
 INSERT
 ON ASU.TSECTION_SMID  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
declare
  nHTMLID NUMBER;
begin
  select get_smidname(:new.fk_smid) into :new.fc_caption from dual;
  select fk_ib_print into nHTMLID from tsections where fk_id=:new.fk_secid;
  if nHTMLID <>-1 then
    insert into asu.tibprint(fk_owner, fc_name, fk_smid) values(nHTMLID, get_smidname(:new.fk_smid), :new.fk_smid);
  end if;
end;
/
SHOW ERRORS;


