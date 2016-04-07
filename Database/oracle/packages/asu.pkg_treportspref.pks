DROP PACKAGE ASU.PKG_TREPORTSPREF
/

--
-- PKG_TREPORTSPREF  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU.pkg_treportspref is

  -- Author  : MELNIKOV ANTON
  -- Created : 25.11.2010 11:23:50
  -- Purpose :

function Get_barcodetype(PSYN in varchar2) return number;
function Get_onallpages(PSYN in varchar2) return number;

end;
/

SHOW ERRORS;


