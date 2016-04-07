DROP TABLE ASU.TMP_MSG CASCADE CONSTRAINTS
/

--
-- TMP_MSG  (Table) 
--
CREATE TABLE ASU.TMP_MSG
(
  FC_ERR   VARCHAR2(4000 BYTE),
  FD_DATE  DATE
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
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/

COMMENT ON TABLE ASU.TMP_MSG IS '��� ���������� ������ �� ����� �������� ���������� ����� ��� � ��� AUTHOR:A.Nakorjakov'
/

COMMENT ON COLUMN ASU.TMP_MSG.FC_ERR IS '���� ������'
/

COMMENT ON COLUMN ASU.TMP_MSG.FD_DATE IS '���� ��������� ������'
/


