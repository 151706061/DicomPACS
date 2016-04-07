DROP TRIGGER ASU.TGRAPH$WEB_REPLICATION
/

--
-- TGRAPH$WEB_REPLICATION  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   SEQ_TGRAPHID (Sequence)
--   TGRAPH (Table)
--   TVRACHKAB (Table)
--   TVRACHKAB_NAZ (Table)
--   TRASPIS (Table)
--   PKG_EXCH_SAMOZAPIS (Package)
--   TSMID (Table)
--   WEB_BUFFER_TRANSFER (Table)
--   WEB_SCHEDULE_GRAPH (Table)
--   GET_ISSLEDID (Function)
--   GET_KONSSPECID (Function)
--   GET_PROCID (Function)
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


