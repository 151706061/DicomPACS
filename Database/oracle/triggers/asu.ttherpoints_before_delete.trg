DROP TRIGGER ASU.TTHERPOINTS_BEFORE_DELETE
/

--
-- TTHERPOINTS_BEFORE_DELETE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TVRACHKAB (Table)
--   TTHERPOINTS (Table)
--   TNAZVRACH (View)
--   TKABINET (Table)
--
CREATE OR REPLACE TRIGGER ASU."TTHERPOINTS_BEFORE_DELETE" 
 BEFORE 
 DELETE
 ON ASU.TTHERPOINTS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
declare
  cursor c is select fk_kabinetid  from tnazvrach where fk_id=:old.fk_nazvrachid;
  kabid NUMBER;
begin
  open c;
  fetch c into kabid;
  if c%found then
  delete from tvrachkab where fk_id=:old.fk_nazvrachid;
  delete from tkabinet where fk_id=kabid;
  end if;
  close c;
end;
/
SHOW ERRORS;


