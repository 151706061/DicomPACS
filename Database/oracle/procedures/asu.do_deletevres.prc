DROP PROCEDURE ASU.DO_DELETEVRES
/

--
-- DO_DELETEVRES  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TRESAN (Table)
--   TRESIS (Table)
--   TRESKONS (Table)
--   TRESLECH (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_DELETEVRES" 
   (pFK_ID in number)
   IS
BEGIN
 delete from tresan where fk_id=pFK_ID;
 delete from tresis where fk_id=pFK_ID;
 delete from treskons where fk_id=pFK_ID;
 delete from treslech where fk_id=pFK_ID;
END; -- Procedure DO_DELETEVRES
/

SHOW ERRORS;


