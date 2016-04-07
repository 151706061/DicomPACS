DROP TABLE ASU.TNAZWIZZARD_NAZ CASCADE CONSTRAINTS
/

--
-- TNAZWIZZARD_NAZ  (Table) 
--
CREATE TABLE ASU.TNAZWIZZARD_NAZ
(
  FK_ID         NUMBER(15)                      NOT NULL,
  FK_SHABLONID  NUMBER(10),
  FK_SMID       NUMBER(15)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          240K
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

COMMENT ON COLUMN ASU.TNAZWIZZARD_NAZ.FK_ID IS 'SEQUENCE=[SEQ_TKARTA]'
/

COMMENT ON COLUMN ASU.TNAZWIZZARD_NAZ.FK_SHABLONID IS 'Код родителя (шаблона)'
/

COMMENT ON COLUMN ASU.TNAZWIZZARD_NAZ.FK_SMID IS 'Код назначения из смида'
/


--
-- TNAZWIZZARD_NAZ_BEFORE_INS  (Trigger) 
--
--  Dependencies: 
--   TNAZWIZZARD_NAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZWIZZARD_NAZ_BEFORE_INS" 
 BEFORE
  INSERT
 ON tnazwizzard_naz
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  SELECT seq_tkarta.nextval INTO :new.fk_id FROM dual;
end;
/
SHOW ERRORS;


--
-- TNAZWIZZARD_NAZ_BEFORE_DEL  (Trigger) 
--
--  Dependencies: 
--   TNAZWIZZARD_NAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZWIZZARD_NAZ_BEFORE_DEL" 
 BEFORE
  DELETE
 ON tnazwizzard_naz
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
--  delete from tnazwizzard_tib where fk_shbn_nazid=:old.fk_id;
  delete from tib where fk_pacid=:old.fk_id;
  delete from asu.tnazwizzard_expan e where e.fk_nazwizzardnazid=:old.fk_id;
end;
/
SHOW ERRORS;


