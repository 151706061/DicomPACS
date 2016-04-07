CREATE OR REPLACE FUNCTION GET_MEDNAZ_DAYDOZE(pnazid IN NUMBER) RETURN VARCHAR2 IS
 -- Created 19122007 by A.Nakorjakov 
 -- ������� ���������� �������� ���� ������������, ����������� � ���������� TNAZMED.FK_ID
 CURSOR cNazMedLechCount(ppnazid Number) 
 IS
   SELECT COUNT(1) FROM ASU.TNAZMEDLECH T WHERE T.FK_NAZMEDID = ppnazid;
   
 pRes VARCHAR2(1000);
 IsFirst Number;
 NazMedLechCount Number;
BEGIN
 
 open cNazMedLechCount(pnazid);
      fetch cNazMedLechCount into NazMedLechCount;
 close cNazMedLechCount;
 
 if NazMedLechCount = 0 then RETURN ''; end if; --���� ��� ������������ �� ����������, �� � ���������� ������
 
 IsFirst := 1;
 FOR C IN
 (  SELECT LN.FC_NAME,round(F.FN_MNOG * L.FN_DOZA, 2) AS FN_DAYDOZE
    FROM TNAZMED                  N,
         TNAZMEDLECH              L,
         MED.TLATIN_NAMES         LN,
         ASU.TFREQUENCY           F
   WHERE N.FK_ID = L.FK_NAZMEDID
     AND L.FK_MEDICID = LN.FK_ID
     AND N.FK_FREQUENCYID = F.FK_ID(+)
     AND N.FK_ID = pnazid) 
 LOOP
     if IsFirst = 1 then
        if NazMedLechCount = 1 then
           --������ ���� ���������� �� ����������, ���������� ������ �����
           pRes := pRes || C.FN_DAYDOZE;
        else
           --��������� ������������ �� ����������, ���������� �������� ����������� � ��� �������� ����
           pRes := pRes || C.FC_NAME || ':  ' ||C.FN_DAYDOZE;
        end if;
        IsFirst := 0;
     else
        --���� ������ ��������, ������ ��������� ������������ �� ������ ����������, 
        --���������� �������� ����������� � ��� �������� ����
        pRes := pRes || CHR(13)||CHR(10)||C.FC_NAME || ': ' ||C.FN_DAYDOZE;
     end if;         
 END LOOP;
 RETURN pRes;
END;
/
EXIT
/