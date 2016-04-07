DROP PACKAGE ASU.PKG_KURS
/

--
-- PKG_KURS  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_KURS" 
  IS

function doins(aname in varchar2,asotrid in number)
return number;

END; -- Package spec
/

SHOW ERRORS;


