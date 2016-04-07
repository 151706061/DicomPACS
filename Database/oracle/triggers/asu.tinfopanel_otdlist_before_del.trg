DROP TRIGGER ASU.TINFOPANEL_OTDLIST_BEFORE_DEL
/

--
-- TINFOPANEL_OTDLIST_BEFORE_DEL  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TINFOPANEL_DATA (Table)
--   TINFOPANEL_OTDLIST (Table)
--
CREATE OR REPLACE TRIGGER ASU."TINFOPANEL_OTDLIST_BEFORE_DEL" before delete 
on tinfopanel_otdlist
for each row
begin
  delete from tinfopanel_data where fk_pageid=:old.fk_id;
end;
/
SHOW ERRORS;


