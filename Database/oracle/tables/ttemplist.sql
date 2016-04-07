ALTER TABLE ASU.TTEMPLIST
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TTEMPLIST CASCADE CONSTRAINTS
/

--
-- TTEMPLIST  (Table) 
--
CREATE TABLE ASU.TTEMPLIST
(
  FK_ID       NUMBER(15)                        NOT NULL,
  FK_PACID    NUMBER(15),
  FD_ZAPOLN   DATE,
  FK_SMIDID   NUMBER(15),
  FN_VALUE    NUMBER(10,2),
  FK_SOTRID   NUMBER(15),
  FD_CHANGED  DATE
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          11968K
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

COMMENT ON TABLE ASU.TTEMPLIST IS 'Таблица записи результатов измерений по листу ОПБ 25.05.05 by Zag'
/

COMMENT ON COLUMN ASU.TTEMPLIST.FK_PACID IS 'TKARTA.FK_ID'
/

COMMENT ON COLUMN ASU.TTEMPLIST.FD_ZAPOLN IS 'Дата на заполнения измерений по листу ОПБ'
/

COMMENT ON COLUMN ASU.TTEMPLIST.FK_SMIDID IS 'TSMID.FK_ID'
/

COMMENT ON COLUMN ASU.TTEMPLIST.FN_VALUE IS 'Значение при измерении или выпонении процедуры'
/

COMMENT ON COLUMN ASU.TTEMPLIST.FK_SOTRID IS 'Сотрудник, создавший или изменивший запись'
/

COMMENT ON COLUMN ASU.TTEMPLIST.FD_CHANGED IS 'Sysdate заполнения сотрудником записи'
/


--
-- TTEMPLIST_BY_ID  (Index) 
--
--  Dependencies: 
--   TTEMPLIST (Table)
--
CREATE UNIQUE INDEX ASU.TTEMPLIST_BY_ID ON ASU.TTEMPLIST
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          3712K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TTEMPLIST_PACID  (Index) 
--
--  Dependencies: 
--   TTEMPLIST (Table)
--
CREATE INDEX ASU.TTEMPLIST_PACID ON ASU.TTEMPLIST
(FK_PACID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          4992K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TTEMPLIST_PAC_SMID_ZAPOLN  (Index) 
--
--  Dependencies: 
--   TTEMPLIST (Table)
--
CREATE INDEX ASU.TTEMPLIST_PAC_SMID_ZAPOLN ON ASU.TTEMPLIST
(FK_PACID, FK_SMIDID, FD_ZAPOLN)
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
-- TTEMPLIST_SMIDID  (Index) 
--
--  Dependencies: 
--   TTEMPLIST (Table)
--
CREATE INDEX ASU.TTEMPLIST_SMIDID ON ASU.TTEMPLIST
(FK_SMIDID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          5376K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TTEMPLIST_SOTRID  (Index) 
--
--  Dependencies: 
--   TTEMPLIST (Table)
--
CREATE INDEX ASU.TTEMPLIST_SOTRID ON ASU.TTEMPLIST
(FK_SOTRID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          5248K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TTEMPLIST_BEFORE_INS_OR_UPDATE  (Trigger) 
--
--  Dependencies: 
--   TTEMPLIST (Table)
--
CREATE OR REPLACE TRIGGER ASU."TTEMPLIST_BEFORE_INS_OR_UPDATE" 
  before insert or update on ttemplist
  for each row
declare
  -- local variables here
begin
  --  Column "FK_ID" uses sequence SEQ_TTEMPLIST
  IF :NEW.FK_ID IS NULL THEN
  SELECT SEQ_TTEMPLIST.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  END IF;
  :NEW.FD_CHANGED := SYSDATE;
end TTEMPLIST_BEFORE_INS_OR_UPDATE;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TTEMPLIST 
-- 
ALTER TABLE ASU.TTEMPLIST ADD (
  CONSTRAINT TTEMPLIST_BY_ID
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          3712K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

