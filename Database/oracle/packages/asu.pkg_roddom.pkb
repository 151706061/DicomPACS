DROP PACKAGE BODY ASU.PKG_RODDOM
/

--
-- PKG_RODDOM  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_RODDOM" IS

 FUNCTION GET_RODY_DATE(pPacid NUMBER) RETURN DATE IS
  -- Created 20061123 by Serg
  -- Возвращает дату родов
  dTmp DATE;
 BEGIN
  SELECT MAX(R.FD_INS)
    INTO dTmp
    FROM VRES R
   WHERE R.FK_SMID = (SELECT MAX(S.FK_ID) FROM TSMID S WHERE S.FC_SYNONIM = 'TECH_ROD')
     AND R.FK_PACID = pPacid;
  RETURN dTmp;
 END;

 ------------------------------------------------------------------------

 FUNCTION GET_SROK_BEREM_WEEK(pPacid NUMBER, pdate DATE DEFAULT SYSDATE) RETURN NUMBER IS
  -- Created 20061123 by Serg
  -- Updated 20070604 by Serg
  -- Updated 20070620 by SPASSKIY (ДОБАВЛЕН ПАРАМЕТР ДАТА)
  -- Возвращает срок беременности на данный момент в неделях
  nTmp NUMBER;
  dTmp DATE;
 BEGIN
  SELECT MAX(A.FD_OPENED) INTO dTmp FROM TAMBTALON A WHERE A.FK_AMBID = pPacid;
  IF dTmp IS NULL THEN

   SELECT MIN(FD_DATA1) INTO dTmp FROM asu.TSROKY WHERE FK_PACID=pPACID AND FK_PRYB=2; --Spasskiy S.N. 24.01.2007
/*   SELECT PKG_REGIST_PACFUNC.GET_PAC_INCOME(pPacid) INTO dTmp FROM DUAL;*/
  END IF;

  --  IF NVL(IS_AMBULANCE(pPacid), 0) > 0 THEN
  --   SELECT MAX(A.FD_OPENED) INTO dTmp FROM TAMBTALON A WHERE A.FK_AMBID = pPacid;
  SELECT MAX(I.FN_NUM) + DECODE(MAX(NVL(I.FN_NUM, 0)), 0, NULL, TRUNC((pdate - dTmp) / 7))
    INTO nTmp
    FROM TIB I, (SELECT FK_ID FROM VNAZ WHERE FK_PACID = pPacid) N,(SELECT MAX(S.FK_ID) FK_ID FROM TSMID S WHERE S.FC_SYNONIM = 'SROK_BER') sm
   WHERE I.FK_SMID = sm.fk_id
     AND I.FK_PACID = N.FK_ID;
  --  ELSE
  IF nTmp IS NULL THEN
   SELECT MAX(I.FN_NUM) + DECODE(MAX(NVL(I.FN_NUM, 0)), 0, NULL, TRUNC((pdate - dTmp) / 7))
     INTO nTmp
     FROM TIB I, (SELECT MAX(S.FK_ID) FK_ID FROM TSMID S WHERE S.FC_SYNONIM = 'SROK_BER') SM
    WHERE I.FK_SMID = SM.FK_ID
      AND I.FK_PACID = pPacid;
  END IF;
  RETURN nTmp;
 END;

 ------------------------------------------------------------------------

 FUNCTION GET_SROK_AFTER_RODI(pPacid NUMBER) RETURN VARCHAR2 IS
  -- Created 20061123 by Serg
  -- Возвращает срок после родов
  nTmp NUMBER;
  sTmp VARCHAR2(255);
 BEGIN
  nTmp := (SYSDATE - PKG_RODDOM.GET_RODY_DATE(pPacid));
  IF nTmp < 1 THEN
   -- Если меньше дня
   IF (nTmp * 24) < 1 THEN
    -- Если меньше часа
    sTmp := TRUNC(nTmp * 24 * 60) || ' м.'; -- Минуты
   ELSE
    sTmp := TRUNC(nTmp * 24) || ' ч.'; -- Часы
   END IF;
  ELSE
   sTmp := TRUNC(nTmp);
  END IF;
  RETURN sTmp;
 END;

 ------------------------------------------------------------------------

 FUNCTION GET_SROK_AFTER_BIRTH(pPacid NUMBER) RETURN VARCHAR2 IS
  -- Created 20061123 by Serg
  -- Возвращает срок после ДР
  --  nTmp NUMBER;
  sTmp VARCHAR2(255);
  dTmp DATE;
 BEGIN

  SELECT K.FD_ROJD INTO dTmp FROM TKARTA K WHERE K.FK_ID = pPacid;
  IF dTmp IS NULL THEN
   SELECT A.FD_ROJD INTO dTmp FROM TAMBULANCE A WHERE A.FK_ID = pPacid;
  END IF;

  IF MONTHS_BETWEEN(SYSDATE, NVL(dTmp, SYSDATE)) < 12 THEN
   IF MONTHS_BETWEEN(SYSDATE, NVL(dTmp, SYSDATE)) < 1 THEN
    IF (SYSDATE - dTmp) < 1 THEN
     -- Если меньше дня
     IF ((SYSDATE - dTmp) * 24) < 1 THEN
      -- Если меньше часа
      sTmp := TRUNC((SYSDATE - dTmp) * 24 * 60) || ' мин.'; -- минут
     ELSE
      sTmp := TRUNC((SYSDATE - dTmp) * 24) || ' ч.'; -- часов
     END IF;
    ELSE
     sTmp := TO_CHAR(TRUNC(SYSDATE - dTmp)) || ' дн.'; -- дней
    END IF;
   ELSE
    sTmp := TO_CHAR(TRUNC(MONTHS_BETWEEN(SYSDATE, NVL(dTmp, SYSDATE)))) || ' мес.'; -- месяцев
   END IF;
  ELSE
   sTmp := TO_CHAR(TRUNC(MONTHS_BETWEEN(SYSDATE, NVL(dTmp, SYSDATE)) / 12)) || ' лет'; -- лет
  END IF;

  RETURN sTmp;
 END;

 ------------------------------------------------------------------------

 FUNCTION GET_PREDP_RODY_DATE(pPacid NUMBER) RETURN DATE IS
  -- Created 20061123 by Serg
  -- Updated 20070604 by Serg
  -- Возвращает предполагаемую дату родов
  dTmp DATE;
 BEGIN
  SELECT MAX(TRUNC(I.FD_DATE))
    INTO dTmp
    FROM TIB I, (SELECT FK_ID FROM VNAZ WHERE FK_PACID = pPacid) N
   WHERE I.FK_SMID = (SELECT MAX(S.FK_ID) FROM TSMID S WHERE S.FC_SYNONIM = 'DATA_ROD')
     AND I.FK_PACID = N.FK_ID;
  IF dTmp IS NULL THEN
   SELECT MAX(TRUNC(I.FD_DATE))
     INTO dTmp
     FROM TIB I
    WHERE I.FK_SMID = (SELECT MAX(S.FK_ID) FROM TSMID S WHERE S.FC_SYNONIM = 'DATA_ROD')
      AND I.FK_PACID = pPacid;
  END IF;
  IF TO_CHAR(dTmp, 'YYYY') = '0000' THEN
   dTmp := NULL;
  END IF;
  RETURN dTmp;
 END;

 ------------------------------------------------------------------------

 FUNCTION GET_JAKUB_MASS(pPacid NUMBER) RETURN NUMBER IS
  -- Created 20080115 by LINNIKOV
  -- Возвращает массу плода по Якубовой
  nOkr    NUMBER;
  nVysota NUMBER;
 BEGIN
  SELECT MAX(I.FN_NUM)
    INTO nOkr
    FROM TIB I
   WHERE I.FK_SMID = (SELECT MAX(S.FK_ID) FROM TSMID S WHERE S.FC_SYNONIM = 'OKRUZH_ZHIV')
     AND I.FK_PACID = pPacid;
  SELECT MAX(I.FN_NUM)
    INTO nVysota
    FROM TIB I
   WHERE I.FK_SMID = (SELECT MAX(S.FK_ID) FROM TSMID S WHERE S.FC_SYNONIM = 'VYSOTA_DNA')
     AND I.FK_PACID = pPacid;
  RETURN NVL((nOkr + nVysota), 0) / 4;
 END;

 ------------------------------------------------------------------------

 FUNCTION GET_JORDAN_MASS(pPacid NUMBER) RETURN NUMBER IS
  -- Created 20080115 by LINNIKOV
  -- Возвращает массу плода по Жорданио
  nOkr    NUMBER;
  nVysota NUMBER;
 BEGIN
  SELECT MAX(I.FN_NUM)
    INTO nOkr
    FROM TIB I
   WHERE I.FK_SMID = (SELECT MAX(S.FK_ID) FROM TSMID S WHERE S.FC_SYNONIM = 'OKRUZH_ZHIV')
     AND I.FK_PACID = pPacid;
  SELECT MAX(I.FN_NUM)
    INTO nVysota
    FROM TIB I
   WHERE I.FK_SMID = (SELECT MAX(S.FK_ID) FROM TSMID S WHERE S.FC_SYNONIM = 'VYSOTA_DNA')
     AND I.FK_PACID = pPacid;
  RETURN NVL((nOkr * nVysota), 0);
 END;

 ------------------------------------------------------------------------

 FUNCTION GET_DK(pPacid NUMBER) RETURN NUMBER IS
  -- Created 20080115 by LINNIKOV
  -- Возвращает допустимую кровопотерю
  nTmp NUMBER;
 BEGIN
  SELECT MAX(I.FN_NUM)
    INTO nTmp
    FROM TIB I
   WHERE I.FK_SMID = (SELECT MAX(S.FK_ID) FROM TSMID S WHERE S.FC_SYNONIM = 'PD_VES')
     AND I.FK_PACID = pPacid;
  RETURN NVL(nTmp, 0) / 500;
 END;

 ------------------------------------------------------------------------

 FUNCTION GET_DMP(pPacid NUMBER) RETURN NUMBER IS
  -- Created 20080115 by LINNIKOV
  -- Возвращает долженствующую массу плода
  nTmp NUMBER;
 BEGIN
  SELECT MAX(I.FN_NUM)
    INTO nTmp
    FROM TIB I
   WHERE I.FK_SMID = (SELECT MAX(S.FK_ID) FROM TSMID S WHERE S.FC_SYNONIM = 'PD_ROST')
     AND I.FK_PACID = pPacid;
  RETURN(NVL(nTmp, 0) - 90) / 500;
 END;

 ------------------------------------------------------------------------

 FUNCTION GET_RASCH_RODY_DATE(pPacid NUMBER) RETURN DATE IS
  -- Created 20080115 by LINNIKOV
  -- Расчетная дата родов = Дата родов = послед.менструация (POSLED_MENSTR) - 3 месяца +7 дней
  dTmp DATE;
 BEGIN
  SELECT MAX(I.FD_DATE)
    INTO dTmp
    FROM TIB I
   WHERE I.FK_SMID = (SELECT MAX(S.FK_ID) FROM TSMID S WHERE S.FC_SYNONIM = 'POSLED_MENSTR')
     AND I.FK_PACID = pPacid;
  IF dTmp IS NULL THEN
   RETURN dTmp;
  ELSE
   RETURN dTmp + 293;
  END IF;
 END;

 FUNCTION GET_NOVOR_MASS(pPacid NUMBER) RETURN NUMBER IS
   -- Created 20080409 by SPASSKIY
   -- Масса новорожденного
   nTmp NUMBER;
 BEGIN
   SELECT NVL(MAX(IB.FN_NUM),0)
     INTO nTmp
     FROM ASU.TIB IB,
          (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM LIKE '%ROD_VES%') S
    WHERE IB.FK_PACID = ASU.PKG_REGIST_PACFUNC.GET_PEPL_ID(pPacid)
      AND IB.FK_SMID = S.FK_ID;
   RETURN nTmp;
 END;

 FUNCTION GET_ISNOVOR_DONOSHEN(pPacid NUMBER) RETURN NUMBER IS
   -- Created 20080409 by SPASSKIY
   -- Доношен\недоношен
   nTmp NUMBER;
 BEGIN
   SELECT nvl((SELECT 0
                FROM asu.tib ib,
                     (SELECT fk_id
                        FROM asu.tsmid
                       WHERE fc_synonim LIKE 'NE_DONOSHEN%') s
               WHERE ib.fk_pacid =
                     ASU.PKG_REGIST_PACFUNC.GET_PEPL_ID(pPacid)
                 AND ib.fk_smid = s.fk_id),
              1)
     INTO nTmp
     FROM dual;
   RETURN nTmp;
 END;

 FUNCTION GET_ISNOVOR_ROD_ALIVE(pPacid NUMBER) RETURN NUMBER IS
   -- Created 20080409 by SPASSKIY
   -- Родился живой\мертвый
   nTmp NUMBER;
 BEGIN
   SELECT decode((SELECT sm.fc_synonim
                   FROM (SELECT fc_synonim, fk_id
                           FROM asu.tsmid
                          WHERE fc_synonim IN ('GIV', 'MERTV')) sm,
                        asu.tib
                  WHERE tib.fk_pacid =
                        ASU.PKG_REGIST_PACFUNC.GET_PEPL_ID(pPacid)
                    AND tib.fk_smid = sm.fk_id),
                 'GIV',
                 1,
                 'MERTV',
                 0,
                 -1) giv
     INTO nTmp
     FROM dual;
   RETURN nTmp;

 END;

END PKG_RODDOM;
/

SHOW ERRORS;


