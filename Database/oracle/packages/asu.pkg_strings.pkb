DROP PACKAGE BODY ASU.PKG_STRINGS
/

--
-- PKG_STRINGS  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_STRINGS" 
        IS
            TYPE string4000_array_type IS TABLE OF VARCHAR2(4000) INDEX BY BINARY_INTEGER;
            g_concatenated_string_array string4000_array_type;
        FUNCTION CONCATENATE(
                             v_rownum    NUMBER,
                             v_string    VARCHAR2,
                             v_delimiter VARCHAR2 DEFAULT NULL,
                            v_call_id   NUMBER   DEFAULT 1
                           )
         RETURN VARCHAR2
         IS
         BEGIN
            IF v_rownum = 1
               THEN
                 g_concatenated_string_array(v_call_id) := v_string;
               ELSE
                 g_concatenated_string_array(v_call_id) := g_concatenated_string_array(v_call_id) ||
                                                             v_delimiter || v_string;
             END IF;
             RETURN g_concatenated_string_array(v_call_id);
       END;
   END;
/

SHOW ERRORS;


