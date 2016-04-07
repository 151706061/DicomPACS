DROP PACKAGE ASU.PKG_R_SPRAVKA5
/

--
-- PKG_R_SPRAVKA5  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TSROKY (Table)
--   TTIPROOM (Table)
--   GET_CURMONTHDAY (Function)
--   GET_LASTMONTHDAYS (Function)
--   GET_PACFIO (Function)
--   GET_PRODLNAL (Function)
--   GET_PRODLOPOZD (Function)
--   TKARTA (Table)
--
CREATE OR REPLACE PACKAGE ASU."PKG_R_SPRAVKA5" 
 IS
/*  CURSOR cBegin(pFD_DATA DATE)
   IS
    select count(fk_pacid)
      from tsroky
     where pFD_DATA > TRUNC(FD_DATA1)
       and pFD_DATA <= TRUNC(FD_DATA3)
       and FK_PRYB IN (2,4,5,6);*/
  CURSOR cPrybRan(pFD_DATA DATE)
   IS
    select count(t1.fk_pacid),SUM(t1.FD_DATA1-t2.FD_DATA1)
      from tsroky t1,tsroky t2
     where t1.fd_data1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)
       and t1.fk_pryb=2
       and t1.fk_pacid=t2.fk_pacid
       and t2.fk_pryb=1
       and TRUNC(t1.FD_DATA1) > TRUNC(t2.FD_DATA1);
  CURSOR cVybRan(pFD_DATA DATE)
   IS
    select count(fk_pacid),sum(fd_data2-fd_data3)
      from tsroky
     where fd_data3 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)
       and fk_vyb=3
       and TRUNC(fd_data2) > TRUNC(fd_data3);
  CURSOR cProdl(pFD_DATA DATE,nPryb NUMBER)
   IS
    select count(fk_pacid),sum(fn_kol)
      from tsroky
     where fd_data1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)
       and fk_pryb=npryb;
  CURSOR cTypePut IS SELECT * FROM TTIPROOM ORDER BY FC_VID;
/*  CURSOR cCountPut(pFD_DATA IN DATE)
   IS
    select count(distinct tputs.fc_put)
      from tputs,tsroky
     where tsroky.fk_pacid = tputs.fk_pacid
       and fd_data1 BETWEEN pFD_DATA AND pFD_DATA+1-1/(24*60*60)
       and fk_pryb=2
       AND IS_FCPUT_MORE_ZERO(FC_PUT) > 0;*/
  CURSOR cPryb(pFD_DATA DATE,nType NUMBER) IS
    SELECT GET_PACFIO(TKARTA.FK_ID) FC_FIO, fc_put, t2.fd_data1, t2.fd_data2,
           TRUNC(t1.fd_data1) - TRUNC(t2.fd_data1) fn_opozd,
           0 fn_ranee
      FROM tkarta, tsroky t1, tsroky t2
     WHERE tkarta.fk_id = t1.fk_pacid
       AND TRUNC(t1.fd_data1) = pFD_DATA
       AND t1.fk_pryb = 2
       AND t2.fk_pacid = t1.fk_pacid
       AND t2.fk_pryb = 1
       AND TRUNC(t1.fd_data1) > TRUNC(t2.fd_data1)
       AND fk_puttype = nType
     UNION ALL
    SELECT GET_PACFIO(TKARTA.FK_ID) FC_FIO, fc_put, t2.fd_data1, t2.fd_data2,
           0 fn_opozd,
           TRUNC(t2.fd_data1) - TRUNC(t1.fd_data1) fn_ranee
      FROM tkarta, tsroky t1, tsroky t2
     WHERE tkarta.fk_id = t1.fk_pacid
       AND TRUNC(t1.fd_data1) = pFD_DATA
       AND t1.fk_pryb = 2
       AND t2.fk_pacid = t1.fk_pacid
       AND t2.fk_pryb = 1
       AND TRUNC(t1.fd_data1) < TRUNC(t2.fd_data1)
       AND fk_puttype = nType
     UNION ALL
    SELECT GET_PACFIO(TKARTA.FK_ID) FC_FIO, fc_put, t2.fd_data1, t2.fd_data2,
           0 fn_opozd,
           0 fn_ranee
      FROM tkarta, tsroky t1, tsroky t2
     WHERE tkarta.fk_id = t1.fk_pacid
       AND TRUNC(t1.fd_data1) = pFD_DATA
       AND t1.fk_pryb = 2
       AND t2.fk_pacid = t1.fk_pacid
       AND t2.fk_pryb = 1
       AND TRUNC(t1.fd_data1) = TRUNC(t2.fd_data1)
       AND fk_puttype = nType
     UNION ALL
    SELECT GET_PACFIO(TKARTA.FK_ID) || ' (восст.)' FC_FIO, fc_put, t2.fd_data1, t2.fd_data2,
           TRUNC(t1.fd_data1) - TRUNC(t2.fd_data1) fn_opozd,
           0 fn_ranee
      FROM tkarta, tsroky t1, tsroky t2
     WHERE tkarta.fk_id = t1.fk_pacid
       AND TRUNC(t1.fd_data1) = pFD_DATA
       AND t1.fk_pryb = 4
       AND t2.fk_pacid = t1.fk_pacid
       AND t2.fk_pryb = 1
       AND TRUNC(t1.fd_data1) > TRUNC(t2.fd_data1)
       AND fk_puttype = nType
     UNION ALL
    SELECT GET_PACFIO(TKARTA.FK_ID) || ' (восст.)' FC_FIO, fc_put, t2.fd_data1, t2.fd_data2,
           0 fn_opozd,
           TRUNC(t2.fd_data1) - TRUNC(t1.fd_data1) fn_ranee
      FROM tkarta, tsroky t1, tsroky t2
     WHERE tkarta.fk_id = t1.fk_pacid
       AND TRUNC(t1.fd_data1) = pFD_DATA
       AND t1.fk_pryb = 4
       AND t2.fk_pacid = t1.fk_pacid
       AND t2.fk_pryb = 1
       AND TRUNC(t1.fd_data1) < TRUNC(t2.fd_data1)
       AND fk_puttype = nType
     UNION ALL
    SELECT GET_PACFIO(TKARTA.FK_ID) || ' (восст.)' FC_FIO, fc_put, t2.fd_data1, t2.fd_data2,
           0 fn_opozd,
           0 fn_ranee
      FROM tkarta, tsroky t1, tsroky t2
     WHERE tkarta.fk_id = t1.fk_pacid
       AND TRUNC(t1.fd_data1) = pFD_DATA
       AND t1.fk_pryb = 4
       AND t2.fk_pacid = t1.fk_pacid
       AND t2.fk_pryb = 1
       AND TRUNC(t1.fd_data1) = TRUNC(t2.fd_data1)
       AND fk_puttype = nType
     ORDER BY 1;
  CURSOR cVyb(pFD_DATA DATE,nType NUMBER) IS
    SELECT GET_PACFIO(TKARTA.FK_ID) FC_FIO, fc_put, t2.fd_data1, t2.fd_data2,
           TRUNC(t1.fd_data1) - TRUNC(t2.fd_data1) fn_opozd,
           t1.fd_data1 fd_pryb,
           TRUNC(t3.fd_data2) - TRUNC(t3.fd_data3) FN_VYBRANEE,
           0 fn_ranee,
           get_prodlopozd (tkarta.fk_id) AS FN_PRODLOP,
           get_prodlnal (tkarta.fk_id) AS FN_PRODLNAL,
           GET_LASTMONTHDAYS (TKARTA.fk_id) AS FN_PROSHL,
           GET_CURMONTHDAY (TKARTA.fk_id) AS FN_TEKUSH
      FROM tkarta, tsroky t1, tsroky t2, tsroky t3
     WHERE tkarta.fk_id = t1.fk_pacid
       AND t1.fk_pryb = 2
       AND t2.fk_pacid = t1.fk_pacid
       AND t2.fk_pryb = 1
       AND TRUNC(t1.fd_data1) > TRUNC(t2.fd_data1)
       AND fk_puttype = nType
       AND t3.fk_pacid = tkarta.fk_id
       AND t3.fk_vyb = 3
       AND TRUNC(t3.fd_data3) = pFD_DATA
     UNION ALL
    SELECT GET_PACFIO(TKARTA.FK_ID) FC_FIO, fc_put, t2.fd_data1, t2.fd_data2,
           0 fn_opozd,
           t1.fd_data1 fd_pryb,
           TRUNC(t3.fd_data2) - TRUNC(t3.fd_data3) FN_VYBRANEE,
           TRUNC(t2.fd_data1) - TRUNC(t1.fd_data1) fn_ranee,
           get_prodlopozd (tkarta.fk_id) AS FN_PRODLOP,
           get_prodlnal (tkarta.fk_id) AS FN_PRODLNAL,
           GET_LASTMONTHDAYS (TKARTA.fk_id) AS FN_PROSHL,
           GET_CURMONTHDAY (TKARTA.fk_id) AS FN_TEKUSH
      FROM tkarta, tsroky t1, tsroky t2, tsroky t3
     WHERE tkarta.fk_id = t1.fk_pacid
       AND t1.fk_pryb = 2
       AND t2.fk_pacid = t1.fk_pacid
       AND t2.fk_pryb = 1
       AND TRUNC(t1.fd_data1) < TRUNC(t2.fd_data1)
       AND fk_puttype = nType
       AND t3.fk_pacid = tkarta.fk_id
       AND t3.fk_vyb = 3
       AND TRUNC(t3.fd_data3) = pFD_DATA
      UNION ALL
    SELECT GET_PACFIO(TKARTA.FK_ID) FC_FIO, fc_put, t2.fd_data1, t2.fd_data2,
           0 fn_opozd,
           t1.fd_data1 fd_pryb,
           TRUNC(t3.fd_data2) - TRUNC(t3.fd_data3) FN_VYBRANEE,
           0 fn_ranee,
           get_prodlopozd (tkarta.fk_id) AS FN_PRODLOP,
           get_prodlnal (tkarta.fk_id) AS FN_PRODLNAL,
           GET_LASTMONTHDAYS (TKARTA.fk_id) AS FN_PROSHL,
           GET_CURMONTHDAY (TKARTA.fk_id) AS FN_TEKUSH
      FROM tkarta, tsroky t1, tsroky t2, tsroky t3
     WHERE tkarta.fk_id = t1.fk_pacid
       AND t1.fk_pryb = 2
       AND t2.fk_pacid = t1.fk_pacid
       AND t2.fk_pryb = 1
       AND TRUNC(t1.fd_data1) = TRUNC(t2.fd_data1)
       AND fk_puttype = nType
       AND t3.fk_pacid = tkarta.fk_id
       AND t3.fk_vyb = 3
       AND TRUNC(t3.fd_data3) = pFD_DATA
     UNION ALL
    SELECT GET_PACFIO(TKARTA.FK_ID) FC_FIO, fc_put, t2.fd_data1, t2.fd_data2,
           TRUNC(t1.fd_data1) - TRUNC(t2.fd_data1) fn_opozd,
           t1.fd_data1 fd_pryb,
           TRUNC(t3.fd_data2) - TRUNC(t3.fd_data3) FN_VYBRANEE,
           0 fn_ranee,
           get_prodlopozd (tkarta.fk_id) AS FN_PRODLOP,
           get_prodlnal (tkarta.fk_id) AS FN_PRODLNAL,
           GET_LASTMONTHDAYS (TKARTA.fk_id) AS FN_PROSHL,
           GET_CURMONTHDAY (TKARTA.fk_id) AS FN_TEKUSH
      FROM tkarta, tsroky t1, tsroky t2, tsroky t3
     WHERE tkarta.fk_id = t1.fk_pacid
       AND t1.fk_pryb = 2
       AND t2.fk_pacid = t1.fk_pacid
       AND t2.fk_pryb = 1
       AND TRUNC(t1.fd_data1) > TRUNC(t2.fd_data1)
       AND fk_puttype = nType
       AND t3.fk_pacid = tkarta.fk_id
       AND t3.fk_vyb = 7
       AND TRUNC(t3.fd_data3) = pFD_DATA
     UNION ALL
    SELECT GET_PACFIO(TKARTA.FK_ID) || ' (врем.)' FC_FIO, fc_put, t2.fd_data1, t2.fd_data2,
           0 fn_opozd,
           t1.fd_data1 fd_pryb,
           TRUNC(t3.fd_data2) - TRUNC(t3.fd_data3) FN_VYBRANEE,
           TRUNC(t2.fd_data1) - TRUNC(t1.fd_data1) fn_ranee,
           get_prodlopozd (tkarta.fk_id) AS FN_PRODLOP,
           get_prodlnal (tkarta.fk_id) AS FN_PRODLNAL,
           GET_LASTMONTHDAYS (TKARTA.fk_id) AS FN_PROSHL,
           GET_CURMONTHDAY (TKARTA.fk_id) AS FN_TEKUSH
      FROM tkarta, tsroky t1, tsroky t2, tsroky t3
     WHERE tkarta.fk_id = t1.fk_pacid
       AND t1.fk_pryb = 2
       AND t2.fk_pacid = t1.fk_pacid
       AND t2.fk_pryb = 1
       AND TRUNC(t1.fd_data1) < TRUNC(t2.fd_data1)
       AND fk_puttype = nType
       AND t3.fk_pacid = tkarta.fk_id
       AND t3.fk_vyb = 7
       AND TRUNC(t3.fd_data3) = pFD_DATA
     UNION ALL
    SELECT GET_PACFIO(TKARTA.FK_ID) ||' (врем.)' FC_FIO, fc_put, t2.fd_data1, t2.fd_data2,
           0 fn_opozd,
           t1.fd_data1 fd_pryb,
           TRUNC(t3.fd_data2) - TRUNC(t3.fd_data3) FN_VYBRANEE,
           0 fn_ranee,
           get_prodlopozd (tkarta.fk_id) AS FN_PRODLOP,
           get_prodlnal (tkarta.fk_id) AS FN_PRODLNAL,
           GET_LASTMONTHDAYS (TKARTA.fk_id) AS FN_PROSHL,
           GET_CURMONTHDAY (TKARTA.fk_id) AS FN_TEKUSH
      FROM tkarta, tsroky t1, tsroky t2, tsroky t3
     WHERE tkarta.fk_id = t1.fk_pacid
       AND t1.fk_pryb = 2
       AND t2.fk_pacid = t1.fk_pacid
       AND t2.fk_pryb = 1
       AND TRUNC(t1.fd_data1) = TRUNC(t2.fd_data1)
       AND fk_puttype = nType
       AND t3.fk_pacid = tkarta.fk_id
       AND t3.fk_vyb = 7
       AND TRUNC(t3.fd_data3) = pFD_DATA
     ORDER BY 1;
 FUNCTION DO_CALC_REPORT (pFD_DATA1 IN DATE,pFK_VRACHID IN NUMBER) RETURN NUMBER;
END;
/

SHOW ERRORS;


