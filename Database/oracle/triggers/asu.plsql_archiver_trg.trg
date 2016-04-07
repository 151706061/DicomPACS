DROP TRIGGER ASU.PLSQL_ARCHIVER_TRG
/

--
-- PLSQL_ARCHIVER_TRG  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   ORA_DICT_OBJ_NAME (Synonym)
--   ORA_DICT_OBJ_OWNER (Synonym)
--   ORA_DICT_OBJ_TYPE (Synonym)
--   PLSQL_ARCHIVER (Package)
--
CREATE OR REPLACE TRIGGER ASU."PLSQL_ARCHIVER_TRG" 
 AFTER
 CREATE
 ON Database
BEGIN
  -- Ведет историю изменения объектов на БД
  IF ora_dict_obj_type IN ('PACKAGE', 'PACKAGE BODY', 'TRIGGER', 'FUNCTION', 'PROCEDURE')
    and ora_dict_obj_name <> 'plsql_archiver'
  THEN
    ASU.plsql_archiver.archive_version (p_object_name => ora_dict_obj_name,
    p_object_type => ora_dict_obj_type, p_object_owner => ora_dict_obj_owner,
    p_creation_time => SYSTIMESTAMP) ;
--    dbms_output.put_line('sdfsd ');
  END IF;
END;
/
SHOW ERRORS;


