DROP INDEX ASU.PK_REGISTACCESS
/

--
-- PK_REGISTACCESS  (Index) 
--
CREATE UNIQUE INDEX ASU.PK_REGISTACCESS ON ASU.TREGISTACCESS
(FK_SOTRID, FK_VRACHID, FK_KABNTID)
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


