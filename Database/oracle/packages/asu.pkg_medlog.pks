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
  -- Purpose : Журнал выдачи медикаментов

  -- Public type declarations
--  type <TypeName> is <Datatype>;

  -- Public constant declarations
--  <ConstantName> constant <Datatype> := <Value>;

  -- Public variable declarations
--  <VariableName> <Datatype>;

  -- Public function and procedure declarations
	--Функция возвращает объект, содержащий HTML страницу отчета с разбивкой по пациентам
  function DoMedVid(DATE1 in date, date2 in date) return clob;
	--Функция по обработке параметров формирования отчета
	procedure p_selectmedic;
	--Функция, которая возвращает "1" если медикамент принадлежит одной из выбранной фармокологической группе и он выдавался пациентам
	function is_existsmedicfarmgr(p_medicid in number) return number;
  --Функция возвращает объект, в котором храниться фрагмента HTML документа со списком параметров на основе которых формируется документ
	function f_getParamList return clob;
end pkg_medlog;
/

SHOW ERRORS;


