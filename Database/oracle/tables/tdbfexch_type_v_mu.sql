DROP TABLE ASU.TDBFEXCH_TYPE_V_MU CASCADE CONSTRAINTS
/

--
-- TDBFEXCH_TYPE_V_MU  (Table) 
--
CREATE TABLE ASU.TDBFEXCH_TYPE_V_MU
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
            NEXT             8K
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

COMMENT ON TABLE ASU.TDBFEXCH_TYPE_V_MU IS '�������� � DBF. ���� ����� ����������� ������, ������� ������ ���� �������� � �������� (����������� ��� ������ ��������) ������ ������� �������� ���������� �������� Author:Efimov'
/

COMMENT ON COLUMN ASU.TDBFEXCH_TYPE_V_MU.FK_ID IS 'TSMID.FK_ID. ���� ����� ����������� ������, ������� ������ ���� �������� � �������� (����������� ��� ������ ��������) Author:Efimov'
/


--
-- I_DBFEXCH_TYPE_V_MU_ID  (Index) 
--
--  Dependencies: 
--   TDBFEXCH_TYPE_V_MU (Table)
--
CREATE INDEX ASU.I_DBFEXCH_TYPE_V_MU_ID ON ASU.TDBFEXCH_TYPE_V_MU
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


