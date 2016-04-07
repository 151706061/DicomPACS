DROP PROCEDURE ASU.DO_PODPIS_RICHVIEWDATA
/

--
-- DO_PODPIS_RICHVIEWDATA  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TPODPIS_RICHVIEWDATA (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_PODPIS_RICHVIEWDATA" (prichviewdata IN NUMBER,
                                                   psignature    IN VARCHAR2,
                                                   psotr         IN NUMBER) IS
 -- Created 20081110 by Linnikov
BEGIN
 UPDATE TPODPIS_RICHVIEWDATA
    SET FC_SIGNATURE = psignature, FK_SOTR = psotr, FD_DATE = SYSDATE
  WHERE FK_RICHVIEWDATA = prichviewdata;
 IF SQL%ROWCOUNT = 0 THEN
  INSERT INTO TPODPIS_RICHVIEWDATA
   (FK_RICHVIEWDATA, FC_SIGNATURE, FK_SOTR, FD_DATE) --, FC_PUBLIC_KEY)
  VALUES
   (prichviewdata, psignature, psotr, SYSDATE);
 END IF;
END;
/

SHOW ERRORS;


