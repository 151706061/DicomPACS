DROP PACKAGE ASU.EFFECT
/

--
-- EFFECT  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."EFFECT" 
  IS
-- Purpose: –асчет эффективности лечени€ пациента
-- иде€: по каждому тесту определ€етс€ одна из 4-ех групп риска,
-- затем выподитьс€ среднее арифметическое по всем группам и получаетс€
-- индекс здоровь€, чем индекс выше тем человек больнее
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- Sam        04.07.2000  Create
-- ---------   ------  ------------------------------------------
  nFK_PACID number;
  nFK_VRACHID number;
  procedure SetnFK_VRACHID(nValue in number);
  procedure SetnFK_PACID(nValue in number);
  -- получить код назначени€ результатом котрого €вл€етс€ этот синоним
  function get_synnazid (pSyn in varchar2) Return number;
  -- то же но по куду синонима
  function get_idsynnazid(pFK_SMID in number) return number;
  --вставить в TIB результаты теста
  procedure get_resbysyn(sSyn in varchar2, pFK_NAZID in number);
  --тоже но по коду синонима
  procedure get_resbysynid (nSynID in number, pFK_NAZID in number);
  procedure proceed_all(pFK_PACID IN NUMBER,pFK_VRACHID IN NUMBER);
  procedure proceed(pFK_VID in number); -- выполн€ет все тесты

  procedure test_ad_sist(pFK_VID in integer); --систолическое дваление
  procedure test_ad_diast(pFK_VID in integer);  -- диастолическое давление
  procedure test_biohim(pFK_VID in integer);  -- биохими€
  procedure test_vem(pFK_VID in integer);  -- велоэргометри€
  procedure test_ekg(pFK_VID in integer);  -- электрокардиограмма
  procedure test_kard (pFK_VID in number); -- данные интервала кардиометрии
  procedure test_res (pFK_VID in number); -- резервы организма
  procedure test_weight (pFK_VID in number); -- антропометрические данные
  procedure test_kur (pFK_VID in number); -- курение
  procedure test_fis_akt (pFK_VID in number); -- физическа€ активность
END; -- Package Specification EFFEFCT
/

SHOW ERRORS;


