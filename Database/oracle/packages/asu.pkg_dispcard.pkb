DROP PACKAGE BODY ASU.PKG_DISPCARD
/

--
-- PKG_DISPCARD  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_DISPCARD" IS


  FUNCTION GetDopDispFilterOwnerId return number is
   Begin
    RETURN 46171;
   End;


  FUNCTION GET_PAC_DOLG(pFK_PACID IN NUMBER) RETURN VARCHAR2 IS
    /*ДОЛЖНОСТЬ ПАЦИЕНТА*/
    sRESULT VARCHAR2(255);
    CURSOR c1 IS
      SELECT GET_PACCOMPANY_DOLGNOST(TPEOPLES.FK_DOLGNOST)
        FROM TPEOPLES
       WHERE TPEOPLES.FK_ID = PKG_REGIST_PEPLFUNC.GET_PEPL_ID(pFK_PACID);
  BEGIN
    OPEN c1;
    FETCH c1
      INTO sRESULT;
    CLOSE c1;
    RETURN sRESULT;
  END;

  FUNCTION GET_PAC_WORKPLACE(pFK_PACID IN NUMBER) RETURN VARCHAR2 IS
    /*МЕСТО РАБОТЫ ПАЦИЕНТА*/
    sRESULT VARCHAR2(255);
    CURSOR c1 IS
      SELECT TPEOPLES.FC_RABOTA
        FROM TPEOPLES
       WHERE TPEOPLES.FK_ID = PKG_REGIST_PEPLFUNC.GET_PEPL_ID(pFK_PACID);
  BEGIN
    OPEN c1;
    FETCH c1
      INTO sRESULT;
    CLOSE c1;
    RETURN sRESULT;
  END;

  FUNCTION GET_PAC_DIAG(pDISPCARDID IN NUMBER) RETURN VARCHAR2 IS
    /*ДИАГНОЗ, ПО КОТОРОМУ БЫЛ ВЗЯТ НА Д-УЧЁТ*/
    sRESULT VARCHAR2(4000);
    CURSOR c1 IS
      SELECT TDIAG.FC_WRITE
        FROM TDIAG, TDISPCARD
       WHERE TDIAG.FK_ID = TDISPCARD.FK_DIAGMAIN
         AND TDISPCARD.FK_ID = pDISPCARDID;
  BEGIN
    OPEN c1;
    FETCH c1
      INTO sRESULT;
    CLOSE c1;
    RETURN sRESULT;
  END;

  FUNCTION GET_PAC_DIAG_ID(pDISPCARDID IN NUMBER) RETURN VARCHAR2 IS
    /*ID ДИАГНОЗА, ПО КОТОРОМУ БЫЛ ВЗЯТ НА Д-УЧЁТ*/
    nRESULT NUMBER;
    CURSOR c1 IS
      SELECT TDISPCARD.FK_DIAGMAIN
        FROM TDISPCARD
       WHERE TDISPCARD.FK_ID = pDISPCARDID;
  BEGIN
    OPEN c1;
    FETCH c1
      INTO nRESULT;
    CLOSE c1;
    RETURN nRESULT;
  END;

  FUNCTION GET_PAC_UCH(pDISPCARDID IN NUMBER) RETURN VARCHAR2 IS
    /*УЧАСТОК*/
    sRESULT VARCHAR2(255);
    CURSOR c1 IS
      SELECT FC_NAME
        FROM TTHERPOINTS
       WHERE TTHERPOINTS.FK_ID =
             (SELECT MAX(TAMBTALON.FK_UCHID)
                FROM TAMBTALON, TDISPCARD
               WHERE TAMBTALON.FK_ID = TDISPCARD.FK_TALONID
                 AND TDISPCARD.FK_ID = pDISPCARDID);
  BEGIN
    OPEN c1;
    FETCH c1
      INTO sRESULT;
    CLOSE c1;
    RETURN sRESULT;
  END;

  FUNCTION GET_PAC_DISP_STATE(pDISPCARDID IN NUMBER) RETURN VARCHAR2 IS
    /*состоит, вновь взят, снят*/
    sRESULT VARCHAR2(255);
    nSTATUS NUMBER;
    CURSOR c1 IS
      SELECT DECODE(FP_CARDSTATUS, 2, 'СНЯТ', 'СОСТОИТ'),
             FP_CARDSTATUS
        FROM TDISPCARD
       WHERE FK_ID = pDISPCARDID;

    CURSOR c2 IS
      SELECT TD1.FP_CARDSTATUS
        FROM TDISPCARD TD1
       WHERE TD1.FP_CARDSTATUS = 2
         AND TD1.FK_AMBID = (SELECT TD2.FK_AMBID
                               FROM TDISPCARD TD2
                              WHERE TD2.FP_CARDSTATUS <> 2
                                AND TD1.FD_CLOSE < TD2.FD_OPEN
                                AND TD2.FK_ID = pDISPCARDID);
  BEGIN
    OPEN c1;
    FETCH c1
      INTO sRESULT, nSTATUS;
    CLOSE c1;
    IF nSTATUS <> 2 THEN
      OPEN c2;
      FETCH c2
        INTO nSTATUS;
      IF c2%FOUND THEN
        sRESULT := 'ВНОВЬ ВЗЯТ';
      END IF;
      CLOSE c2;
    END IF;
    RETURN sRESULT;
  END;

  FUNCTION IS_OSMOTREN_TODAY(pDISPCARDID IN NUMBER) RETURN NUMBER IS
    /*ОСМОТРЕН СЕГОДНЯ? 1 - ОСМОТРЕН*/
    nRESULT NUMBER;
    CURSOR c1 IS
      SELECT TDISPCARD.FK_ID
        FROM TDISPCARD, TDISPCARD_POS TPOS, VNAZ
       WHERE TPOS.FK_DISPCARDID = TDISPCARD.FK_ID
         AND TDISPCARD.FK_ID = pDISPCARDID
         AND VNAZ.FK_ID = TPOS.FK_VNAZ
         AND TRUNC(VNAZ.FD_RUN, 'DD') = TRUNC(SYSDATE, 'DD')
         AND VNAZ.FK_NAZSOSID = GET_VIPNAZ;
  BEGIN
    OPEN c1;
    FETCH c1
      INTO nRESULT;
    IF C1%FOUND THEN
      nRESULT := 1;
    ELSE
      nRESULT := 0;
    END IF;
    CLOSE c1;
    RETURN nRESULT;
  END;

  FUNCTION IS_GOSPITAL(pDISPCARDID IN NUMBER, pS IN DATE, pPO DATE)
    RETURN NUMBER IS
    /*ГОСПИТАЛИЗИРОВАНИ С pS ПО pPO? 1 - ГОСПИТОЛИЗИРОВАН*/
    nRESULT NUMBER;
    CURSOR c1 IS
      SELECT TDISPCARD.FK_ID
        FROM TSROKY, TKARTA TP, TAMBULANCE TAMB, TIB, TDISPCARD
       WHERE TSROKY.FK_PACID = TP.FK_ID
         AND TIB.FK_PACID = TP.FK_ID
         AND TIB.FK_SMEDITID =
             (SELECT MAX(FK_ID)
                FROM TSMID
               WHERE FC_SYNONIM = 'PD_REGOSPITAL')
         AND TIB.FK_SMID =
             (SELECT MAX(FK_ID)
                FROM TSMID
               WHERE FC_SYNONIM = 'REGOSPITAL_EXTR')
         AND TP.FK_PEPLID = TAMB.FK_PEPLID
         AND TSROKY.FK_PRYB = 1
         AND TRUNC(TSROKY.FD_DATA1, 'DD') >= TRUNC(pS, 'DD')
         AND TRUNC(TSROKY.FD_DATA1, 'DD') <= TRUNC(pPO, 'DD')
         AND TRUNC(TDISPCARD.FD_OPEN, 'DD') >= TRUNC(pS, 'DD')
         AND TRUNC(TDISPCARD.FD_OPEN, 'DD') <= TRUNC(pPO, 'DD')
         AND TDISPCARD.FK_AMBID = TAMB.FK_ID
         AND TDISPCARD.FK_ID = pDISPCARDID;
  BEGIN
    OPEN c1;
    FETCH c1
      INTO nRESULT;
    IF C1%FOUND THEN
      nRESULT := 1;
    ELSE
      nRESULT := 0;
    END IF;
    CLOSE c1;
    RETURN nRESULT;
  END;

  FUNCTION IS_HAS_LIST(pDISPCARDID IN NUMBER, pS IN DATE, pPO DATE)
    RETURN NUMBER IS
    /*ГОСПИТАЛИЗИРОВАНИ С pS ПО pPO? 1 - ЕСТЬ ЛИСТ*/
    nRESULT NUMBER;
    CURSOR c1 IS
      SELECT TD.FK_ID
        FROM TDISPCARD TD, TSLPERIOD
       WHERE TD.FK_AMBID = TSLPERIOD.FK_PACID
         AND TRUNC(TD.FD_OPEN, 'DD') >= TRUNC(pS, 'DD')
         AND TRUNC(TD.FD_OPEN, 'DD') <= TRUNC(pPO, 'DD')
         AND TRUNC(TSLPERIOD.FD_BEGIN, 'DD') >= TRUNC(pS, 'DD')
         AND TRUNC(TSLPERIOD.FD_BEGIN, 'DD') <= TRUNC(pPO, 'DD')
         AND TD.FK_ID = pDISPCARDID;
  BEGIN
    OPEN c1;
    FETCH c1
      INTO nRESULT;
    IF C1%FOUND THEN
      nRESULT := 1;
    ELSE
      nRESULT := 0;
    END IF;
    CLOSE c1;
    RETURN nRESULT;
  END;

  FUNCTION IS_OSMOTREN_TODAY_CHAR(pDISPCARDID IN NUMBER) RETURN VARCHAR2 IS
    /*ВОЗВРАЩАЕТ СТРОКОВОЕ ЗНАЧЕНИЕ ''/ОСМОТРЕН*/
    nRESULT NUMBER;
    SRESULT VARCHAR2(100);
  BEGIN
    nRESULT := IS_OSMOTREN_TODAY(pDISPCARDID);
    IF nRESULT = 0 THEN
      sRESULT := ' ';
    ELSE
      sRESULT := 'ОСМОТРЕН СЕГОДНЯ';
    END IF;
    RETURN sRESULT;
  END;

  FUNCTION IS_GOSPITAL_CHAR(pDISPCARDID IN NUMBER, pS IN DATE, pPO DATE)
    RETURN VARCHAR2 IS
    /*ГОСПИТАЛИЗИРОВАНИ С pS ПО pPO?*/
    nRESULT NUMBER;
    sRESULT VARCHAR2(100);
  BEGIN
    nRESULT := IS_GOSPITAL(pDISPCARDID, pS, pPO);
    IF nRESULT = 1 THEN
      sRESULT := 'ГОСПИТАЛИЗИРОВАН';
    ELSE
      sRESULT := 'НЕ ГОСПИТАЛИЗИРОВАН';
    END IF;
    RETURN sRESULT;
  END;

  FUNCTION IS_HAS_LIST_CHAR(pDISPCARDID IN NUMBER, pS IN DATE, pPO DATE)
    RETURN VARCHAR2 IS
    nRESULT NUMBER;
    sRESULT VARCHAR2(100);
  BEGIN
    nRESULT := IS_HAS_LIST(pDISPCARDID, pS, pPO);
    IF nRESULT = 1 THEN
      sRESULT := 'ЕСТЬ ЛИСТОК';
    ELSE
      sRESULT := 'БЕЗ ЛИСТКА';
    END IF;
    RETURN sRESULT;
  END;

  FUNCTION GET_PAC_LAST_VIP_CONS(pDISPCARDID IN NUMBER) RETURN VARCHAR2 IS
    /*название последней выполненой консультации */
    sRESULT VARCHAR2(255);
    CURSOR c1 IS
      SELECT GET_FULLPATH_SHA(VNAZ.FK_SMID) FC_NAME
        FROM TAMBTALON_NAZ, VNAZ, TDISPCARD
       WHERE TAMBTALON_NAZ.FK_TALONID = TDISPCARD.FK_TALONID
         AND VNAZ.FK_ID = TAMBTALON_NAZ.FK_NAZID
         AND EXISTS
       (SELECT FK_ID
                FROM TSMID
               WHERE FK_ID = (SELECT MAX(FK_ID)
                                FROM TSMID
                               WHERE FC_SYNONIM = 'KONS_SPEC')
              CONNECT BY PRIOR FK_OWNER = FK_ID
               START WITH FK_ID = VNAZ.FK_SMID)
         AND TDISPCARD.FK_ID = pDISPCARDID
         AND VNAZ.FK_NAZSOSID = GET_VIPNAZ()
       ORDER BY VNAZ.FD_RUN DESC;
  BEGIN
    OPEN c1;
    FETCH c1
      INTO sRESULT;
    CLOSE c1;
    RETURN sRESULT;
  END;

  FUNCTION GET_PAC_SOC_STATUS(pAMBID IN NUMBER) RETURN VARCHAR2 IS
    /*СОЦИАЛЬНЫЙ СТАТУС ПАЦИЕНТА */
    sRESULT VARCHAR2(255);
    CURSOR c1 IS
      SELECT MAX(GET_SMIDNAME(FK_SMID))
        FROM TIB
       WHERE FK_PACID = PKG_REGIST_PEPLFUNC.GET_PEPL_ID(pAMBID)
         AND FK_SMEDITID =
             (SELECT FK_ID FROM TSMID WHERE FC_SYNONIM = 'LD_SOC_POL');
  BEGIN
    OPEN c1;
    FETCH c1
      INTO sRESULT;
    CLOSE c1;
    RETURN sRESULT;
  END;

  FUNCTION GET_CARD_STATUS(pDISPCARDID IN NUMBER) RETURN VARCHAR2 IS
    /*СТАТУС КАРТЫ */
    sRESULT VARCHAR2(255);
    CURSOR c1 IS
      SELECT DECODE(TDISPCARD.FP_CARDSTATUS,
                    2,
                    'ЗАКРЫТА',
                    'ОТКРЫТА') STATUSCARD
        FROM TDISPCARD
       WHERE FK_ID = pDISPCARDID;
  BEGIN
    OPEN c1;
    FETCH c1
      INTO sRESULT;
    CLOSE c1;
    RETURN sRESULT;
  END;

  FUNCTION GET_PAC_CUR_SOST(pAMBID NUMBER) RETURN VARCHAR2 IS /*ТЕКУЩЕЕ СОСТОЯНИЕ ПАЦА*/
  BEGIN
    RETURN GET_SMIDNAME(STAT.PKG_STATUTIL.GET_PAC_SOST(pAMBID, SYSDATE));
  END;

  FUNCTION GET_PAC_REGION(pAMBID IN BINARY_INTEGER) RETURN VARCHAR2 IS
    /*РЕГИОНАЛЬНАЯ ПРИНАДЛЕЖНОСТЬ ПАЦА*/
    CURSOR C(PFK_ADRID IN NUMBER) IS
      SELECT /*+ RULE*/
       GET_COUNTRY(FK_COUNTRYID) || ' ' || GET_REGION(FK_REGIONID) || ' ' ||
       GET_TOWN(FK_TOWNID)
        FROM TADRESS
       WHERE FK_ID = pFK_ADRID;
    RESULT VARCHAR2(255);
  BEGIN
    OPEN C(PKG_REGIST_PACFUNC.GET_PAC_ADRID(pAMBID));
    FETCH C
      INTO RESULT;
    CLOSE C;
    RETURN(PKG_REGIST_PACFUNC.REPLACE_SPACES(RESULT));
  END;

  FUNCTION GET_OSMOTR_COUNT(pDIAG IN NUMBER, pS IN DATE, pPO DATE)
    RETURN NUMBER IS
    /*число осмотров по нозологии за указанный период*/
    CURSOR c1 IS
      SELECT COUNT(TD.FK_ID)
        FROM TDISPCARD TD, TDISPCARD_POS TPOS, VNAZ
       WHERE TPOS.FK_DISPCARDID = TD.FK_ID
         AND TPOS.FK_VNAZ = VNAZ.FK_ID
         AND VNAZ.FK_NAZSOSID = GET_VIPNAZ
         AND TRUNC(VNAZ.FD_RUN, 'DD') >= TRUNC(pS, 'DD')
         AND TRUNC(VNAZ.FD_RUN, 'DD') <= TRUNC(pPO, 'DD')
         AND TRUNC(TD.FD_OPEN, 'DD') >= TRUNC(pS, 'DD')
         AND TRUNC(TD.FD_OPEN, 'DD') <= TRUNC(pPO, 'DD')
         AND TD.FK_DIAGMAIN = pDIAG;
    RESULT NUMBER;
  BEGIN
    OPEN c1;
    FETCH c1
      INTO RESULT;
    CLOSE c1;
    RETURN RESULT;
  END;

  /*<Константы  кратностей посещения>*/
  FUNCTION GET_DAYID RETURN NUMBER is
  Begin
   RETURN   837820;
  End;



  FUNCTION GET_WEEKID RETURN NUMBER is
  Begin
   RETURN  837821;
  End;



  FUNCTION GET_MONTHID RETURN NUMBER is
  Begin
   RETURN  837822;
  End;



  FUNCTION GET_YEARID RETURN NUMBER is
  Begin
   RETURN  837823;
  End;


  function GET_NAZCOUNT(Krat       in number,
                        srok       in number,
                        PERIODKRAT in number,
                        PERIODSROK in number) return number is
    SrokDays number; --Для хранения количества дней в сроке ПРОХОЖДЕНИЯ, все расчеты ведуться по УЕ = 1 день
    KratDays number; --Для хранения количества дней в сроке КРАТНОСТИ, все расчеты ведуться по УЕ = 1 день

  Begin

    --Выясняем количество дней для кратности
    /*if PERIODKRAT = STAT.PKG_STATUTIL.GET_SMIDID('DISP_DAY') then
     KratDays := Krat;
    else
     IF PERIODKRAT = STAT.PKG_STATUTIL.GET_SMIDID('DISP_WEEK') then
      KratDays := Krat * 7;
     else
      if PERIODKRAT = STAT.PKG_STATUTIL.GET_SMIDID('DISP_MONTH') then
        KratDays := TRUNC(Add_months(SYSDATE,Krat) - SYSDATE);
      else
        KratDays := TRUNC(Add_months(SYSDATE,Krat*12) - SYSDATE);
      end if;
     end if;
    end if;
    */

    KratDays := GET_DAYCOUNTBYSROK(Krat, PERIODKRAT);
    SrokDays := GET_DAYCOUNTBYSROK(srok, PERIODSROK);

    --Выясняем количество дней для прохождения
    /*
     if PERIODSROK = STAT.PKG_STATUTIL.GET_SMIDID('DISP_DAY') then
      SrokDays := srok;
     else
      IF PERIODSROK = STAT.PKG_STATUTIL.GET_SMIDID('DISP_WEEK') then
       SrokDays := srok * 7;
      else
       if PERIODSROK = STAT.PKG_STATUTIL.GET_SMIDID('DISP_MONTH') then
         SrokDays := TRUNC(Add_months(SYSDATE,srok) - SYSDATE);
       else
         SrokDays := TRUNC(Add_months(SYSDATE,srok*12) - SYSDATE);
       end if;
      end if;
     end if;
    */
    if KratDays <> 0 then
      return Round(SrokDays / KratDays);
    else
      return 1;
    end if;

  End;

  FUNCTION GET_INPREIOD(FN_COUNT        in number,
                        FK_SROKID       in number,
                        pFK_PACID       in number,
                        pFK_SMID        in number,
                        pDate           in date,
                        pFK_DISPGROUPID in number) RETURN DATE IS
    CountDay  number; --Количество дней
    Res       DATE;
    pTempDate DATE;
    --pTempNaz  NUMBER;
    pTempNazSosID NUMBER;

    cursor Reload is
      Select VNAZ.FD_RUN
        from VNAZ,
             Tambulance,
             (Select FK_PEPLID from TAMBULANCE where FK_ID = pFK_PACID) TAmb,
              --Теперь проверяем, а не были ли назначения в пределах этой же диспансеризации
             ( select -1 as Fk_Nazid from DUAL
                UNION
               select  Tdispcard_naz.Fk_Nazid
                from Tdispcard_Naz, Tdispcard
               where Tdispcard.Fk_Ambid = pFK_PACID
                 and Tdispcard.Fk_Dispgroupid = pFK_DISPGROUPID
                 and Tdispcard.Fp_Cardstatus in (0, 1)
                 and Tdispcard.Fk_Id = Tdispcard_Naz.Fk_Dispkardid
                ) TabNaz



       where 1= 1
         and TabNaz.Fk_Nazid <> VNAZ.FK_ID
         and TAmbulance.Fk_Peplid = TAmb.Fk_Peplid
         and VNAZ.Fk_Pacid = Tambulance.Fk_Id
         and VNAZ.FK_NAZSOSID = get_vipnaz
         and VNAZ.FK_SMID = pFK_SMID
         AND VNAZ.FD_RUN > TRUNC(pDate) - CountDay

       /*     --Теперь проверяем, а не были ли назначения в пределах этой же диспансеризации
         and not exists
       (select 1
                from Tdispcard_Naz, Tdispcard
               where Tdispcard.Fk_Ambid = Tambulance.Fk_Id
                 and Tdispcard.Fk_Dispgroupid = pFK_DISPGROUPID
                 and Tdispcard.Fp_Cardstatus in (0, 1)
                 and Tdispcard.Fk_Id = Tdispcard_Naz.Fk_Dispkardid
                 and Tdispcard_naz.Fk_Nazid = VNAz.Fk_Id)*/
       order by FD_RUN DESC;

      cursor CheckNaz is
      Select VNAZ.FD_RUN, VNAZ.FK_NAZSOSID
        from --Tdispcard_Naz,
             --Tdispcard,
             VNAZ,
             Tambulance--,
             --(Select FK_PEPLID from TAMBULANCE where FK_ID = pFK_PACID) TAmb
       where 1=1
         --TAmbulance.Fk_Peplid = TAmb.Fk_Peplid
         and Tambulance.fk_id = pFK_PACID
         and VNAZ.Fk_Pacid = Tambulance.Fk_Id
         and VNAZ.FK_SMID = pFK_SMID
         --and Tdispcard.Fk_Dispgroupid = pFK_DISPGROUPID
         --and Tdispcard.Fp_Cardstatus in (0, 1)
         --and Tdispcard.Fk_Id = Tdispcard_Naz.Fk_Dispkardid
         --and Tdispcard_naz.Fk_Nazid = VNAz.Fk_Id
       order by FD_RUN DESC;

  Begin
    CountDay  := GET_DAYCOUNTBYSROK(FN_COUNT, FK_SROKID);
    pTempDate := NULL;

    If pFK_DISPGROUPID = get_dopdispid then

      OPEN Reload;
      FETCH Reload
        into pTempDate;
      CLOSE Reload;

      -- Если запрос выполнился и вернул запись не пусто, то тогда было выполнено назначение,которое можно зачесть
      if pTempDate is not null then
        Res := pTempDate;
      else
        -- теперь нужно проверить, а есть ли уже выполненые или назначенные назначения в пределах этой диспансеризации.
        Open CheckNaz;
        Fetch CheckNaz
          into pTempDate, pTempNazSosID;
        If CheckNaz%ROWCOUNT > 0 then
          Select DECODE(pTempNazSosID, 1, pTempDate, 2, NULL, NULL)
            into Res
            from DUAL;
        end if;
        Close CheckNaz;
      end if;
    end if;
    RETURN RES;
  End;

  FUNCTION GET_INPREIODSETNAZ(FN_COUNT        in number,
                              FK_SROKID       in number,
                              pFK_PACID       in number,
                              pFK_SMID        in number,
                              pDate           in date,
                              pFK_DISPGROUPID in number) RETURN NUMBER IS
    CountDay  number; --Количество дней
    Res       NUMBER;
    pTempDate DATE;
    pTempNaz  NUMBER;

    cursor Reload is
      Select FD_RUN
        from VNAZ,
             Tambulance,
             (Select FK_PEPLID from TAMBULANCE where FK_ID = pFK_PACID) TAmb,
             ( select -1 as Fk_Nazid from DUAL
                UNION
               select Tdispcard_naz.Fk_Nazid
                from Tdispcard_Naz, Tdispcard
               where Tdispcard.Fk_Ambid = pFK_PACID
                 and Tdispcard.Fk_Dispgroupid = pFK_DISPGROUPID
                 and Tdispcard.Fp_Cardstatus in (0, 1)
                 and Tdispcard.Fk_Id = Tdispcard_Naz.Fk_Dispkardid
                 ) TabNaz



       where 1=1
         and TabNaz.Fk_Nazid <> VNAZ.FK_ID
         and TAmbulance.Fk_Peplid = TAmb.Fk_Peplid
         and VNAZ.Fk_Pacid = Tambulance.Fk_Id
         and VNAZ.FK_NAZSOSID = get_vipnaz
         and VNAZ.FK_SMID = pFK_SMID
         AND VNAZ.FD_RUN > TRUNC(pDate) - CountDay
            --Теперь проверяем, а не были ли назначения в пределах этой же диспансеризации
      /*   and not exists
       (select 1
                from Tdispcard_Naz, Tdispcard
               where Tdispcard.Fk_Ambid = Tambulance.Fk_Id
                 and Tdispcard.Fk_Dispgroupid = pFK_DISPGROUPID
                 and Tdispcard.Fp_Cardstatus in (0, 1)
                 and Tdispcard.Fk_Id = Tdispcard_Naz.Fk_Dispkardid
                 and Tdispcard_naz.Fk_Nazid = VNAz.Fk_Id)*/
       order by FD_RUN DESC;
    --ПОскольку не всегда назначение ест в дисп карту у паца по доп. диспансеризации, то проверяем на назначение по пацу
    cursor CheckNaz is
      Select FK_NAZSOSID
        from --Tdispcard_Naz,
             --Tdispcard,
             VNAZ,
             Tambulance--,
             --(Select FK_PEPLID from TAMBULANCE where FK_ID = pFK_PACID) TAmb
       where 1=1
         --TAmbulance.Fk_Peplid = TAmb.Fk_Peplid
         and Tambulance.fk_id = pFK_PACID
         and VNAZ.Fk_Pacid = Tambulance.Fk_Id
         and VNAZ.FK_SMID = pFK_SMID
         --and Tdispcard.Fk_Dispgroupid = pFK_DISPGROUPID
         --and Tdispcard.Fp_Cardstatus in (0, 1)
         --and Tdispcard.Fk_Id = Tdispcard_Naz.Fk_Dispkardid
         --and Tdispcard_naz.Fk_Nazid = VNAz.Fk_Id
       order by FD_RUN DESC;

  Begin
    CountDay  := GET_DAYCOUNTBYSROK(FN_COUNT, FK_SROKID);
    pTempDate := NULL;
    Res       := 0;

    If pFK_DISPGROUPID = get_dopdispid then

      OPEN Reload;
      FETCH Reload
        into pTempDate;
      CLOSE Reload;

      -- Если запрос выполнился и вернул запись не пусто, то тогда было выполнено назначение,которое можно зачесть
      if pTempDate is not null then
        Res := 1;
      end if;
      --   else
      -- теперь нужно проверить, а есть ли уже выполненые или назначенные назначения в пределах этой диспансеризации.
      Open CheckNaz;
      Fetch CheckNaz into pTempNaz;
      If CheckNaz%ROWCOUNT > 0 then
        Select DECODE(pTempNaz,
                      get_vipnaz,
                      3,
                      get_nevip,
                      4,
                      get_pass_registrator_DD,
                      1 ,
                      get_pass_registrator,
                      4,
                      0)
          into Res
          from DUAL;
      end if;



      Close CheckNaz;
    end if;

    RETURN RES;
  End;

  FUNCTION GET_DAYCOUNTBYSROK(FN_COUNT in number, FK_SROKID in number)
    RETURN NUMBER IS
    SrokDays number;
  Begin

    --Выясняем количество дней для прохождения
    if FK_SROKID = STAT.PKG_STATUTIL.GET_SMIDID('DISP_DAY') then
      SrokDays := FN_COUNT;
    else
      IF FK_SROKID = STAT.PKG_STATUTIL.GET_SMIDID('DISP_WEEK') then
        SrokDays := FN_COUNT * 7;
      else
        if FK_SROKID = STAT.PKG_STATUTIL.GET_SMIDID('DISP_MONTH') then
          SrokDays := TRUNC(Add_months(SYSDATE, FN_COUNT) - SYSDATE);
        else
          SrokDays := TRUNC(Add_months(SYSDATE, FN_COUNT * 12) - SYSDATE);
        end if;
      end if;
    end if;
    return SrokDays;
  End;
  ----------------------------------------------------------------------------------------------------------------------------------------
  FUNCTION GET_MINDATEFROMDISPCARD(pFK_SMID in number, pFK_PACID in number, pFK_DISPKARDID in number)
    RETURN DATE IS
    RES DATE;
  Begin
   Select min(VNAZ.FD_NAZ) INTO RES from ASU.Tdispcard_Naz TDispCard_naz,asu.VNAZ  VNAZ,asu.TDispcard TDispcard where
                     TDispcard_naz.Fk_Nazid = VNAZ.FK_ID
                      and
                     VNAZ.FK_SMID = pFK_SMID
                      and
                     VNAZ.FK_PACID = pFK_PACID
                      and
                     TDispcard.FK_DISPGROUPID = asu.get_dopdispid
                      and
                     TDispcard_naz.Fk_Dispkardid = TDispcard.FK_ID
                      and
                     TDispcard_naz.Fk_Dispkardid = pFK_DISPKARDID;
   RETURN NVL(RES,SYSDATE);
  end;
  ----------------------------------------------------------------------------------------------------------------------------------------
  FUNCTION DispcardList(pFK_AMBID in number) RETURN VARCHAR2 IS
    pRes VARCHAR2(4000);
    cursor C is
      select Tdispgroup.Fc_Name
        from Tdispcard, Tambulance, Tdispgroup
       where 1 = 1
         and Tambulance.Fk_Id = Tdispcard.Fk_Ambid
         and Tdispcard.Fk_Dispgroupid = Tdispgroup.Fk_Id
         and Tdispcard.Fp_Cardstatus in (0, 1)
         and Tdispcard.Fk_Ambid = pFK_AMBID;
  Begin
    pRes := '';
    for i in c loop
      pRes := pRes || i.FC_NAME || ', ';
    end loop;

    pRes := substr(pRes, 1, length(pRes) - 2);

    return pRes;
  end;
  ----------------------------------------------------------------------------------------------------------------------------------------
  FUNCTION GetFrmSprCaption(pSynonim in varchar2) RETURN VARCHAR2 IS
    pRes VARCHAR2(4000);
  Begin
    /*KONS = 'KONS_SPEC';
    ISSLED = 'ISSLED';
    AN = 'RAZ_ANAL';
    LECH = 'PROC_PROCMAN';

    if pSynonim = 'LD_SOC_POL' then
       pRes := 'Справочник социальных положений';
    end if;
    */
    if pSynonim = 'LD_SOC_POL' then
      pRes := 'Справочник социальных групп';
    else
      if pSynonim = 'DIAGS_MKB10' then
        pRes := 'Справочник диагнозов';
      else
        if pSynonim = 'DG_ETAP' then
          pRes := 'Справочник этапов';
        else
          if pSynonim = 'DG_STADIA' then
            pRes := 'Справочник стадий';
          else
            if pSynonim = 'KONS_SPEC' then
              pRes := 'Справочник консультаций';
            else
              if pSynonim = 'ISSLED' then
                pRes := 'Справочник исследований';
              else
                if pSynonim = 'RAZ_ANAL' then
                  pRes := 'Справочник анализов';
                else
                  pRes := 'Справочник процедур';
                end if;
              end if;
            end if;
          end if;
        end if;
      end if;
    end if;
    return pRes;
  end;
  ----------------------------------------------------------------------------------------------------------------------------------------
  FUNCTION IS_pac_has_dispcard(pFK_AMBID       in number,
                               pFK_DISPGROUPID in number) RETURN NUMBER IS
    pRes number;
    cursor C is
      select count(1) as N
        from TSMID, Tdispcard, TDiag, Tdispgroup, Tdispgroupdiag
       where 1 = 1
         and Tdispcard.Fk_Ambid = pFK_AMBID
         and Tdispcard.FP_CARDSTATUS in (0, 1)
         and Tdispcard.Fk_Diagmain = TDiag.Fk_Id
         and TDiag.Fk_Smdiagid = TSmid.Fk_Id
         and Tdispgroupdiag.Fk_Smdiagid = TDiag.Fk_SMDIAGId
         and TDispgroup.FK_ID = Tdispgroupdiag.Fk_Dispgroupid
         and TDiag.Fk_Pacid = Tdispcard.Fk_Ambid
         and Tdispgroup.FK_ID = pFK_DISPGROUPID;
  Begin
    Open c;
    Fetch c
      into pRes;
    Close c;

    return pRes;
  end;
  ----------------------------------------------------------------------------------------------------------------------------------------
  FUNCTION DECODEPERIODSTR(FN_COUNT in NUMBER, FC_KRAT in VARCHAR2)
    RETURN VARCHAR2 IS
    FC_COUNT varchar2(4000);
    RES      varchar2(4000);
  Begin
    FC_COUNT := TO_CHAR(FN_COUNT);
    -------------------------------------------------------------------------------------------------------
    if UPPER(FC_KRAT) = 'ДЕНЬ' then

      if SUBSTR(FC_COUNT, length(FC_COUNT), 1) = '1' then
        if FN_COUNT < 2 then
         RES := 'день';
        else
         RES :=  FC_COUNT||' '||'день';
        end if;
      end if;

      if (length(FC_COUNT) > 1 and
         (SUBSTR(FC_COUNT, length(FC_COUNT) - 1, 1) = '1')) or
         (SUBSTR(FC_COUNT, length(FC_COUNT), 1) in
         ('0', '5', '6', '7', '8', '9')) then
        RES := FC_COUNT || ' ' || 'дней';
      end if;

      if (SUBSTR(FC_COUNT, length(FC_COUNT), 1) in ('2', '3', '4')) then
        RES := FC_COUNT || ' ' || 'дня';
      end if;

      if (SUBSTR(FC_COUNT, length(FC_COUNT), 1) in ('2', '3', '4')) and (length(FC_COUNT) = 2) and (SUBSTR(FC_COUNT, 1, 1) = '1') then
        RES := FC_COUNT || ' ' || 'дней';
      end if;

    end if;
    -------------------------------------------------------------------------------------------------------
    if UPPER(FC_KRAT) = 'НЕДЕЛЯ' then
      if SUBSTR(FC_COUNT, length(FC_COUNT), 1) = '1' then
        if FN_COUNT < 2 then
         RES := 'НЕДЕЛЯ';
        else
         RES :=  FC_COUNT||' '||'НЕДЕЛЯ';
        end if;
      end if;
      if (length(FC_COUNT) > 1 and
         (SUBSTR(FC_COUNT, length(FC_COUNT) - 1, 1) = '1')) or
         (SUBSTR(FC_COUNT, length(FC_COUNT), 1) in
         ('0', '5', '6', '7', '8', '9')) then
        RES := FC_COUNT || ' ' || 'НЕДЕЛЬ';
      end if;

      if (SUBSTR(FC_COUNT, length(FC_COUNT), 1) in ('2', '3', '4')) then
        RES := FC_COUNT || ' ' || 'НЕДЕЛИ';
      end if;

      if (SUBSTR(FC_COUNT, length(FC_COUNT), 1) in ('2', '3', '4')) and (length(FC_COUNT) = 2) and (SUBSTR(FC_COUNT, 1, 1) = '1') then
        RES := FC_COUNT || ' ' || 'НЕДЕЛЬ';
      end if;
    end if;
    -------------------------------------------------------------------------------------------------------
    if UPPER(FC_KRAT) = 'МЕСЯЦ' then
      if SUBSTR(FC_COUNT, length(FC_COUNT), 1) = '1' then
        if FN_COUNT < 2 then
         RES := 'МЕСЯЦ';
        else
         RES :=  FC_COUNT||' '||'МЕСЯЦ';
        end if;
      end if;
      if (length(FC_COUNT) > 1 and
         (SUBSTR(FC_COUNT, length(FC_COUNT) - 1, 1) = '1')) or
         (SUBSTR(FC_COUNT, length(FC_COUNT), 1) in
         ('0', '5', '6', '7', '8', '9')) then
        RES := FC_COUNT || ' ' || 'МЕСЯЦЕВ';
      end if;

      if (SUBSTR(FC_COUNT, length(FC_COUNT), 1) in ('2', '3', '4')) then
        RES := FC_COUNT || ' ' || 'МЕСЯЦА';
      end if;

      if (SUBSTR(FC_COUNT, length(FC_COUNT), 1) in ('2', '3', '4')) and (length(FC_COUNT) = 2) and (SUBSTR(FC_COUNT, 1, 1) = '1') then
        RES := FC_COUNT || ' ' || 'МЕСЯЦЕВ';
      end if;

    end if;
    -------------------------------------------------------------------------------------------------------
    if UPPER(FC_KRAT) = 'ГОД' then
      if SUBSTR(FC_COUNT, length(FC_COUNT), 1) = '1' then
        if FN_COUNT < 2 then
         RES := 'ГОД';
        else
         RES :=  FC_COUNT||' '||'ГОД';
        end if;
      end if;


      if (length(FC_COUNT) > 1 and
         (SUBSTR(FC_COUNT, length(FC_COUNT) - 1, 1) = '1')) or
         (SUBSTR(FC_COUNT, length(FC_COUNT), 1) in
         ('0', '5', '6', '7', '8', '9')) then
        RES := FC_COUNT || ' ' || 'ЛЕТ';
      end if;

      if (SUBSTR(FC_COUNT, length(FC_COUNT), 1) in ('2', '3', '4')) then
        RES := FC_COUNT || ' ' || 'ГОДА';
      end if;

      if (SUBSTR(FC_COUNT, length(FC_COUNT), 1) in ('2', '3', '4')) and (length(FC_COUNT) = 2) and (SUBSTR(FC_COUNT, 1, 1) = '1') then
        RES := FC_COUNT || ' ' || 'ЛЕТ';
      end if;

    end if;

    if (FN_COUNT = 0) or (FN_COUNT is NULL) then
      RES := '';
    end if;
    RETURN lower(RES);
  End;

End;
/

SHOW ERRORS;


