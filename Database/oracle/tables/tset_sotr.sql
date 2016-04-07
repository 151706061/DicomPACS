DROP TABLE ASU.TSET_SOTR CASCADE CONSTRAINTS
/

--
-- TSET_SOTR  (Table) 
--
CREATE TABLE ASU.TSET_SOTR
(
  FK_SETID   NUMBER,
  FK_SOTRID  NUMBER,
  FK_SMID    NUMBER
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
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

COMMENT ON TABLE ASU.TSET_SOTR IS 'Таблица связка между сотрудниками (asu.tsotr) и отчетами (login.t_n_settings) Created By Prihodko N. 07.10.2011'
/

COMMENT ON COLUMN ASU.TSET_SOTR.FK_SETID IS 'login.t_n_settings.fk_id'
/

COMMENT ON COLUMN ASU.TSET_SOTR.FK_SOTRID IS 'asu.tsotr(login.tsotr).fk_id'
/

COMMENT ON COLUMN ASU.TSET_SOTR.FK_SMID IS 'tsmid.fk_id'
/


--
-- TSET_SOTR_SETID  (Index) 
--
--  Dependencies: 
--   TSET_SOTR (Table)
--
CREATE INDEX ASU.TSET_SOTR_SETID ON ASU.TSET_SOTR
(FK_SETID)
NOLOGGING
TABLESPACE INDX
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
-- TSET_SOTR_SMID  (Index) 
--
--  Dependencies: 
--   TSET_SOTR (Table)
--
CREATE INDEX ASU.TSET_SOTR_SMID ON ASU.TSET_SOTR
(FK_SMID)
NOLOGGING
TABLESPACE INDX
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
-- TSET_SOTR_SOTRID  (Index) 
--
--  Dependencies: 
--   TSET_SOTR (Table)
--
CREATE INDEX ASU.TSET_SOTR_SOTRID ON ASU.TSET_SOTR
(FK_SOTRID)
NOLOGGING
TABLESPACE INDX
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


