DROP TRIGGER ASU.TDIAG_METHOD_P_BI
/

--
-- TDIAG_METHOD_P_BI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TDIAG_METHOD_P (Sequence)
--   TDIAG_METHOD_P (Table)
--
CREATE OR REPLACE TRIGGER ASU."TDIAG_METHOD_P_BI"
 BEFORE
  INSERT
 ON ASU.TDIAG_METHOD_P REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
begin
  if (:new.fk_id is null) then
    select ASU.SEQ_TDIAG_METHOD_P.nextval into :new.fk_id from dual;
  end if;
end;
/
SHOW ERRORS;


