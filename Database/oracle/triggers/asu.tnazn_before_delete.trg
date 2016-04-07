DROP TRIGGER ASU.TNAZN_BEFORE_DELETE
/

--
-- TNAZN_BEFORE_DELETE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TRESLECH (Table)
--   TNAZN (Table)
--   TNAZN_LINK_VNAZ (Table)
--   VNAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZN_BEFORE_DELETE" 
 BEFORE
 DELETE
 ON asu.tnazn
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
declare
  v_ID_LINK integer;
  v_ID_VNAZ integer;
begin
  -- синхронизация с VNAZ
  Select count(*) into v_ID_LINK from TNAZN_LINK_VNAZ where FK_TNAZN= :OLD.FK_ID;
  if  v_ID_LINK=0 then
    Return;
  end if;
  Select FK_VNAZ  into v_ID_VNAZ from TNAZN_LINK_VNAZ where FK_TNAZN= :OLD.FK_ID;
  -- сначала линк
  delete from  TNAZN_LINK_VNAZ where FK_TNAZN=:OLD.FK_ID;
  delete from TRESLECH R where R.fk_nazid=v_ID_VNAZ; -- возможные результаты
  Delete from VNAZ where FK_ID=v_ID_VNAZ;
end;
/
SHOW ERRORS;


