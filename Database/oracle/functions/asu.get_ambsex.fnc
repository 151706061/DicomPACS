DROP FUNCTION ASU.GET_AMBSEX
/

--
-- GET_AMBSEX  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TAMBULANCE (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_AMBSEX" 
  ( pFK_ID IN NUMBER)
  RETURN  VARCHAR2 IS
  nTemp NUMBER;
  CURSOR cTemp IS SELECT /*+ rule*/ FP_SEX FROM TAMBULANCE WHERE FK_ID=pFK_ID;
BEGIN
  OPEN cTemp;
  FETCH cTemp INTO nTemp;
  CLOSE cTemp;
  if nTemp=0 then
    RETURN 'Женский';
  elsif nTemp=1 then
    RETURN 'Мужской';
  else RETURN ' ';
  end if;
END;
/

SHOW ERRORS;


