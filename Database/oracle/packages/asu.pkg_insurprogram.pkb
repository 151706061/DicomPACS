DROP PACKAGE BODY ASU.PKG_INSURPROGRAM
/

--
-- PKG_INSURPROGRAM  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_INSURPROGRAM" IS

  PROCEDURE ADD_HEAL_TO_PROGRAM(pFK_DOGOVOR NUMBER,
                                pFK_HEAL    NUMBER,
                                pFN_COST    NUMBER,
                                pFN_PAYPCNT NUMBER DEFAULT 100) IS
    -- Created 19082008 by Spasskiy
    -- добавляет услугу из справочника услуг в страховую программу
  BEGIN
    FOR c IN (SELECT 1
                FROM TINSUR_PROGRAM
               WHERE fk_dogovor = pFK_DOGOVOR
                 AND fk_heal = pFK_HEAL) LOOP
      RETURN;
    END LOOP;
    INSERT INTO TINSUR_PROGRAM
      (FK_DOGOVOR, FK_HEAL, FN_PAYPCNT)
    VALUES
      (pFK_DOGOVOR, pFK_HEAL, pFN_PAYPCNT);
    FOR c IN (SELECT fk_id, fd_begin, fd_end, fk_companyid
                FROM ASU.TINSUR_DOGOVOR
               WHERE fk_id = pFK_DOGOVOR) LOOP
      INSERT INTO THEAL_COST
        (FK_HEALID,
         FD_DATE1,
         FD_DATE2,
         FN_COST,
         FK_COMPANYID,
         FK_DOGOVORID)
      VALUES
        (pFK_HEAL,
         C.FD_BEGIN,
         C.FD_END,
         pFN_COST,
         C.FK_COMPANYID,
         pFK_DOGOVOR);
    END LOOP;
  END;

  PROCEDURE ADD_ALLHEAL_TO_PROGRAM(pFK_DOGOVOR NUMBER) IS
    -- Created 19082008 by Spasskiy
    -- добавляет все услуги из справочника услуг в страховую программу
  BEGIN
    FOR c IN (SELECT FK_ID
                FROM ASU.THEAL
               WHERE CONNECT_BY_ISLEAF = 1
              CONNECT BY PRIOR FK_ID = FK_PARENT
               START WITH NVL(FK_PARENT, 0) = 0) LOOP
      ADD_HEAL_TO_PROGRAM(pFK_DOGOVOR, C.FK_ID, TO_NUMBER(NULL));

    END LOOP;
  END;

  PROCEDURE DELETE_HEAL_FROM_PROGRAM(pFK_DOGOVOR NUMBER, pFK_HEAL NUMBER) IS
    -- Created 19082008 by Spasskiy
    -- удаляет услугу из справочника услуг в страховой программе
  BEGIN
    DELETE FROM TINSUR_PROGRAM
     WHERE FK_DOGOVOR = pFK_DOGOVOR
       AND FK_HEAL = pFK_HEAL;
    DELETE FROM THEAL_COST
     WHERE FK_DOGOVORID = pFK_DOGOVOR
       AND FK_HEALid = pFK_HEAL;
  END;

  PROCEDURE DELETE_ALLHEAL_FROM_PROGRAM(pFK_DOGOVOR NUMBER) IS
  BEGIN
    DELETE FROM ASU.TINSUR_PROGRAM WHERE FK_DOGOVOR = PFK_DOGOVOR;
    DELETE FROM ASU.THEAL_COST WHERE FK_DOGOVORID = PFK_DOGOVOR;
  END;

  FUNCTION GET_HEAL_COST(pHealid  NUMBER,
                         pDogovor NUMBER,
                         pDate    DATE DEFAULT SYSDATE) RETURN NUMBER IS
    -- Created 19082008 by Spasskiy
    -- Возвращает стоимость услуги по  программе
    nRes NUMBER;
  BEGIN
    FOR C IN (SELECT MAX(FN_COST) CNT
                FROM ASU.THEAL_COST
               WHERE THEAL_COST.FK_HEALID = pHealid
                 AND pDate BETWEEN THEAL_COST.FD_DATE1 AND
                     NVL(THEAL_COST.FD_DATE2, SYSDATE)
                 AND THEAL_COST.FK_DOGOVORID = pDogovor) LOOP
      nRes := C.CNT;
    END LOOP;
    RETURN NVL(nRes, 0);
  END;

  PROCEDURE SET_COST(pFK_HEAL    NUMBER,
                     pFK_DOGOVOR NUMBER,
                     pFN_COST    NUMBER,
                     pFN_PCNT    NUMBER,
                     pDATE       DATE) IS
    -- Created 20082008 by Spasskiy
    -- Устанавливает цену на услугу по программе
  BEGIN
    UPDATE ASU.TINSUR_PROGRAM
       SET FN_PAYPCNT = pFN_PCNT
     WHERE FK_HEAL = pFK_HEAL
       AND FK_DOGOVOR = pFK_DOGOVOR;
    FOR C IN (SELECT FK_ID, FD_DATE1, FD_DATE2, FK_COMPANYID
                FROM ASU.THEAL_COST
               WHERE FK_HEALID = pFK_HEAL
                 AND FK_DOGOVORID = pFK_DOGOVOR
               ORDER BY FD_DATE1 DESC) LOOP

      IF pDATE = C.FD_DATE1 THEN
        UPDATE THEAL_COST SET FN_COST = pFN_COST WHERE FK_ID = C.FK_ID;
      ELSIF pDATE > C.FD_DATE1 THEN
        INSERT INTO THEAL_COST
          (FK_HEALID,
           FD_DATE1,
           FD_DATE2,
           FN_COST,
           FK_COMPANYID,
           FK_DOGOVORID)
        VALUES
          (pFK_HEAL,
           pDATE,
           C.FD_DATE2,
           pFN_COST,
           C.FK_COMPANYID,
           pFK_DOGOVOR);
        UPDATE THEAL_COST SET FD_DATE2 = pDATE WHERE FK_ID = C.FK_ID;
      END IF;
      EXIT;
    END LOOP;

  END;

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
                              pFD_EXTENSION     DATE DEFAULT NULL) IS
    --Created 19082008 by Spasskiy
    -- обновляет информацию о договоре + связанные полиса + цены на услуги
  BEGIN
    FOR c IN (SELECT * FROM asu.tinsur_dogovor WHERE fk_id = pFK_DOGOVORID) LOOP
      UPDATE theal_cost
         SET fk_companyid = c.fk_companyid
       WHERE fk_dogovorid = pFK_DOGOVORID;
       
      UPDATE ASU.TINSURDOCS
         SET FK_COMPANYID = pFK_COMPANYID,
             FD_BEGIN     = pFD_BEGIN,
             FK_TYPEDOCID = c.fk_typedoc /*,
                         FD_END       = pFD_END*/
       WHERE FK_DOGOVORID = pFK_DOGOVORID;
       
      /*added by Spasskiy  для возможности откреплять человека от программы*/
      FOR INS IN (SELECT FK_ID, FD_END
                    FROM TINSURDOCS
                   WHERE FK_DOGOVORID = PFK_DOGOVORID) LOOP
        IF NVL(INS.FD_END, SYSDATE) = NVL(C.FD_END, SYSDATE) THEN
          UPDATE ASU.TINSURDOCS
             SET FD_END = pFD_END
           WHERE TINSURDOCS.FK_ID = INS.FK_ID;
        END IF;
      END LOOP;
      
      UPDATE theal_cost
         SET fd_date1 = pFD_BEGIN
       WHERE fk_dogovorid = pFK_DOGOVORID
         AND fd_date1 = c.fd_begin;
         
      UPDATE theal_cost
         SET fd_date2 = pFD_END
       WHERE fk_dogovorid = pFK_DOGOVORID
         AND nvl(fd_date2, trunc(SYSDATE)) = nvl(c.fd_end, trunc(SYSDATE));
    END LOOP;
    UPDATE ASU.TINSUR_DOGOVOR
       SET FK_COMPANYID     = pFK_COMPANYID,
           FD_BEGIN         = pFD_BEGIN,
           FD_END           = pFD_END,
           FC_NUMBER        = pFC_NUMBER,
           FN_LIMIT_PAC     = pFN_LIMIT_PAC,
           FN_LIMIT_DOGOVOR = pFN_LIMIT_DOGOVOR,
           FN_DISCOUNT      = pFN_DISCOUNT,           
           FC_COMMENT       = pFC_COMMENT,
           FK_TYPEDOC       = pFK_TYPEDOC,
           FN_STATE         = pFN_STATE,
           FN_LIMIT         = pFN_LIMIT,
           FD_EXTENSION     = pFD_EXTENSION
     WHERE FK_ID = pFK_DOGOVORID;
  END;

  PROCEDURE DO_DELETE_DOGOVOR(PFK_DOGOVOR NUMBER) IS
    --Created 19082008 by Spasskiy
    -- удаляет договор и все напоминания о нем
  BEGIN
    DELETE FROM ASU.TINSUR_DOGOVOR WHERE FK_ID = PFK_DOGOVOR;
    DELETE FROM ASU.THEAL_COST WHERE FK_DOGOVORID = PFK_DOGOVOR;
    DELETE FROM ASU.TINSUR_PROGRAM WHERE FK_DOGOVOR = PFK_DOGOVOR;
    DELETE FROM ASU.TINSURDOCS WHERE FK_DOGOVORID = PFK_DOGOVOR;
  END;

  PROCEDURE ADD_PEOPLE_TO_DOGOVOR(pDOGOVOR NUMBER,
                                  pPEPLID  NUMBER,
                                  pFC_SER  VARCHAR,
                                  pFC_NUM  VARCHAR) IS
    --Created 19082008 by Spasskiy
    -- добавляет чела к страховой программе = создается полис ДМС
  BEGIN
    FOR C IN (SELECT * FROM ASU.TINSUR_DOGOVOR WHERE FK_ID = pDOGOVOR) LOOP
      INSERT INTO TINSURDOCS
        (FK_PEPLID,
         FK_DOGOVORID,
         FK_TYPEDOCID,
         FD_BEGIN,
         FD_END,
         FC_SER,
         FC_NUM,
         FK_COMPANYID)
      VALUES
        (pPEPLID,
         pDOGOVOR,
         C.FK_TYPEDOC,
         /*(SELECT NVL(MAX(FK_ID), 2)
                     FROM ASU.TTYPEDOC
                    WHERE FC_SYNONIM = 'DMS'),*/
         C.FD_BEGIN,
         C.FD_END,
         pFC_SER,
         nvl(pFC_NUM,
             'по договору №' || CAST(C.FC_NUMBER AS VARCHAR2(100))),
         --'по страховой программе',
         --CAST(C.FC_NUMBER AS VARCHAR2(100)),
         C.FK_COMPANYID);
    END LOOP;
  END;

  PROCEDURE DELETE_PEOPLE_FROM_DOGOVOR(pDOGOVOR NUMBER, pPEPLID NUMBER) IS
  BEGIN
    DELETE FROM TINSURDOCS
     WHERE FK_dogovorid = pDOGOVOR
       AND fk_peplid = pPEPLID;

  END;

  FUNCTION GET_HEAL_COST_DEFAULT(pFK_HEALID NUMBER,
                                 pCOMPANYID NUMBER,
                                 pDATE      DATE DEFAULT SYSDATE)
    RETURN NUMBER IS
    nTmp NUMBER;
    -- Created 19082008 by Spasskiy
    /* возращает цену по умолчанию : приоритет
     1. цена для организации
     2. цена установленая самим ЛПУ
    */
  BEGIN
    FOR c IN (SELECT hc.fn_cost
                FROM asu.theal_cost hc,
                     (SELECT fk_id, 1 typ
                        FROM asu.tcompany
                       WHERE fk_id = pCOMPANYID
                      UNION ALL
                      SELECT fk_id, 2 typ
                        FROM asu.tcompany
                       WHERE fk_id = ASU.GET_DEF_STRAH_COMP) org
               WHERE hc.fk_companyid = org.fk_id
                 AND hc.fk_healid = pFK_HEALID
                 AND pDate BETWEEN HC.FD_DATE1 AND NVL(HC.FD_DATE2, SYSDATE)
               ORDER BY org.typ DESC) LOOP
      nTmp := c.fn_cost;
      EXIT;
    END LOOP;
    RETURN nvl(ntmp, 0);
  END;

  FUNCTION GET_PERCENT_INSUR_SMID(pInsurId NUMBER, pSmid NUMBER)
    RETURN NUMBER IS
    --by A.Nakorjakov 210808
    --процент оплаты смида по программе
    v_res NUMBER;
  BEGIN
    IF NOT (pInsurId > 0) THEN
      RETURN 0;
    END IF;
    SELECT NVL(MAX(ip.fn_paypcnt), 0)
      INTO v_res
      FROM asu.tinsurdocs i, asu.tinsur_program ip, asu.theal_smid hs
     WHERE i.fk_dogovorid = ip.fk_dogovor
       AND ip.fk_heal = hs.fk_heal
       AND hs.fk_smid = pSmid
       AND i.fk_id = pInsurId;
    RETURN v_res;
  END;

  FUNCTION IS_SMID_IN_INSURPROGRAMM(pInsurID NUMBER, pSmid NUMBER)
    RETURN NUMBER IS
    --by A.Nakorjakov 210808
    --смид входит в программу полисуимеет пипл связку с программой по смиду?: 1 - да; 0 - нет
    v_cnt NUMBER;
    v_res NUMBER;
  BEGIN
    IF NOT (pInsurId > 0) THEN
      RETURN 0;
    END IF;
    SELECT COUNT(1)
      INTO v_cnt
      FROM asu.tinsurdocs i, asu.tinsur_program ip, asu.theal_smid hs
     WHERE i.fk_dogovorid = ip.fk_dogovor
       AND ip.fk_heal = hs.fk_heal
       AND hs.fk_smid = pSmid
       AND i.fk_id = pInsurID;
    IF v_cnt > 0 THEN
      v_res := 1;
    ELSE
      v_res := 0;
    END IF;
    RETURN v_res;
  END;

END;
/

SHOW ERRORS;


