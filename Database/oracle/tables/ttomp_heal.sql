DROP TABLE ASU.TTOMP_HEAL CASCADE CONSTRAINTS
/

--
-- TTOMP_HEAL  (Table) 
--
CREATE GLOBAL TEMPORARY TABLE ASU.TTOMP_HEAL
(
  FK_ID     NUMBER(6)                           NOT NULL,
  CODE      VARCHAR2(15 BYTE),
  FC_NAME   VARCHAR2(500 BYTE),
  FN_COST   NUMBER,
  FD_DATE1  DATE,
  FD_DATE2  DATE
)
ON COMMIT DELETE ROWS
NOCACHE
/

COMMENT ON TABLE ASU.TTOMP_HEAL IS 'Yenii?o niioaaonoaey iacia?aiee e oneoa. Oaaeeoa oneoa. I?euaaony e caiieiyaony caiiai i?e ea?aii iiaii ?an??oa Author:Efimov'
/


