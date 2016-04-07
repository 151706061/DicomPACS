DROP TRIGGER ASU.TNAZSHABLON_DELETE
/

--
-- TNAZSHABLON_DELETE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TNAZSHABLON (Table)
--   TNAZSHAB_DIAG (Table)
--   TNAZSHAB_NAZ (Table)
--   TNAZSHAB_RESAN (Table)
--   TNAZSHAB_RESIS (Table)
--   TNAZSHAB_RESKONS (Table)
--   TNAZSHAB_RESLECH (Table)
--   TNAZSHAB_TIB (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZSHABLON_DELETE" 
BEFORE  DELETE
ON tnazshablon
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
Begin
  Delete from TNAZSHAB_NAZ where fk_SHABID=:old.fk_id;
  Delete From TNAZSHAB_DIAG where fk_SHABID=:old.fk_id;
  Delete From TNAZSHAB_TIB where fk_SHABID=:old.fk_id;
  Delete From TNAZSHAB_reslech where fk_SHABID=:old.fk_id;
  Delete From TNAZSHAB_reskons where fk_SHABID=:old.fk_id;
  Delete From TNAZSHAB_resis where fk_SHABID=:old.fk_id;
  Delete From TNAZSHAB_resan where fk_SHABID=:old.fk_id;

End;
/
SHOW ERRORS;


