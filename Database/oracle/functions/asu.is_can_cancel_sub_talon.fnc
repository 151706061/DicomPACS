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

  --�������� ��������� �����
  CheckDate := TRUNC(last_day(SYSDATE));
  --�������� ������� �����
  CurrentDate := TRUNC(SYSDATE);

  --�������� ���� ������
  Open GetTalonSubscribeDate;
  Fetch GetTalonSubscribeDate into TalonDate;
  Close GetTalonSubscribeDate;

  -- ���������, ���� ������� ��������� ���� ������, �� ����� �������� ������ ������
  if CheckDate = CurrentDate then
   res := '������ �������� ������� � ��������� ���� ������';
  else
   -- ���� �� ��������� ����, �� ���������. ���� ���� ������� � ���������� ������� �� ��������� ����� ��� �� �����
   if TalonDate < CurrentDate then
    --���������, ���� ���� ����� �� ������ �� ����� ��� ��
    Open CheckAccess;
    Fetch CheckAccess into pCheckAccess;
    Close CheckAccess;

    if pCheckAccess > 0 then
     res := 'TALON_CORRECT';
    else
     res := '������ �������� ������� �� ���������� �����';
    end if;
   else
    res := 'TALON_CORRECT';
   end if;
  end if;

  return res;
end;
/

SHOW ERRORS;


