DROP PACKAGE ASU.PKG_MEDLOG
/

--
-- PKG_MEDLOG  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_MEDLOG" is

  -- Author  : Roman M. Mikita
  -- Created : 14.06.2002 20:11:00
  -- Purpose : ������ ������ ������������

  -- Public type declarations
--  type <TypeName> is <Datatype>;

  -- Public constant declarations
--  <ConstantName> constant <Datatype> := <Value>;

  -- Public variable declarations
--  <VariableName> <Datatype>;

  -- Public function and procedure declarations
	--������� ���������� ������, ���������� HTML �������� ������ � ��������� �� ���������
  function DoMedVid(DATE1 in date, date2 in date) return clob;
	--������� �� ��������� ���������� ������������ ������
	procedure p_selectmedic;
	--�������, ������� ���������� "1" ���� ���������� ����������� ����� �� ��������� ����������������� ������ � �� ��������� ���������
	function is_existsmedicfarmgr(p_medicid in number) return number;
  --������� ���������� ������, � ������� ��������� ��������� HTML ��������� �� ������� ���������� �� ������ ������� ����������� ��������
	function f_getParamList return clob;
end pkg_medlog;
/

SHOW ERRORS;


