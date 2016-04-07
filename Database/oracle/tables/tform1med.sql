ALTER TABLE ASU.TFORM1MED
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TFORM1MED CASCADE CONSTRAINTS
/

--
-- TFORM1MED  (Table) 
--
CREATE TABLE ASU.TFORM1MED
(
  FK_ID         NUMBER(15)                      NOT NULL,
  YEAR          NUMBER(4),
  MONTH         NUMBER(2),
  ADVANCE       NUMBER(10,2),
  FROM_IC_NEXT  NUMBER(10,2),
  FROM_IC_PREV  NUMBER(10,2),
  FROM_FOMS     NUMBER(10,2),
  SUM_IC        NUMBER(10,2),
  SUM_IC_REF    NUMBER(10,2),
  SUM_FOMS      NUMBER(10,2),
  SUM_FOMS_REF  NUMBER(10,2)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          16K
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

COMMENT ON TABLE ASU.TFORM1MED IS '������ ��� ������������ ����� 1, �������� ������� http://192.168.1.9/redmine/issues/17872 Author:Efimov'''
/

COMMENT ON COLUMN ASU.TFORM1MED.FK_ID IS 'asu.SEQ_TFORM1MED'
/

COMMENT ON COLUMN ASU.TFORM1MED.YEAR IS '���'
/

COMMENT ON COLUMN ASU.TFORM1MED.MONTH IS '�����'
/

COMMENT ON COLUMN ASU.TFORM1MED.ADVANCE IS '��������� ��������� �������� � ���������� ������ �� ������ ����������� ������ � �������� ������'
/

COMMENT ON COLUMN ASU.TFORM1MED.FROM_IC_NEXT IS '��������� ������ �� ������ ����������� �������� �� �������� ����������� ������ � ������, ��������� �� ��������'
/

COMMENT ON COLUMN ASU.TFORM1MED.FROM_IC_PREV IS '�� ������ ����������� ������, ��������� � ���������� ������'
/

COMMENT ON COLUMN ASU.TFORM1MED.FROM_FOMS IS '��������� ������� �� ������ ����������� ������ � �������� ������ �� ���������������� �����'
/

COMMENT ON COLUMN ASU.TFORM1MED.SUM_IC IS '����� ������� �� ������, ��������������� ��������� ����������� ����������� � ������ � �������� ������'
/

COMMENT ON COLUMN ASU.TFORM1MED.SUM_IC_REF IS '� ��� ����� ����� �������, �� �������� (����������) �� ����������� �������� �������, ������, �������� � ������� �������������� ����������� ������'
/

COMMENT ON COLUMN ASU.TFORM1MED.SUM_FOMS IS '����� ������� �� ������, ��������������� ���������������� ����� � ������ � �������� ������'
/

COMMENT ON COLUMN ASU.TFORM1MED.SUM_FOMS_REF IS '����� ������� �� ������, ��������������� ���������������� ����� � ������ � �������� ������'
/


--
-- I_TFORM1MED_YM  (Index) 
--
--  Dependencies: 
--   TFORM1MED (Table)
--
CREATE UNIQUE INDEX ASU.I_TFORM1MED_YM ON ASU.TFORM1MED
(YEAR, MONTH)
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


--
-- K_TFORM1MED_ID  (Index) 
--
--  Dependencies: 
--   TFORM1MED (Table)
--
CREATE UNIQUE INDEX ASU.K_TFORM1MED_ID ON ASU.TFORM1MED
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


--
-- TFORM1MED_INSERT  (Trigger) 
--
--  Dependencies: 
--   TFORM1MED (Table)
--
CREATE OR REPLACE TRIGGER ASU."TFORM1MED_INSERT" 
 BEFORE
  INSERT
 ON ASU.TFORM1MED REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  IF :NEW.FK_ID IS NULL THEN
    SELECT asu.SEQ_TFORM1MED.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  END IF;
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TFORM1MED 
-- 
ALTER TABLE ASU.TFORM1MED ADD (
  CONSTRAINT K_TFORM1MED_ID
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
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
               ))
/

