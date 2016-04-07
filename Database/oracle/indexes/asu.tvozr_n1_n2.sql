DROP INDEX ASU.TVOZR_N1_N2
/

--
-- TVOZR_N1_N2  (Index) 
--
CREATE INDEX ASU.TVOZR_N1_N2 ON ASU.TVOZR
(FN_1, FN_2)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          256K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/

