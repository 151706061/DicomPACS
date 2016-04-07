DROP TABLE ASU.TRECEPTVID CASCADE CONSTRAINTS
/

--
-- TRECEPTVID  (Table) 
--
CREATE TABLE ASU.TRECEPTVID
(
  FK_ID       NUMBER(9)                         NOT NULL,
  FC_NAME     VARCHAR2(50 BYTE)                 NOT NULL,
  FL_RASIPIS  NUMBER(1)                         DEFAULT 0
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

COMMENT ON TABLE ASU.TRECEPTVID IS 'виды рецептов'
/

COMMENT ON COLUMN ASU.TRECEPTVID.FK_ID IS 'SEQUENCE=[SEQ_TRECEPTVID]'
/

COMMENT ON COLUMN ASU.TRECEPTVID.FC_NAME IS 'Название вида рецепта'
/

COMMENT ON COLUMN ASU.TRECEPTVID.FL_RASIPIS IS 'Нужно ли расписание приема этого рецепта'
/


--
-- TRECEPTVID_ID  (Index) 
--
--  Dependencies: 
--   TRECEPTVID (Table)
--
CREATE UNIQUE INDEX ASU.TRECEPTVID_ID ON ASU.TRECEPTVID
(FK_ID)
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
-- TRECEPTVID_BI  (Trigger) 
--
--  Dependencies: 
--   TRECEPTVID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECEPTVID_BI" 
BEFORE INSERT
ON ASU.TRECEPTVID REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
BEGIN
  SELECT seq_treceptvid.nextval
    INTO :new.fk_id
    FROM dual;
END;
/
SHOW ERRORS;


--
-- TRECEPTVID_BD  (Trigger) 
--
--  Dependencies: 
--   TRECEPTVID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECEPTVID_BD" 
BEFORE DELETE
ON ASU.TRECEPTVID REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
DECLARE
  CURSOR c
  IS
    SELECT fk_id
      FROM trecept
     WHERE fk_receptvidid = :old.fk_id;
  bFind   BOOLEAN := FALSE;
BEGIN
  FOR i IN c LOOP
    bFind  := TRUE;
  END LOOP;
  IF bFind THEN
    raise_application_error (-20003, 'Невозможно удалить вид рецепта, ' || :old.fc_name || 'т.к. имеются рецепты принадлежащие к этому виду');
  END IF;
END;
/
SHOW ERRORS;


