DROP PROCEDURE ASU.DO_SYN_EXCH_IN_ARCHIVE
/

--
-- DO_SYN_EXCH_IN_ARCHIVE  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSLUCH_DBF_ARCHIVE (Table)
--   TMDA_DBF_ARCHIVE (Table)
--   TUSL_DBF_ARCHIVE (Table)
--   TEXSLUCH_ERR_ARCHIVE (Table)
--
CREATE OR REPLACE PROCEDURE ASU.DO_SYN_EXCH_IN_ARCHIVE(pYear Number, pMonth Number) is
-- Efimov V.A. 20120601 Синхронизирует ссылочные поля таблиц в архиве выгрузки
begin
  UPDATE asu.tusl_dbf_archive u
     SET u.fk_sluchid = (select s.fk_id
                           from asu.tsluch_dbf_archive s
                          WHERE s.id_ill = u.ID_ILL
                            AND nvl(s.p_id_ill, -1) = nvl(u.P_ID_ILL, -1)
                            AND s.year = u.YEAR
                            AND s.month = u.MONTH
                            AND s.lpu_id = u.LPU_ID)
  WHERE u.Month = pMonth and u.Year = pYear;

  UPDATE asu.tmda_dbf_archive u
     SET u.fk_sluchid = (select s.fk_id
                           from asu.tsluch_dbf_archive s
                          WHERE s.id_ill = u.ID_ILL
                            AND nvl(s.p_id_ill, -1) = nvl(u.P_ID_ILL, -1)
                            AND s.year = u.YEAR
                            AND s.month = u.MONTH
                            AND s.lpu_id = u.LPU_ID)
  WHERE u.Month = pMonth and u.Year = pYear;

  UPDATE asu.tmda_dbf_archive u
     SET u.fk_uslid = (select s.fk_id
                           from asu.tusl_dbf_archive s
                          WHERE s.id_ill_u = u.id_ill_u
                            AND s.fk_sluchid = u.fk_sluchid)
  WHERE u.Month = pMonth and u.Year = pYear;

  UPDATE asu.texsluch_err_archive u
     SET u.fk_sluchid = (select s.fk_id
                            from asu.tsluch_dbf_archive s
                           WHERE s.id_ill = u.ID_ILL
                             AND nvl(s.p_id_ill, -1) = nvl(u.P_ID_ILL, -1)
                             AND s.year = u.YEAR
                             AND s.month = u.MONTH
                             AND s.lpu_id = u.LPU_ID);
end DO_SYN_EXCH_IN_ARCHIVE;
/

SHOW ERRORS;


