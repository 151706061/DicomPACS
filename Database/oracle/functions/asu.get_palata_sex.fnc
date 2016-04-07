DROP FUNCTION ASU.GET_PALATA_SEX
/

--
-- GET_PALATA_SEX  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TPERESEL (Table)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PALATA_SEX" 
  ( pFK_ID IN NUMBER,pFD_DATA IN DATE) RETURN VARCHAR2 IS
CURSOR cTemp IS SELECT /*+rule*/FP_SEX
                  FROM TKARTA,TPERESEL
                 where TPERESEL.FK_PACID=TKARTA.FK_ID
                   AND FD_DATA1<=pFD_DATA
                   AND FD_DATA2>=pFD_DATA
                   AND TPERESEL.FK_PALATAID=pFK_ID;
  nTemp  NUMBER;
  nSex NUMBER;
BEGIN
  nSex:=-1;
  OPEN cTemp;
  LOOP
    FETCH cTemp INTO nTemp;
    EXIT WHEN cTemp%NOTFOUND;
    if nTemp=0 AND nSex=-1 then
      nSex:=0;
    elsif nTemp=1 AND nSex=-1 then
      nSex:=1;
    elsif nTemp IN (0,1) AND nSex<>-1 then
      nSex:=2;
      EXIT;
    end if;
  END LOOP;
  CLOSE cTemp;
  IF nTemp=0 THEN
    RETURN 'Женская';
  ELSIF nTemp=1 THEN
    RETURN 'Мужская';
  ELSIF nTemp=2 THEN
    RETURN 'Совместная';
  ELSE
    RETURN '';
  END IF;
END;
/

SHOW ERRORS;


