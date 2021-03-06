DROP TABLE ASU.TLICENCE CASCADE CONSTRAINTS
/

--
-- TLICENCE  (Table) 
--
CREATE TABLE ASU.TLICENCE
(
  FK_ID             NUMBER,
  FK_OWNER          NUMBER,
  FC_CONFIGNAME     VARCHAR2(255 BYTE),
  FC_FULLNAME       VARCHAR2(255 BYTE),
  FC_SNAME          VARCHAR2(255 BYTE),
  DISTRIB_DATE      DATE,
  END_LICENCE_DATE  DATE,
  LICENCE_TYPE      VARCHAR2(20 BYTE),
  MAX_SOTR          NUMBER,
  FC_SYNONIM        VARCHAR2(50 BYTE),
  CRC               VARCHAR2(500 BYTE),
  CRC_BEZ           VARCHAR2(500 BYTE),
  BEGIN_ADMIN       DATE,
  BEGIN_USER        DATE,
  IS_SUPPORT        VARCHAR2(20 BYTE),
  CRC_WITH_DATE     VARCHAR2(500 BYTE),
  FC_DOGOVOR        VARCHAR2(255 BYTE)
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


DROP SYNONYM LOGIN.TLICENCE
/

--
-- TLICENCE  (Synonym) 
--
--  Dependencies: 
--   TLICENCE (Table)
--
CREATE SYNONYM LOGIN.TLICENCE FOR ASU.TLICENCE
/


GRANT SELECT ON ASU.TLICENCE TO LOGIN
/

