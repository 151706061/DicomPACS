DROP PACKAGE ASU.PKG_STOM
/

--
-- PKG_STOM  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_STOM" is

  function getpicidbytechid(id number)
	 return number;

end pkg_stom;
/

SHOW ERRORS;


