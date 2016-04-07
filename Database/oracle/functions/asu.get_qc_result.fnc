DROP FUNCTION ASU.GET_QC_RESULT
/

--
-- GET_QC_RESULT  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TANALIZATOR_COMPARISONS (Table)
--   TQC_SERIES (Table)
--   TQC_SERIES_DATA (Table)
--   TBL_COMPARISONS (Table)
--   TBL_RESULTS (Table)
--   INC (Procedure)
--   TS_ANALIZATOR (Table)
--   TQC_ANALYST (Table)
--   TQC_LOT (Table)
--   TQC_METHOD (Table)
--   TQC_MGROUP (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_QC_RESULT" (pFK_SOTRID IN NUMBER) RETURN  NUMBER IS
    CURSOR cRESULT IS SELECT T2.FK_ID FK_SERIESID,
                             T8.RES_DATE FD_DATE,
                             TO_NUMBER(REPLACE(T8.RESULT, ',', '.'),'999999.999999','NLS_NUMERIC_CHARACTERS=''.,''') FN_RESULT,
                             T8.FK_ID FK_RESID
                      FROM TQC_SERIES T2,
                           TQC_LOT T3,
                           TQC_METHOD T4,
                           TQC_ANALYST T5,
                           TANALIZATOR_COMPARISONS T6,
                           TBL_COMPARISONS T7,
                           LIS.TBL_RESULTS T8,
                           TQC_MGROUP T9 ,
                           TS_ANALIZATOR T10
                      WHERE T2.FK_LOTID = T3.FK_ID
                            AND T2.FK_METODID = T4.FK_ID
                            AND T4.FK_ANALYSTID = T5.FK_ID
                            AND T6.FK_COMPARISID = T7.FK_ID
                            AND T7.FK_LAB_ISSL_ID = T5.FK_SMID
                            AND T4.FK_MGROUP = T9.FK_ID
                            AND T2.FL_ACTIVE = 1
                            AND T8.FK_SOTRID IS NULL
                            AND T8.AN_RES_CODE = T7.FC_APPARAT_ISSL_ID
                            AND T8.PROBE_NUM = TO_CHAR(T3.FN_PROBE)
                            AND T10.FC_NAME  = T8.PROFILE_NAME
                            AND T9.FK_DEVICEID = T10.FK_ID
                            AND T10.FK_ID = T6.FK_ANALIZATORID
                            AND T8.AN_RES_CODE = T7.FC_APPARAT_ISSL_ID 
                      ORDER BY T8.RES_DATE;

    cRes VARCHAR(30);
    nRes NUMBER;
BEGIN
    nRes := 0;

    For cRes IN cRESULT loop
        INSERT INTO TQC_SERIES_DATA(FN_NUMBER, FK_SERIESID, FD_DATE, FN_RESULT, FL_ACTIVE, FL_DEL, FK_SOTRID)
                    VALUES((SELECT (COUNT(*) + 1) FN_COUNT FROM TQC_SERIES_DATA WHERE FK_SERIESID = cRes.FK_SERIESID),
                            cRes.FK_SERIESID, cRes.FD_DATE, TO_NUMBER(REPLACE(cRes.FN_RESULT, ',', '.'),'999999.999999','NLS_NUMERIC_CHARACTERS=''.,'''),  0, 0, pFK_SOTRID);
        UPDATE LIS.TBL_RESULTS SET FD_DATE = SYSDATE, FK_SOTRID = pFK_SOTRID  WHERE FK_ID = cRes.FK_RESID;
        Inc(nRes);
    end loop;
    RETURN nRes;
EXCEPTION
    WHEN OTHERS THEN   
    nRes := 0;
    For cRes IN cRESULT loop
        INSERT INTO TQC_SERIES_DATA(FN_NUMBER, FK_SERIESID, FD_DATE, FN_RESULT, FL_ACTIVE, FL_DEL, FK_SOTRID)
                    VALUES((SELECT (COUNT(*) + 1) FN_COUNT FROM TQC_SERIES_DATA WHERE FK_SERIESID = cRes.FK_SERIESID),
                            cRes.FK_SERIESID, cRes.FD_DATE, to_number(REPLACE(cRes.FN_RESULT, ',', '.')), 0, 0, pFK_SOTRID);
        UPDATE LIS.TBL_RESULTS SET FD_DATE = SYSDATE, FK_SOTRID = pFK_SOTRID  WHERE FK_ID = cRes.FK_RESID;
        Inc(nRes);
    end loop;  
    RETURN nRes;   
END;
/

SHOW ERRORS;


