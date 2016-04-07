DROP FUNCTION ASU.GET_SHOWN_PERESEL
/

--
-- GET_SHOWN_PERESEL  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TPERESEL (Table)
--   PKG_REGIST_PACFUNC (Package)
--   GET_FCPALATA (Function)
--   GET_OTDELENIE (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_SHOWN_PERESEL" 
  (pFK_ID IN NUMBER)
  RETURN VARCHAR2 IS
CURSOR cTemp IS SELECT FD_DATA1,FD_DATA2,FK_PALATAID, PKG_REGIST_PACFUNC.GET_PAC_FCKORP(FK_PACID) FC_KORP FROM tperesel WHERE FK_ID=pFK_ID; 

dData1 DATE;
dData2 DATE;
nPalataID NUMBER;
FC_KORP VARCHAR2(300);
strTemp VARCHAR2(200);
BEGIN
  OPEN cTemp;
  FETCH cTemp INTO dData1,dData2,nPalataID, FC_KORP;
  CLOSE cTemp;
  strTemp:='С '||TO_CHAR(dData1,'dd.mm.yyyy HH24:MI')||' ';
  if dData2 IS NOT NULL then
    strTemp:=strTemp||'по '||TO_CHAR(dData2,'dd.mm.yyyy HH24:MI')||' ';
  end if;
  strTemp:=strTemp||'в палате '||GET_FCPALATA(nPalataID)||' '||GET_OTDELENIE(nPalataID);--FC_KORP;
  RETURN strTemp;
END;
/

SHOW ERRORS;


