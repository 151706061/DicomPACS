DROP TRIGGER ASU.TKABSOTRPROC_BEFOREINSERT
/

--
-- TKABSOTRPROC_BEFOREINSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TKABSOTRPROC (Sequence)
--   TKABSOTRPROC (Table)
--
CREATE OR REPLACE TRIGGER ASU."TKABSOTRPROC_BEFOREINSERT" 
  before insert on tkabsotrproc  
  for each row
begin
  SELECT seq_tkabsotrproc.NEXTVAL INTO :new.fk_id FROM dual;
end;
/
SHOW ERRORS;


