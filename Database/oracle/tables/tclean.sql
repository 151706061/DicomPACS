DROP TABLE ASU.TCLEAN CASCADE CONSTRAINTS
/

--
-- TCLEAN  (Table) 
--
CREATE TABLE ASU.TCLEAN
(
  FK_ID        NUMBER(15)                       NOT NULL,
  FK_PALATAID  NUMBER(15)                       DEFAULT -1                    NOT NULL,
  FD_DATA1     DATE,
  FD_DATE2     DATE,
  FL_DONE      NUMBER(1)                        DEFAULT -1                    NOT NULL,
  FK_SOTRID    NUMBER(15)                       DEFAULT 0                     NOT NULL,
  FK_JOBID     NUMBER(15)
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

COMMENT ON TABLE ASU.TCLEAN IS 'Список заданий на уборку by TimurLan'
/

COMMENT ON COLUMN ASU.TCLEAN.FK_ID IS 'SEQUENCE=[SEQ_TCLEAN]'
/

COMMENT ON COLUMN ASU.TCLEAN.FK_PALATAID IS 'TROOM.FK_ID'
/

COMMENT ON COLUMN ASU.TCLEAN.FD_DATA1 IS 'начало уборки'
/

COMMENT ON COLUMN ASU.TCLEAN.FD_DATE2 IS 'окончание уборки'
/

COMMENT ON COLUMN ASU.TCLEAN.FL_DONE IS '(-1 - plan; 0 - in process; 1 - done)'
/

COMMENT ON COLUMN ASU.TCLEAN.FK_SOTRID IS 'TSOTR.FK_ID'
/

COMMENT ON COLUMN ASU.TCLEAN.FK_JOBID IS 'ИД объекта JOB'
/


--
-- TCLN_BY_DONE  (Index) 
--
--  Dependencies: 
--   TCLEAN (Table)
--
CREATE INDEX ASU.TCLN_BY_DONE ON ASU.TCLEAN
(FL_DONE)
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
-- TCLN_BY_PALATA  (Index) 
--
--  Dependencies: 
--   TCLEAN (Table)
--
CREATE INDEX ASU.TCLN_BY_PALATA ON ASU.TCLEAN
(FK_PALATAID)
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
-- TCLN_BY_SOTR  (Index) 
--
--  Dependencies: 
--   TCLEAN (Table)
--
CREATE INDEX ASU.TCLN_BY_SOTR ON ASU.TCLEAN
(FK_SOTRID)
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
-- TCLN_BY_SOTR_DONE  (Index) 
--
--  Dependencies: 
--   TCLEAN (Table)
--
CREATE INDEX ASU.TCLN_BY_SOTR_DONE ON ASU.TCLEAN
(FK_SOTRID, FL_DONE)
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
-- TCLN_BY_SOTR_PALATA  (Index) 
--
--  Dependencies: 
--   TCLEAN (Table)
--
CREATE INDEX ASU.TCLN_BY_SOTR_PALATA ON ASU.TCLEAN
(FK_SOTRID, FK_PALATAID)
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
-- TCLEAN_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TCLEAN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TCLEAN_BEFORE_INSERT" 
BEFORE INSERT
ON ASU.TCLEAN REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
Begin
  SELECT SEQ_TCLEAN.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


