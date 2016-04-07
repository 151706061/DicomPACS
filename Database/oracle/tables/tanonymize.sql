DROP TABLE ASU.TANONYMIZE CASCADE CONSTRAINTS
/

--
-- TANONYMIZE  (Table) 
--
CREATE TABLE ASU.TANONYMIZE
(
  FK_PEOPLE  NUMBER,
  FC_HASH    RAW(100)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
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

COMMENT ON TABLE ASU.TANONYMIZE IS 'Связка обезличенных личностей и персональных дынных Author: Spasskiy S.N.'
/


