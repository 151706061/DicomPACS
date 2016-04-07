DROP PACKAGE ASU.SPRAVKA5
/

--
-- SPRAVKA5  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TSROKY (Table)
--   TTIPROOM (Table)
--   GET_CURMONTHDAY (Function)
--   GET_LASTMONTHDAYS (Function)
--   GET_PRODLNAL (Function)
--   GET_PRODLOPOZD (Function)
--   TKARTA (Table)
--
CREATE OR REPLACE PACKAGE ASU."SPRAVKA5" 
  IS
  CURSOR cBegin(pFD_DATA DATE) IS select count( fk_pacid) from tsroky where pFD_DATA>FD_DATA1 and  pFD_DATA<=FD_DATA3 and FK_PRYB IN (2,4,5,6);
  CURSOR cPrybRan(pFD_DATA DATE) IS select count( t1.fk_pacid),SUM( t1.FD_DATA1-t2.FD_DATA1) from tsroky t1,tsroky t2 where t1.FD_DATA1=pFD_DATA and t1.fk_pryb=2 and t1.fk_pacid=t2.fk_pacid and t2.fk_pryb=1 and t1.FD_DATA1>t2.FD_DATA1;
  CURSOR cVybRan(pFD_DATA DATE) IS select count(fk_pacid),sum(fd_data2-fd_data3) from tsroky t1 where t1.fd_data3=pFD_DATA and t1.fk_vyb=3 and fd_data2>fd_data3;
  CURSOR cProdl(pFD_DATA DATE,nPryb NUMBER) IS select /*+rule*/count(fk_pacid),sum(fn_kol) from tsroky where fd_data1=pFD_DATA and fk_pryb=npryb;
  CURSOR cTypePut IS SELECT * FROM TTIPROOM ORDER BY FK_ID;
  CURSOR cPryb(pFD_DATA DATE,nType NUMBER) IS
    SELECT fc_fam || ' ' || SUBSTR (fc_im, 1, 1) || '. ' || SUBSTR (fc_otch, 1, 1) || '. ' FC_FIO,
           fc_put, t2.fd_data1, t2.fd_data2, t1.fd_data1 - t2.fd_data1 fn_opozd,
           0 fn_ranee
      FROM tkarta, tsroky t1, tsroky t2
     WHERE tkarta.fk_id = t1.fk_pacid
       AND t1.fd_data1 = pFD_DATA
       AND t1.fk_pryb = 2
       AND t2.fk_pacid = t1.fk_pacid
       AND t2.fk_pryb = 1
       AND t1.fd_data1 > t2.fd_data1
       AND fk_puttype = nType
    UNION
    SELECT fc_fam || ' ' || SUBSTR (fc_im, 1, 1) || '. ' || SUBSTR (fc_otch, 1, 1) || '. ' FC_FIO,
           fc_put, t2.fd_data1, t2.fd_data2, 0 fn_opozd,
           t2.fd_data1 - t1.fd_data1 fn_ranee
      FROM tkarta, tsroky t1, tsroky t2
     WHERE tkarta.fk_id = t1.fk_pacid
       AND t1.fd_data1 = pFD_DATA
       AND t1.fk_pryb = 2
       AND t2.fk_pacid = t1.fk_pacid
       AND t2.fk_pryb = 1
       AND t1.fd_data1 < t2.fd_data1
       AND fk_puttype = nType
    UNION
    SELECT fc_fam || ' ' || SUBSTR (fc_im, 1, 1) || '. ' || SUBSTR (fc_otch, 1, 1) || '. ' FC_FIO,
           fc_put, t2.fd_data1, t2.fd_data2, 0 fn_opozd, 0 fn_ranee
      FROM tkarta, tsroky t1, tsroky t2
     WHERE tkarta.fk_id = t1.fk_pacid
       AND t1.fd_data1 = pFD_DATA
       AND t1.fk_pryb = 2
       AND t2.fk_pacid = t1.fk_pacid
       AND t2.fk_pryb = 1
       AND t1.fd_data1 = t2.fd_data1
       AND fk_puttype = nType
     UNION
    SELECT fc_fam || ' ' || SUBSTR (fc_im, 1, 1) || '. ' || SUBSTR (fc_otch, 1, 1) || '. (восст.)' FC_FIO,
           fc_put, t2.fd_data1, t2.fd_data2, t1.fd_data1 - t2.fd_data1 fn_opozd,
           0 fn_ranee
      FROM tkarta, tsroky t1, tsroky t2
     WHERE tkarta.fk_id = t1.fk_pacid
       AND t1.fd_data1 = pFD_DATA
       AND t1.fk_pryb = 4
       AND t2.fk_pacid = t1.fk_pacid
       AND t2.fk_pryb = 1
       AND t1.fd_data1 > t2.fd_data1
       AND fk_puttype = nType
    UNION
    SELECT fc_fam || ' ' || SUBSTR (fc_im, 1, 1) || '. ' || SUBSTR (fc_otch, 1, 1) || '. (восст.)' FC_FIO,
           fc_put, t2.fd_data1, t2.fd_data2, 0 fn_opozd,
           t2.fd_data1 - t1.fd_data1 fn_ranee
      FROM tkarta, tsroky t1, tsroky t2
     WHERE tkarta.fk_id = t1.fk_pacid
       AND t1.fd_data1 = pFD_DATA
       AND t1.fk_pryb = 4
       AND t2.fk_pacid = t1.fk_pacid
       AND t2.fk_pryb = 1
       AND t1.fd_data1 < t2.fd_data1
       AND fk_puttype = nType
    UNION
    SELECT fc_fam || ' ' || SUBSTR (fc_im, 1, 1) || '. ' || SUBSTR (fc_otch, 1, 1) || '. (восст.)' FC_FIO,
           fc_put, t2.fd_data1, t2.fd_data2, 0 fn_opozd, 0 fn_ranee
      FROM tkarta, tsroky t1, tsroky t2
     WHERE tkarta.fk_id = t1.fk_pacid
       AND t1.fd_data1 = pFD_DATA
       AND t1.fk_pryb = 4
       AND t2.fk_pacid = t1.fk_pacid
       AND t2.fk_pryb = 1
       AND t1.fd_data1 = t2.fd_data1
       AND fk_puttype = nType
     ORDER BY 1;
    CURSOR cVyb(pFD_DATA DATE,nType NUMBER) IS
   SELECT fc_fam || ' ' || SUBSTR (fc_im, 1, 1) || '. ' || SUBSTR (fc_otch, 1, 1) || '. ' FC_FIO,
        fc_put, t2.fd_data1, t2.fd_data2, t1.fd_data1 - t2.fd_data1 fn_opozd,
        t1.fd_data1 fd_pryb, t3.fd_data2 - t3.fd_data3 FN_VYBRANEE, 0 fn_ranee,
        get_prodlopozd (tkarta.fk_id) AS FN_PRODLOP,
        get_prodlnal (tkarta.fk_id) AS FN_PRODLNAL,
        GET_LASTMONTHDAYS (TKARTA.fk_id) AS FN_PROSHL,
        GET_CURMONTHDAY (TKARTA.fk_id) AS FN_TEKUSH
   FROM tkarta, tsroky t1, tsroky t2, tsroky t3
   WHERE tkarta.fk_id = t1.fk_pacid
     AND t1.fk_pryb = 2
     AND t2.fk_pacid = t1.fk_pacid
     AND t2.fk_pryb = 1
     AND t1.fd_data1 > t2.fd_data1
     AND fk_puttype = nType
     AND t3.fk_pacid = tkarta.fk_id
     AND t3.fk_vyb = 3
     AND t3.fd_data3 = pFD_DATA
  UNION
  SELECT fc_fam || ' ' || SUBSTR (fc_im, 1, 1) || '. ' || SUBSTR (fc_otch, 1, 1) || '. ' FC_FIO,
         fc_put, t2.fd_data1, t2.fd_data2, 0 fn_opozd, t1.fd_data1 fd_pryb,
         t3.fd_data2 - t3.fd_data3 FN_VYBRANEE,
         t2.fd_data1 - t1.fd_data1 fn_ranee,
         get_prodlopozd (tkarta.fk_id) AS FN_PRODLOP,
         get_prodlnal (tkarta.fk_id) AS FN_PRODLNAL,
         GET_LASTMONTHDAYS (TKARTA.fk_id) AS FN_PROSHL,
         GET_CURMONTHDAY (TKARTA.fk_id) AS FN_TEKUSH
    FROM tkarta, tsroky t1, tsroky t2, tsroky t3
   WHERE tkarta.fk_id = t1.fk_pacid
     AND t1.fk_pryb = 2
     AND t2.fk_pacid = t1.fk_pacid
     AND t2.fk_pryb = 1
     AND t1.fd_data1 < t2.fd_data1
     AND fk_puttype = nType
     AND t3.fk_pacid = tkarta.fk_id
     AND t3.fk_vyb = 3
     AND t3.fd_data3 = pFD_DATA
  UNION
  SELECT fc_fam || ' ' || SUBSTR (fc_im, 1, 1) || '. ' || SUBSTR (fc_otch, 1, 1) ||'. ' FC_FIO,
         fc_put, t2.fd_data1, t2.fd_data2, 0 fn_opozd, t1.fd_data1 fd_pryb,
         t3.fd_data2 - t3.fd_data3 FN_VYBRANEE, 0 fn_ranee,
         get_prodlopozd (tkarta.fk_id) AS FN_PRODLOP,
         get_prodlnal (tkarta.fk_id) AS FN_PRODLNAL,
         GET_LASTMONTHDAYS (TKARTA.fk_id) AS FN_PROSHL,
         GET_CURMONTHDAY (TKARTA.fk_id) AS FN_TEKUSH
    FROM tkarta, tsroky t1, tsroky t2, tsroky t3
   WHERE tkarta.fk_id = t1.fk_pacid
     AND t1.fk_pryb = 2
     AND t2.fk_pacid = t1.fk_pacid
     AND t2.fk_pryb = 1
     AND t1.fd_data1 = t2.fd_data1
     AND fk_puttype = nType
     AND t3.fk_pacid = tkarta.fk_id
     AND t3.fk_vyb = 3
     AND t3.fd_data3 = pFD_DATA
   UNION
   SELECT fc_fam || ' ' || SUBSTR (fc_im, 1, 1) || '. ' || SUBSTR (fc_otch, 1, 1) || '. (врем.)' FC_FIO,
        fc_put, t2.fd_data1, t2.fd_data2, t1.fd_data1 - t2.fd_data1 fn_opozd,
        t1.fd_data1 fd_pryb, t3.fd_data2 - t3.fd_data3 FN_VYBRANEE, 0 fn_ranee,
        get_prodlopozd (tkarta.fk_id) AS FN_PRODLOP,
        get_prodlnal (tkarta.fk_id) AS FN_PRODLNAL,
        GET_LASTMONTHDAYS (TKARTA.fk_id) AS FN_PROSHL,
        GET_CURMONTHDAY (TKARTA.fk_id) AS FN_TEKUSH
   FROM tkarta, tsroky t1, tsroky t2, tsroky t3
   WHERE tkarta.fk_id = t1.fk_pacid
     AND t1.fk_pryb = 2
     AND t2.fk_pacid = t1.fk_pacid
     AND t2.fk_pryb = 1
     AND t1.fd_data1 > t2.fd_data1
     AND fk_puttype = nType
     AND t3.fk_pacid = tkarta.fk_id
     AND t3.fk_vyb = 7
     AND t3.fd_data3 = pFD_DATA
  UNION
  SELECT fc_fam || ' ' || SUBSTR (fc_im, 1, 1) || '. ' || SUBSTR (fc_otch, 1, 1) || '. (врем.)' FC_FIO,
         fc_put, t2.fd_data1, t2.fd_data2, 0 fn_opozd, t1.fd_data1 fd_pryb,
         t3.fd_data2 - t3.fd_data3 FN_VYBRANEE,
         t2.fd_data1 - t1.fd_data1 fn_ranee,
         get_prodlopozd (tkarta.fk_id) AS FN_PRODLOP,
         get_prodlnal (tkarta.fk_id) AS FN_PRODLNAL,
         GET_LASTMONTHDAYS (TKARTA.fk_id) AS FN_PROSHL,
         GET_CURMONTHDAY (TKARTA.fk_id) AS FN_TEKUSH
    FROM tkarta, tsroky t1, tsroky t2, tsroky t3
   WHERE tkarta.fk_id = t1.fk_pacid
     AND t1.fk_pryb = 2
     AND t2.fk_pacid = t1.fk_pacid
     AND t2.fk_pryb = 1
     AND t1.fd_data1 < t2.fd_data1
     AND fk_puttype = nType
     AND t3.fk_pacid = tkarta.fk_id
     AND t3.fk_vyb = 7
     AND t3.fd_data3 = pFD_DATA
  UNION
  SELECT fc_fam || ' ' || SUBSTR (fc_im, 1, 1) || '. ' || SUBSTR (fc_otch, 1, 1) ||'. (врем.)' FC_FIO,
         fc_put, t2.fd_data1, t2.fd_data2, 0 fn_opozd, t1.fd_data1 fd_pryb,
         t3.fd_data2 - t3.fd_data3 FN_VYBRANEE, 0 fn_ranee,
         get_prodlopozd (tkarta.fk_id) AS FN_PRODLOP,
         get_prodlnal (tkarta.fk_id) AS FN_PRODLNAL,
         GET_LASTMONTHDAYS (TKARTA.fk_id) AS FN_PROSHL,
         GET_CURMONTHDAY (TKARTA.fk_id) AS FN_TEKUSH
    FROM tkarta, tsroky t1, tsroky t2, tsroky t3
   WHERE tkarta.fk_id = t1.fk_pacid
     AND t1.fk_pryb = 2
     AND t2.fk_pacid = t1.fk_pacid
     AND t2.fk_pryb = 1
     AND t1.fd_data1 = t2.fd_data1
     AND fk_puttype = nType
     AND t3.fk_pacid = tkarta.fk_id
     AND t3.fk_vyb = 7
     AND t3.fd_data3 = pFD_DATA
  ORDER BY 1;
  FUNCTION DO_CALC_REPORT (pFD_DATA1 IN DATE,pFK_VRACHID IN NUMBER) RETURN NUMBER;
END; -- Package Specification SPRAVKA5
/

SHOW ERRORS;


