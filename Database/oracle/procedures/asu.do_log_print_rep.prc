DROP PROCEDURE ASU.DO_LOG_PRINT_REP
/

--
-- DO_LOG_PRINT_REP  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TAPPSOTR (Table)
--   TREPORTSPREF (Table)
--   DO_LOG_PRINT (Procedure)
--
CREATE OR REPLACE PROCEDURE ASU.DO_LOG_PRINT_REP (sReportSynonim IN VARCHAR2, pfk_appsotrid IN NUMBER)
IS
  CURSOR Sotr(nAppSotrId IN NUMBER) IS
  SELECT app.fk_sotrid
    FROM login.tappsotr app
   WHERE app.fk_id = nAppSotrId;

  CURSOR Rep(ReportSynonim IN VARCHAR2) IS
  SELECT rp.fk_id
    FROM asu.treportspref rp
   WHERE UPPER( rp.fc_synonim ) = UPPER( ReportSynonim );

  nfk_sotrid   NUMBER;
  nfk_reportid NUMBER;
BEGIN
  nfk_sotrid := -1;
  nfk_reportid := -1;

  FOR s IN Sotr( pfk_appsotrid )
  LOOP
    nfk_sotrid := s.fk_sotrid;
  END LOOP;

  FOR s IN Rep( sReportSynonim )
  LOOP
    nfk_reportid := s.fk_id;
  END LOOP;

  ASU.DO_LOG_PRINT( nfk_reportid, nfk_sotrid );
END;
/

SHOW ERRORS;


