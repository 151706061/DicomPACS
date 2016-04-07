-- Start of DDL Script for Trigger MED.TDOCS_UPDATE_FL_EDIT
-- Generated 22.12.2010 15:59:48 from MED@H100609

CREATE OR REPLACE TRIGGER med.tdocs_update_fl_edit
 AFTER
   UPDATE OF fl_edit
 ON med.tdocs
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  if :new.FL_EDIT = 0 then
    insert into med.tcalc_prih_rash cpr (fk_kartid, fn_kol, fd_date, fk_mogroup,
                                         dpid, dpcid, REZERV_DPCID,
                                         FP_VID, FP_VIDMOVE, PRIH_DPID)
    select
      a.*,
      decode(:new.fp_vid, 1,:new.dpid,  d4.DPID) as PRIH_DPID
--      d4.DPID as PRIH_DPID

    from(
      select dp.kartid as fk_kartid, dp.fn_kol, :new.fd_data as fd_date, :new.fk_mogroupid_to as fk_mogroup,
             dp.dpid, dp.dpcid, decode(:new.fp_vidmove, 4,dp.dpcid, null) as REZERV_DPCID,
             :new.FP_VID, :new.FP_VIDMOVE
      from  med.tdpc dp
      where :new.dpid = dp.dpid and :new.fp_vid in(1,2)
      UNION ALL
      -- расходы
      select dp.kartid as fk_kartid, -dp.fn_kol, :new.fd_data as fd_date, :new.fk_mogroupid_from as fk_mogroup,
             dp.dpid, dp.dpcid, null as REZERV_DPCID,
             :new.FP_VID, :new.FP_VIDMOVE
      from  med.tdpc dp
      where :new.dpid = dp.dpid and :new.fp_vid in(2,3)) a,
      (select cpr.dpid, cpr.fk_kartid from (select dpid, fk_kartid from med.tcalc_prih_rash where fp_vid = 1 union all select fk_prih_dpid, fk_kartid from med.tmediate_ost) cpr
       where cpr.fk_kartid in(select dp5.kartid from med.tdpc dp5 where dp5.dpid = :new.dpid)
         AND cpr.dpid IS NOT NULL
       group by cpr.dpid, cpr.fk_kartid) d4
       where a.fk_kartid = d4.fk_kartid(+);
  else
    delete from med.tcalc_prih_rash cpr where cpr.dpid = :new.dpid;
  end if;
end;
/


-- End of DDL Script for Trigger MED.TDOCS_UPDATE_FL_EDIT

