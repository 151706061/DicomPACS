DROP FUNCTION ASU.GET_SEX
/

--
-- GET_SEX  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TAMBULANCE (Table)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_SEX" 
  ( pFK_ID IN NUMBER)
  RETURN NUMBER IS
--
-- Purpose: Получение пола пациента (и амбулаторного)
-- By Philip A. Milovanov
-- by TimurLan: функция СТАРАЯ! вместо нее НАДО юзать PKG_REGIST_PACFUNC.GET_PAC_SEXID(!)
CURSOR c (pID NUMBER)IS SELECT FP_SEX FROM TKARTA WHERE FK_ID=pID
                        UNION
                        SELECT FP_SEX FROM TAMBULANCE WHERE FK_ID=pID;
i NUMBER;
BEGIN
  OPEN c(pFK_ID);
  FETCH c INTO i;
  CLOSE c;
--  raise_application_error(-20002,'Sex id: '||TO_CHAR(i)||' !!!');
  RETURN i;
END;
/

SHOW ERRORS;


