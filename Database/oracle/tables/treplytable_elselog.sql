DROP TABLE ASU.TREPLYTABLE_ELSELOG CASCADE CONSTRAINTS
/

--
-- TREPLYTABLE_ELSELOG  (Table) 
--
CREATE TABLE ASU.TREPLYTABLE_ELSELOG
(
  FK_ID          NUMBER(15)                     NOT NULL,
  FC_ASK         VARCHAR2(50 BYTE)              NOT NULL,
  FC_ASKFIELD    VARCHAR2(50 BYTE)              NOT NULL,
  FC_ASKID       VARCHAR2(50 BYTE),
  FC_REPLY       VARCHAR2(50 BYTE)              NOT NULL,
  FC_REPLYFIELD  VARCHAR2(50 BYTE)              NOT NULL,
  FC_OWNER       VARCHAR2(50 BYTE),
  FC_OWNERFIELD  VARCHAR2(50 BYTE),
  FC_OWNERID     VARCHAR2(50 BYTE),
  FC_OWNERFILL   VARCHAR2(50 BYTE)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          16K
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

COMMENT ON TABLE ASU.TREPLYTABLE_ELSELOG IS '������� ��� ��������� ������������ �� ���� Author:Efimov'
/

COMMENT ON COLUMN ASU.TREPLYTABLE_ELSELOG.FK_ID IS 'asu.seq_CostConf'
/

COMMENT ON COLUMN ASU.TREPLYTABLE_ELSELOG.FC_ASK IS '�������-������ (������� ������� ������������� ������ ��� �����, �� ���� ����� ����� ���� �� ��������� ��������)'
/

COMMENT ON COLUMN ASU.TREPLYTABLE_ELSELOG.FC_ASKFIELD IS '�������� ���� ������������� � �������-�������'
/

COMMENT ON COLUMN ASU.TREPLYTABLE_ELSELOG.FC_ASKID IS '�������� ���� ������������� � �������-�������'
/

COMMENT ON COLUMN ASU.TREPLYTABLE_ELSELOG.FC_REPLY IS '�������-�����'
/

COMMENT ON COLUMN ASU.TREPLYTABLE_ELSELOG.FC_REPLYFIELD IS '�������� ���� ������������� � �������-������'
/

COMMENT ON COLUMN ASU.TREPLYTABLE_ELSELOG.FC_OWNER IS '�������-��������, �.�. �������, ���� ���������� ������� ���������� ����� ������, �������������� �������� ������� �������� ������� � ���, ��� ����� ������� ������������ ������ ����� ��� ������� ������ ��������, ��� �������-�������� ���� ������'
/

COMMENT ON COLUMN ASU.TREPLYTABLE_ELSELOG.FC_OWNERFIELD IS '�������� ���� � �������-���������, �� �������� ����� ����� ����������� ������'
/

COMMENT ON COLUMN ASU.TREPLYTABLE_ELSELOG.FC_OWNERID IS '�������� ���� � �������-���������, �� �������� ����� ����� ����������� ������'
/

COMMENT ON COLUMN ASU.TREPLYTABLE_ELSELOG.FC_OWNERFILL IS '�������� ������������ ���� � �������-���������'
/


--
-- I_TREPLYTABLE_ELSELOG_R_BY_A_O  (Index) 
--
--  Dependencies: 
--   TREPLYTABLE_ELSELOG (Table)
--
CREATE INDEX ASU.I_TREPLYTABLE_ELSELOG_R_BY_A_O ON ASU.TREPLYTABLE_ELSELOG
(FC_REPLY, FC_REPLYFIELD, FC_ASK, FC_ASKFIELD, FC_ASKID, 
FC_OWNER, FC_OWNERFIELD)
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- I_TREPLYTABLE_ELSELOG_TABLES  (Index) 
--
--  Dependencies: 
--   TREPLYTABLE_ELSELOG (Table)
--
CREATE INDEX ASU.I_TREPLYTABLE_ELSELOG_TABLES ON ASU.TREPLYTABLE_ELSELOG
(FC_ASK, FC_REPLY)
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- K_TREPLYTABLE_ELSELOG_ID  (Index) 
--
--  Dependencies: 
--   TREPLYTABLE_ELSELOG (Table)
--
CREATE INDEX ASU.K_TREPLYTABLE_ELSELOG_ID ON ASU.TREPLYTABLE_ELSELOG
(FK_ID)
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TREPLYTABLE_ELSELOG_INSERT  (Trigger) 
--
--  Dependencies: 
--   TREPLYTABLE_ELSELOG (Table)
--
CREATE OR REPLACE TRIGGER ASU."TREPLYTABLE_ELSELOG_INSERT" 
 BEFORE
  INSERT
 ON ASU.TREPLYTABLE_ELSELOG REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  SELECT asu.SEQ_TREPLYTABLE_ELSELOG.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


