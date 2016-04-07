DROP TABLE ASU.TUSLPACPLAT CASCADE CONSTRAINTS
/

--
-- TUSLPACPLAT  (Table) 
--
CREATE TABLE ASU.TUSLPACPLAT
(
  FK_ID     INTEGER                             DEFAULT -1                    NOT NULL,
  FK_PACID  INTEGER,
  FK_USLID  INTEGER,
  FN_PRC    INTEGER
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          520K
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

COMMENT ON TABLE ASU.TUSLPACPLAT IS '������ ������� ����� ��� ��������'
/

COMMENT ON COLUMN ASU.TUSLPACPLAT.FK_ID IS 'SEQUENCE=[SEQ_TUSLPACPLAT]'
/

COMMENT ON COLUMN ASU.TUSLPACPLAT.FK_PACID IS '��� �������� �� TKARTA'
/

COMMENT ON COLUMN ASU.TUSLPACPLAT.FK_USLID IS '��� ������ �� TSMID'
/

COMMENT ON COLUMN ASU.TUSLPACPLAT.FN_PRC IS '���������� ��������� ������ �� ��������� ������'
/


--
-- TUSLPACPLAT_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TUSLPACPLAT (Table)
--
CREATE OR REPLACE TRIGGER ASU."TUSLPACPLAT_BEFORE_INSERT" 
 BEFORE
  INSERT
 ON tuslpacplat
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  SELECT SEQ_tuslPacPlat.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


DROP SYNONYM BUH.TUSLPACPLAT
/

--
-- TUSLPACPLAT  (Synonym) 
--
--  Dependencies: 
--   TUSLPACPLAT (Table)
--
CREATE SYNONYM BUH.TUSLPACPLAT FOR ASU.TUSLPACPLAT
/

