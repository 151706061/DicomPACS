DROP FUNCTION ASU.GET_FULLMKB10
/

--
-- GET_FULLMKB10  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_FULLMKB10" (pMkb10 VARCHAR )    RETURN  VARCHAR deterministic IS
-- CREATE BY XANDER 13.02.06
--возвращает полный код МКБ10: XX.XX
-- обязательно вызывать так: SUBSTR(GET_FULLMKB10(tsmid.fk_mkb10),1,20), чтоб FBI работал
 sRes VARCHAR (20);
BEGIN
 SELECT DECODE(LENGTH(SUBSTR(pMkb10,5)), NULL, pMkb10||'.00',
                                   1, SUBSTR(pMkb10,1,4)||'0'||SUBSTR(pMkb10,5),
                                   2, pMkb10) INTO sRes FROM DUAL;
 RETURN sRes;
END;
/

SHOW ERRORS;


