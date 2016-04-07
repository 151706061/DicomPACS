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
    --�������� ������� �����
        CurrentDate := TRUNC(SYSDATE);

        --�������� ���� ������� ������
        OutComeDate := pFD_DATE;





        --�� ������ ��������� ����� ����� � ������� ������ �������� + 2 ��� ��������� ������, �������������
        --�������� ��������� ���� ������ �������
        --���������� 3 ��� ( �� ���� ���� 31, + 1 ����, ��� ������, + 2 ��� ��� ������
        CheckDate := TRUNC(last_day(OutComeDate));
        CheckDate := CheckDate + 3;


        -- ���������, ���� ����������� ���� ������ ��� ����� �����������, ����� ���� ���������
        if CurrentDate >= CheckDate then
         --����� ���������. ���� ���� �����, �� ��� ��, ����� �����������
          Open CheckAccess;
          Fetch CheckAccess into pCheckAccess;
          Close CheckAccess;

          if pCheckAccess > 0 then
          res := 'TALON_CORRECT';
          else
           res := '������ ��������� ����� �� ���������� �����.';
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


