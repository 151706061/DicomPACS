DROP PROCEDURE ASU.DO_PODPIS_ISSLED_TALON
/

--
-- DO_PODPIS_ISSLED_TALON  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PROCEDURE ASU."DO_PODPIS_ISSLED_TALON" (
                                                       pFK_NAZID in number, -- ID ����������
                                                       pFK_TALONID in number, -- ID  ������
                                                       pFK_SOTR�LOSED in number,  -- ID ���������� ����� ����������
                                                       pFK_SOTRID in number default -1, -- ID ���������� ����� ����������
                                                       pFK_SMID in number  default -1, -- SMID ����������
                                                       pFK_PACID in number  default -1-- ID ��������
                                                      )
is

 nFK_SMID number;
 nFK_PACID number;
 nFK_SOTRID number;

 nCount number; --��� ����, ����� ��������, � ����� ����� ���������
 IsAmbulance number; --���  ����, ����� ��������
 IsParaclinic number;

begin
  NULL;/*
 Select count(1) into IsParaclinic
   from ASU.Totdel
  where FK_ID = ASU.GET_PARAKLINIK_BLOCK
 connect by prior FK_OWNERID = FK_ID
  start with FK_ID = (select FK_OTDELID from ASU.TSotr where FK_ID = pFK_SOTR�LOSED);

  if pFK_SOTRID < 1 then
   select FK_SOTRID into nFK_SOTRID from ASU.Tambtalon where FK_ID = pFK_TALONID;
  else
   nFK_SOTRID := pFK_SOTRID;
  end if;


  if (pFK_SMID < 1) or (pFK_PACID < 1) then
   select FK_SMID, FK_PACID into nFK_SMID,nFK_PACID from ASU.VNAZ where FK_ID = pFK_NAZID;
  else
   nFK_SMID := pFK_SMID;
   nFK_PACID := pFK_PACID;
  end if;



  select count(1) into nCount from asu.TSmid where FK_ID in (asu.get_issledid, asu.get_analid) connect by prior FK_OWNER = FK_ID start with FK_ID = nFK_SMID;
  select count(1) into IsAmbulance from asu.TAmbulance where FK_ID = nFK_PACID;

  if (nCount > 0) and (IsAmbulance > 0) and (IsParaclinic > 0 )then
     UPDATE ASU.TAMBTALON
     set FK_SOTRID     = nFK_SOTRID,
         FK_SOTRCLOSED = pFK_SOTR�LOSED,
         FD_CLOSED     = TRUNC(SYSDATE),
         FN_SOS        = 1,
         FK_RESULT     = ASU.GET_SYNID('AMBTALON_RESULT_NO_CHANGE'),
         FK_DOPISHODID = ASU.GET_SYNID('TALON_OBSLED')
     where FK_ID = pFK_TALONID;
  end if;*/
end;
/

SHOW ERRORS;


