ALTER TABLE ASU.TRESAN
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TRESAN CASCADE CONSTRAINTS
/

--
-- TRESAN  (Table) 
--
CREATE TABLE ASU.TRESAN
(
  FK_ID        NUMBER                           NOT NULL,
  FK_SMID      NUMBER,
  FD_INS       DATE,
  FC_RES       VARCHAR2(4000 BYTE),
  FK_BLOBID    NUMBER(15),
  FN_RES       NUMBER(15,4),
  FC_TYPE      VARCHAR2(30 BYTE),
  FK_VRACHID   NUMBER,
  FK_PACID     NUMBER(15),
  FK_NAZID     NUMBER(15),
  FK_PATNAME   NUMBER(16)                       DEFAULT 0,
  FC_COMENT    VARCHAR2(100 BYTE),
  FK_SOS       NUMBER(9),
  FK_COLID     NUMBER(9),
  FL_ZAKL      NUMBER(9)                        DEFAULT 0,
  FL_PATFIRST  NUMBER(1)                        DEFAULT 0,
  FK_PATID     NUMBER(9),
  FN_RES2      NUMBER(15,4),
  FK_BLOBID2   NUMBER(15),
  FK_BLOBID3   NUMBER(15),
  FK_GUID      VARCHAR2(32 BYTE)
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          37576K
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

COMMENT ON TABLE ASU.TRESAN IS 'Результаты лабораторных исследований'
/

COMMENT ON COLUMN ASU.TRESAN.FK_ID IS 'SEQUENCE=[SEQ_TRES]'
/

COMMENT ON COLUMN ASU.TRESAN.FK_SMID IS 'Код результата по справочнику TSMID'
/

COMMENT ON COLUMN ASU.TRESAN.FD_INS IS 'Дата ввода результата'
/

COMMENT ON COLUMN ASU.TRESAN.FC_RES IS 'Текстовый результат'
/

COMMENT ON COLUMN ASU.TRESAN.FK_BLOBID IS 'Ссылка на строковый результат, хранящийся в справочнике TSMID'
/

COMMENT ON COLUMN ASU.TRESAN.FN_RES IS 'Числовой результат'
/

COMMENT ON COLUMN ASU.TRESAN.FC_TYPE IS 'Тип результата'
/

COMMENT ON COLUMN ASU.TRESAN.FK_VRACHID IS 'Код врача, внесшего результат'
/

COMMENT ON COLUMN ASU.TRESAN.FK_PACID IS 'Код пациента'
/

COMMENT ON COLUMN ASU.TRESAN.FK_NAZID IS 'Код назначения, по которому проходит результат'
/

COMMENT ON COLUMN ASU.TRESAN.FK_PATNAME IS 'Признак патологии'
/

COMMENT ON COLUMN ASU.TRESAN.FC_COMENT IS 'Комментарии'
/

COMMENT ON COLUMN ASU.TRESAN.FK_SOS IS 'Служебное поле'
/

COMMENT ON COLUMN ASU.TRESAN.FK_COLID IS 'Номер колонки для динамической таблички'
/

COMMENT ON COLUMN ASU.TRESAN.FL_ZAKL IS 'Признак подписи результата (0 - не подписан, 1-подписан)'
/

COMMENT ON COLUMN ASU.TRESAN.FL_PATFIRST IS 'Впервые ли выявлена патология'
/

COMMENT ON COLUMN ASU.TRESAN.FK_PATID IS 'Служебное поле'
/

COMMENT ON COLUMN ASU.TRESAN.FN_RES2 IS 'Служебное поле'
/

COMMENT ON COLUMN ASU.TRESAN.FK_BLOBID2 IS 'Текстовый результат назначения для выписного эпикриза'
/

COMMENT ON COLUMN ASU.TRESAN.FK_BLOBID3 IS 'Текстовый результат назначения для санаторно-курортной карты'
/


--
-- TRESAN_BY_GUID  (Index) 
--
--  Dependencies: 
--   TRESAN (Table)
--
CREATE UNIQUE INDEX ASU.TRESAN_BY_GUID ON ASU.TRESAN
(FK_GUID)
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
-- TRESAN_BY_ID  (Index) 
--
--  Dependencies: 
--   TRESAN (Table)
--
CREATE UNIQUE INDEX ASU.TRESAN_BY_ID ON ASU.TRESAN
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          9472K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TRESAN_BY_ID_PACID  (Index) 
--
--  Dependencies: 
--   TRESAN (Table)
--
CREATE UNIQUE INDEX ASU.TRESAN_BY_ID_PACID ON ASU.TRESAN
(FK_ID, FK_PACID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          13056K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TRESAN_BY_ID_PACID_INS  (Index) 
--
--  Dependencies: 
--   TRESAN (Table)
--
CREATE UNIQUE INDEX ASU.TRESAN_BY_ID_PACID_INS ON ASU.TRESAN
(FK_ID, FD_INS, FK_PACID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          17920K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TRESAN_BY_INS  (Index) 
--
--  Dependencies: 
--   TRESAN (Table)
--
CREATE INDEX ASU.TRESAN_BY_INS ON ASU.TRESAN
(FD_INS)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          19072K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TRESAN_BY_NAZID_ZAKL  (Index) 
--
--  Dependencies: 
--   TRESAN (Table)
--
CREATE INDEX ASU.TRESAN_BY_NAZID_ZAKL ON ASU.TRESAN
(FK_NAZID, FL_ZAKL)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          17024K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TRESAN_BY_SMID_ZAKL  (Index) 
--
--  Dependencies: 
--   TRESAN (Table)
--
CREATE INDEX ASU.TRESAN_BY_SMID_ZAKL ON ASU.TRESAN
(FK_NAZID, FK_SMID, FL_ZAKL)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          24832K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TRESAN_PACID_ZAKL  (Index) 
--
--  Dependencies: 
--   TRESAN (Table)
--
CREATE INDEX ASU.TRESAN_PACID_ZAKL ON ASU.TRESAN
(FK_PACID, FL_ZAKL)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          16M
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TR_TRESAN  (Trigger) 
--
--  Dependencies: 
--   TRESAN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TR_TRESAN" 
     AFTER INSERT OR UPDATE OR DELETE ON ASU.TRESAN FOR EACH ROW
DISABLE
declare
     vID  number;
     vStr varchar2(2000);
     vTSMIDFK_SMID varchar(32);
       vTSMIDFK_BLOBID varchar(32);
       vTAMBULANCEFK_PACID varchar(32);
       vVNAZFK_NAZID varchar(32);
       vTPATNAMEFK_PATID varchar(32);
       vTNAZSOSFK_SOS varchar(32);
      
   begin
     if PKG_sync.v_is_repl = 0 then
       PKG_sync.v_is_repl := 2;
       if INSERTING then
         begin
          select t.fk_guid into  vTSMIDFK_SMID from asu.TSMID t where t.fk_id = :new.FK_SMID;
         exception when others then
           vTSMIDFK_SMID := null;
         end;
        begin
          select t.fk_guid into  vTSMIDFK_BLOBID from asu.TSMID t where t.fk_id = :new.FK_BLOBID;
         exception when others then
           vTSMIDFK_BLOBID := null;
         end;
        begin
          select t.fk_guid into  vTAMBULANCEFK_PACID from asu.TAMBULANCE t where t.fk_id = :new.FK_PACID;
         exception when others then
           vTAMBULANCEFK_PACID := null;
         end;
        begin
          select t.fk_guid into  vVNAZFK_NAZID from asu.tnazan t where t.fk_id = :new.FK_NAZID;
         exception when others then
           vVNAZFK_NAZID := null;
         end;
        begin
          select t.fk_guid into  vTPATNAMEFK_PATID from asu.TPATNAME t where t.fk_id = :new.FK_PATID;
         exception when others then
           vTPATNAMEFK_PATID := null;
         end;
        begin
          select t.fk_guid into  vTNAZSOSFK_SOS from asu.TNAZSOS t where t.fk_id = :new.FK_SOS;
         exception when others then
           vTNAZSOSFK_SOS := null;
         end;
       
         insert into TRESAN_s (FK_ID,FK_GUID,FD_INS,FC_RES,FN_RES,FC_TYPE,FK_VRACHID,FK_PATNAME,FC_COMENT,FK_COLID,FL_ZAKL,FL_PATFIRST,FN_RES2,FK_BLOBID2,FK_BLOBID3,FK_SMIDg,FK_BLOBIDg,FK_PACIDg,FK_NAZIDg,FK_PATIDg,FK_SOSg,fd_edittime)
              values (0,:new.FK_GUID,:new.FD_INS,:new.FC_RES,:new.FN_RES,:new.FC_TYPE,:new.FK_VRACHID,:new.FK_PATNAME,:new.FC_COMENT,:new.FK_COLID,:new.FL_ZAKL,:new.FL_PATFIRST,:new.FN_RES2,:new.FK_BLOBID2,:new.FK_BLOBID3,vTSMIDFK_SMID,vTSMIDFK_BLOBID,vTAMBULANCEFK_PACID,vVNAZFK_NAZID,vTPATNAMEFK_PATID,vTNAZSOSFK_SOS,systimestamp);
       elsif DELETING then
         insert into TRESAN_s (fk_id, fk_guid, fd_edittime)
              values (1, :old.fk_guid, systimestamp);
       elsif UPDATING then
         begin
          select t.fk_guid into  vTSMIDFK_SMID from asu.TSMID t where t.fk_id = :new.FK_SMID;
         exception when others then
           vTSMIDFK_SMID := null;
         end;
        begin
          select t.fk_guid into  vTSMIDFK_BLOBID from asu.TSMID t where t.fk_id = :new.FK_BLOBID;
         exception when others then
           vTSMIDFK_BLOBID := null;
         end;
        begin
          select t.fk_guid into  vTAMBULANCEFK_PACID from asu.TAMBULANCE t where t.fk_id = :new.FK_PACID;
         exception when others then
           vTAMBULANCEFK_PACID := null;
         end;
        begin
          select t.fk_guid into  vVNAZFK_NAZID from asu.tnazan t where t.fk_id = :new.FK_NAZID;
         exception when others then
           vVNAZFK_NAZID := null;
         end;
        begin
          select t.fk_guid into  vTPATNAMEFK_PATID from asu.TPATNAME t where t.fk_id = :new.FK_PATID;
         exception when others then
           vTPATNAMEFK_PATID := null;
         end;
        begin
          select t.fk_guid into  vTNAZSOSFK_SOS from asu.TNAZSOS t where t.fk_id = :new.FK_SOS;
         exception when others then
           vTNAZSOSFK_SOS := null;
         end;
       
         insert into TRESAN_s (FK_ID,FK_GUID,FD_INS,FC_RES,FN_RES,FC_TYPE,FK_VRACHID,FK_PATNAME,FC_COMENT,FK_COLID,FL_ZAKL,FL_PATFIRST,FN_RES2,FK_BLOBID2,FK_BLOBID3,FK_SMIDg,FK_BLOBIDg,FK_PACIDg,FK_NAZIDg,FK_PATIDg,FK_SOSg,fd_edittime)
              values (2,:new.FK_GUID,:new.FD_INS,:new.FC_RES,:new.FN_RES,:new.FC_TYPE,:new.FK_VRACHID,:new.FK_PATNAME,:new.FC_COMENT,:new.FK_COLID,:new.FL_ZAKL,:new.FL_PATFIRST,:new.FN_RES2,:new.FK_BLOBID2,:new.FK_BLOBID3,vTSMIDFK_SMID,vTSMIDFK_BLOBID,vTAMBULANCEFK_PACID,vVNAZFK_NAZID,vTPATNAMEFK_PATID,vTNAZSOSFK_SOS,systimestamp);
       end if;
       PKG_sync.v_is_repl := 0;
     end if;
   exception when others then
     begin
      PKG_sync.v_is_repl := 0;
      select seq_sync_log.nextval into vID from dual;
      vStr := SQLERRM;
      insert into tsync_log values (vID, systimestamp(3), vStr);
     end;
   end;
/
SHOW ERRORS;


--
-- TRESAN_SETPATALOGY  (Trigger) 
--
--  Dependencies: 
--   TRESAN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRESAN_SETPATALOGY" 
 BEFORE 
 INSERT OR UPDATE
 ON ASU.TRESAN  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  CURSOR cGetPacAge(pFK_PACID IN NUMBER) IS
     SELECT EXTRACT(YEAR FROM YEARS_MONTHS) Y,
            EXTRACT(MONTH FROM YEARS_MONTHS) M,
            EXTRACT(DAY FROM DAYS_HOURS) D
      FROM (SELECT NUMTOYMINTERVAL(MONTHS_BETWEEN(sysdate, fd_rojd), 'MONTH') YEARS_MONTHS,
                   NUMTODSINTERVAL(sysdate - ADD_MONTHS(fd_rojd, TRUNC(MONTHS_BETWEEN(sysdate, fd_rojd))), 'DAY') DAYS_HOURS
            FROM asu.tkarta
            WHERE tkarta.fk_id = pFK_PACID
            UNION ALL
            SELECT NUMTOYMINTERVAL(MONTHS_BETWEEN(sysdate, fd_rojd), 'MONTH') YEARS_MONTHS,
                   NUMTODSINTERVAL(sysdate - ADD_MONTHS(fd_rojd, TRUNC(MONTHS_BETWEEN(sysdate, fd_rojd))), 'DAY') DAYS_HOURS
            FROM asu.tambulance
            WHERE tambulance.fk_id = pFK_PACID);

     
  CURSOR cLM (pFK_SMID NUMBER) IS
    SELECT/*+rule*/ FN_LOW_M, FN_HI_M, FN_LOW_W, FN_HI_W, FC_TYPE, FP_PAT
      FROM TSMID
     WHERE FK_ID = pFK_SMID;
  CURSOR cIsSubNorm (pFK_SMID NUMBER) IS
    SELECT /*+rule*/FK_ID FROM TSMIDNORMS WHERE FK_SMID=pFK_SMID;
  CURSOR cSubNorm (pFK_SMID NUMBER, pFN_Y NUMBER, pFN_M NUMBER, pFN_D NUMBER) IS
    SELECT/*+rule*/ FN_LOW_M, FN_HI_M, FN_LOW_W, FN_HI_W, GET_TYPE_FROM_SMID(FK_SMID),
                    FL_LOW_M_EQ, FN_HI_M_EQ, FN_LOW_EQ, FN_HI_EQ, FN_ONE_RES_M, FN_ONE_RES_W
      FROM TSMIDNORMS
     WHERE FK_SMID = pFK_SMID AND pFN_Y * 365 + pFN_M * 31 + pFN_D  BETWEEN FN_YEAR1 * 365 + FN_MOUNTH_1 * 31 + FN_DAY_1 AND FN_YEAR2 * 365 + FN_MOUNTH_2 * 31 + FN_DAY_2;
  CURSOR cPatW (pVal NUMBER) IS
    SELECT/*+rule*/ FK_ID
      FROM TPATNAME
     WHERE FN_LOWW < pVal
       AND (   FN_HIGHW > pVal
            OR FN_HIGHW IS NULL);
  CURSOR cPatM (pVal NUMBER) IS
    SELECT/*+rule*/ FK_ID
      FROM TPATNAME
     WHERE FN_LOWM < pVal
       AND (   FN_HIGHM > pVal
            OR FN_HIGHM IS NULL);
  nMHigh NUMBER;
  nMLow NUMBER;
  nWHigh NUMBER;
  nWLow NUMBER;
  cType VARCHAR2 (30);
  nPat NUMBER;
  nSex NUMBER;
  nRazn NUMBER;
  nMHigh1 NUMBER;
  nMLow1 NUMBER;
  nWHigh1 NUMBER;
  nWLow1 NUMBER;
  cType1 VARCHAR2 (30);
  nPat1 NUMBER;
  i NUMBER;
  
  nY NUMBER;
  nM NUMBER;
  nD NUMBER;
  
  nFL_LOW_M_EQ NUMBER;
  nFN_HI_M_EQ NUMBER;
  nFN_LOW_EQ NUMBER;
  nFN_HI_EQ NUMBER;
  nFN_ONE_RES_M NUMBER;
  nFN_ONE_RES_W NUMBER;
  nLeft NUMBER;
  nRight NUMBER;
BEGIN
  /*sam*/
  IF insnaz.bins THEN
    RETURN;
  END IF;
  /*sam*/
/*  if :NEW.FN_RES=:OLD.FN_RES AND :NEW.FK_BLOBID=:OLD.FK_BLOBID then
    RETURN;
  end if;
*/
  IF :NEW.FK_PATID <> :OLD.FK_PATID THEN
    RETURN;
/*  ELSIF :NEW.FN_RES = :OLD.FN_RES THEN
    RETURN;
  ELSIF :NEW.FK_BLOBID = :OLD.FK_BLOBID THEN
    RETURN; --Внимание!!!!!!!!!! Было раскомметнированно!!!!!!!!!!!
*/END IF;
  nSex  := GET_SEX (:NEW.FK_PACID);
  OPEN cIsSubNorm(:NEW.FK_SMID);
  FETCH cIsSubNorm INTO i;
  IF cIsSubNorm%NOTFOUND THEN
    Open cLM(:NEW.FK_SMID);
    FETCH cLM INTO nMLow, nMHigh, nWLow, nWHigh, cType, nPat;
    CLOSE cLM;
  ELSE
    nPat:=NULL;
    
    OPEN cGetPacAge(:NEW.FK_PACID);
    Fetch cGetPacAge INTO  nY, nM, nD;
    Close cGetPacAge;
    OPEN cSubNorm (:NEW.FK_SMID,nY, nM, nD);
    FETCH cSubNorm INTO nMLow, nMHigh, nWLow, nWHigh, cType, nFL_LOW_M_EQ, nFN_HI_M_EQ, nFN_LOW_EQ, nFN_HI_EQ, nFN_ONE_RES_M, nFN_ONE_RES_W;
    IF cSubNorm%NOTFOUND THEN
      OPEN cLM (:NEW.FK_SMID);
      FETCH cLM INTO nMLow, nMHigh, nWLow, nWHigh, cType, nPat;
      CLOSE cLM;
    END IF;
    CLOSE cSubNorm;
  END IF;
  CLOSE cIsSubNorm;
  OPEN cPatW (0);
  FETCH cPatW INTO :NEW.fk_patid;
  CLOSE cPatW;
  IF nSex = 0 THEN
--    if nWHigh is not null and nWLow is not null then
    IF cType = 'NUMBER' THEN
      -- если установлен признак принадлежнсти конкретному значению
      if nFN_ONE_RES_W is not null and nFN_ONE_RES_W = :NEW.FN_RES then
        OPEN cPatW (0);
        FETCH cPatW INTO :NEW.fk_patid;
        CLOSE cPatW;
        Return;
      else
        if ((:NEW.FN_RES > nWLow) OR (:NEW.FN_RES = nWLow and nFN_LOW_EQ = 1) or (nWLow = 0)) then
            nLeft := 0;
         else
            BEGIN
              OPEN cPatW ( ( (nWLow - :NEW.FN_RES) / nWLow) * 100);
              FETCH cPatW INTO :NEW.fk_patid;
              CLOSE cPatW;
              Return;
            EXCEPTION
              WHEN ZERO_DIVIDE THEN
               :NEW.FK_PATID := GET_MINPAT;
            END;
        end if;
        if ((:NEW.FN_RES < nWHigh) OR (:NEW.FN_RES = nWHigh and nFN_HI_EQ = 1) or (nWHigh = 0)) then
            nRight := 0;
         else
           BEGIN
             OPEN cPatW ( ( (:NEW.FN_RES - nWHigh) / nWHigh) * 100);
             FETCH cPatW INTO :NEW.fk_patid;
             CLOSE cPatW;
             RETURN;
           EXCEPTION
             WHEN ZERO_DIVIDE THEN
               :NEW.FK_PATID := GET_MINPAT;
           END;
        end if;
        
        OPEN cPatW (0);
        FETCH cPatW INTO :NEW.fk_patid;
        CLOSE cPatW;
        RETURN;
     end if;
/*
      IF  (:NEW.FN_RES BETWEEN nWLow AND nWHigh) and ()
      THEN
        OPEN cPatW (0);
        FETCH cPatW INTO :NEW.fk_patid;
        CLOSE cPatW;
        RETURN;
      ELSIF :NEW.FN_RES < nWLow THEN
        BEGIN
          OPEN cPatW ( ( (nWLow - :NEW.FN_RES) / nWLow) * 100);
          FETCH cPatW INTO :NEW.fk_patid;
          CLOSE cPatW;
        EXCEPTION
          WHEN ZERO_DIVIDE THEN
            :NEW.FK_PATID := GET_MINPAT;
        END;
        RETURN;
      ELSIF :NEW.FN_RES > nWHigh THEN
        BEGIN
          OPEN cPatW ( ( (:NEW.FN_RES - nWHigh) / nWHigh) * 100);
          FETCH cPatW INTO :NEW.fk_patid;
          CLOSE cPatW;
        EXCEPTION
          WHEN ZERO_DIVIDE THEN
            :NEW.FK_PATID := GET_MINPAT;
        END;
        RETURN;
      END IF;
*/
------------------ DUALNUM
    ELSIF cType = 'DUALNUM' THEN
      IF    (    :NEW.FN_RES BETWEEN nWLow AND nWHigh
             AND :NEW.FN_RES2 BETWEEN nWLow AND nWHigh)
/*         OR (    nWLow = 0
             AND nWHigh = 0)*/
      THEN
        OPEN cPatW (0);
        FETCH cPatW INTO :NEW.fk_patid;
        CLOSE cPatW;
        RETURN;
      ELSIF :NEW.FN_RES < nWLow THEN
        BEGIN
          OPEN cPatW ( ( (nWLow - :NEW.FN_RES) / nWLow) * 100);
          FETCH cPatW INTO :NEW.fk_patid;
          CLOSE cPatW;
        EXCEPTION
          WHEN ZERO_DIVIDE THEN
            :NEW.FK_PATID := GET_MINPAT;
        END;
        RETURN;
      ELSIF :NEW.FN_RES2 < nWLow THEN
        BEGIN
          OPEN cPatW ( ( (nWLow - :NEW.FN_RES2) / nWLow) * 100);
          FETCH cPatW INTO :NEW.fk_patid;
          CLOSE cPatW;
        EXCEPTION
          WHEN ZERO_DIVIDE THEN
            :NEW.FK_PATID := GET_MINPAT;
        END;
        RETURN;
      ELSIF :NEW.FN_RES > nWHigh THEN
        BEGIN
          OPEN cPatW ( ( (:NEW.FN_RES - nWHigh) / nWHigh) * 100);
          FETCH cPatW INTO :NEW.fk_patid;
          CLOSE cPatW;
        EXCEPTION
          WHEN ZERO_DIVIDE THEN
            :NEW.FK_PATID := GET_MINPAT;
        END;
        RETURN;
      ELSIF :NEW.FN_RES2 > nWHigh THEN
        BEGIN
          OPEN cPatW ( ( (:NEW.FN_RES2 - nWHigh) / nWHigh) * 100);
          FETCH cPatW INTO :NEW.fk_patid;
          CLOSE cPatW;
        EXCEPTION
          WHEN ZERO_DIVIDE THEN
            :NEW.FK_PATID := GET_MINPAT;
        END;
        RETURN;
      END IF;
------------------
    ELSIF cType = 'COMBOBOX' THEN
      OPEN cLM (:NEW.FK_BLOBID);
      FETCH cLM INTO nMLow1, nMHigh1, nWLow1, nWHigh1, cType1, nPat1;
      CLOSE cLM;
      IF nPat1 = 1 THEN
        :NEW.FK_PATID := GET_MINPAT;
        RETURN;
      ELSIF    nPat1 = 0
            OR nPat1 IS NULL THEN
        IF cType1 = 'NUMBER' THEN
          IF    (:NEW.FN_RES BETWEEN nWLow AND nWHigh)
/*             OR (    nWLow = 0
                 AND nWHigh = 0)
*/           OR (    nWLow IS NULL
                 AND nWHigh IS NULL)
             OR (    :NEW.FN_RES < nWHigh
                 AND nWLow IS NULL)
             OR (    :NEW.FN_RES > nWLow
                 AND nWHigh IS NULL) THEN
            OPEN cPatW (0);
            FETCH cPatW INTO :NEW.fk_patid;
            CLOSE cPatW;
            RETURN;
          ELSIF :NEW.FN_RES < nWLow THEN
            BEGIN
              OPEN cPatW ( ( (nWLow - :NEW.FN_RES) / nWLow) * 100);
              FETCH cPatW INTO :NEW.fk_patid;
              CLOSE cPatW;
            EXCEPTION
              WHEN ZERO_DIVIDE THEN
                :NEW.FK_PATID := GET_MINPAT;
            END;
            RETURN;
          ELSIF :NEW.FN_RES > nWHigh THEN
            BEGIN
              OPEN cPatW ( ( (:NEW.FN_RES - nWHigh) / nWHigh) * 100);
              FETCH cPatW INTO :NEW.fk_patid;
              CLOSE cPatW;
            EXCEPTION
              WHEN ZERO_DIVIDE THEN
                :NEW.FK_PATID := GET_MINPAT;
            END;
            RETURN;
          END IF;
        ELSIF cType1 = 'DUALNUM' THEN
          IF    (    :NEW.FN_RES BETWEEN nWLow AND nWHigh
                 AND :NEW.FN_RES2 BETWEEN nWLow AND nWHigh)
/*             OR (    nWLow = 0
                 AND nWHigh = 0)*/ THEN
            OPEN cPatW (0);
            FETCH cPatW INTO :NEW.fk_patid;
            CLOSE cPatW;
            RETURN;
          ELSIF :NEW.FN_RES < nWLow THEN
            BEGIN
              OPEN cPatW ( ( (nWLow - :NEW.FN_RES) / nWLow) * 100);
              FETCH cPatW INTO :NEW.fk_patid;
              CLOSE cPatW;
            EXCEPTION
              WHEN ZERO_DIVIDE THEN
                :NEW.FK_PATID := GET_MINPAT;
            END;
            RETURN;
          ELSIF :NEW.FN_RES2 < nWLow THEN
            BEGIN
              OPEN cPatW ( ( (nWLow - :NEW.FN_RES2) / nWLow) * 100);
              FETCH cPatW INTO :NEW.fk_patid;
              CLOSE cPatW;
            EXCEPTION
              WHEN ZERO_DIVIDE THEN
                :NEW.FK_PATID := GET_MINPAT;
            END;
            RETURN;
          ELSIF :NEW.FN_RES > nWHigh THEN
            BEGIN
              OPEN cPatW ( ( (:NEW.FN_RES - nWHigh) / nWHigh) * 100);
              FETCH cPatW INTO :NEW.fk_patid;
              CLOSE cPatW;
            EXCEPTION
              WHEN ZERO_DIVIDE THEN
                :NEW.FK_PATID := GET_MINPAT;
            END;
            RETURN;
          ELSIF :NEW.FN_RES2 > nWHigh THEN
            BEGIN
              OPEN cPatW ( ( (:NEW.FN_RES2 - nWHigh) / nWHigh) * 100);
              FETCH cPatW INTO :NEW.fk_patid;
              CLOSE cPatW;
            EXCEPTION
              WHEN ZERO_DIVIDE THEN
                :NEW.FK_PATID := GET_MINPAT;
            END;
            RETURN;
          END IF;
        END IF;
      END IF;
    END IF;
--    end if;
  ELSIF nSex = 1 THEN
    IF cType = 'NUMBER' THEN
      -- если установлен признак принадлежнсти конкретному значению
      if nFN_ONE_RES_M is not null and nFN_ONE_RES_M = :NEW.FN_RES then
        OPEN cPatM (0);
        FETCH cPatM INTO :NEW.fk_patid;
        CLOSE cPatM;
        Return;
      else
        if ((:NEW.FN_RES > nMLow) OR (:NEW.FN_RES = nMLow and nFL_LOW_M_EQ = 1) or (nMLow = 0)) then
            nLeft := 0;
         else
            BEGIN
              OPEN cPatM ( ( (nMLow - :NEW.FN_RES) / nMLow) * 100);
              FETCH cPatM INTO :NEW.fk_patid;
              CLOSE cPatM;
              Return;
            EXCEPTION
              WHEN ZERO_DIVIDE THEN
               :NEW.FK_PATID := GET_MINPAT;
            END;
        end if;
        if ((:NEW.FN_RES < nMHigh) OR (:NEW.FN_RES = nMHigh and nFN_HI_M_EQ = 1) or (nMHigh = 0)) then
            nRight := 0;
         else
           BEGIN
             OPEN cPatM ( ( (:NEW.FN_RES - nMHigh) / nMHigh) * 100);
             FETCH cPatM INTO :NEW.fk_patid;
             CLOSE cPatM;
             RETURN;
           EXCEPTION
             WHEN ZERO_DIVIDE THEN
               :NEW.FK_PATID := GET_MINPAT;
           END;
        end if;

        OPEN cPatM (0);
        FETCH cPatM INTO :NEW.fk_patid;
        CLOSE cPatM;
        RETURN;
     end if;
-------------------------------
    ELSIF cType = 'DUALNUM' THEN
      IF    (    :NEW.FN_RES BETWEEN nMLow AND nMHigh
             AND :NEW.FN_RES2 BETWEEN nMLow AND nMHigh)
/*         OR (    nMLow = 0
             AND nMHigh = 0)*/ THEN
        OPEN cPatM (0);
        FETCH cPatM INTO :NEW.fk_patid;
        CLOSE cPatM;
        RETURN;
      ELSIF :NEW.FN_RES < nMLow THEN
        BEGIN
          OPEN cPatM ( ( (nMLow - :NEW.FN_RES) / nMLow) * 100);
          FETCH cPatM INTO :NEW.fk_patid;
          CLOSE cPatM;
        EXCEPTION
          WHEN ZERO_DIVIDE THEN
            :NEW.FK_PATID := GET_MINPAT;
        END;
        RETURN;
      ELSIF :NEW.FN_RES2 < nMLow THEN
        BEGIN
          OPEN cPatM ( ( (nMLow - :NEW.FN_RES2) / nMLow) * 100);
          FETCH cPatM INTO :NEW.fk_patid;
          CLOSE cPatM;
        EXCEPTION
          WHEN ZERO_DIVIDE THEN
            :NEW.FK_PATID := GET_MINPAT;
        END;
        RETURN;
      ELSIF :NEW.FN_RES > nMHigh THEN
        BEGIN
          OPEN cPatM ( ( (:NEW.FN_RES - nMHigh) / nMHigh) * 100);
          FETCH cPatM INTO :NEW.fk_patid;
          CLOSE cPatM;
        EXCEPTION
          WHEN ZERO_DIVIDE THEN
            :NEW.FK_PATID := GET_MINPAT;
        END;
        RETURN;
      ELSIF :NEW.FN_RES2 > nMHigh THEN
        BEGIN
          OPEN cPatM ( ( (:NEW.FN_RES2 - nMHigh) / nMHigh) * 100);
          FETCH cPatM INTO :NEW.fk_patid;
          CLOSE cPatM;
        EXCEPTION
          WHEN ZERO_DIVIDE THEN
            :NEW.FK_PATID := GET_MINPAT;
        END;
        RETURN;
      END IF;
-------------------------------
    ELSIF cType = 'COMBOBOX' THEN
      OPEN cLM (:NEW.FK_BLOBID);
      FETCH cLM INTO nMLow1, nMHigh1, nWLow1, nWHigh1, cType1, nPat1;
      CLOSE cLM;
      IF nPat1 = 1 THEN
        :NEW.FK_PATID := GET_MINPAT;
        RETURN;
      ELSIF    nPat1 = 0
            OR nPat1 IS NULL THEN
        IF cType1 = 'NUMBER' THEN
          IF    (:NEW.FN_RES BETWEEN nMLow AND nMHigh)
/*             OR (    nMLow = 0
                 AND nMHigh = 0)
*/           OR (    nMLow IS NULL
                 AND nMHigh IS NULL)
             OR (    :NEW.FN_RES < nMHigh
                 AND nMLow IS NULL)
             OR (    :NEW.FN_RES > nMLow
                 AND nMHigh IS NULL) THEN
            OPEN cPatM (0);
            FETCH cPatM INTO :NEW.fk_patid;
            CLOSE cPatM;
            RETURN;
          ELSIF :NEW.FN_RES < nMLow THEN
            BEGIN
              OPEN cPatM ( ( (nMLow - :NEW.FN_RES) / nMLow) * 100);
              FETCH cPatM INTO :NEW.fk_patid;
              CLOSE cPatM;
            EXCEPTION
              WHEN ZERO_DIVIDE THEN
                :NEW.FK_PATID := GET_MINPAT;
            END;
            RETURN;
          ELSIF :NEW.FN_RES > nMHigh THEN
            BEGIN
              OPEN cPatM ( ( (:NEW.FN_RES - nMHigh) / nMHigh) * 100);
              FETCH cPatM INTO :NEW.fk_patid;
              CLOSE cPatM;
            EXCEPTION
              WHEN ZERO_DIVIDE THEN
                :NEW.FK_PATID := GET_MINPAT;
            END;
            RETURN;
          END IF;
-------------------------------
        ELSIF cType1 = 'DUALNUM' THEN
          IF    (    :NEW.FN_RES BETWEEN nMLow AND nMHigh
                 AND :NEW.FN_RES2 BETWEEN nMLow AND nMHigh)
  /*           OR (    nMLow = 0
                 AND nMHigh = 0)*/ THEN
            OPEN cPatM (0);
            FETCH cPatM INTO :NEW.fk_patid;
            CLOSE cPatM;
            RETURN;
          ELSIF :NEW.FN_RES < nMLow THEN
            BEGIN
              OPEN cPatM ( ( (nMLow - :NEW.FN_RES) / nMLow) * 100);
              FETCH cPatM INTO :NEW.fk_patid;
              CLOSE cPatM;
            EXCEPTION
              WHEN ZERO_DIVIDE THEN
                :NEW.FK_PATID := GET_MINPAT;
            END;
            RETURN;
          ELSIF :NEW.FN_RES2 < nMLow THEN
            BEGIN
              OPEN cPatM ( ( (nMLow - :NEW.FN_RES2) / nMLow) * 100);
              FETCH cPatM INTO :NEW.fk_patid;
              CLOSE cPatM;
            EXCEPTION
              WHEN ZERO_DIVIDE THEN
                :NEW.FK_PATID := GET_MINPAT;
            END;
            RETURN;
          ELSIF :NEW.FN_RES > nMHigh THEN
            BEGIN
              OPEN cPatM ( ( (:NEW.FN_RES - nMHigh) / nMHigh) * 100);
              FETCH cPatM INTO :NEW.fk_patid;
              CLOSE cPatM;
            EXCEPTION
              WHEN ZERO_DIVIDE THEN
                :NEW.FK_PATID := GET_MINPAT;
            END;
            RETURN;
          ELSIF :NEW.FN_RES2 > nMHigh THEN
            BEGIN
              OPEN cPatM ( ( (:NEW.FN_RES2 - nMHigh) / nMHigh) * 100);
              FETCH cPatM INTO :NEW.fk_patid;
              CLOSE cPatM;
            EXCEPTION
              WHEN ZERO_DIVIDE THEN
                :NEW.FK_PATID := GET_MINPAT;
            END;
            RETURN;
          END IF;
-------------------------------
        END IF;
      END IF;
    END IF;
  END IF;
END;
/
SHOW ERRORS;


--
-- TRESAN_SETNAZ_STATUS  (Trigger) 
--
--  Dependencies: 
--   TRESAN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRESAN_SETNAZ_STATUS" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON asu.TRESAN
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  sMODULENAME VARCHAR2(64);
BEGIN
  --SELECT PROGRAM commented by A.Nakorjakov 22.06.09
  SELECT MAX(PROGRAM) --added by A.Nakorjakov 22.06.09
    INTO sMODULENAME
    FROM V$SESSION
   WHERE AUDSID = USERENV('SESSIONID');
   
  -- deemaric add 18.02.2009   sMODULENAME = 'modImpData.exe'
  -- при экспорте/импорте "портился" статус анализов 
  IF insnaz.bins OR (sMODULENAME = 'CorrectKarta.exe') OR (sMODULENAME = 'CopyPeople.exe') OR (sMODULENAME = 'modImpData.exe')
  THEN
    RETURN;
  END IF;
  insnaz.bins := TRUE;

  IF DELETING
  THEN
    UPDATE ASU.TNAZAN
       SET FK_NAZSOSID = GET_NAZ_PROCESS
     WHERE FK_ID = :OLD.FK_NAZID;
    UPDATE ASU.VNAZ
       SET FK_NAZSOSID = GET_NAZ_PROCESS
     WHERE FK_ID = :NEW.FK_NAZID;
  ELSE
    UPDATE ASU.TNAZAN
       SET FK_NAZSOSID = GET_NAZ_PROCESS
     WHERE FK_ID = :NEW.FK_NAZID;
    UPDATE ASU.VNAZ
       SET FK_NAZSOSID = GET_NAZ_PROCESS
     WHERE FK_ID = :NEW.FK_NAZID;
  END IF;

  insnaz.bins := FALSE;
EXCEPTION
  WHEN OTHERS THEN
    insnaz.bins := FALSE;
    RAISE;
END;
/
SHOW ERRORS;


--
-- TRESAN_INSERT  (Trigger) 
--
--  Dependencies: 
--   TRESAN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRESAN_INSERT" 
 BEFORE 
 INSERT
 ON ASU.TRESAN  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  VRACHID NUMBER;
   LD_BLOOD_GROUP NUMBER;
   LICH_DANDON_REZUS NUMBER;
   nTmp Number;
   nTmpPacInfo Number;  
Begin
  /*added by A.Nakorjakov 071208 started*/
  if :new.fk_guid is null then
     :new.fk_guid := sys_guid();
  end if;
  /*added by A.Nakorjakov 071208 finished*/
    
  if insnaz.bins then
    return;
  end if;
  insnaz.bins:=true;
--  SELECT SEQ_TRES.NEXTVAL INTO :NEW.FK_ID FROM DUAL;\
  select seq_tkarta.nextval into :new.fk_id from dual;
  insert into vres(FK_ID,FK_SMID,FD_INS,FC_RES,FK_BLOBID,FN_RES,FC_TYPE,FK_VRACHID,FK_PACID,
                   FK_NAZID,FK_PATID,FC_COMENT,FK_SOS,FL_ZAKL,fl_patfirst)
    values (:new.FK_ID, :new.FK_SMID, :new.FD_INS, :new.FC_RES, :new.FK_BLOBID, :new.FN_RES, :new.FC_TYPE, :new.FK_VRACHID, :new.FK_PACID,
            :new.FK_NAZID, :new.fk_patid, :new.FC_COMENT, :new.FK_SOS, :new.fl_zakl, :new.fl_patfirst);


 --Added by A.nakorjakov 20-08-2007
    --Вносим группу крови?
    if :new.FK_SMID = stat.pkg_statutil.get_smidid('GR_KROVI_CMB') then
        nTmp:=asu.pkg_donor.get_bloodgr_id(:new.fk_pacid);

        --определение ид группы крови в ветки Пациент - Рег.карта - Личные даные донора - Группа крови
        LD_BLOOD_GROUP := stat.pkg_statutil.get_smidid('LD_BLOOD_GROUP');
        select max(fk_id) into nTmpPacInfo
        from asu.tsmid
        where fc_synonim = (select max(fc_synonim)
            from asu.tsmid where fk_id = :new.fk_blobid)
            and fk_owner = LD_BLOOD_GROUP;

        begin
          --известна группа крови?
          if (nTmp = -1) then
              --вставка данных
              if (nTmpPacInfo is not null) then
                insert into asu.tib (fk_pacid,fk_smid,fk_smeditid,fk_vrachid) values
                  (asu.pkg_regist_pacfunc.GET_PEPL_ID(:new.fk_pacid),nTmpPacInfo,LD_BLOOD_GROUP,:new.fk_vrachid);
              end if;
          else
              if (nTmp<>nTmpPacInfo) then --update только если вносимое значение отличается от записанного
                  --определение ид группы крови в ветки Пациент - Рег.карта - Личные даные донора - Группа крови
                  update asu.tib set tib.fk_smid = nTmpPacInfo, tib.fk_vrachid = :new.fk_vrachid
                      where tib.fk_pacid = asu.pkg_regist_pacfunc.GET_PEPL_ID(:new.fk_pacid) and tib.fk_smeditid = LD_BLOOD_GROUP;
              end if;
          end if;
        exception when no_data_found then
          null;
        end;
    end if;
    --Вносим группу резус?
    if :new.fk_smid = stat.pkg_statutil.get_smidid('LAB_LICH_DANDON_REZUS_') then
        nTmp:=asu.pkg_donor .get_rezus_id(:new.fk_pacid);

        begin
          --определение ид резуса в ветки Пациент - Рег.карта - Личные даные донора - Резус
          LICH_DANDON_REZUS := ASU.PKG_DONOR.GET_LICHDANDON_REZUS;
          select max(fk_id) into nTmpPacInfo
          from asu.tsmid
          where fc_synonim = (select max(fc_synonim) from asu.tsmid where fk_id = :new.fk_blobid)
              and fk_owner = LICH_DANDON_REZUS;

          --известен резус?
          if (nTmp = -1) then
              if (nTmpPacInfo is not null) then
                --определение ид группы крови в ветки Пациент - Рег.карта - Личные даные донора - Группа крови
                insert into asu.tib (fk_pacid,fk_smid,fk_smeditid,fk_vrachid) values
                  (asu.pkg_regist_pacfunc.GET_PEPL_ID(:new.fk_pacid),nTmpPacInfo,LICH_DANDON_REZUS,:new.fk_vrachid);
              end if;
          else
              if (nTmp<>nTmpPacInfo) then --update только если вносимое значение отличается от записанного
                  update asu.tib set tib.fk_smid = nTmpPacInfo, tib.fk_vrachid = :new.fk_vrachid
                      where tib.fk_pacid = asu.pkg_regist_pacfunc.GET_PEPL_ID(:new.fk_pacid) and tib.fk_smeditid = LICH_DANDON_REZUS;
              end if;
          end if;
        exception when no_data_found then
          null;
        end;
    end if; 
    --Вносим ТИТР?
    if :new.fk_smid = stat.pkg_statutil.get_smidid('TITR_AMOUNT') then
        begin
        
          nTmpPacInfo := stat.pkg_statutil.GET_SMIDID('LD_TITR');
          select nvl(max(tib.fk_id), -1)
          into ntmp
          from asu.tib
           where tib.fk_pacid = asu.pkg_regist_pacfunc.get_pepl_id(:new.fk_pacid)
             and fk_smeditid = nTmpPacInfo;
             
          --известен ТИТР?
          if (nTmp = -1) then
            insert into asu.tib (fk_pacid,fk_smid,fk_smeditid,fk_vrachid,fd_date) values
              (asu.pkg_regist_pacfunc.GET_PEPL_ID(:new.fk_pacid),nTmpPacInfo,nTmpPacInfo,:new.fk_vrachid,trunc(sysdate));
          else
            update asu.tib set fd_date = trunc(sysdate)
                where fk_id = ntmp;
          end if;
          
        exception when no_data_found then
          null;
        end;
    end if;                    
  insnaz.bins:=false;
  exception
    when others then
      insnaz.bins:=false;
      raise;
End;
/
SHOW ERRORS;


--
-- TRESAN_DELETE  (Trigger) 
--
--  Dependencies: 
--   TRESAN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRESAN_DELETE" 
  AFTER DELETE ON ASU.TRESAN   REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
Begin
  if insnaz.bins then
    return;
  end if;
  insnaz.bins := true;

  delete from vres where fk_id = :old.fk_id;
  IF :OLD.FL_ZAKL = 1 THEN
    DELETE FROM TCLOBS WHERE FK_ID = :OLD.FK_BLOBID;
    DELETE FROM TCLOBS WHERE FK_ID = :OLD.FK_BLOBID2; --by TimurLan 05/10/06
    DELETE FROM TCLOBS WHERE FK_ID = :OLD.FK_BLOBID3; --by TimurLan 05/10/06
  END IF;

  insnaz.bins := false;
exception
  when others then
    insnaz.bins := false;
    raise;
End;
/
SHOW ERRORS;


--
-- TRESAN_AFTER_UPDATE  (Trigger) 
--
--  Dependencies: 
--   TRESAN (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRESAN_AFTER_UPDATE" 
AFTER  UPDATE  ON ASU.TRESAN REFERENCING
 NEW AS NEW
 OLD AS OLD
FOR EACH ROW
DECLARE
   VRACHID   NUMBER;
   LD_BLOOD_GROUP NUMBER;
   LICH_DANDON_REZUS NUMBER;
   nTmp Number;
   nTmpPacInfo Number;
BEGIN
   IF insnaz.bins THEN
      RETURN;
   END IF;
   insnaz.bins := TRUE;
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
          FL_ZAKL = :new.FL_ZAKL,
          FL_PATFIRST = :new.FL_PATFIRST
    WHERE fk_id = :old.FK_ID;
   
  --Added by A.nakorjakov 20-08-2007
    --Вносим группу крови?
    if (UPDATING('FK_BLOBID') or (UPDATING('FK_SMID'))) then
      if :new.FK_SMID = stat.pkg_statutil.get_smidid('GR_KROVI_CMB') then
          nTmp:=asu.pkg_donor.get_bloodgr_id(:new.fk_pacid);

          --определение ид группы крови в ветки Пациент - Рег.карта - Личные даные донора - Группа крови
          LD_BLOOD_GROUP := stat.pkg_statutil.get_smidid('LD_BLOOD_GROUP');
          select max(fk_id) into nTmpPacInfo
          from asu.tsmid
          where fc_synonim = (select max(fc_synonim)
              from asu.tsmid where fk_id = :new.fk_blobid)
              and fk_owner = LD_BLOOD_GROUP;

          begin
            --известна группа крови?
            if (nTmp = -1) then
                --вставка данных
                if (nTmpPacInfo is not null) then
                  
                  insert into asu.tib (fk_pacid,fk_smid,fk_smeditid,fk_vrachid) values
                    (asu.pkg_regist_pacfunc.GET_PEPL_ID(:new.fk_pacid),nTmpPacInfo,LD_BLOOD_GROUP,:new.fk_vrachid);
                end if;
            else
                if (nTmp<>nTmpPacInfo) then --update только если вносимое значение отличается от записанного
                    --определение ид группы крови в ветки Пациент - Рег.карта - Личные даные донора - Группа крови
                    update asu.tib set tib.fk_smid = nTmpPacInfo, tib.fk_vrachid = :new.fk_vrachid
                        where tib.fk_pacid = asu.pkg_regist_pacfunc.GET_PEPL_ID(:new.fk_pacid) and tib.fk_smeditid = LD_BLOOD_GROUP;
                end if;
            end if;
          exception when no_data_found then
            null;
          end;
      end if;
      --Вносим группу резус?
      if :new.fk_smid = stat.pkg_statutil.get_smidid('LAB_LICH_DANDON_REZUS_') then
          nTmp:=asu.pkg_donor.get_rezus_id(:new.fk_pacid);

          begin
            --определение ид резуса в ветки Пациент - Рег.карта - Личные даные донора - Резус
            LICH_DANDON_REZUS := ASU.PKG_DONOR.GET_LICHDANDON_REZUS;
            select max(fk_id) into nTmpPacInfo
            from asu.tsmid
            where fc_synonim = (select max(fc_synonim) from asu.tsmid where fk_id = :new.fk_blobid)
                and fk_owner = LICH_DANDON_REZUS;

            --известен резус?
            if (nTmp = -1) then
                if (nTmpPacInfo is not null) then
                  --определение ид группы крови в ветки Пациент - Рег.карта - Личные даные донора - Группа крови
                  insert into asu.tib (fk_pacid,fk_smid,fk_smeditid,fk_vrachid) values
                    (asu.pkg_regist_pacfunc.GET_PEPL_ID(:new.fk_pacid),nTmpPacInfo,LICH_DANDON_REZUS,:new.fk_vrachid);
                end if;
            else
                if (nTmp<>nTmpPacInfo) then --update только если вносимое значение отличается от записанного
                    update asu.tib set tib.fk_smid = nTmpPacInfo, tib.fk_vrachid = :new.fk_vrachid
                        where tib.fk_pacid = asu.pkg_regist_pacfunc.GET_PEPL_ID(:new.fk_pacid) and tib.fk_smeditid = LICH_DANDON_REZUS;
                end if;
            end if;
          exception when no_data_found then
            null;
          end;
      end if;          
    end if;
       
   insnaz.bins := FALSE;
EXCEPTION
   WHEN OTHERS THEN
      insnaz.bins := FALSE;
      RAISE;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TRESAN 
-- 
ALTER TABLE ASU.TRESAN ADD (
  CONSTRAINT TRESAN_BY_ID
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          9472K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ),
  CONSTRAINT TRESAN_BY_GUID
 UNIQUE (FK_GUID)
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

GRANT DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE ON ASU.TRESAN TO MMS
/

