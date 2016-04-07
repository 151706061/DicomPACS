DROP TABLE ASU.TEXCHUPLOAD_OPER CASCADE CONSTRAINTS
/

--
-- TEXCHUPLOAD_OPER  (Table) 
--
CREATE GLOBAL TEMPORARY TABLE ASU.TEXCHUPLOAD_OPER
(
  PID        NUMBER                             NOT NULL,
  ID_ILL     NUMBER                             NOT NULL,
  ID_SERV    NUMBER                             NOT NULL,
  N_MAP      NUMBER                             NOT NULL,
  PLACE_OP   NUMBER                             NOT NULL,
  DATE_OPER  VARCHAR2(19 BYTE),
  MORPHEY    NUMBER,
  DOC_NAME   VARCHAR2(100 BYTE)                 NOT NULL,
  DOC_SPEC   NUMBER,
  TYPE_OPER  NUMBER,
  COMPL      VARCHAR2(50 BYTE),
  O_ANASTEZ  VARCHAR2(30 BYTE),
  O_OPERATS  VARCHAR2(30 BYTE)
)
ON COMMIT DELETE ROWS
NOCACHE
/

COMMENT ON TABLE ASU.TEXCHUPLOAD_OPER IS '�������� ��� �������� � �� ������������� Author: Linnikov'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_OPER.PID IS '������������� ��������'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_OPER.ID_ILL IS '������������� ������'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_OPER.ID_SERV IS '������������� ������'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_OPER.N_MAP IS '����� ����������� �����'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_OPER.PLACE_OP IS '��������� ��������'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_OPER.DATE_OPER IS '���� ��������, ������ ��.��.���� ��:��:��, �������� �� ��������� sysdate'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_OPER.MORPHEY IS '��� ������� (MORPHEY)'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_OPER.DOC_NAME IS '�������, ��� � �������� �����'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_OPER.DOC_SPEC IS '������������� �����'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_OPER.TYPE_OPER IS '��� �������� (1-��������, 2-����������)'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_OPER.COMPL IS '����������'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_OPER.O_ANASTEZ IS '���������� ��������� (���� ���������, �� �������� ����������� �������)'
/

COMMENT ON COLUMN ASU.TEXCHUPLOAD_OPER.O_OPERATS IS '���������� ������������ ������������ (���� ���������, �� �������� ����������� �������)'
/


