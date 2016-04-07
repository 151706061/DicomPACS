DROP PACKAGE BODY ASU.PKG_TOMP_SMID
/

--
-- PKG_TOMP_SMID  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU.PKG_TOMP_SMID IS
  procedure Calculate(pSmidOwnerID integer, pRazdID integer, pAddSmidNoHeal integer, pAddHealNoSmid integer, pShowDelSmid integer default 0) is
  begin
    delete from asu.ttomp_smid;
    insert into asu.ttomp_smid
    SELECT ts.*
      FROM (SELECT TS.FK_ID,
                   TS.FK_OWNER,
                   TS.FC_OWNER_NAME,
                   TS.FC_NAME,
                   TS.SFOUND,
                   TS.FL_DEL,
                   TS.NVID,
                   DECODE(TS.NVID,
                          ASU.GET_PROCID,
                          'ПРОЦЕДУРА',
                          ASU.GET_KONSID,
                          'КОНСУЛЬТАЦИЯ',
                          ASU.GET_ISSLEDID,
                          'ИССЛЕДОВАНИЕ') SVID,
                   '' FC_OTDEL
              FROM (SELECT (SELECT ROWID FROM DUAL) AS "ROWID",
                           TS.FK_ID,
                           TS.FK_OWNER,
                           TSO.FC_NAME FC_OWNER_NAME,
                           TS.FC_NAME,
                           UPPER(TS.FC_NAME) SFOUND,
                           TS.FL_DEL,
                           CONNECT_BY_ROOT TS.FK_ID NVID
                      FROM ASU.TSMID TS
                      LEFT JOIN ASU.TSMID TSO ON TSO.FK_ID = TS.FK_OWNER
                     WHERE (TS.FL_DEL = 0 OR (pShowDelSmid = 1 AND TS.FL_DEL = 1))
                       AND TS.FL_SHOWANAL = 1
                       AND (SELECT COUNT(FK_ID)
                              FROM ASU.TSMID T2
                             WHERE T2.FK_OWNER = TS.FK_ID
                               AND T2.FL_SHOWANAL = 1) = 0
                    CONNECT BY PRIOR TS.FK_ID = TS.FK_OWNER
                     START WITH TS.FK_ID IN (ASU.GET_PROCID, ASU.GET_KONSID, ASU.GET_ISSLEDID)) TS

            UNION ALL

            SELECT TS.FK_ID,
                   TS.FK_OWNER,
                   TSO.FC_NAME FC_OWNER_NAME,
                   TS.FC_NAME,
                   UPPER(TS.FC_NAME) SFOUND,
                   TS.FL_DEL,
                   ASU.GET_ANALID NVID,
                   'АНАЛИЗ' SVID,
                   (SELECT MAX(FC_NAME)
                      FROM ASU.TSMID TSM
                     WHERE TSM.FL_SHOWANAL = 0
                    CONNECT BY PRIOR TSM.FK_OWNER = TSM.FK_ID
                     START WITH TSM.FK_ID = TS.FK_ID) FC_OTDEL
              FROM ASU.TSMID TS
              LEFT JOIN ASU.TSMID TSO ON TSO.FK_ID = TS.FK_OWNER
             WHERE (TS.FL_DEL = 0 OR (pShowDelSmid = 1 AND TS.FL_DEL = 1))
               AND TS.FL_SHOWANAL IN (2, 3)
               AND TS.FC_TYPE IN ('TABLE', 'MTABLE')
               AND (SELECT COUNT(FK_ID)
                      FROM ASU.TSMID T2
                     WHERE T2.FK_OWNER = TS.FK_ID
                       AND T2.FL_SHOWANAL = 1) = 0
            CONNECT BY PRIOR TS.FK_ID = TS.FK_OWNER
             START WITH TS.FK_ID = ASU.GET_ANALID

            UNION ALL

            SELECT TS.FK_ID,
                   TS.FK_OWNER,
                   TSO.FC_NAME FC_OWNER_NAME,
                   TS.FC_NAME,
                   UPPER(TS.FC_NAME) SFOUND,
                   TS.FL_DEL,
                   CONNECT_BY_ROOT TS.FK_ID NVID,
                   'ОПЕРАТИВНОЕ ЛЕЧЕНИЕ' SVID,
                   '' FC_OTDEL
              FROM ASU.TSMID TS
              LEFT JOIN ASU.TSMID TSO ON TSO.FK_ID = TS.FK_OWNER
             WHERE (TS.FL_DEL = 0 OR (pShowDelSmid = 1 AND TS.FL_DEL = 1))
               AND (SELECT COUNT(*)
                      FROM ASU.TSMID T2
                     START WITH FK_ID = TS.FK_ID
                    CONNECT BY PRIOR FK_ID = FK_OWNER) = 1
            CONNECT BY PRIOR TS.FK_ID = TS.FK_OWNER
             START WITH TS.FC_SYNONIM = 'PROC_OPER_NAZ') ts
     WHERE ts.NVID = pSMIDOWNERID;

    delete from asu.ttomp_heal;
    insert into asu.ttomp_heal
    SELECT th.fk_id, th.code, th.fc_name, tnc.fn_cost, tnc.fd_date1, tnc.fd_date2
      FROM asu.theal th
     INNER JOIN asu.theal th_p ON th_p.fk_id = th.fk_parent
     INNER JOIN (SELECT t.FK_HEALID, t.fn_cost, t.fd_date1, t.fd_date2, ttd.fc_name fc_typedoc
                   FROM asu.theal_cost t
                  INNER JOIN (SELECT MAX(t.fk_id) fk_id
                               FROM asu.theal_cost t
                              WHERE SYSDATE BETWEEN t.FD_DATE1 AND NVL(t.FD_DATE2, SYSDATE)
                              GROUP BY t.FK_HEALID) hm ON hm.fk_id = t.fk_id
                  INNER JOIN asu.theal h ON h.fk_id = t.fk_healid
                   LEFT JOIN asu.ttypedoc ttd ON ttd.fk_id = h.fk_doctypeid) tnc ON tnc.FK_HEALID = th.fk_id
     WHERE th.fk_parent = pRazdID;

    delete from asu.ttomp_heal_smid;
    -- pSmidNotNull = 1 and pHealNotNull = 1 then -- и назначение и услуга, добавляется при любом сочитании параметров
    insert into asu.ttomp_heal_smid
    SELECT ts.fk_id   fk_smidid,
           th.fk_id   fk_healid,
           ts.fc_name fc_smidname,
           th.code fc_healcode,
           th.fc_name fc_healname,
           th.fn_cost,
           th.fd_date1,
           th.fd_date2,
           TRIM(asu.get_fullpath_sha(ts.fk_id)) sFullName,
           decode(asu.pkg_smid.GetRootLevelID1(ts.fk_id),
                  asu.get_procid,
                  'Процедура',
                  asu.get_konsid,
                  'Консультация',
                  asu.get_issledid,
                  'Исследование',
                  asu.get_analid,
                  'Анализ') sVid,
           trunc(hs.fd_date1) fd_hs_date1,
           trunc(hs.fd_date2) fd_hs_date2,
           hs.fk_heal_smid,
           hs.fk_heal_smid_dt,
           ts.fl_del,
           ts.fc_otdel,
           ts.fc_owner_name
      FROM asu.ttomp_smid ts
     INNER JOIN (SELECT hs.fk_id, hs.fk_heal, hs.fk_smid, hs.fk_id fk_heal_smid, hsd.fk_id fk_heal_smid_dt, hsd.fd_date1, hsd.fd_date2
                   FROM asu.Theal_Smid hs
                   LEFT JOIN asu.theal_smid_dt hsd ON hsd.fk_heal_smid = hs.fk_id
                  WHERE (hsd.fk_id IS NULL OR
                        SYSDATE BETWEEN hsd.FD_DATE1 AND NVL(hsd.FD_DATE2, SYSDATE))) hs ON hs.fk_smid = ts.fk_id
     INNER JOIN asu.ttomp_heal th ON th.fk_id = hs.fk_heal;

    if pAddHealNoSmid = 1 then -- услуги без назначений
      insert into asu.ttomp_heal_smid
      SELECT null fk_smidid,
             th.fk_id   fk_healid,
             null fc_smidname,
             th.code fc_healcode,
             th.fc_name fc_healname,
             th.fn_cost,
             th.fd_date1,
             th.fd_date2,
             null sFullName,
             null sVid,
             trunc(hs.fd_date1) fd_hs_date1,
             trunc(hs.fd_date2) fd_hs_date2,
             hs.fk_heal_smid,
             hs.fk_heal_smid_dt,
             null fl_del,
             '' fc_otdel,
             '' fc_owner_name
       FROM asu.ttomp_heal th
       LEFT JOIN (SELECT hs.fk_id, hs.fk_heal, hs.fk_smid, hs.fk_id fk_heal_smid, hsd.fk_id fk_heal_smid_dt, hsd.fd_date1, hsd.fd_date2
                     FROM asu.Theal_Smid hs
                     LEFT JOIN asu.theal_smid_dt hsd ON hsd.fk_heal_smid = hs.fk_id
                    WHERE (hsd.fk_id IS NULL OR
                          SYSDATE BETWEEN hsd.FD_DATE1 AND NVL(hsd.FD_DATE2, SYSDATE))) hs ON hs.fk_heal = th.fk_id
       WHERE hs.fk_id IS NULL;
    end if;

    if pAddSmidNoHeal = 1 then -- назнаяения буз услуг
      insert into asu.ttomp_heal_smid
      SELECT ts.fk_id   fk_smidid,
             null fk_healid,
             ts.fc_name fc_smidname,
             null fc_healcode,
             null fc_healname,
             null fn_cost,
             null fd_date1,
             null fd_date2,
             TRIM(asu.get_fullpath_sha(ts.fk_id)) sFullName,
             decode(asu.pkg_smid.GetRootLevelID1(ts.fk_id),
                    asu.get_procid,
                    'Процедура',
                    asu.get_konsid,
                    'Консультация',
                    asu.get_issledid,
                    'Исследование',
                    asu.get_analid,
                    'Анализ') sVid,
             trunc(hs.fd_date1) fd_hs_date1,
             trunc(hs.fd_date2) fd_hs_date2,
             hs.fk_heal_smid,
             hs.fk_heal_smid_dt,
             ts.fl_del,
             ts.fc_otdel,
             ts.fc_owner_name
        FROM asu.ttomp_smid ts
        LEFT JOIN (SELECT hs.fk_id, hs.fk_heal, hs.fk_smid, hs.fk_id fk_heal_smid, hsd.fk_id fk_heal_smid_dt, hsd.fd_date1, hsd.fd_date2
                     FROM asu.Theal_Smid hs
                     LEFT JOIN asu.theal_smid_dt hsd ON hsd.fk_heal_smid = hs.fk_id
                    WHERE (hsd.fk_id IS NULL OR
                          SYSDATE BETWEEN hsd.FD_DATE1 AND NVL(hsd.FD_DATE2, SYSDATE))) hs ON hs.fk_smid = ts.fk_id
       WHERE hs.fk_id IS NULL;
    end if;
  end;
END;
/

SHOW ERRORS;


