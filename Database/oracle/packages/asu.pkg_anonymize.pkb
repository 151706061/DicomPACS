DROP PACKAGE BODY ASU.PKG_ANONYMIZE
/

--
-- PKG_ANONYMIZE  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_ANONYMIZE" IS
  --ВОЗВРАЩАЕТ СТРОКУ В НАЦ. КОДИРОВКЕ ДЛЯ HTML
  FUNCTION GET_NCHAR_ASCII(PVAL VARCHAR2) RETURN VARCHAR2 IS
    RESULT VARCHAR2(200);
  BEGIN
    FOR I IN 1 .. LENGTH(PVAL) LOOP
      RESULT := RESULT || '' || ASCII(UNISTR(SUBSTR(PVAL, I, 1))) || ';';
    END LOOP;
    RETURN RESULT;
  END;

  PROCEDURE REPLACE_CLOB(PCLOB IN OUT CLOB, PPEOPLE NUMBER) IS
    v_birth    DATE;
    v_full_Fio VARCHAR2(100);
    v_fio      VARCHAR2(100);
    v_fam      VARCHAR2(30);
    v_name     VARCHAR2(30);
    v_patron   VARCHAR2(30);
  BEGIN
    SELECT FC_FAM,
           FC_IM,
           FC_OTCH,
           FC_FAM || ' ' || FC_IM || ' ' || FC_OTCH,
           FC_FAM ||
           DECODE(FC_IM,
                  NULL,
                  '',
                  ' ' || SUBSTR(FC_IM, 1, 1) || '.' ||
                  DECODE(FC_OTCH,
                         NULL,
                         '',
                         ' ' || SUBSTR(FC_OTCH, 1, 1) || '.')),
           FD_ROJD
      INTO V_FAM, V_NAME, V_PATRON, V_FULL_FIO, V_FIO, V_BIRTH
      FROM ASU.TPEOPLES
     WHERE FK_ID = PPEOPLE;
    pCLOB := REPLACE(pCLOB, V_FULL_FIO, TO_CHAR(PPEOPLE));
    pCLOB := REPLACE(pCLOB, V_FIO, TO_CHAR(PPEOPLE));
    pCLOB := REPLACE(pCLOB, V_FAM, TO_CHAR(PPEOPLE));
    pCLOB := REPLACE(pCLOB,
                     TO_CHAR(TRUNC(V_BIRTH), 'DD.MM.YYYY') || ' г.',
                     TO_CHAR(TRUNC(V_BIRTH, 'MM'), 'DD.MM.YYYY'));
    pCLOB := REPLACE(pCLOB,
                     TO_CHAR(TRUNC(V_BIRTH), 'DD.MM.YYYY'),
                     TO_CHAR(TRUNC(V_BIRTH, 'MM'), 'DD.MM.YYYY'));
    pCLOB := REPLACE(pCLOB, GET_NCHAR_ASCII(V_FAM), TO_CHAR(PPEOPLE));
    pCLOB := REPLACE(pCLOB, GET_NCHAR_ASCII(V_NAME), TO_CHAR(PPEOPLE));
    pCLOB := REPLACE(pCLOB, GET_NCHAR_ASCII(V_PATRON), TO_CHAR(PPEOPLE));
    FOR C IN (SELECT FK_ID FROM ASU.TADRESS WHERE FK_PACID = PPEOPLE) LOOP
      pCLOB := REPLACE(pCLOB, ASU.GET_ADDR_STR_BY_ID(C.FK_ID), '');
    END LOOP;
  END;

  PROCEDURE REPLACE_BLOB(PBLOB IN OUT BLOB, PPEOPLE NUMBER) IS
    cCLOB          CLOB;
    v_dest_offset  INTEGER := 1;
    v_src_offset   INTEGER := 1;
    v_lang_context INTEGER := DBMS_LOB.DEFAULT_LANG_CTX;
    v_warning      INTEGER := 0;
  BEGIN
    DBMS_LOB.createtemporary(cCLOB, TRUE);
    DBMS_LOB.CONVERTTOCLOB(CCLOB,
                           pBLOB,
                           DBMS_LOB.LOBMAXSIZE,
                           v_dest_offset,
                           v_src_offset,
                           DBMS_LOB.DEFAULT_CSID,
                           v_lang_context,
                           v_warning);
    REPLACE_CLOB(cCLOB, PPEOPLE);
    v_dest_offset  := 1;
    v_src_offset   := 1;
    v_lang_context := DBMS_LOB.DEFAULT_LANG_CTX;
    v_warning      := 0;
    DBMS_LOB.CONVERTTOBLOB(pBLOB,
                           CCLOB,
                           DBMS_LOB.LOBMAXSIZE,
                           v_dest_offset,
                           v_src_offset,
                           DBMS_LOB.DEFAULT_CSID,
                           v_lang_context,
                           v_warning);

  END;

  PROCEDURE DO_ANONYMIZE(PPEOPLEID IN NUMBER, PSOTRID IN NUMBER) IS
    pAnonimId NUMBER;
    sHOUSE    VARCHAR2(10);
  BEGIN
    -- обезличиваем протоколы
    FOR rv IN (SELECT FK_ID, FB_BLOB, FB_HTML, FB_TEXT
                 FROM ASU.TRICHVIEWDATA
                WHERE FK_PACID IN
                      (SELECT FK_ID
                         FROM VNAZ
                        WHERE FK_PACID IN
                              (SELECT FK_ID
                                 FROM ASU.TKARTA
                                WHERE FK_PEPLID = PPEOPLEID
                               UNION ALL
                               SELECT FK_ID
                                 FROM ASU.TAMBULANCE
                                WHERE FK_PEPLID = PPEOPLEID)
                       UNION ALL
                       SELECT FK_ID
                         FROM ASU.TEPIKRIZ
                        WHERE FK_PACID IN
                              (SELECT FK_ID
                                 FROM ASU.TKARTA
                                WHERE FK_PEPLID = PPEOPLEID
                               UNION ALL
                               SELECT FK_ID
                                 FROM ASU.TAMBULANCE
                                WHERE FK_PEPLID = PPEOPLEID))
                  FOR UPDATE
                ORDER BY FK_ID) LOOP
      DBMS_OUTPUT.put_line(RV.FK_ID);
      IF RV.FB_BLOB IS NOT NULL THEN
        REPLACE_BLOB(RV.FB_BLOB, PPEOPLEID);
      END IF;
      IF RV.FB_HTML IS NOT NULL THEN
        REPLACE_CLOB(RV.FB_HTML, PPEOPLEID);
        UPDATE ASU.TRICHVIEWDATA
           SET FB_HTML = RV.FB_HTML
         WHERE FK_ID = RV.FK_ID;
      END IF;
      IF RV.FB_TEXT IS NOT NULL THEN
        REPLACE_CLOB(RV.FB_TEXT, PPEOPLEID);
        UPDATE ASU.TRICHVIEWDATA
           SET FB_TEXT = RV.FB_TEXT
         WHERE FK_ID = RV.FK_ID;
      END IF;
    END LOOP;

    -- обнуляем разделы наглядной ИБ
    UPDATE ASU.TIBXMLTEXT
       SET FN_CHECKSM = 0
     WHERE FK_PACID IN
           (SELECT FK_ID
              FROM ASU.TKARTA
             WHERE FK_PEPLID = PPEOPLEID
            UNION ALL
            SELECT FK_ID FROM ASU.TAMBULANCE WHERE FK_PEPLID = PPEOPLEID);

    FOR C IN (SELECT FC_FAM,
                     FC_IM,
                     FC_OTCH,
                     FP_SEX,
                     FD_ROJD,
                     FK_DOCVID,
                     FC_DOCSER,
                     FC_DOCNUM,
                     FD_DOCDATE,
                     FC_DOCVIDAN,
                     FC_RABOTA,
                     FC_PHONE,
                     FC_FAX,
                     FC_E_MAIL,
                     FC_HTTP,
                     FK_COMPANYID,
                     FK_OTDEL,
                     FK_DOLGNOST,
                     FC_ROJDPLACE,
                     FK_GROUPID
                FROM ASU.TPEOPLES
               WHERE FK_ID = PPEOPLEID) LOOP
      INSERT INTO ASU.TANONYM_PEOPLE
        (FC_FAM,
         FC_IM,
         FC_OTCH,
         FP_SEX,
         FD_ROJD,
         FK_DOCVID,
         FC_DOCSER,
         FC_DOCNUM,
         FD_DOCDATE,
         FC_DOCVIDAN,
         FC_RABOTA,
         FC_PHONE,
         FC_FAX,
         FC_E_MAIL,
         FC_HTTP,
         FK_COMPANYID,
         FK_OTDEL,
         FK_DOLGNOST,
         FC_ROJDPLACE,
         FK_GROUPID)
      VALUES
        (C.FC_FAM,
         C.FC_IM,
         C.FC_OTCH,
         C.FP_SEX,
         C.FD_ROJD,
         C.FK_DOCVID,
         C.FC_DOCSER,
         C.FC_DOCNUM,
         C.FD_DOCDATE,
         C.FC_DOCVIDAN,
         C.FC_RABOTA,
         C.FC_PHONE,
         C.FC_FAX,
         C.FC_E_MAIL,
         C.FC_HTTP,
         C.FK_COMPANYID,
         C.FK_OTDEL,
         C.FK_DOLGNOST,
         C.FC_ROJDPLACE,
         C.FK_GROUPID)
      RETURNING fk_id INTO pAnonimId;
      -- делаем связку
      INSERT INTO ASU.TANONYMIZE
        (FK_PEOPLE, FC_HASH)
      VALUES
        (PPEOPLEID,
         SYS.DBMS_CRYPTO.HASH(UTL_RAW.CAST_TO_RAW(C.FC_FAM || '/' || C.FC_IM || '/' ||
                                              C.FC_OTCH || '/' ||
                                              TO_CHAR(C.FD_ROJD,
                                                      'DDMMYYYYHH24MISS') || '/' ||
                                              PANONIMID),
                          DBMS_CRYPTO.HASH_MD5));
    END LOOP;
    UPDATE ASU.TPEOPLES
       SET FC_FAM       = PPEOPLEID,
           FC_IM        = NULL,
           FC_OTCH      = NULL,
           FD_ROJD      = TRUNC(FD_ROJD, 'MM'),
           FK_DOCVID    = NULL,
           FC_DOCSER    = NULL,
           FC_DOCNUM    = NULL,
           FD_DOCDATE   = NULL,
           FC_DOCVIDAN  = NULL,
           FC_ROJDPLACE = NULL,
           FK_GROUPID   = NULL,
           FC_HTTP      = NULL
     WHERE FK_ID = PPEOPLEID;
    --стираем информацию в документах
    UPDATE ASU.TKARTA
       SET FC_FAM       = PPEOPLEID,
           FC_IM        = NULL,
           FC_OTCH      = NULL,
           FC_RABOTA    = NULL,
           FD_ROJD      = TRUNC(FD_ROJD, 'MM'),
           FK_COUNTRYID = NULL,
           FK_REGIONID  = NULL,
           FK_TOWNID    = NULL,
           FC_ADR       = NULL
     WHERE FK_PEPLID = PPEOPLEID;
    UPDATE ASU.TAMBULANCE
       SET FC_FAM    = PPEOPLEID,
           FC_IM     = NULL,
           FC_OTCH   = NULL,
           FC_RABOTA = NULL,
           FD_ROJD   = TRUNC(FD_ROJD, 'MM'),
           FC_ADR    = NULL
     WHERE FK_PEPLID = PPEOPLEID;
    --Переносим адреса
    INSERT INTO ASU.TANONYM_ADDRESS
      SELECT FK_ID,
             FK_COUNTRYID,
             FK_REGIONID,
             FK_TOWNID,
             FK_STREETID,
             PANONIMID,
             FK_TYPE,
             FL_AS_ANOTHER,
             FK_RAIONID,
             FC_ADR,
             FK_INTOWNID,
             FC_HOUSE,
             FC_KORPUS,
             FC_KVARTIRA,
             FK_KLADR,
             FD_DATE,
             FK_APPSOTRID
        FROM ASU.TADRESS
       WHERE FK_PACID = PPEOPLEID;

    --Удалаяем адреса - сохранем участки
    FOR C IN (SELECT FK_ID,
                     ASU.GET_DISTRICTID_BY_ADDRID(FK_ID) DISTR_ID,
                     FC_HOUSE
                FROM ASU.TADRESS
               WHERE FK_PACID = PPEOPLEID) LOOP
      IF NVL(C.DISTR_ID, 0) <= 0 THEN
        DELETE FROM ASU.TADRESS WHERE FK_ID = C.FK_ID;

      ELSE
        -- берем произвольную улицу из того участка
        -- возможны проблемы при пересечении участков т.к в GET_DISTRICTID_BY_ADDRID изпользуеься MAX
        FOR DISTR IN (SELECT FK_ID,
                             FN_FROM,
                             FN_TO,
                             FC_RANGE,
                             FC_ANTIRANGE,
                             FK_KLADR
                        FROM ASU.TDISTRICT
                       WHERE TDISTRICT.FK_DISTRICT =
                             (SELECT FK_DISTRICT
                                FROM ASU.TDISTRICT
                               WHERE FK_ID = C.DISTR_ID)
                       ORDER BY DECODE(FK_ID, C.DISTR_ID, 1, 0),
                                DBMS_RANDOM.VALUE) LOOP
          SHOUSE := C.FC_HOUSE;

          -- берем произвольный дом с этой улицы
          WHILE NOT
                 (SHOUSE <> C.FC_HOUSE AND
                 ((TO_NUMBER(TRANSLATE(SHOUSE,
                                        '0' ||
                                        TRANSLATE(SHOUSE, '_1234567890', '_'),
                                        '0')) BETWEEN DISTR.FN_FROM AND
                 DISTR.FN_TO) OR
                 ',' || TRANSLATE(DISTR.FC_RANGE, '1 ', '1') || ',' LIKE
                 '%,' || SHOUSE || ',%') AND
                 NOT ',' || TRANSLATE(DISTR.FC_ANTIRANGE, '1 ', '1') || ',' LIKE
                  '%,' || SHOUSE || ',%') LOOP
            IF DISTR.FN_TO > 0 THEN
              SHOUSE := TRUNC(DBMS_RANDOM.VALUE(DISTR.FN_FROM, DISTR.FN_TO));
            ELSE
              SHOUSE := TRUNC(DBMS_RANDOM.VALUE * 1000);
            END IF;
          END LOOP;
          UPDATE ASU.TADRESS
             SET FK_COUNTRYID  = NULL,
                 FK_REGIONID   = NULL,
                 FK_TOWNID     = NULL,
                 FK_STREETID   = NULL,
                 FL_AS_ANOTHER = NULL,
                 FK_RAIONID    = NULL,
                 FC_ADR        = NULL,
                 FK_INTOWNID   = NULL,
                 FC_HOUSE      = SHOUSE,
                 FC_KORPUS     = NULL,
                 FC_KVARTIRA   = NULL,
                 FK_KLADR      = DISTR.FK_KLADR,
                 FD_DATE       = NULL,
                 FK_APPSOTRID  = NULL
           WHERE FK_ID = C.FK_ID;
          EXIT;
        END LOOP;
      END IF;
    END LOOP;
    ASU.PKG_SOGLASIE_PAC.INS_TPERSONAL_DATA(PPEOPLEID, SYSDATE, PSOTRID, 1);

  END;

  FUNCTION GET_PEOPLE_FIO(pPeopleID NUMBER) RETURN VARCHAR2 IS
    RESULT VARCHAR2(150);
  BEGIN
    FOR C IN (SELECT AP.FC_FAM || ' ' || AP.FC_IM || ' ' || AP.FC_OTCH AS FIO
                FROM ASU.TANONYM_PEOPLE AP, ASU.TANONYMIZE A
               WHERE A.FK_PEOPLE = PPEOPLEID
                 AND hextoRaw(A.FC_HASH) =
                     DBMS_CRYPTO.HASH(UTL_RAW.CAST_TO_RAW(AP.FC_FAM || '/' ||
                                                          AP.FC_IM || '/' ||
                                                          AP.FC_OTCH || '/' ||
                                                          TO_CHAR(AP.FD_ROJD,
                                                                  'DDMMYYYYHH24MISS') || '/' ||
                                                          AP.FK_ID),
                                      DBMS_CRYPTO.HASH_MD5)) LOOP
      RESULT := C.FIO;
    END LOOP;
    RETURN RESULT;
  END;

  FUNCTION GET_PEOPLE_BIRTH(pPeopleID NUMBER) RETURN DATE IS
    RESULT DATE;
  BEGIN
    FOR C IN (SELECT FD_ROJD
                FROM ASU.TANONYM_PEOPLE AP, ASU.TANONYMIZE A
               WHERE A.FK_PEOPLE = PPEOPLEID
                 AND hextoRaw(A.FC_HASH) =
                     DBMS_CRYPTO.HASH(UTL_RAW.CAST_TO_RAW(AP.FC_FAM || '/' ||
                                                          AP.FC_IM || '/' ||
                                                          AP.FC_OTCH || '/' ||
                                                          TO_CHAR(AP.FD_ROJD,
                                                                  'DDMMYYYYHH24MISS') || '/' ||
                                                          AP.FK_ID),
                                      DBMS_CRYPTO.HASH_MD5)) LOOP
      RESULT := C.FD_ROJD;
    END LOOP;
    RETURN RESULT;
  END;

END PKG_ANONYMIZE;
/

SHOW ERRORS;


