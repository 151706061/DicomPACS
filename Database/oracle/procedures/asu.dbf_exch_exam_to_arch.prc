DROP PROCEDURE ASU.DBF_EXCH_EXAM_TO_ARCH
/

--
-- DBF_EXCH_EXAM_TO_ARCH  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TUSD_DBF (Table)
--   TUSD_DBF_ARCHIVE (Table)
--   TUSD_DBF_TEMP (Table)
--   TRSD_DBF (Table)
--   TRSD_DBF_ARCHIVE (Table)
--   TRSD_DBF_TEMP (Table)
--
CREATE OR REPLACE PROCEDURE ASU.DBF_EXCH_EXAM_TO_ARCH(aFromTemp in Number) is
begin
  -- 20130611 ƒоработал таким образом, чтобы P_ID_ILL = null приравнивалось P_ID_ILL = 0
  if aFromTemp = 1 then
    delete from asu.trsd_dbf_archive
     where fk_id in (select ta.fk_id
                       from asu.trsd_dbf_temp tt
                      inner join asu.trsd_dbf_archive ta on ta.YEAR = tt.YEAR
                                                        and ta.MONTH = tt.month
                                                        and ta.LPU_ID = tt.lpu_id
                                                        and ta.ID_ILL = tt.ID_ILL
                                                        and nvl(ta.P_ID_ILL, 0) = nvl(tt.P_ID_ILL, 0)
                                                        and nvl(ta.SANK_KOD, 0) = nvl(tt.sank_kod, 0));
    insert into asu.trsd_dbf_archive
      select * from asu.trsd_dbf_temp;
    delete from asu.trsd_dbf_temp;

    delete from asu.tusd_dbf_archive
     where fk_id in (select ta.fk_id
                       from asu.tUSD_dbf_temp tt
                      inner join asu.tusd_dbf_archive ta on ta.YEAR = tt.YEAR
                                                        and ta.MONTH = tt.month
                                                        and ta.LPU_ID = tt.lpu_id
                                                        and ta.ID_ILL = tt.ID_ILL
                                                        and ta.id_ill_u = tt.id_ill_u
                                                        and nvl(ta.P_ID_ILL, 0) = nvl(tt.P_ID_ILL, 0));
    insert into asu.tusd_dbf_archive
      select * from asu.tusd_dbf_temp;
    delete from asu.tusd_dbf_temp;
  else
    delete from asu.trsd_dbf_archive
     where fk_id in (select ta.fk_id
                       from asu.trsd_dbf tt
                      inner join asu.trsd_dbf_archive ta on ta.YEAR = tt.YEAR
                                                        and ta.MONTH = tt.month
                                                        and ta.LPU_ID = tt.lpu_id
                                                        and ta.ID_ILL = tt.ID_ILL
                                                        and nvl(ta.P_ID_ILL, 0) = nvl(tt.P_ID_ILL, 0)
                                                        and nvl(ta.SANK_KOD, 0) = nvl(tt.sank_kod, 0));
    insert into asu.trsd_dbf_archive
      select * from asu.trsd_dbf;
    delete from asu.trsd_dbf;

    delete from asu.tusd_dbf_archive
     where fk_id in (select ta.fk_id
                       from asu.tUSD_dbf tt
                      inner join asu.tusd_dbf_archive ta on ta.YEAR = tt.YEAR
                                                        and ta.MONTH = tt.month
                                                        and ta.LPU_ID = tt.lpu_id
                                                        and ta.ID_ILL = tt.ID_ILL
                                                        and ta.id_ill_u = tt.id_ill_u
                                                        and nvl(ta.P_ID_ILL, 0) = nvl(tt.P_ID_ILL, 0));
    insert into asu.tusd_dbf_archive
      select * from asu.tusd_dbf;
    delete from asu.tusd_dbf;
  end if;
end;
/

SHOW ERRORS;


