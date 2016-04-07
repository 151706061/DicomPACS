-- Start of DDL Script for View MED.VMEDKART_KOLOST
-- Generated 13-дек-2010 16:41:13 from MED@H100609

CREATE OR REPLACE VIEW med.vmedkart_kolost (
   kartid,
   medicid,
   fn_fpackinupack,
   fn_price,
   fn_kolost,
   fn_ost_type,
   dpcid,
   prih_dpid )
AS
select
  o.fk_kartid as KARTID, k.MEDICID, m.FN_FPACKINUPACK, k.FN_PRICE,
  (o.FN_KOLOST+NVL(t_ost.fn_kol,0)) as FN_KOLOST,
  decode(o.REZERV_DPCID, null,0, 1) as FN_OST_TYPE, o.REZERV_DPCID as DPCID, o.PRIH_DPID
from(
SELECT b.fk_kartid, sum(b.fn_kol) as fn_kolost, b.PRIH_DPID, b.REZERV_DPCID
  FROM 
(SELECT a.fk_kartid, a.fn_kol, a.PRIH_DPID, a.REZERV_DPCID
  FROM med.tcalc_prih_rash a
  where a.fk_mogroup = med.pkg_medses.get_cur_mogroup and
        a.fd_date >= TRUNC(med.pkg_medses.get_data1) and a.fd_date < TRUNC(med.pkg_medses.get_data2+1)
UNION ALL
 SELECT fk_kartid, fn_ost, fk_prih_dpid, fk_rezerv_dpcid from med.tmediate_ost where MED.PKG_MEDSES.get_cur_mogroup_by_cur_mo = fk_mogroup) b
 group by b.fk_kartid, b.PRIH_DPID, b.REZERV_DPCID
  ) o, med.tkart k, med.tmedic m,
  ( select sum(fn_kol) as fn_kol, fk_kartid from med.ttemp_ost where MED.PKG_MEDSES.get_cur_mogroup_by_cur_mo = fk_mogroupid GROUP BY fk_kartid) t_ost
where o.fk_kartid = k.kartid
  and k.medicid = m.medicid
  and o.fk_kartid = t_ost.fk_kartid(+)
/


-- End of DDL Script for View MED.VMEDKART_KOLOST

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
       group by cpr.dpid, cpr.fk_kartid) d4
       where a.fk_kartid = d4.fk_kartid(+);
  else
    delete from med.tcalc_prih_rash cpr where cpr.dpid = :new.dpid;
  end if;
end;
/


-- End of DDL Script for Trigger MED.TDOCS_UPDATE_FL_EDIT

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

CREATE OR REPLACE FUNCTION MED.GET_FK_ATC_ROOT
  ( pFK_ID IN NUMBER)
  RETURN  NUMBER IS
  Temp NUMBER;
BEGIN
  SELECT max(ID) INTO Temp
  FROM rls.clsatc
  WHERE ID IN (SELECT ID FROM rls.clsatc WHERE parentid = 0 AND ID <> 0) START WITH ID = pFK_ID CONNECT BY id = PRIOR parentid AND ID <> 0;

  RETURN Temp;
END;

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

