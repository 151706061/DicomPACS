DROP PACKAGE ASU.CONVERSION_API
/

--
-- CONVERSION_API  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."CONVERSION_API" AS
-- --------------------------------------------------------------------------
-- Name         : http://www.oracle-base.com/dba/miscellaneous/conversion_api
-- Author       : DR Timothy S Hall
-- Description  : Provides some base conversion functions.
-- Ammedments   :
--   When         Who       What
--   ===========  ========  =================================================
--   10-SEP-2003  Tim Hall  Initial Creation
-- --------------------------------------------------------------------------

FUNCTION to_base(p_dec   IN  NUMBER,
                 p_base  IN  NUMBER) RETURN VARCHAR2;

FUNCTION to_dec (p_str        IN  VARCHAR2,
                 p_from_base  IN  NUMBER DEFAULT 16) RETURN NUMBER;

FUNCTION to_hex(p_dec  IN  NUMBER) RETURN VARCHAR2;

FUNCTION to_bin(p_dec  IN  NUMBER) RETURN VARCHAR2;

FUNCTION to_oct(p_dec  IN  NUMBER) RETURN VARCHAR2;

END conversion_api;
/

SHOW ERRORS;


