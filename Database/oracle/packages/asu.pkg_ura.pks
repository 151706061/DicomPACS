DROP PACKAGE ASU.PKG_URA
/

--
-- PKG_URA  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_URA" 
  IS
--

  FUNCTION get_vnaz_result (p_vnaz_fk_id IN NUMBER)
    RETURN CLOB;
--  PRAGMA RESTRICT_REFERENCES(get_vnaz_result,WNDS,WNPS);

  FUNCTION get_vnaz_item_result (
    p_vnaz_fk_id     IN   INTEGER,
    p_smid_synonym   IN   VARCHAR2
  )
    RETURN VARCHAR2;
  FUNCTION get_smid_value (
    p_fk_smid   IN   INTEGER,
    p_type      IN   VARCHAR,
    p_pacid     IN   INTEGER
  )
    RETURN VARCHAR2;
    RETURN CLOB;
  FUNCTION get_path_delim (p_fk_smid IN INTEGER, p_delim  In Char)
  RETURN VARCHAR;
END; -- Package spec
/

SHOW ERRORS;


