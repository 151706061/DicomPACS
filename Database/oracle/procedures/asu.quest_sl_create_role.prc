DROP PROCEDURE ASU.QUEST_SL_CREATE_ROLE
/

--
-- QUEST_SL_CREATE_ROLE  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   USER_USERS (Synonym)
--   DBMS_STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   DBMS_SQL (Synonym)
--
CREATE OR REPLACE PROCEDURE ASU."QUEST_SL_CREATE_ROLE" IS
BEGIN

   DECLARE
     TYPE sqlab_tab_t IS TABLE OF VARCHAR2(20000)INDEX by BINARY_INTEGER;

     sqlab_tables Sqlab_tab_t;

    CURSOR UserIdCur IS select user_id from user_users;
    ctr NUMBER := 1;
    insert_cur   NUMBER   := 0;
    fdbk         NUMBER;
    luserId      NUMBER;
    lroleName    VARCHAR2(30);
    BEGIN

     --Initialize table
     sqlab_tables(1) := 'create role ';
     sqlab_tables(2) := 'grant select on sys.v_$sqltext_with_newlines to ';
     sqlab_tables(3) := 'grant select on sys.v_$sqlab_file      to ';
     sqlab_tables(4) := 'grant select on sys.v_$thread          to ';
     sqlab_tables(5) := 'grant select on sys.v_$sqltext         to ';
     sqlab_tables(6) := 'grant select on sys.v_$sqlarea         to ';
     sqlab_tables(7) := 'grant select on sys.v_$sess_io         to ';
     sqlab_tables(8) := 'grant select on sys.v_$version         to ';
     sqlab_tables(9) := 'grant select on sys.v_$session         to ';
     sqlab_tables(10) := 'grant select on sys.v_$parameter       to ';
     sqlab_tables(11) := 'grant select on sys.v_$sesstat         to ';
     sqlab_tables(12) := 'grant select on sys.v_$sysstat         to ';
     sqlab_tables(13) := 'grant select on sys.v_$statname        to ';
     sqlab_tables(14) := 'grant select on sys.v_$filestat        to ';
     sqlab_tables(15) := 'grant select on sys.v_$process         to ';
     sqlab_tables(16) := 'grant select on sys.v_$database        to ';
     sqlab_tables(17) := 'grant select on sys.v_$sqlab_sqlarea   to ';
     sqlab_tables(18) := 'grant select on sys.v_$sqlab_sql_activity to ';
     sqlab_tables(19) := 'grant select on sys.v_$sqlab_object    to ';
     sqlab_tables(20) := 'grant select on sys.v_$sqlab_session   to ';
     sqlab_tables(21) := 'grant select on sys.quest_sl_file_table_segments to ';
     sqlab_tables(22) := 'grant select on sys.quest_sl_file_segments to ';
     sqlab_tables(23) := 'grant select on sys.quest_sl_ind_columns to ';
     sqlab_tables(24) := 'grant select on sys.quest_sl_tab_columns to ';
     sqlab_tables(25) := 'grant select on sys.quest_sl_all_jobs   to ';
     sqlab_tables(26) := 'grant select on SYS.QUEST_SL_DESCRIBE_DETAILS to ';
     sqlab_tables(27) := 'grant select on SYS.QUEST_SL_INDEXED_DEPENDENCIES to ';
     sqlab_tables(28) := 'grant select on SYS.QUEST_SL_TABLES     to ';
     sqlab_tables(29) := 'grant select on SYS.QUEST_SL_TABLE_ROWS to ';
     sqlab_tables(30) := 'grant select on SYS.QUEST_SL_unindex_foreign_keys to ';
     sqlab_tables(31) := 'grant select on SYS.QUEST_SL_VIEW_DEPENDENCY to ';
     sqlab_tables(32) := 'grant select on sys.dependency$         to ';
     sqlab_tables(33) := 'grant select on sys.dba_tablespaces     to ';
     sqlab_tables(34) := 'grant select on sys.dba_data_files      to ';
     sqlab_tables(35) := 'grant select on sys.sqlab_dba_constraints to ';
     sqlab_tables(35) := 'grant select on sys.quest_sl_dba_constraints to ';


     OPEN UserIdCur;
     Fetch UserIdCur
        into luserId;
     CLOSE UserIdCur;
     lroleName := 'QUEST_SL_'||to_char(luserId)||'_USER';
      LOOP
        EXIT WHEN ctr = 36;
          BEGIN
           insert_cur := DBMS_SQL.OPEN_CURSOR;
           DBMS_SQL.PARSE(insert_cur, sqlab_tables(ctr)||lroleName,DBMS_SQL.NATIVE);
           fdbk :=  DBMS_SQL.EXECUTE(insert_cur);
           DBMS_SQL.CLOSE_CURSOR(insert_cur);
           ctr := ctr + 1;
            COMMIT;
          EXCEPTION
            WHEN OTHERS THEN
              IF SQLCODE <> -1921  THEN
                DBMS_SQL.CLOSE_CURSOR(insert_cur);
                raise_application_error(-20101,sqlerrm||'INSTALLATION - Executing '||sqlab_tables(ctr));
              END IF;
             ctr := ctr + 1;
             COMMIT;
          END;
       END LOOP;
   END;
END;
/

SHOW ERRORS;


