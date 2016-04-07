ALTER TABLE ASU.TMATRIX_SENSORS
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TMATRIX_SENSORS CASCADE CONSTRAINTS
/

--
-- TMATRIX_SENSORS  (Table) 
--
--  Dependencies: 
--   TMATRIX_TEMPLATES (Table)
--
CREATE TABLE ASU.TMATRIX_SENSORS
(
  FK_ID           NUMBER                        NOT NULL,
  FK_TEMPLATE_ID  NUMBER                        NOT NULL,
  FN_LEFT         NUMBER                        NOT NULL,
  FN_RIGHT        NUMBER                        NOT NULL,
  FN_TOP          NUMBER                        NOT NULL,
  FN_BOTTOM       NUMBER                        NOT NULL,
  FN_WORK_MODE    NUMBER                        DEFAULT 0
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

COMMENT ON TABLE ASU.TMATRIX_SENSORS IS '������������� ��� ��������� ����������� �������-�������. Author: rca'
/

COMMENT ON COLUMN ASU.TMATRIX_SENSORS.FK_ID IS '���������� �������������'
/

COMMENT ON COLUMN ASU.TMATRIX_SENSORS.FK_TEMPLATE_ID IS '���������� ������������� �������'
/

COMMENT ON COLUMN ASU.TMATRIX_SENSORS.FN_LEFT IS '����� ������� ������� � �������'
/

COMMENT ON COLUMN ASU.TMATRIX_SENSORS.FN_RIGHT IS '������ ������� ������� � �������'
/

COMMENT ON COLUMN ASU.TMATRIX_SENSORS.FN_TOP IS '������� ������� ������� � �������'
/

COMMENT ON COLUMN ASU.TMATRIX_SENSORS.FN_BOTTOM IS '������ ������� ������� � �������'
/

COMMENT ON COLUMN ASU.TMATRIX_SENSORS.FN_WORK_MODE IS '������� �����:  1- ��������, �.�. ��� ������� �������� ������� �������; 2 - ���������'
/


--
-- PK_TMATRIX_SENSORS  (Index) 
--
--  Dependencies: 
--   TMATRIX_SENSORS (Table)
--
CREATE UNIQUE INDEX ASU.PK_TMATRIX_SENSORS ON ASU.TMATRIX_SENSORS
(FK_ID)
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


--
-- TMATRIX_SENSORS$BI  (Trigger) 
--
--  Dependencies: 
--   TMATRIX_SENSORS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TMATRIX_SENSORS$BI" 
 BEFORE
  INSERT
 ON asu.tmatrix_sensors
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
BEGIN
  --  Column "FK_ID" uses sequence SEQ_TMATRIX_SENSORS
  SELECT SEQ_TMATRIX_SENSORS.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TMATRIX_SENSORS 
-- 
ALTER TABLE ASU.TMATRIX_SENSORS ADD (
  CONSTRAINT PK_TMATRIX_SENSORS
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
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
               ))
/

-- 
-- Foreign Key Constraints for Table TMATRIX_SENSORS 
-- 
ALTER TABLE ASU.TMATRIX_SENSORS ADD (
  CONSTRAINT FK_TMATRIX_TMPL$TMATRIX_TMPLS 
 FOREIGN KEY (FK_TEMPLATE_ID) 
 REFERENCES ASU.TMATRIX_TEMPLATES (FK_ID))
/

