ALTER TABLE ASU.TPATH_TO_KAB
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TPATH_TO_KAB CASCADE CONSTRAINTS
/

--
-- TPATH_TO_KAB  (Table) 
--
CREATE TABLE ASU.TPATH_TO_KAB
(
  FK_ID     NUMBER                              NOT NULL,
  FN_COL    NUMBER                              DEFAULT 0,
  FN_ROW    NUMBER                              DEFAULT 0,
  FK_ROOM   NUMBER,
  FK_FLOOR  NUMBER
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

COMMENT ON TABLE ASU.TPATH_TO_KAB IS 'Таблица координат пути следования до кабинета by deemaric'
/

COMMENT ON COLUMN ASU.TPATH_TO_KAB.FN_COL IS 'номер колонки'
/

COMMENT ON COLUMN ASU.TPATH_TO_KAB.FN_ROW IS 'номер строки'
/

COMMENT ON COLUMN ASU.TPATH_TO_KAB.FK_ROOM IS 'ссылка на комнату'
/

COMMENT ON COLUMN ASU.TPATH_TO_KAB.FK_FLOOR IS 'номер этажа'
/


--
-- TPATH_TO_KAB_BY_ID  (Index) 
--
--  Dependencies: 
--   TPATH_TO_KAB (Table)
--
CREATE UNIQUE INDEX ASU.TPATH_TO_KAB_BY_ID ON ASU.TPATH_TO_KAB
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
-- TPATH_TO_KAB_BEF_INS  (Trigger) 
--
--  Dependencies: 
--   TPATH_TO_KAB (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPATH_TO_KAB_BEF_INS" 
  before insert on asu.tpath_to_kab
  REFERENCING OLD AS OLD NEW AS NEW
  for each row
begin

   SELECT SEQ_TPATH_TO_KAB.NEXTVAL INTO :NEW.FK_ID FROM DUAL;

end TPath_to_kab;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TPATH_TO_KAB 
-- 
ALTER TABLE ASU.TPATH_TO_KAB ADD (
  CONSTRAINT TPATH_TO_KAB_BY_ID
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

