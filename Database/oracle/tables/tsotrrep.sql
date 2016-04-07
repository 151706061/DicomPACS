DROP TABLE ASU.TSOTRREP CASCADE CONSTRAINTS
/

--
-- TSOTRREP  (Table) 
--
CREATE TABLE ASU.TSOTRREP
(
  FK_SOTRID  NUMBER                             NOT NULL,
  FK_REPID   NUMBER                             NOT NULL
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          200K
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

COMMENT ON TABLE ASU.TSOTRREP IS 'редактируетс€ из админа. нигде не используетс€. /TimurLan'
/


