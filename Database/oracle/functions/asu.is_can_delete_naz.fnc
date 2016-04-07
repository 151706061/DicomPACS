DROP FUNCTION ASU.IS_CAN_DELETE_NAZ
/

--
-- IS_CAN_DELETE_NAZ  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   DO_CHECK_OBJECT_ACCESS (Function)
--   TNAZMED (Table)
--   TNAZMEDLECH (Table)
--   TAMBTALON (Table)
--   TAMBTALON_NAZ (Table)
--   TRECIPE (Table)
--   TINSURDOCS (Table)
--   TRECIPE_MEDIC (Table)
--   PKG_PLATUSLUG (Package)
--   GET_BUDZHET_DOC_TYPE (Function)
--   VNAZ (Table)
--
CREATE OR REPLACE FUNCTION ASU.IS_CAN_DELETE_NAZ(pFK_APPSOTRNID in number, pFK_NAZID in number)
  return varchar2 is
--Malev 15/10/2013 изменил для работы платных услуг
  /*CheckDate date;
  CurrentDate date;

  CurrentDateMonth number;
  CurrentDateYear number;

  TalonDateMonth number;
  TalonDateYear number;

  TalonDate date := null;
  pFK_TALONID number;
  pCheckAccess number;
  res varchar2(128);
  pOplType number;

  cursor GetOplType is
   select TINSURDOCS.FK_TYPEDOCID, TAMbtalon.FK_ID, VNAZ.FD_RUN from ASU.TAMBTALON, ASU.TINSURDOCS, asu.TAMbtalon_NAZ, ASU.VNAZ where
   TAMBTALON.FK_INSURANCEID = TINSURDOCS.FK_ID
   and
   TAMBTALON.FK_ID = Tambtalon_naz.FK_TALONID
   and
   TAMBTALON_NAZ.FK_NAZID = pFK_NAZID
   and
   TAMBTALON_NAZ.FK_NAZID = VNAZ.FK_ID;

  Cursor cDateDetail(pdate in date) is
   select
     TO_NUMBER(TO_CHAR(pDate,'YYYY')),
     TO_NUMBER(TO_CHAR(pDate,'MM'))
   from DUAL;

  Cursor CheckAccess is
   SELECT LOGIN.DO_CHECK_OBJECT_ACCESS(pFK_APPSOTRNID,'CAN_DEL_PREV_MONTH_TALON_TEMP') FROM DUAL;*/

  CheckDate date;
  CurrentDate date;

  CurrentDateMonth number;
  CurrentDateYear number;

  TalonDateMonth number;
  TalonDateYear number;

  TalonDate date := null;
  pFK_TALONID number;
  pCheckAccess number;
  res varchar2(128);
  pOplType number;
  v_PlatDogNum VARCHAR2(200);
  v_NazName    VARCHAR2(500);
  vHasRecipe  number(1);

  cursor GetOplType is
   select TINSURDOCS.FK_TYPEDOCID, TAMbtalon.FK_ID, VNAZ.FD_RUN, ASU.PKG_PLATUSLUG.GET_PLATDOG_NUM(pFK_NAZID), VNAZ.FC_NAME
    from ASU.TAMBTALON, ASU.TINSURDOCS, asu.TAMbtalon_NAZ, ASU.VNAZ
    where TAMBTALON.FK_INSURANCEID = TINSURDOCS.FK_ID
          and TAMBTALON.FK_ID = Tambtalon_naz.FK_TALONID
          and TAMBTALON_NAZ.FK_NAZID = pFK_NAZID
          and TAMBTALON_NAZ.FK_NAZID = VNAZ.FK_ID;

  Cursor cDateDetail(pdate in date) is
   select
     TO_NUMBER(TO_CHAR(pDate,'YYYY')),
     TO_NUMBER(TO_CHAR(pDate,'MM'))
   from DUAL;

  Cursor CheckAccess is
   SELECT LOGIN.DO_CHECK_OBJECT_ACCESS(pFK_APPSOTRNID,'CAN_DEL_PREV_MONTH_TALON_TEMP') FROM DUAL;

  cursor CheckRecipes is
  select 1
    from ( select v.FK_ID as NAZID
             from ASu.VNAZ v
            where v.FK_ID = pFK_NAZID or v.fk_nazowner  = pFK_NAZID ) vnaz
   inner join asu.trecipe r
      on vnaz.NAZID = r.FK_OSMOTR_ID
  union
  select 1
    from ( select v.FK_ID as NAZID
             from ASu.VNAZ v
            where v.FK_ID = pFK_NAZID or v.fk_nazowner  = pFK_NAZID ) vnaz
  inner join ( select n.FK_OSMOTRID as NAZID
                from asu.TNAZMED n
               inner join asu.TNAZMEDLECH nl
                  on n.FK_ID = nl.FK_NAZMEDID
               inner join asu.TRECIPE_MEDIC rm
                  on nl.FK_ID = rm.FK_NAZMEDLECH_ID) r
      on vnaz.NAZID = r.NAZID ;

begin
  /*res := 'TALON_CORRECT';
  open GetOplType;
  fetch GetOplType into pOplType, pFK_TALONID, TalonDate;
  close GetOplType;

  if TalonDate is not NULL then
   if pOplType = ASU.Get_Budzhet_Doc_Type then
             res := 'TALON_CORRECT';
   else
             --Получаем расчетное число
             CheckDate := TRUNC(last_day(SYSDATE));
             --Получаем текущее число
             CurrentDate := TRUNC(SYSDATE);

              -- Проверяем, если сегодня последний день месяца, то тогда отменять ничего нельзя
             if CheckDate = CurrentDate then
              res := 'Нельзя удалять назначение в последний день месяца';
             else
              -- Если не последний день, то проверяем. Если дата подписи в предыдущих месяцах то проверять нужно все по праву

              OPEN cDateDetail(CurrentDate);
              Fetch cDateDetail into CurrentDateYear,  CurrentDateMonth;
              Close cDateDetail;

              OPEN cDateDetail(TalonDate);
              Fetch cDateDetail into TalonDateYear, TalonDateMonth;
              Close cDateDetail;


              if (TalonDate < CurrentDate) and
                  (
                   (TalonDateYear < CurrentDateYear)
                    or
                    ((TalonDateYear = CurrentDateYear) and (TalonDateMonth < CurrentDateMonth))
                  )  then
               --Проверяем, если есть право на отмену то тогда все ОК
               Open CheckAccess;
               Fetch CheckAccess into pCheckAccess;
               Close CheckAccess;

               if pCheckAccess > 0 then
                res := 'TALON_CORRECT';
               else
                res := 'Нельзя удалять назначение за предыдущий месяц';
               end if;
              else
               res := 'TALON_CORRECT';
              end if;
             end if;
   end if;
  end if;
  return res;*/

  res := 'TALON_CORRECT';
  open GetOplType;
  fetch GetOplType into pOplType, pFK_TALONID, TalonDate, v_PlatDogNum, v_NazName;
  close GetOplType;

  IF v_PlatDogNum IS NOT NULL THEN
    return 'Назначение ('|| v_NazName ||') нельзя удалить, поскольку оно связано с платными услугами в договоре (' || v_PlatDogNum || ')!';
  END IF;

  vHasRecipe := 0;
  open CheckRecipes;
  fetch CheckRecipes into vHasRecipe;
  close CheckRecipes;

  if vHasRecipe > 0  then
    return 'Назначение нельзя удалить, т.к. в рамках этого назначения были созданы рецепты!';
  end if;

  if TalonDate is not NULL then
   if pOplType = ASU.Get_Budzhet_Doc_Type then
             res := 'TALON_CORRECT';
   else
             --Получаем расчетное число
             CheckDate := TRUNC(last_day(SYSDATE));
             --Получаем текущее число
             CurrentDate := TRUNC(SYSDATE);

              -- Проверяем, если сегодня последний день месяца, то тогда отменять ничего нельзя
             if CheckDate = CurrentDate then
              res := 'Нельзя удалять назначение в последний день месяца';
             else
              -- Если не последний день, то проверяем. Если дата подписи в предыдущих месяцах то проверять нужно все по праву

              OPEN cDateDetail(CurrentDate);
              Fetch cDateDetail into CurrentDateYear,  CurrentDateMonth;
              Close cDateDetail;

              OPEN cDateDetail(TalonDate);
              Fetch cDateDetail into TalonDateYear, TalonDateMonth;
              Close cDateDetail;


              if (TalonDate < CurrentDate) and
                  (
                   (TalonDateYear < CurrentDateYear)
                    or
                    ((TalonDateYear = CurrentDateYear) and (TalonDateMonth < CurrentDateMonth))
                  )  then
               --Проверяем, если есть право на отмену то тогда все ОК
               Open CheckAccess;
               Fetch CheckAccess into pCheckAccess;
               Close CheckAccess;

               if pCheckAccess > 0 then
                res := 'TALON_CORRECT';
               else
                res := 'Нельзя удалять назначение за предыдущий месяц';
               end if;
              else
               res := 'TALON_CORRECT';
              end if;
             end if;
   end if;
  end if;
  return res;
end;
/

SHOW ERRORS;


