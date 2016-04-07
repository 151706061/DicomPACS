DROP PACKAGE ASU.PKG_DLO
/

--
-- PKG_DLO  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TRECIPE (Table)
--   TRECIPE_CHANGE_HISTORY (Table)
--
CREATE OR REPLACE PACKAGE ASU.PKG_DLO
  IS
-- Пакет для работы с ДЛО (Дополнительным льготным обслуживаением)
-- Рецепты
-- Author: Voronov

--  константы

-- статусы
   cSTATUS_NAZ NUMBER DEFAULT 0;
   cSTATUS_VID NUMBER DEFAULT 1;
   cSTATUS_VOZVRAT NUMBER DEFAULT 2;
   cSTATUS_UTER NUMBER DEFAULT 3;
   cSTATUS_REALIZ NUMBER DEFAULT 4;
   cSTATUS_NEVOSTREB NUMBER DEFAULT 5;
   cSTATUS_ZAYAV_VIBRANA NUMBER DEFAULT 6;
   cSTATUS_NA_OTSROCH_OBSLUG NUMBER DEFAULT 7;
   cSTATUS_NE_REALIZ NUMBER DEFAULT 8;

-- виды рецептов по льготности
   cLGOT_RECIPE_NORMAL NUMBER DEFAULT 0;
   cLGOT_RECIPE_LGOT_REG NUMBER DEFAULT 2;
   cLGOT_RECIPE_LGOT_FED NUMBER DEFAULT 3;

-- типы логируемых изменений
   cCHANGE_TYPE_PRINT  NUMBER DEFAULT 0;
   cCHANGE_TYPE_STATUS NUMBER DEFAULT 1;
   cCHANGE_TYPE_SIGN   NUMBER DEFAULT 2;


--============================================================================--

   function GET_STATUS_NAME( aFN_STATUS IN NUMBER ) RETURN VARCHAR2 DETERMINISTIC;

   function GET_LGOT_TYPE_NAME( aFL_LGOT IN NUMBER ) RETURN VARCHAR2 DETERMINISTIC;

   function GET_CHANGE_TYPE_NAME( aCHANGE_TYPE IN NUMBER ) RETURN VARCHAR2 DETERMINISTIC;

   function INS_RECIPE
     ( aFK_TYPE IN NUMBER,
       aFK_PERCENT IN NUMBER,
       aFK_PAYTYPE IN NUMBER,
       aFK_DURATION IN NUMBER,
       aFL_LGOT IN NUMBER,

       aFK_SOTRID IN NUMBER,
       aFK_VRACH_ID IN NUMBER,

       aFN_NUM IN NUMBER,
       aFC_SERIAL IN asu.trecipe.FC_SERIAL%type,

       aFK_PAC_ID IN NUMBER,
       aFK_PAC_LGOT_CAT IN NUMBER,
       aFK_LGOT_DOC_ID IN NUMBER,
       aFC_SNILS in asu.TRECIPE.FC_SNILS%type,
       aFL_USE_DIAG_PARENT in asu.TRECIPE.FL_USE_DIAG_PARENT%type,
       aFK_OSMOTR_ID in asu.TRECIPE.FK_OSMOTR_ID%type,
       aFK_DIAG  IN NUMBER DEFAULT null,
       aFC_COMMENT IN asu.trecipe.FC_COMMENT%type DEFAULT null,
       aFC_DTD in asu.trecipe.FC_DTD%type default null,
       aFD_DATE IN DATE DEFAULT sysdate,
       aFD_START IN DATE DEFAULT sysdate
       )  RETURN  NUMBER;

  function CHECK_RECIPE_SER_NUM_CAUSE( aCurRECIPE_ID IN NUMBER, aSERIAL IN ASU.TRECIPE.fc_serial%type, aNUM IN ASU.TRECIPE.fn_num%type) RETURN varchar2;
  function CHECK_RECIPE_SER_NUM( aCurRECIPE_ID IN NUMBER, aSERIAL IN ASU.TRECIPE.fc_serial%type, aNUM IN ASU.TRECIPE.fn_num%type ) RETURN NUMBER;
  function GET_cLGOT_RECIPE_LGOT_REG RETURN NUMBER DETERMINISTIC;
  function GET_cLGOT_RECIPE_LGOT_FED RETURN NUMBER DETERMINISTIC;
  function GET_cLGOT_RECIPE_NORMAL RETURN NUMBER DETERMINISTIC;
  function GET_cSTATUS_NAZ RETURN NUMBER DETERMINISTIC;
  function GET_cSTATUS_REALIZ RETURN NUMBER DETERMINISTIC;
  function GET_cSTATUS_UTER RETURN NUMBER DETERMINISTIC;
  function GET_cSTATUS_VID RETURN NUMBER DETERMINISTIC;
  function GET_cSTATUS_VOZVRAT RETURN NUMBER DETERMINISTIC;
  function GET_cSTATUS_NEVOSTREB RETURN NUMBER DETERMINISTIC;
  function GET_cSTATUS_ZAYAV_VIBRANA RETURN NUMBER DETERMINISTIC;
  function GET_cSTATUS_NA_OTSROCH_OBSLUG RETURN NUMBER DETERMINISTIC;
  function GET_cSTATUS_NE_REALIZ RETURN NUMBER DETERMINISTIC;
  function INS_RECIPE_CHANGE_HISTORY
     ( afk_recipe_id IN NUMBER,
       afk_sotr      IN NUMBER,
       afn_change_type IN NUMBER,
       afc_description IN ASU.TRECIPE_CHANGE_HISTORY.fc_description%type
--       afd_date      IN DATE DEFAULT NULL --чтобы можно было пользоваться дефолтом в делфях из квери
       )  RETURN  NUMBER;
  function INS_RECIPE_HISTORY_PRINT
     ( afk_recipe_id IN NUMBER,
       afk_sotr      IN NUMBER,
       afc_description IN ASU.TRECIPE_CHANGE_HISTORY.fc_description%type DEFAULT null
       )  RETURN  NUMBER;
  function INS_RECIPE_HISTORY_STATUS
     ( afk_recipe_id IN NUMBER,
       afk_sotr      IN NUMBER,
       afc_description IN ASU.TRECIPE_CHANGE_HISTORY.fc_description%type DEFAULT null
       )  RETURN  NUMBER;

  function recipe_get_next_number(p_is_lgot NUMBER) return NUMBER;
  function recipe_get_serial(p_is_lgot NUMBER) return varchar2;
--  function GET_COUNT_NOT_FILLED_EXP_FIELD( afk_recipe_id IN NUMBER, aFL_LGOT IN NUMBER )  RETURN  NUMBER;
  function GET_COUNT_NOT_FILLED_EXP_FIELD( afk_recipe_id IN NUMBER, aFL_LGOT IN NUMBER, aVidRes in smallint default 0 )  RETURN  VARCHAR2;

  PROCEDURE DO_SET_PEOPLE_LGOT( pFK_PACID IN NUMBER, pFK_PACTYPEID IN number );
  function DO_INIT_EXP_RECIPE ( pFK_RECIPE_ID in number)  RETURN  NUMBER;
  function GET_POLIS ( pFK_PEOPLEID in number, pVid in integer default 0 ) return varchar2 ;
  procedure DO_INC_PRINT_COUNT ( pFK_RECIPE_ID in number, pFK_SOTR_ID in number );
  procedure DO_MERGE_LATINNAM_EXPMEDICS;

END; -- Package spec
/

SHOW ERRORS;


