DROP PACKAGE BODY ASU.PKG_NAZLIST
/

--
-- PKG_NAZLIST  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_NAZLIST"
IS

  function get_nazlistlpu (pSMID in varchar2) Return varchar2 is
    vResult varchar2(1024);
  begin
    select Max(tnh.fc_lpu) into vResult
      from (select ts.fk_id, ts.fc_synonim
              from asu.tsmid ts
            connect by prior ts.fk_owner = ts.fk_id
             start with ts.fk_id = pSMID) ts
     inner join asu.tnazlistheader tnh on tnh.fc_smid_synonim = ts.fc_synonim;

    Return vResult;
  end get_nazlistlpu;

  function get_nazlistaddr (pSMID in varchar2) Return varchar2 is
    vResult varchar2(1024);
  begin
    select Max(tnh.fc_addr) into vResult
      from (select ts.fk_id, ts.fc_synonim
              from asu.tsmid ts
            connect by prior ts.fk_owner = ts.fk_id
             start with ts.fk_id = pSMID) ts
     inner join asu.tnazlistheader tnh on tnh.fc_smid_synonim = ts.fc_synonim;

    Return vResult;
  end get_nazlistaddr;

  function get_nazlistwhere (pSMID in varchar2) Return varchar2 is
    vResult varchar2(1024);
  begin
    select Max(tnh.fc_where) into vResult
      from (select ts.fk_id, ts.fc_synonim
              from asu.tsmid ts
            connect by prior ts.fk_owner = ts.fk_id
             start with ts.fk_id = pSMID) ts
     inner join asu.tnazlistheader tnh on tnh.fc_smid_synonim = ts.fc_synonim;

    Return vResult;
  end get_nazlistwhere;

  function get_nazlistsynonim (pSMID in varchar2) Return varchar2 is
    vResult varchar2(254);
  begin
    select Max(tnh.fc_smid_synonim) into vResult
      from (select ts.fk_id, ts.fc_synonim
              from asu.tsmid ts
            connect by prior ts.fk_owner = ts.fk_id
             start with ts.fk_id = pSMID) ts
     inner join asu.tnazlistheader tnh on tnh.fc_smid_synonim = ts.fc_synonim;

    Return vResult;
  end get_nazlistsynonim;

  -- Отделение к которому относится пациент для отчёта по назначения печатающегося из PriemDll
  function get_PacOtdel (pFK_PACID in Number, pFK_VRACHID in Number) Return varchar2 is
    vResult varchar2(1024);
  begin
    select decode(ASU.IS_AMBULANCE(pFK_PACID),
                  1,
                  ASU.GET_VRACHFCOTDEL(pFK_VRACHID), -- Для амбулаторных пациентов отделее по врачу (Ефимов В.А. 23.10.2009 http://192.168.1.2:15000/redmine/issues/show/1797)
                  DECODE( -- Для стационарных пациентов отделее определяется так же как в титульной части ИБ, но сначала проверяется не в реанимации ли пациент (http://192.168.1.2:15000/redmine/issues/show/1754)
                         (select Max(tk.fc_name) fc_name
                            from asu.vnaz vn
                            left join asu.tsmid ts on ts.fk_id = vn.fk_smid
                            left join asu.tkabinet tk on tk.fk_id = vn.fk_roomid
                           where vn.fk_pacid = pFK_PACID
                             and ts.fc_synonim = 'PROC_REANIM'
                             and vn.FK_NAZSOSID = asu.get_nevip),
                         null,
                         DECODE( -- Для стационарных пациентов отделее определяется так же как в титульной части ИБ
                                (select tod.fc_name
                                   from ASU.TOtdel tod
                                  where tod.fk_id =
                                        (SELECT Max(totdel.fk_id) fk_id
                                           FROM asu.totdel,
                                                asu.tperesel,
                                                asu.troom,
                                                (SELECT Max(fk_id) fk_id -- 30.11.2009 http://192.168.1.2:15000/redmine/issues/show/1754
                                                   FROM asu.tperesel
                                                  WHERE fk_pacid = pFK_PACID
                                                    AND STAT.PKG_STATUTIL.IS_PALATA_PRIEM(fk_palataid) = 0) per
                                          WHERE totdel.fk_id = troom.fk_otdelid
                                            AND troom.fk_id = tperesel.fk_palataid
                                            AND tperesel.fk_id = per.fk_id)),
                                null,
                                'Не указан',
                                (select tod.fc_name
                                   from ASU.TOtdel tod
                                  where tod.fk_id =
                                        (SELECT Max(totdel.fk_id) fk_id
                                           FROM asu.totdel,
                                                asu.tperesel,
                                                asu.troom,
                                                (SELECT Max(fk_id) fk_id -- 30.11.2009 http://192.168.1.2:15000/redmine/issues/show/1754
                                                   FROM asu.tperesel
                                                  WHERE fk_pacid = PFK_PACID
                                                    AND STAT.PKG_STATUTIL.IS_PALATA_PRIEM(fk_palataid) = 0) per
                                          WHERE totdel.fk_id = troom.fk_otdelid
                                            AND troom.fk_id = tperesel.fk_palataid
                                            AND tperesel.fk_id = per.fk_id))),
                         (select Max(tk.fc_name) fc_name
                            from asu.vnaz vn
                            left join asu.tsmid ts on ts.fk_id = vn.fk_smid
                            left join asu.tkabinet tk on tk.fk_id = vn.fk_roomid
                           where vn.fk_pacid = PFK_PACID
                             and ts.fc_synonim = 'PROC_REANIM'
                             and vn.FK_NAZSOSID = asu.get_nevip))) into vResult
      from dual;

    Return vResult;
  end get_PacOtdel;

END;
/

SHOW ERRORS;


