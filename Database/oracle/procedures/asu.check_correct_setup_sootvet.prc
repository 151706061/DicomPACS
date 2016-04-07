DROP PROCEDURE ASU.CHECK_CORRECT_SETUP_SOOTVET
/

--
-- CHECK_CORRECT_SETUP_SOOTVET  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PROCEDURE ASU.CHECK_CORRECT_SETUP_SOOTVET (
                                                             SYNONYM1 in varchar2,
                                                             SYNONYM2 in varchar2,
                                                             VALUE1 in number,
                                                             VALUE2 in number,
                                                             ErrorStr out varchar2,
                                                             RES out number
                                                           ) is
BEGIN
  
    RES := 1;
END;
/

SHOW ERRORS;


