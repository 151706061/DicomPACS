DROP PACKAGE ASU.PKG_TKARTA_INFO
/

--
-- PKG_TKARTA_INFO  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TKARTA_INFO (Table)
--
CREATE OR REPLACE PACKAGE ASU.PKG_TKARTA_INFO
  IS

 procedure SetFL_MODERNIZACIA(pFK_PACID in number, pFL_MODERNIZACIA in number, pFC_ICD10 asu.tkarta_info.fc_icd10%type);
 function GetFL_MODERNIZACIA(pFK_PACID in number, pFC_ICD10 asu.tkarta_info.fc_icd10%type) return number;

END PKG_TKARTA_INFO; -- Package Specification PKG_DIAGS
/

SHOW ERRORS;


