DROP TRIGGER ASU.TKARTA_DELETE_ALL
/

--
-- TKARTA_DELETE_ALL  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBA_OBJECTS (Synonym)
--   DBA_COL_COMMENTS (Synonym)
--   ALL_TRIGGERS (View)
--   TDOC (Table)
--   TMARKS (Table)
--   INSNAZ (Package)
--   TKARTA (Table)
--   TPUTSPLANS (Table)
--
CREATE OR REPLACE TRIGGER ASU."TKARTA_DELETE_ALL" 
  AFTER DELETE ON asu.tkarta
  REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
DECLARE
  cTemp Varchar2(30);
  CURSOR cTabs is
    select tcc.owner || '.' || tcc.table_name as table_name
      from dba_col_comments tcc
      left join dba_objects tdo on tdo.owner = tcc.owner
                               and tdo.object_name = tcc.table_name
     where tcc.column_name = 'FK_PACID'
       and tdo.object_type = 'TABLE'
       and tdo.status = 'VALID'
       and tcc.owner in ('ASU', 'LOGIN', 'STAT', 'MED', 'BUH')
       and tcc.table_name NOT LIKE '%$%$%' -- исключили таблицы в корзине
       and tcc.TABLE_NAME not in ('TADRESS', 'VRESAN', 'VRESPAT', 'VNAZAN', 'TPUTSPLANS', 'TDOC');

Begin
  INSNAZ.BINS := TRUE;

  FOR p IN cTabs LOOP
    BEGIN
      EXECUTE IMMEDIATE 'DELETE FROM ' || p.TABLE_NAME || ' WHERE FK_PACID=:FK_PACID'
        USING :OLD.FK_ID;
    EXCEPTION
      WHEN OTHERS THEN
--        dbms_output.put_line(p.table_name);
        raise;
    END;
  END LOOP;

  /* COMMENTED BY SILL 10.20.06*/
  --  DELETE FROM TNAZMEDLECHVID WHERE PACID=:OLD.FK_ID;
  DELETE FROM TMARKS WHERE PACID = :OLD.FK_ID;
  DELETE FROM TDOC WHERE FK_KARTAID = :OLD.FK_ID;

  select UPPER(status) into cTemp from sys.all_triggers where UPPER(trigger_name) = 'TPUTSPLANS_DELETE_ALL';
  if cTemp = 'ENABLED' then
    UPDATE TPutsPlans SET FK_PACID = -1, FL_USED = 0 WHERE FK_PACID = :OLD.FK_ID;
  end if;

  INSNAZ.BINS := FALSE;
end;
/
SHOW ERRORS;


