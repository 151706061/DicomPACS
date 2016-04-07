DROP PACKAGE ASU.PKG_SDF
/

--
-- PKG_SDF  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_SDF" IS
  /*Created by A.Nakorjakov 090408*/

  function Get_FormDefaultTemplateID(pSDF_ElementID Number) return Number;
  function get_string(pString VARCHAR2) return VARCHAR2;
  function GenerateScript(SDF_FormID NUMBER) RETURN CLOB;
  function InsertElement(pSmidOwnerID    NUMBER,
                         pElementOwnerID NUMBER,
                         pType           VARCHAR2) return NUMBER;
END; -- Package spec
/

SHOW ERRORS;


