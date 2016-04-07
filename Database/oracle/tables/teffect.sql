DROP TABLE ASU.TEFFECT CASCADE CONSTRAINTS
/

--
-- TEFFECT  (Table) 
--
CREATE TABLE ASU.TEFFECT
(
  FK_ID       NUMBER(9),
  FK_PACID    NUMBER(9),
  FP_VID      NUMBER(1),
  FN_AD_SIST  NUMBER(1)                         DEFAULT -1,
  FN_AD_DIST  NUMBER(1)                         DEFAULT -1,
  FN_BIOHIM   NUMBER(1)                         DEFAULT -1,
  FN_VEM      NUMBER(1)                         DEFAULT -1,
  FN_EKG      NUMBER(1)                         DEFAULT -1,
  FN_KARD     NUMBER(1)                         DEFAULT -1,
  FN_RESERV   NUMBER(1)                         DEFAULT -1,
  FN_ANTROP   NUMBER(1)                         DEFAULT -1,
  FN_KUR      NUMBER(1)                         DEFAULT -1,
  FN_AVGRES   NUMBER(4,2)                       DEFAULT 0
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

COMMENT ON TABLE ASU.TEFFECT IS 'Таблица для хранения групп результатов эффективности'
/

COMMENT ON COLUMN ASU.TEFFECT.FK_ID IS 'SEQUENCE=[SEQ_TEFFECT]'
/

COMMENT ON COLUMN ASU.TEFFECT.FK_PACID IS 'код пациента'
/

COMMENT ON COLUMN ASU.TEFFECT.FP_VID IS '0 - при прибытии 1- при выбытии'
/

COMMENT ON COLUMN ASU.TEFFECT.FN_AD_SIST IS 'группа систолического давления'
/

COMMENT ON COLUMN ASU.TEFFECT.FN_AD_DIST IS 'группа дистоливческого давленя'
/

COMMENT ON COLUMN ASU.TEFFECT.FN_BIOHIM IS 'группа теста биохимии'
/

COMMENT ON COLUMN ASU.TEFFECT.FN_VEM IS 'группа велоэргометрии'
/

COMMENT ON COLUMN ASU.TEFFECT.FN_EKG IS 'группа кардиограммы'
/

COMMENT ON COLUMN ASU.TEFFECT.FN_KARD IS 'группа кардиометрии'
/

COMMENT ON COLUMN ASU.TEFFECT.FN_RESERV IS 'группа резервов организма'
/

COMMENT ON COLUMN ASU.TEFFECT.FN_ANTROP IS 'группа антропометрических данных'
/

COMMENT ON COLUMN ASU.TEFFECT.FN_KUR IS 'группа курения'
/

COMMENT ON COLUMN ASU.TEFFECT.FN_AVGRES IS 'результат = среднее всех полей не равных -1'
/


--
-- TEFFECT_BY_ID  (Index) 
--
--  Dependencies: 
--   TEFFECT (Table)
--
CREATE UNIQUE INDEX ASU.TEFFECT_BY_ID ON ASU.TEFFECT
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
-- TEFFECT_BY_PACID  (Index) 
--
--  Dependencies: 
--   TEFFECT (Table)
--
CREATE INDEX ASU.TEFFECT_BY_PACID ON ASU.TEFFECT
(FK_PACID)
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
-- TEFFECT_BY_PACID_VID  (Index) 
--
--  Dependencies: 
--   TEFFECT (Table)
--
CREATE UNIQUE INDEX ASU.TEFFECT_BY_PACID_VID ON ASU.TEFFECT
(FK_PACID, FP_VID)
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
-- TEFFEKT_BEFORE_UPDATE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TEFFECT (Table)
--
CREATE OR REPLACE TRIGGER ASU."TEFFEKT_BEFORE_UPDATE_INSERT" 
BEFORE  INSERT  OR UPDATE  ON ASU.TEFFECT REFERENCING
 NEW AS NEW
 OLD AS OLD
FOR EACH ROW
declare
  nSum integer;
  nCount integer;
Begin
    nCount:=0;
    nSum:=0;
    if :new.FN_AD_SIST is null then :new.FN_AD_SIST:=-1; end if;
    if :new.FN_AD_DIST is null then :new.fn_ad_dist:=-1; end if;
    if :new.FN_BIOHIM  is null then :new.fn_biohim:=-1;  end if;
    if :new.FN_VEM     is null then :new.fn_vem:=-1;     end if;
    if :new.FN_EKG     is null then :new.fn_ekg:=-1;     end if;
    if :new.FN_KARD    is null then :new.fn_kard:=-1;    end if;
    if :new.FN_RESERV  is null then :new.fn_reserv:=-1;  end if;
    if :new.FN_ANTROP  is null then :new.fn_antrop:=-1;  end if;
    if :new.FN_KUR     is null then :new.fn_kur:=-1;     end if;

    if :new.FN_AD_SIST>0    then
      nSum:=nSum+:new.FN_AD_SIST;
      nCount:=nCount+1;
    elsif :old.FN_AD_SIST>0 then
      nSum:=nSum+:old.FN_AD_SIST;
      nCount:=nCount+1;
    end if;
    if :new.FN_AD_DIST>0 then
      nSum:=nSum+:new.fn_ad_dist;
      nCount:=nCount+1;
    elsif :old.FN_ad_dist>0 then
      nSum:=nSum+:old.FN_ad_dist;
      nCount:=nCount+1;
    end if;
    if :new.FN_BIOHIM>0  then
      nSum:=nSum+:new.fn_biohim;
      nCount:=nCount+1;
    elsif :old.FN_biohim>0 then
      nSum:=nSum+:old.FN_biohim;
      nCount:=nCount+1;
    end if;
    if :new.FN_VEM>0     then
      nSum:=nSum+:new.fn_vem;
      nCount:=nCount+1;
    elsif :old.FN_vem>0 then
      nSum:=nSum+:old.FN_vem;
      nCount:=nCount+1;
    end if;
    if :new.FN_EKG>0     then
      nSum:=nSum+:new.fn_ekg;
      nCount:=nCount+1;
    elsif :old.FN_ekg>0 then
      nSum:=nSum+:old.FN_ekg;
      nCount:=nCount+1;
    end if;
    if :new.FN_KARD>0    then
      nSum:=nSum+:new.fn_kard;
      nCount:=nCount+1;
    elsif :old.FN_kard>0 then
      nSum:=nSum+:old.FN_kard;
      nCount:=nCount+1;
    end if;
    if :new.FN_RESERV>0  then
      nSum:=nSum+:new.fn_reserv;
      nCount:=nCount+1;
    elsif :old.FN_reserv>0 then
      nSum:=nSum+:old.FN_reserv;
      nCount:=nCount+1;
    end if;
    if :new.FN_ANTROP>0  then
      nSum:=nSum+:new.fn_antrop;
      nCount:=nCount+1;
    elsif :old.FN_antrop>0 then
      nSum:=nSum+:old.FN_antrop;
      nCount:=nCount+1;
    end if;
    if :new.FN_KUR>0     then
      nSum:=nSum+:new.fn_kur;
      nCount:=nCount+1;
    elsif :old.FN_kur>0 then
      nSum:=nSum+:old.FN_kur;
      nCount:=nCount+1;
    end if;

    -- result
    if nCount>0 then
      :new.fn_avgres:=nSum/nCount;
    else
      :new.fn_avgres:=0;
    end if;
End;
/
SHOW ERRORS;


--
-- TEFFECT_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   TEFFECT (Table)
--
CREATE OR REPLACE TRIGGER ASU."TEFFECT_BEFORE_INSERT" 
BEFORE  INSERT  ON ASU.TEFFECT REFERENCING
 NEW AS NEW
 OLD AS OLD
FOR EACH ROW
Begin
  select seq_teffect.nextval into :new.fk_id from dual;
End;
/
SHOW ERRORS;


