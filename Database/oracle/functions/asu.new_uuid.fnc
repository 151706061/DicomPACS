DROP FUNCTION ASU.NEW_UUID
/

--
-- NEW_UUID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--
CREATE OR REPLACE FUNCTION ASU.NEW_UUID RETURN VARCHAR2 AS
  vReturn varchar(36);
begin
--F4C20BAB-F886-4FD4-9693-476964E291EC
  select substr(t.fc_guid, 1, 8) || '-' ||
         substr(t.fc_guid, 9, 4) || '-' ||
         substr(t.fc_guid, 13, 4) || '-' ||
         substr(t.fc_guid, 17, 4) || '-' ||
         substr(t.fc_guid, 21, 12) into vReturn from (SELECT SYS_GUID() fc_guid FROM dual) t;

  return vReturn;
end;
/

SHOW ERRORS;


