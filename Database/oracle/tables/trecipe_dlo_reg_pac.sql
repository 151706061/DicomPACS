ALTER TABLE ASU.TRECIPE_DLO_REG_PAC
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TRECIPE_DLO_REG_PAC CASCADE CONSTRAINTS
/

--
-- TRECIPE_DLO_REG_PAC  (Table) 
--
CREATE TABLE ASU.TRECIPE_DLO_REG_PAC
(
  FK_ID          NUMBER,
  UNIQCODE       VARCHAR2(16 BYTE),
  PERSON_TITLES  VARCHAR2(200 BYTE),
  REGISTR_TYPE   NUMBER
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

COMMENT ON TABLE ASU.TRECIPE_DLO_REG_PAC IS 'ДЛО. Региональный регистр льготников и орфанный'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_REG_PAC.FK_ID IS 'ключ'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_REG_PAC.UNIQCODE IS 'Уникальный код льготника'
/

COMMENT ON COLUMN ASU.TRECIPE_DLO_REG_PAC.REGISTR_TYPE IS 'Тип регистра (2 - региональный, 4 - орфанный)'
/


--
-- TRECIPE_DLO_REG_PAC_PK  (Index) 
--
--  Dependencies: 
--   TRECIPE_DLO_REG_PAC (Table)
--
CREATE UNIQUE INDEX ASU.TRECIPE_DLO_REG_PAC_PK ON ASU.TRECIPE_DLO_REG_PAC
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
-- TRECIPE_DLO_REG_PAC_UNIQ  (Index) 
--
--  Dependencies: 
--   TRECIPE_DLO_REG_PAC (Table)
--
CREATE UNIQUE INDEX ASU.TRECIPE_DLO_REG_PAC_UNIQ ON ASU.TRECIPE_DLO_REG_PAC
(UNIQCODE)
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
-- TRECIPE_DLO_REG_PAC_DEL  (Trigger) 
--
--  Dependencies: 
--   TRECIPE_DLO_REG_PAC (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECIPE_DLO_REG_PAC_DEL"
 BEFORE
  DELETE
 ON ASU.TRECIPE_DLO_REG_PAC REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  delete from asu.TRECIPE_DLO_REG_PAC_INFO t
		where t.FK_REGPACID = :OLD.FK_ID;

  delete from asu.TRECIPE_DLO_PAC_TYPELPU t
		where t.FK_REGPACID = :OLD.FK_ID;

  delete from asu.TRECIPE_DLO_PAC_ADRPREB t
		where t.FK_REGPACID = :OLD.FK_ID;

  delete from asu.TRECIPE_DLO_PAC_AMBKAR t
		where t.FK_REGPACID = :OLD.FK_ID;

  delete from asu.TRECIPE_DLO_PAC_KAT t
		where t.FK_REGPACID = :OLD.FK_ID;

  delete from asu.TRECIPE_DLO_PAC_SNP t
		where t.FK_REGPACID = :OLD.FK_ID;

end;
/
SHOW ERRORS;


--
-- TRECIPE_DLO_REG_PAC_INS  (Trigger) 
--
--  Dependencies: 
--   TRECIPE_DLO_REG_PAC (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECIPE_DLO_REG_PAC_INS"
 BEFORE
  INSERT
 ON ASU.TRECIPE_DLO_REG_PAC REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  if (:new.fk_id is null) then
    select ASU.SEQ_TRECIPE_DLO_REG_PAC.nextval into :new.fk_id from dual;
  end if;
end;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TRECIPE_DLO_REG_PAC 
-- 
ALTER TABLE ASU.TRECIPE_DLO_REG_PAC ADD (
  CONSTRAINT TRECIPE_DLO_REG_PAC_PK
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
               ),
  CONSTRAINT TRECIPE_DLO_REG_PAC_UNIQ
 UNIQUE (UNIQCODE)
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

