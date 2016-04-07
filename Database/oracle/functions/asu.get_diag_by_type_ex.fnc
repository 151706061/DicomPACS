DROP FUNCTION ASU.GET_DIAG_BY_TYPE_EX
/

--
-- GET_DIAG_BY_TYPE_EX  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TDIAG (Table)
--   TSMID (Table)
--   PKG_STATUTIL (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_DIAG_BY_TYPE_EX" (pfk_pacid IN NUMBER, ptype IN VARCHAR2, pvid IN VARCHAR2) RETURN VARCHAR2 IS

-- Efimov V.A. 01.04.2010 Функция реализует тоn же метод получения диагноза, что используется в CheckPacData.
--   Функция создана для использования в пакете ASU.PKG_exch_upload_master,
--   в связи с задачей http://192.168.1.2:15000/redmine/issues/show/4442

  vResult asu.tsmid.fk_mkb10%type;

BEGIN
  SELECT MAX((SELECT MAX(FK_MKB10)
               FROM asu.TSMID
              WHERE FK_ID = TDIAG.FK_SMDIAGID
                AND FL_DEL = 0))
    INTO vResult
    FROM asu.TDIAG
   WHERE FK_ID =
         (SELECT MAX(tdiag.fk_id)
            FROM asu.tdiag, asu.tsmid
           WHERE (tsmid.fl_del <> 1 or tsmid.fl_del is null)
             and tsmid.fk_id = tdiag.fk_smdiagid
             AND tdiag.fk_pacid = pfk_pacid
             AND tdiag.fl_main = STAT.PKG_STATUTIL.get_smidid(pvid)
             AND tdiag.fp_type = STAT.PKG_STATUTIL.get_smidid(ptype));
  
  return vResult;
END;
/

SHOW ERRORS;


