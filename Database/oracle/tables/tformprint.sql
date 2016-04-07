DROP TABLE ASU.TFORMPRINT CASCADE CONSTRAINTS
/

--
-- TFORMPRINT  (Table) 
--
CREATE TABLE ASU.TFORMPRINT
(
  FK_PACID   NUMBER                             NOT NULL,
  FK_SOTRID  NUMBER                             DEFAULT -1,
  FC_REPORT  VARCHAR2(255 BYTE),
  FD_INS     DATE
)
TABLESPACE USR
PCTUSED    0
PCTFREE    5
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

COMMENT ON TABLE ASU.TFORMPRINT IS 'Какие отчеты были распечатаны врачами'
/


--
-- FK_PACID  (Index) 
--
--  Dependencies: 
--   TFORMPRINT (Table)
--
CREATE INDEX ASU.FK_PACID ON ASU.TFORMPRINT
(FK_PACID)
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


