DROP TABLE ASU.TLIN_DRENAJ CASCADE CONSTRAINTS
/

--
-- TLIN_DRENAJ  (Table) 
--
CREATE TABLE ASU.TLIN_DRENAJ
(
  FK_ID     NUMBER                              NOT NULL,
  FK_PACID  NUMBER,
  FC_NAME   VARCHAR2(50 BYTE),
  FD_DATE   DATE
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
NOLOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING
/


--
-- TLIN_DRENAJ_BI  (Trigger) 
--
--  Dependencies: 
--   TLIN_DRENAJ (Table)
--
CREATE OR REPLACE TRIGGER ASU.tlin_drenaj_bi
  before insert ON ASU.TLIN_DRENAJ   REFERENCING NEW AS NEW OLD AS OLD
  for each ROW
BEGIN
 SELECT asu.seq_tlin_drenaj.nextval INTO :new.Fk_Id FROM dual;
END;
/
SHOW ERRORS;


