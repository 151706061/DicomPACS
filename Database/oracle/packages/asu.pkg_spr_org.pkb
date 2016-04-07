DROP PACKAGE BODY ASU.PKG_SPR_ORG
/

--
-- PKG_SPR_ORG  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_SPR_ORG" IS
  PROCEDURE DO_DELETE_COMPANY (pFK_ID IN NUMBER) IS
    PRAGMA AUTONOMOUS_TRANSACTION;
  BEGIN
    DELETE
      FROM TCOMPANY
     WHERE FK_ID = pFK_ID;

    COMMIT;
  END;

  PROCEDURE DO_DELETE_BANK (pFK_ID IN NUMBER) IS
  BEGIN
    DELETE
      FROM TBNK
     WHERE FK_ID = pFK_ID;
  END;

  PROCEDURE GET_COMPANY (pFK_ID IN OUT NUMBER, pFC_NAME OUT VARCHAR2, pFC_SHORT OUT VARCHAR2, pFK_COUNTRYID OUT NUMBER, pFK_REGIONID OUT NUMBER, pFK_TOWNID OUT NUMBER, pFC_ADR OUT VARCHAR2,
    pFC_pFAX OUT VARCHAR2, pFC_TEL OUT VARCHAR2, pFC_OKONH OUT VARCHAR2, pFC_OKPO OUT VARCHAR2, pFC_INN OUT VARCHAR2
  ) IS
    CURSOR cTemp (pID NUMBER) IS
      SELECT/*+rule*/ FK_ID, FC_NAME, FC_SHORT, FK_COUNTRYID, FK_REGIONID, FK_TOWNID, FC_ADR, FC_FAX, FC_TEL, FC_OKONH, FC_OKPO, FC_INN
        FROM TCOMPANY
       WHERE FK_ID = pID;

    CURSOR cCount (pID NUMBER) IS
      SELECT fk_id
        FROM TCOMPANY
       WHERE FK_ID = pID;

    nTemp NUMBER;
  BEGIN
    OPEN cCount (pFK_ID);
    FETCH cCount INTO nTemp;

    IF cCount%NOTFOUND THEN
      INSERT INTO TCOMPANY
                  (FK_ID)
           VALUES (-1)
        RETURNING FK_ID
        INTO pFK_ID;
    END IF;

    CLOSE cCount;
    OPEN cTemp (pFK_ID);
    FETCH cTemp INTO pFK_ID, pFC_NAME, pFC_SHORT, pFK_COUNTRYID, pFK_REGIONID, pFK_TOWNID, pFC_ADR, pFC_pFAX, pFC_TEL, pFC_OKONH, pFC_OKPO, pFC_INN;
    CLOSE cTemp;
  END;                                                                                                                                                                                      -- Procedure

  PROCEDURE DO_WRITE_COMPANY (pFK_ID IN NUMBER, pFC_NAME IN VARCHAR2, pFC_SHORT IN VARCHAR2, pFK_COUNTRYID IN NUMBER, pFK_REGIONID IN NUMBER, pFK_TOWNID IN NUMBER, pFC_ADR IN VARCHAR2,
    pFC_FAX IN VARCHAR2, pFC_TEL IN VARCHAR2, pFC_OKONH IN VARCHAR2, pFC_OKPO IN VARCHAR2, pFC_INN IN VARCHAR2
  ) IS
  BEGIN
    UPDATE TCOMPANY
       SET FC_NAME = pFC_NAME,
           FC_SHORT = pFC_SHORT,
           FK_COUNTRYID = pFK_COUNTRYID,
           FK_REGIONID = pFK_REGIONID,
           FK_TOWNID = pFK_TOWNID,
           FC_ADR = pFC_ADR,
           FC_FAX = pFC_FAX,
           FC_TEL = pFC_TEL,
           FC_OKONH = pFC_OKONH,
           FC_OKPO = pFC_OKPO,
           FC_INN = pFC_INN
     WHERE FK_ID = pFK_ID;
  END;                                                                                                                                                                                      -- Procedure

  PROCEDURE DO_WRITE_BANK (pFK_ID IN NUMBER, pFK_COMPANYID IN NUMBER, pFC_NAME IN VARCHAR2, pFC_SHORT IN VARCHAR2, pFK_COUNTRYID IN NUMBER, pFK_REGIONID IN NUMBER, pFK_TOWNID IN NUMBER,
    pFC_ADR IN VARCHAR2, pFC_BIK IN VARCHAR2, pFC_OKONH IN VARCHAR2, pFC_OKPO IN VARCHAR2, pFC_INN IN VARCHAR2, pFC_RS IN VARCHAR2, pFC_KS IN VARCHAR2) IS
    CURSOR cTemp IS
      SELECT FK_ID
        FROM TBNK
       WHERE FK_ID = pFK_ID;

    nTemp NUMBER;
  BEGIN
    OPEN cTemp;
    FETCH cTemp INTO nTemp;

    IF cTemp%NOTFOUND THEN
      INSERT INTO TBNK
                  (FK_ID, FK_COMPANYID, FC_NAME, FC_SHORT, FK_COUNTRYID, FK_REGIONID, FK_TOWNID, FC_ADR, FC_BIK, FC_OKONH, FC_OKPO, FC_INN, FC_RS, FC_KS)
           VALUES (pFK_ID, pFK_COMPANYID, pFC_NAME, pFC_SHORT, pFK_COUNTRYID, pFK_REGIONID, pFK_TOWNID, pFC_ADR, pFC_BIK, pFC_OKONH, pFC_OKPO, pFC_INN, pFC_RS, pFC_KS);
    ELSE
      UPDATE TBNK
         SET FK_COMPANYID = pFK_COMPANYID,
             FC_NAME = pFC_NAME,
             FC_SHORT = pFC_SHORT,
             FK_COUNTRYID = pFK_COUNTRYID,
             FK_REGIONID = pFK_REGIONID,
             FK_TOWNID = pFK_TOWNID,
             FC_ADR = pFC_ADR,
             FC_BIK = pFC_BIK,
             FC_OKONH = pFC_OKONH,
             FC_OKPO = pFC_OKPO,
             FC_INN = pFC_INN,
             FC_RS = pFC_RS,
             FC_KS = pFC_KS
       WHERE FK_ID = pFK_ID;
    END IF;
    CLOSE cTemp;
  END;                                                                                                                                                                                      -- Procedure
END;                                                                                                                                                                         -- Package Body PKG_SPR_ORG
/

SHOW ERRORS;


