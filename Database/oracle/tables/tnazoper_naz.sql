DROP TABLE ASU.TNAZOPER_NAZ CASCADE CONSTRAINTS
/

--
-- TNAZOPER_NAZ  (Table) 
--
CREATE TABLE ASU.TNAZOPER_NAZ
(
  FK_NAZID    NUMBER(15),
  FK_SOTRID   NUMBER(15),
  FP_MEMTYPE  NUMBER(1),
  FK_USERID   NUMBER
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

COMMENT ON TABLE ASU.TNAZOPER_NAZ IS '����������: �������� ���������� ������������� ����������� ������������
�������: ���������� �.�. 15.04.2007
  '
/

COMMENT ON COLUMN ASU.TNAZOPER_NAZ.FK_NAZID IS '��� ���������� �� ��������'
/

COMMENT ON COLUMN ASU.TNAZOPER_NAZ.FK_SOTRID IS '��� ���������� ��� ���������� ��������'
/

COMMENT ON COLUMN ASU.TNAZOPER_NAZ.FP_MEMTYPE IS '��� ���������'
/

COMMENT ON COLUMN ASU.TNAZOPER_NAZ.FK_USERID IS '������������� ���������� ������'
/


--
-- TNAZOPER_NAZ_BY_NAZID_MEMTYPE  (Index) 
--
--  Dependencies: 
--   TNAZOPER_NAZ (Table)
--
CREATE INDEX ASU.TNAZOPER_NAZ_BY_NAZID_MEMTYPE ON ASU.TNAZOPER_NAZ
(FK_NAZID, FP_MEMTYPE)
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


