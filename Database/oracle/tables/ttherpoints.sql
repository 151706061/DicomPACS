DROP TABLE ASU.TTHERPOINTS CASCADE CONSTRAINTS
/

--
-- TTHERPOINTS  (Table) 
--
CREATE TABLE ASU.TTHERPOINTS
(
  FK_ID          NUMBER(5),
  FC_NAME        VARCHAR2(100 BYTE),
  FK_VRACHID     NUMBER(15),
  FC_ADR         VARCHAR2(400 BYTE),
  FK_NAZVRACHID  NUMBER(15),
  FK_OTDEL       NUMBER(15),
  FL_SHOW        NUMBER(1)                      DEFAULT 1
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

COMMENT ON COLUMN ASU.TTHERPOINTS.FK_ID IS 'SEQUENCE=[SEQ_TTHERPOINTS]'
/


--
-- TTHERPOINTS_BY_OTDELID  (Index) 
--
--  Dependencies: 
--   TTHERPOINTS (Table)
--
CREATE INDEX ASU.TTHERPOINTS_BY_OTDELID ON ASU.TTHERPOINTS
(FK_OTDEL)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          40K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TTHERPOINTS_BY_SHOW_OTD  (Index) 
--
--  Dependencies: 
--   TTHERPOINTS (Table)
--
CREATE INDEX ASU.TTHERPOINTS_BY_SHOW_OTD ON ASU.TTHERPOINTS
(FK_OTDEL, FL_SHOW)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          40K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TTHERPOINTS_ID  (Index) 
--
--  Dependencies: 
--   TTHERPOINTS (Table)
--
CREATE UNIQUE INDEX ASU.TTHERPOINTS_ID ON ASU.TTHERPOINTS
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          160K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TTHERPOINTS_BEFORE_UPDATE  (Trigger) 
--
--  Dependencies: 
--   TTHERPOINTS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TTHERPOINTS_BEFORE_UPDATE" 
 BEFORE 
 UPDATE
 ON ASU.TTHERPOINTS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
declare
  cursor c is select fk_kabinetid  from tnazvrach where fk_id=:old.fk_nazvrachid;
  kabid NUMBER;
begin
  open c;
  fetch c into kabid;
  if c%found then
    update tkabinet set fc_name=:new.fc_name where fk_id=kabid;
    update tvrachkab set fk_sotrid=:new.fk_vrachid where fk_id=:old.fk_nazvrachid;
  end if;
  close c;
end;
/
SHOW ERRORS;


--
-- TTHERPOINTS_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TTHERPOINTS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TTHERPOINTS_BEFORE_INSERT" 
 BEFORE 
 INSERT
 ON ASU.TTHERPOINTS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
declare
kabid NUMBER;
nazvrachid NUMBER;
Begin

  SELECT SEQ_TTHERPOINTS.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
  INSERT INTO tkabinet (fc_name) VALUES (:new.fc_name) returning fk_id into kabid;
  Insert into tvrachkab (fk_sotrid,fk_kabinetid) values(:new.fk_vrachid,kabid) returning fk_id into nazvrachid;
  Insert into tvrachkab_naz (fk_sotrkabid, fk_smid) values(nazvrachid,get_synid('KONS_UCH_PEDIATR'));
  DO_UPDATE_TVRACHKAB_NAZ(nazvrachid);
  select nazvrachid into :new.fk_nazvrachid from dual;

End;
/
SHOW ERRORS;


--
-- TTHERPOINTS_BEFORE_DELETE  (Trigger) 
--
--  Dependencies: 
--   TTHERPOINTS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TTHERPOINTS_BEFORE_DELETE" 
 BEFORE 
 DELETE
 ON ASU.TTHERPOINTS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
declare
  cursor c is select fk_kabinetid  from tnazvrach where fk_id=:old.fk_nazvrachid;
  kabid NUMBER;
begin
  open c;
  fetch c into kabid;
  if c%found then
  delete from tvrachkab where fk_id=:old.fk_nazvrachid;
  delete from tkabinet where fk_id=kabid;
  end if;
  close c;
end;
/
SHOW ERRORS;


