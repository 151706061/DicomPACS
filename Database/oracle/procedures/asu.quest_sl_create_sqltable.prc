DROP PROCEDURE ASU.QUEST_SL_CREATE_SQLTABLE
/

--
-- QUEST_SL_CREATE_SQLTABLE  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   DBMS_SQL (Synonym)
--
CREATE OR REPLACE PROCEDURE ASU."QUEST_SL_CREATE_SQLTABLE" IS
BEGIN
  DECLARE
    insert_cur   NUMBER   := 0;
    fdbk         NUMBER;

    BEGIN
      insert_cur := DBMS_SQL.OPEN_CURSOR;
      DBMS_SQL.PARSE(insert_cur,'create table ASU .quest_sl_sqlarea
                     tablespace DRSYS
                     storage ( initial 400K next 400K )
                     as select
                     SQL_TEXT
                     , SHARABLE_MEM
                     , PERSISTENT_MEM
                     , RUNTIME_MEM
                     , SORTS
                     , OPEN_IND
                     , USERS_OPENING
                     , EXECUTIONS
                     , USERS_EXECUTING
                     , LOADS
                     , FIRST_LOAD_TIME
                     , PARSE_CALLS
                     , DISK_READS
                     , BUFFER_GETS
                     , rows_processed
                     , COMMAND_TYPE
                     , USER_ID
                     , SCHEMA_ID
                     , ADDRESS
                     , PARENT_ADDRESS
                     , HASH_VALUE
                     , USERNAME
                      from sys.v_$sqlab_sqlarea where rownum<1',DBMS_SQL.NATIVE);
      fdbk :=  DBMS_SQL.EXECUTE(insert_cur);
      DBMS_SQL.CLOSE_CURSOR(insert_cur);
      COMMIT;
    EXCEPTION
       WHEN OTHERS THEN
         IF SQLCODE <> -4043 and SQLCODE <> -955 THEN
             DBMS_SQL.CLOSE_CURSOR(insert_cur);
             raise_application_error(-20101,sqlerrm||'Error in creating quest_sl_sqlarea table ');
             COMMIT;
         END IF;
    END;
END;
/

SHOW ERRORS;


