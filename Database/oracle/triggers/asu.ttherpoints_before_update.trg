DROP TRIGGER ASU.TTHERPOINTS_BEFORE_UPDATE
/

--
-- TTHERPOINTS_BEFORE_UPDATE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TVRACHKAB (Table)
--   TTHERPOINTS (Table)
--   TNAZVRACH (View)
--   TKABINET (Table)
--
CREATE OR REPLACE TRIGGER ASU."TTHERPOINTS_BEFORE_UPDATE" 
 BEFORE 
 UPDATE
 ON ASU.TTHERPOINTS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
declare
  cursor c is select fk_kabinetid  from tnazvrach where fk_id=:old.fk_nazvrachid;
  kabid NUMBER;
begin
  open c;
  fetch c into kabid;
  if c%found then
    update tkabinet set fc_name=:new.fc_name where fk_id=kabid;
    update tvrachkab set fk_sotrid=:new.fk_vrachid where fk_id=:old.fk_nazvrachid;
  end if;
  close c;
end;
/
SHOW ERRORS;


