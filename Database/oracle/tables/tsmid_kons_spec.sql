DROP TABLE ASU.TSMID_KONS_SPEC CASCADE CONSTRAINTS
/

--
-- TSMID_KONS_SPEC  (Table) 
--
CREATE TABLE ASU.TSMID_KONS_SPEC
(
  FK_ID          NUMBER(15)                     NOT NULL,
  FC_SYNONIM     VARCHAR2(254 BYTE),
  FN_DISP_STAGE  NUMBER
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

COMMENT ON TABLE ASU.TSMID_KONS_SPEC IS 'ѕеред выгрузкой в DBF, в таблицу копируютс€ ID всех записей OCC из ветки с синонимом KONS_SPEC, которые в дальнейшем будут использованы в выгрузке Author:Efimov'
/

COMMENT ON COLUMN ASU.TSMID_KONS_SPEC.FK_ID IS 'tsmid.fk_id'
/

COMMENT ON COLUMN ASU.TSMID_KONS_SPEC.FC_SYNONIM IS 'tsmid.FC_SYNONIM'
/

COMMENT ON COLUMN ASU.TSMID_KONS_SPEC.FN_DISP_STAGE IS '1 - первый этап диспансеризации, 2 - второй этап диспансеризации, 0 - другие назначени€ ветки " онсультативный прием"'
/


--
-- IDX_SMID_KONS_SPEC_ID  (Index) 
--
--  Dependencies: 
--   TSMID_KONS_SPEC (Table)
--
CREATE INDEX ASU.IDX_SMID_KONS_SPEC_ID ON ASU.TSMID_KONS_SPEC
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


GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE ON ASU.TSMID_KONS_SPEC TO EXCH79
/

GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE ON ASU.TSMID_KONS_SPEC TO PILE
/

