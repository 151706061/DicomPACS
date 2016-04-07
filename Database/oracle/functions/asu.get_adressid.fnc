DROP FUNCTION ASU.GET_ADRESSID
/

--
-- GET_ADRESSID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TADRESS (Table)
--   TADRTYPE (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_ADRESSID" -- Created by TimurLan
  ( pFK_PEPLID IN NUMBER)
 RETURN NUMBER IS
  nTemp NUMBER;
  nDefault NUMBER;
  CURSOR cTemp IS SELECT FK_ID,FK_TYPE FROM TADRESS WHERE FK_PACID=pFK_PEPLID;
BEGIN
  SELECT FK_ID INTO nDEFAULT FROM TADRTYPE WHERE FL_DEFAULT = 1;
  nTemp:=0;
  FOR p IN cTEMP LOOP
--    EXIT WHEN cTEMP%NOTFOUND;
    if cTEMP%ROWCOUNT = 1 then
      nTemp := p.FK_ID;
    else
      if p.FK_TYPE = nDefault then
        nTEMP := p.FK_ID;
        Exit;
      else
        select MIN(FK_ID) into nTemp FROM TADRESS WHERE FK_PACID = pFK_PEPLID;
      end if;
    end if;
  END LOOP;
  RETURN nTemp;
END;
/

SHOW ERRORS;


