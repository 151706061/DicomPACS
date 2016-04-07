DROP PACKAGE ASU.PKG_KLADR
/

--
-- PKG_KLADR  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TKLADR (Table)
--
CREATE OR REPLACE PACKAGE ASU."PKG_KLADR" IS

  function get_kladr_region(pkladrid asu.tkladr.fk_id%type) return varchar2;

  function get_kladr_raion(pkladrid asu.tkladr.fk_id%type) return varchar2;

  function get_kladr_city(pkladrid asu.tkladr.fk_id%type) return varchar2;

  function get_kladr_street(pkladrid asu.tkladr.fk_id%type) return varchar2;
END;
/

SHOW ERRORS;


