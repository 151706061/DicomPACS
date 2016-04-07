DROP TABLE ASU.TRESMEDCONT CASCADE CONSTRAINTS
/

--
-- TRESMEDCONT  (Table) 
--
CREATE TABLE ASU.TRESMEDCONT
(
  FK_ID         NUMBER(9),
  FK_RESMEDID   NUMBER(9),
  FK_MEDICID    NUMBER(9),
  FN_KOL        NUMBER(6,3),
  FK_MEDKARTID  NUMBER(9)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          1040K
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

COMMENT ON TABLE ASU.TRESMEDCONT IS 'Список выданных медикаментов'
/

COMMENT ON COLUMN ASU.TRESMEDCONT.FK_ID IS 'SEQUENCE=[SEQ_TRESMEDCONT]'
/

COMMENT ON COLUMN ASU.TRESMEDCONT.FK_RESMEDID IS 'При какой выдаче'
/

COMMENT ON COLUMN ASU.TRESMEDCONT.FK_MEDICID IS 'Какого медикамента'
/

COMMENT ON COLUMN ASU.TRESMEDCONT.FN_KOL IS 'Было сколько выдано'
/

COMMENT ON COLUMN ASU.TRESMEDCONT.FK_MEDKARTID IS 'Код карточки медикамента'
/


--
-- TRESMEDCONT$ID  (Index) 
--
--  Dependencies: 
--   TRESMEDCONT (Table)
--
CREATE UNIQUE INDEX ASU.TRESMEDCONT$ID ON ASU.TRESMEDCONT
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
-- TRESMEDCONT$MEDICID  (Index) 
--
--  Dependencies: 
--   TRESMEDCONT (Table)
--
CREATE INDEX ASU.TRESMEDCONT$MEDICID ON ASU.TRESMEDCONT
(FK_MEDICID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          640K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TRESMEDCONT$MEDKARTID  (Index) 
--
--  Dependencies: 
--   TRESMEDCONT (Table)
--
CREATE INDEX ASU.TRESMEDCONT$MEDKARTID ON ASU.TRESMEDCONT
(FK_MEDKARTID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          640K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TRESMEDCONT$RESMEDID  (Index) 
--
--  Dependencies: 
--   TRESMEDCONT (Table)
--
CREATE INDEX ASU.TRESMEDCONT$RESMEDID ON ASU.TRESMEDCONT
(FK_RESMEDID)
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
-- TRESMEDCONT$SALDO  (Trigger) 
--
--  Dependencies: 
--   TRESMEDCONT (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRESMEDCONT$SALDO" 
AFTER INSERT OR UPDATE OF FK_MEDKARTID,FN_KOL OR DELETE
ON ASU.TRESMEDCONT REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
DECLARE
  CURSOR cResMed (pFK_RESMEDID IN NUMBER)
  IS
    SELECT *
      FROM tresmed
     WHERE fk_id = pFK_RESMEDID;
  nDelta   NUMBER := 0;
BEGIN
  IF :new.fk_medkartid = -1 THEN
    RETURN;
  END IF;
  FOR i IN cResMed (:old.fk_resmedid) LOOP
    IF     (   inserting
            OR updating)
       AND :new.fk_medkartid <> -1 THEN
      BEGIN
        INSERT INTO tresmedsaldo
                    (fn_kol, fk_medkartid, fk_postavshikid, fd_date)
             VALUES (:new.fn_kol, :new.fk_medkartid, i.fk_apostavshikid, i.fd_data);
      EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
          NULL;
      END;
    END IF;
    IF inserting THEN
      nDelta  := :new.fn_kol;
    ELSIF deleting THEN
      nDelta  := -:old.fn_kol;
    ELSIF updating THEN
      nDelta  := :new.fn_kol - :old.fn_kol;
    END IF;
    UPDATE tresmedsaldo
       SET fn_kol = fn_kol + nDelta
     WHERE fk_postavshikid = i.fk_apostavshikid
       AND fk_medkartid = :new.fk_medkartid
       AND fd_date >= i.fd_data;
  END LOOP;
END;
/
SHOW ERRORS;


--
-- TRESMEDCONT$BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TRESMEDCONT (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRESMEDCONT$BEFORE_INSERT" 
BEFORE INSERT
ON ASU.TRESMEDCONT REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
BEGIN
  SELECT seq_tresmedcont.nextval
    INTO :new.fk_id
    FROM dual;
END;

-- END PL/SQL BLOCK (do not remove this line) ----------------------------------
/
SHOW ERRORS;


