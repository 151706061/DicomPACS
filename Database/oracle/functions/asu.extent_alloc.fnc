DROP FUNCTION ASU.EXTENT_ALLOC
/

--
-- EXTENT_ALLOC  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   USER_FREE_SPACE (Synonym)
--
CREATE OR REPLACE FUNCTION ASU."EXTENT_ALLOC" (next_ext number,tablespace varchar2)
return varchar2
is
 can_alloc      varchar2(10);
 max_free_chunk number(20);
 begin
    SELECT max(bytes)
    INTO   max_free_chunk
    FROM   user_free_space
    WHERE tablespace_name = tablespace;
 IF max_free_chunk >= next_ext
  THEN can_alloc := 'YES';
 ELSE
   can_alloc := 'NO';
 END IF;
  return (can_alloc);
 exception
  when no_data_found then can_alloc:='NO';
  when others then
    raise_application_error(-20006,'Error in extent_aloc func');
    return (can_alloc);
 end;
/

SHOW ERRORS;


