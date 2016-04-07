DROP PACKAGE ASU.QUEST_SL_ERRORS_PKG
/

--
-- QUEST_SL_ERRORS_PKG  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."QUEST_SL_ERRORS_PKG" IS

PROCEDURE report_err (  Collector_name  VARCHAR2,
			proc_name       VARCHAR2,
			Err_code        NUMBER,
			Err_comm        VARCHAR2 DEFAULT NULL) ;

PROCEDURE report_msg (  Collector_name  VARCHAR2,
			proc_name       VARCHAR2,
			msg_code        NUMBER,
			msg_comm        VARCHAR2 DEFAULT NULL) ;

END quest_sl_Errors_pkg;
/

SHOW ERRORS;


GRANT EXECUTE ON ASU.QUEST_SL_ERRORS_PKG TO PUBLIC
/

