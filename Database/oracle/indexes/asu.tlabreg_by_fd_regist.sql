DROP INDEX ASU.TLABREG_BY_FD_REGIST
/

--
-- TLABREG_BY_FD_REGIST  (Index) 
--
CREATE INDEX ASU.TLABREG_BY_FD_REGIST ON ASU.TLABREG
(FD_REGIST)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          1536K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/

