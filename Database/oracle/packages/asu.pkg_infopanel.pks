DROP PACKAGE ASU.PKG_INFOPANEL
/

--
-- PKG_INFOPANEL  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_INFOPANEL" 
is
  function get_timeint_today(pKABVRACHID NUMBER, pSCHEMAID NUMBER:=0) return varchar2;
end;
/

SHOW ERRORS;


