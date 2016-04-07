DROP PACKAGE ASU.PKG_INSURPROGRAM
/

--
-- PKG_INSURPROGRAM  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_INSURPROGRAM" IS

  -- Author  : Spasskiy S.N.
  -- Created : 18.08.2008 9:53:35
  -- Purpose : Страховые программы

  PROCEDURE ADD_HEAL_TO_PROGRAM(pFK_DOGOVOR NUMBER,
                                pFK_HEAL    NUMBER,
                                pFN_COST    NUMBER,
                                pFN_PAYPCNT NUMBER DEFAULT 100);
  PROCEDURE DELETE_HEAL_FROM_PROGRAM(pFK_DOGOVOR NUMBER, pFK_HEAL NUMBER);
  PROCEDURE ADD_ALLHEAL_TO_PROGRAM(pFK_DOGOVOR NUMBER);
  PROCEDURE DELETE_ALLHEAL_FROM_PROGRAM(pFK_DOGOVOR NUMBER);
  FUNCTION GET_HEAL_COST(pHealid  NUMBER,
                         pDogovor NUMBER,
                         pDate    DATE DEFAULT SYSDATE) RETURN NUMBER;
  PROCEDURE SET_COST(pFK_HEAL    NUMBER,
                     pFK_DOGOVOR NUMBER,
                     pFN_COST    NUMBER,
                     pFN_PCNT    NUMBER,
                     pDATE       DATE);
  PROCEDURE DO_UPDATE_DOGOVOR(pFK_DOGOVORID     NUMBER,
                              pFK_COMPANYID     NUMBER,
                              pFD_BEGIN         DATE,
                              pFD_END           DATE,
                              pFC_NUMBER        VARCHAR2,
                              pFN_LIMIT_PAC     NUMBER,
                              pFN_LIMIT_DOGOVOR NUMBER,
                              pFN_DISCOUNT      NUMBER,                              
                              pFC_COMMENT       VARCHAR2,
                              pFK_TYPEDOC       NUMBER,
                              pFN_STATE         NUMBER,
                              pFN_LIMIT         NUMBER DEFAULT NULL,
                              pFD_EXTENSION     DATE DEFAULT NULL);
  PROCEDURE DO_DELETE_DOGOVOR(PFK_DOGOVOR NUMBER);
  PROCEDURE ADD_PEOPLE_TO_DOGOVOR(pDOGOVOR NUMBER,
                                  pPEPLID  NUMBER,
                                  pFC_SER  VARCHAR,
                                  pFC_NUM  VARCHAR);
  FUNCTION GET_HEAL_COST_DEFAULT(pFK_HEALID NUMBER,
                                 pCOMPANYID NUMBER,
                                 pDATE      DATE DEFAULT SYSDATE)
    RETURN NUMBER;
  FUNCTION GET_PERCENT_INSUR_SMID(pInsurId NUMBER, pSmid NUMBER)
    RETURN NUMBER;
  FUNCTION IS_SMID_IN_INSURPROGRAMM(pInsurID NUMBER, pSmid NUMBER)
    RETURN NUMBER;

END PKG_INSURPROGRAM;
/

SHOW ERRORS;


