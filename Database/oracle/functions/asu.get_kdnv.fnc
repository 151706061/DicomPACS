DROP FUNCTION ASU.GET_KDNV
/

--
-- GET_KDNV  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_KDNV" (pFD_DATAC IN DATE)
  RETURN NUMBER
IS
  CURSOR c
  IS
    SELECT   /*+ first_row */COUNT (*) AS fn_count
      FROM (SELECT fk_ibid, fc_fam
              FROM tsroky, TKARTA
             WHERE TRUNC(fd_data1) <= pFD_DATAC
               AND TRUNC(fd_data3) >= pFD_DATAC
               AND fk_pryb <> 1
               AND fk_pryb <> 3
               AND fk_pryb <> 7
               AND TKARTA.FK_ID = FK_PACID
               AND TKARTA.FP_TEK_COC = 3
            UNION
                 SELECT   /*+ rule */fk_ibid, fc_fam
                   FROM tsroky, TKARTA
                  WHERE TRUNC(fd_data1) = pFD_DATAC
                    AND TRUNC(fd_data3) >= pFD_DATAC
                    AND (  fk_pryb = 5
                        OR fk_pryb = 6)
                    AND TKARTA.FK_ID = FK_PACID
                    AND TKARTA.FP_TEK_COC = 3);
  i   NUMBER;
BEGIN
  OPEN c;
  FETCH c INTO i;
  CLOSE c;
  RETURN i;
END;
/

SHOW ERRORS;


