DROP FUNCTION ASU.GET_PAC_FCSUBVID
/

--
-- GET_PAC_FCSUBVID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TVID (Table)
--   TDOGOVOR (Table)
--   TSUBVID (Table)
--   TPISMA (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PAC_FCSUBVID" -- Created by TimurLan
  (pFK_KOD2 IN NUMBER,pFK_KOD IN NUMBER) RETURN VARCHAR2
 IS-- used in rRegist;
  CURSOR cPisma IS
         SELECT FK_NAME_PIS
           FROM TPISMA
          WHERE TPISMA.FK_ID=pFK_KOD;
  CURSOR cDog IS
         SELECT FK_NAME_DOG
           FROM TDOGOVOR
          WHERE TDOGOVOR.FK_ID=pFK_KOD;
  CURSOR cOtherVSSubvid IS
         SELECT TVID.FC_NAME||' '||TSUBVID.FC_NAME
           FROM TVID,TSUBVID
          WHERE TVID.FK_ID=pFK_KOD2
            AND TSUBVID.FK_VIDID = pFK_KOD2
            AND TSUBVID.FK_ID=pFK_KOD;
  CURSOR cOtherWOSubvid IS
         SELECT FC_NAME
           FROM TVID
          WHERE FK_ID=pFK_KOD2;
  strTemp VARCHAR2(200);
  strTemp1 VARCHAR2(200);
BEGIN
  if pFK_KOD2=1 then
    strTemp:='Письмо № ';
    OPEN cPisma;
    FETCH cPisma INTO strTemp1;
    CLOSE cPisma;
    strTemp:=strTemp||strTemp1;
  elsif pFK_KOD2=2 then
    strTemp:='Договор № ';
    OPEN cDog;
    FETCH cDog INTO strTemp1;
    CLOSE cDog;
    strTemp:=strTemp||strTemp1;
  else
    OPEN cOtherVSSubVid;
    FETCH cOtherVSSubVid INTO strTemp;
    CLOSE cOtherVSSubVid;
    if (strTemp = '') OR (strTemp is NULL) then
      OPEN cOtherWOSubVid;
      FETCH cOtherWOSubVid INTO strTemp;
      CLOSE cOtherWOSubVid;
    end if;
  end if;
  RETURN strTemp;
END;
/

SHOW ERRORS;


