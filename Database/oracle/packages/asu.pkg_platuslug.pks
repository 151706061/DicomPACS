DROP PACKAGE ASU.PKG_PLATUSLUG
/

--
-- PKG_PLATUSLUG  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TCOMPANY (Table)
--   TPAYER (Table)
--   TAMBTALON (Table)
--   TAPPENDIX (Table)
--   TBALANCEMOVE (Table)
--   TBILL (Table)
--   TBILL_USLUG (Table)
--   GET_DEF_STRAH_COMP (Function)
--   TPLAT_DOGOVOR (Table)
--   TPLAT_USLUG (Table)
--
CREATE OR REPLACE PACKAGE ASU."PKG_PLATUSLUG" IS
 FUNCTION GET_COMPANY_NAME(pCompanyID IN TCOMPANY.FK_ID%TYPE) RETURN TCOMPANY.FC_SHORT%TYPE;

 FUNCTION GET_TALON_PACFIO(pTalonID   IN TAMBTALON.FK_ID%TYPE,
                           pDogovorID IN TAPPENDIX.FK_DOGOVOR%TYPE DEFAULT 0) RETURN VARCHAR2;

 -- FUNCTION GET_TALON_PACFIO(pTalonID IN TAMBTALON.FK_ID%TYPE) RETURN VARCHAR2;
 FUNCTION GET_DOGOVOR_PACFIO(pDogovorID IN TPLAT_DOGOVOR.FK_ID%TYPE) RETURN VARCHAR2;
 FUNCTION GET_PAYER_NAME(pPayerID IN TPAYER.FK_ID%TYPE) RETURN VARCHAR2;
 FUNCTION GET_PAYER_FULLNAME(pPayerID IN TPAYER.FK_ID%TYPE) RETURN VARCHAR2;
 FUNCTION GET_PAYER_ADDRESS(pPayerID IN TPAYER.FK_ID%TYPE) RETURN VARCHAR2;
 FUNCTION GET_PAYER_DOC(pPayerID IN TPAYER.FK_ID%TYPE) RETURN VARCHAR2;
 FUNCTION GET_PAYER_DEBT(pPayerID IN TPAYER.FK_ID%TYPE) RETURN NUMBER;
 FUNCTION GET_BILL_SUM(pBillID IN TBILL_USLUG.FK_BILL%TYPE) RETURN TBILL_USLUG.FN_SUM%TYPE;
 FUNCTION GET_NDS_SUM_FOR_BILL(pBillID IN TBILL_USLUG.FK_BILL%TYPE) RETURN NUMBER;
 FUNCTION GET_NDS_SUM(pSum IN NUMBER) RETURN NUMBER;
 FUNCTION GET_NDS_SUM_FROMSUMWITHNDS(pSum IN NUMBER) RETURN NUMBER;
 FUNCTION GET_FREE_SUM(pPayerID IN TPAYER.FK_ID%TYPE) RETURN TBALANCEMOVE.FN_SUM%TYPE;
 FUNCTION GET_PAYER_PAYED_SUM(pPayerID IN TPAYER.FK_ID%TYPE) RETURN TBALANCEMOVE.FN_SUM%TYPE;
 FUNCTION GET_PAYER_MUSTBE_PAYED_SUM(pPayerID IN TPAYER.FK_ID%TYPE)
  RETURN TBILL_USLUG.FN_SUM%TYPE;
 FUNCTION IS_USL_PAYED(pUslID IN TPLAT_USLUG.FK_ID%TYPE) RETURN NUMBER;
 FUNCTION MOVE_MONEY(pFrom      IN TBALANCEMOVE.FK_FROM%TYPE, -- TO_FUNCTION
                     pTo        IN TBALANCEMOVE.FK_TO%TYPE,
                     pBill      IN TBALANCEMOVE.FK_BILL%TYPE,
                     pSum       IN TBALANCEMOVE.FN_SUM%TYPE,
                     pSotr      IN TBALANCEMOVE.FK_SOTR%TYPE,
                     pDateClaim IN TBALANCEMOVE.FD_CLAIM%TYPE DEFAULT NULL)
  RETURN TBALANCEMOVE.FK_ID%TYPE;
 PROCEDURE PAY_BILL(pBill IN TBILL.FK_ID%TYPE, pSotr IN TBILL.FK_SOTRPAY%TYPE);
 FUNCTION GET_NEXT_PKO RETURN VARCHAR2;
 /*FUNCTION CREATE_PLAT_DOGOVOR(pPacID      NUMBER,
                              pBegin      DATE,
                              pEnd        DATE,
                              pSotrCreate NUMBER,
                              pOpekun     NUMBER DEFAULT NULL) RETURN NUMBER;*/
 FUNCTION CREATE_PLAT_DOGOVOR(pPacID      NUMBER,
                              pBegin      DATE,
                              pEnd        DATE,
                              pSotrCreate NUMBER,
                              pOpekun     NUMBER DEFAULT NULL,
                              pSos        NUMBER DEFAULT 0) RETURN NUMBER;
 FUNCTION CREATE_PLAT_DOGOVOR(pPacID      NUMBER,
                              pSotrCreate NUMBER,
                              pOpekun     NUMBER DEFAULT NULL) RETURN NUMBER;
 PROCEDURE UPDATE_PLAT_DOGOVOR(pDogovorID NUMBER, pOpekun NUMBER);
 PROCEDURE PROLONG_DOGOVOR(pDogovorID NUMBER);
 PROCEDURE CLOSE_DOGOVOR(pDogovorID NUMBER, pSotrClose NUMBER);
 FUNCTION CREATE_APPENDIX(pDogovorID  NUMBER,
                          pOpen       DATE,
                          pSotrCreate NUMBER,
                          pAppNum     VARCHAR2) RETURN NUMBER;
 PROCEDURE TERMINATE_APPENDIX(pAppendixID    NUMBER,
                              pTerminateDate DATE,
                              pResClobID     NUMBER,
                              pZayavDate     DATE,
                              pSotrTerminate NUMBER,
                              pCloseReason   NUMBER);
 PROCEDURE APPENDIX_DONE(pAppendixID    NUMBER,
                         pTerminateDate DATE,
                         pResClobID     NUMBER,
                         pSotrTerminate NUMBER);
 PROCEDURE UPDATE_APPENDIX(pAppendixID  NUMBER,
                           pSos         NUMBER,
                           pPayAssume   DATE,
                           pPayType     NUMBER,
                           pAssumeClose DATE);
 PROCEDURE DO_PACSUBSCRIBE_APPENDIX(pAppendixID NUMBER);
 FUNCTION CREATE_BILL(pAppendixID NUMBER,
                      pSotrCreate NUMBER,
                      pCreateDate DATE,
                      pNUM        VARCHAR2) RETURN NUMBER;
 FUNCTION ADD_USLUG_TOBILL(pBillID      NUMBER,
                           pPlatUslugID NUMBER,
                           pSum         NUMBER,
                           pUslugCount  NUMBER) RETURN NUMBER;
 PROCEDURE UPDATE_USLUG_INBILL(pBillID      NUMBER,
                               pPlatUslugID NUMBER,
                               pSum         NUMBER,
                               pUslugCount  NUMBER);
 PROCEDURE UPDATE_USLUG_INBILL(pBill_UslugID NUMBER, pSum NUMBER, pUslugCount NUMBER);
 PROCEDURE REMOVE_USLUG_FROMBILL(pBillID NUMBER, pPlatUslugID NUMBER);
 PROCEDURE REMOVE_USLUG_FROMBILL(pBill_UslugID NUMBER, pPlatUslugID NUMBER);
/* FUNCTION GET_USLUG_COST(pHealID     NUMBER,
                         pDate       DATE DEFAULT SYSDATE,
                         pAppendixID NUMBER DEFAULT -1) RETURN NUMBER;*/
 FUNCTION GET_USLUG_COST(pHealID     NUMBER,
                         pNDS        NUMBER,
                         pCapacityID NUMBER,
                         pDate       DATE DEFAULT SYSDATE) RETURN NUMBER;
 FUNCTION GET_USLUG_COST(pHealID     NUMBER,
                         pCompanyID  NUMBER DEFAULT GET_DEF_STRAH_COMP,
                         pDate       DATE DEFAULT SYSDATE) RETURN NUMBER;
 FUNCTION GET_USLUG_COST_DOGOVOR(pHealID     NUMBER,
                         pInsurDogovor Number,
                         pDate       DATE DEFAULT SYSDATE) RETURN NUMBER;
 FUNCTION GET_USLUG_COST_INSURDOCS(pHealID     NUMBER,
                         pInsurDocsID Number,
                         pDate       DATE DEFAULT SYSDATE) RETURN NUMBER;
 FUNCTION GET_NAZ_INSURDOCSID(pNazID     NUMBER) RETURN NUMBER;
 FUNCTION CREATE_PLAT_USLUG(pNazID         NUMBER,
                            pCount         NUMBER,
                            pAssumeIspol   NUMBER,
                            pISPredOpl     NUMBER,
                            pRunAssumeDate DATE,
                            pHealID        NUMBER,
                            pCost          NUMBER,
                            pDuration      NUMBER,
                            pNDS           NUMBER,
                            pPayPercent    NUMBER) RETURN NUMBER;
 PROCEDURE UPDATE_PLAT_USLUG(pUslugID       NUMBER,
                             pNazID         NUMBER,
                             pCount         NUMBER,
                             pAssumeIspol   NUMBER,
                             pISPredOpl     NUMBER,
                             pRunAssumeDate DATE,
                             pHealID        NUMBER,
                             pCost          NUMBER,
                             pDuration      NUMBER,
                             pNDS           NUMBER,
                             pPayPercent    NUMBER);
 PROCEDURE UPDATE_PLAT_USLUG(pUslugID       NUMBER,
                             pNazID         NUMBER,
                             pAssumeIspol   NUMBER,
                             pRunAssumeDate DATE,
                             pDuration      NUMBER);
 PROCEDURE ANNUL_BILL(pBillID NUMBER, pAnnulDate DATE, pAnnulSotr NUMBER);
 FUNCTION IS_BILLANNUL(pBillID NUMBER) RETURN NUMBER;
 FUNCTION GET_NEWDOCNUM RETURN NUMBER;
 FUNCTION GET_NEWAPPENDIXNUM RETURN NUMBER;
 FUNCTION GET_NEWBILLNUM RETURN NUMBER;
 FUNCTION GET_NEWOREXISTSPAYER_PEPL(pPeplID NUMBER, pCapacity NUMBER) RETURN NUMBER;
 FUNCTION CREATE_PAYER_PHIS(pPeplID NUMBER, pCapacity NUMBER) RETURN NUMBER;
 FUNCTION CREATE_PAYER_COMP(pCompID NUMBER) RETURN NUMBER;
 FUNCTION GET_NEWOREXISTSPAYER_COMP(pCompID NUMBER) RETURN NUMBER;
 FUNCTION GET_APPENDIX_SOST(pAppendixID NUMBER) RETURN VARCHAR;
 FUNCTION GET_APPENDIX_COST(pAppendixID NUMBER) RETURN NUMBER;
 FUNCTION GET_APPENDIX_PAYED(pAppendixID NUMBER) RETURN NUMBER;
 FUNCTION GET_APPENDIX_NDS(pAppendixID NUMBER) RETURN NUMBER;
 FUNCTION GET_PHISPAYER_INFO(pPayerID NUMBER) RETURN VARCHAR2;
 FUNCTION GET_APPENDIX_PAYERINFO(pAppendixID NUMBER) RETURN VARCHAR2;
 FUNCTION DOPAYER_TOAPPENDIX(pAppendixID   NUMBER,
                             pPayerID      NUMBER,
                             pRelWithPayer NUMBER,
                             pCapacity     NUMBER) RETURN NUMBER;
 FUNCTION DOPAYER_TOAPPENDIX(pAppendixID NUMBER, pPayerID NUMBER, pCompDogovorID NUMBER)
  RETURN NUMBER;
 FUNCTION ISPAC_PAYAPPENDIX(pAppendixID NUMBER) RETURN NUMBER;
 FUNCTION GET_APPENDIXPAYERTYPE(pAppendixID NUMBER) RETURN NUMBER;
 PROCEDURE DELETE_NAZ(pNazID NUMBER);
 FUNCTION GET_PAYER_LINK_SUM(pPayerID NUMBER) RETURN NUMBER;
 FUNCTION GET_PEPL_LINK_SUM(pPeopleID NUMBER) RETURN NUMBER;
 FUNCTION GET_PEPL_DEBT(pPeopleID NUMBER) RETURN NUMBER;
 FUNCTION GET_PEPL_FREE_SUM(pPeopleID NUMBER) RETURN NUMBER;
 PROCEDURE DELETE_USLUG(pUslugID NUMBER);
 PROCEDURE DELETE_USLUG_FROMAPPENDIX(pUslugID NUMBER);
 FUNCTION GET_USL_NOTPAYEDSUM(pUslIDID NUMBER) RETURN NUMBER;
 FUNCTION GET_USLUG_CODE(pUslID NUMBER) RETURN VARCHAR;
 FUNCTION GET_USLUG_NAME(pUslID NUMBER) RETURN VARCHAR;
 FUNCTION GET_BILLUSLLIST(pBillID NUMBER) RETURN VARCHAR2;
 FUNCTION IS_USLSUM_HASBILLS(pUslugID NUMBER) RETURN NUMBER;
 FUNCTION GET_SUM_NOTINBILL(pUslugID NUMBER) RETURN NUMBER;
 FUNCTION IS_ALLUSLUG_DONE(pAppendixID NUMBER) RETURN NUMBER;
 PROCEDURE RETURNMONEY_FORUSLUG(pUslugID NUMBER, pSotr NUMBER, pDate DATE);
 FUNCTION INSERT_PACUSLUG(pPacID          NUMBER,
                          pHealID         NUMBER,
                          pAssumeispolid  NUMBER,
                          pKabID          NUMBER,
                          pInsurDogovorID NUMBER) RETURN NUMBER;
 PROCEDURE DELETE_PACUSLUG(pPacUslID NUMBER, pRemoveDate DATE);
 FUNCTION GET_PEPL_CAPACITY(pPeopleID NUMBER) RETURN NUMBER;
 PROCEDURE UPDATE_PAYER_APPENDIX_CAPACITY(pPayerID NUMBER, pCapacityID NUMBER);
 PROCEDURE UPDATE_APP_USLCOST_NEWCAPACITY(pAppendixID NUMBER, pCapacityID NUMBER);
 FUNCTION GET_PAC_ADRSTRING(pPeopleID NUMBER, pPacID NUMBER) RETURN VARCHAR2;
 FUNCTION IS_PLATUSL_HEAL(pHealID NUMBER) RETURN NUMBER;
 FUNCTION IS_SMID_HEAL(pSmidID NUMBER) RETURN NUMBER;
 PROCEDURE DO_NAZ_TO_INSURDOCS(pNazID NUMBER, pInsurDocsID NUMBER);
 PROCEDURE DO_DELETE_NAZ_TO_INSURDOCS(pNazID NUMBER);
 FUNCTION IS_PROGRAMM_INSURANCE(pInsurDocsID NUMBER) RETURN NUMBER;
 FUNCTION GET_INSUR_DOGOVOR(pInsurDocsID NUMBER) RETURN NUMBER;

 ------------ Исполнитель ------------------------------------------------------
 FUNCTION IS_RIGHT_ISPOL(pFK_SOTRID IN NUMBER, PFK_ID IN NUMBER, pOPERATION IN NUMBER)
  RETURN NUMBER;
 FUNCTION DO_SET_SOGL_PODPIS(pFK_SOTRID IN NUMBER, PFK_ID IN NUMBER) RETURN NUMBER;
 FUNCTION DO_SET_OTKAZ(pFK_SOTRID IN NUMBER, PFK_ID IN NUMBER) RETURN NUMBER;
 FUNCTION DO_SET_ACT(pFK_SOTRID IN NUMBER, PFK_ID IN NUMBER) RETURN NUMBER;
 FUNCTION DO_SET_OSMOTR(pFK_SOTRID IN NUMBER, PFK_ID IN NUMBER) RETURN NUMBER;
 FUNCTION GET_PRINTDOC(pFK_ID IN NUMBER) RETURN VARCHAR;
 FUNCTION GET_PACKONSULT(pFK_PACID   IN NUMBER,
                         pFK_ORGID   IN NUMBER,
                         pFD_BEGIN   IN DATE,
                         pFD_END     IN DATE,
                         pFK_ISPOLID IN NUMBER) RETURN VARCHAR;
 FUNCTION GET_PACKONSULTDATE(pFK_PACID   IN NUMBER,
                             pFD_BEGIN   IN DATE,
                             pFD_END     IN DATE,
                             pFK_ISPOLID IN NUMBER) RETURN VARCHAR;
 FUNCTION GET_PACPOLIS(pFK_PACID   IN NUMBER,
                       pFK_ORGID   IN NUMBER,
                       pFD_BEGIN   IN DATE,
                       pFD_END     IN DATE,
                       pFK_ISPOLID IN NUMBER) RETURN VARCHAR;
 FUNCTION GET_COUNT_OPL_NAZ(pAppendixID NUMBER) RETURN NUMBER;
 
 PROCEDURE UPDATE_FOR_PLAT_DOGOVOR(pDogovorID IN NUMBER,
                               pBeginDate IN DATE,
                               pSOS IN NUMBER,  
                               pKKM IN VARCHAR2,
                               pCHECK IN VARCHAR2,
                               pKO IN VARCHAR2,
                               pSMIDID IN NUMBER,
                               pTYPEPAY IN NUMBER);
 FUNCTION GET_PLATDOG_NUM(pNazID NUMBER) RETURN VARCHAR2;
 FUNCTION IS_NAZ_PAYED(pNazID NUMBER) RETURN NUMBER;
 FUNCTION IS_NAZ_IN_PLATAPP(pNazID NUMBER) RETURN NUMBER;
END; -- Package spec
/

SHOW ERRORS;


