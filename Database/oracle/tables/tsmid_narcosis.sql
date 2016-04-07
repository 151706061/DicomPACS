DROP TABLE ASU.TSMID_NARCOSIS CASCADE CONSTRAINTS
/

--
-- TSMID_NARCOSIS  (Table) 
--
CREATE TABLE ASU.TSMID_NARCOSIS
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

COMMENT ON TABLE ASU.TSMID_NARCOSIS IS '����� ��������� � DBF, � ������� ���������� ID ���� ������� OCC ���������� ���������� ���������, ������� � ���������� ����� ������������ � �������� Author:Efimov'
/

COMMENT ON COLUMN ASU.TSMID_NARCOSIS.FK_ID IS 'tsmid.fk_id'
/


GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE ON ASU.TSMID_NARCOSIS TO EXCH79
/

