DROP PROCEDURE ASU.DO_WRITE_NORM
/

--
-- DO_WRITE_NORM  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMIDNORMS (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_WRITE_NORM" (pFK_ID IN NUMBER,
                            pFK_SMID IN NUMBER,
                            pFN_YEAR1 IN NUMBER,
                            pFN_YEAR2 IN NUMBER,
                            pFN_MOUNTH1 IN NUMBER,
                            pFN_MOUNTH2 IN NUMBER,
                            pFN_DAY1 IN NUMBER,
                            pFN_DAY2 IN NUMBER,
                            pFN_LOW_M IN NUMBER,
                            pFN_HI_M IN NUMBER,
                            pFN_LOW_W IN NUMBER,
                            pFN_HI_W IN NUMBER,
                            pFL_LOW_M_EQ IN NUMBER,
                            pFN_HI_M_EQ IN NUMBER,
                            pFN_LOW_EQ IN NUMBER,
                            pFN_HI_EQ IN NUMBER,
                            pFN_ONE_RES_M IN NUMBER,
                            pFN_ONE_RES_W IN NUMBER) IS
  BEGIN
    IF pFK_ID=-1 THEN
      INSERT INTO TSMIDNORMS(FK_SMID,
                             FN_YEAR1,
                             FN_YEAR2,
                             FN_MOUNTH_1,
                             FN_MOUNTH_2,
                             FN_DAY_1,
                             FN_DAY_2,
                             FN_LOW_M,
                             FN_HI_M,
                             FN_LOW_W,
                             FN_HI_W,
                             FL_LOW_M_EQ,
                             FN_HI_M_EQ,
                             FN_LOW_EQ,
                             FN_HI_EQ,
                             FN_ONE_RES_M,
                             FN_ONE_RES_W) 
                     VALUES (pFK_SMID,
                             pFN_YEAR1,
                             pFN_YEAR2,
                             pFN_MOUNTH1,
                             pFN_MOUNTH2,
                             pFN_DAY1,
                             pFN_DAY2,
                             pFN_LOW_M,
                             pFN_HI_M,
                             pFN_LOW_W,
                             pFN_HI_W,
                             pFL_LOW_M_EQ,
                             pFN_HI_M_EQ,
                             pFN_LOW_EQ,
                             pFN_HI_EQ,
                             pFN_ONE_RES_M,
                             pFN_ONE_RES_W);
    ELSE
      UPDATE TSMIDNORMS SET FN_YEAR1=pFN_YEAR1,
                            FN_YEAR2=pFN_YEAR2,
                            FN_MOUNTH_1=pFN_MOUNTH1,
                            FN_MOUNTH_2=pFN_MOUNTH2,
                            FN_DAY_1=pFN_DAY1,
                            FN_DAY_2=pFN_DAY2,
                            FN_LOW_M=pFN_LOW_M,
                            FN_HI_M=pFN_HI_M,
                            FN_LOW_W=pFN_LOW_W,
                            FN_HI_W=pFN_HI_W,
                            FL_LOW_M_EQ=pFL_LOW_M_EQ,
                            FN_HI_M_EQ=pFN_HI_M_EQ,
                            FN_LOW_EQ=pFN_LOW_EQ,
                            FN_HI_EQ=pFN_HI_EQ,
                            FN_ONE_RES_M=pFN_ONE_RES_M,
                            FN_ONE_RES_W=pFN_ONE_RES_W
      WHERE FK_ID=pFK_ID;
    END IF;
  END;
/

SHOW ERRORS;


