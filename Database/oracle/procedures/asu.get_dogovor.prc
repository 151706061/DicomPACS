DROP PROCEDURE ASU.GET_DOGOVOR
/

--
-- GET_DOGOVOR  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TDOGOVOR (Table)
--
CREATE OR REPLACE PROCEDURE ASU."GET_DOGOVOR" -- Modified by TimurLan
  (pFK_ID IN OUT NUMBER,pFK_PREDID OUT NUMBER,pFD_DATA OUT DATE,pFK_NAME_DOG OUT VARCHAR2,pFN_SUM OUT NUMBER,pFN_NUM OUT NUMBER)
IS
 CURSOR cExists IS SELECT /*+ first_row*/COUNT(FK_ID) FROM TDOGOVOR WHERE FK_ID=pFK_ID;
 nTemp NUMBER;
BEGIN
  OPEN cExists;
  FETCH  cExists INTO nTemp;
  CLOSE cExists;
  if nTemp>1 then
    raise_application_error(-20001,'Ќайдено более одного договора с уникальным кодом: '||TO_CHAR(pFK_ID));
  elsif nTemp=0 then
    INSERT INTO TDOGOVOR(FK_ID) VALUES(pFK_ID) RETURNING FK_ID INTO pFK_ID;
  end if;
  SELECT /*+rule*/FK_PREDID,FD_DATA,FK_NAME_DOG,FN_SUM,FN_NUM INTO pFK_PREDID,pFD_DATA,pFK_NAME_DOG,pFN_SUM,pFN_NUM FROM TDOGOVOR WHERE FK_ID=pFK_ID;
END; -- Procedure
/

SHOW ERRORS;


