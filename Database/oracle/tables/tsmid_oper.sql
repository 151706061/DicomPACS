DROP TABLE ASU.TSMID_OPER CASCADE CONSTRAINTS
/

--
-- TSMID_OPER  (Table) 
--
CREATE TABLE ASU.TSMID_OPER
(
  FK_ID  NUMBER(15)                             NOT NULL
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

COMMENT ON TABLE ASU.TSMID_OPER IS 'ѕеред выгрузкой в DBF, в таблицу копируютс€ ID всех записей OCC €вл€ющихс€ операци€ми, которые в дальнейшем будут использованы в выгрузке Author:Efimov'
/

COMMENT ON COLUMN ASU.TSMID_OPER.FK_ID IS 'tsmid.fk_id'
/


GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE ON ASU.TSMID_OPER TO EXCH79
/

GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE ON ASU.TSMID_OPER TO PILE
/

