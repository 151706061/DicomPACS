DROP FUNCTION ASU.IS_CAN_SUBSCRIBE_TALON
/

--
-- IS_CAN_SUBSCRIBE_TALON  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TAMBTALON (Table)
--   TAMBTALON_NAZ (Table)
--   TINSURDOCS (Table)
--   GET_DEF_FUNCT (Function)
--   VNAZ (Table)
--
CREATE OR REPLACE FUNCTION ASU.IS_CAN_SUBSCRIBE_TALON(pFK_APPSOTRNID in number, TalonDate  in date, pFK_TALONID in number)
  return varchar2 is

  CheckDate date;
  CurrentDate date;

  CurrentDateMonth number;
  CurrentDateYear number;

  TalonDateMonth number;
  TalonDateYear number;


  pCheckAccess number;
  res varchar2(128);
  pOplType number;

  cursor GetOplType is
   select TINSURDOCS.FK_TYPEDOCID from ASU.TAMBTALON, ASU.TINSURDOCS where
   TAMBTALON.FK_INSURANCEID = TINSURDOCS.FK_ID
   and
   TAMBTALON.FK_ID = pFK_TALONID;

  Cursor cDateDetail(pdate in date) is
   select
     TO_NUMBER(TO_CHAR(pDate,'YYYY')),
     TO_NUMBER(TO_CHAR(pDate,'MM'))
   from DUAL;

  /*Cursor CheckAccess is
   SELECT LOGIN.DO_CHECK_OBJECT_ACCESS(pFK_APPSOTRNID,'CAN_SUB_PREV_MONTH_TALON_TEMP') FROM DUAL;*/

   CheckDateTalon NUMBER;
begin

 /* open GetOplType;
  fetch GetOplType into pOplType;
  close GetOplType;

  if pOplType = ASU.Get_Budzhet_Doc_Type then
            res := 'TALON_CORRECT';
  else
            --�������� ��������� �����
            CheckDate := TRUNC(last_day(SYSDATE));
            --�������� ������� �����
            CurrentDate := TRUNC(SYSDATE);

            -- ���������, ���� ������� ��������� ���� ������, �� ����� �������� ������ ������
            if CheckDate = CurrentDate then
             res := '������ ����������� ����� � ��������� ���� ������';
            else
             -- ���� �� ��������� ����, �� ���������. ���� ���� ������� � ���������� ������� �� ��������� ����� ��� �� �����

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
              --���������, ���� ���� ����� �� ������ �� ����� ��� ��
              Open CheckAccess;
              Fetch CheckAccess into pCheckAccess;
              Close CheckAccess;

              if pCheckAccess > 0 then
               res := 'TALON_CORRECT';
              else
               res := '������ ��������� ����� ���������� �������';
              end if;
             else
              res := 'TALON_CORRECT';
             end if;
            end if;
  end if;*/

  res := 'TALON_CORRECT';
  
  SELECT ASU.GET_DEF_FUNCT('AMBTALON_CHECK_DATE_SO', 1) INTO CheckDateTalon FROM DUAL;
  
  IF CheckDateTalon = 1
  THEN
    SELECT ta.FD_OPENED, (SELECT MIN(COALESCE(v.FD_RUN, v.FD_NAZ)) FROM ASU.TAMBTALON_NAZ tn INNER JOIN ASU.VNAZ v ON tn.fk_nazid = v.fk_id WHERE tn.fk_talonid = ta.fk_id)
    INTO CheckDate, CurrentDate
    FROM ASU.TAMBTALON ta
    WHERE ta.fk_id = pFK_TALONID;
    
    if trunc(CheckDate) <> trunc(CurrentDate)
    THEN      
      res := '���� �������� ������ (' || TO_CHAR(TRUNC(CheckDate), 'dd.mm.yyyy') || ') �� ����� ����������� ���� (' 
          || TO_CHAR(TRUNC(CurrentDate), 'dd.mm.yyyy') || ') ������ � ������. ';
    END IF;
    
    CheckDate := TalonDate;
    
    SELECT MAX(COALESCE(v.FD_RUN, v.FD_NAZ)) 
    INTO CurrentDate
    FROM ASU.TAMBTALON_NAZ tn INNER JOIN ASU.VNAZ v 
         ON tn.fk_nazid = v.fk_id 
    WHERE tn.fk_talonid = pFK_TALONID;
    
    if trunc(CheckDate) <> trunc(CurrentDate)
    THEN
      if res = 'TALON_CORRECT'
      then
        res := '';
      end if;
      
      res := res || '���� �������� ������ (' || TO_CHAR(TRUNC(CheckDate), 'dd.mm.yyyy') || ') �� ����� ������������ ���� (' 
          || TO_CHAR(TRUNC(CurrentDate), 'dd.mm.yyyy') || ') ������ � ������. ';
    END IF;
  END IF;

  return res;
end;
/

SHOW ERRORS;


