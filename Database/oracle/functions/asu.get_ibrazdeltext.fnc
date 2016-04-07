DROP FUNCTION ASU.GET_IBRAZDELTEXT
/

--
-- GET_IBRAZDELTEXT  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--   GET_IBFORMVALUE (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_IBRAZDELTEXT" (pFK_PACID IN NUMBER, pFK_SMID IN NUMBER, sIfIsNull IN VARCHAR2 DEFAULT NULL)
  RETURN VARCHAR2
IS
-- Purpose: Возвращает текст раздела истории болезни включая подфопмы
-- ---------   ------  -------------------------------------------
-- Sam       19.07.2000      Create
  CURSOR c
  IS
    SELECT   /*+rule*/DECODE (fl_showprint, 0, NULL, (LPAD (' ', 2 * (LEVEL - 1)) || fc_name)) AS Name, get_ibformvalue (pFK_PACID, fk_id, sIfIsNull)  Val
      FROM tsmid
     WHERE fc_type = 'FORM'
     START WITH fk_ID = pFK_SMID
--     START WITH fk_owner = pFK_SMID --Uncomment Here
     CONNECT BY PRIOR fk_id = fk_owner
     order by fn_order;

  sRes   VARCHAR2(32000);
  sC     c%ROWTYPE;
BEGIN
  OPEN c;
  LOOP
    FETCH c INTO sC;
    EXIT WHEN c%NOTFOUND;
    IF TRIM (sC.Name) IS NOT NULL THEN
      sRes := sRes || sC.Name || ': ';
--      raise_application_error(-20002,sc.Name);

    END IF;
    IF sC.Val IS NOT NULL THEN
      sRes := sRes || CHR (10) || sC.Val || '.';
      -- || CHR (10);
      --- || CHR (10);
    END IF;
  END LOOP;
  CLOSE c;
  IF sRes IS NULL THEN
    sRes := sIfIsNull;
  END IF;
  RETURN sRes;
END;   -- Function GET_IBRAZDELTEXT
/

SHOW ERRORS;


