DROP PACKAGE BODY ASU.PKG_BIRTH_CERTIFICATION
/

--
-- PKG_BIRTH_CERTIFICATION  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_BIRTH_CERTIFICATION" 
IS
-- Created 20060810 by Serg
-- Modified 20060810 by Serg

  sTmp            VARCHAR2(1000);
--  nTmp            NUMBER;
  dTmp            DATE;

----------------------------------------------------------------------------------

FUNCTION GET_CERT_SNILS(pPeplid NUMBER) RETURN VARCHAR2 IS
  -- Created 20060810 by Serg
  -- Возвращает СНИЛС
  -- Edited by Spasskiy S.N. 05.11.2009
  sTmp ASU.TPEOPLES.FC_SNILS%TYPE;
BEGIN
  SELECT ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_SNILS(pPeplid)
    INTO sTmp
    FROM DUAL;
  RETURN sTmp;
END;

----------------------------------------------------------------------------------

FUNCTION GET_CERT_INSUR_SER(pCertid NUMBER) RETURN VARCHAR2 IS
-- Created 20060905 by Serg
-- Возвращает серию страхового полиса
 sTmp VARCHAR2(1000);
BEGIN
/* SELECT I.FC_SER
        INTO sTmp
        FROM TINSURDOCS I
        WHERE FK_ID = pInsurDocid;*/
 SELECT MAX(BS.FC_INSURSER)
        INTO sTmp
        FROM TBIRTH_CERTIFICATION BS
        WHERE BS.FK_ID = pCertID;
 RETURN sTmp;
END;

----------------------------------------------------------------------------------

FUNCTION GET_CERT_INSUR_NUM(pCertid NUMBER) RETURN VARCHAR2 IS
-- Created 20060905 by Serg
-- Возвращает номер страхового полиса
 sTmp VARCHAR2(1000);
BEGIN
/* SELECT I.FC_NUM
        INTO sTmp
        FROM TINSURDOCS I
        WHERE FK_ID = pInsurDocid;*/
 SELECT MAX(BS.FC_INSURNUM)
        INTO sTmp
        FROM TBIRTH_CERTIFICATION BS
        WHERE BS.FK_ID = pCertID;
 RETURN sTmp;
END;

----------------------------------------------------------------------------------

FUNCTION HAS_BLANK_DATA(pBlankid NUMBER) RETURN NUMBER IS
-- Created 20060906 by Serg
-- Возвращает ID данных для бланка, если данных нет, возвращает -1
 nTmp NUMBER;
BEGIN
 SELECT MAX(BS.FK_ID)
        INTO nTmp
        FROM TBIRTH_CERTIFICATION BS,
             TCERTIFCATION_BLANK CB
        WHERE CB.FK_ID = BS.FK_BLANKID
        AND CB.FK_ID = pBlankID;
IF nTmp IS NULL THEN
 nTmp := -1;
END IF;
 RETURN nTmp;
END;

----------------------------------------------------------------------------------

FUNCTION GET_PEPL_BIRTDAY(pPeplid NUMBER) RETURN DATE IS
-- Created 20060810 by Serg
-- Возвращает дату рождения пипла
 dTmp DATE;
BEGIN
 SELECT MAX(P.FD_ROJD)
        INTO dTmp
        FROM TPEOPLES P
        WHERE FK_ID = pPeplid;
 RETURN dTmp;
END;

----------------------------------------------------------------------------------

FUNCTION GET_FULL_PASSPORT(pPeplid NUMBER) RETURN VARCHAR2 IS
-- Created 20060811 by Serg
-- Возвращает полные паспортные данные пипла
 sTmp VARCHAR2(1000);
BEGIN
 SELECT MAX(DECODE(TRIM(P.FC_DOCSER), '', '', 'серия '||P.FC_DOCSER)||
        DECODE(TRIM(P.FC_DOCNUM), '', '', ', ')||
        DECODE(TRIM(P.FC_DOCNUM), '', '', 'номер '||P.FC_DOCNUM)||
        DECODE(TRIM(P.FC_DOCVIDAN), '', '', ', ')||
        DECODE(TRIM(P.FC_DOCVIDAN), '', '','выдан: '||P.FC_DOCVIDAN)||
        DECODE(TRIM(TO_CHAR(P.FD_DOCDATE, 'DD.MM.YYYY')), '', '',', ')||
        NVL(TO_CHAR(P.FD_DOCDATE, 'DD.MM.YYYY'), ''))
        INTO sTmp
        FROM TPEOPLES P
        WHERE FK_ID = pPeplid;
 RETURN sTmp;
END;
END PKG_BIRTH_CERTIFICATION;
/

SHOW ERRORS;


GRANT EXECUTE ON ASU.PKG_BIRTH_CERTIFICATION TO EXCHANGE
/

GRANT EXECUTE ON ASU.PKG_BIRTH_CERTIFICATION TO EXCH43
/

