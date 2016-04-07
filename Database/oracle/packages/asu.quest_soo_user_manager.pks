DROP PACKAGE ASU.QUEST_SOO_USER_MANAGER
/

--
-- QUEST_SOO_USER_MANAGER  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."QUEST_SOO_USER_MANAGER" 
IS
--
-- This package contains routines for user management, mostly for QCO
--
-- Person      Date    Comments
-- ---------   ------  -----------------------------------------------
-- Han B Xie   May2001 Created.

    PROCEDURE grant_user    (user_p VARCHAR2);
    PROCEDURE revoke_user   (user_p VARCHAR2);
    FUNCTION  validate_user (user_p VARCHAR2) RETURN INTEGER;

END; -- QUEST_SOO_USER_MANAGER
/

SHOW ERRORS;


