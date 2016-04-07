DROP PACKAGE ASU.PKG_MEDLOGTOTAL
/

--
-- PKG_MEDLOGTOTAL  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_MEDLOGTOTAL" is

  -- Author  : ALEX
  -- Created : 16.06.2002 15:23:13
  -- Purpose :

  -- Public type declarations

  -- Public constant declarations

  -- Public variable declarations

  -- Public function and procedure declarations
  FUNCTION Do_MedVydTotal (pFD1 IN DATE, pFD2 IN DATE) RETURN CLOB;
  PROCEDURE PopulateTempTable (pFD1 IN DATE, pFD2 IN DATE);
end pkg_medlogtotal;
/

SHOW ERRORS;


