DROP PROCEDURE ASU.DBF_EXCH_EXALLSLUCH
/

--
-- DBF_EXCH_EXALLSLUCH  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TUSLNOCOMPARE (Table)
--   TSLUCH_DBF (Table)
--   TUSL_DBF (Table)
--   TEXSLUCH (Table)
--
CREATE OR REPLACE PROCEDURE ASU.DBF_EXCH_ExAllSluch IS
-- 20131030 EFIMOV V.A. Для всех выгружаемых случаев поставить признак "выгружен"
begin
  for c in (select ts.LPU_ID,
                   ts.PERSON_IDL,
                   ts.ID_ILL,
                   ts.P_ID_ILL,
                   ts.YEAR,
                   ts.MONTH,
                   decode(nvl(ts.fk_groupsluchid, 0), 0, 0, null) fl_cancel, -- fl_cancel проставляется только для случаев не входящих в группу (т.е. обычные случаи и случаи-группы)
                   ts.z$fl_poly FK_POLY,
                   ts.date_s,
                   ts.date_e,
                   ts.fam,
                   ts.im,
                   ts.otch,
                   ts.date_b_day,
                   decode(nvl(ts.fk_groupsluchid, 0), 0, null, ts_pr.ID_ILL) ID_ILL_GR,
                   decode(nvl(ts.fk_groupsluchid, 0), 0, null, ts_pr.p_id_ill) P_ID_ILL_GR,
                   te.id_ill id_ill_ex
              from asu.tsluch_dbf ts_pr
             inner join (select tu.fk_sluchid from asu.tusl_dbf tu left join asu.tuslnocompare tuc on tu.fk_id = tuc.fk_uslid where tuc.fk_id is null group by tu.fk_sluchid) tu on tu.fk_sluchid = ts_pr.fk_id
             inner join asu.tsluch_dbf ts on ts.fk_id = ts_pr.fk_id
                                          or (ts.fk_groupsluchid = ts_pr.fk_id and ts.id_ill <> ts_pr.id_ill)
             left join asu.texsluch te on te.id_ill = ts.id_ill
             where nvl(ts_pr.fk_groupsluchid, 0) = 0
               and ts_pr.total is not null
               and ((ts_pr.OWN = 1) or (ts_pr.OWN = 2)))
  loop
    if c.id_ill_ex is not null then
      update asu.TEXSLUCH t set t.fl_cancel = t.fl_cancel, t.p_id_ill = c.p_id_ill, t.id_ill_gr = c.id_ill_gr, t.p_id_ill_gr = c.p_id_ill_gr where t.id_ill = c.id_ill_ex;
    else
      insert into asu.TEXSLUCH
        (LPU_ID, PERSON_IDL, ID_ILL, P_ID_ILL, YEAR, MONTH, FL_CANCEL, FK_POLY, FD_OPENED, FD_CLOSED, FC_FAM, FC_IM, FC_OTCH, FD_ROJD, ID_ILL_GR, P_ID_ILL_GR)
      values
        (c.LPU_ID,
         c.PERSON_IDL,
         c.ID_ILL,
         c.P_ID_ILL,
         c.YEAR,
         c.MONTH,
         c.fl_cancel, -- fl_cancel проставляется только для случаев не входящих в группу (т.е. обычные случаи и случаи-группы)
         c.FK_POLY,
         c.date_s,
         c.date_e,
         c.fam,
         c.im,
         c.otch,
         c.date_b_day,
         c.ID_ILL_GR,
         c.P_ID_ILL_GR);
    end if;
  end loop;
end;
/

SHOW ERRORS;


