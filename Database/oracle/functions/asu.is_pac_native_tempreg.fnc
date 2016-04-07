DROP FUNCTION ASU.IS_PAC_NATIVE_TEMPREG
/

--
-- IS_PAC_NATIVE_TEMPREG  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TADRESS (Table)
--   PKG_REGIST_PACFUNC (Package)
--   GET_CURR_REGION_KLADR_ID (Function)
--   GET_REGISTID (Function)
--   TKLADR (Table)
--
CREATE OR REPLACE FUNCTION ASU."IS_PAC_NATIVE_TEMPREG" (pfk_pacid IN BINARY_INTEGER)
  RETURN NUMBER IS
  -- 18.11.2009 Ефимов В.А. Способ получения FK_ID заменён на предложеннй Спасским

  -- Ефимов В.А. 22.05.2009 на основе IS_PAC_NATIVE
  -- Является ли человек "местным" для ЛПУ по КЛАДР на основании временной регистрации
  nTmp NUMBER;
BEGIN
  nTmp := 0;
  FOR C IN (SELECT FK_KLADR
              FROM TADRESS
--             WHERE FK_ID = (SELECT fk_id FROM ASU.TADRESS WHERE FK_PACID = ASU.PKG_REGIST_PACFUNC.GET_PEPL_ID(pfk_pacid) AND FK_TYPE = GET_REGISTID)) LOOP
             WHERE FK_ID = asu.PKG_REGIST_PACFUNC.GET_PAC_ADRID(pfk_pacid, asu. get_registid)) LOOP
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


