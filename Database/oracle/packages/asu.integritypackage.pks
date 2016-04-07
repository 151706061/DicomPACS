DROP PACKAGE ASU.INTEGRITYPACKAGE
/

--
-- INTEGRITYPACKAGE  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."INTEGRITYPACKAGE" AS
 procedure InitNestLevel;
 function GetNestLevel return number;
 procedure NextNestLevel;
 procedure PreviousNestLevel;
 end IntegrityPackage;
/

SHOW ERRORS;


