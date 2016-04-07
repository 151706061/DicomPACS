DROP PACKAGE BODY ASU.PKG_RLC_MAIN
/

--
-- PKG_RLC_MAIN  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU.PKG_RLC_MAIN is
/* 
   Edited by Spasskiy S.N. 10.12.2008
   Edited by Nikul E. 14.07.2014 
*/ 

function get_typedoc_by_syn(pSyn varchar2) return number is
    nres number;
begin
  select nvl(max(fk_id), -1) into nres from asu.ttypedoc where fc_synonim = pSyn;
  return nres;
end;
  -- Function and procedure implementations 
FUNCTION get_stac_nakl(pPacID number) RETURN NUMBER IS
  nres NUMBER;
  PacTypeDoc NUMBER;
  TypeDocDMS NUMBER;
  TypeDocDOG NUMBER;
  TypeDocUD NUMBER;
BEGIN
     TypeDocDMS := get_typedoc_by_syn('DMS');
     TypeDocDOG := get_typedoc_by_syn('DOGOVOR');
     TypeDocUD := get_typedoc_by_syn('UDOST');
     
     select max(I.FK_TYPEDOCID) into PacTypeDoc from asu.tkarta tk
     left join ASU.TPAC_INSURANCE PI on PI.FK_PACID = tk.fk_id
     left join ASU.TINSURDOCS I on I.FK_ID = PI.FK_INSURDOCID
     where tk.fk_id = pPacID;
     
     SELECT NVL(sum(t.fn_sum),0) into nRes
      FROM (SELECT 
                   FK_TYPEDOCID,
                   case when s.FN_DAYCOUNT < 1 then c_plat.fn_cost else s.FN_DAYCOUNT * c_plat.fn_cost end fn_sum
              FROM (select --s.fk_id as Id_Ill,
                           r.fk_otdelid,
                           I.FK_TYPEDOCID,
                           decode(tu_ds.FK_ID, null, trunc(max(s.fd_data2)) - trunc(min(s.fd_data1)), -- стационар
                                                     ASU.PKG_WORKDAYS.workdays_between(trunc(min(s.fd_data1)), trunc(max(s.fd_data2))+1) -- дневной стационар
                                 )  FN_DAYCOUNT,
                           trunc(max(s.fd_data2)) fd_date2
                     from asu.tkarta tk
                     INNER JOIN asu.tperesel s ON s.fk_pacid = tk.fk_id
                     INNER JOIN ASU.TROOM r ON r.fk_id = s.fk_palataid
                     left join ASU.TPAC_INSURANCE PI on PI.FK_PACID = S.fk_pacid
                     left join ASU.TINSURDOCS I on I.FK_ID = PI.FK_INSURDOCID --!
                     left join (select * from asu.TCOMPANY where fl_del = 0) C on C.FK_ID = I.FK_COMPANYID
                     left join (SELECT distinct tu.FK_ID FROM ASU.TUSLVID tu CONNECT BY PRIOR tu.FK_ID = tu.FK_OWNERID START WITH tu.FK_ID = ASU.DOC_IB_DSROOT) tu_ds on tu_ds.fk_id = tk.fk_uslvidid
                     where s.fk_pacid = pPacID
                     group by r.fk_otdelid,
                           I.FK_TYPEDOCID,
                           tu_ds.fk_id
                    ) s
            INNER JOIN (select t.fc_askid OtdelID, t.fc_replyid TarifID
                         from asu.treplytable t
                        where t.fc_ask = 'OTDEL_KDN'
                          and t.fc_askfield = 'FK_ID'
                          and t.fc_reply = 'PLAT_KDN'||decode(PacTypeDoc, TypeDocDMS, '_DMS', TypeDocDOG, '_DOG', TypeDocUD, '_UD','')
                          and t.fc_replyfield = 'FK_ID') c_ask on c_ask.OtdelID = s.fk_otdelid
            LEFT JOIN (
                      select ts.fk_id as StandartID, ts.fc_name, ts.fc_code, sc.fd_date1, sc.fd_date2, sc.fn_cost
                      from asu.tstandart ts
                      inner join asu.TSTANDART_COST SC ON SC.FK_STANDARTID = TS.FK_ID
                      where fk_razdel in (select fk_id from asu.tstandart_razdel where FC_SYNONYM = 'ROOMTARIF_PLAT'||decode(PacTypeDoc, TypeDocDMS, '_DMS', TypeDocDOG, '_DOG', TypeDocUD, '_UD',''))
                      ) c_plat on c_plat.StandartID = c_ask.TarifID AND s.fd_date2 BETWEEN c_plat.FD_DATE1 AND NVL(c_plat.FD_DATE2, s.fd_date2)) t
      where t.FK_TYPEDOCID = PacTypeDoc;
                      
     RETURN NRES;
END;

FUNCTION get_cost_kdn_by_pac_peresel(pPacID number, pPereselID number) RETURN NUMBER IS
  nres NUMBER;
  PacTypeDoc NUMBER;
  TypeDocDMS NUMBER;
  TypeDocDOG NUMBER;
  TypeDocUD NUMBER;
BEGIN
     TypeDocDMS := get_typedoc_by_syn('DMS');
     TypeDocDOG := get_typedoc_by_syn('DOGOVOR');
     TypeDocUD := get_typedoc_by_syn('UDOST');

     select max(I.FK_TYPEDOCID) into PacTypeDoc from asu.tkarta tk
     left join ASU.TPAC_INSURANCE PI on PI.FK_PACID = tk.fk_id
     left join ASU.TINSURDOCS I on I.FK_ID = PI.FK_INSURDOCID
     where tk.fk_id = pPacID;

     SELECT NVL(sum(t.fn_sum),0) 
            --sum(decode(isDS, null, (trunc(fd_realdate2) - trunc(fd_realdate1)) * fn_sum, ASU.PKG_WORKDAYS.workdays_between(trunc(fd_realdate1),trunc(fd_realdate2)+1) * fn_sum)/fn_daycount)
            into nRes
      FROM (SELECT
                   FK_TYPEDOCID,
                   c_plat.fn_cost fn_sum, --нужна только стоимость
                   isDS,
                   FN_DAYCOUNT,
                   case 
                      when c_plat.fd_date1 <= s.fd_date1 then
                           s.fd_date1
                      when c_plat.fd_date1 > s.fd_date1 and s.fd_date2 <= nvl(c_plat.fd_date2, s.fd_date2) then
                           c_plat.fd_date1
                   end fd_realdate1,
                   
                   case 
                      when c_plat.fd_date2 is null then
                           s.fd_date2
                      when c_plat.fd_date2 <= s.fd_date2 then
                           c_plat.fd_date2
                   end fd_realdate2
              FROM (select --s.fk_id as Id_Ill,
                           tu_ds.fk_id as isDS,
                           r.fk_otdelid,
                           I.FK_TYPEDOCID,
                           decode(tu_ds.FK_ID, null, trunc(max(s.fd_data2)) - trunc(min(s.fd_data1)) + 1, -- стационар
                                                     ASU.PKG_WORKDAYS.workdays_between(trunc(min(s.fd_data1)), trunc(max(s.fd_data2))+1) -- дневной стационар
                                 )  FN_DAYCOUNT,
                           trunc(max(s.fd_data2)) fd_date2,
                           trunc(min(s.fd_data1)) fd_date1
                     from asu.tkarta tk
                     INNER JOIN asu.tperesel s ON s.fk_pacid = tk.fk_id
                     INNER JOIN ASU.TROOM r ON r.fk_id = s.fk_palataid
                     left join ASU.TPAC_INSURANCE PI on PI.FK_PACID = S.fk_pacid
                     left join ASU.TINSURDOCS I on I.FK_ID = PI.FK_INSURDOCID --!
                     left join (select * from asu.TCOMPANY where fl_del = 0) C on C.FK_ID = I.FK_COMPANYID
                     left join (SELECT distinct tu.FK_ID FROM ASU.TUSLVID tu CONNECT BY PRIOR tu.FK_ID = tu.FK_OWNERID START WITH tu.FK_ID = ASU.DOC_IB_DSROOT) tu_ds on tu_ds.fk_id = tk.fk_uslvidid
                     where s.fk_pacid = pPacID and s.fk_id = pPereselID
                     group by r.fk_otdelid,
                           I.FK_TYPEDOCID,
                           tu_ds.fk_id
                    ) s
            INNER JOIN (select t.fc_askid OtdelID, t.fc_replyid TarifID
                         from asu.treplytable t
                        where t.fc_ask = 'OTDEL_KDN'
                          and t.fc_askfield = 'FK_ID'
                          and t.fc_reply = 'PLAT_KDN'||decode(PacTypeDoc, TypeDocDMS, '_DMS', TypeDocDOG, '_DOG', TypeDocUD, '_UD','')
                          and t.fc_replyfield = 'FK_ID') c_ask on c_ask.OtdelID = s.fk_otdelid
            LEFT JOIN (
                      select ts.fk_id as StandartID, ts.fc_name, ts.fc_code, sc.fd_date1, sc.fd_date2, sc.fn_cost
                      from asu.tstandart ts
                      inner join asu.TSTANDART_COST SC ON SC.FK_STANDARTID = TS.FK_ID
                      where fk_razdel in (select fk_id from asu.tstandart_razdel where FC_SYNONYM = 'ROOMTARIF_PLAT'||decode(PacTypeDoc, TypeDocDMS, '_DMS', TypeDocDOG, '_DOG', TypeDocUD, '_UD',''))
                      ) c_plat on c_plat.StandartID = c_ask.TarifID AND s.fd_date2 BETWEEN c_plat.FD_DATE1 AND NVL(c_plat.FD_DATE2, s.fd_date2)
                        --c_plat.fd_date1 <= s.fd_date2 and nvl(c_plat.fd_date2, s.fd_date2) >= s.fd_date1
                        ) t
      where t.FK_TYPEDOCID = PacTypeDoc;

     RETURN NRES;
END;

function GET_KDNS_BY_PAC(pPacid Number) RETURN TGET_KDNS_BY_PAC pipelined IS 
    Res SYS_REFCURSOR;
  PacTypeDoc NUMBER;
  TypeDocDMS NUMBER;
  TypeDocDOG NUMBER;
  TypeDocUD NUMBER;
  InsurDocID Number;
begin
    TypeDocDMS := get_typedoc_by_syn('DMS');
    TypeDocDOG := get_typedoc_by_syn('DOGOVOR');
    TypeDocUD := get_typedoc_by_syn('UDOST');
     
    select max(I.FK_TYPEDOCID), max(i.fk_id) into PacTypeDoc, InsurDocID from asu.tkarta tk
    left join ASU.TPAC_INSURANCE PI on PI.FK_PACID = tk.fk_id
    left join ASU.TINSURDOCS I on I.FK_ID = PI.FK_INSURDOCID
    where tk.fk_id = pPacID;
     
    FOR C in (
        SELECT 
                pPacid as FK_PACID,
                InsurDocID as FK_INSURDOCID,
                s.FK_PERESELID,
                c_plat.FC_NAME,
                c_plat.FC_CODE,
                case when s.FN_DAYCOUNT < 1 then 1 else s.FN_DAYCOUNT end KOL_USL,
                c_plat.fn_cost,
                case when s.FN_DAYCOUNT < 1 then c_plat.fn_cost else s.FN_DAYCOUNT * c_plat.fn_cost end fn_sum
            FROM (select --s.fk_id as Id_Ill,
                           s.fk_id as FK_PERESELID,
                           r.fk_otdelid,
                           I.FK_TYPEDOCID,
                           decode(tu_ds.FK_ID, null, trunc(max(s.fd_data2)) - trunc(min(s.fd_data1)), -- стационар
                                                     ASU.PKG_WORKDAYS.workdays_between(trunc(min(s.fd_data1)), trunc(max(s.fd_data2))+1) -- дневной стационар
                                 )  FN_DAYCOUNT,
                           trunc(max(s.fd_data2)) fd_date2
                     from asu.tkarta tk
                     INNER JOIN asu.tperesel s ON s.fk_pacid = tk.fk_id
                     INNER JOIN ASU.TROOM r ON r.fk_id = s.fk_palataid
                     left join ASU.TPAC_INSURANCE PI on PI.FK_PACID = S.fk_pacid
                     left join ASU.TINSURDOCS I on I.FK_ID = PI.FK_INSURDOCID --!
                     left join (select * from asu.TCOMPANY where fl_del = 0) C on C.FK_ID = I.FK_COMPANYID
                     left join (SELECT distinct tu.FK_ID FROM ASU.TUSLVID tu CONNECT BY PRIOR tu.FK_ID = tu.FK_OWNERID START WITH tu.FK_ID = ASU.DOC_IB_DSROOT) tu_ds on tu_ds.fk_id = tk.fk_uslvidid
                     where s.fk_pacid = pPacID
                     group by r.fk_otdelid,
                           I.FK_TYPEDOCID,
                           tu_ds.fk_id,
                           s.fk_id
                    ) s
            INNER JOIN (select t.fc_askid OtdelID, t.fc_replyid TarifID
                         from asu.treplytable t
                        where t.fc_ask = 'OTDEL_KDN'
                          and t.fc_askfield = 'FK_ID'
                          and t.fc_reply = 'PLAT_KDN'||decode(PacTypeDoc, TypeDocDMS, '_DMS', TypeDocDOG, '_DOG', TypeDocUD, '_UD','')
                          and t.fc_replyfield = 'FK_ID') c_ask on c_ask.OtdelID = s.fk_otdelid
            LEFT JOIN (
                      select ts.fk_id as StandartID, ts.fc_name, ts.fc_code, sc.fd_date1, sc.fd_date2, sc.fn_cost
                      from asu.tstandart ts
                      inner join asu.TSTANDART_COST SC ON SC.FK_STANDARTID = TS.FK_ID
                      where fk_razdel in (select fk_id from asu.tstandart_razdel where FC_SYNONYM = 'ROOMTARIF_PLAT'||decode(PacTypeDoc, TypeDocDMS, '_DMS', TypeDocDOG, '_DOG', TypeDocUD, '_UD',''))
                      ) c_plat on c_plat.StandartID = c_ask.TarifID AND s.fd_date2 BETWEEN c_plat.FD_DATE1 AND NVL(c_plat.FD_DATE2, s.fd_date2)
            where FK_TYPEDOCID = PacTypeDoc)
    LOOP
        pipe row (c);
    END LOOP;
    --Return RES;
end;

function GET_KDNS_BY_PAC_WORK(pPacid Number) RETURN TGET_KDNS_BY_PAC pipelined IS 
    Res SYS_REFCURSOR;
  PacTypeDoc NUMBER;
  TypeDocDMS NUMBER;
  TypeDocDOG NUMBER;
  TypeDocUD NUMBER;
  InsurDocID Number;
begin
    TypeDocDMS := get_typedoc_by_syn('DMS');
    TypeDocDOG := get_typedoc_by_syn('DOGOVOR');
    TypeDocUD := get_typedoc_by_syn('UDOST');
     
    select max(I.FK_TYPEDOCID), max(i.fk_id) into PacTypeDoc, InsurDocID from asu.tkarta tk
    left join ASU.TPAC_INSURANCE PI on PI.FK_PACID = tk.fk_id
    left join ASU.TINSURDOCS I on I.FK_ID = PI.FK_INSURDOCID
    where tk.fk_id = pPacID;
     
    FOR C in (
        SELECT 
                pPacid as FK_PACID,
                InsurDocID as FK_INSURDOCID,
                s.FK_PERESELID,
                c_plat.FC_NAME,
                c_plat.FC_CODE,
                case when s.FN_DAYCOUNT < 1 then 1 else s.FN_DAYCOUNT end KOL_USL,
                c_plat.fn_cost,
                case when s.FN_DAYCOUNT < 1 then c_plat.fn_cost else s.FN_DAYCOUNT * c_plat.fn_cost end fn_sum
            FROM (select --s.fk_id as Id_Ill,
                           s.fk_id as FK_PERESELID,
                           r.fk_otdelid,
                           I.FK_TYPEDOCID,
                           decode(tu_ds.FK_ID, null, trunc(max(s.fd_data2)) - trunc(min(s.fd_data1)) - nvl(Trunc((SELECT SUM(tpi.fd_data2 - tpi.fd_data1) FROM asu.tperesel_interim tpi WHERE tpi.fk_pereselid = s.fk_id AND tpi.fl_del = 0)),1), -- стационар
                                                     ASU.PKG_WORKDAYS.workdays_between(trunc(min(s.fd_data1)), trunc(max(s.fd_data2))+1) -- дневной стационар
                                 )  FN_DAYCOUNT,
                           trunc(max(s.fd_data2)) fd_date2
                     from asu.tkarta tk
                     INNER JOIN (SELECT fk_id, fk_palataid, fk_pacid, 
                                       fd_data1, 
                                       fd_data2, 
                                       fk_koykavidid, fk_pereselid
                                FROM (SELECT fk_id, fk_palataid, fk_pacid, 
                                      fd_data1, 
                                      fd_data2, fk_koykavidid, fk_id AS fk_pereselid
                                      FROM asu.tperesel 
                                      UNION ALL 
                                      SELECT fk_id, fk_palataid, fk_pacid, fd_data1, fd_data2, fk_koykavidid, fk_pereselid
                                      FROM asu.tperesel_interim WHERE fl_del = 0)) s ON s.fk_pacid = tk.fk_id
                     INNER JOIN ASU.TROOM r ON r.fk_id = s.fk_palataid
                     left join ASU.TPAC_INSURANCE PI on PI.FK_PACID = S.fk_pacid
                     left join ASU.TINSURDOCS I on I.FK_ID = PI.FK_INSURDOCID --!
                     left join (select * from asu.TCOMPANY where fl_del = 0) C on C.FK_ID = I.FK_COMPANYID
                     left join (SELECT distinct tu.FK_ID FROM ASU.TUSLVID tu CONNECT BY PRIOR tu.FK_ID = tu.FK_OWNERID START WITH tu.FK_ID = ASU.DOC_IB_DSROOT) tu_ds on tu_ds.fk_id = tk.fk_uslvidid
                     where s.fk_pacid = pPacID
                     group by r.fk_otdelid,
                           I.FK_TYPEDOCID,
                           tu_ds.fk_id,
                           s.fk_id
                    ) s
            INNER JOIN (select t.fc_askid OtdelID, t.fc_replyid TarifID
                         from asu.treplytable t
                        where t.fc_ask = 'OTDEL_KDN'
                          and t.fc_askfield = 'FK_ID'
                          and t.fc_reply = 'PLAT_KDN'||decode(PacTypeDoc, TypeDocDMS, '_DMS', TypeDocDOG, '_DOG', TypeDocUD, '_UD','')
                          and t.fc_replyfield = 'FK_ID') c_ask on c_ask.OtdelID = s.fk_otdelid
            LEFT JOIN (
                      select ts.fk_id as StandartID, ts.fc_name, ts.fc_code, sc.fd_date1, sc.fd_date2, sc.fn_cost
                      from asu.tstandart ts
                      inner join asu.TSTANDART_COST SC ON SC.FK_STANDARTID = TS.FK_ID
                      where fk_razdel in (select fk_id from asu.tstandart_razdel where FC_SYNONYM = 'ROOMTARIF_PLAT'||decode(PacTypeDoc, TypeDocDMS, '_DMS', TypeDocDOG, '_DOG', TypeDocUD, '_UD',''))
                      ) c_plat on c_plat.StandartID = c_ask.TarifID AND s.fd_date2 BETWEEN c_plat.FD_DATE1 AND NVL(c_plat.FD_DATE2, s.fd_date2)
            where FK_TYPEDOCID = PacTypeDoc)
    LOOP
        pipe row (c);
    END LOOP;
    --Return RES;
end;

FUNCTION get_amb_nakl RETURN NUMBER IS
  nres NUMBER;
BEGIN
  SELECT to_number(ASU.PKG_SMINI.READSTRING('CONFIG_RLC', 'AMB_PCNT', '0'))
    INTO nres
    FROM dual;
  RETURN NRES;
END;

PROCEDURE set_amb_nakl(pValue IN NUMBER) IS
BEGIN
  ASU.PKG_SMINI.WRITESTRING('CONFIG_RLC', 'AMB_PCNT', pValue);
END;

PROCEDURE set_stac_nakl(pValue IN NUMBER) IS
BEGIN
  ASU.PKG_SMINI.WRITESTRING('CONFIG_RLC', 'STAC_KDN', pValue);
END;

function get_pac_med_cost(pPacID in number) return number is
    cursor cCost is
      SELECT round(SUM(b.FN_SUMM), 2) AS FN_SUMM
      FROM (SELECT dp.fd_date_spis AS FD_DATE,
               k.medicid,
               k.kartid,
               dp.fn_kol,
               (dp.fn_kol * k.fn_price) AS FN_SUMM,
               d.fk_mogroupid_to AS FK_PacID,
               tnazmed.fk_vrachid
          FROM med.tdocs d, med.tdpc dp, med.tkart k, tnazmark, asu.tnazmed
         WHERE dp.kartid = k.kartid
           AND d.dpid = dp.dpid
           AND d.fp_vid = 3
           AND d.fp_vidmove = 8 
           AND d.fn_spisanievid = 3
           AND d.fl_edit = 0
           AND dp.fk_nazmark_id = tnazmark.fk_id
           AND tnazmed.fk_id = tnazmark.fk_nazid
           AND d.fk_mogroupid_to = pPacID
          union all
          SELECT  
               dp.fd_date_spis AS FD_DATE,
               k.medicid,
               k.kartid,
               dp.fn_kol,
               (dp.fn_kol * k.fn_price) AS FN_SUMM,
               d.fk_mogroupid_to AS FK_PacID,
               dp.fk_nazvrachid
           FROM /*ASU.TNAZMARK NM,*/ med.tdocs d, med.tdpc dp, med.tkart k, med.tmedic m, med.tei fei
           WHERE 
               dp.dpid = d.dpid(+) and
               dp.kartid = k.kartid(+) and
               dp.dpid = d.dpid(+) and
               m.FK_FPACKID = fei.eiid(+) and
               k.medicid = m.medicid and
               (dp.FK_NAZMEDLECH_ID is null) and (dp.FK_NAZMEDID is null) and
               (/*(dp.fk_nazmark_id = NM.fk_id) AND*/ (d.fk_mogroupid_to = pPacID))
           ) b;
    nRes number;
  begin
    nRes := 0;
    for c in cCost
    loop
      nRes := c.fn_summ;
    end loop;
    return(nvl(nRes, 0));
  end;

   function get_ambtalon_med_cost(pTalonID in number) return number is
    cursor cCost is
      SELECT round(SUM(b.FN_SUMM), 2) AS FN_SUMM
      FROM (SELECT dp.fd_date_spis AS FD_DATE,
               k.medicid,
               k.kartid,
               dp.fn_kol,
               (dp.fn_kol * k.fn_price) AS FN_SUMM,
               d.fk_mogroupid_to AS FK_PacID,
               tnazmed.fk_vrachid
          FROM med.tdocs d, med.tdpc dp, med.tkart k, tnazmark, asu.tnazmed, tambtalon_naz
         WHERE dp.kartid = k.kartid
           AND d.dpid = dp.dpid
           AND d.fp_vid = 3
           AND d.fp_vidmove = 8
           AND d.fn_spisanievid = 3
           AND d.fl_edit = 0
           AND dp.fk_nazmark_id = tnazmark.fk_id
           AND tnazmed.fk_id = tnazmark.fk_nazid
           AND d.fk_mogroupid_to = tambtalon_naz.fk_ambid
           AND tambtalon_naz.fk_talonid = pTalonID
           and tambtalon_naz.fk_nazid = tnazmed.fk_osmotrid) b;
    nRes number;
  begin
    nRes := 0;
    for c in cCost
    loop
      nRes := c.fn_summ;
    end loop;
    return(nvl(nRes, 0));
  end;

 function get_stac_cost(pPacID in number, pMinOrMax in number) return number is
/* Commented by Spasskiy S.N. 21.01.2009 - Засименко : брать только из ветки ПУ, без внимания на компании
 cursor cCost is
      select nvl(sum(fn_mincost), 0),
             nvl(sum(fn_maxcost), 0)
        from (select v.fk_id,
                     min(c.fn_cost) as fn_mincost,
                     max(c.fn_cost) as fn_maxcost
                from vnaz v,
                     tpac_insurance i, --По совету Спасского
                     tinsurdocs d,
                     theal_cost c,
                     theal_smid s
               where v.fk_nazsosid = get_vypnazsosid
                 and v.fk_pacid = pPacID
                 and i.fk_pacid = pPacID
                 and d.fk_id = i.fk_insurdocid
                 and c.fk_companyid in -- Ссылка может быть не только на компанию, но и на группу
                     (select cm.fk_id
                        from tcompany cm
                       start with cm.fk_id = d.fk_companyid
                      connect by cm.fk_id = prior cm.fk_owner)
                 and s.fk_smid = v.fk_smid
                 and s.fk_heal = c.fk_healid
               group by v.fk_id);*/
      cursor cCost is
        SELECT NVL(SUM(FN_COST), 0) --NVL(SUM(FN_MINCOST), 0), NVL(SUM(FN_MAXCOST), 0)
          FROM (SELECT V.FK_ID,
                Coalesce((select nvl(tnh.fn_heal_count, 1) from asu.tnazheal tnh where tnh.fk_nazid = v.fk_id),
		                 (SELECT max(I.FN_NUM) from ASU.TIB I where I.FK_PACID = v.fk_id and I.FK_SMID IN (SELECT ts.fk_id FROM asu.tsmid ts WHERE ts.fc_synonim = 'KOL_VO')),
	                     (select decode(count(vr.fk_id),0,1,count(vr.fk_id)) from asu.vres vr where vr.fk_nazid = v.fk_id and nvl(vr.fl_zakl, -1) <> 1 and vr.fk_sos = asu.get_vipnaz),
		                 1) *
                         asu.pkg_uslugi.GET_HEAL_COST(ASU.PKG_USLUGI.GET_HEAL_ID_BY_NAZ(v.fk_id,v.fk_pacid),v.fd_run) FN_COST
                       --PKG_USLUGI.GET_HEAL_COST(S.FK_HEAL,V.FD_RUN) FN_COST
                  FROM VNAZ V --,
                       --THEAL_SMID S,
                       --(SELECT FK_ID
                       --   FROM THEAL
                        --CONNECT BY PRIOR FK_ID = FK_PARENT
                        --START WITH FK_ID = GET_PLATUSLUG
                        -- ) THEAL
                 WHERE V.FK_NAZSOSID = GET_VYPNAZSOSID
                   AND V.FK_PACID = PPACID
                   --AND THEAL.FK_ID = S.FK_HEAL
                   --AND S.FK_SMID = V.FK_SMID
                   );

    nMin number;
    nMax number;
    nRes number;
  begin
    nRes := 0;

   /* open cCost;
    fetch cCost
      into nMin, nMax;
    if not cCost%notfound then
      if pMinOrMax = 0 then
        nRes := nMin;
      else
        nRes := nMax;
      end if;
    end if;*/
    open cCost;
    fetch cCost
      into nMin;
    if not cCost%notfound then
      nRes := nMin;
    end if;
    nRes := nres + get_pac_med_cost(pPacID);
    return(nRes);
  end;


  function get_amb_cost(pPacID in number, pMinOrMax in number) return number is
     cursor cCost is
/* Commented by Spasskiy S.N. 21.01.2009 - Засименко : брать только из ветки ПУ, без внимания на компании
      select nvl(sum(fn_mincost), 0),
             nvl(sum(fn_maxcost), 0)
        from (select v.fk_id,
                     min(c.fn_cost) as fn_mincost,
                     max(c.fn_cost) as fn_maxcost
                from vnaz v,
                     tambtalon tln,
                     tambtalon_naz an,
                     tinsurdocs d,
                     theal_cost c,
                     theal_smid s
               where v.fk_nazsosid = get_vypnazsosid
                 and v.fk_id = an.fk_nazid
                 and an.fk_talonid = tln.fk_id
                 and tln.fk_ambid = pPacID
                 and d.fk_id = tln.fk_insuranceid
                 and c.fk_companyid in -- Ссылка может быть не только на компанию, но и на группу
                     (select cm.fk_id
                        from tcompany cm
                       start with cm.fk_id = d.fk_companyid
                      connect by cm.fk_id = prior cm.fk_owner)
                 and s.fk_smid = v.fk_smid
                 and s.fk_heal = c.fk_healid
               group by v.fk_id);*/
    select NVL(SUM(FN_COST), 0)
        from (select v.fk_id,
                     Coalesce((select nvl(tnh.fn_heal_count, 1) from asu.tnazheal tnh where tnh.fk_nazid = v.fk_id),
		                      (SELECT max(I.FN_NUM) from ASU.TIB I where I.FK_PACID = v.fk_id and I.FK_SMID IN (SELECT ts.fk_id FROM asu.tsmid ts WHERE ts.fc_synonim = 'KOL_VO')),
	                          (select decode(count(vr.fk_id),0,1,count(vr.fk_id)) from asu.vres vr where vr.fk_nazid = v.fk_id and nvl(vr.fl_zakl, -1) <> 1 and vr.fk_sos = asu.get_vipnaz),
		                       1) *
                              asu.pkg_uslugi.GET_HEAL_COST(ASU.PKG_USLUGI.GET_HEAL_ID_BY_NAZ(v.fk_id,v.fk_pacid),v.fd_run) FN_COST
                     --PKG_USLUGI.GET_HEAL_COST(S.FK_HEAL,V.FD_RUN) FN_COST
                from vnaz v,
                     tambtalon tln,
                     tambtalon_naz an --,
                     --theal_smid s,
                     --(SELECT FK_ID
                     --   FROM THEAL
                      --CONNECT BY PRIOR FK_ID = FK_PARENT
                      --START WITH FK_ID = GET_PLATUSLUG
                     -- ) THEAL
               where v.fk_nazsosid = get_vypnazsosid
                 and v.fk_id = an.fk_nazid
                 and an.fk_talonid = tln.fk_id
                 and tln.fk_ambid = pPacID
                 --and s.fk_smid = v.fk_smid
                 --AND THEAL.FK_ID = S.FK_HEAL
                 );
    nMin number;
    nMax number;
    nRes number;
  begin
    nRes := 0;

/*    open cCost;
    fetch cCost
      into nMin, nMax;
    if not cCost%notfound then
      if pMinOrMax = 0 then
        nRes := nMin;
      else
        nRes := nMax;
      end if;
    end if;*/

    open cCost;
    fetch cCost
      into nMin;
    if not cCost%notfound then
      nRes := nMin;
    end if;
    nRes := nres + get_pac_med_cost(pPacID);
    return(nRes);
  end;

  function get_ambtalon_cost(pTalonID in number, pMinOrMax in number)
    return number is
/* Commented by Spasskiy S.N. 21.01.2009 - Засименко : брать только из ветки ПУ, без внимания на компании
      cursor cCost is
      select nvl(sum(fn_mincost), 0),
             nvl(sum(fn_maxcost), 0)
        from (select v.fk_id,
                     min(c.fn_cost) as fn_mincost,
                     max(c.fn_cost) as fn_maxcost
                from vnaz v,
                     tambtalon tln,
                     tambtalon_naz an,
                     tinsurdocs d,
                     theal_cost c,
                     theal_smid s
               where v.fk_nazsosid = get_vypnazsosid
                 and v.fk_id = an.fk_nazid
                 and an.fk_talonid = tln.fk_id
                 and tln.fk_id = pTalonID
                 and d.fk_id = tln.fk_insuranceid
                 and c.fk_companyid in -- Ссылка может быть не только на компанию, но и на группу
                     (select cm.fk_id
                        from tcompany cm
                       start with cm.fk_id = d.fk_companyid
                      connect by cm.fk_id = prior cm.fk_owner)
                 and s.fk_smid = v.fk_smid
                 and s.fk_heal = c.fk_healid
               group by v.fk_id);*/
       cursor cCost is
       select nvl(sum(fn_cost), 0)
        from (select v.fk_id,
                     asu.pkg_uslugi.GET_HEAL_COST(ASU.PKG_USLUGI.GET_HEAL_ID_BY_NAZ(v.fk_id,v.fk_pacid),v.fd_run) FN_COST
                     --PKG_USLUGI.GET_HEAL_COST(S.FK_HEAL,V.FD_RUN) FN_COST
                from vnaz v,
                     tambtalon tln,
                     tambtalon_naz an --,
                     --theal_smid s,
                     --(SELECT FK_ID
                     --   FROM THEAL
                      --CONNECT BY PRIOR FK_ID = FK_PARENT
                      --START WITH FK_ID = GET_PLATUSLUG
                     -- ) THEAL
               where v.fk_nazsosid = get_vypnazsosid
                 and v.fk_id = an.fk_nazid
                 and an.fk_talonid = tln.fk_id
                 and tln.fk_id = pTalonID
                 --and s.fk_smid = v.fk_smid
                 --AND THEAL.FK_ID = S.FK_HEAL
                 );

    nMin number;
    nMax number;
    nRes number;
  begin
    nRes := 0;
/*
    open cCost;
    fetch cCost
      into nMin, nMax;
    if not cCost%notfound then
      if pMinOrMax = 0 then
        nRes := nMin;
      else
        nRes := nMax;
      end if;
    end if;*/
    open cCost;
    fetch cCost
     into nMin;
    if not cCost%notfound then
        nRes := nMin;
    end if;
    nRes := nRes + get_ambtalon_med_cost(pTalonID);
    return(nRes);
  end;

  function get_stac_tomp(pPacID in number) return number is
    cursor cDiag(nType in number) is
      select s.fk_mkb10,
             d.fd_date
        from tsmid s,
             tdiag d
       where d.fk_pacid = pPacID
         and d.fk_smdiagid = s.fk_id
         and d.fp_type = nType
         and d.fl_main = bSMIDMain
       order by d.fd_date desc;
    sMKB10 varchar2(10);
    dDate  date;
    sTOMP  varchar2(4000);
    nRes   number;
  begin
    nRes := 0;

    open cDiag(nSMIDPriVipiske);
    fetch cDiag
      into sMKB10, dDate;
    if cDiag%notfound then
      close cDiag;
      open cDiag(nSMIDClinik);
      fetch cDiag
        into sMKB10, dDate;
      if cDiag%notfound then
        close cDiag;
        return(nRes);
      end if;
      close cDiag;
    else
      close cDiag;
    end if;

    sTOMP := exch43.get_stac_pac_tomp(pPacID, sMKB10);
    nRes  := get_tomp_cost(sTOMP, dDate);

    return(nRes);
  end;

 function get_stac_cost_total(pPacID in number) return number is
  nRes  number;
 begin
   nres := get_stac_cost(pPacID,1) + /*asu.get_packdn(pPacID)* */get_stac_nakl(pPacID);
   return nvl(nres,0);
 end;

 function get_amb_cost_total(pPacID in number) return number is
  nRes  number;
 /* Commented by Spasskiy S.N. 21.01.2009 - Засименко : брать только из ветки ПУ, без внимания на компании
   cursor cCost is
   select nvl(sum(fn_maxcost), 0) cost
        from (select v.fk_id,
                     max(c.fn_cost)*(1+get_amb_nakl/100) as fn_maxcost
                from vnaz v,
                     tambtalon tln,
                     tambtalon_naz an,
                     tinsurdocs d,
                     theal_cost c,
                     theal_smid s
               where v.fk_nazsosid = get_vypnazsosid
                 and v.fk_id = an.fk_nazid
                 and an.fk_talonid = tln.fk_id
                 and tln.fk_ambid = pPacID
                 and d.fk_id = tln.fk_insuranceid
                 and c.fk_companyid in -- Ссылка может быть не только на компанию, но и на группу
                     (select cm.fk_id
                        from tcompany cm
                       start with cm.fk_id = d.fk_companyid
                      connect by cm.fk_id = prior cm.fk_owner)
                 and s.fk_smid = v.fk_smid
                 and s.fk_heal = c.fk_healid
               group by v.fk_id);*/
   cursor cCost is
   select nvl(sum(fn_maxcost), 0) cost
        from (select v.fk_id,
                     asu.pkg_uslugi.GET_HEAL_COST(ASU.PKG_USLUGI.GET_HEAL_ID_BY_NAZ(v.fk_id,v.fk_pacid),v.fd_run)*(1+get_amb_nakl/100) fn_maxcost
                     --PKG_USLUGI.GET_HEAL_COST(S.FK_HEAL,V.FD_RUN)*(1+get_amb_nakl/100) as fn_maxcost
                from vnaz v,
                     tambtalon tln,
                     tambtalon_naz an --,
                     --theal_smid s,
                     --(SELECT FK_ID
                     --   FROM THEAL
                      --CONNECT BY PRIOR FK_ID = FK_PARENT
                      -- START WITH FK_ID = GET_PLATUSLUG
                      --) THEAL
               where v.fk_nazsosid = get_vypnazsosid
                 and v.fk_id = an.fk_nazid
                 and an.fk_talonid = tln.fk_id
                 and tln.fk_ambid = pPacID
                -- and s.fk_smid = v.fk_smid
                -- AND THEAL.FK_ID = S.FK_HEAL
                );
 begin
  nres := get_amb_cost(pPacID,1) * (1+get_amb_nakl/100);
  return nvl(nres,0);
 end;

   FUNCTION get_ambtalon_cost_total(pTalonID IN NUMBER) RETURN NUMBER IS
/* Commented by Spasskiy S.N. 21.01.2009 - Засименко : брать только из ветки ПУ, без внимания на компании
     CURSOR cCost IS
      SELECT nvl(SUM(fn_maxcost), 0) cost
        FROM (SELECT v.fk_id,
                     MAX(c.fn_cost) * (1 + get_amb_nakl / 100) AS fn_maxcost
                FROM vnaz          v,
                     tambtalon     tln,
                     tambtalon_naz an,
                     tinsurdocs    d,
                     theal_cost    c,
                     theal_smid    s
               WHERE v.fk_nazsosid = get_vypnazsosid
                 AND v.fk_id = an.fk_nazid
                 AND an.fk_talonid = tln.fk_id
                 AND tln.fk_id = pTalonID
                 AND d.fk_id = tln.fk_insuranceid
                 AND c.fk_companyid IN -- Ссылка может быть не только на компанию, но и на группу
                     (SELECT cm.fk_id
                        FROM tcompany cm
                       START WITH cm.fk_id = d.fk_companyid
                      CONNECT BY cm.fk_id = PRIOR cm.fk_owner)
                 AND s.fk_smid = v.fk_smid
                 AND s.fk_heal = c.fk_healid
               GROUP BY v.fk_id);*/
    CURSOR cCost IS
      SELECT nvl(SUM(fn_maxcost), 0) cost
        FROM (SELECT v.fk_id,
                     asu.pkg_uslugi.GET_HEAL_COST(ASU.PKG_USLUGI.GET_HEAL_ID_BY_NAZ(v.fk_id,v.fk_pacid),v.fd_run)*(1 + get_amb_nakl / 100) AS fn_maxcost
                     --PKG_USLUGI.GET_HEAL_COST(S.FK_HEAL,V.FD_RUN)*(1 + get_amb_nakl / 100) AS fn_maxcost
                from vnaz v,
                     tambtalon tln,
                     tambtalon_naz an --,
                     --theal_smid s,
                     --(SELECT FK_ID
                      --  FROM THEAL
                      --CONNECT BY PRIOR FK_ID = FK_PARENT
                       --START WITH FK_ID = GET_PLATUSLUG
                     -- ) THEAL
               where v.fk_nazsosid = get_vypnazsosid
                 and v.fk_id = an.fk_nazid
                 and an.fk_talonid = tln.fk_id
                 and tln.fk_id = pTalonID
                 --and s.fk_smid = v.fk_smid
                 --AND THEAL.FK_ID = S.FK_HEAL
               group by v.fk_id);

    nRes NUMBER;
  BEGIN
   NRES := GET_AMBTALON_COST(pTalonID,1) * (1+GET_AMB_NAKL/100);
   RETURN NVL(NRES,0);
  END;

  function get_amb_tomp(pPacID in number) return number is
    cursor cAmb is
      select tln.fk_id
        from tambtalon tln
       where tln.fk_ambid = pPacID;
    nRes number;
  begin
    nRes := 0;

    for C in cAmb loop
      nRes := nRes + get_ambtalon_tomp(C.fk_id);
    end loop;

    return(nRes);
  end;

  function get_ambtalon_tomp(pTalonID in number) return number is
    cursor cDiag is
      select s.fk_mkb10,
             d.fd_date
        from tsmid s,
             tdiag d,
             tambtalon tln
       where d.fk_smdiagid = s.fk_id
         and d.fk_id = tln.fk_diagmain
         and tln.fk_id = pTalonID;
    sMKB10 varchar2(10);
    dDate  date;
    sTOMP  varchar2(4000);
    nRes   number;
  begin
    nRes := 0;

    open cDiag;
    fetch cDiag
      into sMKB10, dDate;
    if cDiag%notfound then
      close cDiag;
      return(nRes);
    else
      close cDiag;
    end if;

    sTOMP := exch43.get_amb_pac_tomp(pTalonID, sMKB10);
    nRes  := get_tomp_cost(sTOMP, dDate);

    return(nRes);
  end;

  function get_stac_diag(pPacID in number) return varchar2 is
    cursor cDiag(nType in number) is
      select s.fk_mkb10
        from tsmid s,
             tdiag d
       where d.fk_pacid = pPacID
         and d.fk_smdiagid = s.fk_id
         and d.fp_type = nType
         and d.fl_main = bSMIDMain;
    sMKB10 varchar2(10);
  begin
    open cDiag(nSMIDPriVipiske);
    fetch cDiag
      into sMKB10;
    if cDiag%notfound then
      close cDiag;
      open cDiag(nSMIDClinik);
      fetch cDiag
        into sMKB10;
      if cDiag%notfound then
        close cDiag;
        return('');
      end if;
      close cDiag;
    else
      close cDiag;
    end if;

    return(sMKB10);
  end;

  function get_ambtalon_diag(pTalonID in number) return varchar2 is
    cursor cDiag is
      select s.fk_mkb10
        from tsmid s,
             tdiag d,
             tambtalon tln
       where d.fk_smdiagid = s.fk_id
         and d.fk_id = tln.fk_diagmain
         and tln.fk_id = pTalonID;
    sMKB10 varchar2(10);
  begin
    open cDiag;
    fetch cDiag
      into sMKB10;
    if cDiag%notfound then
      close cDiag;
      return('');
    else
      close cDiag;
    end if;

    return(sMKB10);
  end;



begin
  -- Initialization
  nSMIDPriVipiske := stat.pkg_statutil.get_smidid('PRI_VYPISKE');
  nSMIDClinik     := stat.pkg_statutil.get_smidid('CLINIK');
  bSMIDMain       := stat.pkg_statutil.get_smidid('MAIN');
end pkg_rlc_main;
/

SHOW ERRORS;


