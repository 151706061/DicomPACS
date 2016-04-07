DROP TABLE ASU.TSOTR_SPEC CASCADE CONSTRAINTS
/

--
-- TSOTR_SPEC  (Table) 
--
CREATE TABLE ASU.TSOTR_SPEC
(
  FK_ID    NUMBER,
  FC_NAME  VARCHAR2(255 BYTE)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
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

COMMENT ON TABLE ASU.TSOTR_SPEC IS 'Справочник должностей сотрудников для выгрузки в ФОМС, Author: Kulbatsky'
/

COMMENT ON COLUMN ASU.TSOTR_SPEC.FK_ID IS 'ID'
/

COMMENT ON COLUMN ASU.TSOTR_SPEC.FC_NAME IS 'Наименование специальности (справочники VSO, VSD, SSO)'
/


--
-- I_TSOTR_SPEC_ID  (Index) 
--
--  Dependencies: 
--   TSOTR_SPEC (Table)
--
CREATE INDEX ASU.I_TSOTR_SPEC_ID ON ASU.TSOTR_SPEC
(FK_ID)
NOLOGGING
TABLESPACE USR
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


GRANT SELECT ON ASU.TSOTR_SPEC TO LOGIN
/

