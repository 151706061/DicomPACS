DROP PACKAGE BODY ASU.PKG_SQL_LABORATORY
/

--
-- PKG_SQL_LABORATORY  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_SQL_LABORATORY" 
IS
/*----------------------------------------------------------------------------*/
  FUNCTION sql_without_zabor
    RETURN VARCHAR2
  IS
  BEGIN
    RETURN 'SELECT
       DISTINCT get_pacfio (tk.fk_id) AS fc_fio, get_ib (tk.fk_id) AS fk_ib,
                TO_CHAR (get_pacvozr (tk.fk_id)) AS fn_vozr, do_vrachfio (tv.fk_vrachid) AS fc_vrachfio,
                tk.fk_id AS fk_pacid, get_pacsex (tk.fk_id) AS fc_sex, get_pacfcpalata (tk.fk_id) AS fc_palata,
                pkg_regist_pacfunc.get_pac_fckorp(tk.fk_id) fc_korp,
                tm.fn_probe
           FROM tib, tnazan tn, tnazlech tl, tanalproc ta, tkarta tk, tvrach tv,
                (SELECT fk_pacid, fn_probe
                   FROM (SELECT tl.fk_pacid, tl.fn_probe,
                                ROW_NUMBER () OVER (PARTITION BY tl.fk_pacid ORDER BY tl.fd_regist DESC) AS rn
                           FROM (SELECT DISTINCT tk.fk_id AS fk_pacid, tr.fn_probe, tr.fd_regist
                                            FROM tib, tnazan tn, tnazlech tl, tanalproc ta, tkarta tk, tlabreg tr
                                           WHERE ta.fk_analid = tn.fk_id AND tl.fk_id = ta.fk_procid
                                                 AND tl.fk_id = tib.fk_pacid AND tk.fk_id = tn.fk_pacid
                                                 AND tr.fk_nazid = tn.fk_id
                                                 AND tib.fk_smid IN (SELECT fk_id
                                                                       FROM tsmid
                                                                      WHERE fc_synonim = ''PROBA_GEL'')) tl)
                  WHERE rn = 1) tm
          WHERE ta.fk_analid = tn.fk_id AND tl.fk_id = ta.fk_procid AND tl.fk_id = tib.fk_pacid
                AND tn.fk_nazsosid = get_nevip AND tk.fk_id = tn.fk_pacid AND tv.fk_pacid = tk.fk_id
                and tn.fk_pacid = tm.fk_pacid AND trunc(tn.fd_run) <= :FD_RUN
                AND tib.fk_smid IN (SELECT fk_id
                                      FROM tsmid
                                     WHERE fc_synonim = ''PROBA_GEL'')';
  END sql_without_zabor;
/*----------------------------------------------------------------------------*/
  FUNCTION sql_blood_map
    RETURN VARCHAR2
  IS
  BEGIN
    RETURN 'SELECT  rownum fn_rownum, fk_pacid, get_pacfio (tl.fk_pacid) AS fc_fio,
         get_ib (tl.fk_pacid) AS fk_ib,
         PKG_REGIST_PACFUNC.GET_PAC_AGE_NOW(tk.fk_id) AS fn_vozr,
         fn_probe,
         pkg_regist_pacfunc.get_pac_fckorp(tl.fk_pacid) fc_korp,
         pkg_regist_pacfunc.get_pac_fcpalata(tl.fk_pacid) fc_palata,
         get_smidname(tl.fk_smid) fc_smid,
         tk.fc_amb
    FROM (SELECT tl.fk_pacid, tl.fn_probe, tl.fk_smid, ROW_NUMBER () OVER (PARTITION BY tl.fk_pacid,tl.fk_smid ORDER BY tl.fd_regist DESC)
                                                                                                                  AS rn
            FROM (SELECT DISTINCT tr.fk_pacid, tr.fn_probe, tr.fd_regist,tl.fk_smid
                             FROM tnazan tn, tnazlech tl, tanalproc ta, tlabreg tr
                            WHERE ta.fk_analid = tn.fk_id AND tl.fk_id = ta.fk_procid AND tr.fk_nazid = tn.fk_id
                                  AND tl.fk_smid IN (SELECT fk_id
                                                       FROM tsmid
                                                      WHERE fc_synonim IN (''ZABOR_IZ_PALCA'', ''ZABOR_IZ_VENY''))) tl) tl,
         (select ''Амб.'' fc_amb, fk_id from tambulance
          union
          select ''Стац.'', fk_id from tkarta) tk
   WHERE rn = 1
     AND tk.fk_id = tl.fk_pacid
ORDER BY fn_rownum
';
  END sql_blood_map;
/*----------------------------------------------------------------------------*/
/*--------------Добавил Косов 04.05.2010 для Югорска с базы Волны-------------*/
/*----------------------------------------------------------------------------*/
  /*FUNCTION sql_blood_map
    RETURN VARCHAR2
  IS
  BEGIN
    RETURN 'SELECT  rownum fn_rownum, fk_pacid, get_pacfio (tl.fk_pacid) AS fc_fio,
         get_ib (tl.fk_pacid) AS fk_ib,
         TO_CHAR (get_pacvozr (tl.fk_pacid)) AS fn_vozr,
         fn_probe,
         pkg_regist_pacfunc.get_pac_fckorp(tl.fk_pacid) fc_korp,
         pkg_regist_pacfunc.get_pac_fcpalata(tl.fk_pacid) fc_palata,
         get_smidname(tl.fk_smid) fc_smid,
         tk.fc_amb
    FROM (SELECT tl.fk_pacid, tl.fn_probe, tl.fk_smid, ROW_NUMBER () OVER (PARTITION BY tl.fk_pacid,tl.fk_smid ORDER BY tl.fd_regist DESC)
                                                                                                                  AS rn
            FROM (SELECT DISTINCT tr.fk_pacid, tr.fn_probe, tr.fd_regist,tl.fk_smid
                             FROM tnazan tn, tnazlech tl, tanalproc ta, tlabreg tr,
                             (SELECT tl.fk_smid
                                         FROM tlab_anal_dostyp tl
                                        WHERE tl.fk_sotr = :pfk_sotr) tla
                            WHERE ta.fk_analid = tn.fk_id AND tl.fk_id = ta.fk_procid AND tr.fk_nazid = tn.fk_id
                                  AND tla.fk_smid = tn.fk_smid
                                  AND tl.fk_smid IN (SELECT fk_id
                                                       FROM tsmid
                                                      WHERE fc_synonim IN (''ZABOR_IZ_PALCA'', ''ZABOR_IZ_VENY''))) tl) tl,
         (select ''Амб.'' fc_amb, fk_id from tambulance
          union
          select ''Стац.'', fk_id from tkarta) tk
   WHERE rn = 1
     AND tk.fk_id = tl.fk_pacid
ORDER BY fn_rownum
';
  END sql_blood_map;*/   --из базы санаторской(Волны)
/*----------------------------------------------------------------------------*/
  FUNCTION sql_fregistry_without_zabor
    RETURN VARCHAR2
  IS
  BEGIN
    RETURN 'SELECT  DISTINCT get_pacfio (tk.fk_id) AS fc_fio, get_ib (tk.fk_id) AS fk_ib, TO_CHAR (get_pacvozr (tk.fk_id))
                                                                                                             AS fn_vozr,
                do_vrachfio (tv.fk_vrachid) AS fc_vrachfio, tk.fk_id AS fk_pacid, get_pacsex (tk.fk_id) AS fc_sex,
                get_pacfcpalata (tk.fk_id) AS fc_palata, pkg_regist_pacfunc.get_pac_fckorp (tk.fk_id) fc_korp,
                tm.fn_probe
           FROM tnazan tn, tkarta tk, tvrach tv,
                (SELECT fk_pacid, fn_probe
                   FROM (SELECT tl.fk_pacid, tl.fn_probe,
                                ROW_NUMBER () OVER (PARTITION BY tl.fk_pacid ORDER BY tl.fd_regist DESC) AS rn
                           FROM (SELECT DISTINCT tk.fk_id AS fk_pacid, tr.fn_probe, tr.fd_regist
                                            FROM tib, tnazan tn, tnazlech tl, tanalproc ta, tkarta tk, tlabreg tr
                                           WHERE ta.fk_analid = tn.fk_id AND tl.fk_id = ta.fk_procid
                                                 AND tl.fk_id = tib.fk_pacid AND tk.fk_id = tn.fk_pacid
                                                 AND tr.fk_nazid = tn.fk_id
                                                 AND tib.fk_smid IN (SELECT fk_id
                                                                       FROM tsmid
                                                                      WHERE fc_synonim = ''PROBA_GEL'')) tl)
                  WHERE rn = 1) tm
          WHERE tn.fk_nazsosid = get_nevip AND tv.fl_vid = ''M''
                AND fl_vyb <> 1 AND tk.fk_id = tn.fk_pacid AND tv.fk_pacid = tk.fk_id
                AND tn.fk_pacid = tm.fk_pacid AND TRUNC (tn.fd_run) <= :fd_run
                AND tn.fk_smid IN (SELECT     fk_id
                                         FROM tsmid
                                        WHERE LEVEL < 4 AND fk_id NOT IN (57007, 57066, 95730)
                                          AND fk_id in (select tl.fk_smid
                                                          from tlab_anal_dostyp tl
                                                         where tl.fk_sotr = :pfk_sotr)
                                   START WITH fc_synonim = ''ANAL_IMUNOLOG''
                                   CONNECT BY PRIOR fk_id = fk_owner)';
  END sql_fregistry_without_zabor;

/*----------------------------------------------------------------------------*/
  FUNCTION sql_fregistry_prescription
    RETURN VARCHAR2
  IS
  BEGIN
    RETURN 'SELECT  DISTINCT get_pacfio (tkarta.fk_id) AS fc_fio, get_ib (tkarta.fk_id) AS fk_ib,
                get_pacvozr (tkarta.fk_id) AS fn_vozr, do_vrachfio (tvrach.fk_vrachid) AS fc_vrachfio,
                tkarta.fk_id AS fk_pacid, get_pacsex (tkarta.fk_id) AS fc_sex,
                get_pacfcpalata (tkarta.fk_id) AS fc_palata, pkg_regist_pacfunc.get_pac_fckorp (tkarta.fk_id) fc_korp
           FROM tkarta, (SELECT DISTINCT fk_pacid fk_vpacid
                                    FROM tnazan
                                   WHERE fk_nazsosid = get_nevip), tnazan, tvrach,
                                   (SELECT tl.fk_smid
                                         FROM tlab_anal_dostyp tl
                                        WHERE tl.fk_sotr = :pfk_sotr) tl
          WHERE tkarta.fk_id = fk_vpacid AND tvrach.fk_pacid = tkarta.fk_id AND tvrach.fl_vid = ''M'' AND fl_vyb <> 1
                AND tnazan.fk_pacid = fk_vpacid AND TRUNC (fd_run) <= :fd_run AND fk_nazsosid = get_nevip
                AND tnazan.fk_smid = tl.fk_smid';
  END sql_fregistry_prescription;

/*----------------------------------------------------------------------------*/
  FUNCTION sql_fregistry_all
    RETURN VARCHAR2
  IS
  BEGIN
    RETURN 'SELECT  DISTINCT    get_pacfio(tkarta.fk_id) AS fc_fio,
                            get_ib(tkarta.fk_id) AS fk_ib,
                            get_pacvozr(tkarta.fk_id) AS fn_vozr,
                            do_vrachfio(tvrach.fk_vrachid) AS fc_vrachfio,
                            tkarta.fk_id AS fk_pacid,
                            get_pacsex(tkarta.fk_id) AS fc_sex,
                            pkg_regist_pacfunc.get_pac_fckorp(tkarta.fk_id) fc_korp,
                            get_pacfcpalata(tkarta.fk_id) AS fc_palata
                          FROM
                            tkarta,
                            tvrach
                          WHERE
                            tvrach.fk_pacid=tkarta.fk_id
                            AND tvrach.fl_vid=''M''
                            AND fl_vyb<>1';
  END sql_fregistry_all;



/*----------------------------------------------------------------------------*/
  FUNCTION sql_sotr_fio
    RETURN VARCHAR2
  IS
  BEGIN
    RETURN 'select fk_id,fc_fam||'' ''
                   ||nvl2(fc_name,substr(fc_name,1,1)||''.'','''')||'' ''
                   ||nvl2(fc_otch,substr(fc_otch,1,1)||''.'','''')  as fc_fio
              from tsotr
          order by  fc_fam
';
  END sql_sotr_fio;

/*----------------------------------------------------------------------------*/
  FUNCTION sql_anal_tree
    RETURN VARCHAR2
  IS
  BEGIN
    RETURN 'SELECT     fk_id, fc_name, pkg_laboratory.is_can_view(fk_id,:pfk_sotr) fl_show,fk_owner
              FROM tsmid
             WHERE LEVEL < 5
               and fl_showanal < 3
        START WITH fc_synonim = ''RAZ_ANAL''
        CONNECT BY PRIOR fk_id = fk_owner
';
  END sql_anal_tree;

/*----------------------------------------------------------------------------*/
  FUNCTION sql_fregistpac_naz
    RETURN VARCHAR2
  IS
  BEGIN
    RETURN 'SELECT   TO_CHAR (tnazan.fd_run, ''dd.mm.yyyy'') fd_run, tnazan.fk_id, get_fullpath (tnazan.fk_smid) fc_nazan,
         get_nazpay_before (tnazan.fk_id) AS popl, get_nazpay (tnazan.fk_id) AS opl
    FROM tnazan, tsmid, (SELECT tl.fk_smid
                           FROM tlab_anal_dostyp tl
                          WHERE tl.fk_sotr = :pfk_sotr) tla
   WHERE tnazan.fk_pacid = :fk_pacid AND tnazan.fk_nazsosid = 2 AND TRUNC (tnazan.fd_run) <= :fd_run
         AND tsmid.fk_id = tnazan.fk_smid AND tla.fk_smid = tnazan.fk_smid
ORDER BY fc_nazan
';
  END sql_fregistpac_naz;

/*----------------------------------------------------------------------------*/
  FUNCTION sql_finfotoday
    RETURN VARCHAR2
  IS
  BEGIN
    RETURN 'select get_fullpath(tnazan.fk_smid) fc_naz,FN_PROBE,FK_NAZID,tlabreg.FK_PACID
from tlabreg,tnazan,(SELECT tl.fk_smid
                           FROM tlab_anal_dostyp tl
                          WHERE tl.fk_sotr = :pfk_sotr) tla
where tlabreg.fk_pacid=:fk_pacid and trunc(fd_regist)=:fd_regist
  AND tnazan.fk_id = tlabreg.fk_nazid
  AND tla.fk_smid = tnazan.fk_smid
';
  END sql_finfotoday;


/*----------------------------------------------------------------------------*/
  FUNCTION sql_fnazan
    RETURN VARCHAR2
  IS
  BEGIN
    RETURN 'SELECT   fc_name, fk_id, fk_owner, fl_showanal, -1 fn_order,
                     (select count(*)
                        from tnazan nn
                       where nn.fk_smid = tsmid.fk_id
                         --and fl_ins = 1
                         and nn.fk_pacid = :pPacid
                         and nn.fk_vrachid = :pfk_sotr) img,
                     '''' fc_comment, 0 fn_length
    FROM tsmid
   WHERE fk_id = get_synid (''RAZ_ANAL'')
UNION
SELECT t.*,NVL(TLAB_REAGENT.fc_comment,'''') fc_comment, length(TLAB_REAGENT.fc_comment) from
(SELECT     tsmid.fc_name, tsmid.fk_id, get_owner (tsmid.fk_id) fk_owner,
           tsmid.fl_showanal, get_order (tsmid.fk_id),
           (select count(*)
              from tnazan nn
             where nn.fk_smid = tsmid.fk_id
               --and fl_ins = 1
               and nn.fk_pacid = :pPacid
               and nn.fk_vrachid = :pfk_sotr) img
      FROM tsmid
     WHERE tsmid.fl_showanal IN (1, 2, 3)
       AND pkg_laboratory.is_can_view (tsmid.fk_id, :pfk_sotr) = 1

START WITH fk_owner = get_synid (''RAZ_ANAL'')
CONNECT BY PRIOR fk_id = fk_owner) T, TLAB_REAGENT
    where TLAB_REAGENT.fk_smid(+)= t.fk_id
  ORDER BY fn_order
';
  END sql_fnazan;

/*----------------------------------------------------------------------------*/
  FUNCTION sql_farch_anal
    RETURN VARCHAR2
  IS
  BEGIN -- by TimurLan: все как и было...
    RETURN '
SELECT FC_NAME, FK_ID, FK_OWNER, FL_SHOWANAL, -1 FN_ORDER
  FROM TSMID
 WHERE FK_ID = GET_ANALID
 UNION
SELECT FC_NAME,
       FK_ID,
       GET_OWNER(FK_ID) FK_OWNER,
       FL_SHOWANAL,
       GET_ORDER(FK_ID)
  FROM TSMID
 WHERE FL_SHOWANAL IN (1, 2, 3) AND
       PKG_LABORATORY.IS_CAN_VIEW(TSMID.FK_ID, :pFK_SOTR) = 1
 START WITH FK_OWNER = GET_ANALID
CONNECT BY PRIOR FK_ID = FK_OWNER
 ORDER BY FN_ORDER
';
  END sql_farch_anal;

/*----------------------------------------------------------------------------*/
  FUNCTION sql_fzakl_nevip
    RETURN VARCHAR2
  IS
  BEGIN
    RETURN 'SELECT fk_pacid, get_pacfio (fk_pacid) fc_fio, decode(is_ambulance (fk_pacid),0,''Стац.'',1,''Амб.'') fc_type, pkg_regist_pacfunc.get_pac_fckorp (fk_pacid) fc_korp
    FROM (SELECT
                 DISTINCT fk_pacid
                     FROM tnazan, (SELECT DISTINCT fd_regist, fk_nazid
                                              FROM tlabreg
                                             WHERE fd_regist <= :fd_regist) tlabr,
                                             (SELECT tl.fk_smid
                           FROM tlab_anal_dostyp tl
                          WHERE tl.fk_sotr = :pfk_sotr) tla
                    WHERE tnazan.fk_id = tlabr.fk_nazid AND fk_nazsosid = 4
                      AND tla.fk_smid = tnazan.fk_smid)
   WHERE is_ambulance (fk_pacid) in (0,1)
';
  END sql_fzakl_nevip;

/*----------------------------------------------------------------------------*/
  FUNCTION sql_fzakl_all
    RETURN VARCHAR2
  IS
  BEGIN
    RETURN 'SELECT   fk_pacid, get_pacfio (fk_pacid) fc_fio, DECODE (is_ambulance (fk_pacid), 0, ''Сан.'', 1,''Амб.'') fc_type,
         pkg_regist_pacfunc.get_pac_fckorp (fk_pacid) fc_korp
    FROM (SELECT DISTINCT fk_pacid
                     FROM tnazan, (SELECT DISTINCT fd_regist, fk_nazid
                                              FROM tlabreg
                                             WHERE fd_regist <= :fd_regist) tlabr
                    WHERE tnazan.fk_id = tlabr.fk_nazid)
    WHERE is_ambulance (fk_pacid) in (0,1)
';
  END sql_fzakl_all;
/*----------------------------------------------------------------------------*/
  FUNCTION sql_feditzakl
    RETURN VARCHAR2
  IS
  BEGIN
    RETURN 'SELECT   tlabreg.ROWID, tlabreg.fk_nazid, tnazan.fk_smid, get_fullpath (get_smidfromnaz (tlabreg.fk_nazid)) fc_name,
         tlabreg.fn_probe, tnazsos.fc_name fk_nazsosid, tlabreg.fk_naprid naprid, tnazan.fd_naz, tnazan.fd_run,
         tsmid.fn_order
    FROM tlabreg, tnazan, tnazsos, tsmid, (SELECT tl.fk_smid
                                             FROM tlab_anal_dostyp tl
                                            WHERE tl.fk_sotr = :pfk_sotr) tla
   WHERE tnazan.fk_id = tlabreg.fk_nazid AND tnazsos.fk_id = tnazan.fk_nazsosid AND tlabreg.fk_pacid = :fk_pacid
         AND tlabreg.fd_regist <= :fd_ins AND tsmid.fk_id = tnazan.fk_smid AND tla.fk_smid = tnazan.fk_smid
ORDER BY fn_order
';
  END sql_feditzakl;
/*----------------------------------------------------------------------------*/
  FUNCTION sql_fchoosezaklprint
    RETURN VARCHAR2
  IS
  BEGIN
    RETURN 'SELECT
         fk_nazid, get_fullpath (fk_vsmid) fc_name, fn_probe, fk_nazsosid, TO_DATE (fd_run, ''dd.mm.yyyy'') fd_date
    FROM (SELECT DISTINCT get_smidfromnaz (fk_nazid) fk_vsmid, fk_nazid, fn_probe
                     FROM tlabreg
                    WHERE fk_pacid = :fk_pacid), tnazan, (SELECT tl.fk_smid
                                                            FROM tlab_anal_dostyp tl
                                                           WHERE tl.fk_sotr = :pfk_sotr) tla
   WHERE fk_id = fk_nazid AND fk_nazsosid = get_vipnaz
     AND tla.fk_smid = tnazan.fk_smid
ORDER BY fd_date, fn_probe
';
  END sql_fchoosezaklprint;
/*----------------------------------------------------------------------------*/
  FUNCTION sql_farch
    RETURN VARCHAR2
  IS
  BEGIN -- by TimurLan: НЕ МЕНЯТЬ! - РАБОТАЕТ КРАН!!! (см сорцы unit fArch.pas)
    RETURN '
SELECT /*+ rule*/
       PKG_REGIST_PEPLFUNC.GET_PEPL_FULLFIO(FK_PEPLID) FC_FIO,
       PKG_REGIST_PEPLFUNC.GET_PEPL_SEXLITER(FK_PEPLID) FC_SEX,
       PKG_REGIST_PEPLFUNC.GET_PEPL_AGE_DATE(FK_PEPLID,FD_INS) FN_VOZR,
       (SELECT GET_TOWN(FK_TOWNID) FROM TADRESS WHERE TADRESS.FK_ID = PKG_REGIST_PEPLFUNC.GET_PEPL_ADRID(FK_PEPLID)) AS FC_TOWN,
       --PKG_REGIST_PEPLFUNC.GET_PEPL_ADRFULL(FK_PEPLID) FC_ADDRFULL,
       (SELECT GET_PACCOMPANY_DOLGNOST(FK_DOLGNOST)||'' ''||FC_RABOTA FROM TPEOPLES WHERE TPEOPLES.FK_ID=FK_PEPLID) FC_RABOTA,
       PKG_REGIST_PEPLFUNC.GET_PEPL_FCGROUP(FK_PEPLID,1) FC_GROUP,
       PKG_REGIST_PEPLFUNC.GET_PEPL_INSURANCE(FK_PEPLID) FC_POLIS,
       T666.*
  FROM (
SELECT TRESAN.FK_ID,
       TNAZAN.FK_PACID,
       NVL(TKARTA.FK_PEPLID,TAMBULANCE.FK_PEPLID) FK_PEPLID,
       DECODE(TKARTA.FK_ID,null,''АМБ'',''САН'') FC_AS,
       CASE WHEN FC_RES IS NULL THEN
          CASE WHEN FK_BLOBID IS NOT NULL THEN
            GET_NAME_FROM_SMID(FK_BLOBID)
          ELSE
            TO_CHAR(FN_RES, ''FM9G999G999G990D00'', ''NLS_NUMERIC_CHARACTERS = '''', '''' '') END
       ELSE FC_RES END FC_RES,
       GET_NAME_FROM_SMID(TRESAN.FK_SMID) FC_ISSL,
       FK_PATID,
       TNAZAN.FD_NAZ FD_INS,
       TRESAN.FD_INS FD_OUT,
       (SELECT FN_ED FROM TSMID WHERE FK_ID = TRESAN.FK_SMID) FN_ED,
       (SELECT FN_PRICE FROM TSMID WHERE FK_ID = TRESAN.FK_SMID) FN_SUM
  FROM TRESAN,
       (SELECT FK_ID, FK_SMID, FD_NAZ, FK_PACID
          FROM TNAZAN
         WHERE FK_SMID = :PK_ID AND FK_NAZSOSID = GET_VIPNAZ) TNAZAN, TKARTA, TAMBULANCE
 WHERE TRESAN.FK_NAZID = TNAZAN.FK_ID /*AND TRESAN.FL_ZAKL = 1*/
   AND TKARTA.FK_ID(+) = TNAZAN.FK_PACID
   AND TAMBULANCE.FK_ID(+) = TNAZAN.FK_PACID) T666
 ';
  END sql_farch;
/*----------------------------------------------------------------------------*/
END;
/

SHOW ERRORS;


