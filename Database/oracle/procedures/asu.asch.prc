DROP PROCEDURE ASU.ASCH
/

--
-- ASCH  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   DBMS_UTILITY (Synonym)
--
CREATE OR REPLACE PROCEDURE ASU."ASCH" 
/*PLF(15): procedure has no parameters */

is
--
-- Purpose: Briefly explain the functionality of the procedure
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  -------------------------------------------
-- Sam 			Create
begin
  DBMS_UTILITY.analyze_database ('COMPUTE');
end;   -- Procedure AS
/

SHOW ERRORS;


