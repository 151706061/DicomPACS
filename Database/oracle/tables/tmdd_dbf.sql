ALTER TABLE ASU.TMDD_DBF
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TMDD_DBF CASCADE CONSTRAINTS
/

--
-- TMDD_DBF  (Table) 
--
CREATE TABLE ASU.TMDD_DBF
(
  FK_ID       NUMBER                            NOT NULL,
  YEAR        NUMBER(4),
  MONTH       NUMBER(2),
  LPU_ID      NUMBER(10),
  PERSON_IDL  NUMBER(19),
  ID_ILL_U    NUMBER(19),
  ID_ILL      NUMBER(19),
  P_ID_ILL    NUMBER(2),
  ERR_MODERN  NUMBER(1),
  IST_FIN     NUMBER(2),
  UDR_MODERN  NUMBER(10,2),
  SUM_MODERN  NUMBER(10,2),
  PRVSM_U     VARCHAR2(4 BYTE),
  DOC_CD_U    VARCHAR2(20 BYTE),
  FC_COMMENT  VARCHAR2(255 BYTE)
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

COMMENT ON TABLE ASU.TMDD_DBF IS 'Таблица создана автоматически в результате загрузки DBF'
/

COMMENT ON COLUMN ASU.TMDD_DBF.FK_ID IS 'ASU.SEQ_TMDD_DBF'
/


--
-- K_TMDD_DBF_ID  (Index) 
--
--  Dependencies: 
--   TMDD_DBF (Table)
--
CREATE UNIQUE INDEX ASU.K_TMDD_DBF_ID ON ASU.TMDD_DBF
(FK_ID)
NOLOGGING
TABLESPACE USR
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TMDD_DBF_INSERT  (Trigger) 
--
--  Dependencies: 
--   TMDD_DBF (Table)
--
CREATE OR REPLACE TRIGGER ASU."TMDD_DBF_INSERT" 
 BEFORE
  INSERT
 ON asu.TMDD_DBF
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
Begin
  IF :new.fk_id IS NULL THEN
    SELECT asu.SEQ_TMDA_DBF.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  end if;
End;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TMDD_DBF 
-- 
ALTER TABLE ASU.TMDD_DBF ADD (
  CONSTRAINT K_TMDD_DBF_ID
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE USR
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          64K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

