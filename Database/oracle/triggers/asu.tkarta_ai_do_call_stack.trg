DROP TRIGGER ASU.TKARTA_AI_DO_CALL_STACK
/

--
-- TKARTA_AI_DO_CALL_STACK  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   V_$MYSTAT (View)
--   V_$SESSION (View)
--   DBMS_UTILITY (Package)
--   DBMS_UTILITY (Synonym)
--   GET_SOTRID (Function)
--   GET_SOTRNAME (Function)
--   TKARTA (Table)
--   TKARTACALLSTACK (Table)
--
CREATE OR REPLACE TRIGGER ASU."TKARTA_AI_DO_CALL_STACK" 
 AFTER
  INSERT
 ON asu.tkarta
REFERENCING NEW AS NEW OLD AS OLD
 FOR EACH ROW
DECLARE
   var_user           VARCHAR2(30);
   var_osuser         VARCHAR2(30);
   var_machine        VARCHAR2(64);
   var_process        VARCHAR2(12);
   var_program        VARCHAR2(64);
   var_module         VARCHAR2(48);
   var_action         VARCHAR2(32);
   var_client_info    VARCHAR2(32);
BEGIN
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
           var_module, var_action, var_client_info
      FROM SYS.v_$session s
     WHERE s.audsid = USERENV ('sessionid') AND s.SID =
                                                       (SELECT /*+ FIRST_ROWS(1)*/
                                                               SID
                                                          FROM SYS.v_$mystat
                                                         WHERE ROWNUM < 2);
  END;


  INSERT INTO asu.tkartacallstack
         VALUES (:NEW.FK_ID, SYSDATE, var_user,
                 var_osuser, var_machine, var_process, var_program,
                 var_module, var_action, var_client_info,
                 DBMS_UTILITY.format_call_stack);
END;
/
SHOW ERRORS;


