DROP INDEX ASU.IDX_TEXSLUCH_ID_ILL
/

--
-- IDX_TEXSLUCH_ID_ILL  (Index) 
--
CREATE INDEX ASU.IDX_TEXSLUCH_ID_ILL ON ASU.TEXSLUCH
(ID_ILL)
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

