DROP FUNCTION ASU.GET_PAC_SEO
/

--
-- GET_PAC_SEO  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PAC_SEO" (pFK_ID IN NUMBER)
  RETURN NUMBER
IS
  CURSOR c (pID NUMBER)
  IS
    SELECT tkarta.fl_seo
      FROM tkarta
     WHERE FK_ID = pID;

  i   NUMBER;
BEGIN
  OPEN c (pFK_ID);
  FETCH c INTO i;
  CLOSE c;
  RETURN i;
END;   -- Function GET_PAC_SEO
/

SHOW ERRORS;


