DROP FUNCTION ASU.TO_HTML
/

--
-- TO_HTML  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."TO_HTML" 
  ( s in varchar2)
  RETURN  varchar2 IS
-- Purpose: ïåğåâîäèò ñòğîêó â åå îòîáğàæåíèå â ÕÒÌË
-- Sobjanin A.A. sobjanin_alex@chat.ru
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  -------------------------------------------
BEGIN
  return replace(replace(replace(replace(s, '>','&gt'), '<','&lt'),'''','&quot'),'&','&amp');
END; -- Function TO_HTML
/

SHOW ERRORS;


