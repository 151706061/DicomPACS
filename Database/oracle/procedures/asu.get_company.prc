DROP PROCEDURE ASU.GET_COMPANY
/

--
-- GET_COMPANY  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TCOMPANY (Table)
--
CREATE OR REPLACE PROCEDURE ASU."GET_COMPANY" 
( pFK_ID IN OUT NUMBER,pFC_NAME OUT VARCHAR2, pFC_SHORT OUT VARCHAR2, pFK_COUNTRYID OUT NUMBER, pFK_REGIONID OUT NUMBER,
  pFK_TOWNID OUT NUMBER, pFC_ADR OUT VARCHAR2,pFC_pFAX OUT VARCHAR2,pFC_TEL OUT VARCHAR2,pFC_OKONH OUT VARCHAR2,
  pFC_OKPO OUT VARCHAR2,pFC_INN OUT VARCHAR2)
IS
  CURSOR cTemp IS   SELECT /*+rule*/FK_ID,FC_NAME,FC_SHORT,FK_COUNTRYID,FK_REGIONID,FK_TOWNID,FC_ADR,FC_FAX,FC_TEL,FC_OKONH,FC_OKPO,FC_INN
                    FROM TCOMPANY
                    WHERE FK_ID=pFK_ID;
  CURSOR cCount IS SELECT /*+first_row*/COUNT(FK_ID) FROM TCOMPANY WHERE FK_ID=pFK_ID;
  nTemp NUMBER;
BEGIN
--  raise_application_error(-20001,TO_CHAR(pFK_ID));
  OPEN cCount;
  FETCH cCount INTO nTemp;
  CLOSE cCount;
--  raise_application_error(-20001,TO_CHAR(nTemp));
  if nTemp=0 then
    INSERT INTO TCOMPANY (FK_ID)VALUES (-1) RETURNING FK_ID INTO pFK_ID;
  elsif nTemp>1 then
    raise_application_error(-20001,'Было найдено более одной компании с уникальным кодом: '||TO_CHAR(pFK_ID));
  end if;
--  raise_application_error(-20001,TO_CHAR(pFK_ID));

  OPEN cTemp;
  FETCH cTemp INTO pFK_ID,pFC_NAME,pFC_SHORT,pFK_COUNTRYID,pFK_REGIONID,pFK_TOWNID,pFC_ADR,pFC_pFAX,pFC_TEL,pFC_OKONH,pFC_OKPO,pFC_INN;
  CLOSE cTemp;
--  raise_application_error(-20001,TO_CHAR(pFK_ID));

END; -- Procedure
/

SHOW ERRORS;


