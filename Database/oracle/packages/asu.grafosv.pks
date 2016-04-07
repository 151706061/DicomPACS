DROP PACKAGE ASU.GRAFOSV
/

--
-- GRAFOSV  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."GRAFOSV" 
  IS


function DoFillMe(d1 in date, d2 in date) return varchar2;

END; -- Package Specification GRAFOSV
/

SHOW ERRORS;


