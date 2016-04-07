DROP TABLE ASU.TRESMEDSALDO CASCADE CONSTRAINTS
/

--
-- TRESMEDSALDO  (Table) 
--
CREATE TABLE ASU.TRESMEDSALDO
(
  FK_MEDKARTID     NUMBER(9)                    NOT NULL,
  FD_DATE          DATE                         NOT NULL,
  FK_POSTAVSHIKID  NUMBER(9)                    NOT NULL,
  FN_KOL           NUMBER(9,3)                  NOT NULL
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          160K
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


