ALTER TABLE ASU.VNAZ
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.VNAZ CASCADE CONSTRAINTS
/

--
-- VNAZ  (Table) 
--
CREATE TABLE ASU.VNAZ
(
  FK_ID           NUMBER(15)                    NOT NULL,
  FK_SMID         NUMBER(15),
  FC_REMARK       VARCHAR2(4000 BYTE),
  FD_NAZ          DATE,
  FD_RUN          DATE,
  FK_ROOMID       NUMBER(9)                     DEFAULT 0,
  FK_ISPOLID      NUMBER(15)                    DEFAULT 0,
  FK_VRACHID      NUMBER(15),
  FK_NAZSOSID     NUMBER(15),
  FK_PACID        NUMBER(15),
  FK_RESULTID     NUMBER(15),
  FC_NAME         VARCHAR2(100 BYTE),
  FL_PLAT         VARCHAR2(3 BYTE),
  FC_TYPE         VARCHAR2(20 BYTE),
  FL_IN_RASPIS    NUMBER(1)                     DEFAULT 0,
  FL_ISVRACHVIEW  NUMBER(1),
  FL_INS          NUMBER(1),
  FL_MORE_PUT     NUMBER(5)                     DEFAULT 0,
  FK_DOCID        NUMBER(15),
  FK_NAZTYPEID    NUMBER(15),
  FK_NAZOWNER     NUMBER(15)                    DEFAULT -1,
  FK_DIFFERID     NUMBER(15)                    DEFAULT -1,
  FK_OBOSNOVID    NUMBER(15)                    DEFAULT -1,
  FK_SINDROMID    NUMBER(15)                    DEFAULT -1
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          36512K
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

COMMENT ON TABLE ASU.VNAZ IS 'Назначения (TNAZLECH+TNAZAN+TNAZKONS+TNAZIS+TNAZAN)
  '
/

COMMENT ON COLUMN ASU.VNAZ.FK_ID IS 'SEQUENCE=[SEQ_TKARTA]'
/

COMMENT ON COLUMN ASU.VNAZ.FK_SMID IS 'Код проводимой процедуры'
/

COMMENT ON COLUMN ASU.VNAZ.FC_REMARK IS 'Комментарий'
/

COMMENT ON COLUMN ASU.VNAZ.FD_NAZ IS 'Дата создания назначения'
/

COMMENT ON COLUMN ASU.VNAZ.FD_RUN IS 'Дата регистрации/проведения назначения'
/

COMMENT ON COLUMN ASU.VNAZ.FK_ROOMID IS 'Кабинет проведения назначения'
/

COMMENT ON COLUMN ASU.VNAZ.FK_ISPOLID IS 'Код исполнителя назначения'
/

COMMENT ON COLUMN ASU.VNAZ.FK_VRACHID IS 'Код врача, проводившего исследования'
/

COMMENT ON COLUMN ASU.VNAZ.FK_NAZSOSID IS 'Состояние назначения(по справочнику TNAZSOS)'
/

COMMENT ON COLUMN ASU.VNAZ.FK_PACID IS 'Код пациента'
/

COMMENT ON COLUMN ASU.VNAZ.FK_RESULTID IS 'Служебное поле'
/

COMMENT ON COLUMN ASU.VNAZ.FC_NAME IS 'Название назначения'
/

COMMENT ON COLUMN ASU.VNAZ.FL_PLAT IS 'Признак необходимости оплаты назначения'
/

COMMENT ON COLUMN ASU.VNAZ.FC_TYPE IS 'Тип назначения'
/

COMMENT ON COLUMN ASU.VNAZ.FL_IN_RASPIS IS 'Признак присутствия назначения в расписании'
/

COMMENT ON COLUMN ASU.VNAZ.FL_ISVRACHVIEW IS 'Служебное поле'
/

COMMENT ON COLUMN ASU.VNAZ.FL_INS IS 'Служебное поле'
/

COMMENT ON COLUMN ASU.VNAZ.FL_MORE_PUT IS 'Служебное поле'
/

COMMENT ON COLUMN ASU.VNAZ.FK_NAZOWNER IS 'Код назначения'
/

COMMENT ON COLUMN ASU.VNAZ.FK_DIFFERID IS 'ID из TCLOBS (дифференциальная диагностика)'
/

COMMENT ON COLUMN ASU.VNAZ.FK_OBOSNOVID IS 'ID из TCLOBS (обоснование диагноза)'
/

COMMENT ON COLUMN ASU.VNAZ.FK_SINDROMID IS 'ID из TCLOBS (клинический синдром)'
/


--
-- VNAZ_BY_DATA_PACID  (Index) 
--
--  Dependencies: 
--   VNAZ (Table)
--
CREATE UNIQUE INDEX ASU.VNAZ_BY_DATA_PACID ON ASU.VNAZ
(FD_RUN, FK_PACID, FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          15232K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- VNAZ_BY_ID  (Index) 
--
--  Dependencies: 
--   VNAZ (Table)
--
CREATE UNIQUE INDEX ASU.VNAZ_BY_ID ON ASU.VNAZ
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          5760K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- VNAZ_BY_NAZOWNER  (Index) 
--
--  Dependencies: 
--   VNAZ (Table)
--
CREATE INDEX ASU.VNAZ_BY_NAZOWNER ON ASU.VNAZ
(FK_NAZOWNER)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          9840K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- VNAZ_BY_PACID_NAZOWNERID  (Index) 
--
--  Dependencies: 
--   VNAZ (Table)
--
CREATE INDEX ASU.VNAZ_BY_PACID_NAZOWNERID ON ASU.VNAZ
(FK_PACID, FK_NAZOWNER)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          10968K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- VNAZ_BY_SMID_PACID  (Index) 
--
--  Dependencies: 
--   VNAZ (Table)
--
CREATE INDEX ASU.VNAZ_BY_SMID_PACID ON ASU.VNAZ
(FK_SMID, FK_PACID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          12032K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- VNAZ_DOCID  (Index) 
--
--  Dependencies: 
--   VNAZ (Table)
--
CREATE INDEX ASU.VNAZ_DOCID ON ASU.VNAZ
(FK_DOCID)
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
-- VNAZ_FDNAZ  (Index) 
--
--  Dependencies: 
--   VNAZ (Table)
--
CREATE INDEX ASU.VNAZ_FDNAZ ON ASU.VNAZ
(FD_NAZ)
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
-- VNAZ_FK_NAZSOS_PACID  (Index) 
--
--  Dependencies: 
--   VNAZ (Table)
--
CREATE UNIQUE INDEX ASU.VNAZ_FK_NAZSOS_PACID ON ASU.VNAZ
(FK_NAZSOSID, FK_PACID, FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          12800K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- VNAZ_ISPOLID  (Index) 
--
--  Dependencies: 
--   VNAZ (Table)
--
CREATE INDEX ASU.VNAZ_ISPOLID ON ASU.VNAZ
(FK_ISPOLID, FK_SMID, FD_NAZ)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          9728K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- VNAZ_NAZSOSID_DATA  (Index) 
--
--  Dependencies: 
--   VNAZ (Table)
--
CREATE UNIQUE INDEX ASU.VNAZ_NAZSOSID_DATA ON ASU.VNAZ
(FK_NAZSOSID, FK_SMID, FD_RUN, FK_ID)
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
-- VNAZ$PACID$ROOMID  (Index) 
--
--  Dependencies: 
--   VNAZ (Table)
--
CREATE INDEX ASU.VNAZ$PACID$ROOMID ON ASU.VNAZ
(FK_ROOMID, FK_PACID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          10368K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- VNAZ_VRACHID  (Index) 
--
--  Dependencies: 
--   VNAZ (Table)
--
CREATE INDEX ASU.VNAZ_VRACHID ON ASU.VNAZ
(FK_VRACHID, FK_SMID, FK_NAZSOSID)
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
-- VNAZ_ALERT  (Trigger) 
--
--  Dependencies: 
--   VNAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."VNAZ_ALERT" 
  AFTER INSERT OR UPDATE-- OR DELETE 
  ON ASU.VNAZ REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW
DECLARE
  cTimeStamp VARCHAR2(32767);
  CURSOR c1 IS
    SELECT PKG_LOG.GET_CLIENT(CLIENT_INFO) CLIENT_INFO
      FROM V$SESSION
     WHERE AUDSID=USERENV('SESSIONID');
  CURSOR c2 IS
    SELECT * FROM SYS.DBMS_ALERT_INFO WHERE NAME LIKE 'NAZMON%';
BEGIN
  IF PKG_LISTPAT.GET_PATHID(:NEW.FK_SMID) <> GET_ANALID THEN
    FOR p in c2 LOOP

      FOR d in c1 LOOP
        cTimeStamp := TRIM(TO_CHAR(SYSDATE,'dd.mm.yyyy hh24:mi:ss ') || GET_SOTRNAME(d.CLIENT_INFO));
      END LOOP;

      if DELETING then  
        INSERT INTO TNAZMON (FC_MESSAGE,FC_REСIVER) VALUES (cTimeStamp||' VNAZ DELETE FK_ID='||TO_CHAR(:OLD.FK_ID),p.NAME);
        DBMS_ALERT.SIGNAL(p.NAME,cTimeStamp||' VNAZ DELETE FK_ID='||TO_CHAR(:OLD.FK_ID));
      elsif INSERTING then
        INSERT INTO TNAZMON (FC_MESSAGE,FC_REСIVER) VALUES (cTimeStamp||' VNAZ INSERT FK_ID='||TO_CHAR(:NEW.FK_ID),p.NAME);
        DBMS_ALERT.SIGNAL(p.NAME,cTimeStamp||' VNAZ INSERT FK_ID='||TO_CHAR(:NEW.FK_ID));
      elsif UPDATING then
        IF UPDATING('FK_NAZSOSID') AND (:NEW.FK_NAZSOSID <> :OLD.FK_NAZSOSID) THEN
          INSERT INTO TNAZMON (FC_MESSAGE,FC_REСIVER) VALUES (cTimeStamp||' VNAZ UPDATE FK_ID='||TO_CHAR(:OLD.FK_ID),p.NAME);
          DBMS_ALERT.SIGNAL(p.NAME,cTimeStamp||' VNAZ UPDATE FK_ID='||TO_CHAR(:OLD.FK_ID));
        END IF;
      end if;

    END LOOP;
  END IF;
END VNAZ_ALERT;
/
SHOW ERRORS;


--
-- VNAZ_DEL  (Trigger) 
--
--  Dependencies: 
--   VNAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."VNAZ_DEL" 
 BEFORE 
 DELETE
 ON ASU.VNAZ  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
LastKonsID number;
LastDate Date;
nidnew number;
--LastNazCount number;
CURSOR c1
  IS
    SELECT fk_id
      FROM tsmid
     START WITH fk_id = :old.fk_smid
    CONNECT BY PRIOR fk_owner = fk_id
     ORDER BY ROWNUM DESC;
BEGIN
  delete from asu.tkonsult_uslug where fk_nazid = :old.fk_id; -- Prihodko N. 08.07.2010
   IF INSNAZ.BINS THEN
     RETURN;
   END IF;
   INSNAZ.BINS:=TRUE;
   
   DELETE FROM asu.TNAZIS   WHERE FK_ID = :OLD.FK_ID;
   DELETE FROM asu.TNAZKONS WHERE FK_ID = :OLD.FK_ID;
   DELETE FROM asu.TNAZLECH WHERE FK_ID = :OLD.FK_ID;
   DELETE FROM asu.TNAZAN   WHERE FK_ID = :OLD.FK_ID;
   DELETE FROM asu.TTECHBOLEZNI WHERE FK_STIM = :OLD.FK_ID; --BY TIMURLAN
   DELETE FROM asu.TPRIEMNAZ WHERE FK_NAZID=:OLD.FK_ID AND FK_PARENTID=:OLD.FK_NAZOWNER;
   DELETE FROM asu.TRICHVIEWDATA WHERE FK_PACID =:OLD.FK_ID;
   DELETE FROM asu.VRES WHERE FK_NAZID =:OLD.FK_ID;
   
   /*из VRES удалают, но из Tres'ов не удаляется из-за флага INSNAZ.BINS*/
   DELETE FROM TRESIS   WHERE FK_NAZID = :OLD.FK_ID;
   DELETE FROM TRESKONS WHERE FK_NAZID = :OLD.FK_ID;
   DELETE FROM TRESLECH WHERE FK_NAZID = :OLD.FK_ID;
   DELETE FROM TRESAN   WHERE FK_NAZID = :OLD.FK_ID;
   /**/
   
   
   DELETE FROM asu.TPACLST WHERE NAZID =:OLD.FK_ID;
   delete from asu.TAMBTALON_NAZ WHERE FK_NAZID=:OLD.FK_ID;
   DELETE FROM asu.VNAZ_GUID WHERE FK_NAZID = :OLD.FK_ID; -- Prihodko N. 03.05.2012

   DELETE FROM asu.TCLOBS WHERE TCLOBS.FK_ID = :OLD.FK_OBOSNOVID;
   DELETE FROM asu.TCLOBS WHERE TCLOBS.FK_ID = :OLD.FK_DIFFERID;
   DELETE FROM asu.TCLOBS WHERE TCLOBS.FK_ID = :OLD.FK_SINDROMID;
   
   
   -- данный код для кардиоцентра.ю отлаживалась на хантах за не имением бызы
   if  (:old.fk_nazsosid = asu.Get_Vipnaz) or (:old.fk_nazsosid = asu.Get_NAZ_process)  then
    OPEN c1;
    FETCH c1 INTO nidnew;
    CLOSE c1;    
    
    if nidnew = get_konsid THEN    
      if :old.FK_SMID = ASU."GET_FIZIOTERAPEVT_KONS" then
       select Count(1) into LastKonsID from ASU.TresKOns where FK_PACID = :old.FK_PACID and FK_SMID = ASU."GET_FIZIOTERAPEVT_KONS" and FK_NAZID <> :old.FK_ID; 
       if LastKonsID > 0 then --Если есть выполненные консультации помимо текущей, ищем максималоное
        select FD_INS,FK_NAZID into LastDate, LastKonsID from (
         select FK_NAZID, FD_INS, ROW_NUMBER() over(partition by FK_PACID order by FD_INS DESC) as RN   from asu.TResKons 
          where  FK_PACID = :old.FK_PACID and FK_NAZID <> :old.FK_ID and FK_SMID = ASU."GET_FIZIOTERAPEVT_KONS") where RN = 1; 
           --Апдейтим значения 
           update ASU.Tlastnazs SET FK_FIZIOKONSID = LastKonsID, FD_FIZIOKONSINSDATE = LastDate where FK_PACID = :old.FK_PACID;
          else
           update ASU.Tlastnazs SET FK_FIZIOKONSID = NULL, FD_FIZIOKONSINSDATE = NULL where FK_PACID = :old.FK_PACID;
       end if; 
      else
       select Count(1) into LastKonsID from ASU.TresKOns where FK_PACID = :old.FK_PACID and FK_SMID <> ASU."GET_FIZIOTERAPEVT_KONS" and FK_NAZID <> :old.FK_ID; 
       if LastKonsID > 0 then --Если есть выполненные консультации помимо текущей, ищем максималоное
        select FD_INS,FK_NAZID into LastDate, LastKonsID from (
         select FK_NAZID, FD_INS, ROW_NUMBER() over(partition by FK_PACID order by FD_INS DESC) as RN   from asu.TResKons 
          where  FK_PACID = :old.FK_PACID and FK_NAZID <> :old.FK_ID and FK_SMID <> ASU."GET_FIZIOTERAPEVT_KONS") where RN = 1; 
           --Апдейтим значения 
           update ASU.Tlastnazs SET FK_KONSID = LastKonsID, FD_KONSINSDATE = LastDate where FK_PACID = :old.FK_PACID;
       else
           update ASU.Tlastnazs SET FK_KONSID = NULL, FD_KONSINSDATE = NULL where FK_PACID = :old.FK_PACID;
       end if; 
     end if;
    end if; 
    
    /*if nidnew = get_procid THEN     
     select Count(1)
         into LastKonsID
         from ASU.Treslech,
              (Select FK_ID
                 from ASU.TSMID
                where FL_SHOWANAL = 1
               connect by prior FK_ID = FK_OWNER
                start with FC_SYNONIM = 'PROC_FIZTER') TSM
         where FK_PACID = :old.FK_PACID 
          and TSM.FK_ID = TresLEch.FK_SMID
          and FK_NAZID <> :old.FK_ID;  
          
     if LastKonsID > 0 then 
          select FD_INS, FK_NAZID
            into LastDate, LastKonsID
            from (select FK_NAZID,
                         FD_INS,
                         ROW_NUMBER() over(partition by FK_PACID order by FD_INS DESC) as RN
                    from asu.TResLech,
                         (Select FK_ID
                            from ASU.TSMID
                           where FL_SHOWANAL = 1
                          connect by prior FK_ID = FK_OWNER
                           start with FC_SYNONIM = 'PROC_FIZTER') TSM
                   where TSM.FK_ID = TresLEch.FK_SMID
                     and FK_PACID = :old.FK_PACID
                     and FK_NAZID <> :old.FK_ID 
                  )
           where RN = 1;
          update ASU.Tlastnazs SET FK_FIZIOPROCID = LastKonsID, FD_FIZIOPROCINSDATE = LastDate where FK_PACID = :old.FK_PACID;       
     else
          update ASU.Tlastnazs SET FK_FIZIOPROCID = NULL, FD_FIZIOPROCINSDATE = NULL where FK_PACID = :old.FK_PACID;
     end if;              
    end if;  */  
   end if;
   
    insnaz.bins  := FALSE;
EXCEPTION
  WHEN OTHERS THEN
    insnaz.bins  := FALSE;
END;
/
SHOW ERRORS;


--
-- VNAZ_INSERT_XRAY  (Trigger) 
--
--  Dependencies: 
--   VNAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."VNAZ_INSERT_XRAY" 
 AFTER 
 INSERT
 ON ASU.VNAZ  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DISABLE
DECLARE
  CURSOR c1 IS SELECT COUNT(*) as CNT
                 FROM TSMID
                WHERE GET_OWNER_FROM_SMID(:NEW.FK_SMID) IN (SELECT FK_ID FROM TSMID WHERE FK_OWNER = GET_RG_ISSL);
  CNT NUMBER;
BEGIN
  OPEN c1;
  FETCH c1 INTO CNT;
  CLOSE c1;

  IF CNT > 0 THEN
    INSERT INTO TNAZMARK_X(FK_NAZID) VALUES(:NEW.FK_ID);
  END IF;
END; -- триггер отключен 13.05.2010 by Prihodko N. по истечению 2-ух месяцев удалить его и удалить таблицу TNAZMARK_X
/
SHOW ERRORS;


--
-- VNAZ_LOG  (Trigger) 
--
--  Dependencies: 
--   VNAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."VNAZ_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.VNAZ  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('VNAZ', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.FK_ID), :new.fk_id);
  elsif DELETING then
    PKG_LOG.Do_log('VNAZ', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_ID), null, :old.fk_id);
    PKG_LOG.Do_log('VNAZ', 'FK_SMID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_SMID), null, :old.fk_id);
    PKG_LOG.Do_log('VNAZ', 'FD_NAZ', 'DELETE', PKG_LOG.GET_VALUE(:old.FD_NAZ), null, :old.fk_id);
    PKG_LOG.Do_log('VNAZ', 'FD_RUN', 'DELETE', PKG_LOG.GET_VALUE(:old.FD_RUN), null, :old.fk_id);
    PKG_LOG.Do_log('VNAZ', 'FK_ROOMID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_ROOMID), null, :old.fk_id);
    PKG_LOG.Do_log('VNAZ', 'FK_ISPOLID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_ISPOLID), null, :old.fk_id);
    PKG_LOG.Do_log('VNAZ', 'FK_VRACHID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_VRACHID), null, :old.fk_id);
    PKG_LOG.Do_log('VNAZ', 'FK_NAZSOSID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_NAZSOSID), null, :old.fk_id);
    PKG_LOG.Do_log('VNAZ', 'FK_PACID', 'DELETE', PKG_LOG.GET_VALUE(:old.FK_PACID), null, :old.fk_id);

  elsif UPDATING then
    PKG_LOG.Do_log('VNAZ', 'FK_ID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_ID), PKG_LOG.GET_VALUE(:new.FK_ID), :old.fk_id);

    if UPDATING ('FK_SMID') AND PKG_LOG.GET_VALUE(:old.FK_SMID) <> PKG_LOG.GET_VALUE(:new.FK_SMID) then
      PKG_LOG.Do_log('VNAZ', 'FK_SMID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_SMID), PKG_LOG.GET_VALUE(:new.FK_SMID), :old.fk_id);
    end if;

    if UPDATING ('FD_NAZ') AND PKG_LOG.GET_VALUE(:old.FD_NAZ) <> PKG_LOG.GET_VALUE(:new.FD_NAZ) then
      PKG_LOG.Do_log('VNAZ', 'FD_NAZ', 'UPDATE', PKG_LOG.GET_VALUE(:old.FD_NAZ), PKG_LOG.GET_VALUE(:new.FD_NAZ), :old.fk_id);
    end if;

    if UPDATING ('FD_RUN') AND PKG_LOG.GET_VALUE(:old.FD_RUN) <> PKG_LOG.GET_VALUE(:new.FD_RUN) then
      PKG_LOG.Do_log('VNAZ', 'FD_RUN', 'UPDATE', PKG_LOG.GET_VALUE(:old.FD_RUN), PKG_LOG.GET_VALUE(:new.FD_RUN), :old.fk_id);
    end if;

    if UPDATING ('FK_ROOMID') AND PKG_LOG.GET_VALUE(:old.FK_ROOMID) <> PKG_LOG.GET_VALUE(:new.FK_ROOMID) then
      PKG_LOG.Do_log('VNAZ', 'FK_ROOMID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_ROOMID), PKG_LOG.GET_VALUE(:new.FK_ROOMID), :old.fk_id);
    end if;

    if UPDATING ('FK_ISPOLID') AND PKG_LOG.GET_VALUE(:old.FK_ISPOLID) <> PKG_LOG.GET_VALUE(:new.FK_ISPOLID) then
      PKG_LOG.Do_log('VNAZ', 'FK_ISPOLID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_ISPOLID), PKG_LOG.GET_VALUE(:new.FK_ISPOLID), :old.fk_id);
    end if;

    if UPDATING ('FK_VRACHID') AND PKG_LOG.GET_VALUE(:old.FK_VRACHID) <> PKG_LOG.GET_VALUE(:new.FK_VRACHID) then
      PKG_LOG.Do_log('VNAZ', 'FK_VRACHID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_VRACHID), PKG_LOG.GET_VALUE(:new.FK_VRACHID), :old.fk_id);
    end if;

    if UPDATING ('FK_NAZSOSID') AND PKG_LOG.GET_VALUE(:old.FK_NAZSOSID) <> PKG_LOG.GET_VALUE(:new.FK_NAZSOSID) then
      PKG_LOG.Do_log('VNAZ', 'FK_NAZSOSID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_NAZSOSID), PKG_LOG.GET_VALUE(:new.FK_NAZSOSID), :old.fk_id);
    end if;

    if UPDATING ('FK_PACID') AND PKG_LOG.GET_VALUE(:old.FK_PACID) <> PKG_LOG.GET_VALUE(:new.FK_PACID) then
      PKG_LOG.Do_log('VNAZ', 'FK_PACID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_PACID), PKG_LOG.GET_VALUE(:new.FK_PACID), :old.fk_id);
    end if;
  end if;
  null;
END VNAZ_LOG;
/
SHOW ERRORS;


--
-- VNAZ_OTKAZ  (Trigger) 
--
--  Dependencies: 
--   VNAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."VNAZ_OTKAZ" 
 AFTER UPDATE or INSERT
 ON ASU.VNAZ  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
declare
 nTmp number;
BEGIN
  if :new.FK_NAZSOSID=asu.get_vipnaz then

    --Узнаем, отках от госпитализации или нет
    Select count(1)
      into nTmp
      from ASU.TKarta,
           (select fk_id
              from asu.tsmid
             where fc_synonim = 'GOSPZAKL_OTKAZ'
               and rownum = 1) TOtkaz,
           asu.tuslvid
    where
      tkarta.fk_uslvidid = tuslvid.fk_id
        and
      tuslvid.fk_docid = TOtkaz.fk_id
       and
      Tkarta.FK_ID = :new.FK_PACID;
    --Если это стационарный пациент с отказанной госпитализацией
    --insert into asu.TTEST(fc_name) values(TO_CHAR(:new.FK_ID));
    if nTmp = 1 then
     select NVL(MAX(FK_ID),-1) into nTmp  from ASU.Tambtalon where FK_AMBID = :new.FK_PACID and FN_SOS = 0;
     --insert into asu.TTEST(fc_name) values(TO_CHAR(nTmp));
     --Если у стационарного есть талон, то тогда записываем на него все назначения
     if nTmp > 0 then
      --insert into asu.TTEST(fc_name) values('GO!');
      delete from asu.tambtalon_naz where FK_NAZID = :new.FK_ID;
      insert into asu.tambtalon_naz(fk_talonid,fk_ambid,fk_nazid) values (nTmp, :new.FK_PACID, :new.FK_ID);
     end if;
    end if;
  end if;
 END;
/
SHOW ERRORS;


--
-- VNAZ_UPDATE  (Trigger) 
--
--  Dependencies: 
--   VNAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."VNAZ_UPDATE" 
 BEFORE
 UPDATE
 ON ASU.VNAZ  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  IF (USERENV('CLIENT_INFO') is null) or (USERENV('CLIENT_INFO') <> '%MAIL%') THEN
    BEGIN
    -- ORIGINAL TRIGGER BODY BEGIN FROM HERE:

DECLARE
  CURSOR c1
  IS
    SELECT fk_id
      FROM tsmid
     START WITH fk_id = :new.fk_smid
    CONNECT BY PRIOR fk_owner = fk_id
     ORDER BY ROWNUM DESC;

  CURSOR c2
  IS
    SELECT fk_id
      FROM tsmid
     START WITH fk_id = :old.fk_smid
    CONNECT BY PRIOR fk_owner = fk_id
     ORDER BY ROWNUM DESC;

  nidnew   NUMBER;
  nidold   NUMBER;
  pCount   NUMBER;
  LastNazCount NUMBER;
  Lastdate date;
  LastKonsID number;
BEGIN

  if UPDATING ('FK_NAZSOSID') AND :old.FK_NAZSOSID <> :new.FK_NAZSOSID then
    UPDATE TPLAT_USLUG SET FP_SOS = :new.FK_NAZSOSID WHERE FK_NAZ = :new.fk_id;
    if :new.FK_NAZSOSID = GET_VIPNAZ then
        UPDATE TPLAT_USLUG SET FP_PRINTDOC = 0, FL_AGREED = 1 WHERE FK_NAZ = :new.fk_id;
    end if;
    if :new.FK_NAZSOSID = GET_NEVIP then
        UPDATE TPLAT_USLUG SET FP_PRINTDOC = 1 WHERE FK_NAZ = :new.fk_id;
    end if;

    if :new.FK_NAZSOSID = GET_NEYAV and :new.FC_REMARK = 'Самозапись' then
     --проверяем, а есть ли такая запись уже в списке
     select count(1) into pCount from Tneyavkaterm where FK_NAZID = :new.FK_ID;
     if pCount = 0 then
      insert into Tneyavkaterm(FK_NAZID) values (:new.FK_ID) ;
     end if;
    ELSE
     DELETE from  Tneyavkaterm where FK_NAZID = :new.FK_ID;
    end if;

  end if;

  IF insnaz.bins THEN
    RETURN;
  END IF;
  insnaz.bins  := TRUE;
  OPEN c1;
  OPEN c2;
  FETCH c1 INTO nidnew;
  FETCH c2 INTO nidold;
  CLOSE c1;
  CLOSE c2;
  IF nidnew <> nidold THEN
    insnaz.bins  := FALSE;
    raise_application_error (-20002, '=oo?y???ou?  ?yo???o  y?o ??nuo?ou VNAZ');
  END IF;
  IF nidnew = get_issledid THEN
    UPDATE tnazis
       SET fk_id = :new.fk_id,
           fk_smid = :new.fk_smid,
           fc_remark = :new.fc_remark,
           fd_naz = :new.fd_naz,
           fd_run = :new.fd_run,
           fk_roomid = :new.fk_roomid,
           fk_ispolid = :new.fk_ispolid,
           fk_vrachid = :new.fk_vrachid,
           fk_nazsosid = :new.fk_nazsosid,
           fk_pacid = :new.fk_pacid,
           fk_resultid = :new.fk_resultid,
           fc_name = :new.fc_name,
           fl_plat = :new.fl_plat,
           fc_type = :new.fc_type,
           fl_in_raspis = :new.fl_in_raspis,
           fl_isvrachview = :new.fl_isvrachview,
           fl_more_put = :new.fl_more_put,
           FK_NAZTYPEID = :new.FK_NAZTYPEID,
           FK_NAZOWNER = :NEW.FK_NAZOWNER
     WHERE fk_id = :old.fk_id;
  END IF;
  IF nidnew = get_konsid THEN
    UPDATE tnazkons
       SET fk_id = :new.fk_id,
           fk_smid = :new.fk_smid,
           fc_remark = :new.fc_remark,
           fd_naz = :new.fd_naz,
           fd_run = :new.fd_run,
           fk_roomid = :new.fk_roomid,
           fk_ispolid = :new.fk_ispolid,
           fk_vrachid = :new.fk_vrachid,
           fk_nazsosid = :new.fk_nazsosid,
           fk_pacid = :new.fk_pacid,
           fk_resultid = :new.fk_resultid,
           fc_name = :new.fc_name,
           fl_plat = :new.fl_plat,
           fc_type = :new.fc_type,
           fl_in_raspis = :new.fl_in_raspis,
           fl_isvrachview = :new.fl_isvrachview,
           fl_more_put = :new.fl_more_put,
           FK_NAZTYPEID = :new.FK_NAZTYPEID,
           FK_NAZOWNER = :NEW.FK_NAZOWNER
     WHERE fk_id = :old.fk_id;
     
     --Если назначение выполнено
     ------ Begin сделано для кардиоцентра, на хантах этого пока нет 
     if (:new.fk_nazsosid = asu.Get_Vipnaz) then 
      -- Если это не физиотерапевт
      if (:new.FK_SMID <> ASU."GET_FIZIOTERAPEVT_KONS") then
       --смотрим, есть ли уже выполненные консультации       
       --Проверяем, есть ли вообще записи на этого паца
       select count(1), max(FK_KONSID) into LastNazCount,LastKonsID from asu.TLASTNAZS where FK_PACID = :new.FK_PACID;
       Select MAX(FD_KONSINSDATE) into LastDate from ASU.TLastnazs where FK_PACID = :new.FK_PACID and FK_KONSID <> :new.FK_ID; 
       
       --только что выполненная консультация выполнена по нормлаьному,Ю то етсь в хронологическом порядке, обновляем данные       
       if  
          ((LastNazCount = 0) and (LastDate is NULL)) ---Если еще ничего нету
           or 
          (LastDate < :new.FD_RUN) ---Если по дате проходит
           or 
          ((LastKonsID is null) and (LastNazCount = 1)) -- Если запись на паца есть, но нет отметки о консультациях
       then
          If LastNazCount = 0 then
           insert into ASU.Tlastnazs(FK_PACID,FK_KONSID,FD_KONSINSDATE) values (:new.FK_PACID, :new.FK_ID, :NEW.FD_RUN);
          else
           update ASU.Tlastnazs SET FK_KONSID = :new.FK_ID, FD_KONSINSDATE = :NEW.FD_RUN where FK_PACID = :new.FK_PACID;
          end if;
       else
        -- если было назначено по кривому не в хронологическом порядке,  и переподписуемое назначение являлось максимальным, 
        -- то тогда нужно переписать максимальное значение. Находим последнее выполненную консультацию
        -- перед жтим проверив, а есть ли выполненные консультации Не фмзиотерапевта
        select Count(1) into LastKonsID from ASU.TresKOns where FK_PACID = :new.FK_PACID and FK_SMID <> ASU."GET_FIZIOTERAPEVT_KONS" and FK_NAZID <> :new.FK_ID;
        if LastKonsID > 0 then --Если есть выполненные консультации помимо текущей, ищем максималоное
         select FD_INS,FK_NAZID into LastDate, LastKonsID from (
         select FK_NAZID, FD_INS, ROW_NUMBER() over(partition by FK_PACID order by FD_INS DESC) as RN   from asu.TResKons 
          where  FK_PACID = :new.FK_PACID and FK_NAZID <> :new.FK_ID and FK_SMID <> ASU."GET_FIZIOTERAPEVT_KONS") where RN = 1; 
         --Апдейтим значения 
         update ASU.Tlastnazs SET FK_KONSID = LastKonsID, FD_KONSINSDATE = LastDate where FK_PACID = :new.FK_PACID;
        else
         update ASU.Tlastnazs SET FK_KONSID = :new.FK_ID, FD_KONSINSDATE = :new.FD_RUN where FK_PACID = :new.FK_PACID;
        end if; 
       end if;
      else
       --смотрим, есть ли уже выполненные консультации
       select count(1), max(FK_FIZIOKONSID) into LastNazCount,LastKonsID from asu.TLASTNAZS where FK_PACID = :new.FK_PACID;
       Select MAX(FD_FIZIOKONSINSDATE) into LastDate from ASU.TLastnazs where FK_PACID = :new.FK_PACID and FK_FIZIOKONSID <> :new.FK_ID; 
       --только что выполненная консультация выполнена по нормлаьному,Ю то етсь в хронологическом порядке, обновляем данные       
       if  ((LastNazCount = 0) and (LastDate is NULL)) 
           or 
          (LastDate < :new.FD_RUN)
           or 
          ((LastKonsID is null) and (LastNazCount = 1)) 
       then
         ---select count(1) into LastNazCount from asu.TLASTNAZS where FK_PACID = :new.FK_PACID;
          If LastNazCount = 0 then
           insert into ASU.Tlastnazs(FK_PACID,FK_FIZIOKONSID,FD_FIZIOKONSINSDATE) values (:new.FK_PACID, :new.FK_ID, :NEW.FD_RUN);
          else
           update ASU.Tlastnazs SET FK_FIZIOKONSID = :new.FK_ID, FD_FIZIOKONSINSDATE = :NEW.FD_RUN where FK_PACID = :new.FK_PACID;
          end if;
       else
        -- если было назначено по кривому не в хронологическом порядке,  и переподписуемое назначение являлось максимальным, 
        -- то тогда нужно переписать максимальное значение. Находим последнее выполненную консультацию
        select Count(1) into LastKonsID from ASU.TresKOns where FK_PACID = :new.FK_PACID and FK_SMID = ASU."GET_FIZIOTERAPEVT_KONS"  and FK_NAZID <> :new.FK_ID;
        if LastKonsID > 0 then
         select FD_INS,FK_NAZID into LastDate, LastKonsID from (
         select FK_NAZID, FD_INS, ROW_NUMBER() over(partition by FK_PACID order by FD_INS DESC) as RN   from asu.TResKons 
          where  FK_PACID = :new.FK_PACID and FK_NAZID <> :new.FK_ID and FK_SMID = ASU."GET_FIZIOTERAPEVT_KONS") where RN = 1; 
         --Апдейтим значения 
         update ASU.Tlastnazs SET FK_FIZIOKONSID = LastKonsID, FD_FIZIOKONSINSDATE = LastDate where FK_PACID = :new.FK_PACID;
        else
         update ASU.Tlastnazs SET FK_FIZIOKONSID = :new.FK_ID, FD_FIZIOKONSINSDATE = :new.FD_RUN where FK_PACID = :new.FK_PACID;
        end if;
       end if; 
      end if;
    end if;     
   ------ end сделано для кардиоцентра, на хантах этого пока нет 
     
     
     
  END IF;
  IF (nidnew = get_procid) THEN
    UPDATE tnazlech
       SET fk_id = :new.fk_id,
           fk_smid = :new.fk_smid,
           fc_remark = :new.fc_remark,
           fd_naz = :new.fd_naz,
           fd_run = :new.fd_run,
           fk_roomid = :new.fk_roomid,
           fk_ispolid = :new.fk_ispolid,
           fk_vrachid = :new.fk_vrachid,
           fk_nazsosid = :new.fk_nazsosid,
           fk_pacid = :new.fk_pacid,
           fk_resultid = :new.fk_resultid,
           fc_name = :new.fc_name,
           fl_plat = :new.fl_plat,
           fc_type = :new.fc_type,
           fl_in_raspis = :new.fl_in_raspis,
           fl_isvrachview = :new.fl_isvrachview,
           fl_more_put = :new.fl_more_put,
           FK_NAZTYPEID = :new.FK_NAZTYPEID,
           FK_NAZOWNER = :NEW.FK_NAZOWNER
     WHERE fk_id = :old.fk_id;
  END IF;
  IF nidnew = get_analid THEN
    UPDATE tnazan
       SET fk_id = :new.fk_id,
           fk_smid = :new.fk_smid,
           fc_remark = :new.fc_remark,
           fd_naz = :new.fd_naz,
           fd_run = :new.fd_run,
           fk_roomid = :new.fk_roomid,
           fk_ispolid = :new.fk_ispolid,
           fk_vrachid = :new.fk_vrachid,
           fk_nazsosid = :new.fk_nazsosid,
           fk_pacid = :new.fk_pacid,
           fk_resultid = :new.fk_resultid,
           fc_name = :new.fc_name,
           fl_plat = :new.fl_plat,
           fc_type = :new.fc_type,
           fl_in_raspis = :new.fl_in_raspis,
           fl_isvrachview = :new.fl_isvrachview,
           fl_more_put = :new.fl_more_put,
           FK_NAZTYPEID = :new.FK_NAZTYPEID,
           FK_NAZOWNER = :NEW.FK_NAZOWNER
     WHERE fk_id = :old.fk_id;
  END IF;
       UPDATE TNAZGROUP
          SET fk_smid = :new.fk_smid, fk_pacid = :new.fk_pacid, FK_NAZTYPEID = :new.FK_NAZTYPEID, fk_vrachid = :new.fk_vrachid, FD_DATE =:NEW.FD_RUN
       WHERE FK_NAZID = :old.fk_id;
       if (:old.FK_NAZSOSID = :new.FK_NAZSOSID) and (:old.fd_run <> :new.fd_run) then
          UPDATE TNAZGROUP
          SET fd_run = :new.fd_run
          WHERE FK_NAZID = :old.fk_id;
       end if;
  insnaz.bins  := FALSE;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    insnaz.bins  := FALSE;
    raise_application_error (-20000, 'o?avu¬e eiuee-u? aeaaeo¬a-¬ ?ui?uiue?o--¬ e ue¬v-n¬ TSMID');
  WHEN OTHERS THEN
    insnaz.bins  := FALSE;
    RAISE;
END;

    -- ORIGINAL TRIGGER BODY ENDS HERE
    END;
  END IF;
END;
/
SHOW ERRORS;


--
-- VNAZ_SERV_DEL_CANCEL  (Trigger) 
--
--  Dependencies: 
--   VNAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."VNAZ_SERV_DEL_CANCEL" 
 BEFORE
  DELETE
 ON asu.vnaz
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DISABLE
DECLARE
  sMODULENAME varchar2(4000);
BEGIN
  SELECT PROGRAM
    INTO sMODULENAME
    FROM V$SESSION
   WHERE AUDSID = USERENV('SESSIONID');

   if sMODULENAME = 'SamozapisClientService.exe' then
    raise_application_error(-20003,'невозможно удалить назначение через сервис');
   end if;

END;
/
SHOW ERRORS;


--
-- VNAZ_A_DEL  (Trigger) 
--
--  Dependencies: 
--   VNAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."VNAZ_A_DEL"
 AFTER DELETE
 ON ASU.VNAZ  REFERENCING OLD AS OLD
 FOR EACH ROW
DISABLE
DECLARE
 vCnt     NUMBER;
BEGIN
 SELECT COALESCE(MAX(FK_ID), -1979) INTO vCnt FROM ASU.TEXP_VNAZ WHERE FK_NAZID = :OLD.FK_ID;

 IF vCnt <> -1979
 THEN
  UPDATE ASU.TEXP_VNAZ
  SET FD_LAST_UPDATE = SYSDATE, FP_DEL = 1
  WHERE FK_NAZID = :NEW.FK_ID;
 END IF;
End;
/
SHOW ERRORS;


--
-- VNAZ_A_INS  (Trigger) 
--
--  Dependencies: 
--   VNAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."VNAZ_A_INS"
 AFTER INSERT
 ON ASU.VNAZ  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DISABLE
BEGIN
  INSERT INTO ASU.TEXP_VNAZ(FK_NAZID)
  VALUES(:NEW.FK_ID);
End;
/
SHOW ERRORS;


--
-- VNAZ_A_UPDT  (Trigger) 
--
--  Dependencies: 
--   VNAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."VNAZ_A_UPDT"
 AFTER UPDATE
 ON ASU.VNAZ  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DISABLE
DECLARE
 vCnt     NUMBER;
BEGIN
 SELECT COALESCE(MAX(FK_ID), -1979) INTO vCnt FROM ASU.TEXP_VNAZ WHERE FK_NAZID = :NEW.FK_ID;

 IF vCnt = -1979
 THEN
  INSERT INTO ASU.TEXP_VNAZ(FK_NAZID)
  VALUES(:NEW.FK_ID);
 ELSE
  UPDATE ASU.TEXP_VNAZ
  SET FD_LAST_UPDATE = SYSDATE
  WHERE FK_NAZID = :NEW.FK_ID;
 END IF;
End;
/
SHOW ERRORS;


--
-- VNAZ_INSERT  (Trigger) 
--
--  Dependencies: 
--   VNAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."VNAZ_INSERT" 
 BEFORE
 INSERT
 ON ASU.VNAZ  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
BEGIN
  IF (USERENV('CLIENT_INFO') is null) or (USERENV('CLIENT_INFO') <> '%MAIL%') THEN
    BEGIN
DECLARE
  LastNazCount NUMBER;
  CURSOR c1
  IS
    SELECT fk_id
      FROM tsmid
     START WITH fk_id = :new.fk_smid
    CONNECT BY PRIOR fk_owner = fk_id
     ORDER BY ROWNUM DESC;

  nid   NUMBER;
  omsId NUMBER;
  LastDate date; 
  LastKonsID number;
BEGIN
  IF insnaz.bins THEN
    RETURN;
  END IF;
  insnaz.bins  := TRUE;
  SELECT seq_tkarta.nextval
    INTO :new.fk_id
    FROM dual;
--   raise_application_error(-20002, 'VNAZINSERT FK_ID='||:new.fk_id);
  OPEN c1;
  FETCH c1 INTO nid;
  CLOSE c1;
  if pkg_naz.get_defcompany=pkg_naz.get_pac_company(:new.fk_pacid) then
    :new.fl_more_put:=pkg_naz.get_setplat(:new.fk_smid,:new.fk_pacid);
  end if;
  IF nid = get_konsid THEN
    INSERT INTO tnazkons
            (fk_id, fk_smid, fc_remark, fd_naz,
             fd_run, fk_roomid, fk_ispolid, fk_vrachid,
             fk_nazsosid, fk_pacid, fk_resultid, fc_name,
             fl_plat, fc_type, fl_in_raspis,
             fl_isvrachview,
             fl_more_put,
             fk_naztypeid, FK_NAZOWNER
            )
     VALUES (:NEW.fk_id, :NEW.fk_smid, :NEW.fc_remark, :NEW.fd_naz,
             :NEW.fd_run, :NEW.fk_roomid, :NEW.fk_ispolid, :NEW.fk_vrachid,
             :NEW.fk_nazsosid, :NEW.fk_pacid, :NEW.fk_resultid, :NEW.fc_name,
             :NEW.fl_plat, :NEW.fc_type, :NEW.fl_in_raspis,
             :NEW.fl_isvrachview,
             pkg_naz.get_setplat (:NEW.fk_smid, :NEW.fk_pacid),
             :NEW.fk_naztypeid, :NEW.FK_NAZOWNER
            );
            
   ------ Begin сделано для кардиоцентра, на хантах этого пока нет              
   --Если назначение выполнено
     if (:new.fk_nazsosid = asu.Get_Vipnaz) then 
      -- Если это не физиотерапевт
      if (:new.FK_SMID <> ASU."GET_FIZIOTERAPEVT_KONS") then
       --смотрим, есть ли уже выполненные консультации       
       --Проверяем, есть ли вообще записи на этого паца
       select count(1), max(FK_KONSID) into LastNazCount,LastKonsID from asu.TLASTNAZS where FK_PACID = :new.FK_PACID;
       Select MAX(FD_KONSINSDATE) into LastDate from ASU.TLastnazs where FK_PACID = :new.FK_PACID and FK_KONSID <> :new.FK_ID; 
       
       --только что выполненная консультация выполнена по нормлаьному,Ю то етсь в хронологическом порядке, обновляем данные       
       if  
          ((LastNazCount = 0) and (LastDate is NULL)) ---Если еще ничего нету
           or 
          (LastDate < :new.FD_RUN) ---Если по дате проходит
           or 
          ((LastKonsID is null) and (LastNazCount = 1)) -- Если запись на паца есть, но нет отметки о консультациях
       then
          If LastNazCount = 0 then
           insert into ASU.Tlastnazs(FK_PACID,FK_KONSID,FD_KONSINSDATE) values (:new.FK_PACID, :new.FK_ID, :NEW.FD_RUN);
          else
           update ASU.Tlastnazs SET FK_KONSID = :new.FK_ID, FD_KONSINSDATE = :NEW.FD_RUN where FK_PACID = :new.FK_PACID;
          end if;
       else
        -- если было назначено по кривому не в хронологическом порядке,  и переподписуемое назначение являлось максимальным, 
        -- то тогда нужно переписать максимальное значение. Находим последнее выполненную консультацию
        -- перед жтим проверив, а есть ли выполненные консультации Не фмзиотерапевта
        select Count(1) into LastKonsID from ASU.TresKOns where FK_PACID = :new.FK_PACID and FK_SMID <> ASU."GET_FIZIOTERAPEVT_KONS" and FK_NAZID <> :new.FK_ID;
        if LastKonsID > 0 then --Если есть выполненные консультации помимо текущей, ищем максималоное
         select FD_INS,FK_NAZID into LastDate, LastKonsID from (
         select FK_NAZID, FD_INS, ROW_NUMBER() over(partition by FK_PACID order by FD_INS DESC) as RN   from asu.TResKons 
          where  FK_PACID = :new.FK_PACID and FK_NAZID <> :new.FK_ID and FK_SMID <> ASU."GET_FIZIOTERAPEVT_KONS") where RN = 1; 
         --Апдейтим значения 
         update ASU.Tlastnazs SET FK_KONSID = LastKonsID, FD_KONSINSDATE = LastDate where FK_PACID = :new.FK_PACID;
        else
         update ASU.Tlastnazs SET FK_KONSID = :new.FK_ID, FD_KONSINSDATE = :new.FD_RUN where FK_PACID = :new.FK_PACID;
        end if; 
       end if;
      else
       --смотрим, есть ли уже выполненные консультации
       select count(1), max(FK_FIZIOKONSID) into LastNazCount,LastKonsID from asu.TLASTNAZS where FK_PACID = :new.FK_PACID;
       Select MAX(FD_FIZIOKONSINSDATE) into LastDate from ASU.TLastnazs where FK_PACID = :new.FK_PACID and FK_FIZIOKONSID <> :new.FK_ID; 
       --только что выполненная консультация выполнена по нормлаьному,Ю то етсь в хронологическом порядке, обновляем данные       
       if  ((LastNazCount = 0) and (LastDate is NULL)) 
           or 
          (LastDate < :new.FD_RUN)
           or 
          ((LastKonsID is null) and (LastNazCount = 1)) 
       then
         ---select count(1) into LastNazCount from asu.TLASTNAZS where FK_PACID = :new.FK_PACID;
          If LastNazCount = 0 then
           insert into ASU.Tlastnazs(FK_PACID,FK_FIZIOKONSID,FD_FIZIOKONSINSDATE) values (:new.FK_PACID, :new.FK_ID, :NEW.FD_RUN);
          else
           update ASU.Tlastnazs SET FK_FIZIOKONSID = :new.FK_ID, FD_FIZIOKONSINSDATE = :NEW.FD_RUN where FK_PACID = :new.FK_PACID;
          end if;
       else
        -- если было назначено по кривому не в хронологическом порядке,  и переподписуемое назначение являлось максимальным, 
        -- то тогда нужно переписать максимальное значение. Находим последнее выполненную консультацию
        select Count(1) into LastKonsID from ASU.TresKOns where FK_PACID = :new.FK_PACID and FK_SMID = ASU."GET_FIZIOTERAPEVT_KONS"  and FK_NAZID <> :new.FK_ID;
        if LastKonsID > 0 then
         select FD_INS,FK_NAZID into LastDate, LastKonsID from (
         select FK_NAZID, FD_INS, ROW_NUMBER() over(partition by FK_PACID order by FD_INS DESC) as RN   from asu.TResKons 
          where  FK_PACID = :new.FK_PACID and FK_NAZID <> :new.FK_ID and FK_SMID = ASU."GET_FIZIOTERAPEVT_KONS") where RN = 1; 
         --Апдейтим значения 
         update ASU.Tlastnazs SET FK_FIZIOKONSID = LastKonsID, FD_FIZIOKONSINSDATE = LastDate where FK_PACID = :new.FK_PACID;
        else
         update ASU.Tlastnazs SET FK_FIZIOKONSID = :new.FK_ID, FD_FIZIOKONSINSDATE = :new.FD_RUN where FK_PACID = :new.FK_PACID;
        end if;
       end if; 
      end if;
    end if;       
  ------End сделано для кардиоцентра, на хантах этого пока нет             
            
            
  END IF;
  IF nid = get_issledid THEN
    INSERT INTO tnazis (fk_id,fk_smid,fc_remark,fd_naz,fd_run,fk_roomid,fk_ispolid,fk_vrachid,fk_nazsosid,fk_pacid,fk_resultid,fc_name,fl_plat,fc_type,fl_in_raspis,fl_isvrachview, fl_more_put,FK_NAZTYPEID, FK_NAZOWNER)
         VALUES (:new.fk_id,:new.fk_smid,:new.fc_remark,:new.fd_naz,:new.fd_run,:new.fk_roomid,:new.fk_ispolid,:new.fk_vrachid,:new.fk_nazsosid,:new.fk_pacid,:new.fk_resultid,:new.fc_name,:new.fl_plat,:new.fc_type,:new.fl_in_raspis,:new.fl_isvrachview,pkg_naz.get_setplat(:new.fk_smid,:new.fk_pacid),:new.FK_NAZTYPEID, :new.FK_NAZOWNER);
    INSERT INTO TNAZGROUP(FK_NAZID, FK_GROUPID, FD_RUN, FK_SMID, FK_PACID, FK_NAZTYPEID, FK_VRACHID, FD_DATE)
      VALUES(:NEW.FK_ID, GET_GROUPID_BY_SMID(:NEW.FK_SMID), :NEW.FD_RUN, :NEW.FK_SMID, :NEW.FK_PACID, :NEW.FK_NAZTYPEID, :NEW.FK_VRACHID, :NEW.FD_RUN);

  END IF;

  IF nid = get_procid THEN
    INSERT INTO tnazlech(fk_id,fk_smid,fc_remark,fd_naz,fd_run,fk_roomid,fk_ispolid,fk_vrachid,fk_nazsosid,fk_pacid,fk_resultid,fc_name,fl_plat,fc_type,fl_in_raspis,fl_isvrachview,fl_more_put,FK_NAZTYPEID, FK_NAZOWNER)
        VALUES (:new.fk_id,:new.fk_smid,:new.fc_remark,:new.fd_naz,:new.fd_run,:new.fk_roomid,:new.fk_ispolid,:new.fk_vrachid,:new.fk_nazsosid,:new.fk_pacid,:new.fk_resultid,:new.fc_name,:new.fl_plat,:new.fc_type,:new.fl_in_raspis,:new.fl_isvrachview, :new.fl_more_put,:new.FK_NAZTYPEID, :new.FK_NAZOWNER);

  END IF;
  IF nid = get_analid THEN
    INSERT INTO tnazan(fk_id,fk_smid,fc_remark,fd_naz,fd_run,fk_roomid,fk_ispolid,fk_vrachid,fk_nazsosid,fk_pacid,fk_resultid,fc_name,fl_plat,fc_type,fl_in_raspis,fl_isvrachview, fl_more_put,FK_NAZTYPEID, FK_NAZOWNER)
         VALUES (:new.fk_id,:new.fk_smid,:new.fc_remark,:new.fd_naz,:new.fd_run,:new.fk_roomid,:new.fk_ispolid,:new.fk_vrachid,:new.fk_nazsosid,:new.fk_pacid,:new.fk_resultid,:new.fc_name,:new.fl_plat,:new.fc_type,:new.fl_in_raspis,:new.fl_isvrachview,pkg_naz.get_setplat(:new.fk_smid,:new.fk_pacid),:new.FK_NAZTYPEID, :new.FK_NAZOWNER);
    INSERT INTO TNAZGROUP(FK_NAZID, FK_GROUPID, FD_RUN, FK_SMID, FK_PACID, FK_NAZTYPEID, FK_VRACHID,fd_date)
         VALUES(:NEW.FK_ID, GET_GROUPID_BY_SMID(:NEW.FK_SMID), :NEW.FD_RUN, :NEW.FK_SMID, :NEW.FK_PACID, :NEW.FK_NAZTYPEID, :NEW.FK_VRACHID,:new.fd_run);
      -- Reference from TNAZAN to TNAZOPL
      SELECT FK_ID into omsId FROM TSMID WHERE FC_SYNONIM = 'TAL_OPLOMS';
      INSERT INTO TNAZOPL (FK_NAZID, FK_SMID_TAL_OPL) VALUES (:new.FK_ID, omsId);
  END IF;



  insnaz.bins  := FALSE;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    insnaz.bins  := FALSE;
    raise_application_error (-20000, 'Ўцрv·мш ъь·шъ-·ц фштфшЄмф-м ц·ьц·ь·ъцЎ--м ъ ·шмv-ём TSMID' || :new.fk_smid);
  WHEN OTHERS THEN
    insnaz.bins  := FALSE;
    RAISE;
END;
    END;
  END IF;
END;
/
SHOW ERRORS;


--
-- VNAZ_UPDATE_RASPIS  (Trigger) 
--
--  Dependencies: 
--   VNAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU.VNAZ_UPDATE_RASPIS
 AFTER 
 UPDATE
 ON ASU.VNAZ  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW FOLLOWS VNAZ_A_UPDT
BEGIN
 if (:new.FK_NAZSOSID = asu.get_vipnaz) or (:new.FK_NAZSOSID = asu.get_nazcancel) then
  delete from ASU.TPACLST where TPAClst.Nazid = :new.FK_ID;
 end if;
END;
/
SHOW ERRORS;


DROP SYNONYM STAT.VNAZ
/

--
-- VNAZ  (Synonym) 
--
--  Dependencies: 
--   VNAZ (Table)
--
CREATE SYNONYM STAT.VNAZ FOR ASU.VNAZ
/


-- 
-- Non Foreign Key Constraints for Table VNAZ 
-- 
ALTER TABLE ASU.VNAZ ADD (
  CONSTRAINT VNAZ_BY_ID
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          5760K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

GRANT REFERENCES, SELECT ON ASU.VNAZ TO EXCHANGE
/

GRANT REFERENCES, SELECT ON ASU.VNAZ TO EXCH43
/

GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ASU.VNAZ TO MEDSERV
/

