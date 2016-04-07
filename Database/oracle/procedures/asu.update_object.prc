DROP PROCEDURE ASU.UPDATE_OBJECT
/

--
-- UPDATE_OBJECT  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBA_OBJECTS (Synonym)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   PARSE (Procedure)
--
CREATE OR REPLACE PROCEDURE ASU.update_object(clDDL CLOB, -- ������, ��������������� ������� ��
                                          aObjectType varchar2, -- ��� ������� ��, ����������� ���, ��� �� ������ � ������� dba_objects
                                          aOwner varchar2, -- �������� �������, ��� �� ������ � ������� dba_objects
                                          aPkgName varchar2, -- �������� �������, ��� ��� ������ � ������� dba_objects
                                          aStartStr varchar2, -- ������, ���������� ������ ���������, ����� ���� ������ ���������� ���������� ����
                                          aFinishStr varchar2, -- ������, ���������� ����� ���������, ����� ���� ������� ������������� ���������� ����
                                          aNewStr varchar2, -- ������, ������� ����� ��������� ����� aStartStr � aFinishStr, ���, ��� ���� ����� aStartStr � aFinishStr ������ ����� �������� ����������������
                                          aCheckValid integer default 1 -- 1 - ��������� ������ �� ����������, ����� ���������
                                         ) is
-- Efimov V.A. 20120306 ������� ��������������� ���������� ������� ��,
-- ������� � ����� � ������� http://192.168.1.9/redmine/issues/14672 ��� ���������� stat.pkg_hant
-- ������� �������� � �������, ��������������� �������, ���� ������� ������������ ����� �������� aStartStr � aFinishStr �� ���� aNewStr.
-- ������������ ����� �������� aStartStr � aFinishStr �������� ��� ���� ���������� ����� ����� ������ aStartStr � ������������� ����� ������� aFinishStr
-- ���������� ���� �� ���������, � ��������� ��������������, ������ ������ ��. update_object_ext
  clTmp CLOB;
  IsValid INTEGER;

  vstart_len Integer;
  vfrom Integer;
  vto Integer;
  vfull_length Integer;

  CURSOR c IS SELECT '-- ' ||
                     SUBSTR(txt, INSTR(txt, CHR(10), 1, level) + 1, INSTR(txt, CHR(10), 1, level + 1) - INSTR(txt, CHR(10), 1, level) - 1) AS str -- � ������ ������ ������������ ������� ������ ����������� ���������������
                FROM (select substr(clDDL, vfrom + vstart_len, vto - vstart_len - vfrom) txt -- ����� �������, ����� ������ aStartStr � ������� aFinishStr, �.�. �� �����, ��� ������ ���� �������� �� aNewStr
                        from dual)
             CONNECT BY level <= LENGTH(txt) - LENGTH(REPLACE(txt, CHR(10), '')) - 1;
BEGIN
  select Length(aStartStr) fn_start_len, -- ����� ������, ���������� ������ ���������
         instr(clDDL, aStartStr) fn_from, -- ������� ������, ���������� ������ ���������, � �������, ���������������� ������� ��
         instr(clDDL, aFinishStr) fn_to, -- ������� ������, ���������� ����� ���������, � �������, ���������������� ������� ��
         Length(clDDL) fn_full_length -- ����� �������, ���������������� ������� ��
    into vstart_len, vfrom, vto, vfull_length
    from dual;

  -- � clTmp ����������� ����� �������, ���������������� ������� ��, �� ��� ������, �� ����� ������, ���������� ������ ��������� (aStartStr)
  clTmp := substr(clDDL, 1, vfrom + vstart_len - 1);
  -- � clTmp ����������� ��������� ������������������ ���� ����� ������ aStartStr � ������� aFinishStr (�.�. �������������� �� �����, ��� ������ ���� �������� �� aNewStr)
  FOR p IN c LOOP
    if (trim(p.str) is not null) and (trim(p.str) <> ' ') then
      clTmp := clTmp || chr(10) || p.str;
    end if;
  END LOOP;

  -- ��� clTmp �������� ����� ������� clDDL, �� ������ aFinishStr. ��� ���� ����, ������� ������ ���� ������ ��� ���������������
  -- � clTmp ����������� ����� ����
  clTmp := clTmp || chr(10) || aNewStr;
  -- � clTmp ����������� ����� clDDL �� ������ aFinishStr, �� ����� clDDL. � ���������� �������� ������ clDDL � ������� ���� ����� aStartStr � aFinishStr ���� ������ �� aNewStr
  clTmp := clTmp || chr(10) || substr(clDDL, vto, vfull_length - vto + 1);

  -- ������ ��������� � ���
  asu.parse(clTmp);

  -- �������� ������� �� ����������
  if aCheckValid = 1 then
    select decode(t.status, 'VALID', 1, 0)
      into IsValid
      from dba_objects t
     where t.owner = aOwner
       and t.object_name = aPkgName
       and t.object_type = aObjectType;

    if IsValid = 0 then
      begin
        asu.parse(clDDL);
      exception when others then
        raise_application_error (-20200,'������ ��� ��������� ������� ' || aOwner || '.' || aPkgName || ' ���� ' || aObjectType || ' �� ������� ������� �������� ������, ��������� ������������� ������������!');
      end;

      raise_application_error (-20200,'������ ��� ��������� ������� ' || aOwner || '.' || aPkgName || ' ���� ' || aObjectType || ' ��������� ��������, ���������� �������� ������');
    end if;
  end if;
END;
/

SHOW ERRORS;


