DROP PACKAGE BODY ASU.PKG_R_VEDOMOST
/

--
-- PKG_R_VEDOMOST  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_R_VEDOMOST" 
 IS-- Created by TimurLan
  FUNCTION GET_COUNT_OUT_SUM (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT SUM(FN_SUM)
        FROM TKARTA
       WHERE FK_ID IN
                     (SELECT FK_PACID
                        FROM TSROKY
                       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                         AND FK_PRYB = 3);
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN NVL(i,0);
  END;
  FUNCTION GET_COUNT_OUT_KONT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFL_PAYPLACE IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT(FK_ID)
        FROM TKARTA
       WHERE FK_ID IN
                     (SELECT FK_PACID
                        FROM TSROKY
                       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                         AND FK_PRYB = 3)
         AND FL_PAYPLACE = pFL_PAYPLACE
         AND FK_PRIZN > 0;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_OUT_KORP_KONT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFL_PAYPLACE IN NUMBER, pFK_KORPID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT(FK_ID)
        FROM TKARTA
       WHERE FK_ID IN
                     (SELECT FK_PACID
                        FROM TSROKY
                       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                         AND FK_PRYB = 3
                         AND GET_PACKORPID(FK_PACID,FD_DATA1)=pFK_KORPID)
         AND FL_PAYPLACE = pFL_PAYPLACE
         AND FK_PRIZN > 0;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_OUT_KORP_TIP_KONT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFL_PAYPLACE IN NUMBER, pFK_KORPID IN NUMBER, pFK_TIPID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT(FK_ID)
        FROM TKARTA
       WHERE FK_ID IN
                     (SELECT FK_PACID
                        FROM TSROKY
                       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                         AND FK_PRYB = 3
                         AND GET_PACKORPID(FK_PACID,FD_DATA1)=pFK_KORPID
                         AND GET_PAC_TIPROOMID(FK_PACID)=pFK_TIPID)
         AND FL_PAYPLACE = pFL_PAYPLACE
         AND FK_PRIZN > 0;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_OUT_NKONT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFL_PAYPLACE IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT(FK_ID)
        FROM TKARTA
       WHERE FK_ID IN
                     (SELECT FK_PACID
                        FROM TSROKY
                       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                         AND FK_PRYB = 3)
         AND FL_PAYPLACE = pFL_PAYPLACE
         AND FK_PRIZN = 0;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_OUT_KORP_NKONT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFL_PAYPLACE IN NUMBER, pFK_KORPID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT(FK_ID)
        FROM TKARTA
       WHERE FK_ID IN
                     (SELECT FK_PACID
                        FROM TSROKY
                       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                         AND FK_PRYB = 3
                         AND GET_PACKORPID(FK_PACID,FD_DATA1)=pFK_KORPID)
         AND FL_PAYPLACE = pFL_PAYPLACE
         AND FK_PRIZN = 0;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_OUT_KORP_TIP_NKONT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFL_PAYPLACE IN NUMBER, pFK_KORPID IN NUMBER, pFK_TIPID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT(FK_ID)
        FROM TKARTA
       WHERE FK_ID IN
                     (SELECT FK_PACID
                        FROM TSROKY
                       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                         AND FK_PRYB = 3
                         AND GET_PACKORPID(FK_PACID,FD_DATA1)=pFK_KORPID
                         AND GET_PAC_TIPROOMID(FK_PACID)=pFK_TIPID)
         AND FL_PAYPLACE = pFL_PAYPLACE
         AND FK_PRIZN = 0;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_OUT_SUM_KONT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFL_PAYPLACE IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT SUM(FN_SUM)
        FROM TKARTA
       WHERE FK_ID IN
                     (SELECT FK_PACID
                        FROM TSROKY
                       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                         AND FK_PRYB = 3)
         AND FL_PAYPLACE = pFL_PAYPLACE
         AND FK_PRIZN <> 0;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN NVL(i,0);
  END;
  FUNCTION GET_COUNT_OUT_SUM_NKONT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFL_PAYPLACE IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT SUM(FN_SUM)
        FROM TKARTA
       WHERE FK_ID IN
                     (SELECT FK_PACID
                        FROM TSROKY
                       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                         AND FK_PRYB = 3)
         AND FL_PAYPLACE = pFL_PAYPLACE
         AND FK_PRIZN = 0;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN NVL(i,0);
  END;
  FUNCTION GET_COUNT_OUT_SUM_KORP_KONT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFL_PAYPLACE IN NUMBER, pFK_KORPID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT SUM(FN_SUM)
        FROM TKARTA
       WHERE FK_ID IN
                     (SELECT FK_PACID
                        FROM TSROKY
                       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                         AND FK_PRYB = 3
                         AND GET_PACKORPID(FK_PACID,FD_DATA1)=pFK_KORPID)
         AND FL_PAYPLACE = pFL_PAYPLACE
         AND FK_PRIZN <> 0;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN NVL(i,0);
  END;
  FUNCTION GET_COUNT_OUT_SUM_KORP_TIP_K (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFL_PAYPLACE IN NUMBER, pFK_KORPID IN NUMBER, pFK_TIPID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT SUM(FN_SUM)
        FROM TKARTA
       WHERE FK_ID IN
                     (SELECT FK_PACID
                        FROM TSROKY
                       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                         AND FK_PRYB = 3
                         AND GET_PACKORPID(FK_PACID,FD_DATA1)=pFK_KORPID
                         AND GET_PAC_TIPROOMID(FK_PACID)=pFK_TIPID)
         AND FL_PAYPLACE = pFL_PAYPLACE
         AND FK_PRIZN <> 0;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN NVL(i,0);
  END;
  FUNCTION GET_COUNT_OUT_SUM_KORP_NKONT (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFL_PAYPLACE IN NUMBER, pFK_KORPID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT SUM(FN_SUM)
        FROM TKARTA
       WHERE FK_ID IN
                     (SELECT FK_PACID
                        FROM TSROKY
                       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                         AND FK_PRYB = 3
                         AND GET_PACKORPID(FK_PACID,FD_DATA1)=pFK_KORPID)
         AND FL_PAYPLACE = pFL_PAYPLACE
         AND FK_PRIZN = 0;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN NVL(i,0);
  END;
  FUNCTION GET_COUNT_OUT_SUM_KORP_TIP_NK (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFL_PAYPLACE IN NUMBER, pFK_KORPID IN NUMBER, pFK_TIPID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT SUM(FN_SUM)
        FROM TKARTA
       WHERE FK_ID IN
                     (SELECT FK_PACID
                        FROM TSROKY
                       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                         AND FK_PRYB = 3
                         AND GET_PACKORPID(FK_PACID,FD_DATA1)=pFK_KORPID
                         AND GET_PAC_TIPROOMID(FK_PACID)=pFK_TIPID)
         AND FL_PAYPLACE = pFL_PAYPLACE
         AND FK_PRIZN = 0;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN NVL(i,0);
  END;
  FUNCTION GET_COUNT_OUT_SUM_KORP (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_KORPID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT SUM(FN_SUM)
        FROM TKARTA
       WHERE FK_ID IN
                     (SELECT FK_PACID
                        FROM TSROKY
                       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                         AND FK_PRYB = 3
                         AND GET_PACKORPID(FK_PACID,FD_DATA1)=pFK_KORPID);
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN NVL(i,0);
  END;
  FUNCTION GET_COUNT_OUT_SUM_KORP_TIP (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_KORPID IN NUMBER, pFK_TIPID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT SUM(FN_SUM)
        FROM TKARTA
       WHERE FK_ID IN
                     (SELECT FK_PACID
                        FROM TSROKY
                       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
                         AND FK_PRYB = 3
                         AND GET_PACKORPID(FK_PACID,FD_DATA1)=pFK_KORPID
                         AND GET_PAC_TIPROOMID(FK_PACID)=pFK_TIPID);
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN NVL(i,0);
  END;
  FUNCTION GET_KDNV_PRIZN(pFD_DATAC IN DATE,pFK_PRIZN IN NUMBER,pFL_PAYPLACE IN NUMBER)
  RETURN NUMBER
   IS
    Cursor c IS
      select/*+ first_row */count(*) as fn_count
       from
       (select fk_ibid, fc_fam  from tsroky , TKARTA
       where
                     fd_data1<=pFD_DATAC
                     and fd_data3>=pFD_DATAC
                     and fk_pryb<>1
                     and fk_pryb<>3
                     and fk_pryb<>7
       AND TKARTA.FK_ID=FK_PACID AND TKARTA.FP_TEK_COC=3 AND FL_PAYPLACE = pFL_PAYPLACE and tkarta.fk_prizn=pfk_prizn
       union
       select /*+ rule */ fk_ibid, fc_fam  from tsroky , TKARTA
       where
                     fd_data1=pFD_DATAC
                     and fd_data3>=pFD_DATAC
                     and (fk_pryb=5 or fk_pryb=6)
       AND TKARTA.FK_ID=FK_PACID AND TKARTA.FP_TEK_COC=3 AND FL_PAYPLACE = pFL_PAYPLACE and tkarta.fk_prizn=pfk_prizn );

   i NUMBER;
   BEGIN
     OPEN c;
     FETCH c INTO i;
     CLOSE c;
     RETURN i;
   END;
  FUNCTION GET_KDNV_PERIOD_PRIZN
    ( pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFK_PRIZNID IN NUMBER,pFL_PAYPLACE IN NUMBER)
    RETURN  NUMBER IS
    i NUMBER;
    s NUMBER;
  BEGIN
    S:=0;
    FOR i IN 0..pFD_DATA2-pFD_DATA1 LOOP
      S:=S+GET_KDNV_PRIZN(pFD_DATA1+i,pFK_PRIZNID,pFL_PAYPLACE);
    END LOOP;
    RETURN S;
  END;
  FUNCTION GET_KDNV_PRIZN_KORP(pFD_DATAC IN DATE,pFK_PRIZN IN NUMBER,pFL_PAYPLACE IN NUMBER,pFK_KORPID IN NUMBER)
  RETURN NUMBER
   IS
    Cursor c IS
      select/*+ first_row */count(*) as fn_count
       from
       (select fk_ibid, fc_fam  from tsroky , TKARTA
       where
                     fd_data1<=pFD_DATAC
                     and fd_data3>=pFD_DATAC
                     and fk_pryb<>1
                     and fk_pryb<>3
                     and fk_pryb<>7
       AND TKARTA.FK_ID=FK_PACID AND TKARTA.FP_TEK_COC=3 AND FL_PAYPLACE = pFL_PAYPLACE and tkarta.fk_prizn=pfk_prizn AND GET_PACKORPID(FK_PACID,pFD_DATAC)=pFK_KORPID
       union
       select /*+ rule */ fk_ibid, fc_fam  from tsroky , TKARTA
       where
                     fd_data1=pFD_DATAC
                     and fd_data3>=pFD_DATAC
                     and (fk_pryb=5 or fk_pryb=6)
       AND TKARTA.FK_ID=FK_PACID AND TKARTA.FP_TEK_COC=3 AND FL_PAYPLACE = pFL_PAYPLACE and tkarta.fk_prizn=pfk_prizn AND GET_PACKORPID(FK_PACID,pFD_DATAC)=pFK_KORPID);

   i NUMBER;
   BEGIN
     OPEN c;
     FETCH c INTO i;
     CLOSE c;
     RETURN i;
   END;
  FUNCTION GET_KDNV_PERIOD_PRIZN_KORP
    ( pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFK_PRIZNID IN NUMBER,pFL_PAYPLACE IN NUMBER,pFK_KORPID IN NUMBER)
    RETURN  NUMBER IS
    i NUMBER;
    s NUMBER;
  BEGIN
    S:=0;
    FOR i IN 0..pFD_DATA2-pFD_DATA1 LOOP
      S:=S+GET_KDNV_PRIZN_KORP(pFD_DATA1+i,pFK_PRIZNID,pFL_PAYPLACE,pFK_KORPID);
    END LOOP;
    RETURN S;
  END;
  FUNCTION GET_KDNV_PRIZN_KORP_TIP(pFD_DATAC IN DATE,pFK_PRIZN IN NUMBER,pFL_PAYPLACE IN NUMBER,pFK_KORPID IN NUMBER,pFK_TIPID IN NUMBER)
  RETURN NUMBER
   IS
    Cursor c IS
      select/*+ first_row */count(*) as fn_count
       from
       (select fk_ibid, fc_fam  from tsroky , TKARTA
       where
                     fd_data1<=pFD_DATAC
                     and fd_data3>=pFD_DATAC
                     and fk_pryb<>1
                     and fk_pryb<>3
                     and fk_pryb<>7
       AND TKARTA.FK_ID=FK_PACID AND TKARTA.FP_TEK_COC=3 AND FL_PAYPLACE = pFL_PAYPLACE and tkarta.fk_prizn=pfk_prizn AND GET_PACKORPID(FK_PACID,pFD_DATAC)=pFK_KORPID AND GET_PAC_TIPROOMID(FK_PACID)=pFK_TIPID
       union
       select /*+ rule */ fk_ibid, fc_fam  from tsroky , TKARTA
       where
                     fd_data1=pFD_DATAC
                     and fd_data3>=pFD_DATAC
                     and (fk_pryb=5 or fk_pryb=6)
       AND TKARTA.FK_ID=FK_PACID AND TKARTA.FP_TEK_COC=3 AND FL_PAYPLACE = pFL_PAYPLACE and tkarta.fk_prizn=pfk_prizn AND GET_PACKORPID(FK_PACID,pFD_DATAC)=pFK_KORPID AND GET_PAC_TIPROOMID(FK_PACID)=pFK_TIPID);

   i NUMBER;
   BEGIN
     OPEN c;
     FETCH c INTO i;
     CLOSE c;
     RETURN i;
   END;
  FUNCTION GET_KDNV_PERIOD_PRIZN_KORP_TIP
    ( pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFK_PRIZNID IN NUMBER,pFL_PAYPLACE IN NUMBER,pFK_KORPID IN NUMBER,pFK_TIPID IN NUMBER)
    RETURN  NUMBER IS
    i NUMBER;
    s NUMBER;
  BEGIN
    S:=0;
    FOR i IN 0..pFD_DATA2-pFD_DATA1 LOOP
      S:=S+GET_KDNV_PRIZN_KORP_TIP(pFD_DATA1+i,pFK_PRIZNID,pFL_PAYPLACE,pFK_KORPID,pFK_TIPID);
    END LOOP;
    RETURN S;
  END;
  FUNCTION GET_KDNV_KORP(pFD_DATAC IN DATE,pFK_KORPID IN NUMBER)
  RETURN NUMBER
   IS
    Cursor c IS
      select/*+ first_row */count(*) as fn_count
       from
       (select fk_ibid, fc_fam  from tsroky , TKARTA
       where
                     fd_data1<=pFD_DATAC
                     and fd_data3>=pFD_DATAC
                     and fk_pryb<>1
                     and fk_pryb<>3
                     and fk_pryb<>7
       AND TKARTA.FK_ID=FK_PACID AND TKARTA.FP_TEK_COC=3  AND GET_PACKORPID(FK_PACID,pFD_DATAC)=pFK_KORPID
       union
       select /*+ rule */ fk_ibid, fc_fam  from tsroky , TKARTA
       where
                     fd_data1=pFD_DATAC
                     and fd_data3>=pFD_DATAC
                     and (fk_pryb=5 or fk_pryb=6)
       AND TKARTA.FK_ID=FK_PACID AND TKARTA.FP_TEK_COC=3 AND GET_PACKORPID(FK_PACID,pFD_DATAC)=pFK_KORPID);

   i NUMBER;
   BEGIN
     OPEN c;
     FETCH c INTO i;
     CLOSE c;
     RETURN i;
   END;
  FUNCTION GET_KDNV_PERIOD_KORP
    ( pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFK_KORPID IN NUMBER)
    RETURN  NUMBER IS
    i NUMBER;
    s NUMBER;
  BEGIN
    S:=0;
    FOR i IN 0..pFD_DATA2-pFD_DATA1 LOOP
      S:=S+GET_KDNV_KORP(pFD_DATA1+i,pFK_KORPID);
    END LOOP;
    RETURN S;
  END;
  FUNCTION GET_KDNV_KORP_TIP(pFD_DATAC IN DATE,pFK_KORPID IN NUMBER,pFK_TIPID IN NUMBER)
  RETURN NUMBER
   IS
    Cursor c IS
      select/*+ first_row */count(*) as fn_count
       from
       (select fk_ibid, fc_fam  from tsroky , TKARTA
       where
                     fd_data1<=pFD_DATAC
                     and fd_data3>=pFD_DATAC
                     and fk_pryb<>1
                     and fk_pryb<>3
                     and fk_pryb<>7
       AND TKARTA.FK_ID=FK_PACID AND TKARTA.FP_TEK_COC=3  AND GET_PACKORPID(FK_PACID,pFD_DATAC)=pFK_KORPID AND GET_PAC_TIPROOMID(FK_PACID)=pFK_TIPID
       union
       select /*+ rule */ fk_ibid, fc_fam  from tsroky , TKARTA
       where
                     fd_data1=pFD_DATAC
                     and fd_data3>=pFD_DATAC
                     and (fk_pryb=5 or fk_pryb=6)
       AND TKARTA.FK_ID=FK_PACID AND TKARTA.FP_TEK_COC=3 AND GET_PACKORPID(FK_PACID,pFD_DATAC)=pFK_KORPID AND GET_PAC_TIPROOMID(FK_PACID)=pFK_TIPID);

   i NUMBER;
   BEGIN
     OPEN c;
     FETCH c INTO i;
     CLOSE c;
     RETURN i;
   END;
  FUNCTION GET_KDNV_PERIOD_KORP_TIP
    ( pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFK_KORPID IN NUMBER,pFK_TIPID IN NUMBER)
    RETURN  NUMBER IS
    i NUMBER;
    s NUMBER;
  BEGIN
    S:=0;
    FOR i IN 0..pFD_DATA2-pFD_DATA1 LOOP
      S:=S+GET_KDNV_KORP_TIP(pFD_DATA1+i,pFK_KORPID,pFK_TIPID);
    END LOOP;
    RETURN S;
  END;
  FUNCTION GET_COUNT_OUT_KORP (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_KORPID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = 3
         AND GET_PACKORPID(FK_PACID,FD_DATA1)=pFK_KORPID;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
  FUNCTION GET_COUNT_OUT_KORP_TIP (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_KORPID IN NUMBER, pFK_TIPID IN NUMBER)
  RETURN NUMBER
   IS
    CURSOR c IS
      SELECT COUNT (FK_PACID)
        FROM TSROKY
       WHERE FD_DATA1 BETWEEN pFD_DATA1 AND pFD_DATA2+1-1/(24*60*60)
         AND FK_PRYB = 3
         AND GET_PACKORPID(FK_PACID,FD_DATA1)=pFK_KORPID
         AND GET_PAC_TIPROOMID(FK_PACID)=pFK_TIPID;
    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
/*####################################################################################*/
/*####################################################################################*/
/*####################################################################################*/
  FUNCTION DO_CALC_REPORT (pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFK_VRACHID IN NUMBER)
  RETURN NUMBER
   IS-- Used in rVedomost.dpr
    CURSOR cKorp IS SELECT * FROM TKORP ORDER BY FK_ID;
    CURSOR c200Tip IS
      SELECT FK_ID,FC_VID
      FROM TTIPROOM,(SELECT GET_PALATAVID(FK_ID,pFD_DATA1) AS FK_VID
                       FROM TROOM
                      WHERE FK_KORPID = 200 -- Приморский
                   GROUP BY GET_PALATAVID(FK_ID,pFD_DATA1))
      WHERE FK_ID = FK_VID
      ORDER BY 1;
    nC NUMBER;
    cC CLOB;
    str VARCHAR2(32767);
    nTemp NUMBER;
  BEGIN
    INSERT INTO TCLOBS(FC_CLOB)
         VALUES (EMPTY_CLOB())
      RETURNING FK_ID,FC_CLOB INTO nC,cC;
    DBMS_LOB.OPEN(cC,DBMS_LOB.LOB_READWRITE);

    str := PKG_HTML.GET_HEAD('excel','Сводная ведомость по санаторию "' ||PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен')||'"',
                             null,'10.0',null,
                             null,null,null,
                             null,null,null,
                             '297','210','landscape',
                             null,null,null,null,
                             null,null,null,'left',
                             null,null,null,null,
                             null,null,null);
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    str:='<BODY><DIV class=user>'||
         '<P ALIGN="CENTER">Сводная ведомость об отдохнувших (пролечившихся) в санатории "'|| PKG_SMINI.READSTRING('CONFIG','S_NAME','Не известен') ||'"<BR>'||
         'за период с '|| TO_CHAR (pFD_DATA1, 'dd.mm.yyyy') ||' по '|| TO_CHAR (pFD_DATA2, 'dd.mm.yyyy') ||'</P><BR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    str:='<TABLE>'||
         '<TR><TD ROWSPAN="4">&nbsp</TD>'||
         '<TD ROWSPAN="2" COLSPAN="3">Всего</TD>'||
         '<TD COLSPAN="6">По путевкам МЦ</TD>'||
         '<TD COLSPAN="6">По путевкам санатория</TD>'||
         '</TR>'||
         '<TD COLSPAN="3">контингент</TD>'||
         '<TD COLSPAN="3">не контингент</TD>'||
         '<TD COLSPAN="3">контингент</TD>'||
         '<TD COLSPAN="3">не контингент</TD>'||
         '<TR>'||
         '<TD>чел.</TD>'||
         '<TD>к-дней</TD>'||
         '<TD>сумма</TD>'||
         '<TD>чел.</TD>'||
         '<TD>к-дней</TD>'||
         '<TD>сумма</TD>'||
         '<TD>чел.</TD>'||
         '<TD>к-дней</TD>'||
         '<TD>сумма</TD>'||
         '<TD>чел.</TD>'||
         '<TD>к-дней</TD>'||
         '<TD>сумма</TD>'||
         '<TD>чел.</TD>'||
         '<TD>к-дней</TD>'||
         '<TD>сумма</TD>'||
         '</TR>'||
         '<TR>'||
         '<TD>1</TD>'||
         '<TD>2</TD>'||
         '<TD>3</TD>'||
         '<TD>4</TD>'||
         '<TD>5</TD>'||
         '<TD>6</TD>'||
         '<TD>7</TD>'||
         '<TD>8</TD>'||
         '<TD>9</TD>'||
         '<TD>10</TD>'||
         '<TD>11</TD>'||
         '<TD>12</TD>'||
         '<TD>13</TD>'||
         '<TD>14</TD>'||
         '<TD>15</TD>'||
         '</TR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    PROGRESS_BAR.SETSTROUT ('Подсчет общего количества отдохнувших...');
    PROGRESS_BAR.STEPIT;

    str:='<TR>'||
         '<TD><B>Всего:</B></TD>'||
         '<TD><B>'|| PKG_R_ALLFUNC.GET_COUNT_OUT(pFD_DATA1,pFD_DATA2) ||'</B></TD>'||
         '<TD><B>'|| GET_KDNV_PERIOD(pFD_DATA1,pFD_DATA2) ||'</B></TD>'||
         '<TD><B>'|| GET_COUNT_OUT_SUM(pFD_DATA1,pFD_DATA2) ||'</B></TD>'||
--
         '<TD><B>'|| GET_COUNT_OUT_KONT(pFD_DATA1,pFD_DATA2,0) ||'</B></TD>'||
         '<TD><B>'|| ( GET_KDNV_PERIOD_PRIZN(pFD_DATA1,pFD_DATA2,1,0) + GET_KDNV_PERIOD_PRIZN(pFD_DATA1,pFD_DATA2,67,0) ) ||'</B></TD>'||
         '<TD><B>'|| GET_COUNT_OUT_SUM_KONT(pFD_DATA1,pFD_DATA2,0) ||'</B></TD>'||
--
         '<TD><B>'|| GET_COUNT_OUT_NKONT(pFD_DATA1,pFD_DATA2,0) ||'</B></TD>'||
         '<TD><B>'|| GET_KDNV_PERIOD_PRIZN(pFD_DATA1,pFD_DATA2,0,0) ||'</B></TD>'||
         '<TD><B>'|| GET_COUNT_OUT_SUM_NKONT(pFD_DATA1,pFD_DATA2,0) ||'</B></TD>'||
--
         '<TD><B>'|| GET_COUNT_OUT_KONT(pFD_DATA1,pFD_DATA2,1) ||'</B></TD>'||
         '<TD><B>'|| ( GET_KDNV_PERIOD_PRIZN(pFD_DATA1,pFD_DATA2,1,1) + GET_KDNV_PERIOD_PRIZN(pFD_DATA1,pFD_DATA2,67,1) ) ||'</B></TD>'||
         '<TD><B>'|| GET_COUNT_OUT_SUM_KONT(pFD_DATA1,pFD_DATA2,1) ||'</B></TD>'||
--
         '<TD><B>'|| GET_COUNT_OUT_NKONT(pFD_DATA1,pFD_DATA2,1) ||'</B></TD>'||
         '<TD><B>'|| GET_KDNV_PERIOD_PRIZN(pFD_DATA1,pFD_DATA2,0,1) ||'</B></TD>'||
         '<TD><B>'|| GET_COUNT_OUT_SUM_NKONT(pFD_DATA1,pFD_DATA2,1) ||'</B></TD>'||
         '</TR>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);

    FOR k in cKorp LOOP
      PROGRESS_BAR.SETSTROUT ('По корпусам: '||k.FC_NAME);
      PROGRESS_BAR.STEPIT;

      str:='<TR>'||
           '<TD>'|| k.FC_NAME ||'</TD>'||
           '<TD>'|| PKG_R_ALLFUNC.RETURN_VALUE( GET_COUNT_OUT_KORP (pFD_DATA1,pFD_DATA2,k.FK_ID) ) ||'</TD>'||
           '<TD>'|| PKG_R_ALLFUNC.RETURN_VALUE( GET_KDNV_PERIOD_KORP(pFD_DATA1,pFD_DATA2,k.FK_ID) ) ||'</TD>'||
           '<TD>'|| PKG_R_ALLFUNC.RETURN_VALUE( GET_COUNT_OUT_SUM_KORP(pFD_DATA1,pFD_DATA2,k.FK_ID) ) ||'</TD>'||
  --
           '<TD>'|| PKG_R_ALLFUNC.RETURN_VALUE( GET_COUNT_OUT_KORP_KONT(pFD_DATA1,pFD_DATA2,0,k.FK_ID) ) ||'</TD>'||
           '<TD>'|| PKG_R_ALLFUNC.RETURN_VALUE( ( GET_KDNV_PERIOD_PRIZN_KORP(pFD_DATA1,pFD_DATA2,1,0,k.FK_ID) + GET_KDNV_PERIOD_PRIZN_KORP(pFD_DATA1,pFD_DATA2,67,0,k.FK_ID) ) ) ||'</TD>'||
           '<TD>'|| PKG_R_ALLFUNC.RETURN_VALUE( GET_COUNT_OUT_SUM_KORP_KONT(pFD_DATA1,pFD_DATA2,0,k.FK_ID) ) ||'</TD>'||
  --
           '<TD>'|| PKG_R_ALLFUNC.RETURN_VALUE( GET_COUNT_OUT_KORP_NKONT(pFD_DATA1,pFD_DATA2,0,k.FK_ID) ) ||'</TD>'||
           '<TD>'|| PKG_R_ALLFUNC.RETURN_VALUE( GET_KDNV_PERIOD_PRIZN_KORP(pFD_DATA1,pFD_DATA2,0,0,k.FK_ID) ) ||'</TD>'||
           '<TD>'|| PKG_R_ALLFUNC.RETURN_VALUE( GET_COUNT_OUT_SUM_KORP_NKONT(pFD_DATA1,pFD_DATA2,0,k.FK_ID) ) ||'</TD>'||
  --
           '<TD>'|| PKG_R_ALLFUNC.RETURN_VALUE( GET_COUNT_OUT_KORP_KONT(pFD_DATA1,pFD_DATA2,1,k.FK_ID) ) ||'</TD>'||
           '<TD>'|| PKG_R_ALLFUNC.RETURN_VALUE( ( GET_KDNV_PERIOD_PRIZN_KORP(pFD_DATA1,pFD_DATA2,1,1,k.FK_ID) + GET_KDNV_PERIOD_PRIZN_KORP(pFD_DATA1,pFD_DATA2,67,1,k.FK_ID) ) ) ||'</TD>'||
           '<TD>'|| PKG_R_ALLFUNC.RETURN_VALUE( GET_COUNT_OUT_SUM_KORP_KONT(pFD_DATA1,pFD_DATA2,1,k.FK_ID) ) ||'</TD>'||
  --
           '<TD>'|| PKG_R_ALLFUNC.RETURN_VALUE( GET_COUNT_OUT_KORP_NKONT(pFD_DATA1,pFD_DATA2,1,k.FK_ID) ) ||'</TD>'||
           '<TD>'|| PKG_R_ALLFUNC.RETURN_VALUE( GET_KDNV_PERIOD_PRIZN_KORP(pFD_DATA1,pFD_DATA2,0,1,k.FK_ID) ) ||'</TD>'||
           '<TD>'|| PKG_R_ALLFUNC.RETURN_VALUE( GET_COUNT_OUT_SUM_KORP_NKONT(pFD_DATA1,pFD_DATA2,1,k.FK_ID) ) ||'</TD>'||
           '</TR>';
      DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
      if k.FK_ID = 200 then
        FOR t in c200Tip LOOP
          str:='<TR>'||
               '<TD>('|| t.FC_VID ||')</TD>'||
               '<TD>'|| PKG_R_ALLFUNC.RETURN_VALUE( GET_COUNT_OUT_KORP_TIP (pFD_DATA1,pFD_DATA2,k.FK_ID,t.FK_ID) ) ||'</TD>'||
               '<TD>'|| PKG_R_ALLFUNC.RETURN_VALUE( GET_KDNV_PERIOD_KORP_TIP(pFD_DATA1,pFD_DATA2,k.FK_ID,t.FK_ID) ) ||'</TD>'||
               '<TD>'|| PKG_R_ALLFUNC.RETURN_VALUE( GET_COUNT_OUT_SUM_KORP_TIP(pFD_DATA1,pFD_DATA2,k.FK_ID,t.FK_ID) ) ||'</TD>'||
      --
               '<TD>'|| PKG_R_ALLFUNC.RETURN_VALUE( GET_COUNT_OUT_KORP_TIP_KONT(pFD_DATA1,pFD_DATA2,0,k.FK_ID,t.FK_ID) ) ||'</TD>'||
               '<TD>'|| PKG_R_ALLFUNC.RETURN_VALUE( ( GET_KDNV_PERIOD_PRIZN_KORP_TIP(pFD_DATA1,pFD_DATA2,1,0,k.FK_ID,t.FK_ID) + GET_KDNV_PERIOD_PRIZN_KORP_TIP(pFD_DATA1,pFD_DATA2,67,0,k.FK_ID,t.FK_ID) ) ) ||'</TD>'||
               '<TD>'|| PKG_R_ALLFUNC.RETURN_VALUE( GET_COUNT_OUT_SUM_KORP_TIP_K(pFD_DATA1,pFD_DATA2,0,k.FK_ID,t.FK_ID) ) ||'</TD>'||
      --
               '<TD>'|| PKG_R_ALLFUNC.RETURN_VALUE( GET_COUNT_OUT_KORP_TIP_NKONT(pFD_DATA1,pFD_DATA2,0,k.FK_ID,t.FK_ID) ) ||'</TD>'||
               '<TD>'|| PKG_R_ALLFUNC.RETURN_VALUE( GET_KDNV_PERIOD_PRIZN_KORP_TIP(pFD_DATA1,pFD_DATA2,0,0,k.FK_ID,t.FK_ID) ) ||'</TD>'||
               '<TD>'|| PKG_R_ALLFUNC.RETURN_VALUE( GET_COUNT_OUT_SUM_KORP_TIP_NK(pFD_DATA1,pFD_DATA2,0,k.FK_ID,t.FK_ID) ) ||'</TD>'||
      --
               '<TD>'|| PKG_R_ALLFUNC.RETURN_VALUE( GET_COUNT_OUT_KORP_TIP_KONT(pFD_DATA1,pFD_DATA2,1,k.FK_ID,t.FK_ID) ) ||'</TD>'||
               '<TD>'|| PKG_R_ALLFUNC.RETURN_VALUE( ( GET_KDNV_PERIOD_PRIZN_KORP_TIP(pFD_DATA1,pFD_DATA2,1,1,k.FK_ID,t.FK_ID) + GET_KDNV_PERIOD_PRIZN_KORP_TIP(pFD_DATA1,pFD_DATA2,67,1,k.FK_ID,t.FK_ID) ) ) ||'</TD>'||
               '<TD>'|| PKG_R_ALLFUNC.RETURN_VALUE( GET_COUNT_OUT_SUM_KORP_TIP_K(pFD_DATA1,pFD_DATA2,1,k.FK_ID,t.FK_ID) ) ||'</TD>'||
      --
               '<TD>'|| PKG_R_ALLFUNC.RETURN_VALUE( GET_COUNT_OUT_KORP_TIP_NKONT(pFD_DATA1,pFD_DATA2,1,k.FK_ID,t.FK_ID) ) ||'</TD>'||
               '<TD>'|| PKG_R_ALLFUNC.RETURN_VALUE( GET_KDNV_PERIOD_PRIZN_KORP_TIP(pFD_DATA1,pFD_DATA2,0,1,k.FK_ID,t.FK_ID) ) ||'</TD>'||
               '<TD>'|| PKG_R_ALLFUNC.RETURN_VALUE( GET_COUNT_OUT_SUM_KORP_TIP_NK(pFD_DATA1,pFD_DATA2,1,k.FK_ID,t.FK_ID) ) ||'</TD>'||
               '</TR>';
          DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
        END LOOP;
      end if;
    END LOOP;

    str:='</TABLE><BR><P><B>Отчет составил: _________________________'||DO_VRACHFIO(pFK_VRACHID)||'</B></P></DIV></BODY></HTML>';
    DBMS_LOB.WRITEAPPEND(cC,LENGTH(str),str);
    DBMS_LOB.CLOSE(cC);
    RETURN nC;
  END;
END;
/

SHOW ERRORS;


