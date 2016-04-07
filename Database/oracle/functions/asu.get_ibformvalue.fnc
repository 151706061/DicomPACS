DROP FUNCTION ASU.GET_IBFORMVALUE
/

--
-- GET_IBFORMVALUE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TIB (Table)
--   TSMID (Table)
--   GET_IBEDITVALUE (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_IBFORMVALUE" (pacid IN NUMBER, formid IN NUMBER, ifisnull VARCHAR2)
  RETURN VARCHAR2
IS
  CURSOR c1
  IS
    SELECT/*+ rule*/
       DISTINCT get_ibeditvalue (pacid, fk_smeditid) AS val, fn_order, fc_type
      FROM tib, tsmid
     WHERE fk_pacid = pacid
       AND fk_owner = formid
       AND fk_smeditid = tsmid.fk_Id
     ORDER BY fn_order;

  sRes    VARCHAR (32767);
  val     VARCHAR2 (4000);
  sType   tsmid.fc_type%TYPE;
  ord     NUMBER;
BEGIN
  OPEN c1;
  LOOP
    FETCH c1 INTO val, ord, sType;
    EXIT WHEN c1%NOTFOUND;
    IF sRes IS NULL THEN
      sRes  := val;
    ELSE
      IF sType IN ('MEMO', 'BIGMEMO') THEN
        sRes  := sRes || val;
      ELSE
        sRes  := sRes || '. ' || val;
      END IF;
    END IF;
  END LOOP;
  IF sRes IS NULL THEN
    sRes  := ifisnull;
  END IF;
--  return replace(replace(replace(sres,': ',': '),' ,',', '),' ;','; ');
  sRes  := REPLACE (sres, ' .', '. ');
  sRes  := REPLACE (sres, ' .', '. ');
  RETURN sres;
END;
/

SHOW ERRORS;


