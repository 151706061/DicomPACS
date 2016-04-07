DROP TRIGGER ASU.TPERIOD_COMPANY_DEL
/

--
-- TPERIOD_COMPANY_DEL  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TPEOPLES_COMPANY (Table)
--   TPERIOD_COMPANY (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPERIOD_COMPANY_DEL" 
 BEFORE
  DELETE
 ON asu.tperiod_company
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  delete from asu.tpeoples_company where fk_companyid = :old.fk_companyid and fk_periodid = :old.fk_owner;
end;
/
SHOW ERRORS;


