DROP TRIGGER ASU.LOG_ERRORS_TRIG
/

--
-- LOG_ERRORS_TRIG  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   V_$MYSTAT (View)
--   V_$SESSION (View)
--   ORA_SQL_TXT (Synonym)
--   DBMS_STANDARD (Package)
--   DBMS_UTILITY (Package)
--   DBMS_STANDARD (Synonym)
--   DBMS_UTILITY (Synonym)
--   GET_SOTRID (Function)
--   GET_SOTRNAME (Function)
--   LOG_ERRORS_TAB (Table)
--
CREATE OR REPLACE TRIGGER ASU."LOG_ERRORS_TRIG" 
 AFTER 
 SERVERERROR
 ON DATABASE
WHEN (
DBMS_STANDARD.SERVER_ERROR(1) NOT IN (1003,1017,1594,1595,1720, 1013) AND
UPPER(USER) LIKE 'Z%' -- ('ASU', 'STAT', 'BUCH')
      )
DISABLE
DECLARE

   var_user           VARCHAR2 (30);
   var_osuser         VARCHAR2 (30);
   var_machine        VARCHAR2 (64);
   var_process        VARCHAR2 (12); --24.11.2009 Ефимов В.А. Исправил размер поля
   var_program        VARCHAR2 (64); --24.11.2009 Ефимов В.А. Исправил размер поля
   var_module         VARCHAR2 (48);
   var_action         VARCHAR2 (32);
   var_client_info    VARCHAR2 (32);
   var_sqltext        VARCHAR2 (4000);
   sql_text           ora_name_list_t;
   n                  NUMBER;
   var_sqltext_length NUMBER;
-- 2007.09.17 Zhukov добавил текст ошибки
BEGIN
--   DBMS_OUTPUT.put_line ('ERROR_TRIG_BEG ');

   BEGIN
      SELECT username, osuser, machine, process, program,
             module, action,
             SUBSTR (login.get_sotrname (login.get_sotrid (
                                                           CASE regexp_substr(client_info, '[[:digit:]]*')
                                                             WHEN client_info THEN TO_NUMBER(client_info)
                                                             ELSE -1
                                                           END
                                                          )
                                        ),
                     1,
                     32
                    ) client_info
        INTO var_user, var_osuser, var_machine, var_process, var_program,
             var_module, var_action,
             var_client_info
        FROM SYS.v_$session s
       WHERE s.audsid = USERENV ('sessionid') AND s.SID =
                                                         (SELECT /*+ FIRST_ROWS(1)*/
                                                                 SID
                                                            FROM SYS.v_$mystat
                                                           WHERE ROWNUM < 2);
   EXCEPTION
      WHEN OTHERS
      THEN
         var_sqltext := '';
   END;


   IF DBMS_STANDARD.server_error (1) <> 0
   THEN
      n := ora_sql_txt (sql_text);

      IF SUBSTR(var_module,1,4) = 'OEM.'  -- не логируем ошибки OEM
      THEN
         RETURN;
      END IF;

/*
 * Chunks are set at 64K each and since the max VACHAR2 variable is 4000, going
beyond
 * 63 loops will cause an overflow.
 */
      FOR i IN 1 .. n
      LOOP
         IF i < 63
         THEN
            var_sqltext_length := LENGTH(var_sqltext) + LENGTH(sql_text(i));
            IF var_sqltext_length <= 4000 THEN

              var_sqltext := var_sqltext || sql_text(i);
            ELSE

              EXIT;
            END IF;
         ELSE
            EXIT;
         END IF;
      END LOOP;

      INSERT INTO log_errors_tab
           VALUES (DBMS_STANDARD.server_error (1), SYSDATE, var_user,
                   var_osuser, var_machine, var_process, var_program,
                   var_module, var_action, var_client_info, var_sqltext,
                      DBMS_UTILITY.format_error_stack
                   || '---- '
                   || DBMS_UTILITY.format_call_stack);
   END IF;
END;
/
SHOW ERRORS;


