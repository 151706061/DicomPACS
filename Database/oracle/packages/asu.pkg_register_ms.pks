DROP PACKAGE ASU.PKG_REGISTER_MS
/

--
-- PKG_REGISTER_MS  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_REGISTER_MS" is

  -- Author  : Nebary
  -- Created : 13.09.2010 16:29:57
  -- Purpose : Пакет для модуля repRegisterMS

  -- Возвращает палату пациента
  function get_pac_room(pPacID in number) return varchar2;
  function get_pac_room_id(pPacID in number) return number;

  -- Возвращает отделение пациента по его палате
  function get_pac_otdelenie(pPacID in number) return varchar2;
  function get_pac_otdelenie_id(pPacID in number) return number;

  -- Возвращает лечещего врача пациента по tkarta.fk_id или tambtalon.fk_id
  function get_pac_vrach_id(pPacID in number) return number;

  -- Возвращает страховую компанию пациента
  function get_pac_inscomp_id(pPacID in number, pDate in date) return number;

  -- Возвращает данные по койко-дням
  function get_pac_kdncena(pPacID in number) return varchar2;
  function get_pac_kdnsum(pPacID in number) return number;

  -- Возвращает диагнозы пациента
  function get_pac_main_diag(pPacID in number) return number;
  function get_pac_soput_diag(pPacID in number) return number;

  -- Возвращает стандарт, по которому следует лечить пациента
  function get_pac_standard_id(pPacID in number, pStdGrpID in number) return number;
  function get_standard_name(pStandardID in number) return varchar2;
  function get_standard_group_name(pGroupID in number) return varchar2;

  -- Цены по услугам
  function get_uslug_cost(pNazID in number, pSMID in number, pDate in date, pPacID in number, pStdGrpID in number := -1) return number;
  function get_uslug_cost_source(pNazID in number, pSMID in number, pDate in date, pPacID in number, pStdGrpID in number := -1) return varchar2;

end pkg_register_ms;
/

SHOW ERRORS;


