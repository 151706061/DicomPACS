DROP TABLE ASU.TEPID CASCADE CONSTRAINTS
/

--
-- TEPID  (Table) 
--
CREATE TABLE ASU.TEPID
(
  FK_ID       NUMBER(15),
  FD_PRIB     DATE,
  FK_PACID    NUMBER(15),
  FP_TRAN     NUMBER(15)                        DEFAULT -1,
  FC_FROM     VARCHAR2(50 BYTE),
  FL_KONTAKT  NUMBER(1)                         DEFAULT 0,
  FL_GDE      NUMBER(1)                         DEFAULT 0,
  FP_NWAS     VARCHAR2(1 BYTE),
  FL_ASIA     NUMBER(1)                         DEFAULT 0,
  FL_AMERICA  NUMBER(1)                         DEFAULT 0,
  FL_AFRICA   NUMBER(1)                         DEFAULT 0,
  FL_KATAR    NUMBER(1)                         DEFAULT 0,
  FD_DATA     DATE,
  FN_TEMP     NUMBER(4,1)                       DEFAULT 36.6,
  FL_ALERG    NUMBER(1)                         DEFAULT 0,
  FL_MET_ROP  NUMBER(1)                         DEFAULT 0,
  FK_REIS     VARCHAR2(10 BYTE),
  FL_AMB      NUMBER(1)                         DEFAULT 0,
  FC_VAGON    VARCHAR2(10 BYTE)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          13240K
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

COMMENT ON TABLE ASU.TEPID IS 'Ёпиданамнез пациентов by TimurLan'
/

COMMENT ON COLUMN ASU.TEPID.FK_ID IS 'SEQUENCE=[SEQ_TEPID]'
/

COMMENT ON COLUMN ASU.TEPID.FD_PRIB IS 'прибыл на лечение'
/

COMMENT ON COLUMN ASU.TEPID.FK_PACID IS 'код пациента'
/

COMMENT ON COLUMN ASU.TEPID.FP_TRAN IS 'вид транспорта'
/

COMMENT ON COLUMN ASU.TEPID.FC_FROM IS 'откуда'
/

COMMENT ON COLUMN ASU.TEPID.FL_KONTAKT IS 'контакты с больными'
/

COMMENT ON COLUMN ASU.TEPID.FL_GDE IS 'место контакта'
/

COMMENT ON COLUMN ASU.TEPID.FP_NWAS IS 'продолжительность контакта'
/

COMMENT ON COLUMN ASU.TEPID.FL_ASIA IS 'был в јзии'
/

COMMENT ON COLUMN ASU.TEPID.FL_AMERICA IS 'в јмерике'
/

COMMENT ON COLUMN ASU.TEPID.FL_AFRICA IS 'в јфрике'
/

COMMENT ON COLUMN ASU.TEPID.FL_KATAR IS 'в  атаре'
/

COMMENT ON COLUMN ASU.TEPID.FD_DATA IS 'дата осмотра'
/

COMMENT ON COLUMN ASU.TEPID.FN_TEMP IS 'температура'
/

COMMENT ON COLUMN ASU.TEPID.FL_ALERG IS 'аллергии'
/

COMMENT ON COLUMN ASU.TEPID.FL_MET_ROP IS 'метеотропность'
/

COMMENT ON COLUMN ASU.TEPID.FK_REIS IS 'результат исследовани€'
/

COMMENT ON COLUMN ASU.TEPID.FL_AMB IS 'признак амбулаторного пациента'
/

COMMENT ON COLUMN ASU.TEPID.FC_VAGON IS 'номер вагона'
/


--
-- TEPID$FK_PACID  (Index) 
--
--  Dependencies: 
--   TEPID (Table)
--
CREATE INDEX ASU.TEPID$FK_PACID ON ASU.TEPID
(FK_PACID)
NOLOGGING
TABLESPACE INDX
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
-- TEPID_TO_TIB$UPD$INS  (Trigger) 
--
--  Dependencies: 
--   TEPID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TEPID_TO_TIB$UPD$INS" 
AFTER INSERT OR UPDATE
ON ASU.TEPID REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
DECLARE
   CURSOR ctransport IS
      SELECT fc_name
        FROM ttransport
       WHERE fk_id = :new.fp_tran;
BEGIN
--вставка в историю болезни данных эпиданамнеза
   FOR transport IN ctransport LOOP
      DELETE FROM tib
        WHERE fk_pacid = :old.fk_id
          AND fk_smeditid = get_synid ('EPID_TRANSPORT');
      INSERT INTO tib(fk_pacid, fc_char, fk_smeditid, fk_smid)
           VALUES (:new.fk_pacid, transport.fc_name, get_synid ('EPID_TRANSPORT'), get_synid ('EPID_TRANSPORT'));
   END LOOP;
END;
/
SHOW ERRORS;


--
-- TEPID_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TEPID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TEPID_BEFORE_INSERT" 
BEFORE INSERT
ON ASU.TEPID REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
Begin
  SELECT SEQ_TEPID.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
End;
/
SHOW ERRORS;


