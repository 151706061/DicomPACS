DROP FUNCTION ASU.GET_DDL
/

--
-- GET_DDL  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   DBMS_SQL (Synonym)
--   PARSE (Procedure)
--
CREATE OR REPLACE FUNCTION ASU.GET_DDL(aObjType varchar2,
                                       aOwner      varchar2,
                                       aObjName    varchar2) return clob is
-- ����������� � ��������� ����������, ����� ����� ���� ������������ ������ select
pragma autonomous_transaction;
  vProcNameStr varchar2(100);
  vGetDLL_ObjType varchar2(100);
  clParse CLOB;
  clDDL CLOB;
  cur integer;
  r integer;
begin
  -- �������� ��������� �������, ������������� ��������� �������, ������� �������� �������� ��� DDL, ������� ���������� � �������
  vProcNameStr := aOwner || '.' || 'GET_DDL_' || to_char(sysdate, 'yyyymmdd');
  vGetDLL_ObjType := replace(aObjType, ' ', '_');

  clParse :=
    'create or replace function pProcNameStr' || chr(10) ||
    'RETURN CLOB IS' || chr(10) ||
    '  clBefore CLOB;' || chr(10) ||
    'begin' || chr(10) ||
    '  SELECT DBMS_METADATA.GET_DDL(pGetDLL_ObjType, pObjName, pOwner) INTO clBefore FROM DUAL;' || chr(10) ||
    '  Return clBefore;' || chr(10) ||
    'end;';
  clParse := Replace(clParse, 'pProcNameStr', vProcNameStr);
  clParse := Replace(clParse, 'pGetDLL_ObjType', '''' || vGetDLL_ObjType || '''');
  clParse := Replace(clParse, 'pObjName', '''' || aObjName || '''');
  clParse := Replace(clParse, 'pOwner', '''' || aOwner || '''');
  asu.parse(clParse);

  -- ����������� ��������� ����� ��������� �������, � clDDL ����������� ������, ��������������� ������� ��
  cur := dbms_sql.open_cursor;
  dbms_sql.parse(cur, 'select ' || vProcNameStr || ' as FC_CLOB from dual', dbms_sql.native);
  dbms_sql.define_column(cur, 1, clDDL);
  r := dbms_sql.execute(cur);
  if r > 0 then
    raise_application_error (-20200,'�� ������� �������� ������ �� ' || aOwner || '.' || aObjName || ' ���� ' || aObjType);
  else
    loop
      if dbms_sql.Fetch_Rows(cur) = 0 then
        exit;
      else
        dbms_sql.column_value(cur, 1, clDDL);
      end if;
    end loop;
  end if;
  dbms_sql.close_cursor(cur);

  -- �������� ������� ���������
  clParse := 'drop function pProcNameStr';
  clParse := Replace(clParse, 'pProcNameStr', vProcNameStr);
  asu.parse(clParse);

  return clDDL;
end;
/

SHOW ERRORS;


