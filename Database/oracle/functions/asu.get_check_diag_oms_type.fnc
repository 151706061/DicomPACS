DROP FUNCTION ASU.GET_CHECK_DIAG_OMS_TYPE
/

--
-- GET_CHECK_DIAG_OMS_TYPE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TDIAG (Table)
--   TDIAGOMS (Table)
--   TAMBTALON (Table)
--   TTYPEDOC (Table)
--   TINSURDOCS (Table)
--
CREATE OR REPLACE FUNCTION ASU.GET_CHECK_DIAG_OMS_TYPE(pFK_TALONID in  number, ModuleFrom in varchar2) RETURN VARCHAR2 IS
 pres varchar2(512);
 n number;

 pFK_SMID  NUMBER := -1;
 pFK_TYPEDOCID  number := -1;
 TypeDocStr varchar(128);
 FindFromAmbtalon Varchar2(256);-- := 'Выставленный диагноз к оплате по ОМС не подлежит, измените вид оплаты на бюджет';

 cursor cGetTalonInfo is
  select TINSURDOCS.FK_TYPEDOCID, TDIAG.FK_SMDIAGID from ASU.TAMBTALON, ASU.TDIAG, ASU.TINSURDOCS where
   TAMBTALON.FK_INSURANCEID = TINSURDOCS.FK_ID
   and
   TAMBTALON.FK_DIAGMAIN = TDIAG.FK_ID
   and
   TAmbtalon.FK_ID = pFK_TALONID;


 cursor cTypeStr is
  select FC_NAME from ASU.Ttypedoc where FK_ID = pFK_TYPEDOCID;

 cursor cIsAnyData is
  select count(1) from ASU.TDIAGOMS where TDIAGOMS.FK_TYPEDOCID = pFK_TYPEDOCID;

 cursor cIsData is
  select count(1) from ASU.TDIAGOMS where TDIAGOMS.FK_TYPEDOCID = pFK_TYPEDOCID and FK_SMID = pFK_SMID;


BEGIN
 pres := '';

 open cGetTalonInfo;
 fetch cGetTalonInfo into pFK_TYPEDOCID,pFK_SMID ;
 close  cGetTalonInfo;

 --На случай того, что может-быть где-то есть талоны без страхового и без главного диагноза
 if (pFK_SMID > -1) and  (pFK_TYPEDOCID > -1 ) then
   open cIsAnyData;
   fetch cIsAnyData into n;
   close  cIsAnyData;
   --Если данные есть, то проверяем а есть ли нужный нам диагноз
   if n > 0 then
    n := 0;

    open cIsData;
    fetch cIsData into n;
    close  cIsData;

    --Если диагноз по данной программе найден то все ОК
    if n > 0 then
     NULL;--Диагноз найден, ничего делать не надо
    else
     --УЗнаём тип документа
     open cTypeStr;
     fetch cTypeStr into TypeDocStr;
     close  cTypeStr;

     FindFromAmbtalon := 'Выставленный диагноз к оплате по "'||TypeDocStr||'" не подлежит, измените вид оплаты на бюджет';
     pres := FindFromAmbtalon;
     -- Вот тут для различных модулей можно допилить сообщение
     --if ModuleFrom = 'AMBTALONDLL.DLL' then
     -- FindFromAmbtalon := 'Выставленный диагноз к оплате по "'||TypeDocStr||'" не подлежит, измените вид оплаты на бюджет';
     --end if;

    end if;
   end if;
 end if;

 RETURN  pres;
END;
/

SHOW ERRORS;


