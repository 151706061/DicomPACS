DROP PACKAGE ASU.PKG_STRINGS
/

--
-- PKG_STRINGS  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_STRINGS" 
        IS
            FUNCTION CONCATENATE(
                                 v_rownum    NUMBER,
                                 v_string    VARCHAR2,
                                 v_delimiter VARCHAR2 DEFAULT NULL,
                                 v_call_id   NUMBER   DEFAULT 1
                                )
             RETURN VARCHAR2;
   END;
/

SHOW ERRORS;


