DROP PACKAGE ASU.PKG_TINSURDOCS_INFO
/

--
-- PKG_TINSURDOCS_INFO  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU.pkg_tinsurdocs_info
  IS

 Function GetInsurdocsInfoID(pFK_ID in number) return number;
  ---------------------------------------------------------------------------------------------------------
  procedure SetFK_SOTRID_CLOSED(pFK_INSURDOCSID in number, pFK_SOTRID in number);
  ---------------------------------------------------------------------------------------------------------
  function GetFK_SOTRID_CLOSED(pFK_INSURDOCSID in number) return number;
  ---------------------------------------------------------------------------------------------------------
  function GetFK_SPECID_CLOSED(pFK_INSURDOCSID in number) return number;
  ---------------------------------------------------------------------------------------------------------



END; -- Package Specification PKG_DIAGS
/

SHOW ERRORS;


