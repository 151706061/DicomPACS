DROP PACKAGE ASU.PKG_MARKS
/

--
-- PKG_MARKS  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_MARKS" 
  IS
--
-- Purpose: Work with marks on patients
--
-- Philip A. Milovanov 19.06.2002
-- ---------   ------  ------------------------------------------
  PROCEDURE SET_MARK(pFK_PACID IN NUMBER,pFK_SOTRID IN NUMBER);
  PROCEDURE CLEAR_MARK(pFK_PACID IN NUMBER,pFK_SOTRID IN NUMBER);
  FUNCTION IS_MARKED(pFK_PACID IN NUMBER,pFK_SOTRID IN NUMBER) RETURN NUMBER;
END; -- Package spec
/

SHOW ERRORS;


