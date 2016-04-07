DROP PACKAGE ASU.PKG_MEDICNAZN
/

--
-- PKG_MEDICNAZN  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TNAZMED (Table)
--   TNAZMEDLECHVID (Table)
--   TDAYTIME (Table)
--
CREATE OR REPLACE PACKAGE ASU.pkg_medicnazn IS

  -- AUTHOR  : SERGEY
  -- CREATED : 06.02.2006 17:45:06
  -- PURPOSE : МЕДИКАМЕНТОЗНЫЕ НАЗНАЧЕНИЯ - SILL

  type ref_cursor is ref cursor;
  -- PUBLIC FUNCTION AND PROCEDURE DECLARATIONS
  FUNCTION DO_SET(
                  pOperation       IN NUMBER,   -- Тип операции
                  ----TNazMed----
                  PFK_ID           IN NUMBER,   -- Код назначения (TNazMed)
                  PFK_PACID        IN NUMBER,   -- Код пациента
                  PFK_VRACHID      IN NUMBER,   -- Код назначившего врача
                  PFK_VVODPATHID   IN NUMBER,   -- Путь введения (см. табл. TVvodPath)
                  PFD_BEGIN        IN DATE,     -- Дата начала назначения
                  PFN_DURATION     IN INTEGER,  -- Длительность курса
                  PFD_CANCEL       IN DATE,     -- Дата отмены назначения
                  PFK_STATE        IN NUMBER,   -- Состояние назначения (см. табл. TNazSos)
                  PFK_FREQUENCYID  IN NUMBER,   -- Кратность приема (см. табл. TFrequency)
                  PFC_REMARK       IN VARCHAR2, -- Примечание
                  ----TNazMedLech----
                  PFN_DOZA         IN NUMBER,   -- Доза препарата
                  PFK_MEDICID      IN NUMBER,   -- Код медикамента (см. табл. Med.TMedic)
                  PFK_DOZUNITS     IN NUMBER,    -- Единицы измерения дозы (см. табл. Med.TMassUnits) - на случай если не заполнено соответсвующее поле в Med.TMedic
                  PFN_KOL          IN NUMBER,   -- Колличество
                  PFC_REMARKL      IN VARCHAR2, -- Примечание
                  PFK_TREB         IN NUMBER,   -- Сылка на требования (см. табл Med.TTreb)
                  PFK_CANCELSOTRID IN NUMBER,   -- Код сотрудника, отменившего назначение
                  PFC_CANCELREASON IN VARCHAR2, -- Причина отмены
                  PFK_MOID         IN NUMBER,   -- Материально ответсвенный, кот. будет собирать требования (связь с аптекой)
                  PFK_OSMOTRID     IN NUMBER,    -- Код осмотра врача
                  PFK_KOLUNITS     in number,   -- ед. изм.
                  PFP_DURATION_TYPE in number,  -- тип продолжительности
                  PNAZMEDLECHID    in number    -- код Tnazmedlech
                  ) RETURN NUMBER;

  PROCEDURE Do_Del(PFK_ID IN NUMBER); -- Код назначения (TNazMed)

  PROCEDURE DO_CANCEL (PFK_ID IN NUMBER,           -- Код назначения (TNazMed)
                       PFK_CANCELSOTRID IN NUMBER, --Отменивший сотрудник
                       PFC_REASON IN VARCHAR2,      --Причина отмены
                       PFK_CANCELOSMOTRID IN NUMBER DEFAULT -1
                       );
  FUNCTION GET_NAZ_FULLNAME( pFK_ID IN NUMBER,
                             bDayDoze IN NUMBER DEFAULT 1,
                             bCoursDoze IN NUMBER DEFAULT 0,
                             bNazMedLech IN NUMBER DEFAULT 0,
                             bShortName IN NUMBER DEFAULT 0
  ) RETURN VARCHAR2;

  FUNCTION GET_NAZ_FN_SHORT(
    pFK_ID IN NUMBER,
    bDayDoze IN NUMBER DEFAULT 1,
    bCoursDoze IN NUMBER DEFAULT 0,
    bNazMedLech IN NUMBER DEFAULT 0,
    bShortName IN NUMBER DEFAULT 0,
    p_NAZMEDLECHID IN NUMBER DEFAULT 0
  ) RETURN VARCHAR2;

  -- функции для расчета кол-ва назначенного медикамента - значения берутся из таблиц ASU.NAZMED и ASU.TNAZMEDLECH
  FUNCTION GET_SUMM_NAZNMEDLECH_KOL(fn_duration IN NUMBER, fn_freq_mnog IN NUMBER, fn_kol IN NUMBER, fn_doza IN NUMBER) RETURN NUMBER;
  FUNCTION GET_SUMM_NAZNMEDLECH_KOL_BY_ID(aNazMedLechId IN NUMBER) RETURN NUMBER;

  FUNCTION IS_NARCOTIC(pMedicID IN NUMBER) RETURN NUMBER;

  FUNCTION GET_PATHVVOD (pFK_MEDNAZID IN TNAZMED.FK_ID%TYPE) RETURN VARCHAR2;
  FUNCTION ISLGOTAMEDIC (PFK_NAZID IN NUMBER, PFL_LGOTA_RES IN NUMBER DEFAULT -1) RETURN NUMBER;
  FUNCTION GET_TNAZMEDLECHVID_DOZA(PNAZMEDLECHID IN TNAZMEDLECHVID.FK_NAZMEDLECHID%TYPE,
                                   PNAZSOTRID    IN TNAZMED.FK_VRACHID%TYPE,
                                   PDATE         IN DATE,
                                   PTIME         IN TDAYTIME.FC_TIME%TYPE,
                                   PISNAZVRACH   IN INTEGER) RETURN NUMBER;
  function is_can_delete(p_nazid integer) return integer;
  function check_for_standart(p_pacid integer) return ref_cursor;
  function recipe_add return integer;
  procedure recipe_update(
    p_recipeid integer,
    p_typeid integer,
    p_durationid integer,
    p_paytypeid integer,
    p_percentid integer,
    p_sotrid integer,
    p_serail varchar2,
    p_number integer,
    p_date date,
    p_is_lgot integer
  );
  procedure recipe_add_nazlink(p_nazid integer, p_recipeid integer);
  procedure recipe_del_nazlink(p_recipeid integer);
  function recipe_get_next_number(p_is_lgot integer) return integer;
  function recipe_get_serial(p_is_lgot integer) return varchar2;
  function recipe_find(p_serail varchar2, p_number integer) return integer;

 FUNCTION GET_COUNT_OF_NEPODPIS_RECIPE(pTKARTA_FK_ID INTEGER) RETURN INTEGER;
 /*Возвращает кол-во не подписанных льготных рецептов*/

 FUNCTION EXIST_NEPODPIS_RECIPE(pTKARTA_FK_ID INTEGER) RETURN INTEGER;
 /*Возвращает 1 если есть не подписанные льготных рецепты
   иначе 0 - (если нет не подписанных льготных рецепты)*/
   
 function GET_NAZMEDLECH_CNT ( pNAZMEDID integer ) return integer;

 PROCEDURE RECIPE_DEL(pFK_TRECIPEID IN NUMBER);
 /*Удаляет рецепт и все связи этого рецепта*/

  PROCEDURE DO_CONFIRM (PFK_ID IN NUMBER,           -- Код назначения (TNazMed)
                       PFK_CONFIRMSOTRID IN NUMBER --кто подтверждает (лечащий врач)
                       );
  FUNCTION GET_DURATION_TYPE_NAME( aFP_DURATION_TYPE IN NUMBER, aFN_DURATION IN NUMBER DEFAULT NULL) RETURN  VARCHAR2;

  PROCEDURE COPY_MEDNAZ(pFK_NAZMEDID IN NUMBER, pFD_BEGIN IN DATE, pSOTRID IN NUMBER, pMOID IN NUMBER, pOSMOTRID IN NUMBER);
  
  FUNCTION GET_NAZ_PROLONG_NAME( pFK_ID IN NUMBER, pFK_PROLONGID IN number ) RETURN VARCHAR2  ;
  
  -- возвращает кол-во дней в зависимости от типа продолжительности с даты начала курса с учетом продлений
  function GET_NAZ_SUM_DURATION ( pFK_NAZMED_ID in number ) return number;

  -- при создании назначения из химиотреапии в зависимости от введенных кратности и продолжительности создает подневные назначения
  procedure DO_CHEM_NAZ_BY_DUR_FREQ ( pFK_NAZMED_ID in number, -- код исходног назначения
                                      pFK_CHEMOTHERAPY_KURS in number -- код курса химиотерапии
                                     );
  
end;
/

SHOW ERRORS;


