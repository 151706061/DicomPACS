DROP FUNCTION ASU.IS_NUMBER1
/

--
-- IS_NUMBER1  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."IS_NUMBER1" (
                     pSTR VARCHAR2
                    )
    RETURN NUMBER
    IS
        vDUMMY NUMBER;
    BEGIN
        vDUMMY := pSTR;
        RETURN 1;
      EXCEPTION
        WHEN VALUE_ERROR 
          THEN
            RETURN 0;
END IS_NUMBER1;
/

SHOW ERRORS;


