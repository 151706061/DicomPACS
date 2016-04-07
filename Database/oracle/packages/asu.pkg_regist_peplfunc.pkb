DROP PACKAGE BODY ASU.PKG_REGIST_PEPLFUNC
/

--
-- PKG_REGIST_PEPLFUNC  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_REGIST_PEPLFUNC" IS
  -- Created by TimurLan
  FUNCTION ADD_VALUE(pFC_TARGET  IN VARCHAR2,
                     pFC_VALUE   IN VARCHAR2,
                     pFC_KEYWORD IN VARCHAR) RETURN VARCHAR2 IS
  BEGIN
    IF pFC_TARGET IS NULL THEN
      RETURN pFC_TARGET;
    ELSE
      IF pFC_KEYWORD = 'BEFORE' THEN
        RETURN pFC_VALUE || pFC_TARGET;
      ELSIF pFC_KEYWORD = 'AFTER' THEN
        RETURN pFC_TARGET || pFC_VALUE;
      ELSE
        RETURN pFC_TARGET;
      END IF;
    END IF;
  END;
  /*###############################################################################################*/
  FUNCTION REPLACE_SPACES(pFC_VALUE IN VARCHAR2) RETURN VARCHAR2 IS
    RESULT VARCHAR2(32767);
  BEGIN
    RESULT := TRIM(' ' FROM pFC_VALUE);
    IF RESULT IS NULL THEN
      RETURN NULL;
    END IF;
    LOOP
      EXIT WHEN INSTR(RESULT, '  ') = 0;
      RESULT := REPLACE(RESULT, '  ', ' ');
    END LOOP;
    RETURN(RESULT);
  END;
  /*###############################################################################################*/
  /*###############################################################################################*/
  FUNCTION GET_PEPL_ID(pFK_PACID IN BINARY_INTEGER) RETURN BINARY_INTEGER IS
    CURSOR c IS
      SELECT FK_PEPLID
        FROM TKARTA
       WHERE FK_ID = pFK_PACID
      UNION
      SELECT FK_PEPLID FROM TAMBULANCE WHERE FK_ID = pFK_PACID;
    RESULT NUMBER;
  BEGIN
    OPEN c;
    FETCH c
      INTO RESULT;
    CLOSE c;
    RETURN(NVL(RESULT, -1));
  END;
  /*###############################################################################################*/
  -- zhukov изавился от лишних рекурсивных вызовов
  FUNCTION GET_PEPL_FIO(pfk_peplid IN BINARY_INTEGER) RETURN VARCHAR2 IS
    CURSOR c IS
      SELECT tpeoples.fc_fam ||
             DECODE(tpeoples.fc_im,
                    NULL,
                    '',
                    ' ' || SUBSTR(tpeoples.fc_im, 1, 1) || '.' ||
                    DECODE(tpeoples.fc_otch,
                           NULL,
                           '',
                           ' ' || SUBSTR(tpeoples.fc_otch, 1, 1) || '.')) AS fc_name
        FROM tpeoples
       WHERE fk_id = pfk_peplid;

    RESULT VARCHAR2(100);
  BEGIN
    OPEN c;

    FETCH c
      INTO RESULT;

    CLOSE c;

    RETURN(replace_spaces(RESULT));
  END get_pepl_fio;

  /*###############################################################################################*/
  FUNCTION GET_PEPL_FULLFIO(pFK_PEPLID IN BINARY_INTEGER) RETURN VARCHAR2 IS
    CURSOR c IS
      SELECT FC_FAM || ' ' || FC_IM || ' ' || FC_OTCH
        FROM TPEOPLES
       WHERE FK_ID = pFK_PEPLID;
    RESULT VARCHAR2(100);
  BEGIN
    OPEN c;
    FETCH c
      INTO RESULT;
    CLOSE c;
    RETURN(REPLACE_SPACES(RESULT));
  END;
  /*###############################################################################################*/
  FUNCTION GET_PEPL_ADRID(pFK_PEPLID IN BINARY_INTEGER,
                          pFK_TYPE   IN BINARY_INTEGER DEFAULT -1)
    RETURN BINARY_INTEGER
  /*
     Edited by Spasskiy S.N. 06102008
     Добавлен параметр указание типа адреса tadrtype.fk_id
    */
   IS
    CURSOR c IS
      SELECT FK_ID, FK_TYPE
        FROM TADRESS
       WHERE FK_PACID = pFK_PEPLID
       ORDER BY FK_ID DESC;
    CURSOR cMin IS
      SELECT MIN(FK_ID) FROM TADRESS WHERE FK_PACID = pFK_PEPLID;
    nTemp  BINARY_INTEGER;
    RESULT BINARY_INTEGER;
  BEGIN
    IF pFK_TYPE = -1 THEN
      SELECT FK_ID INTO NTEMP FROM TADRTYPE WHERE FL_DEFAULT = 1;
    ELSE
      nTemp := pFK_TYPE;
    END IF;
    FOR p IN c LOOP
      IF c%ROWCOUNT = 1 AND pFK_TYPE = -1 THEN
        RESULT := p.FK_ID;
      ELSIF p.FK_TYPE = nTemp THEN
        RESULT := p.FK_ID;
        EXIT;
      ELSE
        IF pFK_TYPE = -1 THEN
          OPEN cMin;
          FETCH cMin
            INTO RESULT;
          CLOSE cMin;
        END IF;
      END IF;
    END LOOP;
    RETURN(RESULT);
  END;
  /*###############################################################################################*/
  FUNCTION GET_PEPL_ADRSHORT(pFK_PEPLID IN BINARY_INTEGER) RETURN VARCHAR2 IS
    CURSOR c(pFK_ADRID IN NUMBER) IS
      SELECT /*+ rule*/
       GET_COUNTRY(FK_COUNTRYID) || ' ' || GET_REGION(FK_REGIONID) || ' ' ||
       GET_TOWN(FK_TOWNID) || ' ' || FC_ADR
        FROM TADRESS
       WHERE FK_ID = pFK_ADRID; --pGET_PEPL_ADRID(pFK_PEPLID);
    RESULT VARCHAR2(255);
  BEGIN
    OPEN c(GET_PEPL_ADRID(pFK_PEPLID));
    FETCH c
      INTO RESULT;
    CLOSE c;
    RETURN(REPLACE_SPACES(RESULT));
  END;
  /*###############################################################################################*/
  FUNCTION GET_PEPL_ADRFULL(pFK_PEPLID IN BINARY_INTEGER,
                            pFK_TYPE   IN BINARY_INTEGER DEFAULT -1)
    RETURN VARCHAR2
  /*
     Edited by Spasskiy S.N. 06102008
     Использование КЛАДР
    */
   IS
    CURSOR c(pFK_ADRID IN NUMBER) IS
    -- SELECT ASU.GET_ADDR_STR_BY_ID(pFK_ADRID) FROM DUAL;
      SELECT CASE
               WHEN fk_kladr > 0 THEN
                'РОССИЙСКАЯ ФЕДЕРАЦИЯ, ' || adr
             END AS FC_KLADDR,
             nvl(TRIM(FC_ADR), adr) fc_adr,
             fk_kladr
        FROM (SELECT /*+ rule*/ /*GET_COUNTRY(FK_COUNTRYID)||' '||GET_REGION(FK_REGIONID)||' '||GET_RAION(FK_RAIONID)||' '||*/
               GET_TOWN(FK_TOWNID) || ' ' || GET_INTOWN(FK_INTOWNID) || ' ' ||
               GET_STREET(FK_STREETID) || ' ' || FC_HOUSE || ' ' ||
               ADD_VALUE(FC_KORPUS, 'КОРП.', 'BEFORE') || ' ' ||
               ADD_VALUE(FC_KVARTIRA, 'КВ.', 'BEFORE') fc_adr, -- rem for ugorsk only
               fk_kladr,
               ASU.GET_ADDR_STR_BY_ID(pFK_ADRID) adr
                FROM TADRESS
               WHERE FK_ID = pFK_ADRID); --pGET_PEPL_ADRID(pFK_PEPLID);
    RESULT VARCHAR2(255);
  BEGIN
    /* open c(GET_PEPL_ADRID(pFK_PEPLID, pFK_TYPE));
    fetch c into Result;
    close c;*/
    FOR adr IN c(GET_PEPL_ADRID(pFK_PEPLID, pFK_TYPE)) LOOP
      IF adr.fk_kladr > 0 THEN
        RESULT := adr.fc_KLADDR;
      ELSE
        RESULT := adr.fc_adr;
      END IF;
    END LOOP;

    RETURN(REPLACE_SPACES(RESULT));
  END;
  /*###############################################################################################*/
  FUNCTION GET_PEPL_WORKPLACE(pFK_PEPLID IN BINARY_INTEGER) RETURN VARCHAR2 IS
    CURSOR c IS
      SELECT /*+ rule*/
       GET_PACCOMPANY(FK_COMPANYID) || ' ' ||
       GET_PACCOMPANY_OTDEL(FK_OTDEL) || ' ' ||
       GET_PACCOMPANY_DOLGNOST(FK_DOLGNOST) || ' ' || FC_RABOTA
        FROM TPEOPLES
       WHERE FK_ID = pFK_PEPLID;
    RESULT VARCHAR2(255);
  BEGIN
    OPEN c;
    FETCH c
      INTO RESULT;
    CLOSE c;
    RETURN(REPLACE_SPACES(RESULT));
  END;
  /*###############################################################################################*/
  FUNCTION GET_PEPL_SEXID(pFK_PEPLID IN BINARY_INTEGER) RETURN BINARY_INTEGER IS
    CURSOR c IS
      SELECT /*+ rule*/
       FP_SEX
        FROM TPEOPLES
       WHERE FK_ID = pFK_PEPLID;
    RESULT BINARY_INTEGER;
  BEGIN
    OPEN c;
    FETCH c
      INTO RESULT;
    CLOSE c;
    RETURN(RESULT);
  END;
  /*###############################################################################################*/
  FUNCTION GET_PEPL_SEX(pFK_PEPLID IN BINARY_INTEGER) RETURN VARCHAR2 IS
    CURSOR c IS
      SELECT /*+ rule*/
       FP_SEX
        FROM TPEOPLES
       WHERE FK_ID = pFK_PEPLID;
    nTemp BINARY_INTEGER;
  BEGIN
    OPEN c;
    FETCH c
      INTO nTemp;
    CLOSE c;
    IF nTemp = 0 THEN
      RETURN 'Женский';
    ELSIF nTemp = 1 THEN
      RETURN 'Мужской';
    ELSE
      RETURN 'Не известен';
    END IF;
  END;
  /*###############################################################################################*/
  FUNCTION GET_PEPL_SEXLITER(pFK_VARID IN BINARY_INTEGER,
                             pFN_VALUE IN BINARY_INTEGER DEFAULT 1)
    RETURN CHAR IS
    CURSOR c IS
      SELECT /*+ rule*/
       FP_SEX
        FROM TPEOPLES
       WHERE FK_ID = pFK_VARID;
    nTemp BINARY_INTEGER;
  BEGIN
    IF pFN_VALUE = 1 THEN
      OPEN c;
      FETCH c
        INTO nTemp;
      CLOSE c;
    ELSE
      nTemp := pFK_VARID;
    END IF;
    IF nTemp = 0 THEN
      RETURN 'Ж';
    ELSIF nTemp = 1 THEN
      RETURN 'М';
    ELSE
      RETURN 'Н';
    END IF;
  END;
  /*###############################################################################################*/
  FUNCTION GET_PEPL_AGE_NOW(pFK_PEPLID IN BINARY_INTEGER)
    RETURN BINARY_INTEGER IS
    CURSOR c IS
      SELECT /*+ rule*/
       TRUNC(MONTHS_BETWEEN(SYSDATE, FD_ROJD) / 12)
        FROM TPEOPLES
       WHERE FK_ID = pFK_PEPLID;
    RESULT BINARY_INTEGER;
  BEGIN
    OPEN c;
    FETCH c
      INTO RESULT;
    CLOSE c;
    RETURN(NVL(RESULT, 0));
  END;
  /*###############################################################################################*/
  FUNCTION GET_PEPL_AGE_DATE(pFK_PEPLID IN BINARY_INTEGER,
                             pFD_DATE   IN DATE) RETURN BINARY_INTEGER IS
    CURSOR c IS
      SELECT /*+ rule*/
       TRUNC(MONTHS_BETWEEN(pFD_DATE, FD_ROJD) / 12)
        FROM TPEOPLES
       WHERE FK_ID = pFK_PEPLID;
    RESULT BINARY_INTEGER;
  BEGIN
    OPEN c;
    FETCH c
      INTO RESULT;
    CLOSE c;
    RETURN(NVL(RESULT, 0));
  END;
  /*###############################################################################################*/
  FUNCTION GET_PEPL_AGE_MONTH(pFK_PEPLID IN BINARY_INTEGER) RETURN VARCHAR2 IS
    CURSOR c IS
      SELECT /*+ rule*/
       FD_ROJD,
       TRUNC(MONTHS_BETWEEN(SYSDATE, FD_ROJD) / 12),
       TRUNC(MONTHS_BETWEEN(SYSDATE, FD_ROJD)) -
       TRUNC((MONTHS_BETWEEN(SYSDATE, FD_ROJD) / 12)) * 12
        FROM TPEOPLES
       WHERE FK_ID = pFK_PEPLID;
    nYear  NUMBER;
    nMonth NUMBER;
    dDate  DATE;
  BEGIN
    OPEN c;
    FETCH c
      INTO dDate, nYear, nMonth;
    CLOSE c;
    IF TO_CHAR(nYear) = '0' THEN
      IF TO_CHAR(nMonth) = '0' THEN
        RETURN(TO_CHAR(TRUNC(SYSDATE - dDate)) || ' дн.');
      ELSE
        RETURN(TO_CHAR(nMonth) || ' мес.');
      END IF;
    ELSE
      RETURN(TO_CHAR(nYear) || ' + ' || TO_CHAR(nMonth) || ' мес.');
    END IF;
  END;
  /*###############################################################################################*/
  FUNCTION GET_PEPL_FCGROUP(pFK_VARID IN BINARY_INTEGER,
                            pFN_VALUE IN BINARY_INTEGER DEFAULT 0)
    RETURN VARCHAR2 IS
    CURSOR c IS
      SELECT FC_NAME FROM TGROUP WHERE FK_ID = pFK_VARID;
    CURSOR c1 IS
      SELECT FC_NAME
        FROM TGROUP
       WHERE FK_ID =
             (SELECT FK_GROUPID FROM TPEOPLES WHERE FK_ID = pFK_VARID);
    RESULT VARCHAR2(100);
  BEGIN
    IF pFN_VALUE = 1 THEN
      OPEN c1;
      FETCH c1
        INTO RESULT;
      CLOSE c1;
    ELSE
      OPEN c;
      FETCH c
        INTO RESULT;
      CLOSE c;
    END IF;
    RETURN(NVL(RESULT, 'Не определено'));
  END;
  /*###############################################################################################*/
  FUNCTION GET_PEPL_INSURANCE(pFK_PEPLID IN BINARY_INTEGER) RETURN VARCHAR2 IS
    CURSOR c IS
      SELECT FC_SER, FC_NUM
        FROM TINSURANCE
       WHERE FK_PEPLID = pFK_PEPLID
         AND FL_OLD = 0;
    RESULT VARCHAR2(32767);
  BEGIN
    FOR p IN c LOOP
      IF RESULT IS NULL THEN
        RESULT := RESULT || p.FC_SER || ' ' || p.FC_NUM;
      ELSE
        RESULT := RESULT || ';' || p.FC_SER || ' ' || p.FC_NUM;
      END IF;
    END LOOP;
    RETURN(TRIM(' ' FROM RESULT));
  END;
  /*###############################################################################################*/
  --Added by Spasskiy S.N. 05.10.2009
  FUNCTION GET_PEPL_SNILS(pFK_PEPLID IN BINARY_INTEGER)
    RETURN ASU.TPEOPLES.FC_SNILS%TYPE IS
    CURSOR c IS
      SELECT FC_SNILS FROM TPEOPLES WHERE FK_ID = pFK_PEPLID;
    RESULT VARCHAR2(100);
  BEGIN
    OPEN c;
    FETCH c
      INTO RESULT;
    CLOSE c;
    RETURN(REPLACE_SPACES(RESULT));
  END;
  
  /*###############################################################################################*/
-- Added by Slusarenko 21.06.2011
-- Возвращает данные пациента о документе, удостоверяющем его личность
  function GET_PEPL_DOCUMENTUDOVLICHN(pFK_PEPLID IN BINARY_INTEGER) return varchar2 is
    Result varchar2(1000) := ' ';

    cursor c is
      select p.fk_docvid,
             d.fc_name as fc_docname,
             p.fc_docser,
             p.fc_docnum,
             p.fc_docvidan,
             p.fd_docdate
        from asu.tpeoples p,
             asu.tviddoc d
       where p.fk_docvid = d.fk_id
         and p.fk_id = pFK_PEPLID;

    doc c%rowtype;

  begin
    open  c;
    fetch c into doc;
    if (c%notfound) then
      Result := ' ';
    else
      if (trim(doc.fc_docname) is not null) then
        Result := doc.fc_docname || '%';
      end if;

      if (trim(doc.fc_docser) is not null) then
        Result := Result || 'серия ' || doc.fc_docser || '%';
      end if;

      if (trim(doc.fc_docnum) is not null) then
        Result := Result || 'номер ' || doc.fc_docnum || '%';
      end if;

      if (trim(doc.fc_docvidan) is not null) then
        Result := Result || 'выдан ' || doc.fc_docvidan || '%';
      end if;

      if (trim(to_char(doc.fd_docdate, 'dd.mm.yyyy')) is not null) then
        Result := Result || to_char(doc.fd_docdate, 'dd.mm.yyyy') || ' г.';
      end if;

      if (substr(Result, length(Result), 1) = '%') then
        Result := substr(Result, 1, length(Result)-1);
      end if;

      Result := replace(Result, '%', ', ');

    end if;
    close c;

    return(Result);

  end;

  /*###############################################################################################*/
-- Added by Slusarenko 21.06.2011
-- Возвращает Социальное положение человека
  function GET_PEPL_SOCPOL(pFK_PEPLID IN BINARY_INTEGER) return varchar2 is
    Result varchar2(1000) := ' ';

    cursor c is
      select distinct asu.get_smidname(i.fk_smid) as nm
        from tib i
       where i.fk_pacid = pFK_PEPLID
         and i.fk_smeditid in (select fk_id from tsmid where fc_synonim = 'LD_SOC_POL')
      order by 1;

  begin

    for i in c loop
      if (trim(i.nm) is not null) then
        Result := Result || i.nm || '%';
      end if;
    end loop;

    if (trim(Result) is null) then
      Result := 'Не определено';
    else
      Result := trim(Result);

      if (substr(Result, length(Result), 1) = '%') then
        Result := substr(Result, 1, length(Result)-1);
      end if;

      Result := replace(Result, '%', ', ');

    end if;

    return(Result);
  end;

  /*###############################################################################################*/
-- Added by Slusarenko 21.06.2011
-- Возвращает Социальное положение человека
  function GET_PEPL_INVALIDNOST(pFK_PEPLID IN BINARY_INTEGER) return varchar2 is
    Result varchar2(1000) := ' ';

    cursor c is
      select distinct asu.get_smidname(i.fk_smid) as nm
        from tib i
       where i.fk_pacid = pFK_PEPLID
         and i.fk_smeditid in (select fk_id from tsmid where fc_synonim in ('LD_INV', 'LD_INVALID_VID'))
      order by 1;

  begin

    for i in c loop
      if (trim(i.nm) is not null) then
        Result := Result || i.nm || '%';
      end if;
    end loop;

    if (trim(Result) is null) then
      Result := ' ';
    else
      Result := trim(Result);

      if (substr(Result, length(Result), 1) = '%') then
        Result := substr(Result, 1, length(Result)-1);
      end if;

      Result := replace(Result, '%', ', ');

    end if;

    return(Result);
  end;

  /*###############################################################################################*/
-- Added by Slusarenko 22.06.2011
-- Возвращает: Да, если пациент согласен на обработку персональных данных, Нет - в противном случае
  function GET_PEPL_PERSONALDATASOGLASIE(pFK_PEPLID IN BINARY_INTEGER) return varchar2 is
    Result varchar2(5) := ' ';

  begin
    select decode(count(1), 0, 'Нет', 'Да') into Result
      from asu.tpersonal_data
     where fk_people = pFK_PEPLID
       and fp_type = 0;

    return(Result);
  end;

  /*###############################################################################################*/
-- Added by Slusarenko 23.06.2011
-- Возвращает: Все номера телефонов пациента
  function GET_PEPL_PHONES(pFK_PEPLID IN BINARY_INTEGER) return varchar2 is
    Result varchar2(200) := ' ';

    cursor c is
      select distinct fc_phone
        from (select fc_phone from asu.tpeoples where fk_id = pFK_PEPLID
              union all
              select fc_phone from asu.tkarta where fk_peplid = pFK_PEPLID
              union all
              select fc_phone from asu.tambulance where fk_peplid = pFK_PEPLID
              union all
              select fc_contact AS fc_phone from asu.tcontacts where fk_pacid = pFK_PEPLID
             );
  begin
    for i in c loop
      if (trim(i.fc_phone) is not null) then
        Result := Result || i.fc_phone || '%';
      end if;
    end loop;

    if (trim(Result) is null) then
      Result := ' ';
    else
      Result := trim(Result);

      if (substr(Result, length(Result), 1) = '%') then
        Result := substr(Result, 1, length(Result)-1);
      end if;

      Result := replace(Result, '%', ', ');
    end if;

    return(Result);
  end;



  /*###############################################################################################*/
-- Added by Slusarenko 22.06.2011
-- Возвращает: Да, если у пациента есть сопровождение, Нет - в противном случае
  function GET_PEPL_SOPR(pFK_PEPLID IN BINARY_INTEGER) return varchar2 is
    Result varchar2(5) := ' ';

  begin
    select decode(count(1), 0, 'Нет', 'Да') into Result
      from asu.tib i
     where i.fk_pacid = pFK_PEPLID
       and i.fk_smid in (select fk_id from tsmid where fc_synonim in ('SP_SOPROVOZHD'));

    return(Result);
  end;

  /*###############################################################################################*/
-- Added by Slusarenko 22.06.2011
-- Возвращает: Фамилию Имя Отчество (полностью) сопровождающего для человека pFK_PEPLID
  function GET_PEPL_SOPR_FIOFULL(pFK_PEPLID IN BINARY_INTEGER) return varchar2 is
    Result varchar2(300) := ' ';

    cursor c(ppFC_SYNONIM in varchar2) is
      select nvl(trim(i.fc_char), ' ') as txt
        from asu.tib i
       where i.fk_pacid = pFK_PEPLID
         and i.fk_smid in (select fk_id from tsmid where fc_synonim in (ppFC_SYNONIM)); --AGENT_SUR_NAME, AGENT_FIRST_NAME, AGENT_PATR_NAME

    sTxt varchar2(100);
  begin
    open  c('AGENT_SUR_NAME');
    fetch c into sTxt;
    close c;

    Result := sTxt;

    open  c('AGENT_FIRST_NAME');
    fetch c into sTxt;
    close c;

    Result := Result || ' ' || sTxt;

    open  c('AGENT_PATR_NAME');
    fetch c into sTxt;
    close c;

    Result := Result || ' ' || sTxt;

    Result := trim(Result);

    if (Result is null) then
      Result := ' ';
    end if;

    return(Result);
  end;


  /*###############################################################################################*/
-- Added by Slusarenko 27.06.2011
-- Возвращает: Фамилию И. О. сопровождающего для человека pFK_PEPLID
  function GET_PEPL_SOPR_FIO(pFK_PEPLID IN BINARY_INTEGER) return varchar2 is
    Result varchar2(300) := ' ';

    cursor c(ppFC_SYNONIM in varchar2) is
      select nvl(trim(i.fc_char), ' ') as txt
        from asu.tib i
       where i.fk_pacid = pFK_PEPLID
         and i.fk_smid in (select fk_id from tsmid where fc_synonim in (ppFC_SYNONIM)); --AGENT_SUR_NAME, AGENT_FIRST_NAME, AGENT_PATR_NAME

    sTxt varchar2(100);
    bThereIsName boolean;
  begin
    open  c('AGENT_SUR_NAME');
    fetch c into sTxt;
    close c;

    Result := sTxt;

    open  c('AGENT_FIRST_NAME');
    fetch c into sTxt;
    close c;

    bThereIsName := (trim(sTxt) is not null);

    Result := Result || ' ' || substr(sTxt, 1, 1) || '.';

    open  c('AGENT_PATR_NAME');
    fetch c into sTxt;
    close c;

    Result := Result || ' ' || substr(sTxt, 1, 1) || '.';

    if (bThereIsName) then
      Result := replace(Result, '.  .', '.');
    else
      Result := replace(Result, '.  .', ' ');
    end if;

    Result := trim(Result);

    if (Result is null) then
      Result := ' ';
    end if;

    return(Result);
  end;

  /*###############################################################################################*/
-- Added by Slusarenko 22.06.2011
-- Возвращает: Пол сопровождающего для человека pFK_PEPLID. 1 - мужской, 0 - женский, -1 - неопределен
  function GET_PEPL_SOPR_SEX(pFK_PEPLID IN BINARY_INTEGER) return integer is
    Result integer := -1;

    cursor c is
      select asu.get_synbyid(i.fk_smid) as syn
        from asu.tib i
       where i.fk_pacid = pFK_PEPLID
         and i.fk_smeditid in (select fk_id from tsmid where fc_synonim in ('AGENT_SEX'));

    sSyn varchar2(100);
  begin
    open  c;
    fetch c into sSyn;
    if (c%notfound) then
      sSyn := ' ';
    end if;
    close c;

    sSyn := trim(sSyn);

    if (sSyn = 'AGENT_SEX_M') then
      Result := 1;
    elsif (sSyn = 'AGENT_SEX_F') then
      Result := 0;
    elsif (sSyn is null) then
      Result := -1;
    end if;

    return(Result);
  end;

  /*###############################################################################################*/
-- Added by Slusarenko 22.06.2011
-- Возвращает: Дату рождения сопровождающего для человека pFK_PEPLID.
  function GET_PEPL_SOPR_BIRTHDAY(pFK_PEPLID IN BINARY_INTEGER) return varchar2 is
    Result varchar2(10) := ' ';

    cursor c is
      select to_char(trunc(i.fd_date), 'dd.mm.yyyy')
        from asu.tib i
       where i.fk_pacid = pFK_PEPLID
         and i.fk_smeditid in (select fk_id from tsmid where fc_synonim in ('AGENT_BIRTHDAY'));

  begin
    open  c;
    fetch c into Result;
    if (c%notfound) then
      Result := ' ';
    end if;
    close c;

    return(Result);
  end;

  /*###############################################################################################*/
-- Added by Slusarenko 22.06.2011
-- Возвращает данные о документе, удостоверяющем его личность сопровождающего для пациента pFK_PEPLID
  function GET_PEPL_SOPR_DOCUMENT(pFK_PEPLID IN BINARY_INTEGER) return varchar2 is
    Result varchar2(1000) := ' ';

    cursor c is
      select (select trim(asu.get_smidname(i.fk_smid))
                 from asu.tib i
                where i.fk_pacid = pFK_PEPLID
                  and i.fk_smeditid in (select fk_id from tsmid where fc_synonim in ('AGENT_VDK'))
              ) AS fc_docname,

              (select trim(i.fc_char)
                 from asu.tib i
                where i.fk_pacid = pFK_PEPLID
                  and i.fk_smeditid in (select fk_id from tsmid where fc_synonim in ('AGENT_DOCSER'))
              ) AS fc_docser,

              (select trim(i.fc_char)
                 from asu.tib i
                where i.fk_pacid = pFK_PEPLID
                  and i.fk_smeditid in (select fk_id from tsmid where fc_synonim in ('AGENT_DOCNUM'))
              ) AS fc_docnum,

              (select to_char(i.fd_date, 'dd.mm.yyyy')
                 from asu.tib i
                where i.fk_pacid = pFK_PEPLID
                  and i.fk_smeditid in (select fk_id from tsmid where fc_synonim in ('AGENT_DATE_V'))
              ) AS fd_docdate,

              (select trim(i.fc_char)
                 from asu.tib i
                where i.fk_pacid = pFK_PEPLID
                  and i.fk_smeditid in (select fk_id from tsmid where fc_synonim in ('AGENT_KEM'))
              ) AS fc_docvidan

         from dual;

    doc c%rowtype;

  begin
    open  c;
    fetch c into doc;
    if (c%notfound) then
      Result := ' ';
    else
      if (trim(doc.fc_docname) is not null) then
        Result := doc.fc_docname || '%';
      end if;

      if (trim(doc.fc_docser) is not null) then
        Result := Result || 'серия ' || doc.fc_docser || '%';
      end if;

      if (trim(doc.fc_docnum) is not null) then
        Result := Result || 'номер ' || doc.fc_docnum || '%';
      end if;

      if (trim(doc.fc_docvidan) is not null) then
        Result := Result || 'выдан ' || doc.fc_docvidan || '%';
      end if;

      if (trim(doc.fd_docdate) is not null) then
        Result := Result || doc.fd_docdate || ' г.';
      end if;

      if (substr(Result, length(Result), 1) = '%') then
        Result := substr(Result, 1, length(Result)-1);
      end if;

      Result := replace(Result, '%', ', ');

    end if;
    close c;

    return(Result);

  end;

  /*###############################################################################################*/
-- Added by Slusarenko 22.06.2011
-- Возвращает: СНИЛС сопровождающего для человека pFK_PEPLID
  function GET_PEPL_SOPR_SNILS(pFK_PEPLID IN BINARY_INTEGER) return varchar2 is
    Result varchar2(30) := ' ';

    cursor c is
      select nvl(trim(i.fc_char), ' ') as txt
        from asu.tib i
       where i.fk_pacid = pFK_PEPLID
         and i.fk_smid in (select fk_id from tsmid where fc_synonim in ('AGENT_SNILS'));

  begin
    open  c;
    fetch c into Result;
    if (c%notfound) then
      Result := ' ';
    end if;
    close c;

    return(Result);
  end;

  /*###############################################################################################*/
-- Added by Slusarenko 22.06.2011
-- Возвращает: адрес регистрации сопровождающего для человека pFK_PEPLID
  function GET_PEPL_SOPR_REGADDRESS(pFK_PEPLID IN BINARY_INTEGER) return varchar2 is
    Result varchar2(300) := ' ';

    cursor c is
      select nvl(trim(i.fc_char), ' ') as txt
        from asu.tib i
       where i.fk_pacid = pFK_PEPLID
         and i.fk_smid in (select fk_id from tsmid where fc_synonim in ('AGENT_REG_ADDRESS'));

  begin
    open  c;
    fetch c into Result;
    if (c%notfound) then
      Result := ' ';
    end if;
    close c;

    return(Result);
  end;

   /*###############################################################################################*/
-- Added by Slusarenko 23.06.2011
-- Возвращает: адрес контактный телефон сопровождающего для человека pFK_PEPLID
  function GET_PEPL_SOPR_PHONE(pFK_PEPLID IN BINARY_INTEGER) return varchar2 is
    Result varchar2(300) := ' ';

    cursor c is
      select nvl(trim(i.fc_char), ' ') as txt
        from asu.tib i
       where i.fk_pacid = pFK_PEPLID
         and i.fk_smid in (select fk_id from tsmid where fc_synonim in ('AGENT_PHONE'));

  begin
    open  c;
    fetch c into Result;
    if (c%notfound) then
      Result := ' ';
    end if;
    close c;

    return(Result);
  end;


  /*###############################################################################################*/
-- Added by Slusarenko 23.06.2011
-- Возвращает данные о документе, подтверждающем полномочия законного представителя пациента pFK_PEPLID
  function GET_PEPL_SOPR_POLNOMOCHDOC(pFK_PEPLID IN BINARY_INTEGER) return varchar2 is
    Result varchar2(1000) := ' ';

    cursor c is
      select (select trim(i.fc_char)
                 from asu.tib i
                where i.fk_pacid = pFK_PEPLID
                  and i.fk_smeditid in (select fk_id from tsmid where fc_synonim in ('AGENT_SOPRDOC_NAME'))
              ) AS fc_docname,

              (select trim(i.fc_char)
                 from asu.tib i
                where i.fk_pacid = pFK_PEPLID
                  and i.fk_smeditid in (select fk_id from tsmid where fc_synonim in ('AGENT_SOPRDOC_SER'))
              ) AS fc_docser,

              (select trim(i.fc_char)
                 from asu.tib i
                where i.fk_pacid = pFK_PEPLID
                  and i.fk_smeditid in (select fk_id from tsmid where fc_synonim in ('AGENT_SOPRDOC_NUM'))
              ) AS fc_docnum,

              (select to_char(i.fd_date, 'dd.mm.yyyy')
                 from asu.tib i
                where i.fk_pacid = pFK_PEPLID
                  and i.fk_smeditid in (select fk_id from tsmid where fc_synonim in ('AGENT_SOPRDOC_DATE'))
              ) AS fd_docdate,

              (select trim(i.fc_char)
                 from asu.tib i
                where i.fk_pacid = pFK_PEPLID
                  and i.fk_smeditid in (select fk_id from tsmid where fc_synonim in ('AGENT_SOPRDOC_KEM'))
              ) AS fc_docvidan

         from dual;

    doc c%rowtype;

  begin
    open  c;
    fetch c into doc;
    if (c%notfound) then
      Result := ' ';
    else
      if (trim(doc.fc_docname) is not null) then
        Result := doc.fc_docname || '%';
      end if;

      if (trim(doc.fc_docser) is not null) then
        Result := Result || 'серия ' || doc.fc_docser || '%';
      end if;

      if (trim(doc.fc_docnum) is not null) then
        Result := Result || 'номер ' || doc.fc_docnum || '%';
      end if;

      if (trim(doc.fc_docvidan) is not null) then
        Result := Result || 'выдан ' || doc.fc_docvidan || '%';
      end if;

      if (trim(doc.fd_docdate) is not null) then
        Result := Result || doc.fd_docdate || ' г.';
      end if;

      if (substr(Result, length(Result), 1) = '%') then
        Result := substr(Result, 1, length(Result)-1);
      end if;

      Result := replace(Result, '%', ', ');

    end if;
    close c;

    return(Result);

  end;

  /*###############################################################################################*/
-- Added by Slusarenko 29.06.2011
-- Возвращает дату рождения человека pFK_PEPLID
  function GET_PEPL_BITH (pFK_PEPLID IN BINARY_INTEGER) return DATE is
    CURSOR c IS
      SELECT FD_ROJD
        FROM TPEOPLES
       WHERE FK_ID = pFK_PEPLID;
    Result DATE;
  begin
    open c;
    fetch c into Result;
    close c;
    return Result;
  end;

  /*###############################################################################################*/
-- Added by Slusarenko 29.06.2011
-- Возвращает данные пипла о номере страхового полиса ОМС и название страховой компании:
--   pFL_ALL = 0 - полис + название страховой компании
--   pFL_ALL = 1 - полис
--   pFL_ALL = 2 - название страховой компании
  function GET_PEPL_INSURANCE_OMS_INFO(pFK_PEPLID IN BINARY_INTEGER, pFL_ALL IN NUMBER := 0) return varchar2 is
    Result varchar2(1000) := ' ';

    cursor c is
      select distinct
             nvl(trim(ind.fc_ser || ' ' || ind.fc_num), ' ') AS polis,
             ind.fk_companyid AS compony_id,
             nvl(trim(asu.get_company_longname(ind.fk_companyid)), ' ') AS company_name,
             'K' AS ka,
             ind.fd_begin
        from tkarta k,
             tpac_insurance pins,
             tinsurdocs ind
       where pins.fk_pacid = k.fk_id
         and ind.fk_id = pins.fk_insurdocid
         and ind.fk_typedocid = 1 -- ОМС
         and sysdate between ind.fd_begin and nvl(ind.fd_end, sysdate)
         and k.fk_peplid = pFK_PEPLID




      union all

      select distinct
             nvl(trim(ind.fc_ser || ' ' || ind.fc_num), ' ') AS polis,
             ind.fk_companyid AS compony_id,
             nvl(trim(asu.get_company_longname(ind.fk_companyid)), ' ') AS company_name,
             'A' AS ka,
             ind.fd_begin
        from tambulance a,
             tambtalon t,
             tambtalon_naz tn,
             vnaz n,
             tinsurdocs ind
       where t.fk_ambid = a.fk_id
         and ind.fk_id = t.fk_insuranceid
         and tn.fk_talonid (+) = t.fk_id
         and tn.fk_nazid = n.fk_id (+)
         and ind.fk_typedocid = 1 -- ОМС
         and sysdate between ind.fd_begin and nvl(ind.fd_end, sysdate)
         and a.fk_peplid = pFK_PEPLID

       order by fd_begin desc;

    ins c%rowtype;

  begin
    open  c;
    fetch c into ins;

    if (c%found) then
      if (pFL_ALL = 0) then
        Result := ins.polis || '%' || ins.company_name;
      elsif (pFL_ALL = 1) then
        Result := ins.polis;
      elsif (pFL_ALL = 2) then
        Result := ins.company_name;
      end if;
    end if;

    close c;

    Result := trim(Result);

    if (substr(Result, length(Result), 1) = '%') then
      Result := substr(Result, 1, length(Result)-1);
    end if;

    Result := replace(Result, '%', ', ');

    if (Result is null) then
      Result := ' ';
    end if;

    return (Result);
  end;

   /*###############################################################################################*/
-- Added by Slusarenko 02.07.2011
-- Возвращает: Категорию льготы для человека pFK_PEPLID
  function GET_PEPL_LGOTKATEGORY(pFK_PEPLID IN BINARY_INTEGER) return varchar2 is
    Result varchar2(300) := ' ';

    cursor c is
      select nvl(trim(get_smidname(i.fk_smid)), ' ') AS lc
        from tib i
       where i.fk_smeditid in (select fk_id from tsmid where fc_synonim = 'LD_KATEGOR_LGOT')
         and i.fk_pacid = pFK_PEPLID;

  begin
    open  c;
    fetch c into Result;
    if (c%notfound) then
      Result := ' ';
    end if;
    close c;

    return(Result);
  end;
 
   /*###############################################################################################*/ 
   function GET_PEPL_SEMPOL(pFK_PEPLID IN BINARY_INTEGER) return varchar2 is
    Result varchar2(1000) := ' ';

    cursor c is
      select distinct asu.get_smidname(i.fk_smid) as nm
        from tib i
       where i.fk_pacid = pFK_PEPLID
         and i.fk_smeditid in (select fk_id from tsmid where fc_synonim = 'LD_SEMPOL')
      order by 1;

  begin

    for i in c loop
      if (trim(i.nm) is not null) then
        Result := Result || i.nm || '%';
      end if;
    end loop;

    if (trim(Result) is null) then
      Result := 'Не определено';
    else
      Result := trim(Result);

      if (substr(Result, length(Result), 1) = '%') then
        Result := substr(Result, 1, length(Result)-1);
      end if;

      Result := replace(Result, '%', ', ');

    end if;

    return(Result);
  end;  
  
END PKG_REGIST_PEPLFUNC;
/

SHOW ERRORS;


