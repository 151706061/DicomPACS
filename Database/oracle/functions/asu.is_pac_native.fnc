DROP FUNCTION ASU.IS_PAC_NATIVE
/

--
-- IS_PAC_NATIVE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TADRESS (Table)
--   PKG_REGIST_PACFUNC (Package)
--   GET_CURR_REGION_KLADR_ID (Function)
--   TKLADR (Table)
--
CREATE OR REPLACE FUNCTION ASU."IS_PAC_NATIVE" (pfk_pacid IN BINARY_INTEGER)
  RETURN NUMBER IS
  -- Created 20060828 by Spasskiy S.N.
  -- Является ли человек "местным" для ЛПУ по КЛАДР
  nTmp NUMBER;
BEGIN
  nTmp := 0;
  FOR C IN (SELECT FK_KLADR
              FROM TADRESS
             WHERE FK_ID = PKG_REGIST_PACFUNC.GET_PAC_ADRID(pfk_pacid)) LOOP
    IF nvl(C.FK_KLADR, 0) > 0 THEN
      FOR KLADR IN (SELECT FK_ID
                      FROM TKLADR
                     WHERE FL_DEL = 0

                    CONNECT BY FK_ID = PRIOR FK_OWNER
                     START WITH FK_ID = c.fk_kladr
                     ORDER BY FN_LEVEL) LOOP
        IF KLADR.FK_ID = ASU.GET_CURR_REGION_KLADR_ID THEN
          nTmp := 1;
          EXIT;
        END IF;
      END LOOP;
    END IF;
  END LOOP;
  RETURN nTmp;
END;
/

SHOW ERRORS;


