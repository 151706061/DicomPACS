DROP TABLE ASU.TLABLOT_ACCUM CASCADE CONSTRAINTS
/

--
-- TLABLOT_ACCUM  (Table) 
--
CREATE TABLE ASU.TLABLOT_ACCUM
(
  FK_ID        NUMBER,
  FK_LOTACCUM  NUMBER,
  FK_SOS       NUMBER,
  FD_BEGIN     DATE,
  FD_END       DATE,
  FK_SOTRID    NUMBER,
  FK_SMID      NUMBER,
  FN_KONTR     NUMBER
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

COMMENT ON COLUMN ASU.TLABLOT_ACCUM.FK_ID IS 'ID'
/

COMMENT ON COLUMN ASU.TLABLOT_ACCUM.FK_LOTACCUM IS 'TLAB_LOT_PARAM.FK_ID'
/

COMMENT ON COLUMN ASU.TLABLOT_ACCUM.FK_SOS IS '0- �����������; 1- ��������'
/

COMMENT ON COLUMN ASU.TLABLOT_ACCUM.FD_BEGIN IS '���� ������ �������'
/

COMMENT ON COLUMN ASU.TLABLOT_ACCUM.FD_END IS '���� �������� �������'
/

COMMENT ON COLUMN ASU.TLABLOT_ACCUM.FK_SOTRID IS '��������� ���������'
/

COMMENT ON COLUMN ASU.TLABLOT_ACCUM.FK_SMID IS 'TSMID.FK_ID'
/

COMMENT ON COLUMN ASU.TLABLOT_ACCUM.FN_KONTR IS '���������� ���������'
/


--
-- TLABLOT_ACCUM_BEFOR_INSERT  (Trigger) 
--
--  Dependencies: 
--   TLABLOT_ACCUM (Table)
--
CREATE OR REPLACE TRIGGER ASU."TLABLOT_ACCUM_BEFOR_INSERT" 
 BEFORE
 INSERT
 ON ASU.TLABLOT_ACCUM  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
    SELECT SEQ_LAB_ACCUMULATE.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
END;
/
SHOW ERRORS;

