DROP TABLE ASU.TTOMP_HEAL_SMID CASCADE CONSTRAINTS
/

--
-- TTOMP_HEAL_SMID  (Table) 
--
CREATE TABLE ASU.TTOMP_HEAL_SMID
(
  FK_SMIDID        NUMBER(15),
  FK_HEALID        NUMBER(6),
  FC_SMIDNAME      VARCHAR2(255 BYTE),
  FC_HEALCODE      VARCHAR2(15 BYTE),
  FC_HEALNAME      VARCHAR2(500 BYTE),
  FN_COST          NUMBER,
  FD_DATE1         DATE,
  FD_DATE2         DATE,
  SFULLNAME        VARCHAR2(4000 BYTE),
  SVID             VARCHAR2(12 BYTE),
  FD_HS_DATE1      DATE,
  FD_HS_DATE2      DATE,
  FK_HEAL_SMID     INTEGER,
  FK_HEAL_SMID_DT  INTEGER,
  FL_DEL           NUMBER(1),
  FC_OTDEL         VARCHAR2(255 BYTE),
  FC_OWNER_NAME    VARCHAR2(255 BYTE)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             8K
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

COMMENT ON TABLE ASU.TTOMP_HEAL_SMID IS 'Экспорт соответствия назначений и услуг. Таблица соотвтетсвий назначений и услуг. Очищается и заполняется заново при каждом новом расчёте Author:Efimov'
/


