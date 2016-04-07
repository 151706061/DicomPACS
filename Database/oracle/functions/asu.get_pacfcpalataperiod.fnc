DROP FUNCTION ASU.GET_PACFCPALATAPERIOD
/

--
-- GET_PACFCPALATAPERIOD  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TROOM (Table)
--   TPERESEL (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PACFCPALATAPERIOD" 
  ( nPacId IN number,
    dData1 IN DATE,
    dData2 IN DATE)
  RETURN  varchar2 IS
  CURSOR cGet IS select /*+rule*/FD_DATA1,FD_DATA2,FC_PALATA from TPERESEL, TROOM
                 where FK_PACID=nPacId and (FD_DATA1 between dData1 and dData2 or
                       FD_DATA2 between dData1 and dData2) and
                       TROOM.FK_ID=TPERESEL.FK_PALATAID;
  cStr varchar2(65);
  dD1 date;
  dD2 date;
  cPalata varchar2(10);
  nTmp number;
BEGIN
  open cGet;
  cStr:='';
  nTmp:=0;
  loop
    fetch cGet into dD1,dD2,cPalata;
    exit when cGet%NOTFOUND;
    if nTmp=1 then
      cStr:=cStr||', ';
    end if;
    cStr:=cStr||cPalata||' (c '||to_char(dD1,'DD.MM.YYYY')||')';
    nTmp:=1;
  end loop;
  close cGet;

  RETURN cStr;
END;
/

SHOW ERRORS;


