DROP TRIGGER ASU.TRECIPE_BEFORE_INSERT
/

--
-- TRECIPE_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TRECIPE (Sequence)
--   TRECIPE (Table)
--
CREATE OR REPLACE TRIGGER ASU."TRECIPE_BEFORE_INSERT" 
 BEFORE 
 INSERT
 ON ASU.TRECIPE  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
WHEN (
new.fk_id is null
      )
begin
  if :new.fk_id is null then
    select seq_trecipe.nextval into :new.fk_id from dual;
  end if;
  
  if :new.fd_start is null then
    :new.fd_start := sysdate;
  end if;
  
  if :new.fd_date is null then
    :new.fd_date := trunc(sysdate);
  end if;
end;
/
SHOW ERRORS;


