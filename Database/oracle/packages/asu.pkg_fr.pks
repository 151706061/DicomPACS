DROP PACKAGE ASU.PKG_FR
/

--
-- PKG_FR  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_FR" 
  IS

  FUNCTION do_diagbytype (
  p_pacid       IN   NUMBER DEFAULT NULL,
  p_type        IN   NUMBER,
  p_main        IN   NUMBER,
  p_nazid       IN   NUMBER DEFAULT -1,
  p_showprint   IN   NUMBER DEFAULT 0
)
  RETURN VARCHAR2;
  PRAGMA RESTRICT_REFERENCES(do_diagbytype,WNDS,WNPS);

  FUNCTION GET_IBEDITVALUE (pacid IN NUMBER, smeditid IN NUMBER)
  RETURN VARCHAR2;
  PRAGMA RESTRICT_REFERENCES(GET_IBEDITVALUE,WNDS,WNPS);
END; -- Package spec
/

SHOW ERRORS;


