ALTER TABLE ASU.TMEDIC
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TMEDIC CASCADE CONSTRAINTS
/

--
-- TMEDIC  (Table) 
--
CREATE TABLE ASU.TMEDIC
(
  FN_NUM         VARCHAR2(255 BYTE),
  FC_NAME        VARCHAR2(255 BYTE),
  FC_COMMENT     VARCHAR2(4000 BYTE),
  FK_ID          NUMBER(9)                      NOT NULL,
  FK_UCHGRID     NUMBER(9),
  FK_UCHEDIZMID  NUMBER(9),
  FK_FASEDIZMID  NUMBER(9),
  FK_FARMGRID    NUMBER(9)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          520K
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

COMMENT ON TABLE ASU.TMEDIC IS 'справочник название медикаментов'
/

COMMENT ON COLUMN ASU.TMEDIC.FN_NUM IS 'Отношение упаковочных единиц к фасовочным'
/

COMMENT ON COLUMN ASU.TMEDIC.FC_NAME IS 'Название'
/

COMMENT ON COLUMN ASU.TMEDIC.FC_COMMENT IS 'Описание'
/

COMMENT ON COLUMN ASU.TMEDIC.FK_ID IS 'SEQUENCE=[SEQ_TMEDIC]'
/

COMMENT ON COLUMN ASU.TMEDIC.FK_UCHGRID IS 'Код учетной группы'
/

COMMENT ON COLUMN ASU.TMEDIC.FK_UCHEDIZMID IS 'Код учетных единиц измерения'
/

COMMENT ON COLUMN ASU.TMEDIC.FK_FASEDIZMID IS 'Код фасовочных единиц измерения'
/

COMMENT ON COLUMN ASU.TMEDIC.FK_FARMGRID IS 'Код фармакологической группы'
/


--
-- TMEDIC_FARMGRID  (Index) 
--
--  Dependencies: 
--   TMEDIC (Table)
--
CREATE INDEX ASU.TMEDIC_FARMGRID ON ASU.TMEDIC
(FK_FARMGRID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          128K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TMEDIC_PK  (Index) 
--
--  Dependencies: 
--   TMEDIC (Table)
--
CREATE UNIQUE INDEX ASU.TMEDIC_PK ON ASU.TMEDIC
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          384K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TMEDIC_INS  (Trigger) 
--
--  Dependencies: 
--   TMEDIC (Table)
--
CREATE OR REPLACE TRIGGER ASU."TMEDIC_INS" 
BEFORE  INSERT  ON ASU.TMEDIC FOR EACH ROW
Begin
  select seq_tmedic.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


--
-- TMEDIC_DEL  (Trigger) 
--
--  Dependencies: 
--   TMEDIC (Table)
--
CREATE OR REPLACE TRIGGER ASU."TMEDIC_DEL" 
 BEFORE 
 INSERT
 ON ASU.TMEDIC  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
   nTmp   ROWID;
BEGIN
-- Zhukov закоментарил ивалида
/*   IF pkgtmedic.isExistsChilds(:old.fk_id) = 1 THEN
      raise_application_error (-20001, 'Вы не можете удалить этот медикамент, т.к. есть записи зависящие от него');
   END IF;
*/
  null;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TMEDIC 
-- 
ALTER TABLE ASU.TMEDIC ADD (
  CONSTRAINT TMEDIC_PK
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          384K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

