DROP PACKAGE BODY ASU.PKG_PEOPLE_DOPSTATUS
/

--
-- PKG_PEOPLE_DOPSTATUS  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU.PKG_PEOPLE_DOPSTATUS is

-- Получение текущего статуса прикрепления человека
function GET_PEOPLE_ATTACH_STATUS (aPEPLID in number) return varchar2 is
  Result varchar2(13);
begin
  select decode((select FL_STATUS * FL_TFOMS_STATUS
                   from ASU.TPEOPLES_DOPSTATUS
                  where FK_PEPLID = aPEPLID
                 ), 1, 'Прикреплен', 'Не прикреплен') into Result from DUAL;
  return(Result);
end;


-- Получение даты последнего прикрепления человека
function GET_PEOPLE_ATTACH_DATE (aPEPLID in number) return date is
  Result date;
begin
  select FD_DATE into Result
  from (select decode(FL_STATUS, 1, FD_DATE, NULL) AS FD_DATE
          from ASU.TPEOPLES_DOPSTATUS
         where FK_PEPLID = aPEPLID
        );

  return(Result);
end;


-- Получение номера действующего полиса ОМС человека
function GET_PEOPLE_POLICY (aPEPLID in number) return varchar2 is
  Result varchar2(100);
begin
  select TRIM(TRIM(i.FC_SER) || ' ' || TRIM(i.FC_NUM)) into Result
    from ASU.TINSURDOCS i
   where i.FK_ID = (select MAX(ins.FK_ID)
                      from ASU.TINSURDOCS ins
                           inner join ASU.TTYPEDOC doc on ins.FK_TYPEDOCID = doc.FK_ID
                                                       and doc.FC_SYNONIM = 'OMS'
                     where ins.FK_PEPLID = aPEPLID
                       and SYSDATE between ins.FD_BEGIN and coalesce(ins.FD_END, SYSDATE + 1));

  return(Result);
end;


-- Получение ЕНП человека
function GET_PEOPLE_POLICY_ENP (aPEPLID in number) return varchar2 is
  Result varchar2(100);
begin
  select TRIM(i.FC_ENP) into Result
    from ASU.TINSURDOCS i
   where i.FK_ID = (select MAX(ins.FK_ID)
                      from ASU.TINSURDOCS ins
                           inner join ASU.TTYPEDOC doc on ins.FK_TYPEDOCID = doc.FK_ID
                                                       and doc.FC_SYNONIM = 'OMS'
                     where ins.FK_PEPLID = aPEPLID
                       and SYSDATE between ins.FD_BEGIN and coalesce(ins.FD_END, SYSDATE + 1));

  return(Result);
end;


-- Получение Ф.И.О. сотрудника, который ПОСЛЕДНИМ нажимал кнопку "Прикрепить"
function GET_LAST_SOTR_BIND (aID in number) return varchar2 is
  Result varchar2(100);
begin
  select SOTR into Result
    from (select ASU.GET_SOTRNAME(dh.FK_SOTRID) AS SOTR,
                 row_number() over (order by dh.FD_USERDATE desc) r
            from ASU.TPEOPLES_DOPSTATUS_HISTORY dh
           where dh.FK_DOPSTATUS = aID
             and dh.FN_TYPE = 1)
   where r = 1;

  return(Result);
end;


-- Получение даты, когда ПОСЛЕДНИЙ раз нажали кнопку "Прикрепить"
function GET_LAST_DATE_BIND (aID in number) return date is
  Result date;
begin
  select USERDATE into Result
    from (select dh.FD_USERDATE AS USERDATE,
                 row_number() over (order by dh.FD_USERDATE desc) r
            from ASU.TPEOPLES_DOPSTATUS_HISTORY dh
           where dh.FK_DOPSTATUS = aID
             and dh.FN_TYPE = 1)
   where r = 1;

  return(Result);
end;


-- Получение Ф.И.О. сотрудника, который ПОСЛЕДНИМ нажимал кнопку "Печать прикрепления"
function GET_LAST_SOTR_PRINT (aID in number) return varchar2 is
  Result varchar2(100);
begin
  select SOTR into Result
    from (select ASU.GET_SOTRNAME(dh.FK_SOTRID) AS SOTR,
                 row_number() over (order by dh.FD_USERDATE desc) r
            from ASU.TPEOPLES_DOPSTATUS_HISTORY dh
           where dh.FK_DOPSTATUS = aID
             and dh.FN_TYPE = 11)
   where r = 1;

  return(Result);
end;


-- Получение даты, когда ПОСЛЕДНИЙ раз нажали кнопку "Печать прикрепления"
function GET_LAST_DATE_PRINT (aID in number) return date is
  Result date;
begin
  select USERDATE into Result
    from (select dh.FD_USERDATE AS USERDATE,
                 row_number() over (order by dh.FD_USERDATE desc) r
            from ASU.TPEOPLES_DOPSTATUS_HISTORY dh
           where dh.FK_DOPSTATUS = aID
             and dh.FN_TYPE = 11)
   where r = 1;

  return(Result);
end;


-- Получение текущего статуса согласия на передачу медицинской информации о человеке
function GET_PEOPLE_SOGLASIE_STATUS (aPEPLID in number) return number is
  Result number(1);
begin
  select FL_SOGLASIE into Result
    from ASU.TPEOPLES_DOPSTATUS
   where FK_PEPLID = aPEPLID;

  return(Result);
end;


-- Получение даты последнего получения согласия на передачу мед. информации
function GET_PEOPLE_SOGLASIE_DATE (aPEPLID in number) return date is
  Result date;
begin
  select FD_SOGLDATE into Result
  from (select decode(FL_SOGLASIE, 1, FD_SOGLDATE, NULL) AS FD_SOGLDATE
          from ASU.TPEOPLES_DOPSTATUS
         where FK_PEPLID = aPEPLID
        );

  return(Result);
end;


-- Получение ФИО доктора по ИНН (из поля ASU.TPEOPLES_DOPSTATUS.FK_DOKTOR)
function GET_SOTR_BY_INN (aINN in varchar2) return varchar2 is
  Result varchar2(100);
begin
  select distinct FC_FAM || ' ' || substr(FC_NAME, 1, 1) || '.' || substr(FC_OTCH, 1, 1) || '.' into Result
    from LOGIN.TSOTR
   where FN_INN = aINN;

  return(Result);
end;


-- Процедура прикрепления человека к текущему ЛПУ
function BIND_PEOPLE (aPEPLID in number, aSOTRID in number, aDATE in date) return number is
  Result number;
  nCurStatus ASU.TPEOPLES_DOPSTATUS.FL_STATUS%type;
  nLastId ASU.TPEOPLES_DOPSTATUS.FK_ID%type;
begin
  Result := -1;

  -- Проверим, что пациент уже прикреплен
  select MAX(FL_STATUS) into nCurStatus
    from ASU.TPEOPLES_DOPSTATUS
   where FK_PEPLID = aPEPLID;

  if nCurStatus = 1 then
    return(Result);
  end if;

  Result := 1;
  nLastId := NULL;

  -- Проверим, что существует запись пациента
  select MAX(FK_ID) into nLastId
    from ASU.TPEOPLES_DOPSTATUS
   where FK_PEPLID = aPEPLID;

  -- Если нет, значит оформление согласия на прикрепление к ЛПУ производится самым первым
  if nLastId is NULL then
    insert into ASU.TPEOPLES_DOPSTATUS(FK_PEPLID, FL_STATUS, FD_DATE, FL_TFOMS_STATUS)
    values (aPEPLID, 1, aDATE, 0)
    returning FK_ID into nLastId;
  else -- Запись уже есть
    update ASU.TPEOPLES_DOPSTATUS
       set FL_STATUS = 1
           ,FD_DATE = aDATE
           ,FL_TFOMS_STATUS = 0
     where FK_PEPLID = aPEPLID
    returning FK_ID into nLastId;
  end if;

  insert into ASU.TPEOPLES_DOPSTATUS_HISTORY(FK_DOPSTATUS, FK_SOTRID, FN_TYPE, FL_STATUS, FD_DATE, FL_TFOMS_STATUS)
  values (nLastId, aSOTRID, 1, 1, aDATE, 0);

  return(Result);
end;


-- Процедура обработки печати соглашения о прикреплении человека к текущему ЛПУ
function PRINT_BIND (aPEPLID in number, aSOTRID in number) return number is
  Result number;
  nLastId ASU.TPEOPLES_DOPSTATUS.FK_ID%type;
begin
  Result := 1;
  nLastId := NULL;

  -- Проверим, что существует запись пациента
  select MAX(FK_ID) into nLastId
    from ASU.TPEOPLES_DOPSTATUS
   where FK_PEPLID = aPEPLID;

  -- Если нет, значит печать согласия на прикрепление производится самой первой
  if nLastId is NULL then
    insert into ASU.TPEOPLES_DOPSTATUS(FK_PEPLID, FD_DATE)
    values (aPEPLID, trunc(SYSDATE)) -- Эта дата исправится после настоящего прикрепления
    returning FK_ID into nLastId;
  end if;

  insert into ASU.TPEOPLES_DOPSTATUS_HISTORY(FK_DOPSTATUS, FK_SOTRID, FN_TYPE)
  values (nLastId, aSOTRID, 11);

  return(Result);
end;


function SOGLASIE_PEOPLE (aPEPLID in number, aSOTRID in number, aDATE in date) return number is
  Result number;
  nCurStatus ASU.TPEOPLES_DOPSTATUS.FL_SOGLASIE%type;
  nLastId ASU.TPEOPLES_DOPSTATUS.FK_ID%type;
begin
  Result := -1;

  -- Проверим, что пациент уже дал согласие
  select MAX(FL_SOGLASIE) into nCurStatus
    from ASU.TPEOPLES_DOPSTATUS
   where FK_PEPLID = aPEPLID;

  if nCurStatus = 1 then
    return(Result);
  end if;

  Result := 1;
  nLastId := NULL;

  -- Проверим, что существует запись пациента
  select MAX(FK_ID) into nLastId
    from ASU.TPEOPLES_DOPSTATUS
   where FK_PEPLID = aPEPLID;

  -- Если нет, значит оформление согласия на передачу мед. инфо производится самым первым
  if nLastId is NULL then
    insert into ASU.TPEOPLES_DOPSTATUS(FK_PEPLID, FL_SOGLASIE, FD_SOGLDATE)
    values (aPEPLID, 1, aDATE)
    returning FK_ID into nLastId;
  else -- Запись уже есть
    update ASU.TPEOPLES_DOPSTATUS
       set FL_SOGLASIE = 1
           ,FD_SOGLDATE = aDATE
     where FK_PEPLID = aPEPLID
    returning FK_ID into nLastId;
  end if;

  insert into ASU.TPEOPLES_DOPSTATUS_HISTORY(FK_DOPSTATUS, FK_SOTRID, FN_TYPE, FL_SOGLASIE)
  values (nLastId, aSOTRID, 2, 1);

  return(Result);
end;


function PRINT_SOGLASIE (aPEPLID in number, aSOTRID in number) return number is
  Result number;
  nLastId ASU.TPEOPLES_DOPSTATUS.FK_ID%type;
begin
  Result := 1;
  nLastId := NULL;

  -- Проверим, что существует запись пациента
  select MAX(FK_ID) into nLastId
    from ASU.TPEOPLES_DOPSTATUS
   where FK_PEPLID = aPEPLID;

  -- Если нет, значит печать согласия на передачу мед. инфо производится самой первой
  if nLastId is NULL then
    insert into ASU.TPEOPLES_DOPSTATUS(FK_PEPLID, FD_SOGLDATE)
    values (aPEPLID, trunc(SYSDATE)) -- Эта дата исправится после настоящего согласия
    returning FK_ID into nLastId;
  end if;

  insert into ASU.TPEOPLES_DOPSTATUS_HISTORY(FK_DOPSTATUS, FK_SOTRID, FN_TYPE)
  values (nLastId, aSOTRID, 22);

  return(Result);
end;


-- Процедура прикрепления человека к текущему ЛПУ с помощью загрузчика из XML-файла
function BIND_PEOPLE_LOADER (aPEPLID in number, aSTATUS in number, aDATE in date, aDOCTOR in varchar2, aSOTRID in number) return number is
  Result number;
  nLastId ASU.TPEOPLES_DOPSTATUS.FK_ID%type;
  dCurDate ASU.TPEOPLES_DOPSTATUS.FD_DATE%type;
begin
  Result := 1;
  nLastId := NULL;

  -- Проверим, что существует запись пациента
  select MAX(FK_ID) into nLastId
    from ASU.TPEOPLES_DOPSTATUS
   where FK_PEPLID = aPEPLID;

  -- Если нет, значит этот человек до этого не прикреплялся (и не оформлялось согласие)
  if nLastId is NULL then
    insert into ASU.TPEOPLES_DOPSTATUS(FK_PEPLID, FL_STATUS, FD_DATE, FL_TFOMS_STATUS, FK_DOCTOR)
    values (aPEPLID, aSTATUS, aDATE, 1, aDOCTOR)
    returning FK_ID into nLastId;
  else -- Запись уже есть
    -- Проверим, что дата события (прикрепление или открепление) будет больше текущей даты смены статуса пациента
    select FD_DATE into dCurDate
      from ASU.TPEOPLES_DOPSTATUS
     where FK_PEPLID = aPEPLID;
    -- Если aDATE < dCurDate - то это архивные записи из файла прикреплений, и для них обновлять ТЕКУЩИЙ статус не нужно
    if aDATE > dCurDate then
      update ASU.TPEOPLES_DOPSTATUS
         set FL_STATUS = aSTATUS
             ,FD_DATE = aDATE
             ,FL_TFOMS_STATUS = 1
             ,FK_DOCTOR = aDOCTOR
       where FK_PEPLID = aPEPLID;
    end if;
  end if;

  insert into ASU.TPEOPLES_DOPSTATUS_HISTORY(FK_DOPSTATUS, FN_TYPE, FL_STATUS, FD_DATE, FL_TFOMS_STATUS, FK_DOCTOR, FK_SOTRID)
  values (nLastId, 3, aSTATUS, aDATE, 1, aDOCTOR, aSOTRID);

  return(Result);
end;


-- Процедура прикрепления человека к текущему ЛПУ с помощью службы прикрепления на портале ТФОМС
function BIND_PEOPLE_SERVICE (aID in number, aSTATUS in number, aMSG in varchar2, aDOCTOR in varchar2) return number is
  Result number;
  nCurStatus ASU.TPEOPLES_DOPSTATUS.FL_STATUS%type;
begin
  Result := 1;

  update ASU.TPEOPLES_DOPSTATUS
     set FL_TFOMS_STATUS = aSTATUS
         ,FC_TFOMS_REPLY = aMSG
         ,FK_DOCTOR = aDOCTOR
   where FK_ID = aID
  returning FL_STATUS into nCurStatus;

  insert into ASU.TPEOPLES_DOPSTATUS_HISTORY(FK_DOPSTATUS, FN_TYPE, FD_DATE, FL_STATUS, FL_TFOMS_STATUS, FC_TFOMS_REPLY, FK_DOCTOR)
  values (aID, 4, TRUNC(SYSDATE), nCurStatus, aSTATUS, aMSG, aDOCTOR);

  return(Result);
end;


-- Процедура повторного прикрепления человека к текущему ЛПУ для повторной отправки на портал ТФОМС
function REBIND_PEOPLE (aID in number, aUSERID in number) return number is
  Result number;
begin
  Result := 1;

  update ASU.TPEOPLES_DOPSTATUS
     set FL_TFOMS_STATUS = 0
   where FK_ID = aID;

  insert into ASU.TPEOPLES_DOPSTATUS_HISTORY(FK_DOPSTATUS, FK_SOTRID, FN_TYPE, FL_TFOMS_STATUS)
  values (aID, aUSERID, 1, 0);

  return(Result);
end;


-- Процедура "ручного" помещения в очередь на прикрепление человека к текущему ЛПУ с выборкой из временной таблицы
function QUEUE_BIND_PEOPLE (aPEPLID in number, aDOCTOR in varchar2) return number is
  Result number;
  nLastId ASU.TPEOPLES_DOPSTATUS.FK_ID%type;
begin
  Result := 1;
  nLastId := NULL;

  -- Проверим, что существует запись пациента
  select MAX(FK_ID) into nLastId
    from ASU.TPEOPLES_DOPSTATUS
   where FK_PEPLID = aPEPLID;

  -- Если нет, значит этот человек до этого не прикреплялся (и не оформлялось согласие)
  if nLastId is NULL then
    insert into ASU.TPEOPLES_DOPSTATUS(FK_PEPLID, FL_STATUS, FD_DATE, FL_TFOMS_STATUS, FK_DOCTOR)
    values (aPEPLID, 1, TRUNC(SYSDATE), 0, aDOCTOR)
    returning FK_ID into nLastId;
  else -- Запись уже есть
    update ASU.TPEOPLES_DOPSTATUS
       set FL_STATUS = 1
           ,FD_DATE = TRUNC(SYSDATE)
           ,FL_TFOMS_STATUS = 0
           ,FK_DOCTOR = aDOCTOR
     where FK_PEPLID = aPEPLID
    returning FK_ID into nLastId;
  end if;

  insert into ASU.TPEOPLES_DOPSTATUS_HISTORY(FK_DOPSTATUS, FN_TYPE, FL_STATUS, FD_DATE, FL_TFOMS_STATUS, FK_DOCTOR)
  values (nLastId, 0, 1, TRUNC(SYSDATE), 0, aDOCTOR);

  return(Result);
end;


-- Процедура помечения записи статусом "не найден доктор" (aMark = -2) и "не найден полис ОМС" (aMark = -3) в процессе работы службы
function MARK_BAD_PEOPLE (aID number, aMark number) return number is
  Result number;
begin
  Result := 1;

  update ASU.TPEOPLES_DOPSTATUS
     set FL_TFOMS_STATUS = aMark
   where FK_ID = aID;

  insert into ASU.TPEOPLES_DOPSTATUS_HISTORY(FK_DOPSTATUS, FN_TYPE, FL_TFOMS_STATUS)
  values (aID, 4, aMark);

  return(Result);
end;


end PKG_PEOPLE_DOPSTATUS;
/

SHOW ERRORS;


