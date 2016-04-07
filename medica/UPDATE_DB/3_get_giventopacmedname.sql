CREATE OR REPLACE 
FUNCTION asu.get_giventopacmedname(pnazmedlechid IN NUMBER, pGivenDate IN DATE) RETURN VARCHAR2 IS
 -- Created 14122007 by A.Nakorjakov
 -- ������� ���������� �������� ���������, ��������� �������� �� TNAZMEDLECH.FK_ID � ���� ������
 pRes VARCHAR2(1000);
 IsFirst Number;
BEGIN
 pRes := '';
 IsFirst := 1;
 FOR C IN
     (select m.fc_name ||
             ' ���-��: '||NVL(FN_KOL,0) fc_name
      from  asu.tmedicgiven mg,
            med.tmedic m
      where mg.fk_nazmedlechid = pnazmedlechid
            and mg.fk_medicgiven = m.medicid
            and trunc(mg.fd_given,'dd') = trunc(pGivenDate,'dd')) LOOP
     if (IsFirst = 1) then
        pRes := pRes || c.fc_name;
        IsFirst := 0;
     else
        pRes := pRes || CHR(13)||CHR(10)||c.fc_name;
     end if;
 END LOOP;
 RETURN pRes;
END;
/
EXIT
/