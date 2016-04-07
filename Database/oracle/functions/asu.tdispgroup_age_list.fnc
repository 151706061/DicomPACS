DROP FUNCTION ASU.TDISPGROUP_AGE_LIST
/

--
-- TDISPGROUP_AGE_LIST  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TDISPGROUPNAZLIST (Table)
--   TDISPGROUPNAZLIST_AGE (Table)
--
CREATE OR REPLACE FUNCTION ASU.TDISPGROUP_AGE_LIST(pFK_PACAGE in number, pFK_DISPGROUPLIST in number)return number is

 nCount number;



 cursor cInfo is
  select count(t.fn_age) as N  from ASU.Tdispgroupnazlist_age t where t.fk_dispgroupnazlist = pFK_DISPGROUPLIST;

 cursor cList is
   select count(t.fn_age) as N  from ASU.Tdispgroupnazlist_age t where t.fk_dispgroupnazlist = pFK_DISPGROUPLIST
    and TRUNC(pFK_PACAGE) = trunc(t.fn_age);

 cursor cPeriod is
   select count(1) as N  from ASU.Tdispgroupnazlist t where t.fk_id = pFK_DISPGROUPLIST and
    trunc(pFK_PACAGE) between NVL(T.FN_AGEBEGIN, 0) and NVL(T.FN_AGEEND, 150) ;




 BEgin

   open cInfo;
   fetch cInfo into nCount;
   close cInfo;

   if ncount > 0 then
    --Данные есть по списку, смотрим подходят ли данные
      open cList;
      fetch cList into nCount;
      close cList;
   else
    --Данных по списку нет, смотрим по периоду
      open cPeriod;
      fetch cPeriod into nCount;
      close cPeriod;
   end if;

  return nCOunt;

 End;
/

SHOW ERRORS;


