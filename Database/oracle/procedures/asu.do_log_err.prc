DROP PROCEDURE ASU.DO_LOG_ERR
/

--
-- DO_LOG_ERR  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   LOG_ERRORS_TAB (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_LOG_ERR" 
   ( str IN varchar2 )

   IS
pragma autonomous_transaction;
BEGIN
  insert into asu.log_errors_tab(error, sql_text)
  values('000', str);
  commit;
END; -- Procedure
/

SHOW ERRORS;


