DROP TABLE ASU.TNAZRECEPTVID CASCADE CONSTRAINTS
/

--
-- TNAZRECEPTVID  (Table) 
--
CREATE TABLE ASU.TNAZRECEPTVID
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

COMMENT ON TABLE ASU.TNAZRECEPTVID IS 'виды рецептов'
/

COMMENT ON COLUMN ASU.TNAZRECEPTVID.FK_ID IS 'SEQUENCE=[SEQ_TNAZRECEPTVID]'
/

COMMENT ON COLUMN ASU.TNAZRECEPTVID.FC_NAME IS 'Название рецепта'
/

COMMENT ON COLUMN ASU.TNAZRECEPTVID.FL_RASIPIS IS 'Нужно ли расписание приема этого рецепта'
/


--
-- TNAZRECEPTVID_ID  (Index) 
--
--  Dependencies: 
--   TNAZRECEPTVID (Table)
--
CREATE UNIQUE INDEX ASU.TNAZRECEPTVID_ID ON ASU.TNAZRECEPTVID
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
-- TNAZRECEPTVID_BI  (Trigger) 
--
--  Dependencies: 
--   TNAZRECEPTVID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZRECEPTVID_BI" 
BEFORE INSERT
ON ASU.TNAZRECEPTVID REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
BEGIN
  SELECT seq_tnazreceptvid.nextval
    INTO :new.fk_id
    FROM dual;
END;
/
SHOW ERRORS;


--
-- TNAZRECEPTVID_BD  (Trigger) 
--
--  Dependencies: 
--   TNAZRECEPTVID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZRECEPTVID_BD" 
BEFORE DELETE
ON ASU.TNAZRECEPTVID REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
DECLARE
  CURSOR c
  IS
    SELECT fk_id
      FROM tnazrecept
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


