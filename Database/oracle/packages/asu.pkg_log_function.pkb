DROP PACKAGE BODY ASU.PKG_LOG_FUNCTION
/

--
-- PKG_LOG_FUNCTION  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_LOG_FUNCTION" 
IS

FUNCTION GET_FIO_BY_PEOPLESID(pFK_ID IN NUMBER) RETURN VARCHAR IS
  strTemp   VARCHAR(200);
  CURSOR cTemp
  IS
    SELECT FC_FAM || ' ' ||
    DECODE (VarcharIsNUll(fc_im),
            1, '',
            SUBSTR (FC_IM, 0, 1) || '. ' || DECODE (VarcharIsNUll(fc_otch),
                                                            1, '',
                                                            SUBSTR (FC_OTCH, 0, 1) || '. '))
      FROM TKARTA
     WHERE FK_ID = pFK_ID
     UNION
    SELECT FC_FAM || ' ' ||
    DECODE (VarcharIsNUll(fc_im),
            1, '',
            SUBSTR (FC_IM, 0, 1) || '. ' || DECODE (VarcharIsNUll(fc_otch),
                                                            1, '',
                                                            SUBSTR (FC_OTCH, 0, 1) || '. '))
      FROM Tambulance
     WHERE FK_ID = pFK_ID;
BEGIN
  OPEN cTemp;
  FETCH cTemp INTO strTemp;
  CLOSE cTemp;
  IF strTemp IS NOT NULL THEN
      RETURN strTemp;
   ELSE
      RETURN to_char(pFK_ID);
  END IF;
END;

FUNCTION GET_APP_BY_ID(pFK_ID IN NUMBER) RETURN VARCHAR IS
    CURSOR cMod IS SELECT FC_NAME || ' (' || FC_FNAME || ')' FROM LOGIN.TAPP WHERE FK_ID = pFK_ID;
    cRes VARCHAR (200);
BEGIN
    OPEN cMod;
    FETCH cMod INTO cRes;
    CLOSE cMod;
  --  RETURN cRes;
    IF cRes IS NOT NULL THEN
      RETURN cRes;
    ELSE
      RETURN to_char(pFK_ID);
    END IF;
EXCEPTION
WHEN others THEN
    RETURN to_char(pFK_ID);
END;

FUNCTION GET_VRACH_BY_ID(pFK_ID IN NUMBER) RETURN VARCHAR IS
    CURSOR cVrach IS SELECT FC_FAM || ' ' || DECODE (VarcharIsNUll(FC_NAME), 1, '',
                            SUBSTR (FC_NAME, 0, 1) || '. ' || DECODE (VarcharIsNUll(fc_otch),
                                                            1, '',
                                                            SUBSTR (FC_OTCH, 0, 1) || '. ')) FROM TSOTR WHERE FK_ID = pFK_ID;
    cRes VARCHAR (200);
BEGIN
    OPEN cVrach;
    FETCH cVrach INTO cRes;
    CLOSE cVrach;
    --RETURN cRes;
    IF cRes IS NOT NULL THEN
      RETURN cRes;
    ELSE
      RETURN to_char(pFK_ID);
    END IF;
EXCEPTION
WHEN others THEN
    RETURN to_char(pFK_ID);
END;

FUNCTION GET_DIAG_TYPE(pFK_ID IN NUMBER) RETURN VARCHAR IS
BEGIN
    IF pFK_ID = 0 THEN
        RETURN 'Сопутствующий';
    ELSIF pFK_ID = 1 THEN
        RETURN 'Основной';
    ELSIF pFK_ID = 2 THEN
        RETURN 'Осложнение основного';
    ELSIF pFK_ID = 3 THEN
        RETURN 'Конкурирующий';
    ELSIF pFK_ID = 4 THEN
        RETURN 'Дифференциальный';
    ELSE
        RETURN to_char(pFK_ID);
    END IF;
EXCEPTION
WHEN others THEN
    RETURN to_char(pFK_ID);
END;

FUNCTION GET_DIAG_PODT(pFK_ID IN NUMBER) RETURN VARCHAR IS
BEGIN
    IF pFK_ID = 0 THEN
        RETURN 'Не подтвержден';
    ELSIF pFK_ID = 1 THEN
        RETURN 'Подтвержден';
    ELSE
        RETURN to_char(pFK_ID);
    END IF;
EXCEPTION
WHEN others THEN
    RETURN to_char(pFK_ID);
END;

FUNCTION GET_EPIK_TYPE(pFK_ID IN NUMBER) RETURN VARCHAR IS
BEGIN
    IF pFK_ID = 1 THEN
        RETURN 'Выписной';
    ELSIF pFK_ID = 2 THEN
        RETURN 'Переводной';
    ELSIF pFK_ID = 3 THEN
        RETURN 'Посмертный';
    ELSIF pFK_ID = 4 THEN
        RETURN 'Предоперационный';
    ELSIF pFK_ID = 5 THEN
        RETURN 'Этапный';
    ELSE
        RETURN to_char(pFK_ID);
    END IF;
EXCEPTION
WHEN others THEN
    RETURN to_char(pFK_ID);
END;

FUNCTION GET_RESLECH(pFK_ID IN NUMBER) RETURN VARCHAR IS
BEGIN
    IF pFK_ID = 0 THEN
        RETURN 'Выздоровление';
    ELSIF pFK_ID = 1 THEN
        RETURN 'Улучшение';
    ELSIF pFK_ID = 2 THEN
        RETURN 'Без перемен';
    ELSIF pFK_ID = 3 THEN
        RETURN 'Ухудшение';
    ELSIF pFK_ID = 4 THEN
        RETURN 'Перевод';
    ELSIF pFK_ID = 5 THEN
        RETURN 'Смерть';
    ELSE
        RETURN to_char(pFK_ID);
    END IF;
EXCEPTION
WHEN others THEN
    RETURN to_char(pFK_ID);
END;

FUNCTION GET_EPIK_PODPIS(pFK_ID IN NUMBER) RETURN VARCHAR IS
BEGIN
    IF pFK_ID = 0 THEN
        RETURN 'Не подписан';
    ELSIF pFK_ID = 1 THEN
        RETURN 'Подписан';
    ELSE
        RETURN to_char(pFK_ID);
    END IF;
EXCEPTION
WHEN others THEN
    RETURN to_char(pFK_ID);
END;

FUNCTION GET_OBJECTOWNER(pFK_ID IN NUMBER) RETURN VARCHAR IS
    CURSOR cObj IS SELECT FC_NAME FROM LOGIN.TFORMS WHERE FK_ID =pFK_ID
                   UNION
                   SELECT FC_NAME FROM LOGIN.TFILTERS WHERE FK_ID =pFK_ID;
    cRes VARCHAR (200);
BEGIN
    OPEN cObj;
    FETCH cObj INTO cRes;
    CLOSE cObj;
    --RETURN cRes;
    IF cRes IS NOT NULL THEN
      RETURN cRes;
    ELSE
      RETURN to_char(pFK_ID);
    END IF;
EXCEPTION
WHEN others THEN
    RETURN to_char(pFK_ID);
END;

FUNCTION GET_APPSOTR(pFK_ID IN NUMBER) RETURN VARCHAR IS
    CURSOR cObj IS SELECT FC_FAM || ' ' || DECODE (VarcharIsNUll(LOGIN.TSOTR.FC_NAME), 1, '',
                            SUBSTR (LOGIN.TSOTR.FC_NAME, 0, 1) || '. ' || DECODE (VarcharIsNUll(fc_otch),
                                                            1, '',
                                                            SUBSTR (FC_OTCH, 0, 1) || '.')) || ' / ' || LOGIN.TAPPSOTR.FC_NAME AS FC_APPSOTR FROM LOGIN.TAPPSOTR, LOGIN.TSOTR WHERE LOGIN.TAPPSOTR.FK_ID =pFK_ID AND LOGIN.TAPPSOTR.FK_SOTRID = LOGIN.TSOTR.FK_ID;
    cRes VARCHAR (400);
BEGIN
    OPEN cObj;
    FETCH cObj INTO cRes;
    CLOSE cObj;
--    RETURN cRes;
    IF cRes IS NOT NULL THEN
      RETURN cRes;
    ELSE
      RETURN to_char(pFK_ID);
    END IF;
EXCEPTION
WHEN others THEN
    RETURN to_char(pFK_ID);
END;

FUNCTION GET_INSURDOCS(pFK_ID IN NUMBER) RETURN VARCHAR IS
    CURSOR cObj IS SELECT FC_SER ||' - ' || FC_NUM FROM TINSURDOCS WHERE FK_ID =pFK_ID;
    cRes VARCHAR (30);
BEGIN
    OPEN cObj;
    FETCH cObj INTO cRes;
    CLOSE cObj;
   -- RETURN cRes;
    IF cRes IS NOT NULL THEN
      RETURN cRes;
    ELSE
      RETURN to_char(pFK_ID);
    END IF;
EXCEPTION
WHEN others THEN
    RETURN to_char(pFK_ID);
END;

FUNCTION GET_PEOPLE_BY_ID(pFK_ID IN NUMBER) RETURN VARCHAR IS
    CURSOR cVrach IS SELECT FC_FAM || ' ' || DECODE (VarcharIsNUll(FC_IM), 1, '',
                            SUBSTR (FC_IM, 0, 1) || '. ' || DECODE (VarcharIsNUll(fc_otch),
                                                            1, '',
                                                            SUBSTR (FC_OTCH, 0, 1) || '. ')) FROM TPEOPLES WHERE FK_ID = pFK_ID;
    cRes VARCHAR (200);
BEGIN
    OPEN cVrach;
    FETCH cVrach INTO cRes;
    CLOSE cVrach;
   -- RETURN cRes;
    IF cRes IS NOT NULL THEN
      RETURN cRes;
    ELSE
      RETURN to_char(pFK_ID);
    END IF;
EXCEPTION
WHEN others THEN
    RETURN to_char(pFK_ID);
END;

FUNCTION GET_AMBUL_NUM(pFK_ID IN NUMBER) RETURN VARCHAR IS
    CURSOR cKarta IS SELECT FK_IBID || '/' || FK_IBY AS FC_NAME FROM TAMBULANCE WHERE FK_ID = pFK_ID;
    cRes VARCHAR (20);
BEGIN
    OPEN cKarta;
    FETCH cKarta INTO cRes;
    CLOSE cKarta;
  --  RETURN cRes;
    IF cRes IS NOT NULL THEN
      RETURN cRes;
    ELSE
      RETURN to_char(pFK_ID);
    END IF;
EXCEPTION
WHEN others THEN
    RETURN to_char(pFK_ID);
END;

FUNCTION GET_KARTA_NUM(pFK_ID IN NUMBER) RETURN VARCHAR IS
    CURSOR cKarta IS SELECT FK_IBID || '/' || FK_IBY AS FC_NAME FROM TKARTA WHERE FK_ID = pFK_ID;
    cRes VARCHAR (20);
BEGIN
    OPEN cKarta;
    FETCH cKarta INTO cRes;
    CLOSE cKarta;
 --   RETURN cRes;
    IF cRes IS NOT NULL THEN
      RETURN cRes;
    ELSE
      RETURN to_char(pFK_ID);
    END IF;
EXCEPTION
WHEN others THEN
    RETURN to_char(pFK_ID);
END;

FUNCTION GET_APPREQ_BY_ID(pFK_ID IN NUMBER) RETURN VARCHAR IS
    CURSOR cMod IS SELECT GET_APP_BY_ID(TAPPREQ.fk_appid) || ' - ' ||GET_APP_BY_ID(TAPPREQ.fk_reqid) as fc_req
              FROM LOGIN.TAPPREQ WHERE FK_ID = pFK_ID;
    cRes VARCHAR (400);
BEGIN
    OPEN cMod;
    FETCH cMod INTO cRes;
    CLOSE cMod;
 --   RETURN cRes;
    IF cRes IS NOT NULL THEN
      RETURN cRes;
    ELSE
      RETURN to_char(pFK_ID);
    END IF;
EXCEPTION
WHEN others THEN
    RETURN to_char(pFK_ID);
END;

FUNCTION GET_APPSOTR_BY_ID(pFK_ID IN NUMBER) RETURN VARCHAR IS
    CURSOR cMod IS SELECT GET_SOTRNAME(LOGIN.TAPPSOTR.fk_sotrid) || ' - ' ||GET_APP_BY_ID(LOGIN.TAPPSOTR.fk_appid) as fc_req
              FROM LOGIN.TAPPSOTR WHERE FK_ID = pFK_ID;
    cRes VARCHAR (400);
BEGIN
    OPEN cMod;
    FETCH cMod INTO cRes;
    CLOSE cMod;
  --  RETURN cRes;
    IF cRes IS NOT NULL THEN
      RETURN cRes;
    ELSE
      RETURN to_char(pFK_ID);
    END IF;
EXCEPTION
WHEN others THEN
    RETURN to_char(pFK_ID);
END;

-- Added by Nefedov S.M. 19.12.2007
FUNCTION GET_DOCOBSL(pFK_ID IN NUMBER) RETURN VARCHAR IS
    CURSOR cDocObsl IS SELECT TUSLVID.fc_name || '  ' || TDOCOBSL.FK_NUMIB || '/' || TDOCOBSL.FN_YEAR AS FC_NAME
    FROM TDOCOBSL, TUSLVID WHERE TDOCOBSL.FK_ID = pFK_ID;
    cRes VARCHAR (100);
BEGIN
    if pFK_ID > 0 then
        OPEN cDocObsl;
        FETCH cDocObsl INTO cRes;
        CLOSE cDocObsl;
    end if;
    IF cRes IS NOT NULL THEN
      RETURN '+'||cRes;
    ELSE
      RETURN to_char(pFK_ID);
    END IF;
--    RETURN '+'||cRes;
EXCEPTION
WHEN others THEN
    RETURN to_char(pFK_ID);
END;

-- Added by Kulbatsky D. 17.01.2007
FUNCTION GET_TKARTA_DEL(pFK_ID IN NUMBER) RETURN VARCHAR IS
CURSOR cMod IS
SELECT (SELECT DECODE(FC_NEW, NULL, DECODE(FC_OLD, NULL, NULL, FC_OLD), FC_NEW) FC_VAL FROM TLOG
        WHERE FK_ID = (SELECT MAX(FK_ID) FK_ID
                       FROM TLOG
                       WHERE TLOG.FK_OWNER = pFK_ID
                             AND TLOG.FC_TABLE = 'TKARTA'
                             AND TLOG.FC_FIELD = 'FK_IBID'
                             AND (FC_NEW IS NOT NULL OR FC_OLD IS NOT NULL)))
        ||'/'||
        (SELECT DECODE(FC_NEW, NULL, DECODE(FC_OLD, NULL, NULL, FC_OLD), FC_NEW) FC_VAL FROM TLOG
         WHERE FK_ID = (SELECT MAX(FK_ID) FK_ID
                        FROM TLOG
                        WHERE TLOG.FK_OWNER = pFK_ID
                              AND TLOG.FC_TABLE = 'TKARTA'
                              AND TLOG.FC_FIELD = 'FK_IBY'
                              AND (FC_NEW IS NOT NULL OR FC_OLD IS NOT NULL)))
        AS FC_VAL FROM DUAL;
    cRes VARCHAR (400);
BEGIN
    OPEN cMod;
    FETCH cMod INTO cRes;
    CLOSE cMod;
  --  RETURN cRes;
    IF cRes <> '/' THEN
      RETURN cRes;
    ELSE
      RETURN to_char(pFK_ID);
    END IF;
EXCEPTION
WHEN others THEN
    RETURN to_char(pFK_ID);
END;

-- Added by Kulbatsky D. 17.01.2007
FUNCTION GET_TAMBULANCE_DEL(pFK_ID IN NUMBER) RETURN VARCHAR IS
CURSOR cMod IS
SELECT (SELECT DECODE(FC_NEW, NULL, DECODE(FC_OLD, NULL, NULL, FC_OLD), FC_NEW) FC_VAL FROM TLOG
        WHERE FK_ID = (SELECT MAX(FK_ID) FK_ID
                       FROM TLOG
                       WHERE TLOG.FK_OWNER = pFK_ID
                             AND TLOG.FC_TABLE = 'TAMBULANCE'
                             AND TLOG.FC_FIELD = 'FK_IBID'
                             AND (FC_NEW IS NOT NULL OR FC_OLD IS NOT NULL)))
        ||'/'||
        (SELECT DECODE(FC_NEW, NULL, DECODE(FC_OLD, NULL, NULL, FC_OLD), FC_NEW) FC_VAL FROM TLOG
         WHERE FK_ID = (SELECT MAX(FK_ID) FK_ID
                        FROM TLOG
                        WHERE TLOG.FK_OWNER = pFK_ID
                              AND TLOG.FC_TABLE = 'TAMBULANCE'
                              AND TLOG.FC_FIELD = 'FK_IBY'
                              AND (FC_NEW IS NOT NULL OR FC_OLD IS NOT NULL)))
        AS FC_VAL FROM DUAL;
    cRes VARCHAR (400);
BEGIN
    OPEN cMod;
    FETCH cMod INTO cRes;
    CLOSE cMod;
  --  RETURN cRes;
    IF cRes <> '/' THEN
      RETURN cRes;
    ELSE
      RETURN to_char(pFK_ID);
    END IF;
EXCEPTION
WHEN others THEN
    RETURN to_char(pFK_ID);
END;

END;
/

SHOW ERRORS;


