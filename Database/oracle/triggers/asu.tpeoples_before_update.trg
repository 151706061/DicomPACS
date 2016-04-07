DROP TRIGGER ASU.TPEOPLES_BEFORE_UPDATE
/

--
-- TPEOPLES_BEFORE_UPDATE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TWORKPLACE (Table)
--   TPEOPLES (Table)
--
CREATE OR REPLACE TRIGGER ASU."TPEOPLES_BEFORE_UPDATE" 
  before update on tpeoples
  for each row
declare
  -- local variables here
begin
  UPDATE TWORKPLACE
     SET FK_COMPANY = :NEW.FK_COMPANYID,
         FK_OTDEL = :NEW.FK_OTDEL,
         FK_DOLGNOST = :NEW.FK_DOLGNOST,
         FC_RABOTA = :NEW.FC_RABOTA
   WHERE FK_PACID = :NEW.FK_ID
     AND FP_MAIN = 1;
end TPEOPLES_BEFORE_UPDATE;
/
SHOW ERRORS;


