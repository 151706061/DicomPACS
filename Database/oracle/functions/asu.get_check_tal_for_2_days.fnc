DROP FUNCTION ASU.GET_CHECK_TAL_FOR_2_DAYS
/

--
-- GET_CHECK_TAL_FOR_2_DAYS  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   DO_CHECK_OBJECT_ACCESS (Function)
--   TAMBTALON (Table)
--   TINSURDOCS (Table)
--
CREATE OR REPLACE FUNCTION ASU.GET_CHECK_TAL_FOR_2_DAYS(pFK_APPSOTRNID in number, pFK_TALONID in number, pFD_DATE in date)
 return varchar2 is

  OutComeDate date;
  CheckDate date;
  CurrentDate date;

  pCheckAccess number;
  PacOplType number;
  res varchar2(128);


  Cursor CheckAccess is
   SELECT LOGIN.DO_CHECK_OBJECT_ACCESS(pFK_APPSOTRNID,'CAN_SUB_TALON_FOR_2_DAYS') FROM DUAL;

  cursor GetPacOplType is
   select TInsurdocs.FK_TYPEDOCID from ASU.TINSURDOCS, ASU.TAMBTALON where
    TAMBTALON.FK_INSURANCEID = TINSURDOCS.FK_ID
    and TAMBTALON.FK_ID = pFK_TALONID;

begin
 /* open GetPacOplType;
  fetch GetPacOplType into PacOplType;
  close GetPacOplType;

  if PacOplType = ASU.Get_Use_Oms_Type then
    --Получаем текущее число
        CurrentDate := TRUNC(SYSDATE);

        --Получаем дату подписи талона
        OutComeDate := pFD_DATE;





        --По задаче подписать талон можно в течение месяца выписики + 2 дня следущего месяца, следовательно
        --Получаем последний день месяца подписи
        --ПРибавляем 3 дня ( то есть было 31, + 1 день, это первое, + 2 дня это второе
        CheckDate := TRUNC(last_day(OutComeDate));
        CheckDate := CheckDate + 3;


        -- Проверяем, если сегодняшний день больше или равен допустимого, тогда низя подписать
        if CurrentDate >= CheckDate then
         --Тепеь проверяем. Если есть право, то все ОК, можно подписывать
          Open CheckAccess;
          Fetch CheckAccess into pCheckAccess;
          Close CheckAccess;

          if pCheckAccess > 0 then
          res := 'TALON_CORRECT';
          else
           res := 'Нельзя подписать талон за предыдущий месяц.';
          end if;
        else
        res := 'TALON_CORRECT';
       end if;
  else
   res := 'TALON_CORRECT';
  end if;*/
  res := 'TALON_CORRECT';
  return res;
End;
/

SHOW ERRORS;


