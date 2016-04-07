DROP FUNCTION ASU.GET_KLADR_SHORTADDR_BY_ID
/

--
-- GET_KLADR_SHORTADDR_BY_ID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TKLADR (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_KLADR_SHORTADDR_BY_ID" (pfk_id IN TKLADR.FK_ID%TYPE)
  RETURN VARCHAR2 IS
  -- Возвращает строку адреса КЛАДР без страны и региона
  -- Created 08102008 by Spasskiy S.N.
  gRes VARCHAR2(1000);

BEGIN
  FOR c IN (SELECT FC_PREFIX || '. ' || FC_NAME FC_ADDR, fn_level, FC_PREFIX
              FROM TKLADR
             WHERE FL_DEL = 0
            CONNECT BY FK_ID = PRIOR FK_OWNER
             START WITH FK_ID = pfk_id
             ORDER BY FN_LEVEL) LOOP

    IF c.fn_level IN (1) THEN
      IF UPPER(c.fc_prefix) = 'Г' THEN
        gres := gres || ', ' ||c.fc_addr;
      END IF;
    ELSE
      gres := gres || ', ' ||c.fc_addr;
    END IF;

  END LOOP;
  RETURN ltrim(gRes,',');
END GET_KLADR_SHORTADDR_BY_ID;
/

SHOW ERRORS;


