DROP PACKAGE ASU.PKG_STAT_COST
/

--
-- PKG_STAT_COST  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU.PKG_STAT_COST IS
/*
DOC_IB_DSROOT
get_oper_healid -- ветка операций, 41221 для кардио
GET_VIPNAZ
GET_NATIVE_REGION
get_hmao_region
get_tiproom_hemodial
get_tiproom_hemodial_pr
GETOTDELRADIOLOG
GET_NOVOROGDOTD
*/
 -- Глобальные переменные
 LAST_STEP  NUMBER := 9;
 vUSE_TarifDetail  NUMBER;
 vDelNoTarifUsl  NUMBER;
 vTarifDetailOwner varchar(100);
 vSmid_TYPE_V_MU_PALLIATIV NUMBER;
 vSmid_GEMODIALIZ_PERIT NUMBER;
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------

 /*
   pOMS_ONLY - 1 - только со страховым документом типа ОМС, 0 - все
   pOWN NUMBER - 1 - только метсные, 2 - только межтерриториальные, 0 - все
   pFILL_CACHE - 1 - заполнять временные таблицы, 0 - временные таблицы уже были заполнены на вызывающей стороне, например в пакетах выгрузки
   pUseTarifDetail - 1 - вести журнал детализации (см. asu.TarifDetail), 0 - не вести журнал тарификации
   pTarifDetailOwner - если включён журнал дитализации это значение будет записано в поле FC_OWNER
   pDelNoTarifUsl - удалять из стартовой таблицы asu.tsluch_dbf_calc строки для которых не удалось рассчитать тариф
   aCostFromDate DATE - рассматривать цены с датой завершения дейтсвия больше aCostFromDate (цены без даты завершения рассматриваются всегда!)
   aUseSetDatesByKarta - В зависимости от настроек и типа случая случай может быть рассмотрен как карта или как набор переводов,
                         если aUseSetDatesByKarta = 1, то в стартовой таблице asu.tsluch_dbf_calc всегда можно подавать только переводы, пакет сам приобразует их к картам
                         если aUseSetDatesByKarta = 0, то в стартовой таблице asu.tsluch_dbf_calc уже есть и карты и переводы, так работает выгрузка
   aFill_type_v_mu - 1 - заполнять данные о типе вида мед. помощи внутри пакета, 0 - нет заполнять, используется в выгрузке
 */
 procedure Calculate(pOMS_ONLY NUMBER default 1,
                     pOWN NUMBER default 0,
                     pFILL_CACHE NUMBER default 1,
                     pUseTarifDetail Number default 0,
                     pTarifDetailOwner Varchar2 default '',
                     pDelNoTarifUsl Number default 1,
                     aCostFromDate DATE default null,
                     aUseSetDatesByKarta Number default 1,
                     aFill_type_v_mu Number default 1,
                     aFillVMP Number default 1,
                     aFill_Peresel_paliativ Number default 1);

 procedure CalcByPacId(aPacId Number, pUseTarifDetail Number default 0, pTarifDetailOwner Varchar2 default '');
-- procedure CalculateSK;
-- procedure CalculateNoHMAO;
-- procedure CalculateHMAO;
-- PROCEDURE CalculateByKoykavidid;
END;
/

SHOW ERRORS;


