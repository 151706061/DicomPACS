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
        ( dpid                            ASC) 
         COMPUTE STATISTICS
/
create index med.TMEDIATE_OST_mogroup on MED.TMEDIATE_OST (fk_mogroup) 
        COMPUTE STATISTICS
/
create index med.TMEDIATE_OST_kartid on MED.TMEDIATE_OST (fk_kartid) 
COMPUTE STATISTICS;
/


create or replace package med.pkg_rest is

  -- Public function and procedure declarations
  procedure p_clc_rest( pDate in date );

end;
/
create or replace package body med.pkg_rest is

  -- Public function and procedure declarations
  procedure p_clc_rest( pDate in date )
  is
  begin
    begin
        execute immediate 'drop index med.TMEDIATE_OST_mogroup';
    exception when others then NULL; end;
    begin
      execute immediate 'drop index med.TMEDIATE_OST_kartid';
    exception when others then NULL; end;
    begin
      execute immediate 'drop INDEX med.tcalc_pr_group_by';
    exception when others then NULL; end;
    begin
      execute immediate 'drop INDEX med.tcalc_pr_mogroup_date';
    exception when others then NULL; end;
    begin
      execute immediate 'drop INDEX med.tcalc_pr_dpid';
    exception when others then NULL; end;
    
    execute immediate 'truncate table med.tcalc_prih_rash';
    execute immediate 'alter trigger med.tcalc_pr_ins disable';
    execute immediate 'truncate table med.TMEDIATE_OST';

    insert into MED.TMEDIATE_OST (fk_kartid, fk_mogroup, fk_prih_dpid, fn_ost, fk_rezerv_dpcid, fd_begin)
      SELECT aa.fk_kartid, aa.fk_mogroup, aa.PRIH_DPID, sum(aa.fn_kol) as fn_ost, aa.REZERV_DPCID, trunc(pDate) fd_begin
      FROM (SELECT a.*,
                   d4.dpid as PRIH_DPID,
                   sysdate, med.pkg_medses.get_curmo
             FROM (select dp1.kartid as fk_kartid, dp1.fn_kol, d1.fd_data as fd_date, d1.fk_mogroupid_to as fk_mogroup,
                          dp1.dpid, dp1.dpcid, decode(d1.fp_vidmove, 4,dp1.dpcid, null) as REZERV_DPCID,
                          d1.FP_VID, d1.FP_VIDMOVE
                     from med.tdocs d1, med.tdpc dp1
                    where d1.dpid = dp1.dpid and d1.fp_vid in(1,2) and d1.fl_edit = 0
                      AND d1.fd_data < trunc(pDate)+1
                    UNION ALL
                    -- расходы
                   select dp2.kartid as fk_kartid, -dp2.fn_kol, d2.fd_data as fd_date, d2.fk_mogroupid_from as fk_mogroup,
                          dp2.dpid, dp2.dpcid, null as REZERV_DPCID,
                          d2.FP_VID, d2.FP_VIDMOVE
                     from med.tdocs d2, med.tdpc dp2
                    where d2.dpid = dp2.dpid and d2.fp_vid in(2,3) and d2.fl_edit = 0
                      AND d2.fd_data < trunc(pDate)+1) a,

                  (select min(d3.dpid) as dpid, dp3.kartid from med.tdocs d3, med.tdpc dp3
                    where d3.dpid = dp3.dpid and d3.fp_vid = 1
                    group by dp3.kartid) d4
           WHERE a.fk_kartid = d4.kartid(+)) aa
       GROUP BY aa.fk_kartid, aa.fk_mogroup, aa.PRIH_DPID, aa.REZERV_DPCID;

--HAVING SUM(fn_kol) <> 0;

      insert into med.tcalc_prih_rash cpr (fk_kartid, fn_kol, fd_date, fk_mogroup,
                                             dpid, dpcid, REZERV_DPCID,
                                             FP_VID, FP_VIDMOVE, PRIH_DPID, FD_INS_DATE, FK_MOID_INS)
        select
          a.*,
          d4.dpid as PRIH_DPID,
          sysdate, med.pkg_medses.get_curmo
        from(
          select dp1.kartid as fk_kartid, dp1.fn_kol, d1.fd_data as fd_date, d1.fk_mogroupid_to as fk_mogroup,
                 dp1.dpid, dp1.dpcid, decode(d1.fp_vidmove, 4,dp1.dpcid, null) as REZERV_DPCID,
                 d1.FP_VID, d1.FP_VIDMOVE
          from  med.tdocs d1, med.tdpc dp1
          where d1.dpid = dp1.dpid and d1.fp_vid in(1,2) and d1.fl_edit = 0
            AND d1.fd_data >= trunc(pDate)+1
          UNION ALL
            -- расходы
          select dp2.kartid as fk_kartid, -dp2.fn_kol, d2.fd_data as fd_date, d2.fk_mogroupid_from as fk_mogroup,
                 dp2.dpid, dp2.dpcid, null as REZERV_DPCID,
                 d2.FP_VID, d2.FP_VIDMOVE
          from  med.tdocs d2, med.tdpc dp2
          where d2.dpid = dp2.dpid and d2.fp_vid in(2,3) and d2.fl_edit = 0
             AND d2.fd_data >= trunc(pDate)+1) a,

          (select min(d3.dpid) as dpid, dp3.kartid from med.tdocs d3, med.tdpc dp3
           where  d3.dpid = dp3.dpid and d3.fp_vid = 1 group by dp3.kartid) d4
          where a.fk_kartid = d4.kartid(+);

      commit;
      execute immediate 'alter trigger med.tcalc_pr_ins enable';

      execute immediate 'CREATE INDEX med.tcalc_pr_group_by ON med.tcalc_prih_rash '||
        '( fk_kartid                       ASC, '||
        '  prih_dpid                       ASC, '||
        '  rezerv_dpcid                    ASC ) '||
        ' COMPUTE STATISTICS';

      execute immediate 'CREATE INDEX med.tcalc_pr_mogroup_date ON med.tcalc_prih_rash '||
        '( fk_mogroup                      ASC, '||
        '  fd_date                         ASC ) '||
        ' COMPUTE STATISTICS';

      execute immediate 'CREATE INDEX med.tcalc_pr_dpid ON med.tcalc_prih_rash '||
        '( dpid                            ASC) '||
        ' COMPUTE STATISTICS';

      execute immediate 'create index med.TMEDIATE_OST_mogroup on MED.TMEDIATE_OST (fk_mogroup) '||
       ' COMPUTE STATISTICS';

      execute immediate 'create index med.TMEDIATE_OST_kartid on MED.TMEDIATE_OST (fk_kartid) '||
       ' COMPUTE STATISTICS';

  end;

end;
/
