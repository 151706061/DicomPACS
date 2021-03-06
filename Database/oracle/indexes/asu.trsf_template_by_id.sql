DROP INDEX ASU.TRSF_TEMPLATE_BY_ID
/

--
-- TRSF_TEMPLATE_BY_ID  (Index) 
--
CREATE UNIQUE INDEX ASU.TRSF_TEMPLATE_BY_ID ON ASU.TRSF_TEMPLATE
(FK_ID)
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


