ALTER TABLE ASU.TNAZDETAIL
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TNAZDETAIL CASCADE CONSTRAINTS
/

--
-- TNAZDETAIL  (Table) 
--
CREATE TABLE ASU.TNAZDETAIL
(
  FK_NAZID        NUMBER,
  FK_REASON       NUMBER,
  FK_SERVPLACE    NUMBER,
  FK_SOTRNAZ      NUMBER,
  FC_NAZ_COMMENT  VARCHAR2(4000 BYTE)
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

COMMENT ON TABLE ASU.TNAZDETAIL IS 'Деали назначения ( место ослуживания и цель )'
/

COMMENT ON COLUMN ASU.TNAZDETAIL.FC_NAZ_COMMENT IS 'Комментарии'
/

COMMENT ON COLUMN ASU.TNAZDETAIL.FK_SOTRNAZ IS 'Назначивший сотрудник. А регистратуре назначения идут от имени враа в талоне. Сюда сохраняется реальный сотрудник, кто сделал назначение'
/


--
-- PK_TNAZDETAIL  (Index) 
--
--  Dependencies: 
--   TNAZDETAIL (Table)
--
CREATE UNIQUE INDEX ASU.PK_TNAZDETAIL ON ASU.TNAZDETAIL
(FK_NAZID)
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
-- Non Foreign Key Constraints for Table TNAZDETAIL 
-- 
ALTER TABLE ASU.TNAZDETAIL ADD (
  CONSTRAINT PK_TNAZDETAIL
 PRIMARY KEY
 (FK_NAZID)
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

