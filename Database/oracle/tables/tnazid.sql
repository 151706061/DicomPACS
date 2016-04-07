DROP TABLE ASU.TNAZID CASCADE CONSTRAINTS
/

--
-- TNAZID  (Table) 
--
CREATE TABLE ASU.TNAZID
(
  FK_ID         NUMBER(10),
  FK_NAZID      NUMBER(10),
  FK_EPIKRIZID  NUMBER(10),
  FK_SMID       NUMBER                          DEFAULT -1
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

COMMENT ON TABLE ASU.TNAZID IS 'Таблица идешников назначений, привязанных к идешникам эпикризам - используется при формровании/обновлении эпикризов'
/

COMMENT ON COLUMN ASU.TNAZID.FK_ID IS 'SEQUENCE=[SEQ_INS_TNAZID]'
/

COMMENT ON COLUMN ASU.TNAZID.FK_NAZID IS 'ID назначения'
/

COMMENT ON COLUMN ASU.TNAZID.FK_EPIKRIZID IS 'ID эпикриза'
/

COMMENT ON COLUMN ASU.TNAZID.FK_SMID IS 'TSMID.FK_ID'
/


--
-- TNAZID_BY_EPIKRIZID  (Index) 
--
--  Dependencies: 
--   TNAZID (Table)
--
CREATE INDEX ASU.TNAZID_BY_EPIKRIZID ON ASU.TNAZID
(FK_EPIKRIZID)
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
-- TNAZID_BY_NAZID  (Index) 
--
--  Dependencies: 
--   TNAZID (Table)
--
CREATE INDEX ASU.TNAZID_BY_NAZID ON ASU.TNAZID
(FK_NAZID)
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
-- TNAZID_FKID  (Index) 
--
--  Dependencies: 
--   TNAZID (Table)
--
CREATE UNIQUE INDEX ASU.TNAZID_FKID ON ASU.TNAZID
(FK_ID)
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
-- TNAZID_SMID  (Index) 
--
--  Dependencies: 
--   TNAZID (Table)
--
CREATE INDEX ASU.TNAZID_SMID ON ASU.TNAZID
(FK_SMID)
NOLOGGING
TABLESPACE INDX
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
-- TR_INS_TNAZID  (Trigger) 
--
--  Dependencies: 
--   TNAZID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_INS_TNAZID" 
 BEFORE
  INSERT
 ON tnazid
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
 select seq_ins_tnazid.NEXTVAL into :new.fk_id from dual;
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TNAZID 
-- 
ALTER TABLE ASU.TNAZID ADD (
  CONSTRAINT TNAZID_FKID
 UNIQUE (FK_ID)
    USING INDEX 
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
               ))
/

