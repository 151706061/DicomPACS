DROP FUNCTION ASU.GET_SHOWN_SROKY
/

--
-- GET_SHOWN_SROKY  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_SHOWN_SROKY" 
  ( pFK_ID IN NUMBER)
  RETURN  VARCHAR2 IS
  CURSOR cTemp IS SELECT /*+first_row*/FK_PRYB,FD_DATA1,FD_DATA2,FN_KOL FROM TSROKY WHERE FK_ID=pFK_ID;
  nFK_PRYB NUMBER;
  nFN_KOL NUMBER;
  dFD_DATA1 DATE;
  dFD_DATA2 DATE;
  strTemp VARCHAR2(200);
BEGIN
  OPEN cTemp;
  FETCH cTemp INTO nFK_PRYB,dFD_DATA1,dFD_DATA2,nFN_KOL;
    strTemp:='С '||TO_CHAR(dFD_DATA1,'dd.mm.yyyy hh24:mi')||' ';
    if dFD_DATA2 IS NOT NULL THEN
      strTemp:=strTemp||'по '||TO_CHAR(dFD_DATA2,'dd.mm.yyyy hh24:mi')||' ';
    END IF;
  CLOSE cTemp;
  if nFK_PRYB=1 then
    --strTemp:=strTemp||'планируемый заезд';
    strTemp:=strTemp||'в больнице';
  elsif nFK_PRYB=2 then
    --strTemp:=strTemp||'фактический заезд';
    strTemp:=strTemp||'в профильном отделении';
  elsif nFK_PRYB=5 then
    strTemp:=strTemp||'продление';
  elsif nFK_PRYB=6 then
    strTemp:=strTemp||'продление в счет опоздания';
  elsif nFK_PRYB=4 then
    strTemp:=strTemp||'восстановление';
  elsif nFK_PRYB=3 then
  begin
    strTemp:=strTemp||'                      окончательная выписка ';
    if nFN_KOL>0 then
      strTemp:=strTemp||'остаток от периода '||TO_CHAR(nFN_KOL)||' [дней]';
    end if;
  end;
  elsif nFK_PRYB=7 then
  begin
    strTemp:=strTemp||'                      временная выписка ';
    if nFN_KOL>0 then
      strTemp:=strTemp||'остаток от периода '||TO_CHAR(nFN_KOL)||' [дней]';
    end if;
  end;
  end if;
  RETURN strTemp;
END;
/

SHOW ERRORS;


DROP SYNONYM BUH.GET_SHOWN_SROKY
/

--
-- GET_SHOWN_SROKY  (Synonym) 
--
--  Dependencies: 
--   GET_SHOWN_SROKY (Function)
--
CREATE SYNONYM BUH.GET_SHOWN_SROKY FOR ASU.GET_SHOWN_SROKY
/


