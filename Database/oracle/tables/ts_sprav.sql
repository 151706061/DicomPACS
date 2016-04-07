ALTER TABLE ASU.TS_SPRAV
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TS_SPRAV CASCADE CONSTRAINTS
/

--
-- TS_SPRAV  (Table) 
--
CREATE TABLE ASU.TS_SPRAV
(
  FK_ID          NUMBER                         NOT NULL,
  FC_NAME        VARCHAR2(255 BYTE),
  FL_DEL         NUMBER(1)                      DEFAULT 0,
  FC_SYNONIM     VARCHAR2(255 BYTE),
  FL_VRACH       NUMBER(1)                      DEFAULT 0,
  FC_NAME_SHORT  VARCHAR2(9 BYTE)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          160K
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

COMMENT ON TABLE ASU.TS_SPRAV IS 'by TimurLan Справочник должностей. Будет переделан???'
/

COMMENT ON COLUMN ASU.TS_SPRAV.FK_ID IS 'SEQ.NEXTVALL'
/

COMMENT ON COLUMN ASU.TS_SPRAV.FC_NAME IS 'Наименование должности'
/

COMMENT ON COLUMN ASU.TS_SPRAV.FL_DEL IS 'Признак удаления'
/

COMMENT ON COLUMN ASU.TS_SPRAV.FC_SYNONIM IS 'by Spasskiy - для 30 формы'
/

COMMENT ON COLUMN ASU.TS_SPRAV.FL_VRACH IS 'Является ли врачем'
/

COMMENT ON COLUMN ASU.TS_SPRAV.FC_NAME_SHORT IS 'Короткое наименование должности -- Kashira O.A. 05.08.2011'
/


--
-- DELETEIT2  (Index) 
--
--  Dependencies: 
--   TS_SPRAV (Table)
--
CREATE UNIQUE INDEX ASU.DELETEIT2 ON ASU.TS_SPRAV
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
-- SEQ_TS_SPRAV_BI  (Trigger) 
--
--  Dependencies: 
--   TS_SPRAV (Table)
--
CREATE OR REPLACE TRIGGER ASU."SEQ_TS_SPRAV_BI" 
 BEFORE
 INSERT
 ON ASU.TS_SPRAV  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
begin
    select SEQ_TSMID.nextval into :new.fk_id from dual;
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TS_SPRAV 
-- 
ALTER TABLE ASU.TS_SPRAV ADD (
  CONSTRAINT DELETEIT2
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
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
               ))
/

GRANT DELETE, INSERT, SELECT, UPDATE ON ASU.TS_SPRAV TO LOGIN
/

