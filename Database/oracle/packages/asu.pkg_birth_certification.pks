DROP PACKAGE ASU.PKG_BIRTH_CERTIFICATION
/

--
-- PKG_BIRTH_CERTIFICATION  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_BIRTH_CERTIFICATION" IS

  FUNCTION GET_CERT_SNILS(pPeplid NUMBER) RETURN VARCHAR2;
  FUNCTION GET_CERT_INSUR_SER(pCertid NUMBER) RETURN VARCHAR2;
  FUNCTION GET_CERT_INSUR_NUM(pCertid NUMBER) RETURN VARCHAR2;
  FUNCTION HAS_BLANK_DATA(pBlankid NUMBER) RETURN NUMBER;
  FUNCTION GET_PEPL_BIRTDAY(pPeplid NUMBER) RETURN DATE;
  FUNCTION GET_FULL_PASSPORT(pPeplid NUMBER) RETURN VARCHAR2;

END PKG_BIRTH_CERTIFICATION;
/

SHOW ERRORS;


GRANT EXECUTE ON ASU.PKG_BIRTH_CERTIFICATION TO EXCHANGE
/

GRANT EXECUTE ON ASU.PKG_BIRTH_CERTIFICATION TO EXCH43
/

