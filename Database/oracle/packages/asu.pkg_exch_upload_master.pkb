DROP PACKAGE BODY ASU.PKG_EXCH_UPLOAD_MASTER
/

--
-- PKG_EXCH_UPLOAD_MASTER  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU.pkg_exch_upload_master IS

  -- Created 20080401 by Linnikov
  -- Updated 20080416 by Linnikov
  -- Updated 20090824 by Deemaric http://192.168.1.2:15000/redmine/issues/show/1151
  -- Updates 20100113 by Linnikov
  -- Updates 20100913 by Efimov V.A. Уточнил к представителя МИЦ (Конева Людмила) больше нет необходимости добавлять нолик к диагнозам
  PROCEDURE FILL_FIRST_TABLE(pBeg DATE, pEnd DATE, pPoly IN NUMBER) IS
    -- Заполняем временную таблицу
    vDBNAME varchar2(2);
  BEGIN
    SELECT ASU.PKG_SMINI.READSTRING('CONFIG', 'DB_NAME', 'H') INTO vDBNAME FROM DUAL;
    if vDBNAME = 'H' then
      FILL_FIRST_TABLE_H(pBeg, pEnd, pPoly);
    else
      if vDBNAME = 'T' then
        FILL_FIRST_TABLE_T(pBeg, pEnd, pPoly);
      else
        FILL_FIRST_TABLE_NOT_H(pBeg, pEnd, pPoly);
      end if;
    end if;
  END;

  PROCEDURE FILL_FIRST_TABLE_H(pBeg DATE, pEnd DATE, pPoly IN NUMBER) IS
    -- Заполняем временную таблицу
  BEGIN
    IF pPoly = 2 or pPoly = 0 THEN
      -- Если только СТАЦИОНАР
      INSERT INTO TEXCHUPLOAD_TMP
        SELECT PI.FK_PACID,
               I.FK_ID,
               I.FK_COMPANYID,
               (SELECT MAX(C.FK_REGIONID) FROM TCOMPANY C WHERE C.FK_ID = I.FK_COMPANYID) FK_REGIONID,
               -- Efimov V.A. 20100903 Добавил бюджетные случаи (т.е. без компании) http://192.168.1.2:15000/redmine/issues/show/6737
               --C.FK_REGIONID,
               NULL,
               K.FK_PEPLID,
               0,
               NULL
          FROM ASU.TPAC_INSURANCE PI,
               ASU.TINSURDOCS I,
               (SELECT FK_PACID
                  FROM ASU.TSROKY S
                 WHERE S.FK_PRYB IN (3, 7)
                   AND TRUNC(S.FD_DATA1) BETWEEN pBeg AND pEnd
                --               AND TRUNC(S.FD_DATA1) BETWEEN SYSDATE - 30 AND SYSDATE
                 GROUP BY FK_PACID) SR,
               (SELECT FK_ID
                  FROM TUSLVID
                CONNECT BY PRIOR FK_ID = FK_OWNERID
                -- Changed by Spasskiy S.N. 16102009 - Добавил ДС при стационаре
                -- START WITH FK_ID IN (DOC_ISTOR_ROD, DOC_IB, DOC_NOVOROZHD)
                 START WITH FK_ID IN (DOC_ISTOR_ROD, DOC_IB, DOC_NOVOROZHD, ASU.DOC_IBDS_STAC)) U,
               TKARTA K,
               --           TCOMPANY C,
               tedit_statkart ts -- deemaric add 24.08.2009  http://192.168.1.2:15000/redmine/issues/show/1151
         WHERE PI.FK_INSURDOCID = I.FK_ID
           AND PI.FK_PACID = SR.FK_PACID
           AND K.FK_USLVIDID = U.FK_ID
           AND PI.FK_PACID = K.FK_ID
              --       AND C.FK_ID = I.FK_COMPANYID
           AND ts.fk_pacid = k.fk_id
           AND ts.fl_state = 1
           AND ts.fd_date = (SELECT MAX(fd_date) FROM tedit_statkart WHERE fk_pacid = k.fk_id); -- статкарта подписана
    end if;

    IF pPoly = 2 or pPoly = 1 THEN
      -- Если только ПОЛИКЛИНИКА
      INSERT INTO TEXCHUPLOAD_TMP
        SELECT PI.FK_PACID,
               I.FK_ID,
               I.FK_COMPANYID,
               (SELECT MAX(C.FK_REGIONID) FROM ASU.TCOMPANY C WHERE C.FK_ID = I.FK_COMPANYID) FK_REGIONID,
               NULL,
               K.FK_PEPLID,
               1,
               NULL
          FROM ASU.TPAC_INSURANCE PI,
               ASU.TINSURDOCS I,
               (SELECT FK_PACID
                  FROM ASU.TSROKY S
                 WHERE S.FK_PRYB IN (3, 7)
                   AND TRUNC(S.FD_DATA1) BETWEEN pBeg AND pEnd
                 GROUP BY FK_PACID) SR,
               asu.TKARTA K,
               --           asu.TCOMPANY       C,
               asu.tedit_statkart ts -- deemaric add 24.08.2009  http://192.168.1.2:15000/redmine/issues/show/1151
         WHERE PI.FK_INSURDOCID = I.FK_ID
           AND PI.FK_PACID = SR.FK_PACID
              --       AND K.FK_ID NOT IN (SELECT FK_AMBID FROM asu.TAMBTALON)
           AND K.FK_USLVIDID NOT IN (SELECT FK_ID
                                       FROM asu.TUSLVID
                                     CONNECT BY PRIOR FK_ID = FK_OWNERID
                                      START WITH FK_ID IN (asu.DOC_ISTOR_ROD, asu.DOC_IB, asu.DOC_NOVOROZHD, ASU.DOC_IBDS_STAC))
           AND PI.FK_PACID = K.FK_ID
              --       AND C.FK_ID = I.FK_COMPANYID
           AND ts.fk_pacid = k.fk_id
           AND ts.fl_state = 1 -- статкарта подписана
           AND ts.fd_date = (SELECT MAX(fd_date) FROM asu.tedit_statkart WHERE fk_pacid = k.fk_id)
        UNION ALL
        SELECT K.FK_ID,
               I.FK_ID,
               I.FK_COMPANYID,
               (SELECT MAX(C.FK_REGIONID) FROM ASU.TCOMPANY C WHERE C.FK_ID = I.FK_COMPANYID) FK_REGIONID,
               T.FK_ID,
               K.FK_PEPLID,
               1,
               NULL
          FROM ASU.TINSURDOCS I,
               (SELECT TKARTA.FK_ID, FK_PEPLID, FC_FAM, FC_IM, FC_OTCH
                  FROM asu.TKARTA --, tedit_statkart ts -- Efimov V.A. 20100602 E это поциенты приёмного отделения которым отказано в госпитализации, для них не создаётся статкарта, только амбталон http://94.28.48.98:15000/redmine/issues/show/5372
                UNION ALL
                SELECT A.FK_ID, A.FK_PEPLID, A.FC_FAM, A.FC_IM, A.FC_OTCH
                  FROM asu.TAMBULANCE A, asu.TDOCOBSL D
                 WHERE A.FK_DOCOBSL = D.FK_ID
                      --             Commented 20100126 by Linnikov (диспансерные случаи теперь тоже надо отображать)
                   AND D.FK_VIDDOCID <> DOC_DISP_DOP) K,
               --           asu.TCOMPANY C,
               asu.TAMBTALON T
         WHERE T.FK_INSURANCEID = I.FK_ID
              --       AND C.FK_ID = I.FK_COMPANYID
           AND K.FK_ID = T.FK_AMBID
           AND T.FN_SOS = 1
           AND TRUNC(T.FD_CLOSED) BETWEEN pBeg AND pEnd;
    END IF;
  END;

  PROCEDURE FILL_FIRST_TABLE_NOT_H(pBeg DATE, pEnd DATE, pPoly IN NUMBER) IS
    -- Заполняем временную таблицу
  BEGIN
    IF pPoly = 2 or pPoly = 0 THEN
      -- Если только СТАЦИОНАР
      INSERT INTO TEXCHUPLOAD_TMP
        SELECT PI.FK_PACID, I.FK_ID, I.FK_COMPANYID, C.FK_REGIONID, NULL, K.FK_PEPLID, 0, NULL
          FROM ASU.TPAC_INSURANCE PI,
               ASU.TINSURDOCS I,
               (SELECT FK_PACID
                  FROM ASU.TSROKY S
                 WHERE S.FK_PRYB IN (3, 7)
                   AND TRUNC(S.FD_DATA1) BETWEEN pBeg AND pEnd
                --               AND TRUNC(S.FD_DATA1) BETWEEN SYSDATE - 30 AND SYSDATE
                 GROUP BY FK_PACID) SR,
               (SELECT FK_ID
                  FROM TUSLVID
                CONNECT BY PRIOR FK_ID = FK_OWNERID
                -- Changed by Spasskiy S.N. 16102009 - Добавил ДС при стационаре
                -- START WITH FK_ID IN (DOC_ISTOR_ROD, DOC_IB, DOC_NOVOROZHD)
                 START WITH FK_ID IN (DOC_ISTOR_ROD, DOC_IB, DOC_NOVOROZHD, ASU.DOC_IBDS_STAC)) U,
               TKARTA K,
               TCOMPANY C,
               tedit_statkart ts -- deemaric add 24.08.2009  http://192.168.1.2:15000/redmine/issues/show/1151
         WHERE PI.FK_INSURDOCID = I.FK_ID
           AND PI.FK_PACID = SR.FK_PACID
           AND K.FK_USLVIDID = U.FK_ID
           AND PI.FK_PACID = K.FK_ID
           AND C.FK_ID = I.FK_COMPANYID
           AND ts.fk_pacid = k.fk_id
           AND ts.fl_state = 1
           AND ts.fd_date = (SELECT MAX(fd_date) FROM tedit_statkart WHERE fk_pacid = k.fk_id); -- статкарта подписана
    end if;

    IF pPoly = 2 or pPoly = 1 THEN
      -- Если только ПОЛИКЛИНИКА
      INSERT INTO TEXCHUPLOAD_TMP
        SELECT PI.FK_PACID, I.FK_ID, I.FK_COMPANYID, C.FK_REGIONID, NULL, K.FK_PEPLID, 1, NULL
          FROM ASU.TPAC_INSURANCE PI,
               ASU.TINSURDOCS I,
               (SELECT FK_PACID
                  FROM ASU.TSROKY S
                 WHERE S.FK_PRYB IN (3, 7)
                   AND TRUNC(S.FD_DATA1) BETWEEN pBeg AND pEnd
                --AND TRUNC(S.FD_DATA1) BETWEEN SYSDATE - 30 AND SYSDATE
                 GROUP BY FK_PACID) SR,
               -- U,
               TKARTA         K,
               TCOMPANY       C,
               tedit_statkart ts -- deemaric add 24.08.2009  http://192.168.1.2:15000/redmine/issues/show/1151
         WHERE PI.FK_INSURDOCID = I.FK_ID
           AND PI.FK_PACID = SR.FK_PACID
              --       AND K.FK_ID NOT IN (SELECT FK_AMBID FROM TAMBTALON)
           AND K.FK_USLVIDID NOT IN (SELECT FK_ID
                                       FROM TUSLVID
                                     CONNECT BY PRIOR FK_ID = FK_OWNERID
                                     -- Changed by Spasskiy S.N. 16102009 - Добавил ДС при стационаре
                                     --START WITH FK_ID IN (DOC_ISTOR_ROD, DOC_IB, DOC_NOVOROZHD)
                                      START WITH FK_ID IN (DOC_ISTOR_ROD, DOC_IB, DOC_NOVOROZHD, ASU.DOC_IBDS_STAC))
           AND PI.FK_PACID = K.FK_ID
           AND C.FK_ID = I.FK_COMPANYID
           AND ts.fk_pacid = k.fk_id
           AND ts.fl_state = 1 -- статкарта подписана
           AND ts.fd_date = (SELECT MAX(fd_date) FROM tedit_statkart WHERE fk_pacid = k.fk_id)
        UNION ALL
        SELECT K.FK_ID, I.FK_ID, I.FK_COMPANYID, C.FK_REGIONID, T.FK_ID, K.FK_PEPLID, 1, NULL
          FROM ASU.TINSURDOCS I,
               /* (SELECT FK_ID, FK_PEPLID, FC_FAM, FC_IM, FC_OTCH
                               FROM TKARTA
                             UNION ALL
                             SELECT A.FK_ID, A.FK_PEPLID, A.FC_FAM, A.FC_IM, A.FC_OTCH
                               FROM TAMBULANCE A, TDOCOBSL D
                              WHERE A.FK_DOCOBSL = D.FK_ID
                                AND D.FK_VIDDOCID <> DOC_DISP_DOP) K,*/ -- deemaric comment
               (SELECT TKARTA.FK_ID, FK_PEPLID, FC_FAM, FC_IM, FC_OTCH
                  FROM TKARTA --, tedit_statkart ts -- Efimov V.A. 20100602 E это поциенты приёмного отделения которым отказано в госпитализации, для них не создаётся статкарта, только амбталон http://94.28.48.98:15000/redmine/issues/show/5372
                --             WHERE ts.fk_pacid = TKARTA.fk_id
                --               AND ts.fl_state = 1 -- статкарта подписана
                --               AND ts.fd_date = (SELECT MAX(fd_date) FROM tedit_statkart WHERE fk_pacid = TKARTA.fk_id)
                UNION ALL
                SELECT A.FK_ID, A.FK_PEPLID, A.FC_FAM, A.FC_IM, A.FC_OTCH
                  FROM TAMBULANCE A, TDOCOBSL D
                 WHERE A.FK_DOCOBSL = D.FK_ID
                /* Commented 20100126 by Linnikov (диспансерные случаи теперь тоже надо отображать)
                                           AND D.FK_VIDDOCID <> DOC_DISP_DOP*/
                ) K,
               TCOMPANY C,
               TAMBTALON T
         WHERE T.FK_INSURANCEID = I.FK_ID
           AND C.FK_ID = I.FK_COMPANYID
           AND K.FK_ID = T.FK_AMBID
           AND T.FN_SOS = 1
              --       AND TRUNC(T.FD_CLOSED) BETWEEN SYSDATE - 200 AND SYSDATE
           AND TRUNC(T.FD_CLOSED) BETWEEN pBeg AND pEnd;
    END IF;
  END;

  PROCEDURE FILL_FIRST_TABLE_T(pBeg DATE, pEnd DATE, pPoly IN NUMBER) IS
    -- Заполняем временную таблицу
  BEGIN
    IF pPoly = 2 or pPoly = 0 THEN
      -- Если только СТАЦИОНАР
      INSERT INTO TEXCHUPLOAD_TMP
        SELECT PI.FK_PACID, I.FK_ID, I.FK_COMPANYID, C.FK_REGIONID, NULL, K.FK_PEPLID, 0, NULL
          FROM ASU.TPAC_INSURANCE PI,
               ASU.TINSURDOCS I,
               (SELECT FK_PACID
                  FROM ASU.TSROKY S
                 WHERE S.FK_PRYB IN (3, 7)
                   AND TRUNC(S.FD_DATA1) BETWEEN pBeg AND pEnd
                --               AND TRUNC(S.FD_DATA1) BETWEEN SYSDATE - 30 AND SYSDATE
                 GROUP BY FK_PACID) SR,
               (SELECT FK_ID
                  FROM TUSLVID
                CONNECT BY PRIOR FK_ID = FK_OWNERID
                -- Changed by Spasskiy S.N. 16102009 - Добавил ДС при стационаре
                -- START WITH FK_ID IN (DOC_ISTOR_ROD, DOC_IB, DOC_NOVOROZHD)
                 START WITH FK_ID IN (DOC_ISTOR_ROD, DOC_IB, DOC_NOVOROZHD, ASU.DOC_IBDS_STAC)) U,
               TKARTA K,
               TCOMPANY C,
               tedit_statkart ts -- deemaric add 24.08.2009  http://192.168.1.2:15000/redmine/issues/show/1151
         WHERE PI.FK_INSURDOCID = I.FK_ID
           AND PI.FK_PACID = SR.FK_PACID
           AND K.FK_USLVIDID = U.FK_ID
           AND PI.FK_PACID = K.FK_ID
           AND C.FK_ID(+) = I.FK_COMPANYID
           AND ts.fk_pacid = k.fk_id
           AND ts.fl_state = 1
           AND ts.fd_date = (SELECT MAX(fd_date) FROM tedit_statkart WHERE fk_pacid = k.fk_id); -- статкарта подписана
    END IF;

    IF pPoly = 2 or pPoly = 1 THEN
      -- Если только ПОЛИКЛИНИКА
      INSERT INTO TEXCHUPLOAD_TMP
        SELECT PI.FK_PACID, I.FK_ID, I.FK_COMPANYID, C.FK_REGIONID, NULL, K.FK_PEPLID, 1, NULL
          FROM ASU.TPAC_INSURANCE PI,
               ASU.TINSURDOCS I,
               (SELECT FK_PACID
                  FROM ASU.TSROKY S
                 WHERE S.FK_PRYB IN (3, 7)
                   AND TRUNC(S.FD_DATA1) BETWEEN pBeg AND pEnd
                --AND TRUNC(S.FD_DATA1) BETWEEN SYSDATE - 30 AND SYSDATE
                 GROUP BY FK_PACID) SR,
               -- U,
               TKARTA         K,
               TCOMPANY       C,
               tedit_statkart ts -- deemaric add 24.08.2009  http://192.168.1.2:15000/redmine/issues/show/1151
         WHERE PI.FK_INSURDOCID = I.FK_ID
           AND PI.FK_PACID = SR.FK_PACID
              --       AND K.FK_ID NOT IN (SELECT FK_AMBID FROM TAMBTALON)
           AND K.FK_USLVIDID NOT IN (SELECT FK_ID
                                       FROM TUSLVID
                                     CONNECT BY PRIOR FK_ID = FK_OWNERID
                                     -- Changed by Spasskiy S.N. 16102009 - Добавил ДС при стационаре
                                     --START WITH FK_ID IN (DOC_ISTOR_ROD, DOC_IB, DOC_NOVOROZHD)
                                      START WITH FK_ID IN (DOC_ISTOR_ROD, DOC_IB, DOC_NOVOROZHD, ASU.DOC_IBDS_STAC))
           AND PI.FK_PACID = K.FK_ID
           AND C.FK_ID = I.FK_COMPANYID
           AND ts.fk_pacid = k.fk_id
           AND ts.fl_state = 1 -- статкарта подписана
           AND ts.fd_date = (SELECT MAX(fd_date) FROM tedit_statkart WHERE fk_pacid = k.fk_id)
        UNION ALL
        SELECT K.FK_ID, I.FK_ID, I.FK_COMPANYID, C.FK_REGIONID, T.FK_ID, K.FK_PEPLID, 1, NULL
          FROM ASU.TINSURDOCS I,
               (SELECT TKARTA.FK_ID, FK_PEPLID, FC_FAM, FC_IM, FC_OTCH
                  FROM TKARTA
                UNION ALL
                SELECT A.FK_ID, A.FK_PEPLID, A.FC_FAM, A.FC_IM, A.FC_OTCH FROM TAMBULANCE A, TDOCOBSL D WHERE A.FK_DOCOBSL = D.FK_ID) K,
               TCOMPANY C,
               TAMBTALON T
         WHERE T.FK_INSURANCEID = I.FK_ID
           AND C.FK_ID(+) = I.FK_COMPANYID
           AND K.FK_ID = T.FK_AMBID
           AND T.FN_SOS = 1
           AND TRUNC(T.FD_CLOSED) BETWEEN pBeg AND pEnd;
    END IF;
  END;

  PROCEDURE FILL_ADR_FIRST_TABLE IS
  BEGIN
    UPDATE TEXCHUPLOAD_TMP T SET FK_ADRID = (SELECT MAX(FK_ID) FROM TADRESS WHERE FK_PACID = T.FK_PEPLID);
  END;

  PROCEDURE ADD_ROW_ADR_FIRST_TABLE(pPacid IN NUMBER) IS
  BEGIN
    UPDATE TEXCHUPLOAD_TMP T SET FK_ADRID = (SELECT MAX(FK_ID) FROM TADRESS WHERE FK_PACID = T.FK_PEPLID) WHERE T.FK_PACID = pPacid;
  END;

  PROCEDURE CLEAR_FIRST_TABLE IS
  BEGIN
    DELETE FROM TEXCHUPLOAD_TMP;
  END;

  PROCEDURE CUT_FIRST_TABLE(pregion IN NUMBER, pcompany IN NUMBER) IS
    vDBNAME varchar2(2);
  BEGIN
    SELECT ASU.PKG_SMINI.READSTRING('CONFIG', 'DB_NAME', 'H') INTO vDBNAME FROM DUAL;
    if vDBNAME = 'H' then
      CUT_FIRST_TABLE_H(pregion, pcompany);
    else
      if vDBNAME = 'T' then
        CUT_FIRST_TABLE_T(pregion, pcompany);
      else
        CUT_FIRST_TABLE_NOT_H(pregion, pcompany);
      end if;
    end if;
  END;

  PROCEDURE CUT_FIRST_TABLE_H(pregion IN NUMBER, pcompany IN NUMBER) IS
  BEGIN
    IF pregion = -2 THEN
      -- Иногородние
      DELETE FROM TEXCHUPLOAD_TMP
       WHERE (FK_REGIONID IS NOT NULL)
         AND (FK_REGIONID = (SELECT NVL(MAX(FK_ID), 0) FROM ASU.TREGION WHERE FL_DEFAULT = 1) OR
             (FK_COMPANYID is not null and FK_COMPANYID NOT IN (SELECT FK_ID FROM TCOMPANY CONNECT BY PRIOR FK_ID = FK_OWNER START WITH FK_ID = pcompany)));
    ELSE
      DELETE FROM TEXCHUPLOAD_TMP
       WHERE (FK_REGIONID IS NOT NULL)
         AND (FK_REGIONID <> pregion OR
             (FK_COMPANYID is not null and FK_COMPANYID NOT IN (SELECT FK_ID FROM TCOMPANY CONNECT BY PRIOR FK_ID = FK_OWNER START WITH FK_ID = pcompany)));
    END IF;
  END;

  PROCEDURE CUT_FIRST_TABLE_T(pregion IN NUMBER, pcompany IN NUMBER) IS
  BEGIN
    IF pregion = -2 THEN
      -- Иногородние
      DELETE FROM TEXCHUPLOAD_TMP
       WHERE (FK_REGIONID IS NOT NULL)
         AND (FK_REGIONID = (SELECT NVL(MAX(FK_ID), 0) FROM ASU.TREGION WHERE FL_DEFAULT = 1) OR
             (FK_COMPANYID is not null and FK_COMPANYID NOT IN (SELECT FK_ID FROM TCOMPANY CONNECT BY PRIOR FK_ID = FK_OWNER START WITH FK_ID = pcompany)));
    ELSE
      DELETE FROM TEXCHUPLOAD_TMP
       WHERE (FK_REGIONID IS NOT NULL)
         AND (FK_REGIONID <> pregion OR
             (FK_COMPANYID is not null and FK_COMPANYID NOT IN (SELECT FK_ID FROM TCOMPANY CONNECT BY PRIOR FK_ID = FK_OWNER START WITH FK_ID = pcompany)));
    END IF;
  END;

  PROCEDURE CUT_FIRST_TABLE_NOT_H(pregion IN NUMBER, pcompany IN NUMBER) IS
  BEGIN
    IF pregion = -2 THEN
      -- Иногородние
      DELETE FROM TEXCHUPLOAD_TMP
       WHERE FK_REGIONID = (SELECT NVL(MAX(FK_ID), 0) FROM ASU.TREGION WHERE FL_DEFAULT = 1)
          OR FK_COMPANYID NOT IN (SELECT FK_ID FROM TCOMPANY CONNECT BY PRIOR FK_ID = FK_OWNER START WITH FK_ID = pcompany);
    ELSE
      DELETE FROM TEXCHUPLOAD_TMP
       WHERE FK_REGIONID <> pregion
          OR FK_COMPANYID NOT IN (SELECT FK_ID FROM TCOMPANY CONNECT BY PRIOR FK_ID = FK_OWNER START WITH FK_ID = pcompany);
    END IF;
  END;

  PROCEDURE FILL_LAST_TABLE_ROW(pfk_pacid IN NUMBER, pfk_talonid IN NUMBER, pfk_peplid IN NUMBER, pfk_companyid IN NUMBER, pfp_poly IN NUMBER) IS
    -- Created 20080425 by Linnikov
    -- Функция добавляет строку во временную таблицу, которая используется в модуле выгрузки
    -- Modified 20100121 by Linnikov (Сделал заполнение TEXCHUPLOAD_MOVE)
    -- Modified 20100122 by Linnikov (Сделал заполнение TEXCHUPLOAD_MOVE_BED)
    vOmsID        NUMBER;
    vInFoms       NUMBER;
    vSmkIDp       NUMBER;
    vPID          NUMBER;
    vShortAdr     VARCHAR2(250);
    vRegSrah      VARCHAR2(250);
    vMedspecCount NUMBER;

    -- Поля добавлены в связи с задачей http://84.51.195.172:15000/redmine/issues/12605
    vSotrID_S        NUMBER;
    vSotr_S          VARCHAR2(250);
    vTheirSpecID_S   NUMBER;
    vTheirSpecName_S VARCHAR2(255);

    vSotrID_E        NUMBER;
    vSotr_E          VARCHAR2(250);
    vTheirSpecID_E   NUMBER;
    vTheirSpecName_E VARCHAR2(255);

    vOtdelID_S NUMBER;
    vOtdel_S   VARCHAR2(100);
    vOtdelID_E NUMBER;
    vOtdel_E   VARCHAR2(100);
    vTalonID   NUMBER;
    -- Предварительные значения диагнозов
    vDSPriPostMain VARCHAR2(10);
    vDSNaOsmMain   VARCHAR2(10);
    vDSPriVypMain  VARCHAR2(10);
    vDSClinMain    VARCHAR2(10);
    vDSClinOsl     VARCHAR2(10);
    vDSPriVypOsl   VARCHAR2(10);
    vDSClinSoput   VARCHAR2(10);
    -- Beg added 20100114 by Linnikov
    vDSPatanatom VARCHAR2(10);
    -- Даты предварительных диагнозов
    vDSPriPostMainDT DATE;
    vDSNaOsmMainDT   DATE;
    --  vDSPriVypMainDT  DATE;
    --  SClinMainDT    DATE;
    vDSClinOslDT   DATE;
    vDSPriVypOslDT DATE;
    vDSClinSoputDT DATE;
    vDSPatanatomDT DATE;
    -- End added 20100114 by Linnikov
    -- Окончательные значения диагнозов
    vDS_SD VARCHAR2(10); -- Предварительный
    vDS_O  VARCHAR2(10); -- Осложнение
    vDS_C  VARCHAR2(10); -- Сопутствующий
    vDS_E  VARCHAR2(10); -- Заключительный
    vGZ_SMID_E NUMBER;
    -- Beg added 20100114 by Linnikov
    -- Даты окончательных диагнозов
    vDS_SDDT DATE;
    vDS_ODT  DATE;
    vDS_CDT  DATE;
    --  vDS_EDT  DATE;
    -- End added 20100114 by Linnikov
    -- ТОМПы
    --  vOsnTOMP VARCHAR2(10);
    --  vSopTOMP VARCHAR2(10);
    --  vOsnCOST NUMBER;
    -- Прочее
    vServPlace   VARCHAR2(100);
    vTypePlace   NUMBER;
    vIllKind     NUMBER;
    vIllKindName VARCHAR2(255);
    vExitus1     NUMBER;
    --  vExitus2     NUMBER;
    vExitus         NUMBER;
    vPL             NUMBER;
    vEXITUS_DOP_TAB VARCHAR2(255);
    vExitus_dop     NUMBER;
    vKladrID        NUMBER;
    vRegion         VARCHAR2(500);
    vRaion          VARCHAR2(500);
    vCity           VARCHAR2(500);
    vStreet         VARCHAR2(500);
    -- Beg Added 20090819
    vAgentStatus    NUMBER;
    vAgentSurname   VARCHAR2(30);
    vAgentFirstName VARCHAR2(20);
    vAgentPatrName  VARCHAR2(20);
    vAgentVDK       NUMBER;
    vAgentDocSer    VARCHAR2(10);
    vAgentDocNum    VARCHAR2(10);
    vAgentDateV     VARCHAR2(10);
    vAgentKem       VARCHAR2(80);
    -- End Added 20090819

    -- Beg Added 20100113
    vDispCardID      NUMBER;
    vDispDateS       DATE;
    vDispDia         VARCHAR2(10);
    vDispDateE       DATE;
    vDispCause       NUMBER(2);
    vDispDoctorS     NUMBER(5);
    vDispDoctorE     NUMBER(5);
    vDispLPU         NUMBER(4);
    vDispLpuName     VARCHAR2(100);
    vDB_NAME         VARCHAR2(10);
    vPROFMP_ID       asu.TEXCHUPLOAD_BIG_TMP.profmp_id%type;
    vEXT_PROFMP_NAME exch43.ttables.fc_name%type;
    vStrLastFK_SMID  Number;

    vN_UCH          asu.TEXCHUPLOAD_BIG_TMP.N_UCH%type;
    vTYPE_UCH       asu.TEXCHUPLOAD_BIG_TMP.TYPE_UCH%type;
    vDATE_START_UCH asu.TEXCHUPLOAD_BIG_TMP.DATE_START_UCH%type;
    vDATE_END_UCH   asu.TEXCHUPLOAD_BIG_TMP.DATE_END_UCH%type;

    -- End Added 20100113
    -- Cursor c_diag added 20100114 by Linnikov
    CURSOR c_diag(pac NUMBER, ds_type VARCHAR2, ds_vid VARCHAR2) IS
      SELECT TSMID.FK_MKB10, D.FD_DATE
        FROM TSMID, TDIAG D
       WHERE D.FK_PACID = pac
         AND D.FK_SMDIAGID = TSMID.FK_ID
         AND D.FP_TYPE = STAT.PKG_STATUTIL.GET_SMIDID(ds_type)
         AND D.FL_MAIN = STAT.PKG_STATUTIL.GET_SMIDID(ds_vid);
  BEGIN
    -- "Константы"
    SELECT ASU.PKG_SMINI.READSTRING('CONFIG', 'DB_NAME', 'H') INTO vDB_NAME FROM DUAL;
    -- ЗАПЛАТКА - не пытайтесь это понять и изменить ))
    IF pfk_talonid = 0 THEN
      vTalonID := NULL;
    ELSE
      vTalonID := pfk_talonid;
    END IF;
    -- Данные по диспансерному учету
    IF vTalonID IS NOT NULL THEN
      SELECT NVL(MAX(FK_DISPCARDID), 0) INTO vDispCardID FROM ASU.Tambtalon WHERE FK_ID = vTalonID;
    END IF;
    IF vDispCardID > 0 THEN
      -- Выборка данных по диспансерному учету
      SELECT trunc(Max(d.FD_OPEN)),
             trunc(Max(d.FD_CLOSE)),
             Max(s.fk_mkb10),
             EXCH43.PKG_EXCHANGE.GET_THEIR_ID(asu.GET_EIS_COMPANYID, 'VIDOUTD', 'TSMID', Max(d.fk_closereason)),
             EXCH43.PKG_EXCHANGE.GET_THEIR_ID(asu.GET_EIS_COMPANYID, 'DOCTOR', 'TSOTR', Max(d.fk_sotrid)),
             EXCH43.PKG_EXCHANGE.GET_THEIR_ID(asu.GET_EIS_COMPANYID, 'DOCTOR', 'TSOTR', Max(d.fk_closesotrid)),
             EXCH43.PKG_EXCHANGE.GET_THEIR_ID(asu.GET_EIS_COMPANYID, 'LPU', 'TCOMPANY', asu.get_current_lpu),
             max(tc.fc_name)
        INTO vDispDateS, vDispDateE, vDispDia, vDispCause, vDispDoctorS, vDispDoctorE, vDispLPU, vDispLPUName
        FROM asu.tdispcard d
        left join asu.tdiag td on td.fk_id = d.fk_diagmain
        left join asu.tsmid s on s.fk_id = td.fk_smdiagid
        left join (SELECT fc_name, 1 fn_connect FROM asu.tcompany WHERE fk_id = asu.get_current_lpu) tc on tc.fn_connect = decode(d.fk_id, null, null, 1)
       WHERE d.fk_id = vDispCardID;
    END IF;

    -- Подготовительный этап

    -- Выбираем часть, связанную с адресами СМК
    SELECT Max(C.FC_SHORT), ASU.GET_REGION(max(C.FK_REGIONID)) || ', ' || ASU.GET_TOWN(Max(C.FK_TOWNID))
      INTO vShortAdr, vRegSrah
      FROM ASU.TCOMPANY C
     WHERE FK_ID = pfk_companyid;
    -- Выбираем часть, связанную с ФОМС
    SELECT MAX(FK_ID), DECODE(NVL(MAX(OP.FK_ID), 0), 0, 0, 1), MAX(OP.SMK_ID_P), MAX(OP.PERSON_ID)
      INTO vOmsID, vInFoms, vSmkIDp, vPID
      FROM EXCH43.TOMS_PEOPLES OP
     WHERE OP.FK_PEOPLEID = pfk_peplid
       AND OP.GLOBAL_ID < 0;
    -- Из-за косяков с PID делаем
    vPID := EXCH43.GET_PID_BY_PEPLID(pfk_peplid);
    -- Выбираем специальность и ФИО врача
    IF vTalonID IS NOT NULL THEN
      --   SELECT MAX(NVL(FK_SOTRCLOSED, FK_SOTRID))
      SELECT MAX(FK_SOTRCLOSED) INTO vSotrID_E FROM TAMBTALON WHERE TAMBTALON.FK_ID = vTalonID;

      SELECT MAX(FK_SOTRID) INTO vSotrID_S FROM TAMBTALON WHERE TAMBTALON.FK_ID = vTalonID;
      --    vSotrID_S := vSotrID_E;

      SELECT MAX(ts.FC_FAM || ' ' || ts.FC_NAME || ' ' || ts.FC_OTCH), max(tod.fk_id), max(tod.fc_name)
        INTO vSotr_E, vOtdelID_E, vOtdel_E
        FROM LOGIN.TSOTR ts
       INNER JOIN login.totdel tod on tod.fk_id = ts.fk_otdelid
       WHERE ts.FK_ID = NVL(vSotrID_E, 0);
    ELSE
      select Max(DOCTOR_ID)
        into vSotrID_S
        from (SELECT t.DOCTOR_ID, t.N_MOVE, FIRST_VALUE(t.N_MOVE) OVER(ORDER BY t.N_MOVE ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) first_N_MOVE
                FROM (SELECT O.FK_ID PLACE_1,
                             nvl(lead(decode(i.fk_vrachid, 0, null, -1, null, i.fk_vrachid), 1, asu.GET_PACVRACH(pfk_pacid))
                                 over(partition by fk_srokID order by p.fd_data1, p.fk_id),
                                 r.fk_vrachid) DOCTOR_ID,
                             row_number() over(ORDER BY fd_data1, p.fk_id) - 1 N_MOVE
                        FROM asu.tperesel p, asu.troom r, asu.totdel o, asu.TIB i
                       WHERE p.fk_pacid = pfk_pacid
                         AND p.fk_palataid = r.fk_id
                         AND r.fk_otdelid = o.fk_id
                         and i.fk_pacid(+) = p.fk_pacid
                         and i.fn_num(+) = p.fk_id
                       ORDER BY p.fd_data1, p.fk_id) T
               WHERE place_1 NOT IN
                     (select tod.fk_id from login.totdel tod left join asu.troom tr on tr.fk_otdelid = tod.fk_id where upper(tr.fc_palata) like 'ПРИЕМН%'))
       where N_MOVE = first_N_MOVE;

      SELECT MAX(R.FK_OTDELID)
        INTO vOtdelID_S
        FROM TPERESEL P, TROOM R
       WHERE FK_PACID = pfk_pacid
         AND P.FK_PALATAID = R.FK_ID
         AND P.FK_ID = (select Max(fk_id)
                          from (SELECT FIRST_VALUE(p.FK_ID) OVER(PARTITION BY P.FK_PACID ORDER BY p.fd_data1, p.fk_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fk_id
                                  FROM asu.TPERESEL P
                                  left join TROOM R on R.FK_ID = P.FK_PALATAID
                                 WHERE P.FK_PACID = pfk_pacid
                                   and R.FK_OTDELID NOT IN (select tod.fk_id
                                                              from login.totdel tod
                                                              left join asu.troom tr on tr.fk_otdelid = tod.fk_id
                                                             where upper(tr.fc_palata) like 'ПРИЕМН%')));

      -- 20110801 Efimov V.A. Ранее брался не последний врач подписавший статкарту, а врач с максимальным FK_ID http://192.168.1.9/redmine/issues/12831
      select nvl(max(tes.FK_SOTRID), ASU.PKG_REGIST_PACFUNC.GET_PAC_VRACHID(PFK_PACID))
        INTO VSOTRID_E
        from (select LAST_VALUE(TES.FK_SOTRID) OVER(ORDER BY TES.FD_DATE, TES.FK_ID ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) FK_SOTRID
                FROM ASU.TEDIT_STATKART TES
               WHERE TES.FK_PACID = PFK_PACID
                 and TES.FL_STATE = 1) tes;

      SELECT MAX(ts.FC_FAM || ' ' || ts.FC_NAME || ' ' || ts.FC_OTCH) INTO vSotr_E FROM LOGIN.TSOTR ts WHERE ts.FK_ID = NVL(vSotrID_E, 0);

      SELECT MAX(R.FK_OTDELID)
        INTO vOtdelID_E
        FROM TPERESEL P, TROOM R
       WHERE FK_PACID = pfk_pacid
         AND P.FK_PALATAID = R.FK_ID
         AND P.FK_ID = (select Max(fk_id)
                          from (SELECT LAST_VALUE(p.FK_ID) OVER(PARTITION BY P.FK_PACID ORDER BY p.fd_data1, p.fk_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fk_id
                                  FROM TPERESEL P
                                  left join TROOM R on R.FK_ID = P.FK_PALATAID
                                 WHERE P.FK_PACID = pfk_pacid
                                   and R.FK_OTDELID NOT IN (select tod.fk_id
                                                              from login.totdel tod
                                                              left join asu.troom tr on tr.fk_otdelid = tod.fk_id
                                                             where upper(tr.fc_palata) like 'ПРИЕМН%')));

      SELECT max(tod.fc_name) INTO vOtdel_E FROM login.totdel tod WHERE tod.FK_ID = vOtdelID_E;
    END IF;

    SELECT MAX(FC_FAM || ' ' || FC_NAME || ' ' || FC_OTCH) INTO vSotr_S FROM LOGIN.TSOTR WHERE FK_ID = NVL(vSotrID_S, 0);

    -- Efimov V.A. 20100826 http://192.168.1.2:15000/redmine/issues/show/6593
    -- Для того чтобы исходники для СургутТравма и Ханты были одинаковыми добавлена константа GetVrachkab_naz_Medspec
    -- Если GetVrachkab_naz_Medspec = 0 то значение берётся из соответствия 'MEDSPEC' и 'TS_SPRAV' (СургутТравма),
    -- иначе из поля fk_medspec таблицы tvrachkab_naz (Ханты, настраивается в NazIspolRights.exe)
    -- Прежде такой механизм использовался только для выгрузки услуг,
    -- но теперь решено использовать его и для случаев, следующим образом:
    -- Выбираются все назначения случая относящиеся к врачу, после чего
    -- выбираются все специальности МИЦ сопоставленные с этими тапима назначений,
    -- еслибыло найдена всего одна сопоставленная специальность, то она
    -- и берётся для врача, если больше или меньше, то берётся из должности
    -- Всё это согласовано с Засименко
    IF ASU.GETVRACHKAB_NAZ_MEDSPEC = 0 THEN
      vMedspecCount := 0;
    ELSE
      SELECT COUNT(*), MAX(fk_medspec)
        INTO vMedspecCount, vTheirSpecID_E
        FROM (SELECT tn.fk_medspec
                FROM asu.vnaz vn
                LEFT JOIN asu.TVRACHKAB tk ON tk.fk_sotrid = nvl(vn.fk_vrachid, vn.fk_ispolid)
                LEFT JOIN ASU.TVRACHKAB_NAZ tn ON tn.fk_smid = vn.fk_smid
                                              AND tn.fk_sotrkabid = tk.fk_id
               WHERE vn.fk_pacid = decode(vTalonID, NULL, PFK_PACID, (SELECT MAX(tat.fk_ambid) FROM asu.tambtalon tat WHERE tat.fk_id = vTalonID))
                 AND nvl(vn.fk_vrachid, vn.fk_ispolid) = vSotrID_E
                 AND tn.fk_medspec IS NOT NULL
              -- Оказалось даже при такой проверки на вхождение в ветку протоколы время выгрузки увеличивается в десятки раз, так что проверка не используется
              --         AND (SELECT MAX(ts.fk_id) -- Лучше проверить на вхождение в ветку протоколы так, INNER JOIN тормозит
              --                     FROM asu.tsmid ts WHERE ts.fc_synonim = 'REPORTS'
              --                   CONNECT BY PRIOR ts.fk_owner = ts.fk_id
              --                    START WITH ts.fk_id = vn.fk_smid) IS NOT NULL
               GROUP BY tn.fk_medspec);

    END IF;

    IF vMedspecCount = 1 AND vTheirSpecID_E IS NOT NULL THEN
      vTheirSpecName_E := EXCH43.PKG_EXCHANGE.GET_THEIR_NAME_BY_ID(ASU.GET_EIS_COMPANYID, 'MEDSPEC', vTheirSpecID_E);
    ELSE
      SELECT NVL(MAX(TSOTR.FK_SPRAVID), 0) INTO vTheirSpecID_E FROM LOGIN.TSOTR WHERE TSOTR.FK_ID = NVL(vSotrID_E, 0);
      vTheirSpecID_E := EXCH43.PKG_EXCHANGE.GET_THEIR_ID(ASU.GET_EIS_COMPANYID, 'MEDSPEC', 'TS_SPRAV', vTheirSpecID_E);

      vTheirSpecName_E := EXCH43.PKG_EXCHANGE.GET_THEIR_NAME(ASU.GET_EIS_COMPANYID, 'MEDSPEC', 'TS_SPRAV', vTheirSpecID_E);
    end IF;

    IF ASU.GETVRACHKAB_NAZ_MEDSPEC = 0 THEN
      vMedspecCount := 0;
    ELSE
      SELECT COUNT(*), MAX(fk_medspec)
        INTO vMedspecCount, vTheirSpecID_S
        FROM (SELECT tn.fk_medspec
                FROM asu.vnaz vn
                LEFT JOIN asu.TVRACHKAB tk ON tk.fk_sotrid = nvl(vn.fk_vrachid, vn.fk_ispolid)
                LEFT JOIN ASU.TVRACHKAB_NAZ tn ON tn.fk_smid = vn.fk_smid
                                              AND tn.fk_sotrkabid = tk.fk_id
               WHERE vn.fk_pacid = decode(vTalonID, NULL, PFK_PACID, (SELECT MAX(tat.fk_ambid) FROM asu.tambtalon tat WHERE tat.fk_id = vTalonID))
                 AND nvl(vn.fk_vrachid, vn.fk_ispolid) = vSotrID_S
                 AND tn.fk_medspec IS NOT NULL
              -- Оказалось даже при такой проверки на вхождение в ветку протоколы время выгрузки увеличивается в десятки раз, так что проверка не используется
              --         AND (SELECT MAX(ts.fk_id) -- Лучше проверить на вхождение в ветку протоколы так, INNER JOIN тормозит
              --                     FROM asu.tsmid ts WHERE ts.fc_synonim = 'REPORTS'
              --                   CONNECT BY PRIOR ts.fk_owner = ts.fk_id
              --                    START WITH ts.fk_id = vn.fk_smid) IS NOT NULL
               GROUP BY tn.fk_medspec);

    END IF;

    IF vMedspecCount = 1 AND vTheirSpecID_S IS NOT NULL THEN
      vTheirSpecName_S := EXCH43.PKG_EXCHANGE.GET_THEIR_NAME_BY_ID(ASU.GET_EIS_COMPANYID, 'MEDSPEC', vTheirSpecID_S);
    ELSE
      SELECT NVL(MAX(TSOTR.FK_SPRAVID), 0) INTO vTheirSpecID_S FROM LOGIN.TSOTR WHERE TSOTR.FK_ID = NVL(vSotrID_S, 0);
      vTheirSpecID_S := EXCH43.PKG_EXCHANGE.GET_THEIR_ID(ASU.GET_EIS_COMPANYID, 'MEDSPEC', 'TS_SPRAV', vTheirSpecID_S);

      vTheirSpecName_S := EXCH43.PKG_EXCHANGE.GET_THEIR_NAME(ASU.GET_EIS_COMPANYID, 'MEDSPEC', 'TS_SPRAV', vTheirSpecID_S);
    end IF;

    -- Выбираем отделение
    IF vTalonID IS NULL THEN
      SELECT MAX(R.FK_OTDELID)
        INTO vOtdelID_S
        FROM TPERESEL P, TROOM R
       WHERE FK_PACID = pfk_pacid
         AND P.FK_PALATAID = R.FK_ID
         AND P.FK_ID =
             (SELECT MIN(p.FK_ID)
                FROM TPERESEL P
                left join TROOM R on R.FK_ID = P.FK_PALATAID
               WHERE P.FK_PACID = pfk_pacid
                 and R.FK_OTDELID NOT IN
                     (select tod.fk_id from login.totdel tod left join asu.troom tr on tr.fk_otdelid = tod.fk_id where upper(tr.fc_palata) like 'ПРИЕМН%'));
    ELSE
      SELECT CASE
               WHEN (SELECT MAX(FK_ID) FROM TKARTA WHERE FK_ID = pfk_pacid) IS NULL THEN
                (SELECT MAX(S.FK_OTDELID) FROM TSOTR S WHERE S.FK_ID = vSotrID_S)
               ELSE
                get_priemn_otdelid
             END
        INTO vOtdelID_S
        FROM DUAL;
    END IF;
    SELECT MAX(FC_NAME) INTO vOtdel_S FROM TOTDEL WHERE FK_ID = vOtdelID_S;
    -- Выбираем диагнозы
    -- Beg commented 20100114 by Linnikov (понадобились даты диагнозов, оптимальнее использовать курсор)
    --  vDSPriPostMain := GET_DIAG_BY_TYPE(pfk_pacid, 'PRI_POSTYPLENII', 'MAIN');
    --  vDSNaOsmMain   := GET_DIAG_BY_TYPE(pfk_pacid, 'NA_OSMOTRE', 'MAIN');
    --  vDSPriVypMain  := GET_DIAG_BY_TYPE(pfk_pacid, 'PRI_VYPISKE', 'MAIN');
    --  vDSClinMain    := GET_DIAG_BY_TYPE(pfk_pacid, 'CLINIK', 'MAIN');
    --  vDSClinOsl     := GET_DIAG_BY_TYPE(pfk_pacid, 'CLINIK', 'OSLOG_MAIN');
    --  vDSPriVypOsl   := GET_DIAG_BY_TYPE(pfk_pacid, 'PRI_VYPISKE', 'OSLOG_MAIN');
    --  vDSClinSoput   := GET_DIAG_BY_TYPE(pfk_pacid, 'CLINIK', 'SOPUT');
    --  vDSPatanatom   := GET_DIAG_BY_TYPE(pfk_pacid, 'CLINIK_ANATOM', 'MAIN');
    -- End commented 20100114 by Linnikov
    -- Beg added 20100114 by Linnikov
    OPEN c_diag(pfk_pacid, 'PRI_POSTYPLENII', 'MAIN');
    FETCH c_diag
      INTO vDSPriPostMain, vDSPriPostMainDT;
    CLOSE c_diag;
    OPEN c_diag(pfk_pacid, 'NA_OSMOTRE', 'MAIN');
    FETCH c_diag
      INTO vDSNaOsmMain, vDSNaOsmMainDT;
    CLOSE c_diag;
    -- Ефимов В.А. 01.04.2010 OPEN c_diag... заменил на asu.GET_DIAG_BY_TYPE_EX в связи с задачей http://192.168.1.2:15000/redmine/issues/show/4442
    vDSPriVypMain := GET_DIAG_BY_TYPE_EX(pfk_pacid, 'PRI_VYPISKE', 'MAIN');
    vDSClinMain   := GET_DIAG_BY_TYPE_EX(pfk_pacid, 'CLINIK', 'MAIN');
    --  OPEN c_diag(pfk_pacid, 'PRI_VYPISKE', 'MAIN');
    --  FETCH c_diag
    --  INTO vDSPriVypMain, vDSPriVypMainDT;
    --  CLOSE c_diag;
    --  OPEN c_diag(pfk_pacid, 'CLINIK', 'MAIN');
    --  FETCH c_diag
    --  INTO vDSClinMain, vDSClinMainDT;
    --  CLOSE c_diag;
    OPEN c_diag(pfk_pacid, 'CLINIK', 'OSLOG_MAIN');
    FETCH c_diag
      INTO vDSClinOsl, vDSClinOslDT;
    CLOSE c_diag;
    OPEN c_diag(pfk_pacid, 'PRI_VYPISKE', 'OSLOG_MAIN');
    FETCH c_diag
      INTO vDSPriVypOsl, vDSPriVypOslDT;
    CLOSE c_diag;
    OPEN c_diag(pfk_pacid, 'CLINIK', 'SOPUT');
    FETCH c_diag
      INTO vDSClinSoput, vDSClinSoputDT;
    CLOSE c_diag;
    OPEN c_diag(pfk_pacid, 'CLINIK_ANATOM', 'MAIN');
    FETCH c_diag
      INTO vDSPatanatom, vDSPatanatomDT;
    CLOSE c_diag;
    -- End added 20100114 by Linnikov
    IF vDB_NAME = 'H' THEN
      BEGIN
        IF vTalonID IS NULL THEN
          vDS_SD := NVL(NVL(vDSPriPostMain, vDSNaOsmMain), NVL(vDSPriVypMain, vDSClinMain));
          SELECT MAX(vDSClinSoput) /* || DECODE(LENGTH(vDSClinSoput), 3, '.0', NULL) */
            INTO vDS_C
            FROM DUAL;
          -- Ефимов В.А. 01.04.2010 vDSPriVypMain берётся только если vDSClinMain is null раньше было наоборот, изменил  в связи с задачей http://192.168.1.2:15000/redmine/issues/show/4442
          --   vDS_E := NVL(vDSClinMain, vDSPriVypMain);
          vDS_E := NVL(vDSPriVypMain, vDSClinMain);
          SELECT MAX(vDS_SD /* || DECODE(LENGTH(vDS_SD), 3, '.0', NULL) */) INTO vDS_SD FROM DUAL;
          SELECT MAX(vDS_E /* || DECODE(LENGTH(vDS_E), 3, '.0', NULL) */) INTO vDS_E FROM DUAL;

          SELECT MAX(NVL(vDSPriVypOsl, vDSClinOsl) /* ||
                                       DECODE(LENGTH(NVL(vDSPriVypOsl, vDSClinOsl)), 3, '.0', NULL) */)
            INTO vDS_O
            FROM DUAL;
        ELSE
          SELECT MAX(FK_MKB10 /* || DECODE(LENGTH(FK_MKB10), 3, '.0', NULL) */),
                 max(dd.fk_grupid)
            INTO vDS_SD, vGZ_SMID_E
            FROM TAMBTALON TT
            left join ASU.TDIAG d on d.FK_ID = TT.FK_DIAGMAIN
            left join TSMID S on S.FK_ID = d.FK_MKB_10
            left join asu.tdiagdetail dd on dd.fk_diagid = d.fk_id
           WHERE TT.FK_ID = vTalonID;
          -- Ефимов В.А. 17.05.2010 Для амбулаторных DIA_O не заполняется, т.к. такого поля нет в дозаполнении (Засименко) http://192.168.1.2:15000/redmine/issues/show/5127
          vDS_O := '';

          -- Ефимов В.А. 17.05.2010 Изменил способ получения DIA_C для амб. талона (Засименко) http://192.168.1.2:15000/redmine/issues/show/5127
          SELECT Max(FK_MKB10 /* || DECODE(LENGTH(FK_MKB10), 3, '.0', NULL) */)
            INTO vDS_C
            FROM ASU.TSMID
           WHERE FK_ID = (SELECT NVL(MAX(TD.FK_MKB_10), -1)
                            FROM ASU.TAMBTALON_DIAGS TA, ASU.TDIAG TD
                            LEFT JOIN ASU.TSMID TS ON TS.FK_ID = TD.FK_MKB_10
                           WHERE TA.FK_DIAGID = TD.FK_ID
                             AND TA.FK_TALONID = vTalonID
                             AND TD.FL_MAIN = ASU.GET_SOPUTDIAG
                             AND NVL(TA.FL_DEL, 0) = 0);
          vDS_E := vDS_SD;
        END IF;
      END;
    ELSE
      BEGIN
        IF vTalonID IS NULL THEN
          vDS_SD := NVL(NVL(vDSPriPostMain, vDSNaOsmMain), NVL(vDSPriVypMain, vDSClinMain));
          SELECT MAX(vDSClinSoput /* || DECODE(LENGTH(vDSClinSoput), 3, '.0', NULL) */) INTO vDS_C FROM DUAL;
          vDS_E := NVL(vDSPriVypMain, vDSClinMain);
          SELECT MAX(vDS_SD /* || DECODE(LENGTH(vDS_SD), 3, '.0', NULL) */) INTO vDS_SD FROM DUAL;
          SELECT MAX(vDS_E /* || DECODE(LENGTH(vDS_E), 3, '.0', NULL) */) INTO vDS_E FROM DUAL;
          -- Даты стационарных диагнозов
          --       vDS_SDDT := NVL(NVL(vDSPriPostMainDT, vDSNaOsmMainDT),
          --                       NVL(vDSPriVypMainDT, vDSClinMainDT));
          vDS_CDT := TRUNC(vDSClinSoputDT);
          --       vDS_EDT  := NVL(vDSPriVypMainDT, vDSClinMainDT);
        ELSE
          -- Beg commented 20100114 by Linnikov (для дат)
          /*   SELECT MAX(FK_MKB10 || DECODE(LENGTH(FK_MKB10), 3, '.0', NULL))
            INTO vDS_SD
            FROM TSMID S, TAMBTALON TT
           WHERE S.FK_ID = (SELECT FK_MKB_10 FROM ASU.TDIAG WHERE FK_ID = TT.FK_DIAGMAIN)
             AND TT.FK_ID = vTalonID;
          SELECT MAX(FK_MKB10 || DECODE(LENGTH(FK_MKB10), 3, '.0', NULL))
            INTO vDS_C
            FROM TSMID S, TAMBTALON TT
           WHERE S.FK_ID = (SELECT FK_MKB_10 FROM ASU.TDIAG WHERE FK_ID = TT.FK_DIAGSUB)
             AND TT.FK_ID = vTalonID; */
          -- End commented 20100114 by Linnikov (для дат)
          -- Beg added 20100114 by Linnikov (для дат)
          SELECT MAX(FK_MKB10 /*|| DECODE(LENGTH(FK_MKB10), 3, '.0', NULL)*/), MAX(D.Fd_Date), max(dd.fk_grupid)
            INTO vDS_SD, vDS_SDDT, vGZ_SMID_E
            FROM TAMBTALON TT
            left join ASU.TDIAG d on d.FK_ID = TT.FK_DIAGMAIN
            left join TSMID S on S.FK_ID = d.FK_MKB_10
            left join asu.tdiagdetail dd on dd.fk_diagid = d.fk_id
           WHERE TT.FK_ID = vTalonID;
          SELECT MAX(FK_MKB10 /* || DECODE(LENGTH(FK_MKB10), 3, '.0', NULL) */), MAX(trunc(D.Fd_Date))
            INTO vDS_C, vDS_CDT
            FROM asu.TSMID S, asu.TAMBTALON TT, ASU.TDIAG D
           WHERE S.FK_ID = D.FK_MKB_10
             AND d.FK_ID = TT.FK_DIAGSUB
             AND TT.FK_ID = vTalonID;
          vDS_E := vDS_SD;
          -- Дата DS_E амбулаторного диагноза
          --       vDS_EDT := vDS_SDDT;
        END IF;
        SELECT MAX(NVL(vDSPriVypOsl, vDSClinOsl) /* ||
                                    DECODE(LENGTH(NVL(vDSPriVypOsl, vDSClinOsl)), 3, '.0', NULL) */)
          INTO vDS_O
          FROM DUAL;
        -- Дата DS_O added 20100114 by Linnikov
        vDS_ODT := TRUNC(NVL(vDSPriVypOslDT, vDSClinOslDT));
      END;
    END IF;
    -- Определяем ТОМПы
    -- Efimov V.A. 20120927 ПО предложению Оли Засименко томп больше не определяется http://192.168.1.9/redmine/issues/20022
    --  vOsnTOMP := '';
    --  vSopTOMP := '';
    --  IF vTalonID IS NULL THEN
    --   vOsnTOMP := EXCH43.GET_STAC_PAC_TOMP(pfk_pacid, vDS_E);
    --   vSopTOMP := EXCH43.GET_STAC_PAC_TOMP(pfk_pacid, vDS_C);
    --  ELSE
    --   vOsnTOMP := EXCH43.GET_AMB_PAC_TOMP(vTalonID, vDS_E);
    --   vSopTOMP := EXCH43.GET_AMB_PAC_TOMP(vTalonID, vDS_C);
    --  END IF;
    --  vOsnCOST := GET_TOMP_COST(vOsnTOMP); --GET_TOMP_SUM
    -- Выбираем остальное
    -- FC_SERVPLACE
    IF pfp_poly = 0 THEN
      SELECT DECODE(MAX(U.FK_ID), NULL, 'Стационар', 'Дн. стац')
        INTO vServPlace
        FROM (SELECT FK_ID FROM TUSLVID CONNECT BY PRIOR FK_ID = FK_OWNERID START WITH FK_ID IN (ASU.DOC_IB_DS, ASU.DOC_IBDS_STAC)) U,
             (SELECT FK_USLVIDID
                FROM TKARTA
               WHERE FK_ID = pfk_pacid
              UNION ALL
              SELECT 0 FK_USLVIDID FROM TAMBULANCE WHERE FK_ID = pfk_pacid) A
       WHERE U.FK_ID = A.FK_USLVIDID;
    ELSE
      SELECT NVL(MAX(S.FC_NAME), 'Поликлиника')
        INTO vServPlace
        FROM TSMID S, TAMBTALON T
       WHERE S.FK_ID = T.FK_SERVPLACE
         AND T.FK_ID = vTalonID;
    END IF;
    -- TYPEPLACE
    IF vTalonID IS NULL THEN
      SELECT DECODE(MAX(TKARTA.FK_ID), NULL, NULL, 1)
        INTO vTypePlace
        FROM TKARTA, (SELECT FK_ID FROM ASU.TUSLVID CONNECT BY PRIOR FK_ID = FK_OWNERID START WITH FK_ID IN (ASU.DOC_IBDS_STAC, ASU.DOC_IB_DS)) VID
       WHERE TKARTA.FK_ID = pfk_pacid
         AND VID.FK_ID = TKARTA.FK_USLVIDID;
    ELSE
      SELECT DECODE(MAX(AMB.FK_ID), NULL, NULL, 1)
        INTO vTypePlace
        FROM ASU.TAMBULANCE AMB,
             ASU.TDOCOBSL OB,
             (SELECT FK_ID FROM ASU.TUSLVID CONNECT BY PRIOR FK_ID = FK_OWNERID START WITH FK_ID IN (ASU.DOC_IBDS_STAC, ASU.DOC_IB_DS)) VID
       WHERE AMB.FK_DOCOBSL = OB.FK_ID
         AND AMB.FK_ID = pfk_pacid
         AND VID.FK_ID = OB.FK_VIDDOCID;
    END IF;

    -- PROFMP_ID
    -- Ефимов В.А. 20110202 http://192.168.1.2:15000/redmine/issues/show/9355
    -- добавил поле PROFMP_ID, заполняется аналогично полю PROFMP_ID для услуг
    IF vTalonID IS NULL THEN
      if vTypePlace = 1 then
        vEXT_PROFMP_NAME := 'EXT_PROFMP_DS';
      else
        vEXT_PROFMP_NAME := 'EXT_PROFMP_S';
      end if;

      --    select max(ts.fk_id) into vStrLastFK_SMID from asu.tsmid ts where ts.fc_synonim = 'TECHBOLEZNI';

      -- Efimov V.A. 2011.07.04 Доработано в соответствии с http://84.51.195.172:15000/redmine/issues/12463, согласовал с Олей Засименко
      select EXCH43.PKG_EXCHANGE.GET_THEIR_ID(ASU.GET_EIS_COMPANYID, vEXT_PROFMP_NAME, 'TTIPROOM', max(p.fk_koykavidid))
        into vPROFMP_ID
        FROM TPERESEL P
       WHERE FK_PACID = pfk_pacid
         AND P.FK_ID =
             (SELECT MIN(p.FK_ID)
                FROM TPERESEL P
                left join TROOM R on R.FK_ID = P.FK_PALATAID
               WHERE P.FK_PACID = pfk_pacid
                 and R.FK_OTDELID NOT IN
                     (select tod.fk_id from login.totdel tod left join asu.troom tr on tr.fk_otdelid = tod.fk_id where upper(tr.fc_palata) like 'ПРИЕМН%'));

      --    select EXCH43.PKG_EXCHANGE.GET_THEIR_ID(ASU.GET_EIS_COMPANYID, vEXT_PROFMP_NAME, 'TTIPROOM', max(tsr.fk_vidid))
      --      into vPROFMP_ID
      --      from asu.tperesel tp
      --     inner join (select tpl.fk_pacid, max(tpl.fk_id) fk_id
      --                   from asu.tperesel tpl
      --                  group by tpl.fk_pacid) tpl on tpl.fk_id = tp.fk_id
      --     inner join asu.TSRTIPROOM tsr on tsr.fk_palataid = tp.fk_palataid
      --     where tsr.fl_remont < 1
      --       and tp.fk_pacid = pfk_pacid;
    else
      vEXT_PROFMP_NAME := 'EXT_PROFMP_P';

      -- Efimov V.A. 20111117 Процедура определения PROFMP_ID изменена следующим образом:
      -- Если используется модуль Исполнители, но значение найти не удолось, оно берётся из данных врача http://192.168.1.9/redmine/issues/14466
      vPROFMP_ID := null;
      if asu.GetVrachkab_naz_Medspec = 1 then
        select Max(fk_smid)
          into vStrLastFK_SMID
          from (select n.fk_smid fk_smid
                  FROM ASU.TAMBTALON_NAZ AN
                 inner JOIN ASU.VNAZ N on n.fk_id = an.fk_nazid
                 WHERE AN.FK_TALONID = vTalonID
                   AND n.FK_NAZSOSID = ASU.GET_VYPNAZSOSID
                 ORDER BY n.fd_run)
         where rownum = 1;

        select EXCH43.PKG_EXCHANGE.GET_THEIR_ID(ASU.GET_EIS_COMPANYID,
                                                vEXT_PROFMP_NAME,
                                                'TS_SPRAV',
                                                EXCH43.PKG_EXCHANGE.GET_OUR_ID('MEDSPEC',
                                                                               'TS_SPRAV',
                                                                               (select MAX(tvkn.fk_medspec) fk_medspec
                                                                                  from asu.tvrachkab_naz tvkn
                                                                                  left join asu.tvrachkab tvk on tvk.fk_id = tvkn.fk_sotrkabid
                                                                                 where tvkn.fk_smid = vStrLastFK_SMID
                                                                                   and tvk.fk_sotrid = vSotrID_E
                                                                                 group by tvkn.fk_smid, tvk.fk_sotrid))) PROFMP_ID
          into vPROFMP_ID
          from dual;
      end if;

      if vPROFMP_ID is null then
        SELECT EXCH43.PKG_EXCHANGE.GET_THEIR_ID(ASU.GET_EIS_COMPANYID, vEXT_PROFMP_NAME, 'TS_SPRAV', MAX(TSOTR.FK_SPRAVID)) PROFMP_ID
          into vPROFMP_ID
          FROM ASU.TSOTR
         WHERE TSOTR.FK_ID = vSotrID_E;
      end if;
    end if;

    -- ILLKIND
    IF vTalonID IS NULL THEN
      /* commented 20090529 by linnikov от Засименко   SELECT MAX(TIB.FK_SMID)
       INTO vIllKind
       FROM TIB,
            (SELECT FK_ID, FC_NAME
               FROM TSMID
             CONNECT BY PRIOR FK_ID = FK_OWNER
              START WITH FC_SYNONIM = 'PD_OBR') SM
      WHERE SM.FK_ID = TIB.FK_SMID
        AND TIB.FK_PACID = pfk_pacid;*/
      SELECT MAX(D.FL_FIRST) INTO vIllKind FROM TDIAG D WHERE D.FK_PACID = pfk_pacid;
    ELSE
      SELECT MAX(D.FL_FIRST)
        INTO vIllKind
        FROM TDIAG D, TAMBTALON TT
       WHERE D.FK_ID = TT.FK_DIAGMAIN
         AND TT.FK_ID = vTalonID;
    END IF;
    -- ILLKINDNAME
    IF vIllKind IS NOT NULL THEN
      SELECT MAX(fc_name) INTO vIllKindName FROM asu.tsmid WHERE fk_id = vIllKind;
    ELSE
      vIllKindName := '';
    END IF;
    -- Exitus1
    SELECT DECODE(NVL(MAX(fp_reslech), 0), -1, 0, NVL(MAX(fp_reslech), 0))
      INTO vExitus1
      FROM ASU.TEPIKRIZ
     WHERE FK_PACID = pfk_pacid
       AND fp_type IN (STAT.PKG_STATUTIL.GET_SMIDID('EPIK_VYPISNOY'), STAT.PKG_STATUTIL.GET_SMIDID('EPIK_POSMERT'));
    -- Exitus2
    SELECT NVL(MAX(fk_smid), 292670)
      INTO vExitus1
      FROM ASU.TIB
     WHERE FK_PACID = pfk_pacid
       AND FK_SMEDITID = STAT.PKG_STATUTIL.GET_SMIDID('RESULT_LECH');
    -- Exitus
    IF vTalonID IS NULL THEN
      SELECT EXCH43.PKG_EXCHANGE.GET_THEIR_ID(GET_EIS_COMPANYID,
                                              'EXITUS',
                                              'TSMID',
                                              --                                           NVL(DECODE(vExitus1, 0, vExitus2, vExitus1), 0))
                                              NVL(STAT.PKG_STATKART.GET_PAC_RESGOSP(pfk_pacid), 0))
        INTO vExitus
        FROM DUAL;
    ELSE
      SELECT NVL(MAX(EXCH43.PKG_EXCHANGE.GET_THEIR_ID(GET_EIS_COMPANYID, 'EXITUS', 'TSMID', TT.FK_RESULT)), 0)
        INTO vExitus
        FROM TAMBTALON TT
       WHERE FK_ID = pfk_talonid;
    END IF;
    IF vTalonID IS NOT NULL THEN
      Select NVL(EXCH43.PKG_EXCHANGE.GET_THEIR_ID(GET_EIS_COMPANYID, 'PL', 'TSMID', MAX(FK_SMID)), 1)
        into vPL
        from ASU.TIB
       where FK_SMEDITID = ASU.GET_TALON_TYPE_CREATE
         and FK_PACID = pfk_talonid;
    ELSE
      SELECT NVL(EXCH43.PKG_EXCHANGE.GET_THEIR_ID(GET_EIS_COMPANYID, 'PL', 'TSMID', MAX(I.FK_SMID)), 1)
        INTO vPL
        FROM ASU.TIB I, ASU.TSMID S
       WHERE I.FK_SMEDITID = S.FK_ID
         AND S.FC_SYNONIM = 'PD_REGOSPITAL'
         AND I.FK_PACID = pfk_pacid;
    END IF;
    -- Exitus_dop
    IF vTalonID IS NOT NULL THEN
      vEXITUS_DOP_TAB := 'EXITUS_DOP_P';
      SELECT MAX(fk_dopishodid) INTO vExitus_dop FROM asu.tambtalon tt WHERE fk_id = vTalonID;
    ELSE
      if vTypePlace IS NULL then
        vEXITUS_DOP_TAB := 'EXITUS_DOP_S';
      else
        vEXITUS_DOP_TAB := 'EXITUS_DOP_DS';
      end if;

      select nvl((SELECT MAX(fk_smid)
                   FROM ASU.TIB
                  WHERE FK_PACID = pfk_pacid
                    AND FK_SMEDITID = STAT.PKG_STATUTIL.GET_SMIDID('DOP_ISHOD_PARENT_S')),
                 (SELECT MAX(fk_smid)
                    FROM ASU.TIB
                   WHERE FK_PACID = pfk_pacid
                     AND FK_SMEDITID = STAT.PKG_STATUTIL.GET_SMIDID('DOP_ISHOD_PARENT')))
        into vExitus_dop
        from dual;
    END IF;
    -- city
    SELECT NVL(MAX(FK_KLADR), 0) INTO vkladrID FROM ASU.TADRESS WHERE fk_pacid = pfk_peplid;

    asu.get_kladr_addr_parts_by_id(vkladrID, vRegion, vRaion, vCity, vStreet, 0);
    -- AGENT_STATUS
    SELECT MAX(i.fk_smid)
      INTO vAgentStatus
      FROM asu.tib i, asu.tsmid s
     WHERE fk_pacid = pfk_peplid
       AND s.fk_id = i.fk_smid
       AND s.fc_synonim = 'AGENT_STATUS';
    -- AGENT_SUR_NAME
    SELECT substr(MAX(i.fc_char), 1, 30)
      INTO vAgentSurname
      FROM asu.tib i, asu.tsmid s
     WHERE fk_pacid = pfk_peplid
       AND s.fk_id = i.fk_smid
       AND s.fc_synonim = 'AGENT_SUR_NAME';
    -- AGENT_FIRST_NAME
    SELECT substr(MAX(i.fc_char), 1, 20)
      INTO vAgentFirstName
      FROM asu.tib i, asu.tsmid s
     WHERE fk_pacid = pfk_peplid
       AND s.fk_id = i.fk_smid
       AND s.fc_synonim = 'AGENT_FIRST_NAME';
    -- AGENT_PATR_NAME
    SELECT substr(MAX(i.fc_char), 1, 20)
      INTO vAgentPatrName
      FROM asu.tib i, asu.tsmid s
     WHERE fk_pacid = pfk_peplid
       AND s.fk_id = i.fk_smid
       AND s.fc_synonim = 'AGENT_PATR_NAME';
    -- AGENT_VDK
    SELECT MAX(i.fk_smid)
      INTO vAgentVDK
      FROM asu.tib i, asu.tsmid s
     WHERE fk_pacid = pfk_peplid
       AND s.fk_id = i.fk_smid
       AND s.fc_synonim = 'AGENT_VDK';
    -- AGENT_DOCSER
    SELECT substr(MAX(i.fc_char), 1, 10)
      INTO vAgentDocSer
      FROM asu.tib i, asu.tsmid s
     WHERE fk_pacid = pfk_peplid
       AND s.fk_id = i.fk_smid
       AND s.fc_synonim = 'AGENT_DOCSER';
    -- AGENT_DOCNUM
    SELECT substr(MAX(i.fc_char), 1, 10)
      INTO vAgentDocNum
      FROM asu.tib i, asu.tsmid s
     WHERE fk_pacid = pfk_peplid
       AND s.fk_id = i.fk_smid
       AND s.fc_synonim = 'AGENT_DOCNUM';
    -- AGENT_DATE_V
    SELECT TO_CHAR(MAX(i.fd_date), 'DD.MM.YYYY')
      INTO vAgentDateV
      FROM asu.tib i, asu.tsmid s
     WHERE fk_pacid = pfk_peplid
       AND s.fk_id = i.fk_smid
       AND s.fc_synonim = 'AGENT_DATE_V';
    -- AGENT_KEM
    SELECT MAX(i.fn_num)
      INTO vAgentKem
      FROM asu.tib i, asu.tsmid s
     WHERE fk_pacid = pfk_peplid
       AND s.fk_id = i.fk_smid
       AND s.fc_synonim = 'AGENT_KEM';

    IF vTalonID IS NULL THEN
      vN_UCH          := null;
      vTYPE_UCH       := null;
      vDATE_START_UCH := null;
      vDATE_END_UCH   := null;
    ELSE
      vN_UCH          := null;
      vTYPE_UCH       := null;
      vDATE_START_UCH := null;
      vDATE_END_UCH   := null;
      -- Efimov V.A. 20110527 Добавил данные по участкам http://192.168.1.9/redmine/issues/11745
      /*
          select to_number(substr(REGEXP_REPLACE(MAX(tdn.fc_name), '\D', ''), 1, 3)),
                 EXCH43.PKG_EXCHANGE.GET_THEIR_ID(asu.GET_EIS_COMPANYID, 'DISTRICT_TYPE', 'TSMID', MAX(tdn.fk_typeid)),
                 to_char(MAX(tdp.fd_date_in), 'dd.mm.yyyy'),
                 to_char(MAX(tdh.fd_date_move), 'dd.mm.yyyy')
            into vN_UCH, vTYPE_UCH, vDATE_START_UCH, vDATE_END_UCH
            from asu.tdistrict_name tdn
            left join asu.tdistrict_pacient tdp on tdp.fk_arealid = tdn.fk_id
            left join (select tdh.fk_peplid, tdh.fk_areaid, max(tdh.fk_id) fk_id
                         from asu.tdistrict_history tdh
                        where tdh.fc_type = 'O'
                        group by tdh.fk_peplid, tdh.fk_areaid) tdhl on tdhl.fk_peplid = tdp.fk_peplid and tdhl.fk_areaid = tdp.fk_arealid
            left join asu.tdistrict_history tdh on tdh.fk_id = tdhl.fk_id
           where tdn.fk_id = asu.GET_DISTRICTID_BY_AMB(pfk_peplid, pfk_pacid)
             and tdp.fk_peplid = pfk_peplid;

          if vN_UCH is not null and ASU.PKG_SMINI.READSTRING('CONFIG', 'DB_NAME', 'H') = 'H' then
            vN_UCH := 1; -- Efimov V.A. 20110530 по предложению Оли Засименко, в рамках задачи http://84.51.195.172:15000/redmine/issues/11800
          end if;
      */
    END IF;

    -- Заполняем первый кусок
    INSERT INTO TEXCHUPLOAD_BIG_TMP
      (FK_ID,
       FK_AMBID,
       FC_DOCVIDAN,
       FK_VIDDOC_EIS,
       FC_PAC_SNILS,
       --5
       FK_EIS_TRAVM,
       OTKAZ_GOSP,
       FN_DNST,
       FC_DNU,
       LPU_NAPR,
       --10
       FK_TYPEDOC_EIS,
       FP_OUT,
       FD_OUT,
       FN_TYPE_PODR,
       FC_DOCSER,
       --15
       FC_DOCNUM,
       FD_DOCDATE,
       FP_CHECKED,
       FC_LIFE_ADDR,
       FN_KDN,
       --20
       IS_POLICY_GOOD,
       POLICYBEG,
       POLICYEND,
       POLICYSER,
       POLICYNUM,
       --25
       POLICYTYPE,
       SNAME,
       FNAME,
       MNAME,
       DDMMYYYY,
       --30
       POL,
       NACIONAL,
       COUNTRY,
       STATE,
       RON,
       --35
       CITYPAS,
       VILLAGE,
       STREETPAS,
       DOMPAS,
       KORPAS,
       --40
       FLATPAS,
       FC_ADR,
       MR,
       DATE_S,
       DATE_E,
       --45
       DESTROY,
       KOL_POS,
       TYPE_PODR,
       KEM_NAPR,
       ID_ILL,
       --50
       SMK_ID,
       TYPEDOG,
       PROTOCOL,
       N_MAP,
       FK_PEPLID,
       --55
       POLICYID,
       --новые поля
       FK_OMS_ID,
       FP_IN_FOMS,
       SMK_ID_P,
       PID,
       -- 60
       FC_SMK_NAME,
       FC_STRAH_ADDR,
       --
       DOC_FIO,
       DOCSPEC,
       FK_DOCSPEC,
       -- 65
       FK_OTDELID_S,
       FC_OTDEL_S,
       FK_OTDELID_E,
       FC_OTDEL_E,
       --
       DIA_SD,
       DIA_O,
       DIA_C,
       -- 70
       DIA_E,
       SUM_OPL,
       FC_TOMP,
       FC_SOP_TOMP,
       FC_SERVPLACE,
       -- 75
       TYPEPLACE,
       ILLKIND,
       EXITUS,
       PL,
       EXITUS_DOP,
       -- 80
       ILLKIND_NAME,
       -- Агенты
       AGENT_STATUS,
       AGENT_SUR_NAME,
       AGENT_FIRST_NAME,
       AGENT_PATR_NAME,
       -- 85
       AGENT_VDK,
       AGENT_DOCSER,
       AGENT_DOCNUM,
       AGENT_DATE_V,
       AGENT_KEM,
       -- 90 FINISH
       MOVE_S,
       T_PILL,
       INSP_RW,
       INSP_VICH,
       ID_TREAT,
       -- 95
       KOIKA,
       P_DIA_E,
       OTKL,
       SOST_OP,
       DATE_O,
       -- 100
       DATE_C,
       NUM_NAPRAV,
       DIA_SOUR_PR,
       NACIONAL_ID,
       HEMO,
       -- 105
       ALLERG,
       PHONE,
       PROF,
       EXT_PID,
       DISP_DATE_S,
       -- 110
       DISP_DIA,
       DISP_DATE_E,
       DISP_CAUSE,
       DISP_DOCOR_S,
       DISP_DOCTOR_E,
       -- 115
       DISP_LPU,
       DISP_LPU_NAME,
       ID_CARD,
       DATE_OPEN_CARD,
       DATE_CLOSED_CARD,
       ADD_CARD_NUMBER,
       PROFMP_ID,
       SOTR_ID,
       POLICY_TYPE_ID,
       STANDARD_TYPE_ID,
       BIRD_PLACE_NAME,
       N_UCH,
       TYPE_UCH,
       DATE_START_UCH,
       DATE_END_UCH,
       AGENT_POL,
       AGENT_DR,
       TYPE_V_MU,
       MODERN,
       DOC_NAME_S,
       DOCSPEC_S,
       DOCSPEC_S_NAME,
       ENP,
       fk_uslvidid,
       GZ)
      SELECT NVL(TT.FK_ID, A.FK_ID) FK_ID, -- ID случая
             A.FK_ID FK_AMBID,
             substr(P.FC_DOCVIDAN, 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'FC_DOCVIDAN')),
             EXCH43.PKG_EXCHANGE.GET_THEIR_ID(GET_EIS_COMPANYID, 'VDK', 'TVIDDOC', P.FK_DOCVID) FK_VIDDOC_EIS,
             substr(ASU.PKG_BIRTH_CERTIFICATION.GET_CERT_SNILS(P.FK_ID), 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'FC_PAC_SNILS')) FC_PAC_SNILS, -- СНИЛС пациента
             --5
             EXCH43.PKG_EXCHANGE.GET_THEIR_ID(GET_EIS_COMPANYID,
                                              'DESTROY',
                                              'TSMID',
                                              DECODE(UT.FK_TALONID,
                                                     NULL,
                                                     (SELECT MAX(TIB.FK_SMID)
                                                        FROM TIB,
                                                             (SELECT FK_ID, FC_NAME FROM TSMID CONNECT BY PRIOR FK_ID = FK_OWNER START WITH FC_SYNONIM = 'PD_TRAVM') SM
                                                       WHERE SM.FK_ID = TIB.FK_SMID
                                                         AND TIB.FK_PACID = A.FK_ID),
                                                     TT.FK_TRAVMA)) FK_EIS_TRAVM,
             --          substr((SELECT MAX(FK_SMID)
             --                    FROM ASU.TIB
             --                   WHERE FK_SMEDITID IN
             --                         (SELECT MAX(FK_ID) FROM ASU.TSMID WHERE FC_SYNONIM = 'GOSPZAKL_OTKAZ')
             --                     AND FK_PACID = A.FK_ID),
             --                 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'OTKAZ_GOSP')) OTKAZ_GOSP,
             -- Efimov V.A. 20101015 исправил способ определения причина отказа в госпитализации http://192.168.1.2:15000/redmine/issues/show/7573
             (SELECT EXCH43.PKG_EXCHANGE.GET_THEIR_ID(GET_EIS_COMPANYID, 'REFUSAL', 'TSMID', Max(FK_VYBID))
                FROM asu.TSROKY
               WHERE FK_ID = asu.GET_MAXSROKID(A.FK_ID)) OTKAZ_GOSP,

             DECODE(A.FK_USLVIDID, DOC_IB_DS, 1, NULL) FN_DNST,
             substr(ASU.GET_DIAG_BY_TYPE(A.FK_ID, 'S_MESTA_OTBORA', 'MAIN'), 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'FC_DNU')) FC_DNU,
             substr(EXCH43.PKG_EXCHANGE.GET_THEIR_ID(GET_EIS_COMPANYID, 'LPU', 'TSMID', NVL(ASU.GET_NAPR_UCHR_ID(A.FK_ID), ASU.GET_NAPR_UCHR_ID(TT.FK_ID))),
                    1,
                    GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'LPU_NAPR')) LPU_NAPR,
             --10
             EXCH43.PKG_EXCHANGE.GET_THEIR_ID(GET_EIS_COMPANYID, 'KINDCOST', 'TTYPEDOC', I.FK_TYPEDOCID) FK_TYPEDOC_EIS,
             (SELECT DECODE(COUNT(1), 0, 0, 1)
                FROM EXCH43.TOUTPACLOG OL
               WHERE OL.FK_PACID = NVL(UT.FK_TALONID, UT.FK_PACID)
                 AND OL.FP_RESULT = 0
                 AND OL.FC_FUNCTION = 'ADD_CASE') FP_OUT,
             (SELECT MAX(FD_DATE) FROM EXCH43.TOUTPACLOG OL WHERE OL.FK_PACID = NVL(UT.FK_TALONID, UT.FK_PACID)) FD_OUT,

             -- Efimov V.A. 20101015 заменил способ определения типа подразделения дял СуругтТравма http://192.168.1.2:15000/redmine/issues/show/7573
             --          DECODE(UT.FP_POLY, 0, 1, 1, 2, 2) FN_TYPE_PODR, -- тип подразделения
             decode(a.FK_USLVIDSYN, 'GOSPZAKL_OTKAZ', ASU.GET_OTKAZ_TYPE_PODR, DECODE(UT.FP_POLY, 0, 1, 1, 2, 2)) FN_TYPE_PODR, -- тип подразделения

             substr(P.FC_DOCSER, 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'FC_DOCSER')) FC_DOCSER,
             --15
             substr(P.FC_DOCNUM, 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'FC_DOCNUM')) FC_DOCNUM,
             GET_CORRECTDATE(TRUNC(P.FD_DOCDATE)) FD_DOCDATE,
             (SELECT DECODE(NVL(MAX(FK_ID), 0), 0, 0, 1) FROM EXCH43.TCHECK_EVENT WHERE FK_PACID = NVL(UT.FK_TALONID, UT.FK_PACID)) FP_CHECKED,
             NVL((ASU.GET_REGION(AD.FK_REGIONID) || ', ' || ASU.GET_TOWN(AD.FK_TOWNID)), AD.FC_ADR) FC_LIFE_ADDR,
             DECODE(vTalonid, NULL, STAT.PKG_STATUTIL.GET_PACKDN(A.FK_ID), 0) FN_KDN,
             --20
             CASE
               WHEN TRUNC(NVL(GREATEST(I.FD_END, I.FD_PROLONG), I.FD_END)) < TRUNC(SYSDATE) THEN
                0
               ELSE
                1
             END IS_POLICY_GOOD,
             I.FD_BEGIN POLICYBEG,
             NVL(GREATEST(I.FD_END, I.FD_PROLONG), I.FD_END) POLICYEND,
             decode(TD.fc_synonim,
                    'OMS',
                    substr(I.FC_SER, 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'POLICYSER')),
                    'DMS',
                    substr(I.FC_SER, 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'POLICYSER')),
                    '') POLICYSER,
             decode(TD.fc_synonim,
                    'OMS',
                    substr(I.FC_NUM, 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'POLICYNUM')),
                    'DMS',
                    substr(I.FC_NUM, 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'POLICYNUM')),
                    '') POLICYNUM,
             --25
             decode(TD.fc_synonim,
                    'OMS',
                    substr(TD.FC_NAME, 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'POLICYTYPE')),
                    'DMS',
                    substr(TD.FC_NAME, 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'POLICYTYPE')),
                    '') POLICYTYPE,
             substr(P.FC_FAM, 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'SNAME')) SNAME, -- Фамилия
             substr(P.FC_IM, 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'FNAME')) FNAME, -- Имя
             substr(P.FC_OTCH, 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'MNAME')) MNAME, -- Отчество
             get_correctdate(TRUNC(P.FD_ROJD)) DDMMYYYY,
             --30
             DECODE(P.FP_SEX, 1, 'М', 0, 'Ж') POL, -- Пол
             substr(ASU.GET_NATIONALITY(A.FK_ID), 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'NACIONAL')) NACIONAL, -- Национальность
             substr(NVL(ASU.GET_COUNTRY(AD.FK_COUNTRYID), 'Россия'), 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'COUNTRY')) COUNTRY, -- Страна
             substr(nvl(vregion, ASU.GET_REGION(AD.FK_REGIONID)), 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'STATE')) STATE, -- Область
             substr(nvl(vraion, ASU.GET_RAION(AD.FK_RAIONID)), 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'RON')) RON, -- Район
             --35
             substr(nvl(vcity, ASU.GET_TOWN(AD.FK_TOWNID)), 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'CITYPAS')) CITYPAS, -- Город
             substr(ASU.GET_INTOWN(AD.FK_INTOWNID), 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'VILLAGE')) VILLAGE, -- Поселок
             substr(nvl(vstreet, ASU.GET_STREET(AD.FK_STREETID)), 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'STREETPAS')) STREETPAS, -- Улица
             substr(GET_FIRST_DIGIT_FROM_CHAR(AD.FC_HOUSE), 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'DOMPAS')) DOMPAS, -- Дом
             substr(AD.FC_KORPUS, 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'KORPAS')) KORPAS, -- Корпус
             --40
             substr(GET_FIRST_DIGIT_FROM_CHAR(AD.FC_KVARTIRA), 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'FLATPAS')) FLATPAS, -- Квартира
             substr(AD.FC_ADR, 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'FC_ADR')) FC_ADR, -- Адрес строкой
             substr(P.FC_RABOTA, 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'MR')) MR, -- Место работы
             CASE
               WHEN UT.FK_TALONID IS NULL THEN
                TRUNC(ASU.PKG_REGIST_PACFUNC.GET_PAC_INCOME(A.FK_ID))
               ELSE
                TRUNC(GET_CORRECTDATE(TT.FD_OPENED))
             END DATE_S,
             CASE
               WHEN UT.FK_TALONID IS NULL THEN
                TRUNC(ASU.PKG_REGIST_PACFUNC.GET_PAC_OUTCOME(A.FK_ID))
               ELSE
                TRUNC(GET_CORRECTDATE(TT.FD_CLOSED))
             END DATE_E,
             --45
             substr(ASU.GET_TRAUMA(DECODE(UT.FK_TALONID, NULL, A.FK_ID, TT.FK_ID)), 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'DESTROY')) DESTROY,
             --          ASU.GET_COUNT_CONS(NVL(A.FK_ID, 0)) KOL_POS, -- Количество посещений
             DECODE(TT.FK_ID,
                    NULL,
                    ASU.GET_COUNT_CONS(NVL(A.FK_ID, 0)),
                    (SELECT NVL(COUNT(K.FK_ID), 0)
                       FROM TNAZKONS K, TAMBTALON_NAZ AN
                      WHERE AN.FK_TALONID = TT.FK_ID
                        AND K.FK_ID = AN.FK_NAZID)) KOL_POS, -- Количество посещений

             -- Efimov V.A. 20101015 заменил способ определения типа подразделения дял СуругтТравма http://192.168.1.2:15000/redmine/issues/show/7573
             --          DECODE(UT.FP_POLY, 0, 1, 1, 2, 2) TYPE_PODR, -- Тип (1-стац. , 2 -ЛПУ)
             decode(a.FK_USLVIDSYN, 'GOSPZAKL_OTKAZ', ASU.GET_OTKAZ_TYPE_PODR, DECODE(UT.FP_POLY, 0, 1, 1, 2, 2)) TYPE_PODR, -- тип подразделения

             substr(EXCH43.PKG_EXCHANGE.GET_THEIR_NAME(GET_EIS_COMPANYID, 'LPU', 'TSMID', ASU.GET_NAPR_UCHR_ID(A.FK_ID)),
                    1,
                    GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'KEM_NAPR')) KEM_NAPR, -- Кем направлен
             NVL(TT.FK_ID, A.FK_ID) ID_ILL, -- Идентификационный № случая
             --50
             NVL(EXCH43.PKG_EXCHANGE.GET_THEIR_ID(EXCH43.GET_MEDINFO_ID, 'SMK', 'TCOMPANY', UT.FK_COMPANYID), -1) SMK_ID, -- Код филиала Страховщика
             CASE
               WHEN MONTHS_BETWEEN(NVL(TT.FD_CLOSED, ASU.PKG_REGIST_PACFUNC.GET_PAC_OUTCOME(A.FK_ID)), A.FD_ROJD) > 216 THEN
                2
               ELSE
                1
             END TYPEDOG, -- Тип договора (1-нераб, 2-раб) -- TODO
             A.FK_IBID PROTOCOL, -- Код протокола заболевания
             --          NVL(TT.FK_ID, A.FK_IBID) N_MAP, -- № карты выбытия из стационара
             A.FK_IBID N_MAP, -- 20110422 Efimov V.A. Не ясно почему, но прежде для амбулаторных брался не номер ИБ, а ID талона, исправил по предложению Оли Засименко (была жалоба из МИЦ)
             P.FK_ID   FK_PEPLID,
             --55
             I.FK_ID POLICYID,
             -- новые столбцы
             vOmsID,
             vInFoms,
             vSmkIDp,
             vPID,
             --60
             decode(TD.fc_synonim,
                    'OMS',
                    substr(vShortAdr || ', ' || vRegSrah, 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'FC_SMK_NAME')),
                    'DMS',
                    substr(vShortAdr || ', ' || vRegSrah, 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'FC_SMK_NAME')),
                    '') FC_SMK_NAME,
             substr(vRegSrah, 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'FC_STRAH_ADDR')) FC_STRAH_ADDR,
             --
             substr(vSotr_E, 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'DOC_FIO')) DOC_FIO,
             substr(vTheirSpecName_E, 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'DOCSPEC')) DOCSPEC,
             vTheirSpecID_E,
             -- способ получения специальности изменён в соответствии с задачей
             -- http://192.168.1.2:15000/redmine/issues/show/6593
             -- см. выше, формирование значений для vTheirSpecName, vTheirSpecID
             --          EXCH43.PKG_EXCHANGE .GET_THEIR_NAME(GET_EIS_COMPANYID,
             --                                             'MEDSPEC',
             --                                             'TS_SPRAV',
             --                                             vSpecID),
             --          EXCH43.PKG_EXCHANGE.GET_THEIR_ID(GET_EIS_COMPANYID,
             --                                           'MEDSPEC',
             --                                           'TS_SPRAV',
             --                                           vSpecID),
             --65
             EXCH43.PKG_EXCHANGE.GET_THEIR_ID(GET_EIS_COMPANYID, 'PLACE', 'TOTDEL', vOtdelID_S) FK_OTDELID_S,
             substr(vOtdel_S, 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'FC_OTDEL_S')) FC_OTDEL_S,
             EXCH43.PKG_EXCHANGE.GET_THEIR_ID(GET_EIS_COMPANYID, 'PLACE', 'TOTDEL', vOtdelID_E) FK_OTDELID_E,
             substr(vOtdel_E, 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'FC_OTDEL_E')) FC_OTDEL_E,
             --
             vDS_SD,
             vDS_O,
             vDS_C,
             --70
             vDS_E,
             --          vOsnCOST,
             --          substr(vOsnTOMP, 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'FC_TOMP')) FC_TOMP,
             --          substr(vSopTOMP, 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'FC_SOP_TOMP')) FC_SOP_TOMP,
             NULL SUM_OPL,
             NULL FC_TOMP,
             NULL FC_SOP_TOMP,
             substr(vServPlace, 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'FC_SERVPLACE')) FC_SERVPLACE,
             --75
             vTypePlace,
             NVL(EXCH43.PKG_EXCHANGE.GET_THEIR_ID(GET_EIS_COMPANYID, 'ILLKIND', 'TSMID', vIllKind), 1),
             vExitus,
             vPL,
             EXCH43.PKG_EXCHANGE.GET_THEIR_ID(GET_EIS_COMPANYID, vEXITUS_DOP_TAB, 'TSMID', vExitus_dop),
             --80
             substr(vIllKindName, 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'ILLKIND_NAME')) ILLKIND_NAME,
             -- Агенты
             NVL(EXCH43.PKG_EXCHANGE.GET_THEIR_ID(GET_EIS_COMPANYID, 'ACLIENT_AGENT_STATUS', 'TSMID', vAgentStatus), 0),
             substr(NVL(vAgentSurname, P.FC_FAM), 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'AGENT_SUR_NAME')) AGENT_SUR_NAME,
             substr(NVL(vAgentFirstName, P.FC_IM), 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'AGENT_FIRST_NAME')) AGENT_FIRST_NAME,
             substr(NVL(vAgentPatrName, P.FC_OTCH), 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'AGENT_PATR_NAME')) AGENT_PATR_NAME,
             --85
             NVL(EXCH43.PKG_EXCHANGE.GET_THEIR_ID(GET_EIS_COMPANYID, 'VDK', 'TSMID', vAgentVDK),
                 EXCH43.PKG_EXCHANGE.GET_THEIR_ID(GET_EIS_COMPANYID, 'VDK', 'TVIDDOC', P.FK_DOCVID)),
             substr(NVL(vAgentDocSer, P.FC_DOCSER), 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'AGENT_DOCSER')) AGENT_DOCSER,
             substr(NVL(vAgentDocNum, P.FC_DOCNUM), 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'AGENT_DOCNUM')) AGENT_DOCNUM,
             substr(NVL(vAgentDateV, TO_CHAR(P.FD_DOCDATE, 'DD.MM.YYYY')), 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'AGENT_DATE_V')) AGENT_DATE_V,
             substr(NVL(vAgentKem, p.FC_DOCVIDAN), 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'AGENT_KEM')) AGENT_KEM,
             --90
             EXCH43.PKG_EXCHANGE.GET_THEIR_ID(GET_EIS_COMPANYID,
                                              'MOVING',
                                              'TSMID',
                                              (SELECT MAX(sm.FK_ID)
                                                 FROM (SELECT fk_id, fc_name FROM tsmid CONNECT BY PRIOR fk_id = fk_owner START WITH fc_synonim = 'PD_DOST') sm,
                                                      tib
                                                WHERE sm.fk_id = tib.fk_smid
                                                  AND tib.fk_pacid = A.FK_ID)) MOVE_S,
             EXCH43.PKG_EXCHANGE.GET_THEIR_ID(GET_EIS_COMPANYID,
                                              'T_PILL',
                                              'TSMID',
                                              (SELECT MAX(sm.FK_ID)
                                                 FROM (SELECT fk_id, fc_name FROM tsmid CONNECT BY PRIOR fk_id = fk_owner START WITH fc_synonim = 'PD_NACHTRAVM') sm,
                                                      tib
                                                WHERE sm.fk_id = tib.fk_smid
                                                  AND tib.fk_pacid = A.FK_ID)) T_PILL,
             (SELECT DECODE(MAX(fk_id), NULL, 0, 1)
                FROM tib
               WHERE fk_pacid = A.FK_ID
                 AND fk_smid = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = 'OBSLED_RW')) INSP_RW,
             (SELECT DECODE(MAX(fk_id), NULL, 0, 1)
                FROM tib
               WHERE fk_pacid = A.FK_ID
                 AND fk_smid = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = 'OBSLED_AIDS')) INSP_VICH,
             EXCH43.PKG_EXCHANGE.GET_THEIR_ID(GET_EIS_COMPANYID,
                                              'DEFECT',
                                              'TSMID',
                                              (SELECT MAX(sm.FK_ID)
                                                 FROM (SELECT fk_id, fc_name FROM tsmid CONNECT BY PRIOR fk_id = fk_owner START WITH fc_synonim = 'SK_DEFECT') sm,
                                                      tib
                                                WHERE sm.fk_id = tib.fk_smid
                                                  AND tib.fk_pacid = A.FK_ID)) ID_TREAT,
             --95
             NULL KOIKA, -- передавать пустым
             substr(vDSPatanatom, 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'P_DIA_E')) P_DIA_E,
             NULL OTKL, -- нет поля в нашей системе
             EXCH43.PKG_EXCHANGE.GET_THEIR_ID(GET_EIS_COMPANYID,
                                              'SOST_OP',
                                              'TSMID',
                                              (SELECT MAX(sm.FK_ID)
                                                 FROM (SELECT fk_id, fc_name FROM tsmid CONNECT BY PRIOR fk_id = fk_owner START WITH fc_synonim = 'PD_DOST_PIAN') sm,
                                                      tib
                                                WHERE sm.fk_id = tib.fk_smid
                                                  AND tib.fk_pacid = A.FK_ID)) SOST_OP,
             vDS_ODT DATE_O,
             --100
             trunc(vDS_CDT) DATE_C,
             substr((SELECT substr(MAX(tib.fc_char), 1, 10)
                      FROM (SELECT MAX(fk_id) fk_id FROM tsmid WHERE fc_synonim = 'PD_NOMER_NAPR') sm, tib
                     WHERE sm.fk_id = tib.fk_smid
                       AND tib.fk_pacid = A.FK_ID),
                    1,
                    GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'NUM_NAPRAV')) NUM_NAPRAV,
             substr(vDSPriPostMain, 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'DIA_SOUR_PR')) DIA_SOUR_PR,
             EXCH43.PKG_EXCHANGE.GET_THEIR_ID(GET_EIS_COMPANYID,
                                              'NATIONAL',
                                              'TSMID',
                                              (SELECT MAX(FK_SMID)
                                                 FROM TIB
                                                WHERE FK_PACID = pfk_peplid
                                                  AND FK_SMID IN
                                                      (SELECT FK_ID FROM TSMID WHERE FK_OWNER = (SELECT MAX(FK_ID) FROM TSMID WHERE FC_SYNONIM = 'LD_NAROD')))) NACIONAL,
             EXCH43.PKG_EXCHANGE.GET_THEIR_ID(GET_EIS_COMPANYID,
                                              'HEMO',
                                              'TSMID',
                                              (SELECT MAX(sm.FK_ID)
                                                 FROM (SELECT fk_id, fc_name FROM tsmid CONNECT BY PRIOR fk_id = fk_owner START WITH fc_synonim = 'LD_BLOOD_GROUP') sm,
                                                      tib
                                                WHERE sm.fk_id = tib.fk_smid
                                                  AND tib.fk_pacid = pfk_peplid)) HEMO,
             --105
             /* (SELECT substr(substr(fc_name, 1, length(fc_name) - 2), 1, 30) ALLERG
                          FROM (SELECT SYS_XMLAGG(XMLELEMENT(COL, fc_name || ', ')) .EXTRACT('/ROWSET/COL/text()').GETSTRINGVAL() fc_name
                                  FROM (SELECT asu.get_smidname(i.fk_smid) fc_name
                                          FROM asu.tib i,
                                               (SELECT fk_id
                                                  FROM asu.tsmid
                                                CONNECT BY PRIOR fk_id = fk_owner
                                                 START WITH fc_synonim = 'PD_LEKALERG') s
                                         WHERE i.fk_smeditid = s.fk_id
                                           AND fk_pacid = pfk_pacid))) ALLERG, */
             NULL ALLERG, -- http://192.168.1.2:15000/redmine/issues/show/4765
             substr(P.fc_phone, 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'PHONE')) PHONE,
             NULL PROF,
             pfk_peplid EXT_PID,
             vDispDateS,
             --110
             substr(vDispDia, 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'DISP_DIA')) DISP_DIA,
             vDispDateE,
             vDispCause,
             vDispDoctorS,
             vDispDoctorE,
             --115
             vDispLPU,
             substr(vDispLPUName, 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'DISP_LPU_NAME')) DISP_LPU_NAME,
             tt.fk_ambid ID_CARD,
             (select to_char(MIN(fd_opened), 'dd.mm.yyyy') from TAMBTALON where fk_ambid = tt.fk_ambid) DATE_OPEN_CARD, -- 20110516 Efimov V.A. Изменил форматы дат в соответствии с http://84.51.195.172:15000/redmine/issues/11443
             null DATE_CLOSED_CARD,
             null ADD_CARD_NUMBER,
             vPROFMP_ID PROFMP_ID,
             vSotrID_E,
             exch43.pkg_exchange.GET_THEIR_ID(GET_EIS_COMPANYID, 'EXT_POLICY_TYPE', 'TSMID', i.fk_typeoms) POLICY_TYPE_ID,
             (SELECT exch43.pkg_exchange.GET_THEIR_ID(GET_EIS_COMPANYID, 'STANDARD_TYPE', 'TSMID', MAX(fk_smid))
                FROM ASU.TIB
               WHERE FK_PACID = NVL(TT.FK_ID, A.FK_ID)
                 AND FK_SMEDITID = STAT.PKG_STATUTIL.GET_SMIDID('CPD_STANDARTGROUP')) STANDARD_TYPE_ID,
             decode(GetKladrByLevelNOwner(vKladrID, (select nvl(max(fn_level), 3) from asu.tkladr where fk_id = ASU.Get_Curr_City_Kladr_Id)),
                    ASU.Get_Curr_City_Kladr_Id,
                    '',
                    substr(p.fc_rojdplace, 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'BIRD_PLACE_NAME'))) BIRD_PLACE_NAME, -- 20110516 Efimov V.A. добавил поле в соответствии с http://192.168.1.9/redmine/issues/11321
             vN_UCH N_UCH,
             vTYPE_UCH TYPE_UCH,
             vDATE_START_UCH DATE_START_UCH,
             vDATE_END_UCH DATE_END_UCH,
             -- Efimov V.A. 20110628 Формат доработан в соответствии с http://192.168.1.9/redmine/issues/12235
             (select substr(fc_name, 1, 1)
                from asu.tsmid
               where fk_id = (select MAX(ti.fk_smid)
                                from asu.tib ti
                               where ti.fk_smeditid = (select ts.fk_id from asu.tsmid ts where ts.fc_synonim = 'AGENT_POL')
                                 and ti.fk_pacid = pfk_peplid)) AGENT_POL,
             (select MAX(ti.fd_date)
                from asu.tib ti
               where ti.fk_smeditid = (select ts.fk_id from asu.tsmid ts where ts.fc_synonim = 'AGENT_DATA_ROGD')
                 and ti.fk_pacid = pfk_peplid) AGENT_DR,
             (SELECT exch43.pkg_exchange.GET_THEIR_ID(GET_EIS_COMPANYID, 'TYPE_PMSP', 'TSMID', MAX(fk_smid))
                FROM ASU.TIB
               WHERE FK_PACID = NVL(TT.FK_ID, A.FK_ID)
                 AND FK_SMEDITID = STAT.PKG_STATUTIL.GET_SMIDID('TYPE_V_MU')) TYPE_V_MU,

             --          (select Max(tl.fk_add_last)
             --             from (SELECT t.fd_date,
             --                          LAST_VALUE(t.fk_add) OVER(PARTITION BY t.fk_icd10 ORDER BY fd_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) fk_add_last
             --                     FROM asu.TICD10_MODERN t inner join asu.ticd10 i on i.fk_id = t.fk_icd10
             --                    WHERE i.fc_kod = vDS_E) tl
             --            where trunc(tl.fd_date) < trunc(decode(UT.FK_TALONID, NULL,
             --                                                                  ASU.PKG_REGIST_PACFUNC.GET_PAC_OUTCOME(A.FK_ID),
             --                                                                  GET_CORRECTDATE(TT.FD_CLOSED)))) MODERN,
             -- Efimov V.A. 20111108 Изменил способ определения отметки о модернизации на тот, что используется в выгрузке в dbf http://192.168.1.9/redmine/issues/14015
             -- Efimov V.A. 20111116 Если мождернизации нет. то поле не заполняется (до этого был 0) http://192.168.1.9/redmine/issues/14466
             (select decode(UT.FK_TALONID,
                            null,
                            decode(ASU.IsDiagModernizacia(vDS_E),
                                   1,
                                   decode(ASU.PKG_TKARTA_INFO.GetFL_MODERNIZACIA(a.fk_id, vDS_E), 0, null, ASU.PKG_TKARTA_INFO.GetFL_MODERNIZACIA(a.fk_id, vDS_E)),
                                   null),
                            decode(asu.GET_MIC_MODERN_AMB_DEF, 0, null, 1)) -- Efimov V.A. 20111206 GET_MIC_MODERN_AMB_DEF - позволяет включать/выключать модернизацию для амбулаторных случаев
                from dual) MODERN,

             substr(vSotr_S, 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'DOC_FIO')) DOC_NAME_S,
             vTheirSpecID_S DOCSPEC_S,
             substr(vTheirSpecName_S, 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'DOCSPEC')) DOCSPEC_S_NAME,
             substr(I.FC_ENP, 1, GET_COLUMN_CHAR_LEN('ASU', 'TEXCHUPLOAD_BIG_TMP', 'ENP')) ENP,
             a.fk_uslvidid,
             decode(a.fk_uslvidid, asu.DOC_DISP_DOP,
                    exch43.pkg_exchange.GET_THEIR_ID(GET_EIS_COMPANYID, 'GZ', 'TSMID', vGZ_SMID_E), null) GZ
        FROM (SELECT a.FK_ID, a.FK_PEPLID, a.FD_ROJD, a.FK_IBID, d.fk_viddocid FK_USLVIDID, '' FK_USLVIDSYN
                FROM ASU.TAMBULANCE a
                left join asu.TDOCOBSL D on D.FK_ID = A.FK_DOCOBSL
              UNION ALL
              SELECT K.FK_ID, K.FK_PEPLID, K.FD_ROJD, K.FK_IBID, K.FK_USLVIDID, tsd.fc_synonim FK_USLVIDSYN -- Нужны только даты открытия и закрытия амб. карты
                FROM ASU.TKARTA K
                left join asu.tuslvid tuv on tuv.fk_id = k.FK_USLVIDID
                left join asu.tsmid tsd on tsd.fk_id = tuv.fk_docid) A,
             TPEOPLES P,
             TAMBTALON TT,
             TEXCHUPLOAD_TMP UT,
             TADRESS AD,
             TINSURDOCS I,
             TTYPEDOC TD
       WHERE UT.FK_PACID = A.FK_ID
         AND TT.FK_ID(+) = UT.FK_TALONID
         AND A.FK_PEPLID = P.FK_ID
         AND AD.FK_PACID = P.FK_ID
         AND AD.FK_ID = UT.FK_ADRID
         AND I.FK_ID = UT.FK_INSURDOCID
         AND TD.FK_ID(+) = I.FK_TYPEDOCID

            --      AND  NVL(TT.FN_SOS, 0) <> 2 -- Added 20081016 by Linnikov
         AND UT.FK_PACID = pfk_pacid
         AND NVL(UT.FK_TALONID, 0) = NVL(vTalonID, 0); -- RETURNING FK_ID INTO pfk_id;

    -- Добавляем перемещения между отделениями во временную таблицу
    IF vTalonID IS NULL THEN
      -- Перемещения по ЛПУ (между отделениями)
      INSERT INTO asu.texchupload_move
        (id_ill, pid, n_map, place_1, date_1, doctor_1, DOCSPEC1, place_2, date_2, n_move, DOCTOR_2, DOCSPEC2, PROFMP_ID, DIA)
        SELECT a.ID_ILL, a.PID, a.N_MAP, a.PLACE_1, a.date_1, a.DOCTOR_1, a.DOCSPEC1, a.PLACE_2, a.DATE_2, ROWNUM N_MOVE, a.DOCTOR_2, a.DOCSPEC2, a.PROFMP_ID, a.DIA
          from (SELECT ID_ILL,
                       PID,
                       N_MAP,
                       EXCH43.PKG_EXCHANGE.GET_THEIR_ID(GET_EIS_COMPANYID, 'PLACE', 'TOTDEL', PLACE_1) PLACE_1,
                       TRUNC(DATE_1) date_1,
                       substr(ts1.FC_FAM || ' ' || ts1.FC_NAME || ' ' || ts1.FC_OTCH, 1, asu.GET_COLUMN_LEN('ASU', 'TEXCHUPLOAD_MOVE', 'DOCTOR_1')) DOCTOR_1,
                       --           EXCH43.PKG_EXCHANGE.GET_THEIR_ID(GET_EIS_COMPANYID, 'DOCTOR', 'TSOTR', DOCTOR_1) DOCTOR_1,
                       EXCH43.PKG_EXCHANGE.GET_THEIR_ID(ASU.GET_EIS_COMPANYID, 'MEDSPEC', 'TS_SPRAV', ts1.fk_spravid) DOCSPEC1,
                       EXCH43.PKG_EXCHANGE.GET_THEIR_ID(GET_EIS_COMPANYID, 'PLACE', 'TOTDEL', PLACE_2) PLACE_2,
                       DATE_2 DATE_2,
                       substr(ts2.FC_FAM || ' ' || ts2.FC_NAME || ' ' || ts2.FC_OTCH, 1, asu.GET_COLUMN_LEN('ASU', 'TEXCHUPLOAD_MOVE', 'DOCTOR_2')) DOCTOR_2,
                       EXCH43.PKG_EXCHANGE.GET_THEIR_ID(ASU.GET_EIS_COMPANYID, 'MEDSPEC', 'TS_SPRAV', ts2.fk_spravid) DOCSPEC2,
                       EXCH43.PKG_EXCHANGE.GET_THEIR_ID(ASU.GET_EIS_COMPANYID, vEXT_PROFMP_NAME, 'TTIPROOM', t.fk_koykavidid) PROFMP_ID,
                       t.DIA
                  FROM (SELECT k.fk_id ID_ILL,
                               vPID PID,
                               K.FK_IBID N_MAP,
                               lag(O.FK_ID, 1, NULL) over(ORDER BY p.fd_data1, p.fk_id) PLACE_1,
                               lag(p.FD_DATA1, 1, NULL) over(ORDER BY p.fd_data1, p.fk_id) DATE_1,
                               nvl(lead(decode(i.fk_vrachid, 0, null, -1, null, i.fk_vrachid), 0, asu.GET_PACVRACH(p.fk_pacid))
                                   over(partition by p.fk_srokID order by p.fd_data1, p.fk_id),
                                   r.fk_vrachid) DOCTOR_1,
                               nvl(lead(decode(i.fk_vrachid, 0, null, -1, null, i.fk_vrachid), 1, asu.GET_PACVRACH(p.fk_pacid))
                                   over(partition by p.fk_srokID order by p.fd_data1, p.fk_id),
                                   r.fk_vrachid) DOCTOR_2,
                               decode(tt.fc_synonim, 'FC_REANIM', rp.fk_koykavidid, p.fk_koykavidid) fk_koykavidid, -- Efimov V.A. 20111226 Профиль реаницации заменяется на профиль базового для реанимации перевода (см. asu.GET_REANIM_BASE_PERESEL)
                               O.FK_ID PLACE_2,
                               p.FD_DATA1 DATE_2,
                               row_number() over(ORDER BY p.fd_data1, p.fk_id) - 1 N_MOVE,
                               tpd.fc_code DIA
                          FROM asu.tperesel p
                         inner join asu.tperesel rp on rp.fk_id = asu.GET_REANIM_BASE_PERESEL(p.fk_id)
                         inner join asu.tperesel_diag tpd on tpd.fk_peresel = p.fk_id
                         inner join asu.troom r on r.fk_id = p.fk_palataid
                         inner join asu.totdel o on o.fk_id = r.fk_otdelid
                         inner join asu.tkarta k on k.fk_id = p.fk_pacid
                          left join asu.ttiproom tt on tt.fk_id = p.fk_koykavidid
                          left join asu.TIB i on i.fk_pacid = p.fk_pacid
                                             and i.fn_num = p.fk_id
                         WHERE p.fk_pacid = pfk_pacid
                         ORDER BY p.fd_data1, p.fk_id) T
                  left join asu.tsotr ts1 on ts1.fk_id = t.DOCTOR_1
                  left join asu.tsotr ts2 on ts2.fk_id = t.DOCTOR_2
                 WHERE N_MOVE > 0
                   AND place_1 <> place_2
                      --       AND (vDB_NAME <> 'SK' or (vDB_NAME = 'SK' and place_1 <> asu.get_priemn_otdelid)); -- Efimov V.A. 20110228 Переводы из приёмного отделения не передаются http://tg.samozapis.ru:15000/redmine/issues/show/8826, доработал, чтобы из приёмного не передавалось тоько для Кардио http://192.168.1.9/redmine/issues/11916
                   AND place_1 NOT IN
                       (select tod.fk_id from login.totdel tod left join asu.troom tr on tr.fk_otdelid = tod.fk_id where upper(tr.fc_palata) like 'ПРИЕМН%')
                 order by t.N_MOVE) a; -- Efimov V.A. 20110228 Переводы из приёмного отделения не передаются http://tg.samozapis.ru:15000/redmine/issues/show/8826, доработал, чтобы из приёмного не передавалось тоько для Кардио http://192.168.1.9/redmine/issues/11916
      -- Перемещения по отделению (между койками)
      INSERT INTO asu.texchupload_move_bed
        (id_ill, pid, n_map, place, date_p, n_chamber, n_koika, kod_koika, prim, kod_table, kod_koika1, kod_rejim, kod_nagr, kod_move_rejim)
        SELECT ID_ILL,
               vPID PID,
               N_MAP,
               PLACE,
               TRUNC(DATE_P),
               N_CHAMBER,
               NULL N_KOIKA,
               NULL KOD_KOIKA,
               NULL PRIM,
               NULL KOD_TABLE,
               NULL KOD_KOIKA1, -- Код разновидности койки (обязательное)
               NULL KOD_REJIM,
               NULL KOD_NAGR,
               NULL KOD_MOVE_REJIM
          FROM (SELECT k.fk_id ID_ILL,
                       K.FK_IBID N_MAP,
                       EXCH43.PKG_EXCHANGE.GET_THEIR_ID(asu.GET_EIS_COMPANYID, 'PLACE', 'TOTDEL', o.fk_id) PLACE,
                       p.fd_data1 DATE_P,
                       DECODE(translate(r.fc_palata, '_1234567890', '_'), NULL, r.fc_palata, NULL) N_CHAMBER,
                       --
                       o.fc_name,
                       r.fc_palata,
                       --
                       lag(o.fk_id) over(ORDER BY fd_data1) from_otd,
                       o.fk_id to_otd,
                       lag(r.fk_id) over(ORDER BY fd_data1) from_palata,
                       r.fk_id to_palata
                  FROM asu.tperesel p, asu.troom r, asu.totdel o, asu.tkarta k
                 WHERE fk_pacid = pfk_pacid
                   AND p.fk_palataid = r.fk_id
                   AND r.fk_otdelid = o.fk_id
                   AND p.fk_pacid = k.fk_id)
         WHERE from_otd = to_otd
           AND from_palata <> to_palata;

    END IF;
    -- Добавляем информацию по рецепатм
    INSERT INTO asu.texchupload_recept
      (id_recept, id_ill, pid, n_map, ist_fin, lekar, dia, id_medic, COUNT, kol_day_is, vid_recept, ser, num, doctor, date_v)
      SELECT r.fk_id AS ID_RECEPT, -- Код рецепта
             pfk_pacid ID_ILL,
             vPID PID,
             NULL N_MAP, -- TODO
             r.FK_PAYTYPE AS IST_FIN, --5  IST_FIN  Источник финансирования (1-федеральный, 2-субъект РФ, 3-муниципальный) (ASU.TRECIPEPAYTYPE)
             r.fk_percent AS LEKAR, -- 6  LEKAR  Процент льготы рецепта (asu.trecipepercent)
             vDS_E DIA, -- Диагноз заболевания, по которому выписан рецепт - пока что нету
             m.fk_lat_name_id AS ID_MEDIC, --8  ID_MEDIC  Код медикамента (справочник RECEPT_MEDICAM поле ID_MEDIC) m.fk_lat_name_id, m.fk_rus_name_id,
             m.fn_kol AS COUNT, --9  COUNT  Выписанное кол-во единиц лекарственной формы лекарственного средства
             r.fk_duration AS KOL_DAY_IS, --10  KOL_DAY_IS  Срок действия рецепта (asu.trecipeduration)
             decode(r.fl_lgot, 0, 3, 3, 1, 2) AS VID_RECEPT, --11  VID_RECEPT  Вид рецепта (1-федеральный, 2-региональный, 3-простой)
             r.fc_serial AS SER, --12  SER  Серия рецепта
             r.fn_num AS NUM, -- 13  NUM  Номер рецепта
             r.fk_vrach_id AS NUM, -- 14  DOCTOR  Код врача, выписавшего рецепт
             r.fd_date AS DATE_V -- 15  DATE_V  Дата выдачи рецепта (dd.mm.yyyy)
        FROM asu.trecipe r, asu.trecipe_medic m
       WHERE r.fk_id = m.fk_recipe_id
         AND r.fk_pac_id = NVL(vTalonID, pfk_pacid);

    -- Заполняем главную часть
    /* UPDATE TEXCHUPLOAD_BIG_TMP
      SET (FK_OMS_ID, FP_IN_FOMS, SMK_ID_P, PID, FC_SMK_NAME, FC_STRAH_ADDR) = (SELECT MAX(FK_ID),
                                                                                       DECODE(NVL(MAX(OP.FK_ID),
                                                                                                  0),
                                                                                              0,
                                                                                              0,
                                                                                              1),
                                                                                       MAX(OP.SMK_ID_P),
                                                                                       MAX(OP.PERSON_ID),
                                                                                       vShortAdr || ', ' ||
                                                                                       vRegSrah,
                                                                                       vRegSrah
                                                                                  FROM EXCH43.TOMS_PEOPLES OP
                                                                                 WHERE OP.FK_PEOPLEID =
                                                                                       pfk_peplid
                                                                                   AND OP.GLOBAL_ID < 0)
    WHERE FK_ID = NVL(vTalonID, pfk_pacid);*/

    /*  UPDATE TEXCHUPLOAD_BIG_TMP
       SET DOC_FIO    = vSotr,
           DOCSPEC    = EXCH43.PKG_EXCHANGE.GET_THEIR_NAME(GET_EIS_COMPANYID,
                                                           'VPD',
                                                           'TS_SPRAV',
                                                           vSpecID),
           FK_DOCSPEC = EXCH43.PKG_EXCHANGE.GET_THEIR_ID(GET_EIS_COMPANYID,
                                                           'VPD',
                                                           'TS_SPRAV',
                                                           vSpecID)
     WHERE FK_ID = NVL(vTalonID, pfk_pacid);
    UPDATE TEXCHUPLOAD_BIG_TMP
       SET FK_OTDELID = EXCH43.PKG_EXCHANGE.GET_THEIR_ID(GET_EIS_COMPANYID,
                                                         'PLACE',
                                                         'TOTDEL',
                                                         vOtdelID),
           FC_OTDEL   = vOtdel
     WHERE FK_ID = NVL(vTalonID, pfk_pacid);
    -- Заполняем диагнозы
    -- Апдейтим диагнозы и ТОМПы
    UPDATE TEXCHUPLOAD_BIG_TMP
       SET DIA_SD      = vDS_SD,
           DIA_O       = vDS_O,
           DIA_C       = vDS_C,
           DIA_E       = vDS_E,
           SUM_OPL     = vOsnCOST,
           FC_TOMP     = vOsnTOMP,
           FC_SOP_TOMP = vSopTOMP
     WHERE FK_ID = NVL(vTalonID, pfk_pacid);
    -- Апдейтим остальное
    UPDATE TEXCHUPLOAD_BIG_TMP
       SET FC_SERVPLACE = vServPlace,
           TYPEPLACE    = vTypePlace,
           ILLKIND      = NVL(EXCH43.PKG_EXCHANGE.GET_THEIR_ID(GET_EIS_COMPANYID,
                                                               'ILLKIND',
                                                               'TSMID',
                                                               vIllKind),
                              1)
     WHERE FK_ID = NVL(vTalonID, pfk_pacid);*/
  END;

  --------------------------------------------------------
  PROCEDURE FILL_TABLE_ROWS IS
  begin
    for c in (select ts.fk_id,
                     exch43.pkg_exchange.GET_THEIR_ID(GET_EIS_COMPANYID, 'DISP_KAT', 'TSMID', tai.FK_CITIZEN_KAT) DISP_KAT,
                     exch43.pkg_exchange.GET_THEIR_ID(GET_EIS_COMPANYID, 'DISP_RES', 'TSMID', tai.FK_SECOND_DISP) DISP_RES
                from ASU.TEXCHUPLOAD_BIG_TMP ts
               inner join asu.tambtalon_info tai on tai.fk_talonid = ts.FK_ID
               where ts.fk_uslvidid = asu.DOC_DISP_DOP)
     LOOP
       update ASU.TEXCHUPLOAD_BIG_TMP t
          set t.DISP_KAT = c.DISP_KAT,
              t.DISP_RES = c.DISP_RES
        WHERE T.FK_ID = C.FK_ID;
     end LOOP;

    for c in (select ts.fk_id,
                     exch43.pkg_exchange.GET_THEIR_ID(GET_EIS_COMPANYID, 'AMB_PR', 'TSMID', tai.FK_VISITVID) AMB_PR
                from ASU.TEXCHUPLOAD_BIG_TMP ts
               inner join asu.tambtalon_info tai on tai.fk_talonid = ts.FK_ID)

     LOOP
       update ASU.TEXCHUPLOAD_BIG_TMP t
          set t.AMB_PR = c.AMB_PR
        WHERE T.FK_ID = C.FK_ID;
     end LOOP;
  end;

  --------------------------------------------------------
  PROCEDURE CLEAR_LAST_TABLE IS
  BEGIN
    DELETE FROM TEXCHUPLOAD_BIG_TMP;
  END;
  --------------------------------------------------------
  -- Created 20100121 by Linnikov
  PROCEDURE CLEAR_MOVE_TABLE IS
  BEGIN
    DELETE FROM ASU.TEXCHUPLOAD_MOVE;
  END;
  --------------------------------------------------------
  -- Created 20100122 by Linnikov
  PROCEDURE CLEAR_MOVE_BED_TABLE IS
  BEGIN
    DELETE FROM ASU.TEXCHUPLOAD_MOVE_BED;
  END;
  --------------------------------------------------------
  PROCEDURE FILL_TOOTH_TABLE(pfk_nazid IN NUMBER) IS
    vSement  NUMBER;
    vZubnum  NUMBER;
    vPoverhn VARCHAR2(6);
  BEGIN
    -- Согласован механизм: одно назначение - один зуб
    --  DELETE FROM asu.texch_tooth_naz;
    --  FOR c IN (SELECT ROWNUM, i.fk_smid, i.fk_pacid
    --             FROM asu.tib i, asu.tsmid s
    --             WHERE i.fk_smeditid = s.fk_id
    --               AND s.fc_synonim = 'TOOTH_FORMULA'
    --               AND i.fk_pacid = pfk_nazid) LOOP
    --   FOR C1 IN (SELECT fk_id, fc_name, LEVEL
    --                FROM tsmid
    --              CONNECT BY PRIOR fk_id =  fk_owner
    --               START WITH fk_id = C.FK_SMID) LOOP
    --   dbms_output.put_line(c1.fc_name);
    FOR c IN (SELECT s.lvl, i.fk_smid, s.fc_name
                FROM asu.tib i,
                     (SELECT fk_id, fc_name, LEVEL LVL FROM asu.tsmid s CONNECT BY PRIOR fk_id = fk_owner START WITH s.fc_synonim = 'TOOTH_FORMULA') S
               WHERE i.fk_smid = s.fk_id
                 AND i.fk_pacid = pfk_nazid) LOOP
      IF c.lvl = 2 THEN
        --    dbms_output.put_line(c1.fc_name);
        vSement := to_number(REPLACE(c.fc_name, 'Сегмент ', ''));
      END IF;
      IF c.lvl = 4 THEN
        --     INSERT INTO asu.TMPAAA (EEE) VALUES (c1.fc_name);
        vZubnum := to_number(c.fc_name);
      END IF;
      IF c.lvl = 6 THEN
        --     INSERT INTO asu.TMPAAA (EEE) VALUES ('поверхность '||c1.fc_name);
        vPoverhn := substr(c.fc_name, 1, 6);
      END IF;
      --   END LOOP;
    END LOOP;
    INSERT INTO ASU.TEXCH_TOOTH_NAZ (FK_NAZID, FK_SEGMENT, FK_ZUBNUM, FC_POVERHN, FN_NUM) VALUES (pfk_nazid, vSement, vZubnum, vPoverhn, 1);
  END;
  ----------------------------------------------------
  FUNCTION GET_SEGMENT(pfk_nazid IN NUMBER, pfn_num IN NUMBER) RETURN NUMBER IS
    vResult NUMBER;
  BEGIN
    SELECT MAX(n.fk_segment)
      INTO vResult
      FROM asu.texch_tooth_naz n
     WHERE n.fk_nazid = pfk_nazid
       AND n.fn_num = pfn_num;
    RETURN(vResult);
  END;
  ----------------------------------------------------
  FUNCTION GET_ZUBNUM(pfk_nazid IN NUMBER, pfn_num IN NUMBER) RETURN NUMBER IS
    vResult NUMBER;
  BEGIN
    SELECT MAX(n.fk_zubnum)
      INTO vResult
      FROM asu.texch_tooth_naz n
     WHERE n.fk_nazid = pfk_nazid
       AND n.fn_num = pfn_num;
    RETURN(vResult);
  END;
  ----------------------------------------------------
  FUNCTION GET_POVERHN(pfk_nazid IN NUMBER, pfn_num IN NUMBER) RETURN VARCHAR2 IS
    vResult NVARCHAR2(6);
  BEGIN
    SELECT MAX(n.fc_poverhn)
      INTO vResult
      FROM asu.texch_tooth_naz n
     WHERE n.fk_nazid = pfk_nazid
       AND n.fn_num = pfn_num;
    RETURN(vResult);
  END;
  ----------------------------------------------------
  function GET_COLUMN_CHAR_LEN(aOWNER IN VARCHAR2, aTABLE IN VARCHAR2, aCOLUMN IN VARCHAR2) RETURN NUMBER IS
    vResult NUMBER;
  begin
    select ttc.CHAR_COL_DECL_LENGTH
      into vResult
      from ALL_TAB_COLUMNS ttc
     where ttc.owner = aOWNER
       and ttc.TABLE_NAME = aTABLE
       and ttc.column_name = aCOLUMN;

    return(vResult);
  end;
  ----------------------------------------------------
  procedure FILL_USL IS
  begin
    delete from asu.texchmic_usl;

    insert into asu.texchmic_usl
      (FK_ID,
       FK_PACID,
       FC_SMID_NAME,
       ID_SERV,
       ID_ILL,
       FN_PERSON,
       FN_TYPEDOC,
       TYPE_V,
       TYPE_V_OUR,
       DOCTOR_N,
       DOCTOR_N_ID,
       DOCTOR_W,
       DOCTOR_W_ID,
       PLACE_W,
       FK_OTDEL,
       POLICYSER,
       POLICYNUM,
       DIA_S,
       DATE_S,
       KOD_USL,
       NAME_USL,
       KOL_USL,
       DATE_USL,
       COST_USL,
       TYPE_USL,
       TYPE_PODR,
       SMK_ID_P,
       SMK_ID,
       LPU_ID,
       YEAR,
       MONTH,
       N_QU1,
       N_TOOTH1,
       P_TOOTH1,
       N_QU2,
       N_TOOTH2,
       P_TOOTH2,
       N_QU3,
       N_TOOTH3,
       P_TOOTH3,
       N_QU4,
       N_TOOTH4,
       P_TOOTH4,
       N_QU5,
       N_TOOTH5,
       P_TOOTH5,
       N_QU6,
       N_TOOTH6,
       P_TOOTH6,
       N_QU7,
       N_TOOTH7,
       P_TOOTH7,
       N_QU8,
       N_TOOTH8,
       P_TOOTH8,
       PLACE_N,
       DOC_SPEC_N,
       DOC_SPEC_W,
       PROFMP_ID,
       WAS_LOADED)
      select t.*,
             (SELECT DECODE(COUNT(1), 0, 0, 1)
                FROM exch43.toutpaclog
               WHERE fk_pacid = t.fk_pacid
                 AND fk_nazid = t.ID_SERV
                 AND fc_function = 'ADD_SERV') WAS_LOADED
        from (SELECT N.FK_ID,
                     tt.fk_id fk_pacid,
                     ts.fc_name fc_smid_name,

                     10 * decode(trl.fk_id, null, AN.FK_NAZID, 10 * trl.fk_id) + nvl(shn.rn, 0) ID_SERV,
                     T.FN_CODE ID_ILL, -- Идентификатор случая (TTMPLST.FK_ID)
                     T.FN_PERSON, -- Идентификатор пациента
                     T.FN_TYPEDOC, -- Тип документа
                     DECODE((SELECT MAX(FK_OWNER) FROM ASU.TSMID WHERE FK_ID = N.FK_SMID),
                            (SELECT MAX(FK_ID) FROM ASU.tsmid WHERE fc_synonim = 'KONS_SPEC'),
                            NVL(EXCH43.PKG_EXCHANGE.GET_THEIR_ID(ASU.GET_EIS_COMPANYID,
                                                                 'VIDPR',
                                                                 'TSMID',
                                                                 decode(asu.get_use_NAZDETAIL, 0, TT.FK_REASON, nvl(nd.fk_reason, TT.FK_REASON))),
                                -14),
                            decode(tr_IS_FILL_TYPE_V.FC_REPLYID, -- Efimov V.A. 20111110, TYPE_V заполняется для услуг отличных от консультаций, если есть соответсвующая натсройка
                                   null,
                                   null,
                                   NVL(EXCH43.PKG_EXCHANGE.GET_THEIR_ID(ASU.GET_EIS_COMPANYID,
                                                                        'VIDPR',
                                                                        'TSMID',
                                                                        decode(asu.get_use_NAZDETAIL, 0, TT.FK_REASON, nvl(nd.fk_reason, TT.FK_REASON))),
                                       -14))) TYPE_V, -- Efimov V.A. 20111101 Тип приема Строка ниже была закоментирована 5м пунктом той же задачи, благодаря которой появилась (пункт 2), http://192.168.1.9/redmine/issues/14000

                     ASU.GET_SMIDNAME(decode(asu.get_use_NAZDETAIL, 0, TT.FK_REASON, nvl(nd.fk_reason, TT.FK_REASON))) TYPE_V_OUR, -- Тип приема наш

                     -- Ефимов В.А. 13.05.2010 Изменил получение полей  DOCTOR_N, DOCTOR_N_ID, PLACE_w http://192.168.1.2:15000/redmine/issues/show/5096
                     (SELECT DECODE(MAX(ST.FC_FAM || ' ' || ST.FC_NAME || ' ' || FC_OTCH), '  ', 'НЕТ', MAX(ST.FC_FAM || ' ' || ST.FC_NAME || ' ' || FC_OTCH))
                        FROM ASU.TSOTR ST
                       WHERE ST.FK_ID = NVL(N.FK_VRACHID, 0)) DOCTOR_N, --Назначенный доктор
                     NVL(N.FK_VRACHID, 0) DOCTOR_N_ID,
                     (SELECT DECODE(MAX(ST.FC_FAM || ' ' || ST.FC_NAME || ' ' || FC_OTCH), '  ', 'НЕТ', MAX(ST.FC_FAM || ' ' || ST.FC_NAME || ' ' || FC_OTCH))
                        FROM ASU.TSOTR ST
                       WHERE ST.FK_ID = NVL(decode(trl.fk_vrachid, null, n.fk_ispolid, 0, n.fk_ispolid, trl.fk_vrachid), 0)) DOCTOR_W, --Выполнивший доктор
                     NVL(decode(trl.fk_vrachid, null, n.fk_ispolid, 0, n.fk_ispolid, trl.fk_vrachid), 0) DOCTOR_W_ID,
                     EXCH43.PKG_EXCHANGE.GET_THEIR_ID(ASU.GET_EIS_COMPANYID,
                                                      'PLACE',
                                                      'TOTDEL',
                                                      (SELECT NVL(MAX(TSOTR.FK_OTDELID), 0)
                                                         FROM ASU.TSOTR
                                                        WHERE TSOTR.FK_ID = decode(trl.fk_vrachid, null, n.fk_ispolid, 0, n.fk_ispolid, trl.fk_vrachid))) PLACE_w, -- Отделение выполнения

                     (SELECT NVL(MAX(TOTDEL.FK_ID), 0)
                        FROM ASU.TSOTR, ASU.TOTDEL
                       WHERE TSOTR.FK_ID = decode(trl.fk_vrachid,
                                                  null,
                                                  DECODE(NVL(decode(trl.fk_vrachid, null, n.fk_ispolid, 0, n.fk_ispolid, trl.fk_vrachid), 0),
                                                         0,
                                                         N.FK_VRACHID,
                                                         NVL(decode(trl.fk_vrachid, null, n.fk_ispolid, 0, n.fk_ispolid, trl.fk_vrachid), 0)),
                                                  trl.fk_vrachid)
                         AND TOTDEL.FK_ID = TSOTR.FK_OTDELID) FK_OTDEL,
                     T.FC_POLICYSER POLICYSER, -- Серия полиса
                     T.FC_POLICYNUM POLICYNUM, -- № полиса
                     T.FC_DIAG DIA_S, -- Предварительный диагноз
                     TRUNC(FD_DATEBEG) DATE_S, -- Дата начала заболевания
                     decode(th.code, null, Hr.code, th.code) KOD_USL, -- Код услуги (услуги по ПВБ или код ПМУ)
                     decode(th.code, null, Hr.fc_name, th.fc_name) NAME_USL,
                     1 KOL_USL, -- Количество услуг
                     TRUNC(decode(trl.fd_ins, null, n.fd_run, trl.fd_ins)) DATE_USL, -- Дата выполнения услуги
                     decode(th.code, null, --(select max(thc.fn_cost)
                                           --   from asu.theal_cost thc
                                           --  where thc.fk_healid = th.fk_id
                                           --    and tt.fd_closed between thc.fd_date1 and nvl(thc.fd_date2, sysdate)),
                                           th.fn_cost,
                                           Cr.Fn_Cost) COST_USL, -- Стоимость услуги
                     2 TYPE_USL, -- Тип услуги(1-стационар,2-поликлиника,3-дневной стационар, 4 - стоматология)
                     2 TYPE_PODR, -- Тип (1-стац. , 2 -ЛПУ)
                     (SELECT MAX(P.SMK_ID_P)
                        FROM EXCHANGE.TOMS_PEOPLES P, ASU.TAMBULANCE A
                       WHERE P.FK_PEOPLEID = A.FK_PEPLID
                         AND A.FK_ID = TT.FK_AMBID) SMK_ID_P, -- Код Страховщика
                     (SELECT MAX(P.SMK_ID)
                        FROM EXCHANGE.TOMS_PEOPLES P, ASU.TAMBULANCE A
                       WHERE P.FK_PEOPLEID = A.FK_PEPLID
                         AND A.FK_ID = TT.FK_AMBID) SMK_ID, -- Код филиала Страховщика
                     EXCHANGE.PKG_EXCHANGE.GET_THEIR_ID(EXCHANGE.PKG_EXCHANGE.GET_MAIN_COMPANYID,
                                                        'LPU',
                                                        'TCOMPANY',
                                                        (SELECT T.FK_ID FROM ASU.TCOMPANY T WHERE T.FC_SYNONIM = 'HOME_COMPANY')) LPU_ID, -- Код ЛПУ
                     TO_CHAR(SYSDATE, 'YYYY') "YEAR", -- Год подачи реестра
                     TO_CHAR(SYSDATE, 'MM') "MONTH", -- Месяц подачи реестра
                     ASU.PKG_EXCH_UPLOAD_MASTER.GET_SEGMENT(N.FK_ID, 1) N_QU1, -- Номер сегмента (квадранта)
                     ASU.PKG_EXCH_UPLOAD_MASTER.GET_SEGMENT(N.FK_ID, 2) N_QU2, -- Номер сегмента (квадранта)
                     ASU.PKG_EXCH_UPLOAD_MASTER.GET_SEGMENT(N.FK_ID, 3) N_QU3, -- Номер сегмента (квадранта)
                     ASU.PKG_EXCH_UPLOAD_MASTER.GET_SEGMENT(N.FK_ID, 4) N_QU4, -- Номер сегмента (квадранта)
                     ASU.PKG_EXCH_UPLOAD_MASTER.GET_SEGMENT(N.FK_ID, 5) N_QU5, -- Номер сегмента (квадранта)
                     ASU.PKG_EXCH_UPLOAD_MASTER.GET_SEGMENT(N.FK_ID, 6) N_QU6, -- Номер сегмента (квадранта)
                     ASU.PKG_EXCH_UPLOAD_MASTER.GET_SEGMENT(N.FK_ID, 7) N_QU7, -- Номер сегмента (квадранта) (спавочник ZF)
                     ASU.PKG_EXCH_UPLOAD_MASTER.GET_SEGMENT(N.FK_ID, 8) N_QU8, -- Номер сегмента (квадранта) (спавочник ZF)
                     ASU.PKG_EXCH_UPLOAD_MASTER.GET_ZUBNUM(N.FK_ID, 1) N_TOOTH1, -- Номер зуба (справочник ZF)
                     ASU.PKG_EXCH_UPLOAD_MASTER.GET_ZUBNUM(N.FK_ID, 2) N_TOOTH2, -- Номер зуба (справочник ZF)
                     ASU.PKG_EXCH_UPLOAD_MASTER.GET_ZUBNUM(N.FK_ID, 3) N_TOOTH3, -- Номер зуба (справочник ZF)
                     ASU.PKG_EXCH_UPLOAD_MASTER.GET_ZUBNUM(N.FK_ID, 4) N_TOOTH4, -- Номер зуба (справочник ZF)
                     ASU.PKG_EXCH_UPLOAD_MASTER.GET_ZUBNUM(N.FK_ID, 5) N_TOOTH5, -- Номер зуба (справочник ZF)
                     ASU.PKG_EXCH_UPLOAD_MASTER.GET_ZUBNUM(N.FK_ID, 6) N_TOOTH6, -- Номер зуба (справочник ZF)
                     ASU.PKG_EXCH_UPLOAD_MASTER.GET_ZUBNUM(N.FK_ID, 7) N_TOOTH7, -- Номер зуба (справочник ZF)
                     ASU.PKG_EXCH_UPLOAD_MASTER.GET_ZUBNUM(N.FK_ID, 8) N_TOOTH8, -- Номер зуба (справочник ZF)
                     ASU.PKG_EXCH_UPLOAD_MASTER.GET_POVERHN(N.FK_ID, 1) P_TOOTH1, -- поверхность зуба (справочник PZ)
                     ASU.PKG_EXCH_UPLOAD_MASTER.GET_POVERHN(N.FK_ID, 2) P_TOOTH2, -- поверхность зуба (справочник PZ)
                     ASU.PKG_EXCH_UPLOAD_MASTER.GET_POVERHN(N.FK_ID, 3) P_TOOTH3, -- поверхность зуба (справочник PZ)
                     ASU.PKG_EXCH_UPLOAD_MASTER.GET_POVERHN(N.FK_ID, 4) P_TOOTH4, -- поверхность зуба (справочник PZ)
                     ASU.PKG_EXCH_UPLOAD_MASTER.GET_POVERHN(N.FK_ID, 5) P_TOOTH5, -- поверхность зуба (справочник PZ)
                     ASU.PKG_EXCH_UPLOAD_MASTER.GET_POVERHN(N.FK_ID, 6) P_TOOTH6, -- поверхность зуба (справочник PZ)
                     ASU.PKG_EXCH_UPLOAD_MASTER.GET_POVERHN(N.FK_ID, 7) P_TOOTH7, -- поверхность зуба (справочник PZ)
                     ASU.PKG_EXCH_UPLOAD_MASTER.GET_POVERHN(N.FK_ID, 8) P_TOOTH8, -- поверхность зуба (справочник PZ)

                     -- Ефимов В.А. 05.05.2010 Добавил поля PLACE_N, DOC_SPEC_N, DOC_SPEC_W http://192.168.1.2:15000/redmine/issues/show/5056
                     EXCH43.PKG_EXCHANGE.GET_THEIR_ID(ASU.GET_EIS_COMPANYID,
                                                      'PLACE',
                                                      'TOTDEL',
                                                      (SELECT NVL(MAX(TSOTR.FK_OTDELID), 0) FROM ASU.TSOTR WHERE TSOTR.FK_ID = N.FK_VRACHID)) PLACE_N, -- Отделение врача, назначившего услугу

                     -- Ефимов В.А. http://192.168.1.2:15000/redmine/issues/show/5372
                     -- Для того чтобы исходники для СургутТравма и Ханты были одинаковыми добавлена константа GetVrachkab_naz_Medspec
                     -- Если GetVrachkab_naz_Medspec = 0 то значение берётся из соответствия 'MEDSPEC' и 'TS_SPRAV' (СургутТравма),
                     -- иначе из поля fk_medspec таблицы tvrachkab_naz (Ханты, настраивается в NazIspolRights.exe)
                     decode(asu.GetVrachkab_naz_Medspec,
                            0,
                            EXCH43.PKG_EXCHANGE.GET_THEIR_ID(ASU.GET_EIS_COMPANYID,
                                                             'MEDSPEC',
                                                             'TS_SPRAV',
                                                             (SELECT NVL(MAX(TSOTR.FK_SPRAVID), 0) FROM ASU.TSOTR WHERE TSOTR.FK_ID = N.FK_VRACHID)),
                            (select MAX(tvkn.fk_medspec) fk_medspec
                               from asu.tvrachkab_naz tvkn
                               left join asu.tvrachkab tvk on tvk.fk_id = tvkn.fk_sotrkabid
                              where tvkn.fk_smid = N.FK_SMID
                                and tvk.fk_sotrid = n.fk_vrachid
                                and asu.GetVrachkab_naz_Medspec > 0
                              group by tvkn.fk_smid, tvk.fk_sotrid)) DOC_SPEC_N,

                     decode(asu.GetVrachkab_naz_Medspec,
                            0,
                            EXCH43.PKG_EXCHANGE.GET_THEIR_ID(ASU.GET_EIS_COMPANYID,
                                                             'MEDSPEC',
                                                             'TS_SPRAV',
                                                             (SELECT NVL(MAX(TSOTR.FK_SPRAVID), 0)
                                                                FROM ASU.TSOTR
                                                               WHERE TSOTR.FK_ID =
                                                                     decode(decode(trl.fk_vrachid, null, n.fk_ispolid, 0, n.fk_ispolid, trl.fk_vrachid),
                                                                            null,
                                                                            trl.fk_vrachid,
                                                                            decode(trl.fk_vrachid, null, n.fk_ispolid, 0, n.fk_ispolid, trl.fk_vrachid)))),
                            (select MAX(tvkn.fk_medspec) fk_medspec
                               from asu.tvrachkab_naz tvkn
                               left join asu.tvrachkab tvk on tvk.fk_id = tvkn.fk_sotrkabid
                              where tvkn.fk_smid = N.FK_SMID
                                and tvk.fk_sotrid = decode(decode(decode(trl.fk_vrachid, null, n.fk_ispolid, 0, n.fk_ispolid, trl.fk_vrachid),
                                                                  null,
                                                                  trl.fk_vrachid,
                                                                  decode(trl.fk_vrachid, null, n.fk_ispolid, 0, n.fk_ispolid, trl.fk_vrachid)),
                                                           null,
                                                           trl.fk_vrachid,
                                                           decode(decode(trl.fk_vrachid, null, n.fk_ispolid, 0, n.fk_ispolid, trl.fk_vrachid),
                                                                  null,
                                                                  trl.fk_vrachid,
                                                                  decode(trl.fk_vrachid, null, n.fk_ispolid, 0, n.fk_ispolid, trl.fk_vrachid)))
                                and asu.GetVrachkab_naz_Medspec > 0
                              group by tvkn.fk_smid, tvk.fk_sotrid)) DOC_SPEC_W,

                     -- Ефимов В.А. 20110202 http://192.168.1.2:15000/redmine/issues/show/9355
                     -- добавил поле PROFMP_ID, заполняется аналогично DOC_SPEC_N и DOC_SPEC_W, но берётся врач закрывший талон
                     -- Efimov V.A. 20121025 http://192.168.1.9/redmine/issues/20617 Если константа GET_MIC_FIZTER_PROFMP имеет значение
                     decode(decode(asu.GET_MIC_FIZTER_PROFMP, -1, 1, 0) + decode(ts_f.fk_id, null, 0, 1) + decode(ts_k.fk_id, null, 0, 1),
                            0,
                            asu.GET_MIC_FIZTER_PROFMP,
                            EXCH43.PKG_EXCHANGE.GET_THEIR_ID(ASU.GET_EIS_COMPANYID,
                                                             'EXT_PROFMP_P',
                                                             'TS_SPRAV',
                                                             decode(asu.GetVrachkab_naz_Medspec,
                                                                    0,
                                                                    (SELECT NVL(MAX(TSOTR.FK_SPRAVID), 0) FROM ASU.TSOTR WHERE TSOTR.FK_ID = tst.fk_id),
                                                                    EXCH43.PKG_EXCHANGE.GET_OUR_ID('MEDSPEC',
                                                                                                   'TS_SPRAV',
                                                                                                   (select MAX(tvkn.fk_medspec) fk_medspec
                                                                                                      from asu.tvrachkab_naz tvkn
                                                                                                      left join asu.tvrachkab tvk on tvk.fk_id = tvkn.fk_sotrkabid
                                                                                                     where tvkn.fk_smid = N.FK_SMID
                                                                                                       and tvk.fk_sotrid = tst.fk_id
                                                                                                       and asu.GetVrachkab_naz_Medspec > 0
                                                                                                     group by tvkn.fk_smid, tvk.fk_sotrid))))) PROFMP_ID

                FROM ASU.TAMBTALON TT
               INNER JOIN EXCH43.TTMPLST T on T.FN_CODE = TT.FK_ID
               INNER JOIN asu.TEXCHUPLOAD_BIG_TMP BT on BT.FK_ID = T.FN_CODE
               INNER JOIN ASU.TAMBTALON_NAZ AN on AN.FK_TALONID = TT.FK_ID
               INNER JOIN ASU.VNAZ N on N.FK_ID = AN.FK_NAZID
                left join (select vr.fk_nazid, Max(vr.fk_vrachid_last) fk_vrachid_last -- 20110829 Efimov V.A. Определение врача по asu.TRESLECH добавлено по предложению Маши Коваленко http://192.168.1.9/redmine/issues/12832
                            from (select vr.fk_nazid,
                                         LAST_VALUE(vr.fk_vrachid) OVER(PARTITION BY vr.fk_nazid ORDER BY vr.fk_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fk_vrachid_last
                                    from asu.TRESLECH vr
                                   where nvl(vr.fk_vrachid, 0) > 0) vr
                           group by vr.fk_nazid) vr on vr.fk_nazid = n.fk_id
                left join login.tsotr tst on tst.fk_id =
                                             nvl(decode(nvl(vr.fk_vrachid_last, n.fk_ispolid), 0, null, nvl(vr.fk_vrachid_last, n.fk_ispolid)), n.fk_vrachid)
                LEFT JOIN ASU.Tnazdetail ND on ND.FK_NAZID = N.FK_ID
                LEFT JOIN ASU.TNAZLECH TNL ON TNL.FK_ID = N.FK_ID
                LEFT JOIN ASU.TRESLECH TRL ON TRL.FK_NAZID = TNL.FK_ID
                left join (SELECT s.fk_id
                            FROM asu.tsmid s
                           WHERE s.fk_owner IN (SELECT fk_id FROM asu.tsmid WHERE fc_synonim = 'KONS_SPEC')
                              or S.FC_SYNONIM IN ('PERV_OSMOTR', 'TECHBOLEZNI', 'OSM_DNEV', 'KONS_PRIEM_VRACH_OSM')) tosm on tosm.fk_id = n.fk_smid

                -- услуга
                left join (SELECT H.FK_ID, H.CODE, H.FC_NAME, H.FK_PARENT, ths.fk_smid, c.fd_date1, c.fd_date2, c.fn_cost
                            FROM ASU.THEAL H
                           inner join ASU.THEAL_COST C on C.FK_HEALID = H.FK_ID
                           inner join ASU.THEAL_SMID ths on ths.fk_heal = H.FK_ID
                           WHERE h.fp_healtype = 1 and
                                 h.fk_doctypeid in (select tdt.fk_id from asu.ttypedoc tdt where tdt.fc_synonim in ('OMS', 'BUDZHET'))) th
                       on th.fk_smid = n.fk_smid
                      and T.FD_DATEBEG BETWEEN th.FD_DATE1 AND NVL(th.FD_DATE2, T.FD_DATEBEG)
                      and (tosm.fk_id is null or th.code like DECODE(ASU.IS_ADULT(T.FD_ROJD, TRUNC(decode(trl.fd_ins, null, n.fd_run, trl.fd_ins))), 1, 'TPV%', 'TPD%'))
                left join asu.tsmid ts on ts.fk_id = n.fk_smid

                left join (select tr.FC_ASKID, tr.FC_REPLYID
                            from asu.treplytable tr
                           where tr.FC_ASK = 'ASU.THEAL'
                             and tr.FC_ASKFIELD = 'CODE'
                             and tr.FC_REPLY = 'MIC_IS_FILL_TYPE_V'
                             and tr.FC_REPLYFIELD = 'FL_TRUE') tr_IS_FILL_TYPE_V on tr_IS_FILL_TYPE_V.fc_askid = th.code

                left join (select ts.fk_id
                            from asu.tsmid ts
                           where asu.GET_MIC_FIZTER_PROFMP > -1
                          connect by prior ts.fk_id = ts.fk_owner
                           start with ts.fc_synonim = 'PROC_FIZTER') ts_f on ts_f.fk_id = n.fk_smid

                left join (select ts.fk_id
                            from asu.tsmid ts
                           where asu.GET_MIC_FIZTER_PROFMP > -1
                             and ts.fk_owner = (select ts.fk_id from asu.tsmid ts where ts.fc_synonim = 'KONS_SPEC')) ts_k on ts_k.fk_id = n.fk_smid

                left join (select ROW_NUMBER() OVER(PARTITION BY t.fk_smid ORDER BY t.fk_heal) rn, t.fk_smid, t.fk_heal
                             from (select ths.fk_smid, ths.fk_heal
                                     from asu.theal_smid ths
                                    inner join ASU.THEAL th on th.fk_id = ths.fk_heal
                                    where FP_HEALTYPE = 1
                                    group by ths.fk_smid, ths.fk_heal) t) shn on shn.fk_smid = th.fk_smid
                                                                             and shn.fk_heal = th.fk_id

                left join (SELECT s.fk_id
                            FROM asu.tsmid s
                           where asu.get_mic_add_only_res_test = 1
                          CONNECT BY PRIOR s.fk_id = s.fk_owner
                           START WITH s.fk_id = asu.get_analid) ts_anal on ts_anal.fk_id = n.fk_smid
                left join (select tra.fk_nazid, count(*) fn_count
                            from asu.tresan tra
                           where asu.get_mic_add_only_res_test = 1
                             and (tra.fk_sos is null or tra.fk_sos <> asu.Get_Nazcancel)
                             and tra.fl_zakl = 0
                           group by tra.fk_nazid) tr_anal on tr_anal.fk_nazid = n.fk_id

                -- 20130528 Efimov http://192.168.1.9/redmine/issues/23952 Если в талоне выполнена консультация с синонимом KONS_DISP_1 нужно передавать в ЕИС ОМС только одну эту консультацию с правильным кодов в зависимости от возраста и пола пациента
                left join (select tan.fk_talonid, max(vn.fk_id) fk_nazid from asu.tsmid ts
                            inner join asu.vnaz VN ON VN.FK_SMID = TS.FK_ID
                            inner join asu.tambtalon_naz tan on tan.fk_nazid = vn.fk_id
                           where ts.fc_synonim = 'KONS_DISP_1'
                             and VN.FK_NAZSOSID = ASU.GET_VYPNAZSOSID
                           group by tan.fk_talonid) td on td.fk_talonid = tt.fk_id
                LEFT JOIN (SELECT r.FC_ASKID fc_code, r.fc_replyid fn_age
                             FROM asu.treplytable r
                            WHERE r.FC_ASK = 'THEAL_DISP'
                              AND r.FC_ASKFIELD = 'CODE'
                              AND r.FC_REPLY = 'NUMBERS'
                              AND r.FC_REPLYFIELD = 'RN') r ON td.fk_talonid is not null
                                                           AND r.fn_age = TRUNC(MONTHS_BETWEEN(tt.fd_opened , t.FD_ROJD) / 12)
                                                           AND r.fc_code LIKE 'TD%' || decode(BT.pol, 'Ж', 'W', 'M') || '.1' || '.%'
                LEFT JOIN ASU.THEAL Hr ON Hr.CODE = r.fc_code
                LEFT JOIN ASU.THEAL_COST Cr ON Cr.FK_HEALID = Hr.FK_ID
                                          AND T.FD_DATEBEG BETWEEN Cr.FD_DATE1 AND NVL(Cr.FD_DATE2, T.FD_DATEBEG)

               WHERE decode(trl.fk_sos, null, N.FK_NAZSOSID, trl.fk_sos) = ASU.GET_VYPNAZSOSID
                 and ((td.fk_talonid is null and shn.fk_heal is not null) or (td.fk_talonid is not null and td.fk_nazid = n.fk_id and Cr.FK_HEALID is not null))
                    --Melnikov 17.05.2012
                 AND ((asu.get_mic_add_only_res_test = 0) or (ts_anal.fk_id is null or (ts_anal.fk_id is not null and (tr_anal.fn_count > 0))))
                 ) t;
  end;
  ----------------------------------------------------
  procedure FILL_OPER IS
  begin
    delete from asu.texchmic_oper;

    insert into asu.texchmic_oper
      (PID,
       ID_ILL,
       ID_SERV,
       N_MAP,
       FK_OTDELID,
       DATE_OPER,
       DATE_OPER_FOR_SERV,
       MORPHEY,
       DOCTOR_N,
       DOCTOR_N_ID,
       DOCTOR_W,
       DOCTOR_W_ID,
       PLACE_W,
       PLACE_N,
       DOC_SPEC_N,
       DOC_SPEC_W,
       DOC_SPEC,
       DOC_SPECNAME,
       DOC_SPECNAME_OUR,
       TYPE_OPER,
       COMPL,
       O_ANASTEZ,
       O_OPERATS,
       WAS_LOADED,
       CIPHER)
      SELECT t.pid,
             t.id_ill,
             n.fk_id id_serv,
             t.n_map,
             --       t.Fk_Otdelid,
             EXCH43.PKG_EXCHANGE.GET_THEIR_ID(ASU.GET_EIS_COMPANYID,
                                              'PLACE',
                                              'TOTDEL',
                                              (SELECT MAX(fk_otdelid) FROM login.tsotr WHERE fk_id = nvl(nvl(n.fk_vrachid, n.fk_ispolid), 0))) Fk_Otdelid,
             to_char(n.fd_run, 'DD.MM.YYYY HH:MI:SS') date_oper,
             to_char(n.fd_run, 'DD.MM.YYYY') date_oper_for_serv,
             exch43.pkg_exchange.get_their_id(asu.get_eis_companyid,
                                              'MORPHEY',
                                              'TSMID',
                                              (SELECT MAX(i.fk_smid)
                                                 FROM ASU.tib i, ASU.tsmid s
                                                WHERE i.fk_smid = s.fk_id
                                                  AND i.fk_pacid = n.fk_id
                                                  AND i.fk_smid in
                                                      (select fk_id from asu.tsmid where fk_owner = stat.pkg_statutil.get_smidid('PROTHOPER_OBEZBOL')))) morphey,

             -- Ефимов В.А. 02.06.2010 Дабавил получение полей  DOCTOR_N (вместо doc_name), DOCTOR_W, PLACE_w, PLACE_N, DOC_SPEC_N, DOC_SPEC_W http://94.28.48.98:15000/redmine/issues/show/5372
             (SELECT DECODE(MAX(ST.FC_FAM || ' ' || ST.FC_NAME || ' ' || FC_OTCH), '  ', 'НЕТ', MAX(ST.FC_FAM || ' ' || ST.FC_NAME || ' ' || FC_OTCH))
                FROM ASU.TSOTR ST
               WHERE ST.FK_ID = NVL(N.FK_VRACHID, 0)) DOCTOR_N, --Назначенный доктор
             NVL(N.FK_VRACHID, 0) DOCTOR_N_ID,
             (SELECT DECODE(MAX(ST.FC_FAM || ' ' || ST.FC_NAME || ' ' || FC_OTCH), '  ', 'НЕТ', MAX(ST.FC_FAM || ' ' || ST.FC_NAME || ' ' || FC_OTCH))
                FROM ASU.TSOTR ST
               WHERE ST.FK_ID = NVL(N.Fk_Ispolid, 0)) DOCTOR_W, --Выполнивший доктор
             NVL(N.Fk_Ispolid, 0) DOCTOR_W_ID,
             EXCH43.PKG_EXCHANGE.GET_THEIR_ID(ASU.GET_EIS_COMPANYID,
                                              'PLACE',
                                              'TOTDEL',
                                              (SELECT NVL(MAX(TSOTR.FK_OTDELID), 0) FROM ASU.TSOTR WHERE TSOTR.FK_ID = N.Fk_Ispolid)) PLACE_w, -- Отделение выполнения
             EXCH43.PKG_EXCHANGE.GET_THEIR_ID(ASU.GET_EIS_COMPANYID,
                                              'PLACE',
                                              'TOTDEL',
                                              (SELECT NVL(MAX(TSOTR.FK_OTDELID), 0) FROM ASU.TSOTR WHERE TSOTR.FK_ID = N.FK_VRACHID)) PLACE_N, -- Отделение врача, назначившего услугу
             EXCH43.PKG_EXCHANGE.GET_THEIR_ID(ASU.GET_EIS_COMPANYID,
                                              'MEDSPEC',
                                              'TS_SPRAV',
                                              (SELECT NVL(MAX(TSOTR.FK_SPRAVID), 0) FROM ASU.TSOTR WHERE TSOTR.FK_ID = N.FK_VRACHID)) DOC_SPEC_N, -- Специальность врача, назначившего услугу
             EXCH43.PKG_EXCHANGE.GET_THEIR_ID(ASU.GET_EIS_COMPANYID,
                                              'MEDSPEC',
                                              'TS_SPRAV',
                                              (SELECT NVL(MAX(TSOTR.FK_SPRAVID), 0) FROM ASU.TSOTR WHERE TSOTR.FK_ID = N.FK_ISPOLID)) DOC_SPEC_W, -- Специальность врача, выполнившего услугу

             --       asu.get_sotr_full_name(nvl(nvl(n.fk_vrachid, n.fk_ispolid), 0)) doc_name,

             exch43.pkg_exchange.get_their_id(exch43.pkg_exchange.get_main_companyid,
                                              'VPD',
                                              'TS_SPRAV',
                                              (SELECT MAX(s.fk_spravid) FROM asu.tsotr s WHERE s.fk_id = nvl(nvl(n.fk_vrachid, n.fk_ispolid), 0))) doc_spec,
             exch43.pkg_exchange.get_their_name(exch43.pkg_exchange.get_main_companyid,
                                                'VPD',
                                                'TS_SPRAV',
                                                (SELECT MAX(s.fk_spravid) FROM asu.tsotr s WHERE s.fk_id = nvl(nvl(n.fk_vrachid, n.fk_ispolid), 0))) doc_specname,
             (SELECT fc_name FROM asu.ts_sprav WHERE fk_id = (SELECT MAX(s.fk_spravid) FROM asu.tsotr s WHERE s.fk_id = nvl(nvl(n.fk_vrachid, n.fk_ispolid), 0))) doc_specname_our,
             nvl(exch43.pkg_exchange.get_their_id(asu.get_eis_companyid,
                                                  'TYPE_OPER',
                                                  'TSMID',
                                                  (SELECT NVL(MAX(FK_SMID), 1)
                                                     FROM asu.tib
                                                    WHERE fk_pacid = n.fk_id
                                                      AND fk_smeditid IN (SELECT fk_id FROM asu.tsmid WHERE fc_synonim = 'PROTHOPER_SROCH'))),
                 1) type_oper,
             (SELECT substr(SYS_XMLAGG(XMLELEMENT(COL, asu.get_smidname(i.fk_smid) || ', ')).EXTRACT('/ROWSET/COL/text()').GETSTRINGVAL(), 1, 255) compl
                FROM asu.tib i
               WHERE i.fk_pacid = n.fk_id
                 AND i.fk_smeditid = stat.pkg_statutil.get_smidid('OSLOG_OPER')) compl,
             '' o_anastez,
             '' o_operats,
             (SELECT DECODE(COUNT(1), 0, 0, 1)
                FROM exch43.toutpaclog
               WHERE fk_pacid = n.fk_pacid
                 AND fk_nazid = n.fk_id
                 AND fc_function = 'ADD_OPER') WAS_LOADED,

             nvl(decode(asu.GET_MIC_OPERCODE_TO_CIPHER,
                        1,
                        ti_lpu_napr.FC_CHAR,
                        decode((SELECT MAX(ts.fc_type) fc_type FROM asu.tsmid ts WHERE ts.fc_synonim = 'PROTHOPER_NAME'),
                               'COMBOBOX',
                               (SELECT substr(MAX(ts.fc_synonim), 5, length(MAX(ts.fc_synonim)))
                                  FROM asu.tsmid ts
                                 WHERE ts.fk_id = (SELECT MAX(I.fk_smid)
                                                     FROM ASU.TIB I
                                                    WHERE I.FK_SMEDITID IN (SELECT ts.fk_id
                                                                              FROM asu.tsmid ts
                                                                             WHERE (fl_del <> 1 OR fl_del IS NULL)
                                                                               AND ts.fc_synonim = 'PROTHOPER_NAME')
                                                      AND EXISTS (SELECT tsm.fk_id
                                                             FROM asu.tsmid tsm
                                                            WHERE tsm.fk_id = FK_SMID
                                                              AND tsm.fk_owner = I.FK_SMEDITID)
                                                      AND I.FK_PACID = n.fk_pacid)),
                               'OPERATION')),
                 'OPERATION') CIPHER
        FROM asu.vnaz n
       inner join asu.texchupload_big_tmp t on t.fk_id = n.fk_pacid
       inner join (Select ts.fk_id, '' fc_name
                     from asu.tsmid ts
                    where (fl_del <> 1 or fl_del is null)
                      and ts.fc_synonim in ('KONS_PROTHOPER', 'RENTGENXIR_OPER', 'ABORT', 'UROLOG_OPER')
                   union all
                   SELECT FK_ID, fc_name
                     FROM ASU.TSMID
                    WHERE ASU.PKG_SMINI.READSTRING('CONFIG', 'DB_NAME', 'H') = 'SK'
                   CONNECT BY PRIOR fk_id = fk_owner
                    START WITH FC_SYNONIM = 'RENTGENXIR_ISSLED') ts on ts.fk_id = n.fk_smid
        left join (select fk_pacid, max(FC_CHAR) FC_CHAR
                     from asu.tib
                    where fk_smid = (select fk_id from asu.tsmid t where fc_synonim = 'OPER_KOD')
                    group by fk_pacid) ti_lpu_napr on ti_lpu_napr.fk_pacid = n.fk_id
       WHERE N.FK_NAZSOSID = ASU.GET_VYPNAZSOSID;
  end;
  ----------------------------------------------------
  procedure Calculate(pBeg DATE, pEnd DATE) is
  begin
    CLEAR_FIRST_TABLE;
    FILL_FIRST_TABLE(pBeg, pEnd, 2);
    FILL_ADR_FIRST_TABLE;
    CLEAR_LAST_TABLE;
    CLEAR_MOVE_TABLE;
    CLEAR_MOVE_BED_TABLE;
    EXECUTE IMMEDIATE ('TRUNCATE TABLE ASU.TEXCH_TOOTH_NAZ');

    -- Случаи
    FOR C IN (SELECT t.FK_PACID, t.FK_TALONID, t.FK_PEPLID, t.FK_COMPANYID, t.FP_POLY FROM asu.TEXCHUPLOAD_TMP t) LOOP
      FILL_LAST_TABLE_ROW(c.fk_pacid, c.fk_talonid, c.fk_peplid, c.fk_companyid, c.fp_poly);
      IF NVL(c.fk_talonid, 0) > 0 THEN
        FOR C2 IN (SELECT FK_NAZID FROM ASU.TAMBTALON_NAZ WHERE FK_TALONID = c.fk_talonid) LOOP
          FILL_TOOTH_TABLE(c2.fk_nazid);
        END LOOP;
      END IF;
    END LOOP;

    FILL_TABLE_ROWS;

    EXECUTE IMMEDIATE ('TRUNCATE TABLE EXCH43.TTMPLST');

    DELETE FROM ASU.THEAL_TMP;
    INSERT INTO ASU.THEAL_TMP
      (FK_ID, CODE, FC_NAME, FK_OWNER)
      (SELECT FK_ID, CODE, FC_NAME, FK_PARENT FROM ASU.THEAL WHERE FP_HEALTYPE = 1 CONNECT BY PRIOR FK_ID = FK_PARENT START WITH FL_TMP = 1);

    -- Услуги
    FOR C IN (SELECT T.FK_ID, T.FK_TYPEDOC_EIS, T.PID, T.POLICYSER, T.POLICYNUM, T.DIA_E, T.DATE_S, T.DDMMYYYY FROM asu.TEXCHUPLOAD_BIG_TMP T) LOOP
      INSERT INTO EXCH43.TTMPLST
        (FN_CODE, FN_TYPEDOC, FN_PERSON, FC_POLICYSER, FC_POLICYNUM, FC_DIAG, FD_DATEBEG, FD_ROJD)
      VALUES
        (c.FK_ID, c.FK_TYPEDOC_EIS, c.PID, c.policyser, c.policynum, c.DIA_E, c.DATE_S, c.DDMMYYYY);
    END LOOP;

    FILL_USL;
    FILL_oper;
  end;
  ----------------------------------------------------
--  procedure SetCalculateParams(pBeg DATE, pEnd DATE) is
--  begin
--    delete from asu.TMIC_EXCH_CALCULATEPARAMS;

--    insert into asu.TMIC_EXCH_CALCULATEPARAMS (FD_BEG, FD_END) values (pBeg, pEnd);
--  end;
  ----------------------------------------------------
--  procedure CalculateByParams is
--    vCount NUMBER;

--    pBeg              DATE;
--    pEnd              DATE;
--    pPeriod           Integer;
--  begin
--    select count(*) into vCount from asu.TDBF_EXCH_CalculateParams;

--    if vCount <> 1 then
--      pPeriod := 0;
--      select trunc(sysdate - pPeriod), trunc(sysdate) into pBeg, pEnd from dual;

--      SetCalculateParams(pBeg, pEnd);
--    end if;

--    select fd_beg, fd_end into pBeg, pEnd from asu.TMIC_EXCH_CalculateParams;

--    Calculate(pBeg, pEnd);
--  end;
  ----------------------------------------------------
  procedure UploadLPU is
    vStr           varchar2(4000);
    vRes           varchar2(4000);
    vADD_LPU_count integer;
  begin
    SELECT ASU.PKG_SMINI.READSTRING('EIS_ADD_LPU', 'LPU', '') || ';' || -- LPU,
           substr(ASU.PKG_SMINI.READSTRING('CONFIG', 'S_FULLNAME', ''), 1, 100) || ';' || -- NAME,
           substr(ASU.PKG_SMINI.READSTRING('CONFIG', 'SHORT_NAME', ''), 1, 32) || ';' || -- SHORT_NAME,
           ASU.PKG_SMINI.READSTRING('CONFIG', 'CREATE_DATE', '') || ';' || -- CREATE_DATE,
           ';' || -- CLOSE_DATE,
           ';' || -- PARENT_LPU,
           ASU.PKG_SMINI.READSTRING('CONFIG', 'S_PHONE', '') || ';' || -- PHONE,
           tcd.fc_fam || ';' || -- CHIEF_LAST_NAME,
           tcd.fc_name || ';' || -- CHIEF_FIRST_NAME,
           tcd.fc_otch || ';' || -- CHIEF_MIDDLE_NAME,
           ';' || -- CHECK_STATE_DATE,
           '1' || ';' || -- IN_OMS,
           ASU.PKG_SMINI.READSTRING('CONFIG', 'OKATO', '') || ';' || -- OKATO,
           ASU.PKG_SMINI.READSTRING('CONFIG', 'S_OGRN', '') || ';' || -- OGRN,
           ASU.PKG_SMINI.READSTRING('CONFIG', 'LPU_KLADR', '') || ';' || -- ADDRESS_KLADR,
           ASU.PKG_SMINI.READSTRING('CONFIG', 'S_HOUSE', '') || ';' || -- HOUSE,
           ASU.PKG_SMINI.READSTRING('CONFIG', 'S_KORPUS', '') || ';' || -- BUILDING,
           ';' || -- FLAT,
           '1' || ';' -- LPU_LEVEL
      into vStr
      FROM (select max(ts.fc_fam) fc_fam, max(ts.fc_name) fc_name, max(ts.fc_otch) fc_otch
              from login.tsotr ts
             inner join asu.ts_sprav tss on tss.fk_id = ts.fk_spravid
             where tss.fk_id = asu.get_chiefdoc_ts_sprav_id) tcd;

    select count(*) fn_count
      into vADD_LPU_count
      from exch43.TOUTPACLOG t
     where t.fp_result = 0
       and t.fc_function = 'ADD_LPU'
       and t.fc_str = vStr;

    if vADD_LPU_count = 0 then
      vRes := EXCH43.LoadADD_LPUInEis(vStr);
    end if;
  end;
  ----------------------------------------------------
  procedure UploadUSL(pID IN NUMBER, pID_ILL IN NUMBER) is
    vStr varchar2(4000);
    vRes varchar2(4000);
  begin
    FOR c IN (select *
                from asu.texchmic_usl t
               WHERE t.NAME_USL IS NOT NULL
                 and t.ID_ILL = pID_ILL) LOOP
      vStr := c.ID_SERV || ';' || -- Идентификатор услуги (ID_SERV)
              c.ID_ILL || ';' || -- Идентификатор случая (ID_ILL)
              pID || ';' || -- Added 20100405 by Linnikov Идентификатор пациента (PID)
              c.FN_TYPEDOC || ';' || -- Вид оплаты (KINDCOST.RID) (KINDCOST)
              c.TYPE_V || ';' || -- Тип приема (VIDPR.RID) (TYPE_V)
              c.KOD_USL || ';' || -- Шифр назначенной услуги (MEDUS_MTS.CIPHER) (CIPHER_NAZ)
              c.KOL_USL || ';' || -- Количество назначенное (KOL_NAZ)
              to_char(c.DATE_USL, 'dd.mm.yyyy') || ';' || -- Назначенная дата выполнения дд.мм.гггг (DATE_NAZ)
              c.DOCTOR_N || ';' || -- Назначенный доктор (DOCTOR_N)
              c.KOD_USL || ';' || -- Шифр выполненной услуги (MEDUS_MTS.CIPHER) (CIPHER_WORK)
              c.KOL_USL || ';' || -- Выполненное количество (KOL_WORK)
              to_char(c.DATE_USL, 'dd.mm.yyyy') || ';' || -- Дата выполнения дд.мм.гггг (DATE_WORK)
              c.DOCTOR_W || ';' || -- Выполнивший доктор (DOCTOR_W)
              c.PLACE_W || ';' || -- Отделение выполнения (PLACE_W)
              c.N_QU1 || ';' || -- Сегмент 1 (N_QU1)
              c.N_TOOTH1 || ';' || -- Зуб 1 (N_TOOTH1)
              c.P_TOOTH1 || ';' || -- Поверхность 1 (P_TOOTH1)
              c.N_QU2 || ';' || -- Сегмент 2 (N_QU2)
              c.N_TOOTH2 || ';' || -- Зуб 2 (N_TOOTH2)
              c.P_TOOTH2 || ';' || -- Поверхность 2 (P_TOOTH2)
              c.N_QU3 || ';' || -- Сегмент 3 (N_QU3)
              c.N_TOOTH3 || ';' || -- Зуб 3 (N_TOOTH3)
              c.P_TOOTH3 || ';' || -- Поверхность 3 (P_TOOTH3)
              c.N_QU4 || ';' || -- Сегмент 4 (N_QU4)
              c.N_TOOTH4 || ';' || -- Зуб 4 (N_TOOTH4)
              c.P_TOOTH4 || ';' || -- Поверхность 4 (P_TOOTH4)
              c.N_QU5 || ';' || -- Сегмент 5 (N_QU5)
              c.N_TOOTH5 || ';' || -- Зуб 5 (N_TOOTH5)
              c.P_TOOTH5 || ';' || -- Поверхность 5 (P_TOOTH5)
              c.N_QU6 || ';' || -- Сегмент 6 (N_QU6)
              c.N_TOOTH6 || ';' || -- Зуб 6 (N_TOOTH6)
              c.P_TOOTH6 || ';' || -- Поверхность 6 (P_TOOTH6)
              c.N_QU7 || ';' || -- Сегмент 7 (N_QU7)
              c.N_TOOTH7 || ';' || -- Зуб 7 (N_TOOTH7)
              c.P_TOOTH7 || ';' || -- Поверхность 7 (P_TOOTH7)
              c.N_QU8 || ';' || -- Сегмент 8 (N_QU8)
              c.N_TOOTH8 || ';' || -- Зуб 8 (N_TOOTH8)
              c.P_TOOTH8 || ';' || -- Поверхность 8 (P_TOOTH8)
              c.PLACE_N || ';' || -- Отделение врача, назначившего услугу
              c.DOC_SPEC_N || ';' || -- Специальность врача, назначившего услугу
              c.DOC_SPEC_W || ';' || -- Специальность врача, выполнившего услугу
              c.PROFMP_ID || ';'; -- Специальность врача, выполнившего услугу

      vRes := EXCH43.DO_OUTUSL(vStr, c.ID_ILL, c.ID_SERV);

    /*
          if (Pos('2 PLACE_W', oqUploadUsl.GetVariable('pres')) > 0) and
             (TDBUtils.GetConstantDef('GET_MIC_USE_ADD_PLACE', frmMain.osMain, 0) = 1)
          then
            RegPlaceInEis(odsUsl.FieldByName('ID_ILL').AsInteger, odsUsl.FieldByName('PLACE_W').AsInteger, 'DO_OUTUSL');
          if (Pos('2 PLACE_N', oqUploadUsl.GetVariable('pres')) > 0) and
             (TDBUtils.GetConstantDef('GET_MIC_USE_ADD_PLACE', frmMain.osMain, 0) = 1)
          then
            RegPlaceInEis(odsUsl.FieldByName('ID_ILL').AsInteger, odsUsl.FieldByName('PLACE_N').AsInteger, 'DO_OUTUSL');

          if (Pos('2 DOCTOR_N', oqUploadUsl.GetVariable('pres')) > 0) and
             (TDBUtils.GetConstantDef('GET_MIC_USE_ADD_DOCTOR', frmMain.osMain, 0) = 1)
          then
            RegDoctorInEis(odsUsl.FieldByName('ID_ILL').AsInteger, odsUsl.FieldByName('DOCTOR_N_ID').AsInteger, 'DO_OUTUSL');
    */
    END LOOP;
  end;
  ----------------------------------------------------
  procedure UploadOper(pID IN NUMBER, pID_ILL IN NUMBER) is
    vStr varchar2(4000);
    vRes varchar2(4000);
  begin

--96005124;95958478;99197263;1;;OPERATION;1;20.11.2012;Силин Илья Алексеевич;OPERATION;1;20.11.2012;Силин Илья Алексеевич;9;;;;;;;;;;;;;;;;;;;;;;;;;9;160;160;
--95918952;95866065;93451619;1;;OPERATION;116.11.2012;Прокопенко Роман Николаевич;OPERATION;1;;16.11.2012;Прокопенко Роман Николаевич;9;;;;;;;;;;;;;;;;;;;;;;;;;9;160;160;

    FOR c IN (select * from asu.texchmic_oper t where t.ID_ILL = pID_ILL) LOOP
      vStr := c.ID_SERV || ';' || -- Идентификатор услуги (ID_SERV)
              c.ID_ILL || ';' || -- Идентификатор случая (ID_ILL)
              to_char(pID) || ';' || -- Идентификатор пациента (PID)
              '1;' || -- Вид оплаты (KINDCOST.RID) (KINDCOST)
              ';' || -- Тип приема (VIDPR.RID) (TYPE_V) Ефимов В.А. 02.06.2010 Заменил на пустое значнеие по предложению Засименко http://94.28.48.98:15000/redmine/issues/show/5372
              c.CIPHER || ';' || --  Шифр выполненной услуги, добавил Ефимов В.А. 13.12.2010 http://192.168.1.2:15000/redmine/issues/show/8449 (CIPHER_NAZ)
              '1;' || -- Количество назначенное (KOL_NAZ)
              to_char(c.date_oper_for_serv, 'dd.mm.yyyy') || ';' || --  Назначенная дата выполнения дд.мм.гггг (DATE_NAZ)
              c.DOCTOR_N || ';' || -- Назначенный доктор (DOCTOR_N)
              c.CIPHER || ';' || -- Шифр выполненной услуги, добавил Ефимов В.А. 13.12.2010 http://192.168.1.2:15000/redmine/issues/show/8449 (CIPHER_WORK)
              '1;' || -- Выполненное количество (KOL_WORK)
              to_char(c.date_oper_for_serv, 'dd.mm.yyyy') || ';' || -- Дата выполнения дд.мм.гггг (DATE_WORK)
              c.DOCTOR_W || ';' || -- Выполнивший доктор (DOCTOR_W)
              c.PLACE_W || ';' || -- Отделение выполнения (PLACE_W)
              ';;;' || ';;;' || ';;;' || ';;;' || ';;;' || ';;;' || ';;;' || ';;;' || c.PLACE_N || ';' || -- Отделение врача, назначившего услугу
              c.DOC_SPEC_N || ';' || -- Специальность врача, назначившего услугу
              c.DOC_SPEC_W || ';'; -- Специальность врача, выполнившего услугу

      vRes := EXCH43.DO_OUTUSL(vStr, c.ID_ILL, c.ID_SERV);

    /*
      if (Pos('2 DOCTOR_N', oqUploadUsl.GetVariable('pres')) > 0) and
         (TDBUtils.GetConstantDef('GET_MIC_USE_ADD_DOCTOR', frmMain.osMain, 0) = 1)
      then
        RegDoctorInEis(odsUsl.FieldByName('ID_ILL').AsInteger, odsUsl.FieldByName('DOCTOR_N_ID').AsInteger, 'DO_OUTUSL');

      if (Pos('2 DOCTOR_W', oqUploadUsl.GetVariable('pres')) > 0) and
         (TDBUtils.GetConstantDef('GET_MIC_USE_ADD_DOCTOR', frmMain.osMain, 0) = 1)
      then
        RegDoctorInEis(odsUsl.FieldByName('ID_ILL').AsInteger, odsUsl.FieldByName('DOCTOR_W_ID').AsInteger, 'DO_OUTUSL');
    */

      vStr := c.ID_SERV || ';' || --Идентификатор услуги (ID_SERV)
              to_char(c.DATE_OPER, 'dd.mm.yyyy') || ';' || -- Дата операции, формат дд.мм.гггг чч:мм:сс, значение по умолчанию sysdate (DATE_OPER)
              c.MORPHEY || ';' || -- Тип наркоза (MORPHEY)
              c.TYPE_OPER || ';' || -- Тип операции (1-плановая, 2-экстренная) (TYPE_OPER)
              c.COMPL || ';' || -- Осложнения (COMPL)
              c.O_ANASTEZ || ';' || -- Осложнения анестезии (если несколько, то значения разделяются запятой) (O_ANASTEZ)
              c.O_OPERATS|| ';'; -- Осложнения оперативного вмешательств (если несколько, то значения разделяются запятой) (O_OPERATS)

      vRes := EXCH43.DO_OUTOPER(vStr, c.ID_ILL, c.ID_SERV);
    END LOOP;
  end;
  ----------------------------------------------------
  procedure UploadMove(pID IN NUMBER, pID_ILL IN NUMBER) is
    vStr varchar2(4000);
    vRes varchar2(4000);
  begin
    FOR c IN (SELECT * FROM ASU.TEXCHUPLOAD_MOVE t WHERE t.ID_ILL = pID_ILL) LOOP
      vStr := c.ID_ILL || ';' || -- Идентификатор случая
              to_char(pID) || ';' || -- Идентификатор пациента
              c.N_MAP || ';' || -- Номер истории болезни
              c.PLACE_1 || ';' || -- Код отделения откуда переведен пациент
              to_char(c.DATE_1, 'dd.mm.yyyy') || ';' || -- Дата с какой пациент был в предыдущем отделении
              c.DOCTOR_1 || ';' || -- Врач, переведший пациента
              c.DOCSPEC1 || ';' || --Врач, переведший пациента
              c.PLACE_2 || ';' || --Код отделения куда переведен пациент
              to_char(c.DATE_2, 'dd.mm.yyyy') || ';' || --Дата с какой идет перевод
              c.N_MOVE || ';' || -- Номер перевода по порядку
              c.DOCTOR_2 || ';' || --Врач, переведший пациента
              c.DOCSPEC2 || ';' || --Врач, переведший пациента
              c.PROFMP_ID || ';' || -- Врач, переведший пациента
              c.DIA || ';'; -- Врач, переведший пациента

      vRes := EXCH43.DO_OUTMOVE(vStr, pID_ILL);

    /*
        if (Pos('PLACE_1', oqUploadMove.GetVariable('pRes')) > 0) and
           (TDBUtils.GetConstantDef('GET_MIC_USE_ADD_PLACE', frmMain.osMain, 0) = 1)
        then
          RegPlaceInEis(odsMove.FieldByName('ID_ILL').AsInteger, odsMove.FieldByName('PLACE_1').AsInteger, 'DO_OUTMOVE');
        if (Pos('PLACE_2', oqUploadMove.GetVariable('pRes')) > 0) and
           (TDBUtils.GetConstantDef('GET_MIC_USE_ADD_PLACE', frmMain.osMain, 0) = 1)
        then
          RegPlaceInEis(odsMove.FieldByName('ID_ILL').AsInteger, odsMove.FieldByName('PLACE_2').AsInteger, 'DO_OUTMOVE');
    */
    END LOOP;
  end;
  ----------------------------------------------------
  procedure UploadMoveBed(pID IN NUMBER, pID_ILL IN NUMBER) is
    vStr varchar2(4000);
    vRes varchar2(4000);
  begin
    FOR c IN (select * from ASU.TEXCHUPLOAD_MOVE_BED t WHERE t.ID_ILL = pID_ILL) LOOP
      vStr := c.ID_ILL || ';' || -- Идентификатор случая
              to_char(PID) || ';' || -- Идентификатор пациента
              c.N_MAP || ';' || -- Номер карты в стационаре
              c.PLACE || ';' || -- Код отделения
              to_char(c.DATE_P, 'dd.mm.yyyy') || ';' || -- Дата перевода (dd.mm.yyyy)
              c.N_CHAMBER || ';' || -- Номер палаты
              c.N_KOIKA || ';' || -- Номер койки
              c.KOD_KOIKA || ';' || -- Код профиля койки
              c.PRIM || ';' || -- Примечание
              c.KOD_TABLE || ';' || -- Код стола
              c.KOD_KOIKA1 || ';' || -- Код разновидности койки
              c.KOD_REJIM || ';' || -- Код режима нахождения в стационаре
              c.KOD_NAGR || ';' || -- Код нагрузки
              c.KOD_MOVE_REJIM || ';'; -- Код двигательного режима
      /*
          if (Pos('2 PLACE', oqUploadMoveBed.GetVariable('pRes')) > 0) and
             (TDBUtils.GetConstantDef('GET_MIC_USE_ADD_PLACE', frmMain.osMain, 0) = 1)
          then
            RegPlaceInEis(odsMoveBed.FieldByName('ID_ILL').AsInteger, odsMoveBed.FieldByName('PLACE').AsInteger, 'DO_OUTMOVE_BED');
      */
      vRes := EXCH43.DO_OUTMOVE_BED(vStr, pID_ILL);
    END LOOP;
  end;
  ----------------------------------------------------
  procedure UploadToMIC is
    vStr           varchar2(4000);
    vFC_SMK_NAME   asu.texchupload_big_tmp.fc_smk_name%type;
    vPID           integer;
    vDO_OUTPAC_Res varchar2(4000);
    vRes           varchar2(4000);
  begin
    -- регистрация ЛПУ в МИЦ
    if asu.GET_MIC_USE_ADD_LPU = 1 then
      UploadLPU;
    end if;

    -- Случаи
    FOR C IN (SELECT * FROM ASU.TEXCHUPLOAD_BIG_TMP) LOOP
      -- INSERT PASPORT
      vPID := EXCH43.GET_PID_BY_PEPLID(c.FK_PEPLID);
      if not (vPID > 0 and ASU.GetNeedToSendINSERT_PASPORT(vPID, c.fk_id) = 1) then
        if c.smk_id = -1 then
          vFC_SMK_NAME := c.fc_smk_name;
        else
          vFC_SMK_NAME := '';
        end if;

        vStr := ';' || c.SNAME || ';' || -- SNAME  Фамилия
                c.FNAME || ';' || -- FNAME  Имя
                c.MNAME || ';' || -- MNAME  Отчество
                to_char(c.DDMMYYYY, 'dd.mm.yyyy') || ';' || -- DATE_B  Дата рождения
               --5
                c.POL || ';' || -- POL  Пол
                c.FC_PAC_SNILS || ';' || -- SNILS  СИНЛС
                ';' || --INN  Идентификационный номер налогоплатильщика
                c.FC_DOCSER || ';' || -- DOCSER  Серия документа (паспорта)
                c.FC_DOCNUM || ';' || -- DOCNUM  Номер документа (паспорта)
               --10
                to_char(c.FD_DOCDATE, 'dd.mm.yyyy') || ';' || -- DATE_V  Дата выдачи
                c.FK_VIDDOC_EIS || ';' || -- DOCUM_TYPE  Тип документа (спр. VDK)
                c.FC_DOCVIDAN || ';' || -- KEM  кем выдан
                c.MR || ';' || -- MR  Место работы
                ';' || --SOCIAL  Социальное положение (SOCGRP.RID)
               --15
                ';' || --LGOT_CATEG  Льготная категория
                c.COUNTRY || ';' || -- COUNTRY  Страна
                c.STATE || ';' || -- STATE  Область
                c.RON || ';' || -- RONPAS  Район
                c.CITYPAS || ';' || -- CITYPAS  Город
               --20
                c.STREETPAS || ';' || -- STREETPAS  Улица
                c.DOMPAS || ';' || -- DOMPAS  Дом
                c.KORPAS || ';' || -- KORPAS  Корпус
                c.FLATPAS || ';' || -- FLATPAS  Квартира
                ';' || --lid_mr_v  Код места работы (S_ENTERP.LID_V)
               --25
                ';' || --podr  Код подразделения  (S_ENTERP.PODR)
                c.POLICYSER || ';' || -- POLICYSER  Серия полиса
                c.POLICYNUM || ';' || -- POLICYNUM  Номер полиса
                c.SMK_ID || ';' || -- SMK  Идентификатор страховой (SMK.SMK или -1)
                vFC_SMK_NAME || ';' || --NAME_SMK  Название страховой
               --30
                c.POLICYBEG || ';' || -- DATE_S  Дата начала действия полиса
                c.POLICYEND || ';' || -- DATE_E  Дата окончания действия полиса
                '1;' || --TYPEDOG  Тип договора (1-не работающие, 2-работающие)
                ';' || --DATE_GIVE Дата выдачи полиса (dd.mm.yyyy)
                ';' || --DATE_ANUL Дата аннулирования полиса (dd.mm.yyyy)
               --35
                ';' || --ANUL_KOD Причина аннулирования (справочник CASE_NUL)
                c.NACIONAL_ID || ';' || -- Национальность (справочник NATIONAL)
                ';' || --MILITARY Код военнослужащего (передавать пустым)
                ';' || --DISABILITY_CODE Код группы инвалидности (передавать пустым)
                ';' || --DISABILITY_STAGE Код стадии инвалидности (передавать пустым)
               --40
                c.HEMO || ';' || -- Код группы крови (справочник HEMO)
                c.ALLERG || ';' || -- Лекарственная непереносимость
                c.PHONE || ';' || -- Телефон
                c.PROF || ';' || -- Профессия (справочник PROFES)
                c.EXT_PID || ';' || -- Уникальный внешний код пациента
                c.POLICY_TYPE_ID || ';' || --Тип документа, подтверждающего право на ОМС (Справочник EXT_POLICY_TYPE)
               --45
                c.ENP || ';' || --Единый номер полиса
                c.DISP_KAT || ';' || -- Категория граждан, подлежащих диспансеризации (обязательно в случаи ДДН)
                c.GZ || ';' || -- Группы состояния здоровья граждан по итогам диспансеризации, проф. (обязательно в случаи ДДН)
                c.DISP_RES || ';'; -- Направление гражданина на II этап диспансеризации (обязательно в случаи ДДН)

        vRes := EXCH43.GET_OUTPAC_PID(vStr, c.FK_PEPLID, vPID);
        --      vPID := to_number(trim(EXCH43.GET_OUTPAC_PID(vStr, c.FK_PEPLID, vPID)));
      end if;

      -- собствеено случай
      if vPID > 0 then
        vStr := vPID || ';' || -- Идентификатор пациента в системе МедИнф (PID)
                c.FK_ID || ';' || -- Идентификатор случая (ID_ILL)
                c.N_MAP || ';' || -- Номер карты выбывшего, амбул. Карты и т.п. (N_MAP)
                c.FK_OTDELID_E || ';' || -- Код отделения (PLACE_E)
                c.FK_TYPEDOC_EIS || ';' || -- Вид оплаты (KINDCOST.RID) (KINDCOST)
                c.LPU_NAPR || ';' || -- Код направившей ЛПУ (LPU.LPU) (SOURCE)
                c.FC_DNU || ';' || -- Код диагноза направившего ЛПУ (DIA_SOUR)
                c.ILLKIND || ';' ||
               -- Код госпитал. в году (1-острое, 2- хроническое впервые, 3- хроническое впервые в году, 4 - обострение хронического) (ILLKIND)
                c.TYPEPLACE || ';' || -- Тип отделения (1-дневной стац-р. 2-стац-р на дому, иначе пусто) (TYPEPLACE)
                c.FN_TYPE_PODR || ';' || -- Тип мед. Помощи (1-стационар, 2 - поликлиника) (TYPE_PODR)
                c.OTKAZ_GOSP || ';' || -- Код причины отказа от госпитализации (REFUSAL.RID) (REFUSAL)
                c.DIA_SD || ';' || -- Диагноз предварительный (DIA_SD)
                c.DIA_C || ';' || -- Диагноз сопутствующий (DIA_C)
                c.DIA_O || ';' || -- Диагноз осложнения (DIA_O)
                c.DIA_E || ';' || -- Диагноз заключительный (DIA_E)
                c.DOC_FIO || ';' || -- Фамилия, имя и отчество лечащего врача (DOC_NAME_E)
                c.EXITUS || ';' || -- Исход заболевания (EXITUS.RID) (EXITUS)
                to_char(c.DATE_S, 'dd.mm.yyyy') || ';' || -- Дата начала случая (DATE_S)
                to_char(c.DATE_E, 'dd.mm.yyyy') || ';' || -- Дата окончания случая (DATE_E)
                c.FK_EIS_TRAVM || ';' || -- Травма (DESTROY.RID)  (DESTROY)
                c.FC_TOMP || ';' || -- ТОМП основного диагноза (PROTOCOL.KOD)  (PROTOCOL)
                c.FC_SOP_TOMP || ';' || -- ТОМП сопутствующего диагноза (PROTOCOL.KOD) (PROTOCOL_C)
                c.FK_DOCSPEC || ';' || -- Должность врача (DOCSPEC_E)
                c.PL || ';' || -- Экстренно/планово (PL)
                c.EXITUS_DOP || ';' || -- Исход заболевания дополнительный (EXITUS_DOP)
               --
                c.AGENT_STATUS || ';' || -- Статус представителя пациента (справочник aclient_agent_status)
                c.AGENT_SUR_NAME || ';' || --  Фамилия родителя (представителя) пациента
                c.AGENT_FIRST_NAME || ';' || -- Имя родителя (представителя) пациента
                c.AGENT_PATR_NAME || ';' || -- Отчество родителя (представителя) пациента
                c.AGENT_VDK || ';' || -- Тип документа, удостоверяющего личность представителя
                c.AGENT_DOCSER || ';' || -- Серия документа, удостоверяющего личность представителя
                c.AGENT_DOCNUM || ';' || -- Номер документа, удостоверяющего личность представителя
                c.AGENT_DATE_V || ';' || -- Дата выдачи документа, удостоверяющего личность представителя
                c.AGENT_KEM || ';' || -- Кем выдан документ, удостоверяющий личность представителя
               --
                c.MOVE_S || ';' || -- Кем доставлен в ЛПУ (справочник MOVINGS)
                c.T_PILL || ';' || -- Доставлен в стационар от начала заболевания (справочник T_PILL)
                c.INSP_RW || ';' || -- Обследование на RW (1-да, 0-нет)
                c.INSP_VICH || ';' || -- Обследование на AIDS (1-да, 0-нет)
                c.ID_TREAT || ';' || -- Дефекты догоспитального этапа (1-несвоевременность, 2-недост. Объем кл/диаг обследования, 3-неправильная тактика, 4-несовп. Д-за лечения)
                c.KOIKA || ';' || -- Вид койки (передавать пустым)
                c.P_DIA_E || ';' || -- Диагноз патологоанатомический
                c.OTKL || ';' || -- Признак отклонения пат. от диаг. (1- дa, 0 – нет)
                c.SOST_OP || ';' || -- Состояние опьянения (1 – алкогольное, 2 – наркотическое)
                to_char(c.DATE_O, 'dd.mm.yyyy') || ';' || -- Дата диагноза осложнения (dd.mm.yyyy)
                to_char(c.DATE_C, 'dd.mm.yyyy') || ';' || -- Дата диагноза сопутствующего (dd.mm.yyyy)
                c.NUM_NAPRAV || ';' || -- Номер направления
                to_char(c.DATE_NAPR, 'dd.mm.yyyy') || ';' || c.ID_CARD || ';' || to_char(c.DATE_OPEN_CARD, 'dd.mm.yyyy') || ';' || to_char(c.DATE_CLOSED_CARD, 'dd.mm.yyyy') || ';' || c.ADD_CARD_NUMBER || ';' || c.PROFMP_ID || ';' ||
                c.POLICY_TYPE_ID || ';' || c.STANDARD_TYPE_ID || ';' || c.BIRD_PLACE_NAME || ';' || c.N_UCH || ';' || c.TYPE_UCH || ';' || to_char(c.DATE_START_UCH, 'dd.mm.yyyy') || ';' ||
                to_char(c.DATE_END_UCH, 'dd.mm.yyyy') || ';' || c.AGENT_POL || ';' || c.AGENT_DR || ';' || c.TYPE_V_MU || ';' || c.MODERN || ';' || c.DOC_NAME_S || ';' || c.DOCSPEC_S || ';' ||
                c.FK_OTDELID_S || ';'; -- Код отделения (PLACE_S)

        vDO_OUTPAC_Res := EXCH43.DO_OUTPAC(vStr, c.fk_id);

        --      if instr(vDO_OUTPAC_Res, '2 DOC_NAME') > 0 then
        --        RegDoctorInEis(c.id_ill, c.sotr_id, 'DO_OUTPAC')
        /*
                vStr := c.DOCTOR_CODE || ';' ||
                            c.ACTIVITY_ID || ';' ||
                            c.SNILS || ';' ||
                            c.LAST_NAME || ';' ||
                            c.FIRST_NAME || ';' ||
                            c.MIDDLE_NAME || ';' ||
                            c.BIRTH_DATE || ';' ||
                            c.BIRTH_PLACE || ';' ||
                            c.SEX || ';' ||
                            c.DOCUMENT_TYPE_ID || ';' ||
                            c.DOCUMENT_SERIES || ';' ||
                            c.DOCUMENT_NUMBER || ';' ||
                            c.DOCUMENT_REG_DATE || ';' ||
                            c.DOCUMENT_REG_AUTHORITY || ';' ||
                            c.ADDRESS_CODE || ';' ||
                            c.HOUSE || ';' ||
                            c.BUILDING || ';' ||
                            c.FLAT || ';' ||
                            c.INN || ';' ||
                            c.GRADUTED_FROM || ';' ||
                            c.DIPLOMA_SPECIALITY || ';' ||
                            c.GRADUTED_DATE || ';' ||
                            c.DIPLOMA_NUMBER || ';' ||
                            c.LPU_ID || ';' ||
                            c.PLACE_ID || ';' ||
                            c.POSITION || ';' ||
                            c.RECEPT_CODE || ';' ||
                            c.PROFMP_ID || ';';

                EXCH43.DO_REG_DOCTOR(c.id_ill, vStr, 'DO_OUTPAC', :pdoctor_name, :pdoctor_id, :padd_result,  1);

              if (Pos('2 PLACE_E', oqUploadEIS.GetVariable('pRes')) > 0) and
                 (TDBUtils.GetConstantDef('GET_MIC_USE_ADD_PLACE', frmMain.osMain, 0) = 1)
              then
                RegPlaceInEis(odsExport.FieldByName('ID_ILL').AsInteger, odsExport.FieldByName('FK_OTDELID_E').AsInteger, 'DO_OUTPAC');

              if (Pos('2 PLACE_S', oqUploadEIS.GetVariable('pRes')) > 0) and
                 (TDBUtils.GetConstantDef('GET_MIC_USE_ADD_PLACE', frmMain.osMain, 0) = 1)
              then
                RegPlaceInEis(odsExport.FieldByName('ID_ILL').AsInteger, odsExport.FieldByName('FK_OTDELID_S').AsInteger, 'DO_OUTPAC');
        */
        /*
            // Выгрузка больничного
        //      mmLog.Lines.Add('9 i = ' + IntToStr(i) + ' FK_AMBID = ' + odsExport.FieldByName('FK_AMBID').AsString);
            if (PID <> -1) and (sStartParam <> 'TXT_MIC') and (not odsExport.FieldByName('FK_AMBID').IsNull) then
            begin
              if TDBUtils.GetConstantDef('GET_MIC_USE_ADD_BL', frmMain.osMain, 0) = 1 then
                LoadBLToEis(odsExport.FieldByName('FK_AMBID').AsInteger, false);

              if TDBUtils.GetConstantDef('GET_MIC_USE_ADD_DUCH', frmMain.osMain, 0) = 1 then
                LoadDispToEis(odsExport.FieldByName('fk_id').AsInteger, PID, false);

              if TDBUtils.GetConstantDef('GET_MIC_USE_ADD_SPECU', frmMain.osMain, 0) = 1 then
                LoadADD_SPECUToEis(odsExport.FieldByName('FK_PEPLID').AsInteger, PID, false);

              if TDBUtils.GetConstantDef('GET_MIC_USE_ADD_LGOTA', frmMain.osMain, 0) = 1  then
                LoadADD_LGOTAToEis(odsExport.FieldByName('FK_PEPLID').AsInteger, PID, false);
            end;
        */

        -- Услуги случая
        UploadUSL(vPID, c.fk_id);
        UploadOper(vPID, c.fk_id);
        UploadMove(vPID, c.fk_id);
        UploadMoveBed(vPID, c.fk_id);
      end if;

    END LOOP;
  end;
 ----------------------------------------------------
 procedure CalculateAndUploadToMIC(pBeg DATE default sysdate - 1, pEnd DATE default sysdate - 1) is
 begin
  asu.pkg_exch_upload_master.Calculate(trunc(pBeg), trunc(pEnd));
  asu.pkg_exch_upload_master.UploadToMIC;
 end;

END pkg_exch_upload_master;
/

SHOW ERRORS;


