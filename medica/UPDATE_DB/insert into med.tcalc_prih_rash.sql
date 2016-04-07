
  drop INDEX med.tcalc_pr_group_by
  /

  drop INDEX med.tcalc_pr_mogroup_date
  /

  drop INDEX med.tcalc_pr_dpid
  /

  truncate table med.tcalc_prih_rash
  /
  alter trigger med.tcalc_pr_ins disable 
  /
  
  insert into med.tcalc_prih_rash cpr (fk_kartid, fn_kol, fd_date, fk_mogroup,
                                       dpid, dpcid, REZERV_DPCID,
                                       FP_VID, FP_VIDMOVE, PRIH_DPID, FD_INS_DATE, FK_MOID_INS
                                       )
  select
    a.*,
    d4.dpid as PRIH_DPID
     ,sysdate, med.pkg_medses.get_curmo
  from(
    select dp1.kartid as fk_kartid, dp1.fn_kol, d1.fd_data as fd_date, d1.fk_mogroupid_to as fk_mogroup,
           dp1.dpid, dp1.dpcid, decode(d1.fp_vidmove, 4,dp1.dpcid, null) as REZERV_DPCID,
           d1.FP_VID, d1.FP_VIDMOVE
    from  med.tdocs d1, med.tdpc dp1
    where d1.dpid = dp1.dpid and d1.fp_vid in(1,2) and d1.fl_edit = 0
    UNION ALL
      -- расходы
    select dp2.kartid as fk_kartid, -dp2.fn_kol, d2.fd_data as fd_date, d2.fk_mogroupid_from as fk_mogroup,
           dp2.dpid, dp2.dpcid, null as REZERV_DPCID,
           d2.FP_VID, d2.FP_VIDMOVE
    from  med.tdocs d2, med.tdpc dp2
    where d2.dpid = dp2.dpid and d2.fp_vid in(2,3) and d2.fl_edit = 0) a,
      
    (select min(d3.dpid) as dpid, dp3.kartid from med.tdocs d3, med.tdpc dp3
     where  d3.dpid = dp3.dpid and d3.fp_vid = 1 group by dp3.kartid) d4
    where a.fk_kartid = d4.kartid(+)
    /

    commit
    /

  alter trigger med.tcalc_pr_ins enable 
  /

  CREATE INDEX med.tcalc_pr_group_by ON med.tcalc_prih_rash
  ( fk_kartid                       ASC,
    prih_dpid                       ASC,
    rezerv_dpcid                    ASC )
     COMPUTE STATISTICS 
  /

  CREATE INDEX med.tcalc_pr_mogroup_date ON med.tcalc_prih_rash
  ( fk_mogroup                      ASC,
    fd_date                         ASC )
     COMPUTE STATISTICS 
  /

  CREATE INDEX med.tcalc_pr_dpid ON med.tcalc_prih_rash
  ( dpid                            ASC )
   COMPUTE STATISTICS 
  /

--  exec dbms_stats.gather_table_stats('MED', 'tcalc_prih_rash');
--  /


