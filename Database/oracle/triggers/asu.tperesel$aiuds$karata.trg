DROP TRIGGER ASU.TPERESEL$AIUDS$KARATA
/

--
-- TPERESEL$AIUDS$KARATA  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TPERESEL (Table)
--   PKG_PERESEL (Package)
--   INSNAZ (Package)
--
CREATE OR REPLACE TRIGGER ASU."TPERESEL$AIUDS$KARATA" 
  AFTER INSERT OR DELETE OR UPDATE ON ASU.TPERESEL   REFERENCING OLD AS OLD NEW AS NEW
begin
-- iaiiaeyao o niioaaonao?ueo caienae a TKARTA oaeouo? iaeaoo
-- iaoiaei iooaoe? oaaeeo
if not INSNAZ.BINS then ASU.pkg_peresel.SET_TKARTA_FK_ROOM; end if; end;
/
SHOW ERRORS;


