DROP PACKAGE BODY ASU.PKG_USLKART
/

--
-- PKG_USLKART  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_USLKART"
IS
/* --старое body на всякий случай
CREATE OR REPLACE PACKAGE BODY "PKG_USLKART"
IS

FUNCTION GETSUM_USL_ZATR (pHealID BINARY_INTEGER) RETURN NUMBER IS
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  ------------------------------------------
-- Nefedov S    17.07.2007  Возвращает сумму затрат услуги без учета надбавок рентабельности
CURSOR c1 IS -- Сумма процентных надбавок на затраты услуги
    select SUM(nSum*fn_proc/100) nSUM from (
    select fk_groupID, SUM(sum_cena) nSum from (
    select SUM(ts_os.fn_cena) sum_cena, tusl_kart.fk_groupID
     from tusl_kart, buh.ts_os, buh.vanalit, buh.ts_group
    where tusl_kart.fk_analit = ts_os.fk_id
    and fk_healID = pHealID
    and vanalit.fk_id = tusl_kart.fk_analit
    and ts_group.fk_id = tusl_kart.fk_groupID
    group by tusl_kart.fk_groupID

    union all

    select SUM(decode(nvl(fn_fasov,0),0,0, ts_mbp.fn_cena/fn_fasov)*fn_kol), tusl_kart.fk_groupID
     from tusl_kart, buh.ts_mbp, buh.vanalit, buh.ts_group
    where tusl_kart.fk_analit = ts_mbp.fk_id
    and fk_healID = pHealID
    and vanalit.fk_id = tusl_kart.fk_analit
    and ts_group.fk_id = tusl_kart.fk_groupID
    group by tusl_kart.fk_groupID

    union all

    select SUM(decode(nvl(fn_norm_rab_vrem,0),0,0,decode(nvl(fn_kol_min_mes,0),0,0,(fn_stavka/(fn_norm_rab_vrem/fn_kol_min_mes)*fn_kol))) ), tusl_kart.fk_groupID
     from tusl_kart, buh.ts_doljnost, buh.vanalit, buh.ts_group
    where tusl_kart.fk_analit = ts_doljnost.fk_id
    and fk_healID = pHealID
    and vanalit.fk_id = tusl_kart.fk_analit
    and ts_group.fk_id = tusl_kart.fk_groupID
    group by tusl_kart.fk_groupID
    )

    group by fk_groupID
    ) T1, tusl_zatrat
    where T1.fk_groupID= tusl_zatrat.FK_GROUPID
    and tusl_zatrat.fk_healID = pHealID;

CURSOR c2 IS -- Сумма затрат на услугу
    select SUM(sum_cena) nSum from (
    select SUM(ts_os.fn_cena) sum_cena
     from tusl_kart, buh.ts_os, buh.vanalit, buh.ts_group
    where tusl_kart.fk_analit = ts_os.fk_id
    and fk_healID = pHealID
    and vanalit.fk_id = tusl_kart.fk_analit
    and ts_group.fk_id = tusl_kart.fk_groupID

    union all

    select SUM(decode(nvl(fn_fasov,0),0,0, ts_mbp.fn_cena/fn_fasov)*fn_kol)
     from tusl_kart, buh.ts_mbp, buh.vanalit, buh.ts_group
    where tusl_kart.fk_analit = ts_mbp.fk_id
    and fk_healID = pHealID
    and vanalit.fk_id = tusl_kart.fk_analit
    and ts_group.fk_id = tusl_kart.fk_groupID

    union all

    select SUM(decode(nvl(fn_norm_rab_vrem,0),0,0,decode(nvl(fn_kol_min_mes,0),0,0,(fn_stavka/(fn_norm_rab_vrem/fn_kol_min_mes)*fn_kol))) )
     from tusl_kart, buh.ts_doljnost, buh.vanalit, buh.ts_group
    where tusl_kart.fk_analit = ts_doljnost.fk_id
    and fk_healID = pHealID
    and vanalit.fk_id = tusl_kart.fk_analit
    and ts_group.fk_id = tusl_kart.fk_groupID
    ) ;

nRes1 NUMBER;
nRes2 NUMBER;
BEGIN
    nRes1:=0;
    nRes2:=0;
    FOR cSUM1 IN c1 LOOP
        nRes1:= cSUM1.nSUM;
    END LOOP;
    FOR cSUM2 IN c2 LOOP
        nRes2:= cSUM2.nSUM;
    END LOOP;
    RETURN nvl(nRes1,0)+nvl(nRes2,0);
END;

FUNCTION GETSUM_USL_RENTAB (pHealID BINARY_INTEGER) RETURN NUMBER IS
CURSOR c1 IS
    select fn_proc
    from tusl_rentab
    where fk_healID = pHealID;
nRes NUMBER;
nSumUslZatr NUMBER;
BEGIN
    nRes:=0;
    nSumUslZatr:=GETSUM_USL_ZATR(pHealID);
    nRes:=nSumUslZatr;
    FOR cSUM1 IN c1 LOOP
        nRes:=nRes + ( -- nSumUslZatr
        + (nSumUslZatr*cSUM1.fn_proc/100));
    END LOOP;
    RETURN nvl(nRes,0);
END;
-- End Pakage
END;

*/

FUNCTION GETSUM_USL_ZATR (pHealID BINARY_INTEGER) RETURN NUMBER IS
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  ------------------------------------------
-- Nefedov S    17.07.2007  Возвращает сумму затрат услуги без учета надбавок рентабельности
-- Nikul E.    20.11.2013   Изменен расчет цены исполнителя
CURSOR c1 IS -- Сумма процентных надбавок на затраты услуги
    select
        SUM(nSum*fn_proc/100) nSUM
    from (
            select
                fk_groupID,
                SUM(sum_cena) nSum
            from (
                    --оборудование
                    select
                        --SUM(ts_os.fn_cena) sum_cena, --Nikul E 29.11.2013
                        SUM(ts_os.fn_amortsum) sum_cena,
                        tusl_kart.fk_groupID
                    from tusl_kart, buh.ts_os, buh.vanalit, buh.ts_group
                    where tusl_kart.fk_analit = ts_os.fk_id
                          and fk_healID = pHealID
                          and vanalit.fk_id = tusl_kart.fk_analit
                          and ts_group.fk_id = tusl_kart.fk_groupID
                    group by tusl_kart.fk_groupID

                    union all

                    --мелочовка
                    select
                        SUM(decode(nvl(fn_fasov,0),0,0, ts_mbp.fn_cena/fn_fasov)*fn_kol),
                        tusl_kart.fk_groupID
                    from tusl_kart, buh.ts_mbp, buh.vanalit, buh.ts_group
                    where tusl_kart.fk_analit = ts_mbp.fk_id
                          and fk_healID = pHealID
                          and vanalit.fk_id = tusl_kart.fk_analit
                          and ts_group.fk_id = tusl_kart.fk_groupID
                    group by tusl_kart.fk_groupID

                    union all

                    --исполнители
                    select
                        --SUM(decode(nvl(fn_norm_rab_vrem,0),0,0,decode(nvl(fn_kol_min_mes,0),0,0,(fn_stavka/(fn_norm_rab_vrem/fn_kol_min_mes)*fn_kol))) ), --20.11.2013
                        SUM(decode(nvl(fn_norm_rab_vrem,0),0,0,(BUH.GET_TSDOLJNOST_FULL_SALARY(TS_DOLJNOST.FK_ID)/fn_norm_rab_vrem)*fn_dlit_min)), --by gvr
                        tusl_kart.fk_groupID
                    from tusl_kart, buh.ts_doljnost, buh.vanalit, buh.ts_group
                    where tusl_kart.fk_analit = ts_doljnost.fk_id
                          and fk_healID = pHealID
                          and vanalit.fk_id = tusl_kart.fk_analit
                          and ts_group.fk_id = tusl_kart.fk_groupID
                    group by tusl_kart.fk_groupID
                )

            group by fk_groupID
        ) T1, tusl_zatrat
    where T1.fk_groupID= tusl_zatrat.FK_GROUPID
          and tusl_zatrat.fk_healID = pHealID;

CURSOR c2 IS -- Сумма затрат на услугу
    select
        SUM(sum_cena) nSum
    from (
            --оборудование
            select
              --SUM(ts_os.fn_cena) sum_cena --Nikul E 29.11.2013
                SUM(ts_os.fn_amortsum) sum_cena
            from tusl_kart, buh.ts_os, buh.vanalit, buh.ts_group
            where tusl_kart.fk_analit = ts_os.fk_id
                  and fk_healID = pHealID
                  and vanalit.fk_id = tusl_kart.fk_analit
                  and ts_group.fk_id = tusl_kart.fk_groupID

            union all

            --мелочовка
            select
                SUM(decode(nvl(fn_fasov,0),0,0, ts_mbp.fn_cena/fn_fasov)*fn_kol)
            from tusl_kart, buh.ts_mbp, buh.vanalit, buh.ts_group
            where tusl_kart.fk_analit = ts_mbp.fk_id
                  and fk_healID = pHealID
                  and vanalit.fk_id = tusl_kart.fk_analit
                  and ts_group.fk_id = tusl_kart.fk_groupID

            union all

            --исполнители
            select
                --SUM(decode(nvl(fn_norm_rab_vrem,0),0,0,decode(nvl(fn_kol_min_mes,0),0,0,(fn_stavka/(fn_norm_rab_vrem/fn_kol_min_mes)*fn_kol))) ) --20.11.2013
                SUM(decode(nvl(fn_norm_rab_vrem,0),0,0,(BUH.GET_TSDOLJNOST_FULL_SALARY(TS_DOLJNOST.FK_ID)/fn_norm_rab_vrem)*fn_dlit_min))
            from tusl_kart, buh.ts_doljnost, buh.vanalit, buh.ts_group
            where tusl_kart.fk_analit = ts_doljnost.fk_id
                  and fk_healID = pHealID
                  and vanalit.fk_id = tusl_kart.fk_analit
                  and ts_group.fk_id = tusl_kart.fk_groupID
    ) ;

nRes1 NUMBER;
nRes2 NUMBER;
BEGIN
    nRes1:=0;
    nRes2:=0;
    FOR cSUM1 IN c1 LOOP
        nRes1:= cSUM1.nSUM;
    END LOOP;
    FOR cSUM2 IN c2 LOOP
        nRes2:= cSUM2.nSUM;
    END LOOP;
    RETURN nvl(nRes1,0)+nvl(nRes2,0);
END;

FUNCTION GETSUM_USL_RENTAB (pHealID BINARY_INTEGER) RETURN NUMBER IS
CURSOR c1 IS
    select fn_proc
    from tusl_rentab
    where fk_healID = pHealID;
nRes NUMBER;
nSumUslZatr NUMBER;
BEGIN
    nRes:=0;
    nSumUslZatr:=GETSUM_USL_ZATR(pHealID);
    nRes:=nSumUslZatr;
    FOR cSUM1 IN c1 LOOP
        nRes:=nRes + ( -- nSumUslZatr
        + (nSumUslZatr*cSUM1.fn_proc/100));
    END LOOP;
    RETURN nvl(nRes,0);
END;
-- End Pakage
END;
/

SHOW ERRORS;


