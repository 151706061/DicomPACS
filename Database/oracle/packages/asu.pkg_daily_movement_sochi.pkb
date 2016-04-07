DROP PACKAGE BODY ASU.PKG_DAILY_MOVEMENT_SOCHI
/

--
-- PKG_DAILY_MOVEMENT_SOCHI  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_DAILY_MOVEMENT_SOCHI" 
IS
  FUNCTION GET_PRIB_PERIOD (pFD_DATA1 IN DATE,pFK_VRACHID IN NUMBER) RETURN NUMBER IS
    CURSOR cPryb (ppFD_DATA1 DATE,ppFK_STOLID IN NUMBER)IS SELECT ROWNUM FN_ROW,V2.* FROM(
                                        SELECT V.*,FC_NAME FC_KORP,FC_PALATA FROM
                                           (SELECT FK_IBID,GET_PACFIO(TKARTA.FK_ID)FC_FIO,FC_PUT,GET_PACVID(TKARTA.fk_KOD2)FC_VID,
                                           TKARTA.FN_SUM,TO_CHAR(GET_PAC_PLAN_SROK(TKARTA.FK_ID,1),'dd.mm.yyyy')||'-'||TO_CHAR(GET_PAC_PLAN_SROK(TKARTA.FK_ID,2),'dd.mm.yyyy') FC_FROMTO,
                                           GET_PACPLANOUTCOME(TKARTA.FK_ID)FD_OUT,GET_OPOZD(TKARTA.FK_ID) FN_OPOZD,GET_PACPALATAID(TKARTA.FK_ID) FK_PALATAID
                                           FROM TKARTA,TSROKY WHERE FK_PRYB=2 AND TRUNC(FD_DATA1)=ppFD_DATA1 AND TKARTA.FK_ID=TSROKY.FK_PACID AND FK_STOLID=ppFK_STOLID)V,TROOM,TKORP
                                           WHERE TROOM.FK_ID=FK_PALATAID AND TROOM.FK_KORPID=TKORP.FK_ID/* AND FK_KORPID=200*/
                                           ORDER BY FK_IBID)V2;
/*    CURSOR cPrybLuks (ppFD_DATA1 DATE)IS SELECT ROWNUM FN_ROW,V2.* FROM(
                                        SELECT V.*,FC_NAME FC_KORP,FC_PALATA FROM
                                           (SELECT FK_IBID,GET_PACFIO(TKARTA.FK_ID)FC_FIO,FC_PUT,GET_PACVID(TKARTA.fk_KOD2)FC_VID,
                                           TKARTA.FN_SUM,TO_CHAR(GET_PAC_PLAN_SROK(TKARTA.FK_ID,1),'dd.mm.yyyy')||'-'||TO_CHAR(GET_PAC_PLAN_SROK(TKARTA.FK_ID,2),'dd.mm.yyyy') FC_FROMTO,
                                           GET_PACPLANOUTCOME(TKARTA.FK_ID)FD_OUT,GET_OPOZD(TKARTA.FK_ID) FN_OPOZD,GET_PACPALATAID(TKARTA.FK_ID) FK_PALATAID
                                           FROM TKARTA,TSROKY WHERE FK_PRYB=2 AND TRUNC(FD_DATA1)=ppFD_DATA1 AND TKARTA.FK_ID=TSROKY.FK_PACID)V,TROOM,TKORP
                                           WHERE TROOM.FK_ID=FK_PALATAID AND TROOM.FK_KORPID=TKORP.FK_ID AND FK_KORPID<>200
                                           ORDER BY FK_IBID)V2;*/
    CURSOR cVyb (ppFD_DATA1 DATE,ppFK_STOLID IN NUMBER)IS SELECT ROWNUM FN_ROW,V2.* FROM(
         SELECT V.*,FC_NAME FC_KORP,FC_PALATA FROM
           (SELECT FK_IBID,GET_PACFIO(TKARTA.FK_ID)FC_FIO,FC_PUT,TO_CHAR(GET_PACPLANOUTCOME(TKARTA.FK_ID),'dd.mm.yyyy') FD_TO,
                                           TO_CHAR(GET_PACOUTCOME(TKARTA.FK_ID),'dd.mm.yyyy')FD_OUT,
                                           TVYBTYPE.FC_NAME FC_VYB,
                                           GET_PAC_OSTATOK(TKARTA.FK_ID,ppFD_DATA1)FN_OST,
                                           GET_PACPALATAID(TKARTA.FK_ID) FK_PALATAID
                                           FROM TKARTA,TSROKY,TVYBTYPE WHERE TSROKY.FK_VYBID=TVYBTYPE.FK_ID(+) AND FK_PRYB=3 AND TRUNC(FD_DATA1)=ppFD_DATA1
                                           AND TKARTA.FK_ID=TSROKY.FK_PACID AND FK_STOLID=ppFK_STOLID)V,TROOM,TKORP
                                           WHERE TROOM.FK_ID=FK_PALATAID AND TROOM.FK_KORPID=TKORP.FK_ID/* AND FK_KORPID=200*/
                                           ORDER BY FK_IBID)V2;
/*    CURSOR cVybLuks (ppFD_DATA1 DATE)IS SELECT ROWNUM FN_ROW,V2.* FROM(
         SELECT V.*,FC_NAME FC_KORP,FC_PALATA FROM
           (SELECT FK_IBID,GET_PACFIO(TKARTA.FK_ID)FC_FIO,FC_PUT,TO_CHAR(GET_PACPLANOUTCOME(TKARTA.FK_ID),'dd.mm.yyyy') FD_TO,
                                           TO_CHAR(GET_PACOUTCOME(TKARTA.FK_ID),'dd.mm.yyyy')FD_OUT,
                                           TVYBTYPE.FC_NAME FC_VYB,
                                           GET_PAC_OSTATOK(TKARTA.FK_ID,ppFD_DATA1)FN_OST,
                                           GET_PACPALATAID(TKARTA.FK_ID) FK_PALATAID
                                           FROM TKARTA,TSROKY,TVYBTYPE WHERE TSROKY.FK_VYBID=TVYBTYPE.FK_ID(+) AND FK_PRYB=3 AND TRUNC(FD_DATA1)=ppFD_DATA1
                                           AND TKARTA.FK_ID=TSROKY.FK_PACID)V,TROOM,TKORP
                                           WHERE TROOM.FK_ID=FK_PALATAID AND TROOM.FK_KORPID=TKORP.FK_ID AND FK_KORPID<>200
                                           ORDER BY FK_IBID)V2;*/
   Cursor cMorning(pFD_DATAC DATE) IS select count(V.FK_ID) as fn_count from
                     (select TKARTA.FK_ID  from tsroky , TKARTA
                        where
                        TRUNC(fd_data1)<pFD_DATAC
                        and TRUNC(fd_data3)>=pFD_DATAC
                        and fk_pryb<>1
                        and fk_pryb<>3
                        and fk_pryb<>7
                        AND TKARTA.FK_ID=FK_PACID
                        union
                        select /*+ rule*/ TKARTA.FK_ID  from tsroky , TKARTA
                        where
                        TRUNC(fd_data1)=pFD_DATAC
                        and TRUNC(fd_data3)>=pFD_DATAC
                        and (fk_pryb=5 or fk_pryb=6)
                        AND TKARTA.FK_ID=FK_PACID)V,TROOM WHERE TROOM.FK_ID=GET_PACPALATAID(V.FK_ID) AND FK_KORPID=200;
   Cursor cMorningStol(pFD_DATAC DATE,ppFK_STOLID IN NUMBER) IS select count(V.FK_ID) as fn_count from
                     (select TKARTA.FK_ID  from tsroky , TKARTA
                        where
                        TRUNC(fd_data1)<pFD_DATAC
                        and TRUNC(fd_data3)>=pFD_DATAC
                        and fk_pryb<>1
                        and fk_pryb<>3
                        and fk_pryb<>7
                        AND TKARTA.FK_ID=FK_PACID
                        AND FK_STOLID=ppFK_STOLID
                        union
                        select /*+ rule*/ TKARTA.FK_ID  from tsroky , TKARTA
                        where
                        TRUNC(fd_data1)=pFD_DATAC
                        and TRUNC(fd_data3)>=pFD_DATAC
                        and (fk_pryb=5 or fk_pryb=6)
                        AND TKARTA.FK_ID=FK_PACID AND FK_STOLID=ppFK_STOLID)V,TROOM WHERE TROOM.FK_ID=GET_PACPALATAID(V.FK_ID)/* AND FK_KORPID=200*/;
   Cursor cMorningChild(pFD_DATAC DATE,pFN_AGE1 NUMBER,pFN_AGE2 NUMBER) IS select count(V.FK_ID) as fn_count from
                     (select TKARTA.FK_ID,TRUNC(MONTHS_BETWEEN (pFD_DATAC, fd_rojd) / 12)FN_AGE  from tsroky , TKARTA
                        where
                        TRuNC(fd_data1)<pFD_DATAC
                        and TRUNC(fd_data3)>=pFD_DATAC
                        and fk_pryb<>1
                        and fk_pryb<>3
                        and fk_pryb<>7
                        AND TKARTA.FK_ID=FK_PACID
                        union
                        select /*+ rule*/ TKARTA.FK_ID,TRUNC(MONTHS_BETWEEN (pFD_DATAC, fd_rojd) / 12)FN_AGE  from tsroky , TKARTA
                        where
                        TRUNC(fd_data1)=pFD_DATAC
                        and TRunC(fd_data3)>=pFD_DATAC
                        and (fk_pryb=5 or fk_pryb=6)
                        AND TKARTA.FK_ID=FK_PACID
                        UNION
                        select /*+ rule*/FK_PACID,TRUNC(MONTHS_BETWEEN (pFD_DATAC, fd_rojd) / 12)FN_AGE from tsroky,TKARTA where
                            TRUNC(fd_data1)=pFD_DATAC and fk_pryb=2 AND TKARTA.FK_ID=TSROKY.FK_PACID)V WHERE FN_AGE BETWEEN pFN_AGE1 AND pFN_AGE2;
   Cursor cMorningChildStol(pFD_DATAC DATE,pFN_AGE1 NUMBER,pFN_AGE2 NUMBER,ppFK_STOLID IN NUMBER) IS select count(V.FK_ID) as fn_count from
                     (select TKARTA.FK_ID,TRUNC(MONTHS_BETWEEN (pFD_DATAC, fd_rojd) / 12)FN_AGE  from tsroky , TKARTA
                        where
                        TRUNC(fd_data1)<pFD_DATAC
                        and TRUNC(fd_data3)>=pFD_DATAC
                        and fk_pryb<>1
                        and fk_pryb<>3
                        and fk_pryb<>7
                        AND TKARTA.FK_ID=FK_PACID
                        AND FK_STOLID=ppFK_STOLID
                        union
                        select /*+ rule*/ TKARTA.FK_ID,TRUNC(MONTHS_BETWEEN (pFD_DATAC, fd_rojd) / 12)FN_AGE  from tsroky , TKARTA
                        where
                        TRUNC(fd_data1)=pFD_DATAC
                        and TRUNC(fd_data3)>=pFD_DATAC
                        and (fk_pryb=5 or fk_pryb=6)
                        AND TKARTA.FK_ID=FK_PACID
                        AND FK_STOLID=ppFK_STOLID
                        UNION
                        select /*+ rule*/FK_PACID,TRUNC(MONTHS_BETWEEN (pFD_DATAC, fd_rojd) / 12)FN_AGE from tsroky,TKARTA where
                            TRUNC(fd_data1)=pFD_DATAC and fk_pryb=2 AND TKARTA.FK_ID=TSROKY.FK_PACID AND FK_STOLID=ppFK_STOLID)V,TROOM  WHERE FN_AGE BETWEEN pFN_AGE1 AND pFN_AGE2 AND TROOM.FK_ID=GET_PACPALATAID(V.FK_ID)/* AND FK_KORPID=200*/;
/*   Cursor cMorningChildPrim(pFD_DATAC DATE,pFN_AGE1 NUMBER,pFN_AGE2 NUMBER) IS select count(V.FK_ID) as fn_count from
                     (select TKARTA.FK_ID,TRUNC(MONTHS_BETWEEN (pFD_DATAC, fd_rojd) / 12)FN_AGE  from tsroky , TKARTA
                        where
                        TRUNC(fd_data1)<pFD_DATAC
                        and TRUNC(fd_data3)>=pFD_DATAC
                        and fk_pryb<>1
                        and fk_pryb<>3
                        and fk_pryb<>7
                        AND TKARTA.FK_ID=FK_PACID
                        union
                        select \*+ rule *\ TKARTA.FK_ID,TRUNC(MONTHS_BETWEEN (pFD_DATAC, fd_rojd) / 12)FN_AGE  from tsroky , TKARTA
                        where
                        TRUNC(fd_data1)=pFD_DATAC
                        and TRUNC(fd_data3)>=pFD_DATAC
                        and (fk_pryb=5 or fk_pryb=6)
                        AND TKARTA.FK_ID=FK_PACID
                        UNION
                        select \* + rule *\FK_PACID,TRUNC(MONTHS_BETWEEN (pFD_DATAC, fd_rojd) / 12)FN_AGE from tsroky,TKARTA where
                            TRUNC(fd_data1)=pFD_DATAC and fk_pryb=2 AND TKARTA.FK_ID=TSROKY.FK_PACID)V,TROOM  WHERE FN_AGE BETWEEN pFN_AGE1 AND pFN_AGE2 AND TROOM.FK_ID=GET_PACPALATAID(V.FK_ID) AND FK_KORPID=200;*/
/*   Cursor cMorningChildLuks(pFD_DATAC DATE,pFN_AGE1 NUMBER,pFN_AGE2 NUMBER) IS select count(V.FK_ID) as fn_count from
                     (select TKARTA.FK_ID,TRUNC(MONTHS_BETWEEN (pFD_DATAC, fd_rojd) / 12)FN_AGE  from tsroky , TKARTA
                        where
                        TRUNC(fd_data1)<pFD_DATAC
                        and TRUNC(fd_data3)>=pFD_DATAC
                        and fk_pryb<>1
                        and fk_pryb<>3
                        and fk_pryb<>7
                        AND TKARTA.FK_ID=FK_PACID
                        union
                        select \*+ rule *\ TKARTA.FK_ID,TRUNC(MONTHS_BETWEEN (pFD_DATAC, fd_rojd) / 12)FN_AGE  from tsroky , TKARTA
                        where
                        TRUNC(fd_data1)=pFD_DATAC
                        and TRUNC(fd_data3)>=pFD_DATAC
                        and (fk_pryb=5 or fk_pryb=6)
                        AND TKARTA.FK_ID=FK_PACID
                        UNION
                        select \* + rule *\FK_PACID,TRUNC(MONTHS_BETWEEN (pFD_DATAC, fd_rojd) / 12)FN_AGE from tsroky,TKARTA where
                            TRUNC(fd_data1)=pFD_DATAC and fk_pryb=2 AND TKARTA.FK_ID=TSROKY.FK_PACID)V,TROOM  WHERE FN_AGE BETWEEN pFN_AGE1 AND pFN_AGE2 AND TROOM.FK_ID=GET_PACPALATAID(V.FK_ID) AND FK_KORPID<> 200;*/
    Cursor cMorningOpl(pFD_DATAC DATE,pFL_T NUMBER) IS select count(V.FK_ID) as fn_count from
                     (select TKARTA.FK_ID  from tsroky , TKARTA
                        where
                        TRUNC(fd_data1)<pFD_DATAC
                        and TRUNC(fd_data3)>=pFD_DATAC
                        and fk_pryb<>1
                        and fk_pryb<>3
                        and fk_pryb<>7
                        AND TKARTA.FK_ID=FK_PACID AND FL_PAYPLACE=pFL_T
                        union
                        select /*+ rule */ TKARTA.FK_ID  from tsroky , TKARTA
                        where
                        TRUNC(fd_data1)=pFD_DATAC
                        and TRUNC(fd_data3)>=pFD_DATAC
                        and (fk_pryb=5 or fk_pryb=6)
                        AND TKARTA.FK_ID=FK_PACID AND FL_PAYPLACE=pFL_T)V ;
  Cursor cMorningLuks(pFD_DATAC DATE) IS select count(V.FK_ID) as fn_count from
                     (select TKARTA.FK_ID  from tsroky , TKARTA
                        where
                        TRUNC(fd_data1)<pFD_DATAC
                        and TRUNC(fd_data3)>=pFD_DATAC
                        and fk_pryb<>1
                        and fk_pryb<>3
                        and fk_pryb<>7
                        AND TKARTA.FK_ID=FK_PACID
                        union
                        select /*+ rule */ TKARTA.FK_ID  from tsroky , TKARTA
                        where
                        TRUNC(fd_data1)=pFD_DATAC
                        and TRUNC(fd_data3)>=pFD_DATAC
                        and (fk_pryb=5 or fk_pryb=6)
                        AND TKARTA.FK_ID=FK_PACID)V,TROOM WHERE TROOM.FK_ID=GET_PACPALATAID(V.FK_ID) AND FK_KORPID<>200;
  Cursor cMorningLukss(pFD_DATAC DATE) IS select count(V.FK_ID) as fn_count from
                     (select TKARTA.FK_ID  from tsroky , TKARTA
                        where
                        TRUNC(fd_data1)<pFD_DATAC
                        and TRUNC(fd_data3)>=pFD_DATAC
                        and fk_pryb<>1
                        and fk_pryb<>3
                        and fk_pryb<>7
                        AND TKARTA.FK_ID=FK_PACID
                        union
                        select /*+ rule */ TKARTA.FK_ID  from tsroky , TKARTA
                        where
                        TRUNC(fd_data1)=pFD_DATAC
                        and TRUNC(fd_data3)>=pFD_DATAC
                        and (fk_pryb=5 or fk_pryb=6)
                        AND TKARTA.FK_ID=FK_PACID)V,TROOM WHERE TROOM.FK_ID=GET_PACPALATAID(V.FK_ID) AND FK_KORPID IN (325,326,327);
  Cursor cMorningDacha(pFD_DATAC DATE) IS select count(V.FK_ID) as fn_count from
                     (select TKARTA.FK_ID  from tsroky , TKARTA
                        where
                        TRUNC(fd_data1)<pFD_DATAC
                        and TRUNC(fd_data3)>=pFD_DATAC
                        and fk_pryb<>1
                        and fk_pryb<>3
                        and fk_pryb<>7
                        AND TKARTA.FK_ID=FK_PACID
                        union
                        select /*+ rule */ TKARTA.FK_ID  from tsroky , TKARTA
                        where
                        TRUNC(fd_data1)=pFD_DATAC
                        and TRUNC(fd_data3)>=pFD_DATAC
                        and (fk_pryb=5 or fk_pryb=6)
                        AND TKARTA.FK_ID=FK_PACID)V,TROOM WHERE TROOM.FK_ID=GET_PACPALATAID(V.FK_ID) AND FK_KORPID NOT IN (325,326,327,200);
   Cursor cMorningTotal(pFD_DATAC DATE) IS select count(V.FK_ID) as fn_count from
                     (select TKARTA.FK_ID  from tsroky , TKARTA
                        where
                        TRUNC(fd_data1)<pFD_DATAC
                        and TRUNC(fd_data3)>=pFD_DATAC
                        and fk_pryb<>1
                        and fk_pryb<>3
                        and fk_pryb<>7
                        AND TKARTA.FK_ID=FK_PACID
                        union
                        select /*+ rule */ TKARTA.FK_ID  from tsroky , TKARTA
                        where
                        TRUNC(fd_data1)=pFD_DATAC
                        and TRUNC(fd_data3)>=pFD_DATAC
                        and (fk_pryb=5 or fk_pryb=6)
                        AND TKARTA.FK_ID=FK_PACID)V;
    CURSOR cIn(pFD_DATAC DATE) IS select /* + rule */count(TSROKY.fk_id) from tsroky,TROOM where
                   TRUNC(fd_data1)=pFD_DATAC and fk_pryb=2 AND TROOM.FK_ID=GET_PACPALATAID(FK_PACID) AND FK_KORPID=200;
    CURSOR cInStol(pFD_DATAC DATE,ppFK_STOLID IN NUMBER) IS select /* + rule */count(distinct TSROKY.fk_pacid) from tsroky,TROOM where
                   TRUNC(fd_data1)=pFD_DATAC and fk_pryb=2 AND TROOM.FK_ID=GET_PACPALATAID(FK_PACID) AND GET_PAC_STOLID(FK_PACID)=ppFK_STOLID/* AND FK_KORPID=200*/;
    CURSOR cInChild(pFD_DATAC DATE,pFN_AGE1 NUMBER,pFN_AGE2 NUMBER) IS select /* + rule */count(TSROKY.fk_id) from tsroky,tkarta where
                   TRUNC(fd_data1)=pFD_DATAC and fk_pryb=2 AND TKARTA.FK_ID=TSROKY.FK_PACID AND TRUNC(MONTHS_BETWEEN (pFD_DATAC, fd_rojd) / 12) BETWEEN pFN_AGE1 AND pFN_AGE2;
    CURSOR cInChildStol(pFD_DATAC DATE,pFN_AGE1 NUMBER,pFN_AGE2 NUMBER,ppFK_STOLID IN NUMBER) IS select /*+ rule*/count(TSROKY.fk_id) from tsroky,tkarta/*,TROOM */where
                   TRUNC(fd_data1)=pFD_DATAC and fk_pryb=2 AND TKARTA.FK_ID=TSROKY.FK_PACID AND FK_STOLID=ppFK_STOLID AND TRUNC(MONTHS_BETWEEN (pFD_DATAC, fd_rojd) / 12) BETWEEN pFN_AGE1 AND pFN_AGE2
                   /*AND TROOM.FK_ID=GET_PACPALATAID(FK_PACID)*//* AND FK_KORPID=200*/;
/*    CURSOR cInChildLuks(pFD_DATAC DATE,pFN_AGE1 NUMBER,pFN_AGE2 NUMBER) IS select \* + rule *\count(TSROKY.fk_id) from tsroky,tkarta,TROOM where
                   TRUNC(fd_data1)=pFD_DATAC and fk_pryb=2 AND TKARTA.FK_ID=TSROKY.FK_PACID AND TRUNC(MONTHS_BETWEEN (pFD_DATAC, fd_rojd) / 12) BETWEEN pFN_AGE1 AND pFN_AGE2
                   AND TROOM.FK_ID=GET_PACPALATAID(FK_PACID) AND FK_KORPID<>200;*/
/*    CURSOR cInChildPrim(pFD_DATAC DATE,pFN_AGE1 NUMBER,pFN_AGE2 NUMBER) IS select \* + rule *\count(TSROKY.fk_id) from tsroky,tkarta,TROOM where
                   TRUNC(fd_data1)=pFD_DATAC and fk_pryb=2 AND TKARTA.FK_ID=TSROKY.FK_PACID AND TRUNC(MONTHS_BETWEEN (pFD_DATAC, fd_rojd) / 12) BETWEEN pFN_AGE1 AND pFN_AGE2
                   AND TROOM.FK_ID=GET_PACPALATAID(FK_PACID) AND FK_KORPID=200;*/
    CURSOR cInLuks(pFD_DATAC DATE) IS select /* + rule */count(TSROKY.fk_id) from tsroky,TROOM where
                   TRUNC(fd_data1)=pFD_DATAC and fk_pryb=2 AND TROOM.FK_ID=GET_PACPALATAID(FK_PACID) AND FK_KORPID<>200;
    CURSOR cInLukss(pFD_DATAC DATE) IS select /* + rule */count(TSROKY.fk_id) from tsroky,TROOM where
                   TRUNC(fd_data1)=pFD_DATAC and fk_pryb=2 AND TROOM.FK_ID=GET_PACPALATAID(FK_PACID) AND FK_KORPID IN (325,326,327);
    CURSOR cInDacha(pFD_DATAC DATE) IS select /* + rule */count(TSROKY.fk_id) from tsroky,TROOM where
                   TRUNC(fd_data1)=pFD_DATAC and fk_pryb=2 AND TROOM.FK_ID=GET_PACPALATAID(FK_PACID) AND FK_KORPID NOT IN (325,326,327,200);
    CURSOR cInTotal(pFD_DATAC DATE) IS select /* + rule */count(TSROKY.fk_id) from tsroky where
                   TRUNC(fd_data1)=pFD_DATAC and fk_pryb=2;
    CURSOR cInOpl(pFD_DATAC DATE,pFL_T NUMBER) IS select /* + rule */count(TSROKY.fk_id) from tsroky,TKARTA where
                   TRUNC(fd_data1)=pFD_DATAC and fk_pryb=2 AND TKARTA.FK_ID=TSROKY.FK_PACID AND FL_PAYPLACE=pFL_T;
    CURSOR cOut(pFD_DATAC DATE) IS select /* + rule */count(TSROKY.fk_id) from tsroky,TROOM where
                   TRUNC(fd_data1)=pFD_DATAC and fk_pryb IN (3,7) AND TROOM.FK_ID=GET_PACPALATAID(FK_PACID) AND FK_KORPID=200;
    CURSOR cOutStol(pFD_DATAC DATE,ppFK_STOLID IN NUMBER) IS select /* + rule */count(TSROKY.fk_id) from tsroky,TROOM where
                   TRUNC(fd_data1)=pFD_DATAC and fk_pryb IN (3,7) AND TROOM.FK_ID=GET_PACPALATAID(FK_PACID) AND GET_PAC_STOLID(FK_PACID)=ppFK_STOLID/* AND FK_KORPID=200*/;
    CURSOR cOutLuks(pFD_DATAC DATE) IS select /* + rule */count(TSROKY.fk_id) from tsroky,TROOM where
                   TRUNC(fd_data1)=pFD_DATAC and fk_pryb IN (3,7) AND TROOM.FK_ID=GET_PACPALATAID(FK_PACID) AND FK_KORPID<>200;
    CURSOR cOutLukss(pFD_DATAC DATE) IS select /* + rule */count(TSROKY.fk_id) from tsroky,TROOM where
                   TRUNC(fd_data1)=pFD_DATAC and fk_pryb IN (3,7) AND TROOM.FK_ID=GET_PACPALATAID(FK_PACID) AND FK_KORPID IN (325,326,327);
    CURSOR cOutDacha(pFD_DATAC DATE) IS select /* + rule */count(TSROKY.fk_id) from tsroky,TROOM where
                   TRUNC(fd_data1)=pFD_DATAC and fk_pryb IN (3,7) AND TROOM.FK_ID=GET_PACPALATAID(FK_PACID) AND FK_KORPID NOT IN (325,326,327,200);
    CURSOR cOutTotal(pFD_DATAC DATE) IS select /* + rule */count(TSROKY.fk_id) from tsroky where
                   TRUNC(fd_data1)=pFD_DATAC and fk_pryb IN (3,7);
    CURSOR cOutOpl(pFD_DATAC DATE,pFL_T NUMBER) IS select /* + rule */count(TSROKY.fk_id) from tsroky,tkarta where
                   TRUNC(fd_data1)=pFD_DATAC and fk_pryb IN (3,7) AND TKARTA.FK_ID=TSROKY.FK_PACID AND FL_PAYPLACE=pFL_T;
    CURSOR cOplT IS SELECT * FROM (SELECT 1 FL_T,'Сочи'FC_NAME FROM DUAL UNION
                    SELECT 0,'Москва' FROM DUAL) ORDER BY FL_T DESC;
    CURSOR cStol IS SELECT * FROM TSTOL ORDER BY FK_ID;
    CC CLOB;
    STR VARCHAR(32767);
    nOpozdT NUMBER;
    nEveT NUMBER;
    nC NUMBER;
  BEGIN
--    ALTER SESSION NLS_DATE='dd.mm.yyyy';
    DBMS_LOB.createtemporary (cc, TRUE, DBMS_LOB.session);
    str      := get_html_header (1);
    DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
--                                        Заносим данные в конец клоба
--                                    ШАПКА
    str      :=
      '<P align="center"><FONT SIZE="-2"><B><font size="+1"> Санаторий "'||PKG_SMINI.READSTRING ('CONFIG', 'S_NAME', 'Не известен') ||'" <BR>Дневник движения отдыхающих за '||TO_CHAR(pFD_DATA1,'dd.mm.yyyy')||
        '</font></B><BR>';
    DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
--                                        Заносим данные в конец клоба
--                                 Определение таблицы

    FOR w IN cStol LOOP-- 1 прибывшие
      str      :=
        'Столовая "'||w.FC_NAME||'"<BR><table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0" class="sm_table">';
  --                                Шапка таблицы
      str      :=
        str || '<tr><td class="sm_td" WIDTH=34 align="center"><FONT SIZE="-2"><B>№ п/п:</B></td><td  class="sm_td" align="center" width=69 >' ||
          '<FONT SIZE="-2"><b>Рег. номер:</b></td><td class="sm_td" width=180 align="center"><FONT SIZE="-2"><B>Ф.И.О.:</B></td><td width=160 class="sm_td"' ||
          ' width=160 align="center"><FONT SIZE="-2"><B>Номер путевки, курсовки:</B></td><td  class="sm_td" width=79' ||
          ' align="center"><FONT SIZE="-2"><B>Вид путевки, кусовки:</B></td><td class="sm_td" width=79 align="center"><FONT SIZE="-2"><B>Цена путевки, курсовки:</B></td>' ||
          '<td class="sm_td"  width=79 align="center"  ><FONT SIZE="-2"><B>Срок путевки, курсовки:</B></td><td  class="sm_td" width=95 align="center"><FONT SIZE="-2">' ||
          '<B>Дата фактич. убытия:</B></td><td class="sm_td"  width=79 align="center"  ><FONT SIZE="-2"><B>Дней опоздания:</B></td><td class="sm_td"  width=79 align="center"  >'||
          '<FONT SIZE="-2"><B>Корпус:</B></td><td class="sm_td"  width=79 align="center"  ><FONT SIZE="-2"><B>Комната:</B></td></tr>';
      DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
  --                                     Заполнение таблицы
      nOpozdT:=0;
      FOR p IN cPryb(pFD_DATA1,w.FK_ID) LOOP
      str:='<tr><td class="sm_td" align="center"><FONT SIZE="-2"><FONT SIZE="-2">'||p.FN_ROW||'</td>'||
               '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FK_IBID||'</td>'||
               '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FC_FIO||'</td>'||
               '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FC_PUT||'</td>'||
               '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FC_VID||'</td>'||
               '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FN_SUM||'</td>'||
               '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FC_FROMTO||'</td>'||
               '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||TO_CHAR(p.FD_OUT,'dd.mm.yyyy')||'</td>'||
               '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FN_OPOZD||'</td>'||
               '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FC_KORP||'</td>'||
               '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FC_PALATA||'</td></TR>';
        DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
        nOpozdT:=nOpozdT+p.FN_OPOZD;
      END LOOP;
      str:='<tr><td class="sm_td" align="RIGHT" COLSPAN="8">Итого:</td>'||
               '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||nOpozdT||'</td>'||
               '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;</td>'||
               '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;</td></TR></TABLE><BR>';
      DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
    END LOOP;

    FOR w IN cStol LOOP-- 2 выбsтие
       str      :=
        'Столовая "'||w.FC_NAME||'"<BR><table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0" class="sm_table">';
  --                                Шапка таблицы
      str      :=
        str || '<tr><td class="sm_td" WIDTH=34 align="center"><FONT SIZE="-2"><B>№ п/п:</B></td><td  class="sm_td" align="center" width=69 ><FONT SIZE="-2">' ||
          '<b>Рег. номер:</b></td><td class="sm_td" width=180 align="center"><FONT SIZE="-2"><B>Ф.И.О.:</B></td><td width=160 class="sm_td"' ||
          ' width=160 align="center"><FONT SIZE="-2"><B>Номер путевки, курсовки:</B></td><td  class="sm_td" width=79' ||
          ' align="center"><FONT SIZE="-2"><B>Конец срока пребывания:</B></td><td class="sm_td" width=79 align="center"><FONT SIZE="-2"><B>Дата фактич. убытия:</B></td>' ||
          '<td class="sm_td"  width=79 align="center"  ><FONT SIZE="-2"><B>Причина досрочного убытия:</B></td><td  class="sm_td" width=95 align="center"><FONT SIZE="-2">' ||
          '<B>Ост. к/дн:</B></td>'||
          '<td class="sm_td"  width=79 align="center"  ><FONT SIZE="-2"><B>Корпус:</B></td><td class="sm_td"  width=79 align="center"  ><FONT SIZE="-2"><B>Комната:</B></td></tr>';
      DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
  --                                     Заполнение таблицы
      nOpozdT:=0;
      FOR p IN cVyb(pFD_DATA1,w.FK_ID) LOOP
      str:='<tr><td class="sm_td" align="center"><FONT SIZE="-2">'||p.FN_ROW||'</td>'||
               '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FK_IBID||'</td>'||
               '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FC_FIO||'</td>'||
               '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FC_PUT||'</td>'||
               '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FD_TO||'</td>'||
               '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FD_OUT||'</td>'||
               '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FC_VYB||'</td>'||
               '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FN_OST||'</td>'||
               '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FC_KORP||'</td>'||
               '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FC_PALATA||'</td></TR>';
        DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
        nOpozdT:=nOpozdT+p.FN_OST;
      END LOOP;
      str:='<tr><td class="sm_td" align="RIGHT" COLSPAN="7">Итого:</td>'||
               '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||nOpozdT||'</td>'||
               '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;</td>'||
               '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;</td></TR></TABLE><BR>';
      DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
    END LOOP;
/*
    str      :=
      'Столовая "Приморский"<BR><table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0" class="sm_table">';
--                                Шапка таблицы
    str      :=
      str || '<tr><td class="sm_td" WIDTH=34 align="center"><FONT SIZE="-2"><B>№ п/п:</B></td><td  class="sm_td" align="center" width=69 >' ||
        '<FONT SIZE="-2"><b>Рег. номер:</b></td><td class="sm_td" width=180 align="center"><FONT SIZE="-2"><B>Ф.И.О.:</B></td><td width=160 class="sm_td"' ||
        ' width=160 align="center"><FONT SIZE="-2"><B>Номер путевки, курсовки:</B></td><td  class="sm_td" width=79' ||
        ' align="center"><FONT SIZE="-2"><B>Вид путевки, кусовки:</B></td><td class="sm_td" width=79 align="center"><FONT SIZE="-2"><B>Цена путевки, курсовки:</B></td>' ||
        '<td class="sm_td"  width=79 align="center"  ><FONT SIZE="-2"><B>Срок путевки, курсовки:</B></td><td  class="sm_td" width=95 align="center"><FONT SIZE="-2">' ||
        '<B>Дата фактич. убытия:</B></td><td class="sm_td"  width=79 align="center"  ><FONT SIZE="-2"><B>Дней опоздания:</B></td><td class="sm_td"  width=79 align="center"  >'||
        '<FONT SIZE="-2"><B>Корпус:</B></td><td class="sm_td"  width=79 align="center"  ><FONT SIZE="-2"><B>Комната:</B></td></tr>';
    DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
--                                     Заполнение таблицы
    nOpozdT:=0;
    FOR p IN cPryb(pFD_DATA1) LOOP
    str:='<tr><td class="sm_td" align="center"><FONT SIZE="-2"><FONT SIZE="-2">'||p.FN_ROW||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FK_IBID||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FC_FIO||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FC_PUT||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FC_VID||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FN_SUM||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FC_FROMTO||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||TO_CHAR(p.FD_OUT,'dd.mm.yyyy')||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FN_OPOZD||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FC_KORP||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FC_PALATA||'</td></TR>';
      DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
      nOpozdT:=nOpozdT+p.FN_OPOZD;
    END LOOP;
    str:='<tr><td class="sm_td" align="RIGHT" COLSPAN="8">Итого:</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||nOpozdT||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;</td></TR></TABLE><BR>';
    DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
--
     str      :=
      'Столовая "Люкс"<BR><table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0" class="sm_table">';
--                                Шапка таблицы
    str      :=
      str || '<tr><td class="sm_td" WIDTH=34 align="center"><FONT SIZE="-2"><B>№ п/п:</B></td><td  class="sm_td" align="center" width=69 >' ||
        '<FONT SIZE="-2"><b>Рег. номер:</b></td><td class="sm_td" width=180 align="center"><FONT SIZE="-2"><B>Ф.И.О.:</B></td><td width=160 class="sm_td"' ||
        ' width=160 align="center"><FONT SIZE="-2"><B>Номер путевки, курсовки:</B></td><td  class="sm_td" width=79' ||
        ' align="center"><FONT SIZE="-2"><B>Вид путевки, кусовки:</B></td><td class="sm_td" width=79 align="center"><FONT SIZE="-2"><B>Цена путевки, курсовки:</B></td>' ||
        '<td class="sm_td"  width=79 align="center"  ><FONT SIZE="-2"><B>Срок путевки, курсовки:</B></td><td  class="sm_td" width=95 align="center"><FONT SIZE="-2">' ||
        '<B>Дата фактич. убытия:</B></td><td class="sm_td"  width=79 align="center"  ><FONT SIZE="-2"><B>Дней опоздания:</B></td><td class="sm_td"  width=79 align="center"  ><FONT SIZE="-2">'||
        '<B>Корпус:</B></td><td class="sm_td"  width=79 align="center"  ><FONT SIZE="-2"><B>Комната:</B></td></tr>';
    DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
--                                     Заполнение таблицы
    nOpozdT:=0;
    FOR p IN cPrybLuks(pFD_DATA1) LOOP
    str:='<tr><td class="sm_td" align="center"><FONT SIZE="-2">'||p.FN_ROW||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FK_IBID||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FC_FIO||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FC_PUT||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FC_VID||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FN_SUM||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FC_FROMTO||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||TO_CHAR(p.FD_OUT,'dd.mm.yyyy')||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FN_OPOZD||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FC_KORP||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FC_PALATA||'</td></TR>';
      DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
      nOpozdT:=nOpozdT+p.FN_OPOZD;
    END LOOP;
    str:='<tr><td class="sm_td" align="RIGHT" COLSPAN="8">Итого:</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||nOpozdT||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;</td></TR></TABLE><BR>';
    DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
--Выписанные
     str      :=
      'Столовая "Приморский"<BR><table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0" class="sm_table">';
--                                Шапка таблицы
    str      :=
      str || '<tr><td class="sm_td" WIDTH=34 align="center"><FONT SIZE="-2"><B>№ п/п:</B></td><td  class="sm_td" align="center" width=69 ><FONT SIZE="-2">' ||
        '<b>Рег. номер:</b></td><td class="sm_td" width=180 align="center"><FONT SIZE="-2"><B>Ф.И.О.:</B></td><td width=160 class="sm_td"' ||
        ' width=160 align="center"><FONT SIZE="-2"><B>Номер путевки, курсовки:</B></td><td  class="sm_td" width=79' ||
        ' align="center"><FONT SIZE="-2"><B>Конец срока пребывания:</B></td><td class="sm_td" width=79 align="center"><FONT SIZE="-2"><B>Дата фактич. убытия:</B></td>' ||
        '<td class="sm_td"  width=79 align="center"  ><FONT SIZE="-2"><B>Причина досрочного убытия:</B></td><td  class="sm_td" width=95 align="center"><FONT SIZE="-2">' ||
        '<B>Ост. к/дн:</B></td>'||
        '<td class="sm_td"  width=79 align="center"  ><FONT SIZE="-2"><B>Корпус:</B></td><td class="sm_td"  width=79 align="center"  ><FONT SIZE="-2"><B>Комната:</B></td></tr>';
    DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
--                                     Заполнение таблицы
    nOpozdT:=0;
    FOR p IN cVyb(pFD_DATA1) LOOP
    str:='<tr><td class="sm_td" align="center"><FONT SIZE="-2">'||p.FN_ROW||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FK_IBID||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FC_FIO||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FC_PUT||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FD_TO||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FD_OUT||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FC_VYB||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FN_OST||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FC_KORP||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FC_PALATA||'</td></TR>';
      DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
      nOpozdT:=nOpozdT+p.FN_OST;
    END LOOP;
    str:='<tr><td class="sm_td" align="RIGHT" COLSPAN="7">Итого:</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||nOpozdT||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;</td></TR></TABLE><BR>';
    DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);

      str      :=
      'Столовая "Люкс"<BR><table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0" class="sm_table">';
--                                Шапка таблицы
    str      :=
      str || '<tr><td class="sm_td" WIDTH=34 align="center"><FONT SIZE="-2"><B>№ п/п:</B></td><td  class="sm_td" align="center" width=69 >' ||
        '<FONT SIZE="-2"><b>Рег. номер:</b></td><td class="sm_td" width=180 align="center"><FONT SIZE="-2"><B>Ф.И.О.:</B></td><td width=160 class="sm_td"' ||
        ' width=160 align="center"><FONT SIZE="-2"><B>Номер путевки, курсовки:</B></td><td  class="sm_td" width=79' ||
        ' align="center"><FONT SIZE="-2"><B>Конец срока пребывания:</B></td><td class="sm_td" width=79 align="center"><FONT SIZE="-2"><B>Дата фактич. убытия:</B></td>' ||
        '<td class="sm_td"  width=79 align="center"  ><FONT SIZE="-2"><B>Причина досрочного убытия:</B></td><td  class="sm_td" width=95 align="center"><FONT SIZE="-2">' ||
        '<B>Ост. к/дн:</B></td>'||
        '<td class="sm_td"  width=79 align="center"  ><FONT SIZE="-2"><B>Корпус:</B></td><td class="sm_td"  width=79 align="center"  ><FONT SIZE="-2"><B>Комната:</B></td></tr>';
    DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
--                                     Заполнение таблицы
    nOpozdT:=0;
    FOR p IN cVybLuks(pFD_DATA1) LOOP
    str:='<tr><td class="sm_td" align="center"><FONT SIZE="-2">'||p.FN_ROW||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FK_IBID||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FC_FIO||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FC_PUT||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FD_TO||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FD_OUT||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FC_VYB||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FN_OST||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FC_KORP||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||p.FC_PALATA||'</td></TR>';
      DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
      nOpozdT:=nOpozdT+p.FN_OST;
    END LOOP;
    str:='<tr><td class="sm_td" align="RIGHT" COLSPAN="7">Итого:</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;'||nOpozdT||'</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;</td>'||
             '<td class="sm_td" align="center"><FONT SIZE="-2">&nbsp;</td></TR></TABLE><BR>';
    DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);*/
      str      :=
      'Итоги:<BR><table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0" class="sm_table">';
--                                Шапка таблицы
    str      :=
      str || '<tr><td class="sm_td" WIDTH=34 align="center"><FONT SIZE="-2"><B>Столовая:</B></td><td  class="sm_td" align="center" width=69 >' ||
        '<FONT SIZE="-2"><b>Состояло на начало дня:</b></td><td class="sm_td" width=180 align="center"><FONT SIZE="-2"><B>Поступило за день:</B></td><td width=160 class="sm_td"' ||
        ' width=160 align="center"><FONT SIZE="-2"><B>Выбыло за день:</B></td><td  class="sm_td" width=79' ||
        ' align="center"><FONT SIZE="-2"><B>Состоит на конец дня:</B></td></tr>';
    DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);

    FOR w IN cStol LOOP-- 3 ИТОГО
      str := '<tr><td class="sm_td" WIDTH=34 align="center"><FONT SIZE="-2">"'||w.FC_NAME||'"</td><td  class="sm_td" align="center" width=69 ><FONT SIZE="-2">' ;
      OPEN cMorningStol(pFD_DATA1,w.FK_ID);
      FETCH cMorningStol INTO nOpozdT;
      CLOSE cMorningStol;
      str:=str||nOpozdT||'</td><td class="sm_td" width=180 align="center"><FONT SIZE="-2">';
      OPEN cInStol(pFD_DATA1,w.FK_ID);
      FETCH cInStol INTO nOpozdT;
      CLOSE cInStol;
      str:=str||nOpozdT||'</td><td width=160 class="sm_td"' ||
          ' width=160 align="center"><FONT SIZE="-2">';
      OPEN cOutStol(pFD_DATA1,w.FK_ID);
      FETCH cOutStol INTO nOpozdT;
      CLOSE cOutStol;
      str:=str||nOpozdT||'</td><td  class="sm_td" width=79' ||
          ' align="center"><FONT SIZE="-2">';
      OPEN cMorningStol(pFD_DATA1+1,w.FK_ID);
      FETCH cMorningStol INTO nOpozdT;
      CLOSE cMorningStol;
      str:=str||nOpozdT||'</td></tr>';
      DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    END LOOP;
/*      str := '<tr><td class="sm_td" WIDTH=34 align="center"><FONT SIZE="-2">"Приморский"</td><td  class="sm_td" align="center" width=69 ><FONT SIZE="-2">' ;
    OPEN cMorning(pFD_DATA1);
    FETCH cMorning INTO nOpozdT;
    CLOSE cMorning;
    str:=str||nOpozdT||'</td><td class="sm_td" width=180 align="center"><FONT SIZE="-2">';
    OPEN cIn(pFD_DATA1);
    FETCH cIn INTO nOpozdT;
    CLOSE cIn;
    str:=str||nOpozdT||'</td><td width=160 class="sm_td"' ||
        ' width=160 align="center"><FONT SIZE="-2">';
    OPEN cOut(pFD_DATA1);
    FETCH cOut INTO nOpozdT;
    CLOSE cOut;
    str:=str||nOpozdT||'</td><td  class="sm_td" width=79' ||
        ' align="center"><FONT SIZE="-2">';
    OPEN cMorning(pFD_DATA1+1);
    FETCH cMorning INTO nOpozdT;
    CLOSE cMorning;
    str:=str||nOpozdT||'</td></tr>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str := '<tr><td class="sm_td" WIDTH=34 align="center"><FONT SIZE="-2">"Люкс"</td><td  class="sm_td" align="center" width=69 ><FONT SIZE="-2">' ;
    OPEN cMorningLuks(pFD_DATA1);
    FETCH cMorningLuks INTO nOpozdT;
    CLOSE cMorningLuks;
    str:=str||nOpozdT||'</td><td class="sm_td" width=180 align="center"><FONT SIZE="-2">';
    OPEN cInLuks(pFD_DATA1);
    FETCH cInLuks INTO nOpozdT;
    CLOSE cInLuks;
    str:=str||nOpozdT||'</td><td width=160 class="sm_td"' ||
        ' width=160 align="center"><FONT SIZE="-2">';
    OPEN cOutLuks(pFD_DATA1);
    FETCH cOutLuks INTO nOpozdT;
    CLOSE cOutLuks;
    str:=str||nOpozdT||'</td><td  class="sm_td" width=79' ||
        ' align="center"><FONT SIZE="-2">';
    OPEN cMorningLuks(pFD_DATA1+1);
    FETCH cMorningLuks INTO nOpozdT;
    CLOSE cMorningLuks;
    str:=str||nOpozdT||'</td></tr>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);*/
    str := '<tr><td class="sm_td" WIDTH=34 align="center"><FONT SIZE="-2">"Всего по санаторию"</td><td  class="sm_td" align="center" width=69 ><FONT SIZE="-2">' ;
    OPEN cMorningTotal(pFD_DATA1);
    FETCH cMorningTotal INTO nOpozdT;
    CLOSE cMorningTotal;
    str:=str||nOpozdT||'</td><td class="sm_td" width=180 align="center"><FONT SIZE="-2">';
    OPEN cInTotal(pFD_DATA1);
    FETCH cInTotal INTO nOpozdT;
    CLOSE cInTotal;
    str:=str||nOpozdT||'</td><td width=160 class="sm_td"' ||
        ' width=160 align="center"><FONT SIZE="-2">';
    OPEN cOutTotal(pFD_DATA1);
    FETCH cOutTotal INTO nOpozdT;
    CLOSE cOutTotal;
    str:=str||nOpozdT||'</td><td  class="sm_td" width=79' ||
        ' align="center"><FONT SIZE="-2">';
    OPEN cMorningTotal(pFD_DATA1+1);
    FETCH cMorningTotal INTO nOpozdT;
    CLOSE cMorningTotal;
    str:=str||nOpozdT||'</td></tr></TABLE>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    str:='<P ALIGN=CENTER>Санаторий "Сочи"</P><P ALIGN=CENTER>Дневник движения отдыхающих за '||TO_CHAR(pFD_DATA1,'dd.mm.yyyy')||'</P>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str:='<P ALIGN=CENTER>ИТОГИ:</P>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str:='<table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0" class="sm_table">'||
           '<tr><td  class="sm_td" align="center" width=69 >&nbsp;</TD><td  class="sm_td" align="center" width=69 >' ||
           '<FONT SIZE="-2"><b>Состояло на начало дня:</b></td><td class="sm_td" width=180 align="center"><FONT SIZE="-2"><B>Поступило за день:</B></td><td width=160 class="sm_td"' ||
           ' width=160 align="center"><FONT SIZE="-2"><B>Выбыло за день:</B></td><td  class="sm_td" width=79' ||
           ' align="center"><FONT SIZE="-2"><B>Состоит на вечер:</B></td><td class="sm_td" width=180 align="center"><FONT SIZE="-2"><B>Состоит на конец дня:</B></td>'||
           '<td class="sm_td" width=180 align="center"><FONT SIZE="-2"><B>План:</B></td><td class="sm_td" width=180 align="center"><FONT SIZE="-2"><B>Процент заполнения:</B></td></TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str:='<tr><td class="sm_td" align="center" width=69 >Всего</TD>';
    OPEN cMorningTotal(pFD_DATA1);
    FETCH cMorningTotal INTO nOpozdT;
    CLOSE cMorningTotal;
    str:=str||'<td  class="sm_td" align="center" width=69 >'||nOpozdT||'</td>';
    nEveT:=nOpozdT;
    OPEN cInTotal(pFD_DATA1);
    FETCH cInTotal INTO nOpozdT;
    CLOSE cInTotal;
    str:=str||'<td  class="sm_td" align="center" width=69 >'||nOpozdT||'</td>';
    nEveT:=nEveT+nOpozdT;
    OPEN cOutTotal(pFD_DATA1);
    FETCH cOutTotal INTO nOpozdT;
    CLOSE cOutTotal;
    str:=str||'<td  class="sm_td" align="center" width=69 >'||nOpozdT||'</td>';
    str:=str||'<td  class="sm_td" align="center" width=69 >'||nEveT||'</td>';
    OPEN cMorningTotal(pFD_DATA1+1);
    FETCH cMorningTotal INTO nOpozdT;
    CLOSE cMorningTotal;
    str:=str||'<td  class="sm_td" align="center" width=69 >'||nOpozdT||'</td>';
    str:=str||'<td  class="sm_td" align="center" width=69 >459</td>';
    str:=str||'<td  class="sm_td" align="center" width=69 >'||TO_CHAR((nEveT/459)*100,'990.00')||'%</td>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
--С оплатой...
    FOR p IN cOplT LOOP
      str:='<tr><td class="sm_td" align="center" width=69 >'||p.FC_NAME||'</TD>';
      OPEN cMorningOpl(pFD_DATA1,p.FL_T);
      FETCH cMorningOpl INTO nOpozdT;
      CLOSE cMorningOpl;
      str:=str||'<td  class="sm_td" align="center" width=69 >'||nOpozdT||'</td>';
      nEveT:=nOpozdT;
      OPEN cInOpl(pFD_DATA1,p.FL_T);
      FETCH cInOpl INTO nOpozdT;
      CLOSE cInOpl;
      str:=str||'<td  class="sm_td" align="center" width=69 >'||nOpozdT||'</td>';
      nEveT:=nEveT+nOpozdT;
      OPEN cOutOpl(pFD_DATA1,p.FL_T);
      FETCH cOutOpl INTO nOpozdT;
      CLOSE cOutOpl;
      str:=str||'<td  class="sm_td" align="center" width=69 >'||nOpozdT||'</td>';
      str:=str||'<td  class="sm_td" align="center" width=69 >'||nEveT||'</td>';
      OPEN cMorningOpl(pFD_DATA1+1,p.FL_T);
      FETCH cMorningOpl INTO nOpozdT;
      CLOSE cMorningOpl;
      str:=str||'<td  class="sm_td" align="center" width=69 >'||nOpozdT||'</td>';
      str:=str||'<td  class="sm_td" align="center" width=69 >&nbsp;</td>';
      str:=str||'<td  class="sm_td" align="center" width=69 >&nbsp;</td>';
      DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    END LOOP;
    str:='<TR><TD COLSPAN="8" class="sm_td">&nbsp;</TD></TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
--Приморский
    str:='<tr><td class="sm_td" align="center" width=69 >Приморский</TD>';
    OPEN cMorning(pFD_DATA1);
    FETCH cMorning INTO nOpozdT;
    CLOSE cMorning;
    str:=str||'<td  class="sm_td" align="center" width=69 >'||nOpozdT||'</td>';
    nEveT:=nOpozdT;
    OPEN cIn(pFD_DATA1);
    FETCH cIn INTO nOpozdT;
    CLOSE cIn;
    str:=str||'<td  class="sm_td" align="center" width=69 >'||nOpozdT||'</td>';
    nEveT:=nEveT+nOpozdT;
    OPEN cOut(pFD_DATA1);
    FETCH cOut INTO nOpozdT;
    CLOSE cOut;
    str:=str||'<td  class="sm_td" align="center" width=69 >'||nOpozdT||'</td>';
    str:=str||'<td  class="sm_td" align="center" width=69 >'||nEveT||'</td>';
    OPEN cMorning(pFD_DATA1+1);
    FETCH cMorning INTO nOpozdT;
    CLOSE cMorning;
    str:=str||'<td  class="sm_td" align="center" width=69 >'||nOpozdT||'</td>';
    str:=str||'<td  class="sm_td" align="center" width=69 >&nbsp;</td>';
    str:=str||'<td  class="sm_td" align="center" width=69 >&nbsp;</td>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
--End Приморский
--Люксы
    str:='<tr><td class="sm_td" align="center" width=69 >Люкс</TD>';
    OPEN cMorningLukss(pFD_DATA1);
    FETCH cMorningLukss INTO nOpozdT;
    CLOSE cMorningLukss;
    str:=str||'<td  class="sm_td" align="center" width=69 >'||nOpozdT||'</td>';
    nEveT:=nOpozdT;
    OPEN cInLukss(pFD_DATA1);
    FETCH cInLukss INTO nOpozdT;
    CLOSE cInLukss;
    str:=str||'<td  class="sm_td" align="center" width=69 >'||nOpozdT||'</td>';
    nEveT:=nEveT+nOpozdT;
    OPEN cOutLukss(pFD_DATA1);
    FETCH cOutLukss INTO nOpozdT;
    CLOSE cOutLukss;
    str:=str||'<td  class="sm_td" align="center" width=69 >'||nOpozdT||'</td>';
    str:=str||'<td  class="sm_td" align="center" width=69 >'||nEveT||'</td>';
    OPEN cMorningLukss(pFD_DATA1+1);
    FETCH cMorningLukss INTO nOpozdT;
    CLOSE cMorningLukss;
    str:=str||'<td  class="sm_td" align="center" width=69 >'||nOpozdT||'</td>';
    str:=str||'<td  class="sm_td" align="center" width=69 >&nbsp;</td>';
    str:=str||'<td  class="sm_td" align="center" width=69 >&nbsp;</td></TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
--End Люксы
--Dacha
    str:='<tr><td class="sm_td" align="center" width=69 >Дачи</TD>';
    OPEN cMorningDacha(pFD_DATA1);
    FETCH cMorningDacha INTO nOpozdT;
    CLOSE cMorningDacha;
    str:=str||'<td  class="sm_td" align="center" width=69 >'||nOpozdT||'</td>';
    nEveT:=nOpozdT;
    OPEN cInDacha(pFD_DATA1);
    FETCH cInDacha INTO nOpozdT;
    CLOSE cInDacha;
    str:=str||'<td  class="sm_td" align="center" width=69 >'||nOpozdT||'</td>';
    nEveT:=nEveT+nOpozdT;
    OPEN cOutDacha(pFD_DATA1);
    FETCH cOutDacha INTO nOpozdT;
    CLOSE cOutDacha;
    str:=str||'<td  class="sm_td" align="center" width=69 >'||nOpozdT||'</td>';
    str:=str||'<td  class="sm_td" align="center" width=69 >'||nEveT||'</td>';
    OPEN cMorningDacha(pFD_DATA1+1);
    FETCH cMorningDacha INTO nOpozdT;
    CLOSE cMorningDacha;
    str:=str||'<td  class="sm_td" align="center" width=69 >'||nOpozdT||'</td>';
    str:=str||'<td  class="sm_td" align="center" width=69 >&nbsp;</td>';
    str:=str||'<td  class="sm_td" align="center" width=69 >&nbsp;</td></TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
--End Dacha
--Дети живущие
    str:='<TR><td  class="sm_td" align="LEFT"  COLSPAN="8">Дети живущие в санатории на '||TO_CHAR(pFD_DATA1,'dd.mm.yyyy')||'</td></TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str:='<tr><td class="sm_td" align="center" width=69 >Всего</TD>';
    OPEN cMorningChild(pFD_DATA1,-100,13);
    FETCH cMorningChild INTO nOpozdT;
    CLOSE cMorningChild;
    str:=str||'<td class="sm_td" align="center" width=69 COLSPAN="7">'||nOpozdT||'</TD></TR>';
    str:=str||'<tr><td class="sm_td" align="center" width=69 >До 7</TD>';
    OPEN cMorningChild(pFD_DATA1,-100,6);
    FETCH cMorningChild INTO nOpozdT;
    CLOSE cMorningChild;
    str:=str||'<td class="sm_td" align="center" width=69 COLSPAN="7">'||nOpozdT||'</TD></TR>';
    str:=str||'<tr><td class="sm_td" align="center" width=69 >С 7 до 14</TD>';
    OPEN cMorningChild(pFD_DATA1,7,13);
    FETCH cMorningChild INTO nOpozdT;
    CLOSE cMorningChild;
    str:=str||'<td class="sm_td" align="center" width=69 COLSPAN="7">'||nOpozdT||'</TD></TR>';
    str:=str||'<TR><td class="sm_td" align="LEFT" COLSPAN="8">По столовым</TD></TR>';

    FOR w IN cStol LOOP-- 4 ДЕТИ-1
      str:=str||'<tr><td class="sm_td" align="center" width=69 >'||w.FC_NAME||'</TD>';
      OPEN cMorningChildStol(pFD_DATA1,-100,13,w.FK_ID);
      FETCH cMorningChildStol INTO nOpozdT;
      CLOSE cMorningChildStol;
      str:=str||'<td class="sm_td" align="center" width=69 COLSPAN="7">'||nOpozdT||'</TD></TR>';
    END LOOP;
/*    str:=str||'<tr><td class="sm_td" align="center" width=69 >Приморский</TD>';
    OPEN cMorningChildPrim(pFD_DATA1,-100,13);
    FETCH cMorningChildPrim INTO nOpozdT;
    CLOSE cMorningChildPrim;
    str:=str||'<td class="sm_td" align="center" width=69 COLSPAN="7">'||nOpozdT||'</TD></TR>';
    str:=str||'<tr><td class="sm_td" align="center" width=69 >Люкс</TD>';
    OPEN cMorningChildLuks(pFD_DATA1,-100,13);
    FETCH cMorningChildLuks INTO nOpozdT;
    CLOSE cMorningChildLuks;
    str:=str||'<td class="sm_td" align="center" width=69 COLSPAN="7">'||nOpozdT||'</TD></TR>';*/
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
--End Дети живущие
--Дети живущие
    str:='<TR><td  class="sm_td" align="LEFT"  COLSPAN="8">Поступило детей на '||TO_CHAR(pFD_DATA1,'dd.mm.yyyy')||'</td></TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str:='<tr><td class="sm_td" align="center" width=69 >Всего</TD>';
    OPEN cInChild(pFD_DATA1,-100,13);
    FETCH cInChild INTO nOpozdT;
    CLOSE cInChild;
    str:=str||'<td class="sm_td" align="center" width=69 COLSPAN="7">'||nOpozdT||'</TD></TR>';
    str:=str||'<tr><td class="sm_td" align="center" width=69 >До 7</TD>';
    OPEN cInChild(pFD_DATA1,-100,6);
    FETCH cInChild INTO nOpozdT;
    CLOSE cInChild;
    str:=str||'<td class="sm_td" align="center" width=69 COLSPAN="7">'||nOpozdT||'</TD></TR>';
    str:=str||'<tr><td class="sm_td" align="center" width=69 >С 7 до 14</TD>';
    OPEN cInChild(pFD_DATA1,7,13);
    FETCH cInChild INTO nOpozdT;
    CLOSE cInChild;
    str:=str||'<td class="sm_td" align="center" width=69 COLSPAN="7">'||nOpozdT||'</TD></TR>';
    str:=str||'<TR><td class="sm_td" align="LEFT" COLSPAN="8">По столовым</TD></TR>';

    FOR w IN cStol LOOP-- 5 ДЕТИ-2
      str:=str||'<tr><td class="sm_td" align="center" width=69 >'||w.FC_NAME||'</TD>';
      OPEN cInChildStol(pFD_DATA1,-100,13,w.FK_ID);
      FETCH cInChildStol INTO nOpozdT;
      CLOSE cInChildStol;
      str:=str||'<td class="sm_td" align="center" width=69 COLSPAN="7">'||nOpozdT||'</TD></TR>';
    END LOOP;
/*    str:=str||'<tr><td class="sm_td" align="center" width=69 >Приморский</TD>';
    OPEN cInChildPrim(pFD_DATA1,-100,13);
    FETCH cInChildPrim INTO nOpozdT;
    CLOSE cInChildPrim;
    str:=str||'<td class="sm_td" align="center" width=69 COLSPAN="7">'||nOpozdT||'</TD></TR>';
    str:=str||'<tr><td class="sm_td" align="center" width=69 >Люкс</TD>';
    OPEN cInChildLuks(pFD_DATA1,-100,13);
    FETCH cInChildLuks INTO nOpozdT;
    CLOSE cInChildLuks;
    str:=str||'<td class="sm_td" align="center" width=69 COLSPAN="7">'||nOpozdT||'</TD></TR></TABLE>';*/
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
--End Дети живущие
    str      := '<p align="left">Отчёт составил:  _________________________' || DO_VRACHFIO (pFK_vrachid) || '</p>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
--             Концовка
    str      := '</HTML>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    INSERT INTO TCLOBS
                (FC_CLOB)
         VALUES (cc)
      RETURNING FK_ID
      INTO nC;
    RETURN nc;
  END;
END; -- Package Body PKG_DAILY_MOVEMENT_SOCHI
/

SHOW ERRORS;


