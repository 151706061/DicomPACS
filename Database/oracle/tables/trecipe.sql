ALTER TABLE ASU.TRECIPE
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TRECIPE CASCADE CONSTRAINTS
/

--
-- TRECIPE  (Table) 
--
--  Dependencies: 
--   TRECIPEDURATION (Table)
--   TRECIPEPERCENT (Table)
--   TRECIPETYPE (Table)
--
CREATE TABLE ASU.TRECIPE
(
  FK_ID               NUMBER(10)                NOT NULL,
  FK_TYPE             NUMBER(10),
  FD_DATE             DATE                      DEFAULT Sysdate,
  FK_DURATION         NUMBER(10),
  FK_PAYTYPE          NUMBER(10),
  FK_PERCENT          NUMBER(10),
  FL_EDIT             NUMBER(1)                 DEFAULT 0,
  FN_NUM              NUMBER(10),
  FC_SERIAL           VARCHAR2(255 BYTE),
  FL_LGOT             NUMBER(1),
  FK_SOTRID           INTEGER,
  FK_PAC_LGOT_CAT     NUMBER,
  FK_PAC_ID           NUMBER,
  FD_START            DATE,
  FK_VRACH_ID         NUMBER,
  FK_LGOT_DOC_ID      NUMBER,
  FN_PRINT_COUNT      NUMBER                    DEFAULT 0,
  FN_STATUS           NUMBER,
  FC_COMMENT          VARCHAR2(100 BYTE),
  FK_DIAG             NUMBER,
  FC_DTD              VARCHAR2(50 BYTE),
  FC_SNILS            VARCHAR2(20 BYTE),
  FL_USE_DIAG_PARENT  NUMBER(1)                 DEFAULT 0,
  FL_DEL              NUMBER(1)                 DEFAULT 0,
  FK_OSMOTR_ID        NUMBER
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          160K
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

COMMENT ON TABLE ASU.TRECIPE IS 'Sill - ������� ������'
/

COMMENT ON COLUMN ASU.TRECIPE.FK_ID IS 'SEQUENCE=[SEQ_TRECIPE]'
/

COMMENT ON COLUMN ASU.TRECIPE.FK_TYPE IS '��� ���� ������� (��. �. TRecipeType)'
/

COMMENT ON COLUMN ASU.TRECIPE.FD_DATE IS '���� �����������'
/

COMMENT ON COLUMN ASU.TRECIPE.FK_DURATION IS '��� ����� �������� (��. �. TRecipeDuration)'
/

COMMENT ON COLUMN ASU.TRECIPE.FK_PAYTYPE IS '��� �������� �������������� (��. �. TRecipePaytype)'
/

COMMENT ON COLUMN ASU.TRECIPE.FK_PERCENT IS '��� �������� ������ (��. �. TRecipePercent)'
/

COMMENT ON COLUMN ASU.TRECIPE.FL_EDIT IS '������� "�������������"'
/

COMMENT ON COLUMN ASU.TRECIPE.FN_NUM IS '����� �������'
/

COMMENT ON COLUMN ASU.TRECIPE.FC_SERIAL IS '����� �������'
/

COMMENT ON COLUMN ASU.TRECIPE.FL_LGOT IS '0 - ����� (107�); 3 - ����� (148-1/�-06(�) (��������-�����������); 2 - 148-1/�-88 (��������-������������)  (����������� � ASU.PKG_DLO.GET_LGOT_TYPE_NAME)'
/

COMMENT ON COLUMN ASU.TRECIPE.FK_SOTRID IS '��� ���������� ���������� ������'
/

COMMENT ON COLUMN ASU.TRECIPE.FK_PAC_LGOT_CAT IS '��������� ���������� ASU.TSMID.FK_ID (OWNER FC_SYNONIM = ''LD_KATEGOR_LGOT'')'
/

COMMENT ON COLUMN ASU.TRECIPE.FK_PAC_ID IS 'ID �������� ASU.TAMBULANCE.FK_ID'
/

COMMENT ON COLUMN ASU.TRECIPE.FD_START IS '���� �������� �������'
/

COMMENT ON COLUMN ASU.TRECIPE.FK_VRACH_ID IS '����, �� ����� ����� �������� ������ (LOGIN.TSOTR.FK_ID)'
/

COMMENT ON COLUMN ASU.TRECIPE.FK_LGOT_DOC_ID IS '������ �� �������� �������� ASU.TPeople_lgot'
/

COMMENT ON COLUMN ASU.TRECIPE.FN_PRINT_COUNT IS '���-�� ����������'
/

COMMENT ON COLUMN ASU.TRECIPE.FN_STATUS IS '������ ������� (����������� � ASU.PKG_DLO.GET_STATUS_NAME)'
/

COMMENT ON COLUMN ASU.TRECIPE.FC_COMMENT IS '����������� � �������'
/

COMMENT ON COLUMN ASU.TRECIPE.FK_DIAG IS '�������, �� �������� �������� ������ (asu.TDIAG.fk_id)'
/

COMMENT ON COLUMN ASU.TRECIPE.FC_DTD IS '���� D.t.d. � �������� ������������ �������'
/

COMMENT ON COLUMN ASU.TRECIPE.FC_SNILS IS '����� ��������'
/

COMMENT ON COLUMN ASU.TRECIPE.FL_USE_DIAG_PARENT IS '������������ ����� ������� (�� ������� ����)'
/

COMMENT ON COLUMN ASU.TRECIPE.FL_DEL IS '������� ��������: 1- ������, 0 - ���'
/


--
-- TRECIPE_BY_ID  (Index) 
--
--  Dependencies: 
--   TRECIPE (Table)
--
CREATE UNIQUE INDEX ASU.TRECIPE_BY_ID ON ASU.TRECIPE
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          128K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TRECIPE_FD_DATE  (Index) 
--
--  Dependencies: 
--   TRECIPE (Table)
--
CREATE INDEX ASU.TRECIPE_FD_DATE ON ASU.TRECIPE
(FD_DATE)
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
-- TRECIPE_FK_DIAG  (Index) 
--
--  Dependencies: 
--   TRECIPE (Table)
--
CREATE INDEX ASU.TRECIPE_FK_DIAG ON ASU.TRECIPE
(FK_DIAG)
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
-- TRECIPE_FK_PACID  (Index) 
--
--  Dependencies: 
--   TRECIPE (Table)
--
CREATE INDEX ASU.TRECIPE_FK_PACID ON ASU.TRECIPE
(FK_PAC_ID)
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
-- TRECIPE_FK_VRACH  (Index) 
--
--  Dependencies: 
--   TRECIPE (Table)
--
CREATE INDEX ASU.TRECIPE_FK_VRACH ON ASU.TRECIPE
(FK_VRACH_ID)
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
-- TRECIPE_SERIAL_NUM_UNIQ  (Index) 
--
--  Dependencies: 
--   TRECIPE (Table)
--
CREATE UNIQUE INDEX ASU.TRECIPE_SERIAL_NUM_UNIQ ON ASU.TRECIPE
(FN_NUM, FC_SERIAL)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          128K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TRECIPE_SERIAL_NUM_UNIQ1  (Index) 
--
--  Dependencies: 
--   TRECIPE (Table)
--
CREATE UNIQUE INDEX ASU.TRECIPE_SERIAL_NUM_UNIQ1 ON ASU.TRECIPE
(FN_NUM, FC_SERIAL, FL_DEL)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          128K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TRECIPE_UPD  (Trigger) 
--
--  Dependencies: 
--   TRECIPE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECIPE_UPD" 
 BEFORE
  UPDATE
 ON asu.trecipe
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  :NEW.FD_DATE := trunc(:NEW.FD_DATE);
end;
/
SHOW ERRORS;


--
-- TRECIPE_DEL  (Trigger) 
--
--  Dependencies: 
--   TRECIPE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECIPE_DEL" 
 BEFORE 
 DELETE
 ON ASU.TRECIPE  FOR EACH ROW
begin
  delete from ASU.TRECIPE_MEDIC rm where rm.FK_RECIPE_ID = :old.fk_id;
  delete from ASU.TRECIPE_CHANGE_HISTORY rch where rch.FK_RECIPE_ID = :old.fk_id;  
end;
/
SHOW ERRORS;


--
-- TRECIPE_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TRECIPE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECIPE_BEFORE_INSERT" 
 BEFORE 
 INSERT
 ON ASU.TRECIPE  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
WHEN (
new.fk_id is null
      )
begin
  if :new.fk_id is null then
    select seq_trecipe.nextval into :new.fk_id from dual;
  end if;
  
  if :new.fd_start is null then
    :new.fd_start := sysdate;
  end if;
  
  if :new.fd_date is null then
    :new.fd_date := trunc(sysdate);
  end if;
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TRECIPE 
-- 
ALTER TABLE ASU.TRECIPE ADD (
  CONSTRAINT TRECIPE_BY_ID
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          128K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ),
  CONSTRAINT TRECIPE_SERIAL_NUM_UNIQ1
 UNIQUE (FN_NUM, FC_SERIAL, FL_DEL)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          128K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

-- 
-- Foreign Key Constraints for Table TRECIPE 
-- 
ALTER TABLE ASU.TRECIPE ADD (
  CONSTRAINT TRECIPE_TRECIPEDURATION 
 FOREIGN KEY (FK_DURATION) 
 REFERENCES ASU.TRECIPEDURATION (FK_ID),
  CONSTRAINT TRECIPE_TRECIPEPERCENT 
 FOREIGN KEY (FK_PERCENT) 
 REFERENCES ASU.TRECIPEPERCENT (FK_ID),
  CONSTRAINT TRECIPE_TRECIPETYPE 
 FOREIGN KEY (FK_TYPE) 
 REFERENCES ASU.TRECIPETYPE (FK_ID))
/

