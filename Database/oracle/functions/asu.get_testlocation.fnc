DROP FUNCTION ASU.GET_TESTLOCATION
/

--
-- GET_TESTLOCATION  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZAN (Table)
--   TLABLOT (Table)
--   TLABREG (Table)
--   TLABSORT (Table)
--   TLABSORTREG (Table)
--   GET_LAB_CUR_DAY (Function)
--   GET_NAZ_REREG (Function)
--   GET_VIPNAZ (Function)
--   TEXPAN (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_TESTLOCATION" (pFK_SMID IN NUMBER, pFD_REGIST IN DATE) RETURN  VARCHAR IS
    CURSOR cLocation IS SELECT  FK_DEFAULT,
                                FK_PLACE,
                                FN_PROBE
                         FROM TNAZAN, TLABREG, TLABSORT, TEXPAN, TLABLOT, tlabsortreg
                        WHERE TNAZAN.FK_ID = TLABREG.FK_NAZID
                              AND TLABSORT.FK_SMID = pFK_SMID
                            --  AND TLABREG.FK_DEFAULT IS NOT NULL
                            --  AND TLABREG.FK_PLACE IS NOT NULL
                          --    AND TLABREG.FK_DEFAULT > 0
                          --    AND TLABREG.FK_PLACE > 0
             AND TLABREG.FK_ID = tlabsortreg.FK_LABREG
             AND TLABLOT.FK_ID = tlabsortreg.FK_LABLOT
             AND TLABLOT.FD_DATE >= GET_LAB_CUR_DAY
                              AND TEXPAN.FK_NAZID = TNAZAN.FK_ID
                              AND TLABSORT.FK_SMID = TEXPAN.FK_SMID
--                              AND TLABREG.FD_REGIST >= TRUNC(pFD_REGIST) AND TLABREG.FD_REGIST < TRUNC(pFD_REGIST + 1)
                         -- AND TRUNC(TLABREG.FD_REGIST) = TRUNC(pFD_REGIST)
                              AND TNAZAN.FK_NAZSOSID <> GET_VIPNAZ
                              AND TNAZAN.FK_NAZSOSID <> GET_NAZ_REREG
                              AND TNAZAN.FK_ID = TLABREG.FK_NAZID
                              AND TLABLOT.FD_DATE >= GET_LAB_CUR_DAY
                              ORDER BY TLABREG.FK_DEFAULT, TLABREG.FK_PLACE, TLABREG.FN_PROBE;


         --    AND TLABSORT.FK_LOCATION = :FK_ID
         --    AND TLABSORT.FK_SMID = TEXPAN.FK_SMID
          --   AND TEXPAN.FK_NAZID = TNAZAN.FK_ID
         --    AND TLABREG.FK_NAZID = TNAZAN.FK_ID
          --   AND TLABREG.FK_DEFAULT > 0
         --    AND TLABREG.FK_PLACE > 0
         --    AND TLABLOT.FN_NUMBER  = TLABREG.FK_DEFAULT
          --   AND TLABREG.FK_ID = tlabsortreg.FK_LABREG
          --   AND TLABLOT.FK_ID = tlabsortreg.FK_LABLOT
          --   AND TLABLOT.FD_DATE >= GET_LAB_CUR_DAY


       --      AND TLABREG.FD_REGIST >= TRUNC(sysdate) AND TLABREG.FD_REGIST < TRUNC(sysdate+1)

        --     AND TNAZAN.FK_NAZSOSID <> GET_VIPNAZ
         --    AND TNAZAN.FK_NAZSOSID <> GET_NAZ_REREG



    str VARCHAR(20);
    sRes VARCHAR (16000);
    cRes CLOB;
BEGIN
    sRes := '';
    FOR str IN cLocation LOOP
        sRes := sRes || str.FN_PROBE || '(' || str.FK_DEFAULT || ', ' || str.FK_PLACE || ');   ';
    END LOOP;
    IF sRes IS NOT NULL THEN
       RETURN  sRes;
    END IF;
    RETURN ' ';
EXCEPTION
   WHEN others THEN
       RETURN NULL;
END;
/

SHOW ERRORS;


