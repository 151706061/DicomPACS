DROP TRIGGER ASU.TGRAPH$WEB_REPLICATION2
/

--
-- TGRAPH$WEB_REPLICATION2  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   V$SESSION (Synonym)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   GET_SOTR_OTDELID (Function)
--   PKG_EXCHANGE (Package)
--   TGRAPH (Table)
--   TVRACHKAB (Table)
--   TVRACHKAB_NAZ (Table)
--   TRASPIS_SCHEMA (Table)
--   TSMID (Table)
--   WEB_BUFFER_TRANSFER2 (Table)
--   TSOTR (Table)
--   TEXCHANGE_COMPANY (Table)
--   GET_ISSLEDID (Function)
--   GET_KONSSPECID (Function)
--   GET_PROCID (Function)
--   PKG_STATUTIL (Package)
--   TKABINET (Table)
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


