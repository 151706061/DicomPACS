DROP TABLE ASU.V#MEDIC CASCADE CONSTRAINTS
/

--
-- V#MEDIC  (Table) 
--
CREATE TABLE ASU.V#MEDIC
(
  MEDICID   NUMBER(9)                           NOT NULL,
  FC_NAME   VARCHAR2(255 BYTE)                  NOT NULL,
  EIID      NUMBER(9)                           NOT NULL,
  FC_EIID   VARCHAR2(10 BYTE)                   NOT NULL,
  FARMGRID  NUMBER(9)                           NOT NULL,
  FARMGR    VARCHAR2(255 BYTE),
  UCHGRID   NUMBER(9)                           NOT NULL,
  UCHGR     VARCHAR2(255 BYTE)
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

COMMENT ON TABLE ASU.V#MEDIC IS 'snapshot table for snapshot ASU.V#MEDIC'
/


