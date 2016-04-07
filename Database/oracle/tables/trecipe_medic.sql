ALTER TABLE ASU.TRECIPE_MEDIC
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TRECIPE_MEDIC CASCADE CONSTRAINTS
/

--
-- TRECIPE_MEDIC  (Table) 
--
CREATE TABLE ASU.TRECIPE_MEDIC
(
  FK_ID             NUMBER,
  FK_LAT_NAME_ID    NUMBER,
  FK_RUS_NAME_ID    NUMBER,
  FK_NAZMEDLECH_ID  NUMBER,
  FN_KOL            NUMBER,
  FK_EI_ID          NUMBER,
  FK_VVODPATH_ID    NUMBER,
  FN_DURATION       NUMBER,
  FK_FREQUENCY_ID   NUMBER,
  FK_RECIPE_ID      NUMBER,
  FN_DOZA           NUMBER,
  FK_DOZA_EI_ID     NUMBER,
  FC_DTD            VARCHAR2(10 BYTE),
  FC_DOZA           VARCHAR2(50 BYTE),
  FC_FREQUENCY      VARCHAR2(100 BYTE)
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

COMMENT ON TABLE ASU.TRECIPE_MEDIC IS '����������� � ��������. Author: Voronov'
/

COMMENT ON COLUMN ASU.TRECIPE_MEDIC.FK_LAT_NAME_ID IS '���. ��������, ��� ���. �������� - ���. ��� (asu.TRECIPE_DLO_EXP_MNN.C_MNN), ��� ��������� - rls.tlatinnames.fk_id'
/

COMMENT ON COLUMN ASU.TRECIPE_MEDIC.FK_RUS_NAME_ID IS '������� �������� ��������, ��� ���. �������� - ������� �������� (asu.TRECIPE_DLO_EXP_MEDICS.NOMK_LS), ��� ��������� - rls.TTRADENAMES.fk_id'
/

COMMENT ON COLUMN ASU.TRECIPE_MEDIC.FK_NAZMEDLECH_ID IS '����������'
/

COMMENT ON COLUMN ASU.TRECIPE_MEDIC.FN_KOL IS '���-��'
/

COMMENT ON COLUMN ASU.TRECIPE_MEDIC.FK_EI_ID IS '������� ��������� (med.TMASSUNITS.fk_id)'
/

COMMENT ON COLUMN ASU.TRECIPE_MEDIC.FK_VVODPATH_ID IS '���� �������� (asu.TVVODPATH.fk_id)'
/

COMMENT ON COLUMN ASU.TRECIPE_MEDIC.FN_DURATION IS '������������ ����������, ����'
/

COMMENT ON COLUMN ASU.TRECIPE_MEDIC.FK_FREQUENCY_ID IS '������� ��� � ���� (asu.TFREQUENCY.fk_id)'
/

COMMENT ON COLUMN ASU.TRECIPE_MEDIC.FK_RECIPE_ID IS '�������� � ������� (ASU.TRECIPE.fk_id)'
/

COMMENT ON COLUMN ASU.TRECIPE_MEDIC.FN_DOZA IS '����'
/

COMMENT ON COLUMN ASU.TRECIPE_MEDIC.FK_DOZA_EI_ID IS '������� ��������� ���� (med.TMASSUNITS.fk_id)'
/

COMMENT ON COLUMN ASU.TRECIPE_MEDIC.FC_DTD IS '���� D.t.d. � �������� ������������ �������'
/

COMMENT ON COLUMN ASU.TRECIPE_MEDIC.FC_DOZA IS '���� (����� � ��������� ���� ��-�� ���������� � �������� �������������, �������� 2,5+400 ��)'
/

COMMENT ON COLUMN ASU.TRECIPE_MEDIC.FC_FREQUENCY IS '��������� ������ � ���� ������'
/


--
-- TRECIPE_M_I_FK_FREQUENCY  (Index) 
--
--  Dependencies: 
--   TRECIPE_MEDIC (Table)
--
CREATE INDEX ASU.TRECIPE_M_I_FK_FREQUENCY ON ASU.TRECIPE_MEDIC
(FK_FREQUENCY_ID)
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
-- TRECIPE_M_I_FK_LAT_NAME  (Index) 
--
--  Dependencies: 
--   TRECIPE_MEDIC (Table)
--
CREATE INDEX ASU.TRECIPE_M_I_FK_LAT_NAME ON ASU.TRECIPE_MEDIC
(FK_LAT_NAME_ID)
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
-- TRECIPE_M_I_FK_NAZMEDLECH  (Index) 
--
--  Dependencies: 
--   TRECIPE_MEDIC (Table)
--
CREATE INDEX ASU.TRECIPE_M_I_FK_NAZMEDLECH ON ASU.TRECIPE_MEDIC
(FK_NAZMEDLECH_ID)
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
-- TRECIPE_M_I_FK_RECIPE  (Index) 
--
--  Dependencies: 
--   TRECIPE_MEDIC (Table)
--
CREATE INDEX ASU.TRECIPE_M_I_FK_RECIPE ON ASU.TRECIPE_MEDIC
(FK_RECIPE_ID)
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
-- TRECIPE_M_I_FK_RUS_NAME  (Index) 
--
--  Dependencies: 
--   TRECIPE_MEDIC (Table)
--
CREATE INDEX ASU.TRECIPE_M_I_FK_RUS_NAME ON ASU.TRECIPE_MEDIC
(FK_RUS_NAME_ID)
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
-- TRECIPE_M_I_FK_VVODPATH  (Index) 
--
--  Dependencies: 
--   TRECIPE_MEDIC (Table)
--
CREATE INDEX ASU.TRECIPE_M_I_FK_VVODPATH ON ASU.TRECIPE_MEDIC
(FK_VVODPATH_ID)
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
-- TRECIPE_M_PK  (Index) 
--
--  Dependencies: 
--   TRECIPE_MEDIC (Table)
--
CREATE UNIQUE INDEX ASU.TRECIPE_M_PK ON ASU.TRECIPE_MEDIC
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
-- TRECIPE_MEDIC_INS  (Trigger) 
--
--  Dependencies: 
--   TRECIPE_MEDIC (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECIPE_MEDIC_INS" 
 BEFORE
  INSERT
 ON ASU.trecipe_medic
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  if :new.fk_id is null then
    select asu.seq_recipe_medic.nextval into :new.fk_id from dual;
  end if;
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TRECIPE_MEDIC 
-- 
ALTER TABLE ASU.TRECIPE_MEDIC ADD (
  CONSTRAINT TRECIPE_M_PK
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

GRANT DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE ON ASU.TRECIPE_MEDIC TO MED
/

