DROP PACKAGE BODY ASU.PKG_PLATUSLUG
/

--
-- PKG_PLATUSLUG  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_PLATUSLUG" IS
 ------------------------------------------------------------------------------------------
 FUNCTION GET_COMPANY_NAME(pCompanyID IN TCOMPANY.FK_ID%TYPE) RETURN TCOMPANY.FC_SHORT%TYPE
 -- Created 20080512 by Linnikov
  IS
  vName TCOMPANY.FC_SHORT%TYPE;
 BEGIN
  --commented by A.Nakorjakov 220608 - на Югорске компания хранится в buh.ts_org SELECT MAX(TCOMPANY.FC_SHORT) INTO vName FROM TCOMPANY WHERE FK_ID = pCompanyID;
  SELECT MAX(TS_ORG.FC_NAME) INTO vName FROM BUH.TS_ORG WHERE FK_ID = pCompanyID; --added by A.Nakorjakov 220608
  RETURN vName;
 END;
 ------------------------------------------------------------------------------------------
 FUNCTION GET_TALON_PACFIO(pTalonID   IN TAMBTALON.FK_ID%TYPE,
                           pDogovorID IN TAPPENDIX.FK_DOGOVOR%TYPE DEFAULT 0) RETURN VARCHAR2
 -- Created 20080513 by Linnikov
  -- Updated 20080819 by Linnikov (добавил второй параметр и GET_DOGOVOR_PACFIO для совместимости Югорска и МИДа)
  -- ФИО пациента, указанного в амбулаторном талоне
  IS
  vpacFIO VARCHAR2(100);
 BEGIN
  IF pDogovorID = 0 THEN --added by A.Nakorjakov 230808
    SELECT PKG_REGIST_PACFUNC.GET_PAC_FIO(T.FK_AMBID)
      INTO vpacFIO
      FROM TAMBTALON T
     WHERE FK_ID = pTalonID;
    IF vpacFIO IS NULL THEN
     RETURN GET_DOGOVOR_PACFIO(pDogovorID);
    ELSE
     RETURN(vpacFIO);
    END IF;
  ELSE --added by A.Nakorjakov 230808
     RETURN GET_DOGOVOR_PACFIO(pDogovorID);  --added by A.Nakorjakov 230808
  END IF;--added by A.Nakorjakov 230808
 END;
 ------------------------------------------------------------------------------------------
 FUNCTION GET_DOGOVOR_PACFIO(pDogovorID IN TPLAT_DOGOVOR.FK_ID%TYPE) RETURN VARCHAR2
 -- Created 20080513 by Nakorjakov
  -- ФИО пациента по договору
  IS
  vpacFIO VARCHAR2(100);
 BEGIN
  SELECT PKG_REGIST_PACFUNC.GET_PAC_FIO(T.FK_PACID)
    INTO vpacFIO
    FROM ASU.TPLAT_DOGOVOR T
   WHERE FK_ID = pDogovorID;
  RETURN(vpacFIO);
 END;
 ------------------------------------------------------------------------------------------
 FUNCTION GET_PAYER_NAME(pPayerID IN TPAYER.FK_ID%TYPE) RETURN VARCHAR2
 -- Created 20080512 by Linnikov
  -- Плательщик (ФИО or компания)
  IS
  vResult VARCHAR2(200);
 BEGIN
  FOR C IN (SELECT FK_PEOPLEID, FK_COMPANYID FROM TPAYER WHERE FK_ID = pPayerID) LOOP
   IF C.FK_PEOPLEID IS NULL THEN
    vResult := GET_COMPANY_NAME(C.FK_COMPANYID);
   ELSE
    vResult := PKG_REGIST_PEPLFUNC.GET_PEPL_FIO(C.FK_PEOPLEID);
   END IF;
  END LOOP;
  RETURN vResult;
 END;
 ------------------------------------------------------------------------------------------
 FUNCTION GET_PAYER_FULLNAME(pPayerID IN TPAYER.FK_ID%TYPE) RETURN VARCHAR2
 -- Created 20080516 by Spasskiy
  -- Плательщик (ФИО or компания)
  IS
  vResult VARCHAR2(200);
 BEGIN
  FOR C IN (SELECT FK_PEOPLEID, FK_COMPANYID FROM TPAYER WHERE FK_ID = pPayerID) LOOP
   IF C.FK_PEOPLEID IS NULL THEN
    vResult := GET_COMPANY_NAME(C.FK_COMPANYID);
   ELSE
    vResult := PKG_REGIST_PEPLFUNC.GET_PEPL_FULLFIO(C.FK_PEOPLEID);
   END IF;
  END LOOP;
  RETURN vResult;
 END;
 ------------------------------------------------------------------------------------------
 FUNCTION GET_PAYER_ADDRESS(pPayerID IN TPAYER.FK_ID%TYPE) RETURN VARCHAR2
 -- Created 20080513 by Linnikov
  -- Updated 20080616 by Linnikov
  -- Адрес плательщика (человека or компании)
  IS
  vAddr VARCHAR2(200);
 BEGIN
  FOR C IN (SELECT FK_PEOPLEID, FK_COMPANYID FROM TPAYER WHERE FK_ID = pPayerID) LOOP
   IF C.FK_PEOPLEID IS NULL THEN
    SELECT TS_ORG.FC_ADR INTO vAddr FROM BUH.TS_ORG WHERE FK_ID = C.FK_COMPANYID;
   ELSE
    SELECT NVL(MAX(FC_ADR), PKG_REGIST_PEPLFUNC.GET_PEPL_ADRSHORT(C.FK_PEOPLEID))
      INTO vAddr
      FROM TADRESS
     WHERE FK_PACID = C.FK_PEOPLEID;
    --    RETURN PKG_REGIST_PEPLFUNC.GET_PEPL_ADRSHORT(C.FK_PEOPLEID);
   END IF;
  END LOOP;
  RETURN vAddr;
 END;
 ------------------------------------------------------------------------------------------
 FUNCTION GET_PAYER_DOC(pPayerID IN TPAYER.FK_ID%TYPE) RETURN VARCHAR2
 -- Created 20080512 by Linnikov
  -- Документ, удостоверяющий личность плательщика
  IS
  vResult VARCHAR2(50);
 BEGIN
  FOR C IN (SELECT FK_PEOPLEID, FK_COMPANYID FROM TPAYER WHERE FK_ID = pPayerID) LOOP
   IF C.FK_PEOPLEID IS NULL THEN
    vResult := ' ';
   ELSE
    SELECT TRIM(D.FC_NAME || ' ' || P.FC_DOCSER || ' ' || P.FC_DOCNUM)
      INTO vResult
      FROM TPEOPLES P, TVIDDOC D
     WHERE P.FK_DOCVID = D.FK_ID(+)
       AND P.FK_ID = C.FK_PEOPLEID;
   END IF;
  END LOOP;
  RETURN NVL(vResult, 'документ не указан');
 END;
 ------------------------------------------------------------------------------------------
 FUNCTION GET_PAYER_DEBT(pPayerID IN TPAYER.FK_ID%TYPE) RETURN NUMBER
 -- Created 20080514 by Linnikov
  -- Сумма долга плательщика (сумма всех выполненных, но неоплаченных услуг)
  IS
  vDebt NUMBER;
 BEGIN
  SELECT NVL(SUM(ROUND(PU.FN_COST / PU.FN_COUNT, 2)), 0)
    INTO vDebt
    FROM TBILL           B,
         TBILL_USLUG     BU,
         TPLAT_USLUG     PU,
         TVRACHNAZMARK   V,
         TAPPENDIX       A,
         TAPPENDIX_PAYER AP
   WHERE B.FK_ID = BU.FK_BILL
     AND BU.FK_PLAT_USLUG = PU.FK_ID
     AND PU.FK_NAZ = V.FK_NAZID
     AND V.FK_SOS = GET_VYPNAZSOSID
     AND B.FP_PAY = 0
     AND A.FK_ID = B.FK_APPENDIX
     AND AP.FK_APPENDIX = A.FK_ID
     AND AP.FK_PAYER = pPayerID;
  RETURN vDebt;
 END;
 ------------------------------------------------------------------------------------------
 FUNCTION GET_BILL_SUM(pBillID IN TBILL_USLUG.FK_BILL%TYPE) RETURN TBILL_USLUG.FN_SUM%TYPE
 -- Created 20080512 by Linnikov
  -- Сумма по всем услугам счета
  IS
  vBillSum TBILL_USLUG.FN_SUM%TYPE;
 BEGIN
  SELECT SUM(FN_SUM) INTO vBillSum FROM TBILL_USLUG WHERE FK_BILL = pBillID;
  RETURN NVL(vBillSum, 0);
 END;
 ------------------------------------------------------------------------------------------
 FUNCTION GET_NDS_SUM_FOR_BILL(pBillID IN TBILL_USLUG.FK_BILL%TYPE) RETURN NUMBER
 -- Created 20080512 by Linnikov
  -- Mod 20080620 by Linnikov
  -- Сумма НДС по счету
  IS
  l_sum_with_nds NUMBER;
  l_nds_percent  NUMBER;
 BEGIN
  SELECT MAX(FC_VALUE)
    INTO l_nds_percent
    FROM TSMINI
   WHERE FC_SECTION = 'CONFIG'
     AND FC_KEY = 'NDS';
  SELECT SUM(PU.FN_COST)
    INTO l_sum_with_nds
    FROM TPLAT_USLUG PU, TBILL_USLUG BU
   WHERE BU.FK_BILL = pBillID
     AND BU.FK_PLAT_USLUG = PU.FK_ID
     AND PU.FL_NDS = 1;
  IF l_sum_with_nds IS NOT NULL THEN
   RETURN l_sum_with_nds * l_nds_percent /(100 + l_nds_percent);
  ELSE
   RETURN 0;
  END IF;
 END;
 ------------------------------------------------------------------------------------------
 FUNCTION GET_NDS_SUM(pSum IN NUMBER) RETURN NUMBER
 -- Created 20080522 by Linnikov
  -- Mod 20080620 by Linnikov
  -- Сумма НДС для переданной суммы (передается чистая сумма услуги)
  IS
  --  vNDSSum NUMBER;
  l_nds_percent NUMBER;
 BEGIN
  SELECT MAX(FC_VALUE)
    INTO l_nds_percent
    FROM TSMINI
   WHERE FC_SECTION = 'CONFIG'
     AND FC_KEY = 'NDS';
  IF l_nds_percent IS NOT NULL THEN
   RETURN pSum * l_nds_percent / 100;
  ELSE
   RETURN 0;
  END IF;
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION GET_NDS_SUM_FROMSUMWITHNDS(pSum IN NUMBER) RETURN NUMBER
 -- Created 2006081410 by Nakorjakov
  -- Сумма НДС для переданной суммы (передается стоимость услуги с НДС)
  IS
  --  vNDSSum NUMBER;
  l_nds_percent NUMBER;
 BEGIN
  SELECT MAX(FC_VALUE)
    INTO l_nds_percent
    FROM TSMINI
   WHERE FC_SECTION = 'CONFIG'
     AND FC_KEY = 'NDS';
  IF l_nds_percent IS NOT NULL THEN
   RETURN pSum * l_nds_percent /(100 + l_nds_percent);
  ELSE
   RETURN 0;
  END IF;
 END;
 ------------------------------------------------------------------------------------------
 FUNCTION GET_FREE_SUM(pPayerID IN TPAYER.FK_ID%TYPE) RETURN TBALANCEMOVE.FN_SUM%TYPE
 -- Created 20080513 by Linnikov
  -- Сумма свободных средств по плательщику
  IS
  vFreeSum TBALANCEMOVE.FN_SUM%TYPE;
 BEGIN
  SELECT SUM(FN_SUM)
    INTO vFreeSum
    FROM (SELECT SUM(-FN_SUM) FN_SUM
            FROM TBALANCEMOVE
           WHERE FK_FROM = pPayerID
          UNION ALL
          SELECT SUM(FN_SUM) FN_SUM FROM TBALANCEMOVE WHERE FK_TO = pPayerID);
  RETURN NVL(vFreeSum, 0);
 END;
 ------------------------------------------------------------------------------------------
 FUNCTION GET_PAYER_PAYED_SUM(pPayerID IN TPAYER.FK_ID%TYPE) RETURN TBALANCEMOVE.FN_SUM%TYPE
 -- Created 20080515 by Linnikov (ЗЕНИТ-ЧЕМПИОН)
  -- Сумма затраченных плательщиком средств (-3 - внешка, -2 - банк, -1 - касса)
  IS
  vOUTSum TBALANCEMOVE.FN_SUM%TYPE;
 BEGIN
  SELECT SUM(FN_SUM)
    INTO vOutSum
    FROM TBALANCEMOVE
   WHERE FK_FROM = pPayerID
     AND FK_TO = -1;
  RETURN NVL(vOutSum, 0);
 END;
 ------------------------------------------------------------------------------------------
 FUNCTION GET_PAYER_MUSTBE_PAYED_SUM(pPayerID IN TPAYER.FK_ID%TYPE)
  RETURN TBILL_USLUG.FN_SUM%TYPE
 -- Created 20080515 by Linnikov (ЗЕНИТ-ЧЕМПИОН)
  -- Сумма по всем еще не оплаченным плательщиком счетам
  IS
  vTotalSum TBALANCEMOVE.FN_SUM%TYPE;
 BEGIN
  SELECT SUM(BU.FN_SUM)
    INTO vTotalSum
    FROM TBILL_USLUG BU, TBILL B, TAPPENDIX A, TAPPENDIX_PAYER P
   WHERE BU.FK_BILL = B.FK_ID
     AND A.FK_ID = B.FK_APPENDIX
     AND P.FK_APPENDIX = A.FK_ID
     AND P.FK_PAYER = pPayerID
     AND B.FP_PAY = 0;
  RETURN NVL(vTotalSum, 0);
 END;
 ------------------------------------------------------------------------------------------
 FUNCTION IS_USL_PAYED(pUslID IN TPLAT_USLUG.FK_ID%TYPE) RETURN NUMBER
 -- Created 20080513 by Linnikov
  -- Услуга оплачена => 1, частично оплачена -1, иначе 0
  IS
  vMustSum NUMBER;
  vIsSum   NUMBER;
 BEGIN
  SELECT MAX(FN_COST) INTO vMustSum FROM TPLAT_USLUG WHERE FK_ID = pUslID;
  --  SELECT SUM(BM.FN_SUM) commented by a.Nakorjakov 260508
  SELECT NVL(SUM(BM.FN_SUM), 0) --added by A.Nakorjakov 260508
    INTO vIsSum
    FROM TBALANCEMOVE BM, TBILL_USLUG BU
   WHERE BU.FK_PLAT_USLUG = pUslID
     AND BU.FK_BILL = BM.FK_BILL
     AND BM.FK_TO = -1; --Касса

  IF vIsSum = 0 THEN
   RETURN 0;
  ELSIF vIsSum < vMustSum THEN
   RETURN - 1;
  ELSE
   RETURN 1;
  END IF;
 END;
 ------------------------------------------------------------------------------------------
 FUNCTION MOVE_MONEY(pFrom      IN TBALANCEMOVE.FK_FROM%TYPE, -- TO_FUNCTION
                     pTo        IN TBALANCEMOVE.FK_TO%TYPE,
                     pBill      IN TBALANCEMOVE.FK_BILL%TYPE,
                     pSum       IN TBALANCEMOVE.FN_SUM%TYPE,
                     pSotr      IN TBALANCEMOVE.FK_SOTR%TYPE,
                     pDateClaim IN TBALANCEMOVE.FD_CLAIM%TYPE DEFAULT NULL)
  RETURN TBALANCEMOVE.FK_ID%TYPE
 -- Created 20080513 by Linnikov
  -- Перемещение денег
  IS
  vRes TBALANCEMOVE.FK_ID%TYPE;
 BEGIN
  INSERT INTO TBALANCEMOVE
   (FK_FROM, FK_TO, FK_BILL, FN_SUM, FD_DATE, FD_CLAIM, FK_SOTR)
  VALUES
   (pFrom, pTo, pBill, pSum, SYSDATE, pDateClaim, pSotr)
  RETURNING FK_ID INTO vRes;
  RETURN vRes;
 END;
 ------------------------------------------------------------------------------------------
 PROCEDURE PAY_BILL(pBill IN TBILL.FK_ID%TYPE, pSotr IN TBILL.FK_SOTRPAY%TYPE)
 -- Created 20080513 by Linnikov
  -- Оплата счета
  IS
  sTmp VARCHAR2(10);
 BEGIN
  sTmp := GET_NEXT_PKO;
  UPDATE TBILL
     SET FK_SOTRPAY = pSotr, FP_PAY = 1, FD_PAY = SYSDATE, FC_PKO = sTmp
   WHERE FK_ID = pBill;
 END;
 ------------------------------------------------------------------------------------------
 FUNCTION GET_NEXT_PKO RETURN VARCHAR2
 -- Created 20080523 by Linnikov
  -- Номер следующего приходника
  IS
  vRes VARCHAR2(10);
 BEGIN
  SELECT NVL(MAX(FC_PKO), '0') + 1 INTO vRes FROM TBILL;
  RETURN vRes;
 END;
 ------------------------------------------------------------------------------------------
 FUNCTION CREATE_PLAT_DOGOVOR(pPacID      NUMBER,
                              pSotrCreate NUMBER,
                              pOpekun     NUMBER DEFAULT NULL) RETURN NUMBER IS
  --created by A.Nakorjakov 13052008
 BEGIN
  RETURN CREATE_PLAT_DOGOVOR(pPacID, SYSDATE, add_months(SYSDATE, 12), pSotrCreate, pOpekun);
 END;
 ------------------------------------------------------------------------------------------
 /*FUNCTION CREATE_PLAT_DOGOVOR(pPacID      NUMBER,
                              pBegin      DATE,
                              pEnd        DATE,
                              pSotrCreate NUMBER,
                              pOpekun     NUMBER DEFAULT NULL) RETURN NUMBER IS
  --created by A.Nakorjakov 13052008
  v_dogovorid NUMBER;
 BEGIN
  INSERT INTO ASU.TPLAT_DOGOVOR
   (FK_PACID, FD_BEGIN, FD_END, FD_PROLONG, FP_SOS, FK_SOTRCREATE, FK_OPEKUN)
  VALUES
   (pPacID, pBegin, pEnd, pEnd, 0, pSotrCreate, pOpekun)
  RETURNING FK_ID INTO v_dogovorid;
  RETURN v_dogovorid;
 END;*/

 FUNCTION CREATE_PLAT_DOGOVOR(pPacID      NUMBER,
                              pBegin      DATE,
                              pEnd        DATE,
                              pSotrCreate NUMBER,
                              pOpekun     NUMBER DEFAULT NULL,
                              pSos        NUMBER DEFAULT 0) RETURN NUMBER IS
  --created by A.Nakorjakov 13052008
  v_dogovorid NUMBER;
 BEGIN
  INSERT INTO ASU.TPLAT_DOGOVOR
   (FK_PACID, FD_BEGIN, FD_END, FD_PROLONG, FP_SOS, FK_SOTRCREATE, FK_OPEKUN)
  VALUES
   (pPacID, pBegin, pEnd, pEnd, pSos, pSotrCreate, pOpekun)
  RETURNING FK_ID INTO v_dogovorid;
  RETURN v_dogovorid;
 END;
 ------------------------------------------------------------------------------------------
 PROCEDURE UPDATE_PLAT_DOGOVOR(pDogovorID NUMBER, pOpekun NUMBER) IS
  --created by A.Nakorjakov 22052008
 BEGIN
  UPDATE ASU.TPLAT_DOGOVOR SET FK_OPEKUN = pOpekun WHERE FK_ID = pDogovorID;
 END;

 ------------------------------------------------------------------------------------------
 PROCEDURE PROLONG_DOGOVOR(pDogovorID NUMBER) IS
  --created by A.Nakorjakov 13052008
  v_end     DATE;
  v_prolong DATE;
  v_begin   DATE;
 BEGIN
  SELECT FD_BEGIN, FD_END, FD_PROLONG
    INTO v_begin, v_end, v_prolong
    FROM ASU.TPLAT_DOGOVOR
   WHERE FK_ID = pDogovorID;
  IF (v_prolong IS NULL) THEN
   v_prolong := v_end;
  END IF;
  UPDATE ASU.TPLAT_DOGOVOR
     SET FD_PROLONG = (v_prolong + (v_end - v_begin))
   WHERE FK_ID = pDogovorID;
 END;

 ------------------------------------------------------------------------------------------
 PROCEDURE CLOSE_DOGOVOR(pDogovorID NUMBER, pSotrClose NUMBER) IS --created by A.Nakorjakov 13052008
 BEGIN
  UPDATE ASU.TPLAT_DOGOVOR
     SET FP_SOS = 1, FK_SOTRCLOSE = pSotrClose
   WHERE FK_ID = pDogovorID;
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION CREATE_APPENDIX(pDogovorID  NUMBER,
                          pOpen       DATE,
                          pSotrCreate NUMBER,
                          pAppNum     VARCHAR2) RETURN NUMBER IS
  --created by A.Nakorjakov 13052008
  --v_talonid        NUMBER; A.Nakorjakov 17.08.08
  v_pacid          NUMBER;
  v_sotrcreate_otd NUMBER;
  v_appenixid      NUMBER;
  v_defpaytypeid   NUMBER;
  v_defdate        DATE;
 BEGIN
  v_defdate := TRUNC(pOpen) + 30;
  SELECT MAX(FK_ID)
    INTO v_defpaytypeid
    FROM ASU.TSMID
   WHERE FC_SYNONIM = 'APPENDIX_PAY_TYPE_PREDOPL';
  SELECT FK_PACID INTO v_pacid FROM ASU.TPLAT_DOGOVOR WHERE FK_ID = pDogovorID;
  SELECT FK_OTDELID INTO v_sotrcreate_otd FROM TSOTR WHERE FK_ID = pSotrCreate;
  /*commented by A.Nakorjakov 17.08.08
  asu.pkg_ambtalon.add_talon(v_pacid,
                             pOpen,
                             v_sotrcreate_otd,
                             pSotrCreate,
                             -1,
                             -1,
                             -1,
                             -1,
                             v_talonid);*/
  INSERT INTO ASU.TAPPENDIX
   (FK_DOGOVOR, /*FK_AMBTALON, A.Nakorjakov 17.08.08*/
    FD_OPEN,
    FP_SOS,
    FK_SOTRCREATE,
    FC_APPNUM,
    FD_ASSUMECLOSE,
    FD_PAYASSUME,
    FK_PAYTYPE)
  VALUES
   (pDogovorID, /*v_talonid, A.Nakorjakov 17.08.08*/
    pOpen,
    0,
    pSotrCreate,
    pAppNum,
    v_defdate,
    v_defdate,
    v_defpaytypeid)
  RETURNING FK_ID INTO v_appenixid;
  RETURN v_appenixid;
 END;

 ------------------------------------------------------------------------------------------
 PROCEDURE TERMINATE_APPENDIX(pAppendixID    NUMBER,
                              pTerminateDate DATE,
                              pResClobID     NUMBER,
                              pZayavDate     DATE,
                              pSotrTerminate NUMBER,
                              pCloseReason   NUMBER) IS --created by A.Nakorjakov 13052008
  --расторжение приложения
 BEGIN
  INSERT INTO ASU.TAPPENDIX_TERMINATE
   (FK_APPENDIX, FD_TERMINATE, FK_RESCLOBID, FD_ZAYAVDATE, FK_SOTRTERMINATE, FK_CLOSEREASON)
  VALUES
   (pAppendixID, pTerminateDate, pResClobID, pZayavDate, pSotrTerminate, pCloseReason);

  UPDATE ASU.TAPPENDIX
     SET FP_SOS = 2 --2 - расторгнут
   WHERE FK_ID = pAppendixID;
 END;

 ------------------------------------------------------------------------------------------
 PROCEDURE APPENDIX_DONE(pAppendixID    NUMBER,
                         pTerminateDate DATE,
                         pResClobID     NUMBER,
                         pSotrTerminate NUMBER) IS --created by A.Nakorjakov 13052008
  --приложение закрывается по причине выполнения всех услуг
 BEGIN
  INSERT INTO ASU.TAPPENDIX_TERMINATE
   (FK_APPENDIX, FD_TERMINATE, FK_RESCLOBID, FD_ZAYAVDATE, FK_SOTRTERMINATE)
  VALUES
   (pAppendixID, pTerminateDate, pResClobID, NULL, pSotrTerminate);

  UPDATE ASU.TAPPENDIX
     SET FP_SOS = 1 --1 - все услуги выполнены
   WHERE FK_ID = pAppendixID;
 END;

 ------------------------------------------------------------------------------------------
 PROCEDURE UPDATE_APPENDIX(pAppendixID  NUMBER,
                           pSos         NUMBER,
                           pPayAssume   DATE,
                           pPayType     NUMBER,
                           pAssumeClose DATE) IS --created by A.Nakorjakov 22052008
 BEGIN
  UPDATE ASU.TAPPENDIX
     SET FP_SOS         = pSos,
         FD_PAYASSUME   = pPayAssume,
         FK_PAYTYPE     = pPayType,
         FD_ASSUMECLOSE = pAssumeClose
   WHERE FK_ID = pAppendixID;
 END;

 ------------------------------------------------------------------------------------------
 PROCEDURE DO_PACSUBSCRIBE_APPENDIX(pAppendixID NUMBER) IS --created by A.Nakorjakov 24052008
 BEGIN
  UPDATE ASU.TAPPENDIX SET FL_PACSUBSCRIBE = 1 WHERE FK_ID = pAppendixID;
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION CREATE_BILL(pAppendixID NUMBER,
                      pSotrCreate NUMBER,
                      pCreateDate DATE,
                      pNUM        VARCHAR2) RETURN NUMBER IS
  --created by A.Nakorjakov 13052008
  --создание счета
  v_billid NUMBER;
 BEGIN
  INSERT INTO TBILL
   (FK_APPENDIX, FK_SOTRCREATE, FD_CREATE, FP_PAY, FC_NUM)
  VALUES
   (pAppendixID, pSotrCreate, pCreateDate, 0, pNUM)
  RETURNING FK_ID INTO v_billid;
  RETURN v_billid;
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION ADD_USLUG_TOBILL(pBillID      NUMBER,
                           pPlatUslugID NUMBER,
                           pSum         NUMBER,
                           pUslugCount  NUMBER) RETURN NUMBER IS
  --created by A.Nakorjakov 13052008
  --добавление услуг в счет
  v_bill_uslug NUMBER;
 BEGIN
  INSERT INTO TBILL_USLUG
   (FK_BILL, FK_PLAT_USLUG, FN_SUM, FN_USLUGCOUNT)
  VALUES
   (pBillID, pPlatUslugID, pSum, pUslugCount)
  RETURNING FK_ID INTO v_bill_uslug;
  RETURN v_bill_uslug;
 END;

 ------------------------------------------------------------------------------------------
 PROCEDURE UPDATE_USLUG_INBILL(pBillID      NUMBER,
                               pPlatUslugID NUMBER,
                               pSum         NUMBER,
                               pUslugCount  NUMBER) IS
  --created by A.Nakorjakov 13052008
  --добавление услуг в счет
 BEGIN
  UPDATE TBILL_USLUG
     SET FN_SUM = pSum, FN_USLUGCOUNT = pUslugCount
   WHERE FK_BILL = pBillID
     AND FK_PLAT_USLUG = pPlatUslugID;
 END;

 ------------------------------------------------------------------------------------------
 PROCEDURE UPDATE_USLUG_INBILL(pBill_UslugID NUMBER, pSum NUMBER, pUslugCount NUMBER) IS
  --created by A.Nakorjakov 13052008
  --добавление услуг в счет

 BEGIN
  UPDATE TBILL_USLUG
     SET FN_SUM = pSum, FN_USLUGCOUNT = pUslugCount
   WHERE FK_ID = pBill_UslugID;
 END;

 ------------------------------------------------------------------------------------------
 PROCEDURE REMOVE_USLUG_FROMBILL(pBillID NUMBER, pPlatUslugID NUMBER) IS --created by A.Nakorjakov 13052008
  --удаление услуг из счета по услуге
 BEGIN
  DELETE FROM TBILL_USLUG
   WHERE FK_BILL = pBillID
     AND FK_PLAT_USLUG = pPlatUslugID;
 END;

 ------------------------------------------------------------------------------------------
 PROCEDURE REMOVE_USLUG_FROMBILL(pBill_UslugID NUMBER, pPlatUslugID NUMBER) IS --created by A.Nakorjakov 13052008
  --удаление услуг из счета
 BEGIN
  DELETE FROM TBILL_USLUG WHERE FK_ID = pBill_UslugID;
 END;

/* ------------------------------------------------------------------------------------------
 FUNCTION GET_USLUG_COST(pHealID     NUMBER,
                         pDate       DATE DEFAULT SYSDATE,
                         pAppendixID NUMBER DEFAULT -1) RETURN NUMBER IS
  --created by A.Nakorjakov 130508
  v_cost NUMBER;
 BEGIN
  v_cost := PKG_USLUGI.GET_HEAL_COST(pHealID, pDate);
  RETURN v_cost;
 END;
*/
 ------------------------------------------------------------------------------------------
 FUNCTION GET_USLUG_COST(pHealID     NUMBER,
                         pNDS        NUMBER,
                         pCapacityID NUMBER,
                         pDate       DATE DEFAULT SYSDATE) RETURN NUMBER IS
  --created by A.Nakorjakov 210508
  --стоимость услуги с учетом НДС, рентабельности
  v_cost            NUMBER;
  v_capacitypercent NUMBER;
 BEGIN
  v_cost := PKG_USLUGI.GET_HEAL_COST(pHealID, pDate);
  IF pNDS = 1 THEN
   v_cost := v_cost + GET_NDS_SUM(v_cost);
  END IF;
  IF pCapacityID > 0 THEN
   SELECT NVL(S.FK_DEFAULT, 0)
     INTO v_capacitypercent
     FROM ASU.TSMID S
    WHERE S.FK_ID = pCapacityID;
   v_cost := v_cost + v_cost * v_capacitypercent / 100;
  END IF;
  RETURN v_cost;
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION GET_USLUG_COST(pHealID     NUMBER,
                         pCompanyID  NUMBER DEFAULT GET_DEF_STRAH_COMP,
                         pDate       DATE DEFAULT SYSDATE) RETURN NUMBER IS
  --created by A.Nakorjakov 190808
  --стоимось услуги в прейскуранте ПУ
  v_cost NUMBER;
  v_cnt NUMBER;
 BEGIN
    SELECT MAX(HC.FN_COST),COUNT(1) into v_cost,v_cnt
    FROM ASU.THEAL_COST HC
    WHERE HC.FK_HEALID = pHealid
          AND pDate BETWEEN HC.FD_DATE1 AND NVL(HC.FD_DATE2, SYSDATE)
          AND HC.FK_COMPANYID = pCompanyID;
    IF v_cnt = 0 then
       v_cost := PKG_USLUGI.GET_HEAL_COST(pHealID, pDate);
    END IF;
    RETURN v_cost;
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION GET_USLUG_COST_DOGOVOR(pHealID     NUMBER,
                         pInsurDogovor Number,
                         pDate       DATE DEFAULT SYSDATE) RETURN NUMBER IS
  --created by A.Nakorjakov 190808
  --стоимось услуги по программе
  v_cost NUMBER;
  v_cnt NUMBER;
 BEGIN
    SELECT MAX(HC.FN_COST),COUNT(1) into v_cost,v_cnt
    FROM ASU.THEAL_COST HC
    WHERE HC.FK_HEALID = pHealid
          AND pDate BETWEEN HC.FD_DATE1 AND NVL(HC.FD_DATE2, SYSDATE)
          AND HC.FK_DOGOVORID = pInsurDogovor;
    IF v_cnt = 0 then
       v_cost := PKG_USLUGI.GET_HEAL_COST(pHealID, pDate);
    END IF;
    RETURN v_cost;
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION GET_USLUG_COST_INSURDOCS(pHealID     NUMBER,
                         pInsurDocsID Number,
                         pDate       DATE DEFAULT SYSDATE) RETURN NUMBER IS
  --created by A.Nakorjakov 190808
  --стоимось услуги по полису
  v_cost NUMBER;
  v_cnt NUMBER;
 BEGIN
    IF pInsurDocsID IS NULL then
       v_cost := PKG_USLUGI.GET_HEAL_COST(pHealID, pDate);
       RETURN v_cost;
    END IF;
    SELECT MAX(HC.FN_COST),COUNT(1) into v_cost,v_cnt
    FROM ASU.THEAL_COST HC, ASU.TINSURDOCS I
    WHERE HC.FK_HEALID = pHealid
          AND pDate BETWEEN HC.FD_DATE1 AND NVL(HC.FD_DATE2, SYSDATE)
          AND HC.FK_DOGOVORID = I.FK_DOGOVORID
          AND I.FK_ID = pInsurDocsID;
    IF v_cnt = 0 then
        SELECT MAX(HC.FN_COST),COUNT(1) into v_cost,v_cnt
        FROM ASU.THEAL_COST HC, ASU.TINSURDOCS I
        WHERE HC.FK_HEALID = pHealid
          AND pDate BETWEEN HC.FD_DATE1 AND NVL(HC.FD_DATE2, SYSDATE)
          AND HC.FK_COMPANYID = I.FK_COMPANYID
          AND I.FK_ID = pInsurDocsID;
        IF v_cnt = 0 then
           v_cost := PKG_USLUGI.GET_HEAL_COST(pHealID, pDate);
        END IF;
    END IF;
    RETURN v_cost;
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION GET_NAZ_INSURDOCSID(pNazID     NUMBER) RETURN NUMBER IS
  --created by A.Nakorjakov 190808
  --возвращает страховой документ, по которому оплачивается назначение
  v_insuranceid NUMBER;
 BEGIN
    SELECT MAX(NI.FK_INSURDOCS) into v_insuranceid
    FROM ASU.TNAZ_INSUR NI
    WHERE NI.FK_NAZID = pNazID;
    RETURN v_insuranceid;
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION CREATE_PLAT_USLUG(pNazID         NUMBER,
                            pCount         NUMBER,
                            pAssumeIspol   NUMBER,
                            pISPredOpl     NUMBER,
                            pRunAssumeDate DATE,
                            pHealID        NUMBER,
                            pCost          NUMBER,
                            pDuration      NUMBER,
                            pNDS           NUMBER,
                            pPayPercent    NUMBER) RETURN NUMBER IS
  --created by A.Nakorjakov 130508
  v_healid       NUMBER;
  v_plat_uslugid NUMBER;
 BEGIN
  /*SELECT MAX(S.FK_HEAL)
   INTO v_healid
   FROM ASU.VNAZ V, ASU.THEAL_SMID S
  WHERE V.FK_ID = pNazID
    AND S.FK_SMID = V.FK_SMID;*/
  v_healid := pHealID;

  INSERT INTO TPLAT_USLUG
   (FK_NAZ,
    FN_COUNT,
    FP_SOS,
    FL_PREDOPL,
    FD_RUNASSUME,
    FN_COST,
    FK_HEAL,
    FK_ASSUMEISPOL,
    FN_DURATION,
    FL_NDS,
    FN_PAYPERCENT)
  VALUES
   (pNazID,
    pCount,
    asu.get_nevip,
    pISPredOpl,
    pRunAssumeDate,
    --GET_USLUG_COST(v_healid, pRunAssumeDate),
    pCost,
    v_healid,
    pAssumeIspol,
    pDuration,
    pNDS,
    pPayPercent)
  RETURNING FK_ID INTO v_plat_uslugid;

  RETURN v_plat_uslugid;
 END;

 ------------------------------------------------------------------------------------------
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
                             pPayPercent    NUMBER) IS
  --created by A.Nakorjakov 210508
 BEGIN
  UPDATE TPLAT_USLUG
     SET FK_NAZ         = pNazID,
         FN_COUNT       = pCount,
         FL_PREDOPL     = pISPredOpl,
         FD_RUNASSUME   = pRunAssumeDate,
         FN_COST        = pCost,
         FK_HEAL        = pHealID,
         FK_ASSUMEISPOL = pAssumeIspol,
         FN_DURATION    = pDuration,
         FL_NDS         = pNDS,
         FN_PAYPERCENT  = pPayPercent
   WHERE FK_ID = pUslugID;
 END;

 ------------------------------------------------------------------------------------------
 PROCEDURE UPDATE_PLAT_USLUG(pUslugID       NUMBER,
                             pNazID         NUMBER,
                             pAssumeIspol   NUMBER,
                             pRunAssumeDate DATE,
                             pDuration      NUMBER) IS
  --created by A.Nakorjakov 220508
 BEGIN
  UPDATE TPLAT_USLUG
     SET FK_NAZ         = pNazID,
         FD_RUNASSUME   = pRunAssumeDate,
         FK_ASSUMEISPOL = pAssumeIspol,
         FN_DURATION    = pDuration
   WHERE FK_ID = pUslugID;
 END;

 ------------------------------------------------------------------------------------------
 PROCEDURE ANNUL_BILL(pBillID NUMBER, pAnnulDate DATE, pAnnulSotr NUMBER) IS --created by A.Nakorjakov 130508
  --аннулирование счета
 BEGIN
  UPDATE ASU.TBILL
     SET FD_ANNUL = pAnnulDate, FK_SOTRANNUL = pAnnulSotr
   WHERE FK_ID = pBillID;
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION IS_BILLANNUL(pBillID NUMBER) RETURN NUMBER IS
  --created by A.Nakorjakov 130508
  --счет аннулирован?
  v_annuldate DATE;
  v_res       NUMBER;
 BEGIN
  SELECT FD_ANNUL INTO v_annuldate FROM ASU.TBILL WHERE FK_ID = pBillID;
  IF (v_annuldate IS NULL) THEN
   v_res := 0;
  ELSE
   v_res := 1;
  END IF;
  RETURN v_res;
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION GET_NEWDOCNUM RETURN NUMBER IS
  --created by A.Nakorjakov 130508
  --возвращает номер след. нового договора
  v_newdocnum NUMBER;
 BEGIN
  --SELECT NVL(MAX(TO_NUMBER(FC_NUM)), 0) INTO v_newdocnum FROM ASU.TPLAT_DOGOVOR;
  --RETURN(v_newdocnum + 1);
  SELECT SEQ_DOCNUM.NEXTVAL INTO v_newdocnum FROM DUAL;
  RETURN(v_newdocnum);
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION GET_NEWAPPENDIXNUM RETURN NUMBER IS
  --created by A.Nakorjakov 190508
  --возвращает номер след. нового приложения
  v_newappendixnum NUMBER;
 BEGIN
  --SELECT NVL(MAX(TO_NUMBER(FC_APPNUM)), 0) INTO v_newappendixnum FROM ASU.TAPPENDIX;
  --RETURN(v_newappendixnum + 1);
  SELECT ASU.SEQ_APPENDIXNUM.NEXTVAL INTO v_newappendixnum FROM DUAL;
  RETURN(v_newappendixnum);
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION GET_NEWBILLNUM RETURN NUMBER IS
  --created by A.Nakorjakov 260508
  --возвращает номер след. нового счета
  v_newbillnum NUMBER;
 BEGIN
  --SELECT NVL(MAX(TO_NUMBER(FC_NUM)), 0) INTO v_newbillnum FROM ASU.TBILL;
  --RETURN(v_newbillnum + 1);
  SELECT ASU.SEQ_BILLNUM.NEXTVAL INTO v_newbillnum FROM DUAL;
  RETURN(v_newbillnum);
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION GET_NEWOREXISTSPAYER_PEPL(pPeplID NUMBER, pCapacity NUMBER) RETURN NUMBER IS
  --created by A.Nakorjakov 190508
  --если чел уже числится как плательщик - возвращает ИД чела как плательщика, иначе добавлет
  -- чела как плательщика и возвращает ИД созданного плательщика
  v_payerid  NUMBER;
  v_cnt      NUMBER;
  v_capacity NUMBER;
 BEGIN
  SELECT COUNT(1), MAX(P.FK_ID), NVL(MAX(P.FK_CAPACITY), -1)
    INTO v_cnt, v_payerid, v_capacity
    FROM ASU.TPAYER P
   WHERE P.FK_PEOPLEID = pPeplID;
  IF v_cnt = 0 THEN
   v_payerid := CREATE_PAYER_PHIS(pPeplID, pCapacity);
  ELSE
   IF v_capacity <> pCapacity THEN
    UPDATE ASU.TPAYER P SET P.FK_CAPACITY = pCapacity WHERE P.FK_PEOPLEID = pPeplID;
   END IF;
  END IF;
  RETURN v_payerid;
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION CREATE_PAYER_PHIS(pPeplID NUMBER, pCapacity NUMBER) RETURN NUMBER IS
  --created by A.Nakorjakov 190508
  -- создание плательщика - физ. лицо
  v_payerid NUMBER;
 BEGIN
  INSERT INTO ASU.TPAYER
   (FK_PEOPLEID, FK_CAPACITY)
  VALUES
   (pPeplID, pCapacity)
  RETURNING FK_ID INTO v_payerid;
  RETURN v_payerid;
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION GET_NEWOREXISTSPAYER_COMP(pCompID NUMBER) RETURN NUMBER IS
  --created by A.Nakorjakov 220608
  --если компания уже числится как плательщик - возвращает ИД компании как плательщика, иначе добавлет
  -- компанию как плательщика и возвращает ИД созданного плательщика
  v_payerid NUMBER;
  v_cnt     NUMBER;
 BEGIN
  SELECT COUNT(1), MAX(P.FK_ID)
    INTO v_cnt, v_payerid
    FROM ASU.TPAYER P
   WHERE P.FK_COMPANYID = pCompID;
  IF v_cnt = 0 THEN
   v_payerid := CREATE_PAYER_COMP(pCompID);
  END IF;
  RETURN v_payerid;
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION CREATE_PAYER_COMP(pCompID NUMBER) RETURN NUMBER IS
  --created by A.Nakorjakov 220608
  -- создание плательщика - юр. лицо
  v_payerid NUMBER;
 BEGIN
  INSERT INTO ASU.TPAYER (FK_COMPANYID) VALUES (pCompID) RETURNING FK_ID INTO v_payerid;
  RETURN v_payerid;
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION GET_APPENDIX_SOST(pAppendixID NUMBER) RETURN VARCHAR IS
  --created by A.Nakorjakov 190508
  -- состояние приложения в сроковом виде
  v_appendix_sost VARCHAR(50);
  v_sos           NUMBER;
  v_pacsubscribe  NUMBER;
 BEGIN
  SELECT FP_SOS, FL_PACSUBSCRIBE
    INTO v_sos, v_pacsubscribe
    FROM ASU.TAPPENDIX
   WHERE FK_ID = pAppendixID;
  IF (v_sos = 0) THEN
   IF (v_pacsubscribe = 0) THEN
    v_appendix_sost := 'Действующий. Не подписан пациентом';
   ELSE
    v_appendix_sost := 'Действующий. Подписан пациентом';
   END IF;
  ELSIF (v_sos = 1) THEN
   v_appendix_sost := 'Закрыт по факту выполнения всех услуг';
  ELSIF (v_sos = 2) THEN
   v_appendix_sost := 'Расторгнут';
  END IF;
  RETURN v_appendix_sost;
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION GET_APPENDIX_COST(pAppendixID NUMBER) RETURN NUMBER IS
  --created by A.Nakorjakov 190508
  --стоимость всех услуг в приложении
  v_cost NUMBER;
 BEGIN
  /*
     by A.Nakorjakov 170808
     SELECT NVL(SUM(NVL(FN_COST * FN_COUNT, 0)), 0) PSUM
      INTO v_cost
      FROM ASU.TAPPENDIX AP, ASU.TAMBTALON_NAZ AN, ASU.TPLAT_USLUG U
     WHERE AP.FK_ID = pAppendixID
       AND AP.FK_AMBTALON = AN.FK_TALONID
       AND AN.FK_NAZID = U.FK_NAZ;
  */

  /*
     by A.Nakorjakov 170808
  */
  SELECT NVL(SUM(NVL(FN_COST * FN_COUNT, 0)), 0) PSUM
    INTO v_cost
    FROM ASU.TAPPENDIX_NAZ AN, ASU.TPLAT_USLUG U
   WHERE AN.FK_APPENDIXID = pAppendixID
     AND AN.FK_NAZID = U.FK_NAZ;
  RETURN v_cost;
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION GET_APPENDIX_PAYED(pAppendixID NUMBER) RETURN NUMBER IS
  --created by A.Nakorjakov 190508
  --сколько денег оплачено по приложению
  v_cost NUMBER;
 BEGIN
  SELECT NVL(SUM(NVL(FN_SUM, 0)), 0) PSUM
    INTO v_cost
    FROM ASU.TBILL B, ASU.TBILL_USLUG BU
   WHERE B.FK_APPENDIX = pAppendixID
     AND B.FK_ID = BU.FK_BILL
     AND B.FP_PAY = 1;
  RETURN v_cost;
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION GET_APPENDIX_NDS(pAppendixID NUMBER) RETURN NUMBER IS
  --created by A.Nakorjakov 200608
  --NDS всех услуг в приложении
  v_sum         NUMBER;
  l_nds_percent NUMBER;
 BEGIN
  SELECT NVL(MAX(FC_VALUE), 0)
    INTO l_nds_percent
    FROM TSMINI
   WHERE FC_SECTION = 'CONFIG'
     AND FC_KEY = 'NDS';

  /*
     by A.Nakorjakov 170808
    SELECT NVL(SUM(NVL(FN_COST * FN_COUNT, 0)), 0) PSUM
      INTO v_sum
      FROM ASU.TAPPENDIX AP, ASU.TAMBTALON_NAZ AN, ASU.TPLAT_USLUG U
     WHERE AP.FK_ID = pAppendixID
       AND AP.FK_AMBTALON = AN.FK_TALONID
       AND AN.FK_NAZID = U.FK_NAZ
       AND U.FL_NDS = 1;
  */
  SELECT NVL(SUM(NVL(FN_COST * FN_COUNT, 0)), 0) PSUM
    INTO v_sum
    FROM ASU.TAPPENDIX_NAZ AN, ASU.TPLAT_USLUG U
   WHERE AN.FK_APPENDIXID = pAppendixID
     AND AN.FK_NAZID = U.FK_NAZ
     AND U.FL_NDS = 1;

  RETURN v_sum * l_nds_percent /(100 + l_nds_percent);
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION GET_APPENDIX_PAYERINFO(pAppendixID NUMBER) RETURN VARCHAR2 IS
  --created by A.Nakorjakov 200508
  --информация о плательщике приложения в строковом виде
  v_info         VARCHAR2(500);
  v_ispacpay_app NUMBER;
 BEGIN
  FOR C IN (SELECT PA.FK_PEOPLEID,
                   PA.FK_COMPANYID,
                   PA.FK_ID,
                   ASU.GET_SMIDNAME(PA.FK_CAPACITY) FC_CAPACITY
              FROM ASU.TAPPENDIX_PAYER AP, ASU.TPAYER PA
             WHERE PA.FK_ID = AP.FK_PAYER
               AND AP.FK_APPENDIX = pAppendixID) LOOP
   IF C.FK_PEOPLEID IS NOT NULL THEN
    v_ispacpay_app := ISPAC_PAYAPPENDIX(pAppendixID);
    IF v_ispacpay_app = 0 THEN
     v_info := GET_PHISPAYER_INFO(C.FK_ID);
    ELSE
     --v_info := 'Сам пациент    Рентабельность - '||lower(C.FC_CAPACITY);
     v_info := 'Сам пациент';
    END IF;
   ELSE
    v_info := GET_COMPANY_NAME(C.FK_COMPANYID);
   END IF;
  END LOOP;
  RETURN v_info;
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION GET_PHISPAYER_INFO(pPayerID NUMBER) RETURN VARCHAR2 IS
  --created by A.Nakorjakov 200508
  --информация о плательщике - физ.лицо в строково виде
  v_fio      VARCHAR2(150);
  v_docname  VARCHAR2(50);
  v_docser   VARCHAR2(30);
  v_docnum   VARCHAR2(30);
  v_docdate  VARCHAR2(30);
  v_info     VARCHAR2(500);
  v_capacity VARCHAR2(50);
 BEGIN
  SELECT P.FC_FAM || ' ' || P.FC_IM || ' ' || P.FC_OTCH FIO,
         D.FC_NAME,
         P.FC_DOCSER,
         P.FC_DOCNUM,
         TO_CHAR(P.FD_DOCDATE, 'DD.MM.YYYY') FD_DOCDATE,
         asu.get_smidname(PA.FK_CAPACITY) FC_CAPACITY
    INTO v_fio, v_docname, v_docser, v_docnum, v_docdate, v_capacity
    FROM ASU.TPEOPLES P, ASU.TVIDDOC D, ASU.TPAYER PA
   WHERE P.FK_DOCVID = D.FK_ID(+)
     AND PA.FK_ID = pPayerID
     AND PA.FK_PEOPLEID = P.FK_ID;
  IF (v_fio IS NOT NULL) THEN
   v_info := v_fio;
  END IF;
  IF (v_docname IS NOT NULL) THEN
   v_info := v_info || ' ' || v_docname;
  END IF;
  IF (v_docser IS NOT NULL) THEN
   v_info := v_info || ' Серия: ' || v_docser;
  END IF;
  IF (v_docnum IS NOT NULL) THEN
   v_info := v_info || ' Номер: ' || v_docnum;
  END IF;
  IF (v_docdate IS NOT NULL) THEN
   v_info := v_info || ' Дата выдачи: ' || v_docdate;
  END IF;
  --  IF (v_capacity IS NOT NULL) THEN
  --   v_info := v_info || ' Рентабельность - ' || lower(v_capacity);
  --  END IF;
  RETURN v_info;
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION DOPAYER_TOAPPENDIX(pAppendixID   NUMBER,
                             pPayerID      NUMBER,
                             pRelWithPayer NUMBER,
                             pCapacity     NUMBER) RETURN NUMBER IS
  --created by A.Nakorjakov 200508
  --если у приложения нет плательщтков - добавить плательщика к приложению
  --если за приложением числиться плательщик - то заменить его на нового
  v_cnt          NUMBER;
  v_payer        NUMBER;
  v_id           NUMBER;
  v_relwithpayer NUMBER;
  v_paymentid    NUMBER;
  v_capacity     NUMBER;
 BEGIN
  SELECT COUNT(1),
         NVL(MAX(AP.FK_PAYER), -1),
         MAX(FK_ID),
         NVL(MAX(FK_RELWITHPAYER), -1),
         MAX(FK_PAYMENTID),
         MAX(FK_CAPACITY)
    INTO v_cnt, v_payer, v_id, v_relwithpayer, v_paymentid, v_capacity
    FROM ASU.TAPPENDIX_PAYER AP
   WHERE AP.FK_APPENDIX = pAppendixID;
  IF v_cnt = 0 THEN
   INSERT INTO ASU.TAPPENDIX_PAYER
    (FK_APPENDIX, FK_PAYER, FK_RELWITHPAYER, FK_CAPACITY)
   VALUES
    (pAppendixID, pPayerID, pRelWithPayer, pCapacity)
   RETURNING FK_ID INTO v_id;
  ELSE
   IF (v_payer <> pPayerID) OR (v_relwithpayer <> pRelWithPayer) OR
      (v_capacity <> pCapacity) OR (v_capacity IS NULL) OR (v_paymentid IS NOT NULL) THEN
    IF v_paymentid IS NOT NULL THEN
     DELETE FROM ASU.TPAYMENT WHERE FK_ID = v_paymentid;
    END IF;
    UPDATE ASU.TAPPENDIX_PAYER
       SET FK_PAYER = pPayerID, FK_RELWITHPAYER = pRelWithPayer, FK_PAYMENTID = NULL
     WHERE FK_APPENDIX = pAppendixID;
    IF (v_capacity <> pCapacity) OR (v_capacity IS NULL) THEN
     UPDATE_APP_USLCOST_NEWCAPACITY(pAppendixID, pCapacity);
     UPDATE ASU.TAPPENDIX_PAYER SET FK_CAPACITY = pCapacity WHERE FK_APPENDIX = pAppendixID;
    END IF;
   END IF;
  END IF;

  RETURN v_id;
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION DOPAYER_TOAPPENDIX(pAppendixID NUMBER, pPayerID NUMBER, pCompDogovorID NUMBER)
  RETURN NUMBER IS
  --created by A.Nakorjakov 220608
  --если у приложения нет плательщтков - добавить плательщика к приложению
  --если за приложением числиться плательщик - то заменить его на нового
  v_cnt            NUMBER;
  v_payer          NUMBER;
  v_id             NUMBER;
  v_paymentid      NUMBER;
  v_peplid         NUMBER;
  v_insuranceid    NUMBER;
  v_curinsuranceid NUMBER;
  v_compdogovorid  NUMBER;
 BEGIN
  SELECT COUNT(1), NVL(MAX(AP.FK_PAYER), -1), MAX(FK_ID), MAX(FK_PAYMENTID)
    INTO v_cnt, v_payer, v_id, v_paymentid
    FROM ASU.TAPPENDIX_PAYER AP
   WHERE AP.FK_APPENDIX = pAppendixID;

  SELECT MAX(ASU.PKG_REGIST_PACFUNC.GET_PEPL_ID(P.FK_PACID))
    INTO v_peplid
    FROM ASU.TAPPENDIX A, ASU.TPLAT_DOGOVOR P
   WHERE P.FK_ID = A.FK_DOGOVOR
     AND A.FK_ID = pAppendixID;

  SELECT MAX(I.FK_ID)
    INTO v_insuranceid
    FROM ASU.TINSURANCE I
   WHERE I.FK_PEPLID = v_peplid
     AND I.FL_OLD = 0;

  IF v_cnt = 0 THEN
   INSERT INTO ASU.TPAYMENT
    (FK_GARANTLETTERS, FK_INSURANCEID)
   VALUES
    (pCompDogovorID, v_insuranceid)
   RETURNING FK_ID INTO v_paymentid;
   INSERT INTO ASU.TAPPENDIX_PAYER
    (FK_APPENDIX, FK_PAYER, FK_PAYMENTID)
   VALUES
    (pAppendixID, pPayerID, v_paymentid)
   RETURNING FK_ID INTO v_id;
  ELSE
   IF v_paymentid IS NOT NULL THEN
    SELECT P.FK_INSURANCEID, P.FK_GARANTLETTERS
      INTO v_curinsuranceid, v_compdogovorid
      FROM ASU.TPAYMENT P
     WHERE P.FK_ID = v_paymentid;
   ELSE
    v_curinsuranceid := v_insuranceid;
    v_compdogovorid  := pCompDogovorID;
   END IF;

   IF (v_payer <> pPayerID) OR (v_paymentid <> pCompDogovorID) OR (v_paymentid IS NULL) OR
      (v_curinsuranceid <> v_insuranceid) OR
      (v_curinsuranceid IS NULL AND v_insuranceid IS NOT NULL) OR
      (v_compdogovorid <> pCompDogovorID) OR
      (v_compdogovorid IS NULL AND pCompDogovorID IS NOT NULL) THEN
    IF v_paymentid IS NULL THEN
     INSERT INTO ASU.TPAYMENT
      (FK_GARANTLETTERS, FK_INSURANCEID)
     VALUES
      (pCompDogovorID, v_insuranceid)
     RETURNING FK_ID INTO v_paymentid;
    ELSE
     UPDATE ASU.TPAYMENT
        SET FK_GARANTLETTERS = pCompDogovorID, FK_INSURANCEID = v_insuranceid
      WHERE FK_ID = v_paymentid;
    END IF;
    UPDATE ASU.TAPPENDIX_PAYER
       SET FK_PAYER        = pPayerID,
           FK_PAYMENTID    = v_paymentid,
           FK_RELWITHPAYER = NULL,
           FK_CAPACITY     = NULL
     WHERE FK_APPENDIX = pAppendixID;
   END IF;
  END IF;
  RETURN v_id;
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION ISPAC_PAYAPPENDIX(pAppendixID NUMBER) RETURN NUMBER IS
  --created by A.Nakorjakov 200508
  --плательщик приложения сам пациент? 1 - да 0 - нет
  v_is          NUMBER;
  v_apppeplid   NUMBER;
  v_payerpeplid NUMBER;
 BEGIN
  SELECT ASU.PKG_REGIST_PACFUNC.GET_PEPL_ID(D.FK_PACID)
    INTO v_apppeplid
    FROM ASU.TAPPENDIX A, ASU.TPLAT_DOGOVOR D
   WHERE A.FK_ID = pAppendixID
     AND A.FK_DOGOVOR = D.FK_ID;

  SELECT PA.FK_PEOPLEID
    INTO v_payerpeplid
    FROM ASU.TAPPENDIX_PAYER AP, ASU.TPAYER PA
   WHERE PA.FK_ID = AP.FK_PAYER
     AND AP.FK_APPENDIX = pAppendixID;

  IF v_apppeplid = v_payerpeplid THEN
   v_is := 1;
  ELSE
   v_is := 0;
  END IF;
  RETURN v_is;
 END;
 ------------------------------------------------------------------------------------------
 FUNCTION GET_APPENDIXPAYERTYPE(pAppendixID NUMBER) RETURN NUMBER IS
  --created by A.Nakorjakov 200508
  v_res NUMBER; --0- сам плательщик  1 - физ.лицо   2 - юр. лицо
 BEGIN
  v_res := 0;
  FOR C IN (SELECT PA.FK_PEOPLEID, PA.FK_COMPANYID
              FROM ASU.TAPPENDIX_PAYER AP, ASU.TPAYER PA
             WHERE PA.FK_ID = AP.FK_PAYER
               AND AP.FK_APPENDIX = pAppendixID) LOOP
   IF C.FK_PEOPLEID IS NOT NULL THEN
    IF ISPAC_PAYAPPENDIX(pAppendixID) = 1 THEN
     v_res := 0;
    ELSE
     v_res := 1;
    END IF;
   ELSE
    v_res := 2;
   END IF;
  END LOOP;
  RETURN v_res;
 END;

 ------------------------------------------------------------------------------------------
 PROCEDURE DELETE_NAZ(pNazID NUMBER) IS --created by A.Nakorjakov 220508
 BEGIN
  DELETE FROM ASU.TPACLST P WHERE P.NAZID = pNazID;
  DELETE FROM ASU.VNAZ WHERE FK_ID = pNazID;
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION GET_PAYER_LINK_SUM(pPayerID NUMBER) RETURN NUMBER IS
  --created by A.Nakorjakov 220508
  --Связанные деньги -  привязанные к невыполненным услугам.
  v_sum NUMBER;
 BEGIN
  SELECT NVL(SUM(BU.FN_SUM), 0)
    INTO v_sum
    FROM TBILL_USLUG BU, TBILL B, TAPPENDIX A, TAPPENDIX_PAYER P, TPLAT_USLUG PU
   WHERE BU.FK_BILL = B.FK_ID
     AND A.FK_ID = B.FK_APPENDIX
     AND P.FK_APPENDIX = A.FK_ID
     AND P.FK_PAYER = pPayerID
     AND B.FP_PAY = 1
     AND PU.FK_ID = BU.FK_PLAT_USLUG
     AND PU.FP_SOS = asu.get_nevip;
  RETURN v_sum;
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION GET_PEPL_LINK_SUM(pPeopleID NUMBER) RETURN NUMBER IS
  --created by A.Nakorjakov 220508
  --Связанные деньги ПИПЛА -  привязанные к невыполненным услугам
  v_sum NUMBER;
 BEGIN
  v_sum := 0;
  FOR C IN (SELECT PA.FK_ID FROM TPAYER PA WHERE PA.FK_PEOPLEID = pPeopleID) LOOP
   v_sum := v_sum + GET_PAYER_LINK_SUM(C.FK_ID);
  END LOOP;
  RETURN v_sum;
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION GET_PEPL_DEBT(pPeopleID NUMBER) RETURN NUMBER
 -- created by A.Nakorjakov 220508
  -- Сумма долга ПИПЛА - (сумма всех выполненных, но неоплаченных услуг)
  IS
  vDebt NUMBER;
 BEGIN
  vDebt := 0;
  FOR C IN (SELECT PA.FK_ID FROM TPAYER PA WHERE PA.FK_PEOPLEID = pPeopleID) LOOP
   vDebt := vDebt + GET_PAYER_DEBT(C.FK_ID);
  END LOOP;
  RETURN vDebt;
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION GET_PEPL_FREE_SUM(pPeopleID NUMBER) RETURN NUMBER
 -- created by A.Nakorjakov 220508
  -- Сумма свободных средств по ПИПЛУ
  IS
  vFreeSum NUMBER;
 BEGIN
  vFreeSum := 0;
  FOR C IN (SELECT PA.FK_ID FROM TPAYER PA WHERE PA.FK_PEOPLEID = pPeopleID) LOOP
   vFreeSum := vFreeSum + GET_FREE_SUM(C.FK_ID);
  END LOOP;
  RETURN vFreeSum;
 END;

 ------------------------------------------------------------------------------------------
 PROCEDURE DELETE_USLUG(pUslugID NUMBER)
 -- created by A.Nakorjakov 230508
  -- Удалить услугу
  IS
 BEGIN
  DELETE FROM ASU.TAPPENDIX_NAZ AP WHERE AP.FK_NAZID IN
    (SELECT PU.FK_NAZ FROM ASU.TPLAT_USLUG PU WHERE PU.FK_ID = pUslugID);
  DELETE FROM ASU.TPLAT_USLUG WHERE FK_ID = pUslugID;
 END;

 ------------------------------------------------------------------------------------------
 PROCEDURE DELETE_USLUG_FROMAPPENDIX(pUslugID NUMBER)
 -- created by A.Nakorjakov 230508
  -- Удалить услугу из списка услуг. При этом услуга добавляется в список услуг пациента
  IS
--  v_assumeispolid NUMBER;
--  v_healid        NUMBER;
--  v_pacid         NUMBER;
--  v_nazid         NUMBER;
--  v_kabid         NUMBER;
 BEGIN
  /*
  SELECT P.FK_HEAL, P.FK_ASSUMEISPOL, V.FK_PACID, V.FK_ID, V.FK_ROOMID
    INTO v_healid, v_assumeispolid, v_pacid, v_nazid, v_kabid
    FROM ASU.TPLAT_USLUG P, ASU.VNAZ V
   WHERE P.FK_ID = pUslugID
     AND V.FK_ID = P.FK_NAZ;

  INSERT INTO ASU.TPACUSLUG
   (FK_PACID, FK_HEAL, FK_ASSUMEISPOL, FK_KABINET)
  VALUES
   (v_pacid, v_healid, v_assumeispolid, v_kabid);
  */
  DELETE_USLUG(pUslugID);
  --commented by A.Nakorjakov 220808 DELETE_NAZ(v_nazid);
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION GET_USL_NOTPAYEDSUM(pUslIDID NUMBER) RETURN NUMBER IS
  --created by A.Nakorjakov 260508
  --сколько осталось заплатить по услуге
  v_payed NUMBER;
  v_topay NUMBER;
 BEGIN
  SELECT NVL(SUM(BU.FN_SUM), 0)
    INTO v_payed
    FROM ASU.TBILL B, ASU.TBILL_USLUG BU
   WHERE B.FK_ID = BU.FK_BILL
     AND BU.FK_PLAT_USLUG = pUslIDID
     AND B.FP_PAY = 1;
  SELECT NVL(FN_COST * FN_COUNT, 0)
    INTO v_topay
    FROM ASU.TPLAT_USLUG PU
   WHERE PU.FK_ID = pUslIDID;
  RETURN v_topay - v_payed;
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION GET_USLUG_CODE(pUslID NUMBER) RETURN VARCHAR IS
  cCode VARCHAR(15);
 BEGIN
  SELECT CODE
    INTO cCode
    FROM THEAL, TPLAT_USLUG
   WHERE TPLAT_USLUG.FK_HEAL = THEAL.FK_ID
     AND TPLAT_USLUG.FK_ID = pUslID;
  RETURN cCode;
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION GET_USLUG_NAME(pUslID NUMBER) RETURN VARCHAR IS
  cCode VARCHAR(255);
 BEGIN
  SELECT FC_NAME
    INTO cCode
    FROM THEAL, TPLAT_USLUG
   WHERE TPLAT_USLUG.FK_HEAL = THEAL.FK_ID
     AND TPLAT_USLUG.FK_ID = pUslID;
  RETURN cCode;
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION GET_BILLUSLLIST(pBillID NUMBER) RETURN VARCHAR2 IS
  --created by A.Nakorjakov 260508
  v_res VARCHAR2(4000);
 BEGIN
  FOR C IN (SELECT TP.FC_NAME
              FROM TBILL_USLUG BU, TPLAT_USLUG PU, ASU.T_TEMP_PRICELIST TP
             WHERE BU.FK_BILL = pBillID
               AND BU.FK_PLAT_USLUG = PU.FK_ID
               AND PU.FK_HEAL = TP.FK_ID) LOOP
   v_Res := v_Res || c.fc_name || '        ';
  END LOOP;
  RETURN v_Res;
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION IS_USLSUM_HASBILLS(pUslugID NUMBER) RETURN NUMBER IS
  --created by A.Nakorjakov 260508
  v_ishasbill NUMBER; --Включена вся стоимость услуги в счета?
  v_topay     NUMBER;
  v_billsum   NUMBER;
 BEGIN
  SELECT NVL(SUM(FN_SUM), 0)
    INTO v_billsum
    FROM TBILL_USLUG BU
   WHERE BU.FK_PLAT_USLUG = pUslugID
     AND ASU.PKG_PLATUSLUG.IS_BILLANNUL(BU.FK_BILL) = 0;

  SELECT NVL(FN_COST * FN_COUNT, 0)
    INTO v_topay
    FROM ASU.TPLAT_USLUG PU
   WHERE PU.FK_ID = pUslugID;

  IF v_billsum >= v_topay THEN
   v_ishasbill := 1;
  ELSE
   v_ishasbill := 0;
  END IF;

  RETURN v_ishasbill;
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION GET_SUM_NOTINBILL(pUslugID NUMBER) RETURN NUMBER IS
  --created by A.Nakorjakov 260508
  --стоимость услуги, не внесенная в не аннулированные счета
  v_topay   NUMBER;
  v_billsum NUMBER;
 BEGIN
  SELECT NVL(SUM(FN_SUM), 0)
    INTO v_billsum
    FROM TBILL_USLUG BU
   WHERE BU.FK_PLAT_USLUG = pUslugID
     AND ASU.PKG_PLATUSLUG.IS_BILLANNUL(BU.FK_BILL) = 0;

  SELECT NVL(FN_COST * FN_COUNT, 0)
    INTO v_topay
    FROM ASU.TPLAT_USLUG PU
   WHERE PU.FK_ID = pUslugID;

  RETURN v_topay - v_billsum;
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION IS_ALLUSLUG_DONE(pAppendixID NUMBER) RETURN NUMBER IS
  --created by A.Nakorjakov 270508
  --Выполнены все услуги в приложении?  1 - выполнены; 0 - не выполнены
  v_vipcnt NUMBER;
  v_cnt    NUMBER;
  v_res    NUMBER;
 BEGIN
  /*
    by A.Nakorjakov 170808
  SELECT COUNT(1)
    INTO v_cnt
    FROM ASU.TAPPENDIX AP, ASU.TAMBTALON_NAZ AN, TPLAT_USLUG PU
   WHERE AP.FK_ID = pAppendixID
     AND AP.FK_AMBTALON = AN.FK_TALONID
     AND PU.FK_NAZ = AN.FK_NAZID;
   */

  /*by A.Nakorjakov 170808 started*/
  SELECT COUNT(1)
    INTO v_cnt
    FROM ASU.TAPPENDIX_NAZ AN, TPLAT_USLUG PU
   WHERE AN.FK_APPENDIXID = pAppendixID
     AND PU.FK_NAZ = AN.FK_NAZID;
  /*by A.Nakorjakov 170808 finished*/

  /*
  by A.Nakorjakov 170808
  SELECT COUNT(1)
    INTO v_vipcnt
    FROM ASU.TAPPENDIX AP, ASU.TAMBTALON_NAZ AN, TPLAT_USLUG PU
   WHERE AP.FK_ID = pAppendixID
     AND AP.FK_AMBTALON = AN.FK_TALONID
     AND PU.FK_NAZ = AN.FK_NAZID
     AND PU.FP_SOS = ASU.Get_Vipnaz;
  */

  /*by A.Nakorjakov 170808 started*/
  SELECT COUNT(1)
    INTO v_vipcnt
    FROM ASU.TAPPENDIX_NAZ AN, TPLAT_USLUG PU
   WHERE AN.FK_APPENDIXID = pAppendixID
     AND PU.FK_NAZ = AN.FK_NAZID
     AND PU.FP_SOS = ASU.Get_Vipnaz;
  /*by A.Nakorjakov 170808 finished*/

  IF v_cnt <> v_vipcnt THEN
   v_res := 0;
  ELSE
   v_res := 1;
  END IF;
  RETURN v_res;
 END;

 ------------------------------------------------------------------------------------------
 PROCEDURE RETURNMONEY_FORUSLUG(pUslugID NUMBER, pSotr NUMBER, pDate DATE)
 --created by A.Nakorjakov 270508
  --возврат денег, оплаченных за услугу на счет плательщика
  IS
  v_move NUMBER;
 BEGIN
  FOR C IN (SELECT AP.FK_PAYER, B.FK_ID, BU.FN_SUM
              FROM ASU.TBILL_USLUG BU, ASU.TBILL B, ASU.TAPPENDIX_PAYER AP
             WHERE BU.FK_PLAT_USLUG = pUslugID
               AND B.FK_APPENDIX = AP.FK_APPENDIX
               AND B.FK_ID = BU.FK_BILL
               AND B.FP_PAY = 1
               AND IS_BILLANNUL(B.FK_ID) = 0) LOOP
   ANNUL_BILL(C.FK_ID, pDate, pSotr);
   v_move := MOVE_MONEY(-1, --касса
                        C.FK_PAYER,
                        C.FK_ID,
                        C.FN_SUM,
                        pSotr);
  END LOOP;
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION INSERT_PACUSLUG(pPacID          NUMBER,
                          pHealID         NUMBER,
                          pAssumeispolid  NUMBER,
                          pKabID          NUMBER,
                          pInsurDogovorID NUMBER) RETURN NUMBER
 -- created by A.Nakorjakov 290508
  -- добавить услугу в список свободных услуг пациента
  --modified by A.Nakorjakov 180808 - добавил FK_INSUR_DOGOVOR
  IS
  v_res NUMBER;
 BEGIN
  INSERT INTO ASU.TPACUSLUG
   (FK_PACID, FK_HEAL, FK_ASSUMEISPOL, FK_KABINET, FK_INSUR_DOGOVOR)
  VALUES
   (pPacID, pHealID, pAssumeispolid, pKabID, pInsurDogovorID)
  RETURNING FK_ID INTO v_res;
  RETURN v_res;
 END;

 ------------------------------------------------------------------------------------------
 PROCEDURE DELETE_PACUSLUG(pPacUslID NUMBER, pRemoveDate DATE)
 -- created by A.Nakorjakov 290508
  -- удалить услугу из списка свободных услуг пациента
  IS
 BEGIN
  UPDATE ASU.TPACUSLUG SET FD_REMOVEDATE = pRemoveDate WHERE FK_ID = pPacUslID;
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION GET_PEPL_CAPACITY(pPeopleID NUMBER) RETURN NUMBER IS
  --created by A.Nakorjakov 200608
  --Рентабельность ПИПЛА
  v_capacity NUMBER;
 BEGIN
  SELECT MAX(FK_CAPACITY) INTO v_capacity FROM TPAYER WHERE FK_PEOPLEID = pPeopleID;
  RETURN v_capacity;
 END;

 ------------------------------------------------------------------------------------------
 PROCEDURE UPDATE_PAYER_APPENDIX_CAPACITY(pPayerID NUMBER, pCapacityID NUMBER) IS
  --created by A.Nakorjakov 210608
  --Обновление данных о рентабельности и цене услуг приложений, плательщиком которых является pPayerID
  v_app_payer NUMBER;
 BEGIN
  v_app_payer := -1;
  /* by A.Nakorjakov 170808
  for c in (select pu.fk_id fk_uslid,
                  pu.fl_nds,
                  pu.fk_heal,
                  v.fd_naz,
                  p.fk_id fk_app_payer
             from asu.tappendix       ap,
                  asu.tambtalon_naz   an,
                  asu.tplat_uslug     pu,
                  asu.tappendix_payer p,
                  asu.tplat_dogovor   pd,
                  asu.vnaz            v
            where p.fk_payer = pPayerID
              and NVL(p.fk_capacity,-1) <> pCapacityID
              and p.fk_appendix = ap.fk_id
              and an.fk_talonid = ap.fk_ambtalon
              and an.fk_nazid = pu.fk_naz
              and ap.fl_pacsubscribe = 0
              and ap.fp_sos = 0
              and pd.fk_id = ap.fk_dogovor
              and pd.fp_sos = 0
              and v.fk_id = pu.fk_naz) loop*/

  /*by A.Nakorjakov 170808 started*/
  FOR c IN (SELECT pu.fk_id fk_uslid, pu.fl_nds, pu.fk_heal, v.fd_naz, p.fk_id fk_app_payer
              FROM asu.tappendix       ap,
                   asu.tappendix_naz   an,
                   asu.tplat_uslug     pu,
                   asu.tappendix_payer p,
                   asu.tplat_dogovor   pd,
                   asu.vnaz            v
             WHERE p.fk_payer = pPayerID
               AND NVL(p.fk_capacity, -1) <> pCapacityID
               AND p.fk_appendix = ap.fk_id
               AND an.fk_appendixid = ap.fk_id
               AND an.fk_nazid = pu.fk_naz
               AND ap.fl_pacsubscribe = 0
               AND ap.fp_sos = 0
               AND pd.fk_id = ap.fk_dogovor
               AND pd.fp_sos = 0
               AND v.fk_id = pu.fk_naz) LOOP
   /*by A.Nakorjakov 170808 finished*/
   v_app_payer := c.fk_app_payer;

   UPDATE asu.tplat_uslug pu
      SET pu.fn_cost = asu.pkg_platuslug.GET_USLUG_COST(c.fk_heal,
                                                        c.fl_nds,
                                                        pCapacityID,
                                                        c.fd_naz)
    WHERE pu.fk_id = c.fk_uslid;
  END LOOP;
  IF v_app_payer > 0 THEN
   UPDATE asu.tappendix_payer p SET p.fk_capacity = pCapacityID WHERE p.fk_id = v_app_payer;
  END IF;
 END;

 ------------------------------------------------------------------------------------------
 PROCEDURE UPDATE_APP_USLCOST_NEWCAPACITY(pAppendixID NUMBER, pCapacityID NUMBER) IS
  --created by A.Nakorjakov 210608
  --Обновление данных цены услуг приложения. Причина изменения цены - смена рентабельности
 BEGIN
  /*
    by A.Nakorjakov 170808
  for c in (select pu.fk_id fk_uslid,
                   pu.fl_nds,
                   pu.fk_heal,
                   v.fd_naz,
                   p.fk_id fk_app_payer
              from asu.tappendix       ap,
                   asu.tambtalon_naz   an,
                   asu.tplat_uslug     pu,
                   asu.tappendix_payer p,
                   asu.tplat_dogovor   pd,
                   asu.vnaz            v
             where ap.fk_id = pAppendixID
               and NVL(p.fk_capacity,-1) <> pCapacityID
               and p.fk_appendix = ap.fk_id
               and an.fk_talonid = ap.fk_ambtalon
               and an.fk_nazid = pu.fk_naz
               and ap.fl_pacsubscribe = 0
               and ap.fp_sos = 0
               and pd.fk_id = ap.fk_dogovor
               and pd.fp_sos = 0
               and v.fk_id = pu.fk_naz) loop
    */

  /*    by A.Nakorjakov 170808 started*/
  FOR c IN (SELECT pu.fk_id fk_uslid, pu.fl_nds, pu.fk_heal, v.fd_naz, p.fk_id fk_app_payer
              FROM asu.tappendix       ap,
                   asu.tappendix_naz   an,
                   asu.tplat_uslug     pu,
                   asu.tappendix_payer p,
                   asu.tplat_dogovor   pd,
                   asu.vnaz            v
             WHERE ap.fk_id = pAppendixID
               AND NVL(p.fk_capacity, -1) <> pCapacityID
               AND p.fk_appendix = ap.fk_id
               AND an.fk_appendixid = ap.fk_id
               AND an.fk_nazid = pu.fk_naz
               AND ap.fl_pacsubscribe = 0
               AND ap.fp_sos = 0
               AND pd.fk_id = ap.fk_dogovor
               AND pd.fp_sos = 0
               AND v.fk_id = pu.fk_naz) LOOP
   /*    by A.Nakorjakov 170808 finished*/
   UPDATE asu.tplat_uslug pu
      SET pu.fn_cost = asu.pkg_platuslug.GET_USLUG_COST(c.fk_heal,
                                                        c.fl_nds,
                                                        pCapacityID,
                                                        c.fd_naz)
    WHERE pu.fk_id = c.fk_uslid;
  END LOOP;
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION GET_PAC_ADRSTRING(pPeopleID NUMBER, pPacID NUMBER) RETURN VARCHAR2 IS
  --created by A.Nakorjakov 210608
  --Возвращает строку адреса пациента
  v_res      VARCHAR2(4000);
  v_printall VARCHAR2(100);
  v_adr      VARCHAR2(4000);
  v_phone    VARCHAR2(4000);
 BEGIN
  SELECT asu.pkg_smini.READSTRING('IBTITUL_LIST', 'IS_PRINT_POCHT_ADR', '1')
    INTO v_printall
    FROM DUAL;
  v_res := ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_ADRFULL(pPeopleID);
  IF v_printall = '1' THEN
   SELECT fc_adr
     INTO v_adr
     FROM asu.tadress
    WHERE fk_id = ASU.PKG_REGIST_PACFUNC.GET_PAC_ADRID(pPacID);
   v_res := v_res || v_adr;
  END IF;
  SELECT decode(Phone, NULL, '', ' т.: ' || Phone)
    INTO v_phone
    FROM (SELECT MAX(ASU.PKG_STRINGS.CONCATENATE(ROWNUM, FC_PHONE || '  ')) Phone
            FROM (SELECT FC_PHONE
                    FROM tpeoples
                   WHERE fk_id = pPeopleID
                  UNION ALL
                  SELECT FC_CONTACT FROM TCONTACTS WHERE FK_PACID = pPeopleID ORDER BY 1 DESC));
  v_res := v_res || v_phone;
  RETURN v_res;
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION IS_PLATUSL_HEAL(pHealID NUMBER) RETURN NUMBER IS
  --created by A.Nakorjakov 210608
  --Является услуга платной; 1 - является   0 - нет
  v_cnt NUMBER;
 BEGIN
  SELECT COUNT(1)
    INTO v_cnt
    FROM ASU.THEAL H
   WHERE FK_PARENT = ASU.GET_PLATUSLUG
  CONNECT BY PRIOR H.FK_PARENT = H.FK_ID
   START WITH H.FK_ID = pHealID;
  IF v_cnt > 0 THEN
   RETURN 1;
  ELSE
   RETURN 0;
  END IF;
 END;
 ------------------------------------------------------------------------------------------
 FUNCTION IS_SMID_HEAL(pSmidID NUMBER) RETURN NUMBER IS
  --created by Spasskiy S.N 230608
  --Является назначение  платной услугой ; 1 - является   0 - нет
  v_cnt NUMBER;
 BEGIN
  FOR X IN (SELECT FK_HEAL FROM ASU.THEAL_SMID WHERE FK_SMID = pSmidID) LOOP
   SELECT COUNT(1)
     INTO v_cnt
     FROM ASU.THEAL H
    WHERE FK_PARENT = ASU.GET_PLATUSLUG
      AND
         /*CONNECT BY PRIOR H.FK_PARENT = H.FK_ID
                               START WITH*/
          H.FK_ID = X.FK_HEAL;
   IF v_cnt > 0 THEN
    RETURN 1;
   END IF;
  END LOOP;
  RETURN 0;
 END;

 ------------------------------------------------------------------------------------------
 PROCEDURE DO_NAZ_TO_INSURDOCS(pNazID NUMBER, pInsurDocsID NUMBER) IS
  --created by A.Nakorjakov 180808
  --Связывает назначение с договором по программам
  v_cnt NUMBER;
 BEGIN

  IF pInsurDocsID < 0 THEN
     DELETE FROM ASU.TNAZ_INSUR N WHERE N.FK_NAZID = pNazID;
     UPDATE ASU.TPLAT_USLUG U SET U.FN_PAYPERCENT = 100 WHERE U.FK_NAZ = pNazID;
     RETURN;
  END IF;

  SELECT COUNT(1) INTO v_cnt FROM ASU.TNAZ_INSUR N WHERE N.FK_NAZID = pNazID;
  IF v_cnt > 0 THEN
   UPDATE ASU.TNAZ_INSUR N
      SET N.FK_INSURDOCS = pInsurDocsID
    WHERE N.FK_NAZID = pNazID;
  ELSE
   INSERT INTO ASU.TNAZ_INSUR
    (FK_NAZID, FK_INSURDOCS)
   VALUES
    (pNazID, pInsurDocsID);
  END IF;
 END;

 ------------------------------------------------------------------------------------------
 PROCEDURE DO_DELETE_NAZ_TO_INSURDOCS(pNazID NUMBER) IS
  --created by A.Nakorjakov 180808
  --Удаляет связку договора по программам с назначением
 BEGIN
  DELETE ASU.TNAZ_INSUR N WHERE N.FK_NAZID = pNazID;
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION IS_PROGRAMM_INSURANCE(pInsurDocsID NUMBER) RETURN NUMBER IS
  --created by A.Nakorjakov 180808
  --Страховой документ связан с программой: 0- не связан, 1- связан
   v_cnt NUMBER;
   v_res NUMBER;
 BEGIN
  SELECT COUNT(1)
  INTO v_cnt
  FROM ASU.TINSURDOCS I, ASU.TINSUR_DOGOVOR ID
  WHERE I.FK_DOGOVORID = ID.FK_ID
        AND I.FK_ID = pInsurDocsID;
  IF v_cnt = 0 THEN
     v_res := 0;
  ELSE
     v_res := 1;
  END IF;
  return v_res;
 END;

 ------------------------------------------------------------------------------------------
 FUNCTION GET_INSUR_DOGOVOR(pInsurDocsID NUMBER) RETURN NUMBER IS
  --created by A.Nakorjakov 180808
  --Возвращает договор страхового документа
   v_res NUMBER;
 BEGIN
  SELECT MAX(ID.FK_ID)  INTO v_res
  FROM ASU.TINSURDOCS I, ASU.TINSUR_DOGOVOR ID
  WHERE I.FK_DOGOVORID = ID.FK_ID
        AND I.FK_ID = pInsurDocsID;
  return v_res;
 END;

 -----------  Исполнитель -------------------------------------------------------

 FUNCTION IS_RIGHT_ISPOL(pFK_SOTRID IN NUMBER, PFK_ID IN NUMBER, pOPERATION IN NUMBER)
  RETURN NUMBER IS
  --pOPERATION: 0 - Информированное согласие
  --            1 - Отказ от выполнения услуги
  --            2 - Акт об оказании услуги
  --            3 - Выполнение посещения
  CURSOR cNAZ IS
   SELECT FK_ID, FK_NAZSOSID, FK_ISPOLID
     FROM VNAZ
    WHERE FK_ID = (SELECT FK_NAZ FROM TPLAT_USLUG WHERE FK_ID = pFK_ID);
  CURSOR cPlatUslug IS
   SELECT FK_ASSUMEISPOL, FP_PRINTDOC, FN_COUNT, FL_AGREED
     FROM TPLAT_USLUG
    WHERE FK_ID = pFK_ID;
  CURSOR cIsOtdel IS
   SELECT FK_OTDELID FROM TSOTR WHERE FK_ID = pFK_SOTRID;
  CURSOR cUslugCount(nNazID IN NUMBER) IS
   SELECT COUNT(*) FROM TVRACHNAZMARK WHERE FK_NAZID = nNazID;
  bCanISpol       NUMBER;
  nNazID          NUMBER;
  nNAZSOSID       NUMBER;
  nISPOLID        NUMBER;
  nASSUMEISPOL    NUMBER;
  nPRINTDOC       NUMBER;
  nOTDEL          NUMBER;
  nUslugCount     NUMBER;
  nRealUslugCount NUMBER;
  nAGREED         NUMBER;
 BEGIN
  bCanISpol := 0;
  OPEN cNAZ;
  FETCH cNAZ
  INTO nNazID, nNAZSOSID, nISPOLID;
  CLOSE cNAZ;

  OPEN cPlatUslug;
  FETCH cPlatUslug
  INTO nASSUMEISPOL, nPRINTDOC, nUslugCount, nAGREED;
  CLOSE cPlatUslug;

  OPEN cIsOtdel;
  FETCH cIsOtdel
  INTO nOTDEL;
  CLOSE cIsOtdel;

  IF pOPERATION = 0 THEN
   -- Информированное согласие
   IF ((nNAZSOSID = GET_NEVIP) OR (nNAZSOSID = GET_RECOMEND)) AND
      ((nISPOLID = pFK_SOTRID) OR ((nAGREED IS NULL) AND (nASSUMEISPOL = nOTDEL))) AND
      (nPRINTDOC IS NULL) THEN
    bCanISpol := 1;
   END IF;
  ELSIF pOPERATION = 2 THEN
   -- Акт об оказании услуги
   IF (nNAZSOSID = GET_VIPNAZ) AND (nISPOLID = pFK_SOTRID) AND (nPRINTDOC IS NULL) AND
      (nAGREED = 1) THEN
    bCanISpol := 1;
   END IF;
  ELSIF pOPERATION = 1 THEN
   -- Отказ от выполнения услуги
   IF /*((nNAZSOSID = GET_NEVIP) OR (nNAZSOSID = GET_RECOMEND) OR
                                             (nNAZSOSID = GET_NAZ_PROCESS)) AND */
    (nPRINTDOC IS NULL) AND
    ((nISPOLID = pFK_SOTRID) OR ((nASSUMEISPOL = nOTDEL) AND (nAGREED IS NULL))) THEN
    bCanISpol := 1;
   END IF;
  ELSIF pOPERATION = 3 THEN
   -- Выполнение посещения
   OPEN cUslugCount(nNazID);
   FETCH cUslugCount
   INTO nRealUslugCount;
   CLOSE cUslugCount;
   IF (nNAZSOSID = GET_NAZ_PROCESS) AND (nISPOLID = pFK_SOTRID) AND (nAGREED = 1) AND
      (nRealUslugCount < nUslugCount) THEN
    bCanISpol := 1;
   END IF;
  END IF;
  RETURN bCanISpol;
 EXCEPTION
  WHEN OTHERS THEN
   RETURN 0;
 END;

 FUNCTION DO_SET_SOGL_PODPIS(pFK_SOTRID IN NUMBER, PFK_ID IN NUMBER) RETURN NUMBER IS
  nFK_ISPOLID NUMBER;
 BEGIN

  /*  SELECT FK_ISPOLID
      INTO nFK_ISPOLID
      FROM VNAZ, TPLAT_USLUG
     WHERE TPLAT_USLUG.FK_ID = pFK_ID
       AND TPLAT_USLUG.FK_NAZ = VNAZ.FK_ID;
  */

  --  IF (nFK_ISPOLID = -2) OR (nFK_ISPOLID = pFK_SOTRID) OR (nFK_ISPOLID IS NULL) THEN
  IF IS_RIGHT_ISPOL(pFK_SOTRID, PFK_ID, 0) > 0 THEN
   UPDATE ASU.TPLAT_USLUG SET FP_SOS = 4, FL_AGREED = 1 WHERE FK_ID = pFK_ID;

   UPDATE ASU.VNAZ
      SET FK_NAZSOSID = 4, FK_ISPOLID = pFK_SOTRID
    WHERE FK_ID IN (SELECT FK_NAZ FROM ASU.TPLAT_USLUG WHERE FK_ID = pFK_ID);
   nFK_ISPOLID := pFK_SOTRID;
  ELSE
   nFK_ISPOLID := -1;
  END IF;
  RETURN nFK_ISPOLID;
 END;

 FUNCTION DO_SET_OTKAZ(pFK_SOTRID IN NUMBER, PFK_ID IN NUMBER) RETURN NUMBER IS
  nFK_ISPOLID NUMBER;
  nFK_NAZ     NUMBER;
  dFD_DATE    DATE;
 BEGIN

  /*    SELECT  FK_ISPOLID INTO nFK_ISPOLID
      FROM VNAZ, TPLAT_USLUG
      WHERE TPLAT_USLUG.FK_ID = pFK_ID
            AND TPLAT_USLUG.FK_NAZ = VNAZ.FK_ID;

      IF nFK_ISPOLID = pFK_SOTRID THEN
  */
  IF IS_RIGHT_ISPOL(pFK_SOTRID, PFK_ID, 1) > 0 THEN
   UPDATE TPLAT_USLUG
      SET FP_SOS = GET_NAZ_OTKAZ, FP_PRINTDOC = 1

    WHERE FK_ID = pFK_ID;
   SELECT FK_NAZ INTO nFK_NAZ FROM TPLAT_USLUG WHERE FK_ID = pFK_ID;
   UPDATE VNAZ
      SET FK_NAZSOSID = GET_NAZ_OTKAZ, FK_ISPOLID = pFK_SOTRID, FD_RUN = SYSDATE
    WHERE FK_ID = nFK_NAZ;

   SELECT FD_NAZ INTO dFD_DATE FROM VNAZ WHERE FK_ID = nFK_NAZ;

   INSERT INTO TVRACHNAZMARK
    (FK_NAZID, FK_SOTR, FK_SOS, FD_NAZ, FD_RUN)
   VALUES
    (nFK_NAZ, pFK_SOTRID, GET_NAZ_OTKAZ, dFD_DATE, SYSDATE);
   nFK_ISPOLID := pFK_SOTRID;
  ELSE
   nFK_ISPOLID := -1;
  END IF;
  RETURN nFK_ISPOLID;
 END;

 FUNCTION DO_SET_ACT(pFK_SOTRID IN NUMBER, PFK_ID IN NUMBER) RETURN NUMBER IS
  nFK_ISPOLID NUMBER;
  nFK_NAZ     NUMBER;
  dFD_DATE    DATE;
 BEGIN

  /*    SELECT  FK_ISPOLID INTO nFK_ISPOLID
      FROM VNAZ, TPLAT_USLUG
      WHERE TPLAT_USLUG.FK_ID = pFK_ID
            AND TPLAT_USLUG.FK_NAZ = VNAZ.FK_ID;


      IF nFK_ISPOLID = pFK_SOTRID THEN
  */
  IF IS_RIGHT_ISPOL(pFK_SOTRID, PFK_ID, 2) > 0 THEN
   UPDATE TPLAT_USLUG SET FP_SOS = GET_VIPNAZ, FP_PRINTDOC = 0 WHERE FK_ID = pFK_ID;

   SELECT FK_NAZ INTO nFK_NAZ FROM TPLAT_USLUG WHERE FK_ID = pFK_ID;
   UPDATE VNAZ
      SET FK_NAZSOSID = GET_VIPNAZ, FK_ISPOLID = pFK_SOTRID, FD_RUN = SYSDATE
    WHERE FK_ID = nFK_NAZ;

   SELECT FD_NAZ INTO dFD_DATE FROM VNAZ WHERE FK_ID = nFK_NAZ;

   INSERT INTO TVRACHNAZMARK
    (FK_NAZID, FK_SOTR, FK_SOS, FD_NAZ, FD_RUN)
   VALUES
    (nFK_NAZ, pFK_SOTRID, GET_VIPNAZ, dFD_DATE, SYSDATE);

   nFK_ISPOLID := pFK_SOTRID;
  ELSE
   nFK_ISPOLID := -1;
  END IF;
  RETURN nFK_ISPOLID;

 END;

 FUNCTION DO_SET_OSMOTR(pFK_SOTRID IN NUMBER, PFK_ID IN NUMBER) RETURN NUMBER IS
  nFK_ISPOLID NUMBER;
  nFK_NAZ     NUMBER;
  dFD_DATE    DATE;
 BEGIN

  /*    SELECT  FK_ISPOLID INTO nFK_ISPOLID
      FROM VNAZ, TPLAT_USLUG
      WHERE TPLAT_USLUG.FK_ID = pFK_ID
            AND TPLAT_USLUG.FK_NAZ = VNAZ.FK_ID;


      IF nFK_ISPOLID = pFK_SOTRID THEN
  */
  IF IS_RIGHT_ISPOL(pFK_SOTRID, PFK_ID, 3) > 0 THEN
   UPDATE TPLAT_USLUG SET FP_SOS = GET_VIPNAZ, FP_PRINTDOC = 0 WHERE FK_ID = pFK_ID;

   SELECT FK_NAZ INTO nFK_NAZ FROM TPLAT_USLUG WHERE FK_ID = pFK_ID;
   UPDATE VNAZ SET FD_RUN = SYSDATE WHERE FK_ID = nFK_NAZ;

   SELECT FD_NAZ INTO dFD_DATE FROM VNAZ WHERE FK_ID = nFK_NAZ;

   INSERT INTO TVRACHNAZMARK
    (FK_NAZID, FK_SOTR, FK_SOS, FD_NAZ, FD_RUN)
   VALUES
    (nFK_NAZ, pFK_SOTRID, GET_NAZ_PROCESS, dFD_DATE, SYSDATE);
   nFK_ISPOLID := pFK_SOTRID;
  ELSE
   nFK_ISPOLID := -1;
  END IF;
  RETURN nFK_ISPOLID;

 END;

 FUNCTION GET_PRINTDOC(pFK_ID IN NUMBER) RETURN VARCHAR IS
  CURSOR cDoc IS
   SELECT DECODE(FL_AGREED, 1, 'Согласие', NULL) FC_SOGL,
          DECODE(FP_PRINTDOC, 0, 'Акт', 1, 'Отказ', NULL) FC_PRINTDOC
     FROM TPLAT_USLUG
    WHERE FK_ID = pFK_ID;
  cAgreed   VARCHAR(10);
  cPrintDoc VARCHAR(10);
  cRes      VARCHAR(20);
 BEGIN
  OPEN cDoc;
  FETCH cDOc
  INTO cAgreed, cPrintDoc;
  CLOSE cDOc;

  --    cRes := '';
  cRes := cAgreed;
  IF (cRes IS NOT NULL) AND (cPrintDoc IS NOT NULL) THEN
   cRes := cRes || ', ';
  END IF;
  cRes := cRes || cPrintDoc;
  RETURN cRes;

 END;

 FUNCTION GET_PACKONSULT(pFK_PACID   IN NUMBER,
                         pFK_ORGID   IN NUMBER,
                         pFD_BEGIN   IN DATE,
                         pFD_END     IN DATE,
                         pFK_ISPOLID IN NUMBER) RETURN VARCHAR IS
  /* by A.Nakorjakov 170808
  CURSOR cName IS SELECT MAX(ASU.PKG_STRINGS.CONCATENATE(ROWNUM, FC_NAME, ', ', 1))
                  FROM (SELECT /*DISTINCT*/ /* GET_SMIDNAME(GET_SMIDOWNER(T6.FK_SMID)) || ' - '|| T6.FC_NAME || ' (' || TO_CHAR(T6.FD_RUN, 'dd.mm.yyyy')  || ')' FC_NAME
   FROM ASU.TPLAT_USLUG T1,
        ASU.TAMBTALON_NAZ T2,
        ASU.TAPPENDIX T3,
        ASU.TAPPENDIX_PAYER T5,
        ASU.VNAZ T6,
        ASU.TPAYER T7,
        BUH.TS_ORG T8,
        (SELECT FK_ID FROM ASU.TSOTR WHERE FK_ID = pFK_ISPOLID
         UNION
         SELECT FK_ID FROM ASU.TSOTR WHERE FK_OTDELID = pFK_ISPOLID) T9
    --     ASU.TPAYMENT T10,
     --    ASU.TINSURANCE T11
   WHERE     T1.FK_NAZ = T2.FK_NAZID
         AND T6.FK_NAZSOSID = ASU.GET_VIPNAZ
         AND T1.FP_PRINTDOC = 0
         AND T3.FK_AMBTALON = T2.FK_TALONID
         AND T5.FK_APPENDIX = T3.FK_ID
         AND T1.FK_NAZ = T6.FK_ID
         AND T5.FK_PAYER = T7.FK_ID
         AND T7.FK_COMPANYID = T8.FK_ID

         AND T6.FD_RUN > TRUNC(pFD_BEGIN)
         AND T6.FD_RUN <= TRUNC(pFD_END+1)
        -- AND T6.FD_RUN > TRUNC(SYSDATE)
       --  AND T6.FD_RUN <= TRUNC(SYSDATE+1)
         AND T6.FK_ISPOLID = T9.FK_ID
         AND T6.FK_PACID = pFK_PACID
         AND T8.FK_ID = pFK_ORGID
    --     AND T10.FK_ID = T5.FK_PAYMENTID
    --     AND T10.FK_INSURANCEID = T11.FK_ID
    );*/

  /* by A.Nakorjakov 170808 started */
  CURSOR cName IS
   SELECT MAX(ASU.PKG_STRINGS.CONCATENATE(ROWNUM, FC_NAME, ', ', 1))
     FROM (SELECT /*DISTINCT*/
            GET_SMIDNAME(GET_SMIDOWNER(T6.FK_SMID)) || ' - ' || T6.FC_NAME || ' (' ||
            TO_CHAR(T6.FD_RUN, 'dd.mm.yyyy') || ')' FC_NAME
             FROM ASU.TPLAT_USLUG T1,
                  ASU.TAPPENDIX_NAZ T2,
                  ASU.TAPPENDIX T3,
                  ASU.TAPPENDIX_PAYER T5,
                  ASU.VNAZ T6,
                  ASU.TPAYER T7,
                  BUH.TS_ORG T8,
                  (SELECT FK_ID
                     FROM ASU.TSOTR
                    WHERE FK_ID = pFK_ISPOLID
                   UNION
                   SELECT FK_ID FROM ASU.TSOTR WHERE FK_OTDELID = pFK_ISPOLID) T9
           --     ASU.TPAYMENT T10,
           --    ASU.TINSURANCE T11
            WHERE T1.FK_NAZ = T2.FK_NAZID
              AND T6.FK_NAZSOSID = ASU.GET_VIPNAZ
              AND T1.FP_PRINTDOC = 0
              AND T3.FK_ID = T2.FK_APPENDIXID
              AND T5.FK_APPENDIX = T3.FK_ID
              AND T1.FK_NAZ = T6.FK_ID
              AND T5.FK_PAYER = T7.FK_ID
              AND T7.FK_COMPANYID = T8.FK_ID

              AND T6.FD_RUN > TRUNC(pFD_BEGIN)
              AND T6.FD_RUN <= TRUNC(pFD_END + 1)
                 -- AND T6.FD_RUN > TRUNC(SYSDATE)
                 --  AND T6.FD_RUN <= TRUNC(SYSDATE+1)
              AND T6.FK_ISPOLID = T9.FK_ID
              AND T6.FK_PACID = pFK_PACID
              AND T8.FK_ID = pFK_ORGID
           --     AND T10.FK_ID = T5.FK_PAYMENTID
           --     AND T10.FK_INSURANCEID = T11.FK_ID
           );
  /* by A.Nakorjakov 170808 started */
  cRes VARCHAR2(4000);
 BEGIN
  OPEN cName;
  FETCH cName
  INTO cRes;
  CLOSE cNAme;
  RETURN cRes;
 END;

 FUNCTION GET_PACKONSULTDATE(pFK_PACID   IN NUMBER,
                             pFD_BEGIN   IN DATE,
                             pFD_END     IN DATE,
                             pFK_ISPOLID IN NUMBER) RETURN VARCHAR IS
  CURSOR cName IS
   SELECT MAX(T1.FD_RUN)
     FROM VNAZ T1, TPLAT_USLUG T2
    WHERE T2.FK_NAZ = T1.FK_ID
      AND T1.FK_PACID = pFK_PACID
      AND T1.FD_RUN > TRUNC(pFD_BEGIN)
      AND T1.FD_RUN <= TRUNC(pFD_END + 1)
      AND T1.FK_NAZSOSID = GET_VIPNAZ
      AND T1.FK_ISPOLID = pFK_ISPOLID;
  cRes VARCHAR2(4000);
 BEGIN
  OPEN cName;
  FETCH cName
  INTO cRes;
  CLOSE cNAme;
  RETURN cRes;
 END;

 FUNCTION GET_PACPOLIS(pFK_PACID   IN NUMBER,
                       pFK_ORGID   IN NUMBER,
                       pFD_BEGIN   IN DATE,
                       pFD_END     IN DATE,
                       pFK_ISPOLID IN NUMBER) RETURN VARCHAR IS
  /* by A.Nakorjakov 170808
      CURSOR cName IS SELECT MAX(ASU.PKG_STRINGS.CONCATENATE(ROWNUM, FC_NAME, ', ', 1))
                      FROM (SELECT DISTINCT T11.FC_SER || ' ' || T11.FC_NUM FC_NAME
  FROM ASU.TPLAT_USLUG T1,
       ASU.TAMBTALON_NAZ T2,
       ASU.TAPPENDIX T3,
       ASU.TAPPENDIX_PAYER T5,
       ASU.VNAZ T6,
       ASU.TPAYER T7,
       BUH.TS_ORG T8,
       (SELECT FK_ID FROM ASU.TSOTR WHERE FK_ID = pFK_ISPOLID
        UNION
        SELECT FK_ID FROM ASU.TSOTR WHERE FK_OTDELID = pFK_ISPOLID) T9,
        ASU.TPAYMENT T10,
        ASU.TINSURANCE T11
  WHERE     T1.FK_NAZ = T2.FK_NAZID
        AND T6.FK_NAZSOSID = ASU.GET_VIPNAZ
        AND T1.FP_PRINTDOC = 0
        AND T3.FK_AMBTALON = T2.FK_TALONID
        AND T5.FK_APPENDIX = T3.FK_ID
        AND T1.FK_NAZ = T6.FK_ID
        AND T5.FK_PAYER = T7.FK_ID
        AND T7.FK_COMPANYID = T8.FK_ID

        AND T6.FD_RUN > TRUNC(pFD_BEGIN)
        AND T6.FD_RUN <= TRUNC(pFD_END+1)
       -- AND T6.FD_RUN > TRUNC(SYSDATE)
      --  AND T6.FD_RUN <= TRUNC(SYSDATE+1)
        AND T6.FK_ISPOLID = T9.FK_ID
        AND T6.FK_PACID = pFK_PACID
        AND T8.FK_ID = pFK_ORGID
        AND T10.FK_ID = T5.FK_PAYMENTID
        AND T10.FK_INSURANCEID = T11.FK_ID)
        ;*/

  /*by A.Nakorjakov 170808 started*/
  CURSOR cName IS
   SELECT MAX(ASU.PKG_STRINGS.CONCATENATE(ROWNUM, FC_NAME, ', ', 1))
     FROM (SELECT DISTINCT T11.FC_SER || ' ' || T11.FC_NUM FC_NAME
             FROM ASU.TPLAT_USLUG T1,
                  ASU.TAPPENDIX_NAZ T2,
                  ASU.TAPPENDIX T3,
                  ASU.TAPPENDIX_PAYER T5,
                  ASU.VNAZ T6,
                  ASU.TPAYER T7,
                  BUH.TS_ORG T8,
                  (SELECT FK_ID
                     FROM ASU.TSOTR
                    WHERE FK_ID = pFK_ISPOLID
                   UNION
                   SELECT FK_ID FROM ASU.TSOTR WHERE FK_OTDELID = pFK_ISPOLID) T9,
                  ASU.TPAYMENT T10,
                  ASU.TINSURANCE T11
            WHERE T1.FK_NAZ = T2.FK_NAZID
              AND T6.FK_NAZSOSID = ASU.GET_VIPNAZ
              AND T1.FP_PRINTDOC = 0
              AND T3.FK_ID = T2.FK_APPENDIXID
              AND T5.FK_APPENDIX = T3.FK_ID
              AND T1.FK_NAZ = T6.FK_ID
              AND T5.FK_PAYER = T7.FK_ID
              AND T7.FK_COMPANYID = T8.FK_ID

              AND T6.FD_RUN > TRUNC(pFD_BEGIN)
              AND T6.FD_RUN <= TRUNC(pFD_END + 1)
                 -- AND T6.FD_RUN > TRUNC(SYSDATE)
                 --  AND T6.FD_RUN <= TRUNC(SYSDATE+1)
              AND T6.FK_ISPOLID = T9.FK_ID
              AND T6.FK_PACID = pFK_PACID
              AND T8.FK_ID = pFK_ORGID
              AND T10.FK_ID = T5.FK_PAYMENTID
              AND T10.FK_INSURANCEID = T11.FK_ID);
  /*by A.Nakorjakov 170808 finished*/
  cRes VARCHAR2(4000);
 BEGIN
  OPEN cName;
  FETCH cName
  INTO cRes;
  CLOSE cNAme;
  RETURN cRes;
 END;
 -----------------------------------------------------------------------------------------------------------------------
 FUNCTION GET_COUNT_OPL_NAZ(pAppendixID NUMBER) RETURN NUMBER IS
  -- created by deemaric 25.02.2010
  -- кол-во оплаченных услуг
  v_count NUMBER;
 BEGIN

  SELECT NVL(SUM(NVL(BU.FN_USLUGCOUNT, 0)), 0) PSUM
    INTO v_count
    FROM ASU.TBILL B, ASU.TBILL_USLUG BU
   WHERE B.FK_APPENDIX = pAppendixID
     AND B.FK_ID = BU.FK_BILL
     AND B.FP_PAY = 1;

  RETURN v_count;
 END;
 
 PROCEDURE UPDATE_FOR_PLAT_DOGOVOR(pDogovorID IN NUMBER,
                               pBeginDate IN DATE,
                               pSOS IN NUMBER,  
                               pKKM IN VARCHAR2,
                               pCHECK IN VARCHAR2,
                               pKO IN VARCHAR2,
                               pSMIDID IN NUMBER,
                               pTYPEPAY IN NUMBER) IS
 --created by O.Kashira 13072010
 BEGIN
   IF pSOS = 0 THEN -- Оплатили договор 
     UPDATE ASU.TPLAT_DOGOVOR 
     SET FD_BEGIN = pBeginDate,
         FP_SOS = pSOS,
         FC_KKM = pKKM,
         FC_CHECK = pCHECK,
         FC_KO = pKO,
         FD_PAY = SYSDATE,
         FP_TYPEPAY = pTYPEPAY
     WHERE FK_ID = pDogovorID;
  ELSIF pSOS = 1 THEN -- Аннулировали договор
    UPDATE ASU.TPLAT_DOGOVOR 
    SET -- FD_BEGIN = pBeginDate, 
        FP_SOS = pSOS,
        FC_KKM = pKKM,
        FC_CHECK = pCHECK,
        FC_KO = pKO,
        FD_CANCEL =  SYSDATE,
        FK_SMIDID = pSMIDID
     WHERE FK_ID = pDogovorID;
  END IF;   
 END;      
 
 
  FUNCTION GET_PLATDOG_NUM(pNazID NUMBER) RETURN VARCHAR2 IS
   -- Created by Kashira O.A. 08.08.2013
   -- Если назначения связано с платной услугой - возвращается номер/а договора
   v_DOG_NUM VARCHAR2(200) DEFAULT '';
 BEGIN
   SELECT 
     TRIM(',' FROM TRIM(SYS.SYS_XMLAGG(XMLELEMENT(COL, FC_NUM || ', ')).EXTRACT('/ROWSET/COL/text()').GETSTRINGVAL()))
   INTO v_DOG_NUM     
   FROM
   (SELECT DISTINCT D.FC_NUM as FC_NUM
    FROM (SELECT n.FK_ID, n.FC_NAME, NH.FK_HEALID as FK_HEALID
          FROM ASU.VNAZ n, ASU.TNAZHEAL NH
                        WHERE n.FK_ID=pNazID
                              AND NH.FK_NAZID (+)= n.FK_ID) NAZ,
               ASU.TAPPENDIX     a,
               ASU.TAPPENDIX_NAZ anz,
               -- ASU.TPLAT_USLUG   pu,
               ASU.TPLAT_DOGOVOR d
    WHERE anz.FK_APPENDIXID = a.FK_ID(+)
          AND NAZ.FK_ID = anz.FK_NAZID(+)
          AND NAZ.FK_HEALID = anz.FK_HEAL(+) 
          -- AND anz.FK_NAZID = pu.FK_NAZ(+)
          -- AND anz.FK_HEAL = pu.FK_HEAL(+)
          AND a.FK_DOGOVOR = d.FK_ID(+));
    RETURN v_DOG_NUM;          
 END;  
 

 FUNCTION IS_NAZ_PAYED(pNazID NUMBER) RETURN NUMBER IS
  -- Created by Kashira O.A. 08.08.2013
  -- Возвращает признак оплаты назначения 0-не оплачена, 1-оплачена
   v_IS_OPL  NUMBER(1) DEFAULT 0;
 BEGIN
   SELECT DECODE(SUM(NVL(PU.FP_PLATSOS,0)),0,0,NULL,0,1) INTO v_IS_OPL 
      FROM (SELECT n.FK_ID, n.FC_NAME, NH.FK_HEALID as FK_HEALID
           FROM ASU.VNAZ n, ASU.TNAZHEAL NH
           WHERE n.FK_ID=pNazID
                 AND NH.FK_NAZID (+)= n.FK_ID) NAZ,
           ASU.TAPPENDIX     a,
           ASU.TAPPENDIX_NAZ anz,
           ASU.TPLAT_USLUG   pu
     WHERE anz.FK_APPENDIXID = a.FK_ID(+)
           AND NAZ.FK_ID = anz.FK_NAZID(+)
           AND NAZ.FK_HEALID = anz.FK_HEAL(+) 
           AND anz.FK_NAZID = pu.FK_NAZ(+)
           AND anz.FK_HEAL = pu.FK_HEAL(+);
    RETURN v_IS_OPL;
 END; 


 FUNCTION IS_NAZ_IN_PLATAPP(pNazID NUMBER) RETURN NUMBER IS
  -- Created by Kashira O.A. 08.08.2013
  -- Возвращает признак нахождения назначения в приложении на платные услуги 0-нет в приложении, 1-в приложении
   v_IS_NAZ_APP  NUMBER(1) DEFAULT 0;
 BEGIN
   SELECT DECODE(SUM(DECODE(pu.FK_ID,NULL,0,1)),0,0,NULL,0,1) INTO v_IS_NAZ_APP 
      FROM (SELECT n.FK_ID, n.FC_NAME, NH.FK_HEALID as FK_HEALID
           FROM ASU.VNAZ n, ASU.TNAZHEAL NH
           WHERE n.FK_ID=pNazID
                 AND NH.FK_NAZID (+)= n.FK_ID) NAZ,
           ASU.TAPPENDIX     a,
           ASU.TAPPENDIX_NAZ anz,
           ASU.TPLAT_USLUG   pu
     WHERE anz.FK_APPENDIXID = a.FK_ID(+)
           AND NAZ.FK_ID = anz.FK_NAZID(+)
           AND NAZ.FK_HEALID = anz.FK_HEAL(+) 
           AND anz.FK_NAZID = pu.FK_NAZ(+)
           AND anz.FK_HEAL = pu.FK_HEAL(+);
    RETURN v_IS_NAZ_APP;
 END; 


END;
/

SHOW ERRORS;


