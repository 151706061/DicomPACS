DROP TABLE ASU.TRESKONS CASCADE CONSTRAINTS
/

--
-- TRESKONS  (Table) 
--
CREATE TABLE ASU.TRESKONS
(
  FK_ID        NUMBER(15),
  FK_SMID      NUMBER(15),
  FD_INS       DATE,
  FC_RES       VARCHAR2(4000 BYTE),
  FK_BLOBID    NUMBER(15),
  FN_RES       NUMBER(28),
  FC_TYPE      VARCHAR2(30 BYTE),
  FK_VRACHID   NUMBER,
  FK_PACID     NUMBER(15),
  FK_NAZID     NUMBER(15),
  FK_PATNAME   NUMBER(15)                       DEFAULT 0,
  FC_COMENT    VARCHAR2(100 BYTE),
  FK_SOS       NUMBER(9),
  FL_PATFIRST  NUMBER(1)                        DEFAULT 0,
  FK_PATID     NUMBER(9)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          2608K
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

COMMENT ON TABLE ASU.TRESKONS IS 'Результаты консультаций
  '
/

COMMENT ON COLUMN ASU.TRESKONS.FK_ID IS 'SEQUENCE=[SEQ_TRES]'
/

COMMENT ON COLUMN ASU.TRESKONS.FK_SMID IS 'Код проводимого назначения'
/

COMMENT ON COLUMN ASU.TRESKONS.FD_INS IS 'Дата ввода результата'
/

COMMENT ON COLUMN ASU.TRESKONS.FC_RES IS 'Текстовый результат'
/

COMMENT ON COLUMN ASU.TRESKONS.FK_BLOBID IS 'Ссылка на строковый результат, хранящийся в справочнике TSMID'
/

COMMENT ON COLUMN ASU.TRESKONS.FN_RES IS 'Числовой результат'
/

COMMENT ON COLUMN ASU.TRESKONS.FC_TYPE IS 'TEXT - результат в FC_RES, CLOB результат в FK_BLOBID'
/

COMMENT ON COLUMN ASU.TRESKONS.FK_VRACHID IS 'Врач выполнивший'
/

COMMENT ON COLUMN ASU.TRESKONS.FK_PACID IS 'Код пациента'
/

COMMENT ON COLUMN ASU.TRESKONS.FK_NAZID IS 'Код назначения'
/

COMMENT ON COLUMN ASU.TRESKONS.FK_PATNAME IS 'TPATNAME.FK_ID'
/

COMMENT ON COLUMN ASU.TRESKONS.FC_COMENT IS 'Комментарий'
/

COMMENT ON COLUMN ASU.TRESKONS.FK_SOS IS 'Статус'
/

COMMENT ON COLUMN ASU.TRESKONS.FL_PATFIRST IS 'Впервые ли выявлена патология'
/

COMMENT ON COLUMN ASU.TRESKONS.FK_PATID IS 'Служебное поле'
/


--
-- TRESKONS_BY_ID  (Index) 
--
--  Dependencies: 
--   TRESKONS (Table)
--
CREATE INDEX ASU.TRESKONS_BY_ID ON ASU.TRESKONS
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          768K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TRESKONS_BY_NAZID  (Index) 
--
--  Dependencies: 
--   TRESKONS (Table)
--
CREATE INDEX ASU.TRESKONS_BY_NAZID ON ASU.TRESKONS
(FK_NAZID, FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          1664K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TRESKONS_BY_PACID  (Index) 
--
--  Dependencies: 
--   TRESKONS (Table)
--
CREATE INDEX ASU.TRESKONS_BY_PACID ON ASU.TRESKONS
(FK_PACID, FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          1280K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TRESKONS$INS_VRACH_SOS_TYPE  (Index) 
--
--  Dependencies: 
--   TRESKONS (Table)
--
CREATE INDEX ASU.TRESKONS$INS_VRACH_SOS_TYPE ON ASU.TRESKONS
(FD_INS, FK_VRACHID, FK_SOS, FC_TYPE)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          2M
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TRESKONS_AFTER_UPDATE  (Trigger) 
--
--  Dependencies: 
--   TRESKONS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRESKONS_AFTER_UPDATE" 
AFTER  UPDATE  ON ASU.TRESKONS REFERENCING
 NEW AS NEW
 OLD AS OLD
FOR EACH ROW
BEGIN
  IF insnaz.bins THEN
    RETURN;
  END IF;
  insnaz.bins  := TRUE;

  UPDATE vres
     SET fk_id = :new.fk_id,
         FK_SMID = :new.FK_SMID,
         FD_INS = :new.FD_INS,
         FC_RES = :new.FC_RES,
         FK_BLOBID = :new.FK_BLOBID,
         FN_RES = :new.FN_RES,
         FC_TYPE = :new.FC_TYPE,
         FK_VRACHID = :new.FK_VRACHID,
         FK_PACID = :new.FK_PACID,
         FK_NAZID = :new.FK_NAZID,
         FK_PATID = :new.FK_PATID,
         FC_COMENT = :new.FC_COMENT,
         FK_SOS = :new.FK_SOS,
         FL_ZAKL = NULL,
         FL_PATFIRST = :new.FL_PATFIRST
   WHERE fk_id = :old.FK_ID;

  insnaz.bins  := FALSE;
EXCEPTION
  WHEN OTHERS THEN
    insnaz.bins  := FALSE;
    RAISE;
END;
/
SHOW ERRORS;


--
-- TRESKONS_DELETE  (Trigger) 
--
--  Dependencies: 
--   TRESKONS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRESKONS_DELETE" 
AFTER  DELETE  ON ASU.TRESKONS REFERENCING
 NEW AS NEW
 OLD AS OLD
FOR EACH ROW
BEGIN
  IF insnaz.bins THEN
    RETURN;
  END IF;
  insnaz.bins  := TRUE;

  DELETE
    FROM vres
   WHERE fk_id = :old.fk_id;

  insnaz.bins  := FALSE;
EXCEPTION
  WHEN OTHERS THEN
    insnaz.bins  := FALSE;
    RAISE;
END;
/
SHOW ERRORS;


--
-- TRESKONS_INSERT  (Trigger) 
--
--  Dependencies: 
--   TRESKONS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRESKONS_INSERT" 
 BEFORE 
 INSERT
 ON ASU.TRESKONS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
Begin
  if insnaz.bins then
    return;
  end if;
  insnaz.bins:=true;
--  SELECT SEQ_TRES.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  select seq_tkarta.nextval into :new.fk_id from dual;
  insert into vres(FK_ID,FK_SMID,FD_INS,FC_RES,FK_BLOBID,FN_RES,FC_TYPE,FK_VRACHID,FK_PACID,
                   FK_NAZID,FK_PATID,FC_COMENT,FK_SOS,FL_ZAKL,fl_patfirst)
    values (:new.FK_ID, :new.FK_SMID, :new.FD_INS, :new.FC_RES, :new.FK_BLOBID, :new.FN_RES, :new.FC_TYPE, :new.FK_VRACHID, :new.FK_PACID,
            :new.FK_NAZID, :new.fk_patid, :new.FC_COMENT, :new.FK_SOS, null, :new.fl_patfirst);
  insnaz.bins:=false;
  exception
    when others then
      insnaz.bins:=false;
      raise;
End;
/
SHOW ERRORS;


DROP SYNONYM STAT.TRESKONS
/

--
-- TRESKONS  (Synonym) 
--
--  Dependencies: 
--   TRESKONS (Table)
--
CREATE SYNONYM STAT.TRESKONS FOR ASU.TRESKONS
/


GRANT DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE ON ASU.TRESKONS TO MMS
/

