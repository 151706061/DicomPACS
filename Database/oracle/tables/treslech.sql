DROP TABLE ASU.TRESLECH CASCADE CONSTRAINTS
/

--
-- TRESLECH  (Table) 
--
CREATE TABLE ASU.TRESLECH
(
  FK_ID          NUMBER(9),
  FK_SMID        NUMBER(9),
  FD_INS         DATE,
  FC_RES         VARCHAR2(4000 BYTE),
  FK_BLOBID      NUMBER(9),
  FN_RES         NUMBER(28),
  FC_TYPE        VARCHAR2(30 BYTE),
  FK_VRACHID     NUMBER(9)                      DEFAULT 0,
  FK_PACID       NUMBER(9)                      DEFAULT 0,
  FK_NAZID       NUMBER(9),
  FK_PATNAME     NUMBER(9)                      DEFAULT 0,
  FC_COMENT      VARCHAR2(4000 BYTE),
  FK_SOS         NUMBER(2)                      DEFAULT 2,
  FL_PATFIRST    NUMBER(1)                      DEFAULT 0,
  FK_PATID       NUMBER(9)                      DEFAULT 0,
  FK_ISPOLKABID  NUMBER
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          1744K
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

COMMENT ON TABLE ASU.TRESLECH IS 'Результаты процедур
  '
/

COMMENT ON COLUMN ASU.TRESLECH.FK_ID IS 'SEQUENCE=[SEQ_TRES]'
/

COMMENT ON COLUMN ASU.TRESLECH.FK_SMID IS 'Код проводимого назначения'
/

COMMENT ON COLUMN ASU.TRESLECH.FD_INS IS 'Дата ввода результата'
/

COMMENT ON COLUMN ASU.TRESLECH.FC_RES IS 'Текстовый результат'
/

COMMENT ON COLUMN ASU.TRESLECH.FK_BLOBID IS 'Ссылка на строковый результат, хранящийся в справочнике TSMID'
/

COMMENT ON COLUMN ASU.TRESLECH.FN_RES IS 'Числовой результат'
/

COMMENT ON COLUMN ASU.TRESLECH.FC_TYPE IS 'Тип результата TEXT - результат в FC_RES, CLOB результат в FK_BLOBID'
/

COMMENT ON COLUMN ASU.TRESLECH.FK_VRACHID IS 'Врач выполнивший'
/

COMMENT ON COLUMN ASU.TRESLECH.FK_PACID IS 'Код пациента'
/

COMMENT ON COLUMN ASU.TRESLECH.FK_NAZID IS 'Код назначения'
/

COMMENT ON COLUMN ASU.TRESLECH.FK_PATNAME IS 'TPATNAME.FK_ID'
/

COMMENT ON COLUMN ASU.TRESLECH.FC_COMENT IS 'Коментарий'
/

COMMENT ON COLUMN ASU.TRESLECH.FK_SOS IS 'Статус'
/

COMMENT ON COLUMN ASU.TRESLECH.FL_PATFIRST IS 'Впервые ли выявлена патология'
/

COMMENT ON COLUMN ASU.TRESLECH.FK_PATID IS 'Служебное поле'
/


--
-- TRESLECH_BY_SMID_NAZID  (Index) 
--
--  Dependencies: 
--   TRESLECH (Table)
--
CREATE INDEX ASU.TRESLECH_BY_SMID_NAZID ON ASU.TRESLECH
(FK_SMID, FK_NAZID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          1152K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TRESLECH#FD_INS  (Index) 
--
--  Dependencies: 
--   TRESLECH (Table)
--
CREATE INDEX ASU.TRESLECH#FD_INS ON ASU.TRESLECH
(FD_INS, FL_PATFIRST)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          13568K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TRESLECH_ID  (Index) 
--
--  Dependencies: 
--   TRESLECH (Table)
--
CREATE UNIQUE INDEX ASU.TRESLECH_ID ON ASU.TRESLECH
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          512K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TRESLECH_I_FK_NAZID  (Index) 
--
--  Dependencies: 
--   TRESLECH (Table)
--
CREATE INDEX ASU.TRESLECH_I_FK_NAZID ON ASU.TRESLECH
(FK_NAZID)
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
-- TRESLECH_PACID_NAZID  (Index) 
--
--  Dependencies: 
--   TRESLECH (Table)
--
CREATE INDEX ASU.TRESLECH_PACID_NAZID ON ASU.TRESLECH
(FK_PACID, FK_NAZID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          1M
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TRESLECH_PACID_VRACHID  (Index) 
--
--  Dependencies: 
--   TRESLECH (Table)
--
CREATE INDEX ASU.TRESLECH_PACID_VRACHID ON ASU.TRESLECH
(FK_VRACHID)
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
-- TRESLECH#SOSID_PATFIRST  (Index) 
--
--  Dependencies: 
--   TRESLECH (Table)
--
CREATE INDEX ASU.TRESLECH#SOSID_PATFIRST ON ASU.TRESLECH
(FK_SOS, FL_PATFIRST, FD_INS)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          13568K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TRESLECH_INSERT  (Trigger) 
--
--  Dependencies: 
--   TRESLECH (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRESLECH_INSERT" 
 BEFORE 
 INSERT
 ON ASU.TRESLECH  REFERENCING OLD AS OLD NEW AS NEW
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


--
-- TRESLECH_DELETE  (Trigger) 
--
--  Dependencies: 
--   TRESLECH (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRESLECH_DELETE" 
AFTER DELETE
ON ASU.TRESLECH REFERENCING OLD AS OLD NEW AS NEW
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
-- TRESLECH_AFTER_UPDATE  (Trigger) 
--
--  Dependencies: 
--   TRESLECH (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRESLECH_AFTER_UPDATE" 
 AFTER 
 UPDATE
 ON ASU.TRESLECH  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
Begin
  if insnaz.bins then
    return;
  end if;
  insnaz.bins:=true;
  update vres set
    fk_id=:new.fk_id,
    FK_SMID=:new.FK_SMID,
    FD_INS=:new.FD_INS,
    FC_RES=:new.FC_RES,
    FK_BLOBID=:new.FK_BLOBID,
    FN_RES=:new.FN_RES,
    FC_TYPE=:new.FC_TYPE,
    FK_VRACHID=:new.FK_VRACHID,
    FK_PACID=:new.FK_PACID,
    FK_NAZID=:new.FK_NAZID,
    FK_PATID=:new.FK_PATID,
    FC_COMENT=:new.FC_COMENT,
    FK_SOS=:new.FK_SOS,
    FL_ZAKL=null,
    FL_PATFIRST=:new.FL_PATFIRST
  where fk_id=:old.FK_ID;

  IF :new.fk_sos=get_vipnaz THEN
--    pkg_mednaz.calculation_proc_medics(:old.fk_id);
      IF pkg_vnaz.GET_PROC_FULL_COUNT(:new.fk_nazid)=pkg_vnaz.GET_PROC_VIP_COUNT(:new.fk_nazid) THEN
        update /*+rule*/ tnazlech set fk_nazsosid=get_vipnaz where fk_id=:new.fk_nazid;
      ELSE
        update /*+rule*/ tnazlech set fk_nazsosid=get_naz_process where fk_id=:new.fk_nazid;
      END IF;
  ELSIF :new.fk_sos=get_nevip THEN
--    pkg_mednaz.discard_proc_medics(:old.fk_id);
      IF pkg_vnaz.GET_PROC_VIP_COUNT(:new.fk_nazid)=0 THEN
        update /*+rule*/ asu.tnazlech set fk_nazsosid=get_nevip where fk_id=:new.fk_nazid;
      ELSE
        update /*+rule*/ asu.tnazlech set fk_nazsosid=get_naz_process where fk_id=:new.fk_nazid;
      END IF;
  END IF;
  insnaz.bins:=false;
  exception
    when others then
      insnaz.bins:=false;
      raise;

End;
/
SHOW ERRORS;


--
-- TRESLECH_UPDATE_RASPIS  (Trigger) 
--
--  Dependencies: 
--   TRESLECH (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRESLECH_UPDATE_RASPIS" 
 AFTER
 UPDATE
 ON ASU.TRESLECH  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
 if (:new.FK_SOS = asu.get_vipnaz) or (:new.FK_SOS = asu.get_nazcancel) then
  delete from ASU.TPACLST where TPAClst.Nazid = :new.FK_ID;
 end if;
END;
/
SHOW ERRORS;


GRANT DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE ON ASU.TRESLECH TO MMS
/

