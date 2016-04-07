DROP FUNCTION ASU.IS_CAN_CANCEL_SUB_TALON
/

--
-- IS_CAN_CANCEL_SUB_TALON  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   DO_CHECK_OBJECT_ACCESS (Function)
--   TAMBTALON (Table)
--
CREATE OR REPLACE FUNCTION ASU.IS_CAN_CANCEL_SUB_TALON(pFK_APPSOTRNID in number, pFK_TALONID in number)
  return varchar2 is

  TalonDate date;
  CheckDate date;
  CurrentDate date;


  pCheckAccess number;
  res varchar2(128);

  Cursor CheckAccess is
   SELECT LOGIN.DO_CHECK_OBJECT_ACCESS(pFK_APPSOTRNID,'CAN_CANCEL_PREV_MONTH_TALON') FROM DUAL;

  cursor GetTalonSubscribeDate is
   Select NVL(TRUNC(TAMBTALON.FD_CLOSED),TRUNC(SYSDATE)) from ASU.TAMBTALON where FK_ID = pFK_TALONID;


begin

  --Получаем расчетное число
  CheckDate := TRUNC(last_day(SYSDATE));
  --Получаем текущее число
  CurrentDate := TRUNC(SYSDATE);

  --Получаем дату талона
  Open GetTalonSubscribeDate;
  Fetch GetTalonSubscribeDate into TalonDate;
  Close GetTalonSubscribeDate;

  -- Проверяем, если сегодня последний день месяца, то тогда отменять ничего нельзя
  if CheckDate = CurrentDate then
   res := 'Нельзя отменять подпись в последний день месяца';
  else
   -- Если не последний день, то проверяем. Если дата подписи в предыдущих месяцах то проверять нужно все по праву
   if TalonDate < CurrentDate then
    --Проверяем, если есть право на отмену то тогда все ОК
    Open CheckAccess;
    Fetch CheckAccess into pCheckAccess;
    Close CheckAccess;

    if pCheckAccess > 0 then
     res := 'TALON_CORRECT';
    else
     res := 'Нельзя отменять подпись за предыдущий месяц';
    end if;
   else
    res := 'TALON_CORRECT';
   end if;
  end if;

  return res;
end;
/

SHOW ERRORS;


