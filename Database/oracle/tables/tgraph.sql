ALTER TABLE ASU.TGRAPH
 DROP PRIMARY KEY CASCADE
/

DROP TABLE ASU.TGRAPH CASCADE CONSTRAINTS
/

--
-- TGRAPH  (Table) 
--
CREATE TABLE ASU.TGRAPH
(
  FK_ID              NUMBER(15)                 NOT NULL,
  FK_RASPID          NUMBER(15)                 NOT NULL,
  FL_SEX             NUMBER                     DEFAULT -1                    NOT NULL,
  FK_PACLSTID        NUMBER(15),
  FN_COUNT           NUMBER(10),
  FT_HOUR            VARCHAR2(2 BYTE),
  FT_MIN             VARCHAR2(2 BYTE),
  FD_DATE            DATE,
  FN_INTERVAL        NUMBER,
  FT_END             DATE,
  FL_OCHERED         NUMBER                     DEFAULT 0,
  FK_KABINETTALONID  NUMBER,
  FL_SHOW            NUMBER                     DEFAULT 1
)
TABLESPACE USR
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          6400K
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

COMMENT ON TABLE ASU.TGRAPH IS 'График работ'
/

COMMENT ON COLUMN ASU.TGRAPH.FK_ID IS 'SEQUENCE=[SEQ_TGRAPHID]'
/

COMMENT ON COLUMN ASU.TGRAPH.FK_RASPID IS 'TRASPIS.FK_ID'
/

COMMENT ON COLUMN ASU.TGRAPH.FL_SEX IS 'Пол'
/

COMMENT ON COLUMN ASU.TGRAPH.FK_PACLSTID IS 'TPACLST.FK_ID'
/

COMMENT ON COLUMN ASU.TGRAPH.FN_COUNT IS 'Количество приемов'
/

COMMENT ON COLUMN ASU.TGRAPH.FT_HOUR IS 'Часы'
/

COMMENT ON COLUMN ASU.TGRAPH.FT_MIN IS 'Минуты'
/

COMMENT ON COLUMN ASU.TGRAPH.FD_DATE IS 'Дата'
/

COMMENT ON COLUMN ASU.TGRAPH.FN_INTERVAL IS 'Длительность'
/

COMMENT ON COLUMN ASU.TGRAPH.FL_OCHERED IS 'Время создано из DLL_REGISTAMB'
/

COMMENT ON COLUMN ASU.TGRAPH.FK_KABINETTALONID IS 'ДЛя  кардиоцентра'
/

COMMENT ON COLUMN ASU.TGRAPH.FL_SHOW IS 'Отображать на сайте 1- да, 0-нет'
/


--
-- TGRAPH_DATE  (Index) 
--
--  Dependencies: 
--   TGRAPH (Table)
--
CREATE INDEX ASU.TGRAPH_DATE ON ASU.TGRAPH
(FD_DATE)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          2432K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TGRAPH_DATE_RASP  (Index) 
--
--  Dependencies: 
--   TGRAPH (Table)
--
CREATE INDEX ASU.TGRAPH_DATE_RASP ON ASU.TGRAPH
(FK_RASPID, FD_DATE)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          12672K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TGRAPH_HOUR_MIN  (Index) 
--
--  Dependencies: 
--   TGRAPH (Table)
--
CREATE INDEX ASU.TGRAPH_HOUR_MIN ON ASU.TGRAPH
(FT_HOUR, FT_MIN)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          2304K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TGRAPH_ID  (Index) 
--
--  Dependencies: 
--   TGRAPH (Table)
--
CREATE UNIQUE INDEX ASU.TGRAPH_ID ON ASU.TGRAPH
(FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          1536K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TGRAPH_RASPID  (Index) 
--
--  Dependencies: 
--   TGRAPH (Table)
--
CREATE INDEX ASU.TGRAPH_RASPID ON ASU.TGRAPH
(FK_RASPID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          2304K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TGRAPH_RASPID_TIME  (Index) 
--
--  Dependencies: 
--   TGRAPH (Table)
--
CREATE INDEX ASU.TGRAPH_RASPID_TIME ON ASU.TGRAPH
(FK_RASPID, FT_HOUR, FT_MIN, FD_DATE)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          12672K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TGRAPH1_UK  (Index) 
--
--  Dependencies: 
--   TGRAPH (Table)
--
CREATE UNIQUE INDEX ASU.TGRAPH1_UK ON ASU.TGRAPH
(FT_HOUR, FT_MIN, FK_ID)
NOLOGGING
TABLESPACE INDX
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          3200K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
NOPARALLEL
/


--
-- TGRAPH_BEFOR_INSERT  (Trigger) 
--
--  Dependencies: 
--   TGRAPH (Table)
--
CREATE OR REPLACE TRIGGER ASU."TGRAPH_BEFOR_INSERT" 
  BEFORE INSERT
  ON ASU.TGRAPH   REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
DISABLE
Begin
  select SEQ_TGRAPHID.NEXTVAL into :new.FK_ID from dual;
End;
/
SHOW ERRORS;


--
-- TGRAPH_BEFOR_DELETE  (Trigger) 
--
--  Dependencies: 
--   TGRAPH (Table)
--
CREATE OR REPLACE TRIGGER ASU."TGRAPH_BEFOR_DELETE" 
 BEFORE 
 DELETE
 ON ASU.TGRAPH  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  nTemp NUMBER;
BEGIN
  delete from tpaclst where fk_graphid=:old.fk_id;
End;
/
SHOW ERRORS;


--
-- TGRAPH_LOG  (Trigger) 
--
--  Dependencies: 
--   TGRAPH (Table)
--
CREATE OR REPLACE TRIGGER ASU."TGRAPH_LOG" 
 AFTER 
 INSERT OR DELETE OR UPDATE
 ON ASU.TGRAPH  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  nTemp NUMBER;
BEGIN
  if INSERTING then
    PKG_LOG.Do_log('TGRAPH', 'FK_ID', 'INSERT', null, PKG_LOG.GET_VALUE(:new.fk_id), :new.fk_id);
  elsif DELETING then
    PKG_LOG.Do_log('TGRAPH', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
    PKG_LOG.Do_log('TGRAPH', 'FK_RASPID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_raspid), null, :old.fk_id);
    PKG_LOG.Do_log('TGRAPH', 'FD_DATE', 'DELETE', PKG_LOG.GET_VALUE(:old.fd_date), null, :old.fk_id);
    PKG_LOG.Do_log('TGRAPH', 'FL_SEX', 'DELETE', PKG_LOG.GET_VALUE(:old.FL_SEX), null, :old.fk_id);
    PKG_LOG.Do_log('TGRAPH', 'FT_HOUR', 'DELETE', PKG_LOG.GET_VALUE(:old.FT_HOUR), null, :old.fk_id);
    PKG_LOG.Do_log('TGRAPH', 'FT_MIN', 'DELETE', PKG_LOG.GET_VALUE(:old.FT_MIN), null, :old.fk_id);        
  elsif UPDATING then
    PKG_LOG.Do_log('TGRAPH', 'FK_ID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_ID), PKG_LOG.GET_VALUE(:new.FK_ID), :old.fk_id);

    if UPDATING ('TGRAPH') AND PKG_LOG.GET_VALUE(:old.FK_RASPID) <> PKG_LOG.GET_VALUE(:new.FK_RASPID) then
      PKG_LOG.Do_log('TGRAPH', 'FK_RASPID', 'UPDATE', PKG_LOG.GET_VALUE(:old.FK_RASPID), PKG_LOG.GET_VALUE(:new.FK_RASPID), :old.fk_id);
    end if;

    if UPDATING ('TGRAPH') AND PKG_LOG.GET_VALUE(:old.FD_DATE) <> PKG_LOG.GET_VALUE(:new.FD_DATE) then
      PKG_LOG.Do_log('TGRAPH', 'FD_DATE', 'UPDATE', PKG_LOG.GET_VALUE(:old.FD_DATE), PKG_LOG.GET_VALUE(:new.FD_DATE), :old.fk_id);
    end if;
    
    if UPDATING ('TGRAPH') AND PKG_LOG.GET_VALUE(:old.FL_SEX) <> PKG_LOG.GET_VALUE(:new.FL_SEX) then
      PKG_LOG.Do_log('TGRAPH', 'FL_SEX', 'UPDATE', PKG_LOG.GET_VALUE(:old.FL_SEX), PKG_LOG.GET_VALUE(:new.FL_SEX), :old.fk_id);
    end if;
  end if;
END;


/*CREATE OR REPLACE TRIGGER "TGRAPH_LOG" 
 AFTER
 INSERT OR DELETE OR UPDATE
 ON TGRAPH
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  nTemp NUMBER;
BEGIN
  if DELETING then
    PKG_LOG.Do_log('TGRAPH', 'FK_ID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_id), null, :old.fk_id);
    PKG_LOG.Do_log('TGRAPH', 'FK_RASPID', 'DELETE', PKG_LOG.GET_VALUE(:old.fk_raspid), null, :old.fk_id);
    PKG_LOG.Do_log('TGRAPH', 'FD_DATE', 'DELETE', PKG_LOG.GET_VALUE(:old.fd_date), null, :old.fk_id);
  end if;
  null;
END TGRAPH_LOG;*/
/
SHOW ERRORS;


--
-- TGRAPH$WEB_REPLICATION  (Trigger) 
--
--  Dependencies: 
--   TGRAPH (Table)
--
CREATE OR REPLACE TRIGGER ASU."TGRAPH$WEB_REPLICATION" 
 BEFORE
  INSERT OR DELETE OR UPDATE
 ON asu.tgraph
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
  V_SCHEDULE_OID VARCHAR2(36);
  V_ACTUAL_DATE DATE;
BEGIN
  if INSERTING then
    select SEQ_TGRAPHID.NEXTVAL into :new.FK_ID from dual;
  end if;

  IF ASU.PKG_EXCH_SAMOZAPIS.IS_REPL THEN
    return;
  END IF;


  IF INSERTING THEN
     select max(r.fk_ID)
     INTO V_SCHEDULE_OID
     from asu.traspis r,
          asu.tvrachkab_naz vkn,
          asu.tvrachkab vk,
         (
          SELECT TSS.FK_ID
          FROM (SELECT TSS.FK_ID, TSS.FK_OWNER FROM ASU.TSMID TSS WHERE TSS.FL_SHOWANAL = 1 and TSS.Fl_Del = 0) TSS
          START WITH TSS.FK_ID IN (ASU.GET_KONSSPECID,
                                   ASU.GET_ISSLEDID,
                                   ASU.GET_PROCID)
          CONNECT BY PRIOR TSS.FK_ID = TSS.FK_OWNER
         ) SM_NAZ
    where :new.fk_raspid = r.fk_graphid
          and r.fk_nazvrachid = vk.fk_id
          and vk.fk_id = vkn.fk_sotrkabid
          and vkn.fk_smid = sm_naz.fk_id;

    IF ( V_SCHEDULE_OID IS NOT NULL ) THEN
         ASU.PKG_EXCH_SAMOZAPIS.DO_LOG('TGRAPH', :NEW.FK_ID, 'UPDATE', 'TGRAPH$WEB_REPLICATION', V_ACTUAL_DATE);
    END IF;

  ELSIF DELETING THEN
      -- Не передаем изменения по ячейкам из прошлого
      V_ACTUAL_DATE := TO_DATE( TO_CHAR(nvl(:OLD.FD_DATE, sysdate),'DD.MM.YYYY')|| ' '||nvl(:OLD.FT_HOUR, '00')||':'||nvl(:OLD.FT_MIN, '00'), 'dd.mm.yyyy HH24:mi');

      IF ( V_ACTUAL_DATE < sysdate ) AND (:OLD.FD_DATE IS NOT NULL) THEN
        DELETE FROM ASU.WEB_BUFFER_TRANSFER
        WHERE TABLE_NAME = 'TGRAPH'
              AND KEY_FIELD_VALUE = :OLD.FK_ID;
        return;
      end if;

      -- Если ячейка была удалена и никогда не проливалась на самозапись
      SELECT MAX(W.SCHEDULE_ID)
      INTO V_SCHEDULE_OID
      FROM ASU.WEB_SCHEDULE_GRAPH W
      WHERE W.GRAPH_ID = :OLD.FK_ID;
      IF ( V_SCHEDULE_OID IS NULL ) THEN
          DELETE FROM ASU.WEB_BUFFER_TRANSFER
          WHERE TABLE_NAME = 'TGRAPH'
                AND KEY_FIELD_VALUE = :OLD.FK_ID;
          RETURN;
      END IF;
      ASU.PKG_EXCH_SAMOZAPIS.DO_LOG('TGRAPH', :OLD.FK_ID, 'DELETE', 'TGRAPH$WEB_REPLICATION', V_ACTUAL_DATE);
   ELSE
      select max(r.fk_ID)
      INTO V_SCHEDULE_OID
      from asu.traspis r,
           asu.tvrachkab_naz vkn,
           asu.tvrachkab vk,
          (
           SELECT TSS.FK_ID
           FROM (SELECT TSS.FK_ID, TSS.FK_OWNER FROM ASU.TSMID TSS WHERE TSS.FL_SHOWANAL = 1 and TSS.Fl_Del = 0) TSS
           START WITH TSS.FK_ID IN (ASU.GET_KONSSPECID,
                                    ASU.GET_ISSLEDID,
                                    ASU.GET_PROCID)
           CONNECT BY PRIOR TSS.FK_ID = TSS.FK_OWNER
          ) SM_NAZ
      where :old.fk_raspid = r.fk_graphid
          and r.fk_nazvrachid = vk.fk_id
          and vk.fk_id = vkn.fk_sotrkabid
          and vkn.fk_smid = sm_naz.fk_id;

      IF V_SCHEDULE_OID IS NOT NULL
         AND ((:NEW.FN_COUNT <> :OLD.FN_COUNT) OR
              (:NEW.FT_HOUR <> :OLD.FT_HOUR) OR
              (:NEW.FT_MIN <> :OLD.FT_MIN) OR
              (:NEW.FD_DATE <> :OLD.FD_DATE) OR
              (:NEW.FN_INTERVAL <> :OLD.FN_INTERVAL) OR
              (:NEW.FT_END <> :OLD.FT_END) OR
              (:NEW.FL_SHOW <> :OLD.FL_SHOW) ) THEN
               ASU.PKG_EXCH_SAMOZAPIS.DO_LOG('TGRAPH', :OLD.FK_ID, 'UPDATE', 'TGRAPH$WEB_REPLICATION', V_ACTUAL_DATE);
      END IF;
    END IF;
END;
/
SHOW ERRORS;


--
-- TGRAPH$WEB_REPLICATION2  (Trigger) 
--
--  Dependencies: 
--   TGRAPH (Table)
--
CREATE OR REPLACE TRIGGER ASU.TGRAPH$WEB_REPLICATION2
 AFTER
 INSERT OR DELETE OR UPDATE
 ON ASU.TGRAPH  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  V_SCHEDULE_OID VARCHAR2(36);
  V_ACTUAL_DATE DATE;
  V_KABINET ASU.TKABINET.FC_NAME%TYPE;
  V_SOTRPEPLID Number;
  V_OTDEL NUMBER;
  V_MEDPOST NUMBER;
  V_SOTRSPEC NUMBER;
  cnt NUMBER;

  cursor cExtendedInfo (pRaspID in NUMBER) is
        select ts.fk_peplid,
               login.get_sotr_otdelid(tvk.fk_sotrid),
               tkab.fc_name,
               nvl((select exch43.pkg_exchange.GET_THEIR_ID((select min(FK_ID) from exch43.texchange_company where upper(fc_name)='ПОРТАЛ ПАЦИЕНТА'), 'TSOTR_SPEC', 'TSOTR_SPEC', ts.FK_MEDSPEC) from dual),0),
               nvl((select exch43.pkg_exchange.GET_THEIR_ID((select min(FK_ID) from exch43.texchange_company where upper(fc_name)='ПОРТАЛ ПАЦИЕНТА'), 'TS_SPRAV', 'TS_SPRAV', ts.FK_SPRAVID) from dual),0)
        from asu.traspis_schema rs
             inner join asu.tvrachkab tvk on tvk.fk_id=rs.fk_nazvrachid
             inner join asu.tkabinet tkab on tvk.fk_kabinetid=tkab.fk_id
             inner join login.tsotr ts on ts.fk_id=tvk.fk_sotrid
        where rs.fk_graphid = pRaspID;
BEGIN
  /*if INSERTING then
    select SEQ_TGRAPHID.NEXTVAL into :new.FK_ID from dual;
  end if;*/

  /*IF ASU.PKG_EXCH_SAMOZAPIS.IS_REPL THEN

    return;
  END IF;*/


  IF INSERTING THEN
     select max(r.fk_ID)
     INTO V_SCHEDULE_OID
     from asu.traspis_schema r,
          asu.tvrachkab_naz vkn,
          asu.tvrachkab vk,
         (
          SELECT TSS.FK_ID
          FROM (SELECT TSS.FK_ID, TSS.FK_OWNER FROM ASU.TSMID TSS WHERE TSS.FL_SHOWANAL = 1 and TSS.Fl_Del = 0) TSS
          START WITH TSS.FK_ID IN (ASU.GET_KONSSPECID,
                                   ASU.GET_ISSLEDID,
                                   ASU.GET_PROCID)
          CONNECT BY PRIOR TSS.FK_ID = TSS.FK_OWNER
         ) SM_NAZ
    where :new.fk_raspid = r.fk_graphid
          and r.fk_nazvrachid = vk.fk_id
          and vkn.fk_smid = sm_naz.fk_id
          and vk.fk_id = vkn.fk_sotrkabid
          and r.fk_schemaid = stat.pkg_statutil.get_smidid('RASPIS_PORTAL');

    IF ( V_SCHEDULE_OID IS NOT NULL ) THEN
        open cExtendedInfo(:new.fk_raspid);
        fetch cExtendedInfo INTO V_SOTRPEPLID, V_OTDEL, V_KABINET, V_SOTRSPEC, V_MEDPOST;
        close cExtendedInfo;
         /*ASU.PKG_EXCH_SAMOZAPIS2.DO_LOG('TGRAPH', :NEW.FK_ID, 'UPDATE', 'TGRAPH$WEB_REPLICATION', V_ACTUAL_DATE);*/
         INSERT INTO ASU.WEB_BUFFER_TRANSFER2(REGIST_DATE, TABLE_NAME, KEY_FIELD_VALUE, ACTION, FC_INFO, FC_USERNAME, ACTUAL_DATE, FK_SOTRPEPLID, FK_OTDELID, FN_SOTRSPEC, FN_MEDPOST, FC_KABINET)
         VALUES(SYSDATE, 'TGRAPH', :NEW.FK_ID, 'INSERT', 'TGRAPH$WEB_REPLICATION', (SELECT MAX(USERNAME) FROM V$SESSION WHERE AUDSID=USERENV('SESSIONID')), :NEW.FD_DATE,
                V_SOTRPEPLID, V_OTDEL, V_SOTRSPEC, V_MEDPOST, V_KABINET);
    END IF;

  ELSIF DELETING THEN
      -- Не передаем изменения по ячейкам из прошлого
      V_ACTUAL_DATE := TO_DATE( TO_CHAR(nvl(:OLD.FD_DATE, sysdate),'DD.MM.YYYY')|| ' '||nvl(:OLD.FT_HOUR, '00')||':'||nvl(:OLD.FT_MIN, '00'), 'dd.mm.yyyy HH24:mi');

      IF ( V_ACTUAL_DATE < sysdate ) AND (:OLD.FD_DATE IS NOT NULL) THEN
        DELETE FROM ASU.WEB_BUFFER_TRANSFER2
        WHERE TABLE_NAME = 'TGRAPH'
              AND KEY_FIELD_VALUE = :OLD.FK_ID;
        return;
      end if;

      SELECT COUNT(*) INTO cnt from asu.traspis_schema r WHERE r.fk_graphid = :OLD.fk_RASPID AND r.fk_schemaid = stat.pkg_statutil.get_smidid('RASPIS_PORTAL');

      IF cnt = 0
      THEN
         RETURN;
      END IF;

     /* -- Если ячейка была удалена и никогда не проливалась на самозапись
      SELECT MAX(W.SCHEDULE_ID)
      INTO V_SCHEDULE_OID
      FROM ASU.WEB_SCHEDULE_GRAPH W
      WHERE W.GRAPH_ID = :OLD.FK_ID;
      IF ( V_SCHEDULE_OID IS NULL ) THEN
          DELETE FROM ASU.WEB_BUFFER_TRANSFER
          WHERE TABLE_NAME = 'TGRAPH'
                AND KEY_FIELD_VALUE = :OLD.FK_ID;
          RETURN;
      END IF;*/

       open cExtendedInfo(:old.fk_raspid);
       fetch cExtendedInfo INTO V_SOTRPEPLID, V_OTDEL, V_KABINET, V_SOTRSPEC, V_MEDPOST;
       close cExtendedInfo;

       INSERT INTO ASU.WEB_BUFFER_TRANSFER2(REGIST_DATE, TABLE_NAME, KEY_FIELD_VALUE, ACTION, FC_INFO, FC_USERNAME, ACTUAL_DATE, FK_SOTRPEPLID, FK_OTDELID, FN_SOTRSPEC, FN_MEDPOST, FC_KABINET)
       VALUES(SYSDATE, 'TGRAPH', :OLD.FK_ID, 'DELETE', 'TGRAPH$WEB_REPLICATION', (SELECT MAX(USERNAME) FROM V$SESSION WHERE AUDSID=USERENV('SESSIONID')), :OLD.FD_DATE,
              V_SOTRPEPLID, V_OTDEL, V_SOTRSPEC, V_MEDPOST, V_KABINET);
      --ASU.PKG_EXCH_SAMOZAPIS2.DO_LOG('TGRAPH', :OLD.FK_ID, 'DELETE', 'TGRAPH$WEB_REPLICATION', V_ACTUAL_DATE);
   ELSE
      select max(r.fk_ID)
      INTO V_SCHEDULE_OID
      from asu.traspis_schema r,
           asu.tvrachkab_naz vkn,
           asu.tvrachkab vk,
          (
           SELECT TSS.FK_ID
           FROM (SELECT TSS.FK_ID, TSS.FK_OWNER FROM ASU.TSMID TSS WHERE TSS.FL_SHOWANAL = 1 and TSS.Fl_Del = 0) TSS
           START WITH TSS.FK_ID IN (ASU.GET_KONSSPECID,
                                    ASU.GET_ISSLEDID,
                                    ASU.GET_PROCID)
           CONNECT BY PRIOR TSS.FK_ID = TSS.FK_OWNER
          ) SM_NAZ
      where :old.fk_raspid = r.fk_graphid
          and r.fk_nazvrachid = vk.fk_id
          and vkn.fk_smid = sm_naz.fk_id
          and vk.fk_id = vkn.fk_sotrkabid
          and r.fk_schemaid = stat.pkg_statutil.get_smidid('RASPIS_PORTAL');

      IF V_SCHEDULE_OID IS NOT NULL
         AND ((:NEW.FN_COUNT <> :OLD.FN_COUNT) OR
              (:NEW.FT_HOUR <> :OLD.FT_HOUR) OR
              (:NEW.FT_MIN <> :OLD.FT_MIN) OR
              (:NEW.FD_DATE <> :OLD.FD_DATE) OR
              (:NEW.FN_INTERVAL <> :OLD.FN_INTERVAL) OR
              (:NEW.FT_END <> :OLD.FT_END) OR
              (:NEW.FL_SHOW <> :OLD.FL_SHOW) ) THEN
                     open cExtendedInfo(:old.fk_raspid);
                     fetch cExtendedInfo INTO V_SOTRPEPLID, V_OTDEL, V_KABINET, V_SOTRSPEC, V_MEDPOST;
                     close cExtendedInfo;
                     INSERT INTO ASU.WEB_BUFFER_TRANSFER2(REGIST_DATE, TABLE_NAME, KEY_FIELD_VALUE, ACTION, FC_INFO, FC_USERNAME, ACTUAL_DATE, FK_SOTRPEPLID, FK_OTDELID, FN_SOTRSPEC, FN_MEDPOST, FC_KABINET)
                     VALUES(SYSDATE, 'TGRAPH', :OLD.FK_ID, 'UPDATE', 'TGRAPH$WEB_REPLICATION', (SELECT MAX(USERNAME) FROM V$SESSION WHERE AUDSID=USERENV('SESSIONID')), :OLD.FD_DATE,
                            V_SOTRPEPLID, V_OTDEL, V_SOTRSPEC, V_MEDPOST, V_KABINET);
              -- ASU.PKG_EXCH_SAMOZAPIS2.DO_LOG('TGRAPH', :OLD.FK_ID, 'UPDATE', 'TGRAPH$WEB_REPLICATION', V_ACTUAL_DATE);
      END IF;
    END IF;
END;
/
SHOW ERRORS;


-- 
-- Non Foreign Key Constraints for Table TGRAPH 
-- 
ALTER TABLE ASU.TGRAPH ADD (
  CONSTRAINT TGRAPH_ID
 PRIMARY KEY
 (FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          1536K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ),
  CONSTRAINT TGRAPH1_UK
 UNIQUE (FT_HOUR, FT_MIN, FK_ID)
    USING INDEX 
    TABLESPACE INDX
    PCTFREE    10
    INITRANS   2
    MAXTRANS   255
    STORAGE    (
                INITIAL          3200K
                NEXT             1M
                MINEXTENTS       1
                MAXEXTENTS       UNLIMITED
                PCTINCREASE      0
               ))
/

