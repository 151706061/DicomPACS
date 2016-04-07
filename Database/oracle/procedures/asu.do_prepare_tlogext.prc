DROP PROCEDURE ASU.DO_PREPARE_TLOGEXT
/

--
-- DO_PREPARE_TLOGEXT  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TAPPSOTR (Table)
--   TSOTR (Synonym)
--   TVIDDOC (Table)
--   TCOMPANY (Table)
--   TDIAG (Table)
--   TLOG (Table)
--   TLOGEXTADRESS (Table)
--   TLOGEXTDIAG (Table)
--   TLOGEXTINSURDOCS (Table)
--   TLOGEXTNAZ (Table)
--   TLOGEXTPAC (Table)
--   TLOGEXTTALON (Table)
--   TADRESS (Table)
--   TAMBTALON (Table)
--   TAMBULANCE (Table)
--   TINSURDOCS (Table)
--   TPEOPLES (Table)
--   TSMID (Table)
--   GET_COMPANY_SHORTNAME (Function)
--   GET_FULLPATH_SHA (Function)
--   GET_KLADR_ADDR_BY_ID (Function)
--   GET_MKB10_FROM_TSMID (Function)
--   GET_NAME_FROM_SMID (Function)
--   GET_NAZSOS (Function)
--   GET_PACCOMPANY_DOLGNOST (Function)
--   GET_PACCOMPANY_OTDEL (Function)
--   GET_TYPEDOCNAME (Function)
--   DO_VRACHFIO (Function)
--   TKARTA (Table)
--   VNAZ (Table)
--
CREATE OR REPLACE PROCEDURE ASU.do_prepare_tlogext(pFC_FAM_FILTER    in varchar2,
                                                   pFC_IM_FILTER     in varchar2,
                                                   pFC_OTCH_FILTER   in varchar2,
                                                   pFD_ROJD_FILTER   in varchar2,
                                                   pFK_IBID_FILTER   in NUMBER,
                                                   pFK_IBY_FILTER    in NUMBER,
                                                   pFK_SOTRID_FILTER in number,
                                                   pFC_ACTION_FILTER in varchar2,
                                                   pFD_BEGIN_FILTER  in date,
                                                   pFD_END_FILTER    in date,
                                                   pFC_TABLE_FILTER  in varchar2,
                                                   pFC_PAC_TYPE      in number) is
--pragma autonomous_transaction;

  pFD_DATE  date;
  pFK_OWNER number;
  pFC_USER  varchar2(4000);

  pFC_FAM  VARCHAR2(4000);
  pFC_IM   VARCHAR2(4000);
  pFC_OTCH VARCHAR2(4000);
  pFD_ROJD DATE;

  pFC_ISPOL_OLD VARCHAR2(4000);
  pFD_NAZ_OLD   DATE;
  pFD_RUN_OLD   DATE;
  pFC_NAME_OLD  VARCHAR2(4000);
  pFC_SOS_OLD   VARCHAR2(4000);
  pFC_DIAGN_OLD VARCHAR2(4000);
  pFC_DIAGP_OLD VARCHAR2(4000);
  pFC_DIAGS_OLD VARCHAR2(4000);
  pFC_DIAGZ_OLD VARCHAR2(4000);
  pFC_ISPOL_NEW VARCHAR2(4000);
  pFD_NAZ_NEW   DATE;
  pFD_RUN_NEW   DATE;
  pFC_NAME_NEW  VARCHAR2(4000);
  pFC_SOS_NEW   VARCHAR2(4000);
  pFC_DIAGN_NEW VARCHAR2(4000);
  pFC_DIAGP_NEW VARCHAR2(4000);
  pFC_DIAGS_NEW VARCHAR2(4000);
  pFC_DIAGZ_NEW VARCHAR2(4000);

  pFC_SER_OLD       VARCHAR2(4000);
  pFC_NUM_OLD       VARCHAR2(4000);
  pFD_BEGIN_OLD     DATE;
  pFD_END_OLD       DATE;
  pFD_PROLONG_OLD   DATE;
  pFK_COMPANYID_OLD VARCHAR2(4000);
  pFK_TYPEDOCID_OLD VARCHAR2(4000);
  pFC_SER_NEW       VARCHAR2(4000);
  pFC_NUM_NEW       VARCHAR2(4000);
  pFD_BEGIN_NEW     DATE;
  pFD_END_NEW       DATE;
  pFD_PROLONG_NEW   DATE;
  pFK_COMPANYID_NEW VARCHAR2(4000);
  pFK_TYPEDOCID_NEW VARCHAR2(4000);


  pFK_SMDIAGID_OLD VARCHAR2(4000);
  pFP_TYPE_OLD     VARCHAR2(4000);
  pFL_FIRST_OLD    VARCHAR2(4000);
  pFC_WRITE_OLD    VARCHAR2(3000);
  pFD_DATE_OLD     DATE;
  pFK_VRACHID_OLD  VARCHAR2(4000);
  pFL_MAIN_OLD     VARCHAR2(4000);

  pFK_SMDIAGID_NEW VARCHAR2(4000);
  pFP_TYPE_NEW     VARCHAR2(4000);
  pFL_FIRST_NEW    VARCHAR2(4000);
  pFC_WRITE_NEW    VARCHAR2(3000);
  pFD_DATE_NEW     DATE;
  pFK_VRACHID_NEW  VARCHAR2(4000);
  pFL_MAIN_NEW     VARCHAR2(4000);




  pFD_OPENED_OLD          DATE;
  pFN_SOS_OLD             VARCHAR2(4000);
  pFK_DIAGMAIN_OLD        VARCHAR2(4000);
  pFK_INSURANCEID_OLD     VARCHAR2(4000);
  pFK_RESULT_OLD          VARCHAR2(4000);
  pFK_DOPISHODID_OLD      VARCHAR2(4000);
  pFK_DIAGMAINPRED_OLD    VARCHAR2(4000);
  pFD_NAPRDATE_OLD        DATE;
  pFC_NAPRNUM_OLD         VARCHAR2(4000);
  pFC_TALON_COMMENT_OLD   VARCHAR2(4000);

  pFD_OPENED_NEW          DATE;
  pFN_SOS_NEW             VARCHAR2(4000);
  pFK_DIAGMAIN_NEW       VARCHAR2(4000);
  pFK_INSURANCEID_NEW     VARCHAR2(4000);
  pFK_RESULT_NEW         VARCHAR2(4000);
  pFK_DOPISHODID_NEW      VARCHAR2(4000);
  pFK_DIAGMAINPRED_NEW    VARCHAR2(4000);
  pFD_NAPRDATE_NEW        DATE;
  pFC_NAPRNUM_NEW        VARCHAR2(4000);
  pFC_TALON_COMMENT_NEW   VARCHAR2(4000);



  pFC_ADR_OLD               VARCHAR2(4000);
  pFK_KLADR_OLD             VARCHAR2(4000);
  pFC_HOUSE_OLD             VARCHAR2(4000);
  pFC_KVARTIRA_OLD          VARCHAR2(4000);
  pFC_KORPUS_OLD            VARCHAR2(4000);

  pFC_ADR_NEW               VARCHAR2(4000);
  pFK_KLADR_NEW             VARCHAR2(4000);
  pFC_HOUSE_NEW             VARCHAR2(4000);
  pFC_KVARTIRA_NEW          VARCHAR2(4000);
  pFC_KORPUS_NEW            VARCHAR2(4000);


  pFC_FAM_OLD                   VARCHAR2(4000);
  pFC_IM_OLD                    VARCHAR2(4000);
  pFC_OTCH_OLD                  VARCHAR2(4000);
  pFD_ROJD_OLD                  VARCHAR2(4000);
  pFP_SEX_OLD                   VARCHAR2(4000);
  pFK_DOCVID_OLD                VARCHAR2(4000);
  pFC_DOCSER_OLD                VARCHAR2(4000);
  pFC_DOCNUM_OLD                VARCHAR2(4000);
  pFD_DOCDATE_OLD               date;
  pFC_DOCVIDAN_OLD              VARCHAR2(4000);
  
  pFC_RABOTA_OLD                VARCHAR2(4000);
  pFK_WORK_COMPANYID_OLD        VARCHAR2(4000);
  pFK_OTDEL_OLD                 VARCHAR2(4000);
  pFK_DOLGNOST_OLD              VARCHAR2(4000);
    
  pFC_FAM_NEW                    VARCHAR2(4000);
  pFC_IM_NEW                     VARCHAR2(4000);
  pFC_OTCH_NEW                   VARCHAR2(4000);
  pFD_ROJD_NEW                   VARCHAR2(4000);
  pFP_SEX_NEW                    VARCHAR2(4000);
  pFK_DOCVID_NEW                 VARCHAR2(4000);
  pFC_DOCSER_NEW                 VARCHAR2(4000);
  pFC_DOCNUM_NEW                 VARCHAR2(4000);
  pFD_DOCDATE_NEW                date;
  pFC_DOCVIDAN_NEW               VARCHAR2(4000);
  
  pFC_RABOTA_NEW                  VARCHAR2(4000);
  pFK_WORK_COMPANYID_NEW          VARCHAR2(4000);
  pFK_OTDEL_NEW                   VARCHAR2(4000);
  pFK_DOLGNOST_NEW                VARCHAR2(4000);




  pFC_ACTION    VARCHAR2(4000);
  pFC_IDENT VARCHAR2(4000);











  pcount_to_commit number := 0;


  cursor cGET_FIO_ROJD_PEPL(pFK_ID in number) is
   Select FC_FAM, FC_IM, FC_OTCH, FD_ROJD
     from ASU.TPEOPLES
    where FK_ID = pFK_ID;

  cursor cGET_FIO_ROJD_AMB(pFK_ID in number) is
   Select FC_FAM, FC_IM, FC_OTCH, FD_ROJD
     from ASU.TAMBULANCE
    where FK_ID = pFK_ID;

  cursor cGET_FIO_ROJD_STAC(pFK_ID in number) is
   Select FC_FAM, FC_IM, FC_OTCH, FD_ROJD
     from ASU.TKARTA
    where FK_ID = pFK_ID;

-------------------------------
-------------------------------  Назначения для амбулаторных
-------------------------------
 cursor cNazAmb is
    select *
      from (select TLOG.*,
                   TSMID.FC_NAME as FC_IDENT,
                   TAMBULANCE.FC_FAM,
                   TAMBULANCE.FC_IM,
                   TAMBULANCE.FC_OTCH,
                   TAMBULANCE.FD_ROJD,

                   /*(select */TSOTR.FC_FAM || ' ' || TSotr.FC_NAME || ' ' ||
                           TSotr.FC_OTCH /*
                      from LOGIN.Tappsotr, ASU.TSotr
                     where TSotr.Fk_Id = TAppsotr.fk_sotrid
                       and tappsotr.FK_ID = tlog.FN_USERID)*/ as FC_USER
              from ASU.TLOG, asu.VNAZ, ASU.TAMBULANCE,LOGIN.Tappsotr, ASU.TSotr, ASU.TSMID
             where TLOG.FC_TABLE = pFC_TABLE_FILTER
               and NVL(TLOG.FC_OLD, 'NULLVALUE') <>
                   NVL(TLOG.FC_NEW, 'NULLVALUE')
               and VNAZ.FK_PACID = TAMBULANCE.FK_ID
               and VNAZ.FK_SMID = TSMID.FK_ID
               and TSotr.Fk_Id = TAppsotr.fk_sotrid
               and tappsotr.FK_ID = tlog.FN_USERID
               and TLOG.FD_LOGONTIME between pFD_BEGIN_FILTER and
                   pFD_END_FILTER
               and VNAZ.FK_ID = TLOG.FK_OWNER
               and ( TSotr.Fk_Id = pFK_SOTRID_FILTER or
                   pFK_SOTRID_FILTER is NULL)
               and (pFC_ACTION_FILTER IS NULL or
                   TLOG.Fc_Action = pFC_ACTION_FILTER)
               and (TAMBULANCE.Fc_fam like pFC_FAM_FILTER || '%' or
                   TAMBULANCE.Fc_fam is NULL)
               and (TAMBULANCE.Fc_im like pFC_IM_FILTER || '%' or
                   TAMBULANCE.Fc_im is NULL)
               and (TAMBULANCE.Fc_otch like pFC_OTCH_FILTER || '%' or
                   TAMBULANCE.Fc_otch is NULL)
               and (TAmbulance.Fd_Rojd = pFD_ROJD_FILTER or
                   pFD_ROJD_FILTER IS NULL)
               and (TAMBULANCE.FK_IBID = pFK_IBID_FILTER or
                   pFK_IBID_FILTER is NULL)
               and (TAMBULANCE.FK_IBY = pFK_IBY_FILTER or
                   pFK_IBY_FILTER is NULL)
            union all
            select TLOG.*,'' as FC_IDENT,
                   '' as FC_FAM,
                   '' as FC_IM,
                   '' as FC_OTCH,
                   NULL as FD_ROJD,
                   /*(select */TSOTR.FC_FAM || ' ' || TSotr.FC_NAME || ' ' ||
                           TSotr.FC_OTCH
                      /*from LOGIN.Tappsotr, ASU.TSotr
                     where TSotr.Fk_Id = TAppsotr.fk_sotrid
                       and tappsotr.FK_ID = tlog.FN_USERID)*/ as FC_USER
              from ASU.TLOG,
                   LOGIN.Tappsotr, ASU.TSotr,
                   (select DISTINCT FK_OWNER
                      from ASU.TLOG, ASU.Tambulance,LOGIN.Tappsotr, ASU.TSotr
                     where (TAMBULANCE.Fc_fam like pFC_FAM_FILTER || '%' or
                           TAMBULANCE.Fc_fam is NULL)
                       and (TAMBULANCE.Fc_im like pFC_IM_FILTER || '%' or
                           TAMBULANCE.Fc_im is NULL)
                       and (TAMBULANCE.Fc_otch like pFC_OTCH_FILTER || '%' or
                           TAMBULANCE.Fc_otch is NULL)
                       and (TAmbulance.Fd_Rojd = pFD_ROJD_FILTER or
                           pFD_ROJD_FILTER IS NULL)
                       and (TAMBULANCE.FK_IBID = pFK_IBID_FILTER or
                           pFK_IBID_FILTER is NULL)
                       and (TAMBULANCE.FK_IBY = pFK_IBY_FILTER or
                           pFK_IBY_FILTER is NULL)
                       and TO_CHAR(TAMBULANCE.FK_ID) = TLOG.FC_OLD
                       and TLOG.FC_FIELD = 'FK_PACID'
                       and TLOG.FC_ACTION = 'DELETE'
                       and TLOG.FC_TABLE = pFC_TABLE_FILTER
                       and TSotr.Fk_Id = TAppsotr.fk_sotrid
                       and tappsotr.FK_ID = tlog.FN_USERID
                       and ( TSotr.Fk_Id = pFK_SOTRID_FILTER or
                           pFK_SOTRID_FILTER IS NULL)
                       and TLOG.FD_LOGONTIME between pFD_BEGIN_FILTER and
                           pFD_END_FILTER) TLOGOWNER
             where TLOG.FC_TABLE = pFC_TABLE_FILTER
               and TLOG.FK_OWNER = TLOGOWNER.FK_OWNER
             --  and TO_CHAR(TAMBULANCE.FK_ID) = TLOG.FC_OLD
               and TSotr.Fk_Id = TAppsotr.fk_sotrid
               and tappsotr.FK_ID = tlog.FN_USERID
              -- and TLOG.FC_FIELD = 'FK_PACID'
               and TLOG.FC_TABLE = pFC_TABLE_FILTER
               and TLOG.FD_LOGONTIME between pFD_BEGIN_FILTER and
                   pFD_END_FILTER
               and (TLOG.FN_USERID = pFK_SOTRID_FILTER or
                   pFK_SOTRID_FILTER is NULL)
               and TLOG.FC_ACTION = 'DELETE'
               and ((pFC_ACTION_FILTER IS NULL) or (pFC_ACTION_FILTER = 'DELETE'))
             ) T
     order by FK_OWNER, FD_LOGONTIME, FN_USERID;
-------------------------------
-------------------------------  Назначения для Стационарных
-------------------------------
 cursor cNazStac is
    select *
      from (select TLOG.*,TSMID.FC_NAME as FC_IDENT,
                   TAMBULANCE.FC_FAM,
                   TAMBULANCE.FC_IM,
                   TAMBULANCE.FC_OTCH,
                   TAMBULANCE.FD_ROJD,
                   /*(select */TSOTR.FC_FAM || ' ' || TSotr.FC_NAME || ' ' ||
                           TSotr.FC_OTCH /*
                      from LOGIN.Tappsotr, ASU.TSotr
                     where TSotr.Fk_Id = TAppsotr.fk_sotrid
                       and tappsotr.FK_ID = tlog.FN_USERID)*/ as FC_USER
              from ASU.TLOG, asu.VNAZ, ASU.TKARTA TAMBULANCE,LOGIN.Tappsotr, ASU.TSotr, ASU.TSMID
             where TLOG.FC_TABLE = pFC_TABLE_FILTER
               and NVL(TLOG.FC_OLD, 'NULLVALUE') <>
                   NVL(TLOG.FC_NEW, 'NULLVALUE')
               and VNAZ.FK_PACID = TAMBULANCE.FK_ID
               and TSotr.Fk_Id = TAppsotr.fk_sotrid
               and VNAZ.FK_SMID = TSMID.FK_ID
               and tappsotr.FK_ID = tlog.FN_USERID
               and TLOG.FD_LOGONTIME between pFD_BEGIN_FILTER and
                   pFD_END_FILTER
               and VNAZ.FK_ID = TLOG.FK_OWNER
               and ( TSotr.Fk_Id = pFK_SOTRID_FILTER or
                   pFK_SOTRID_FILTER is NULL)
               and (pFC_ACTION_FILTER IS NULL or
                   TLOG.Fc_Action = pFC_ACTION_FILTER)
               and (TAMBULANCE.Fc_fam like pFC_FAM_FILTER || '%' or
                   TAMBULANCE.Fc_fam is NULL)
               and (TAMBULANCE.Fc_im like pFC_IM_FILTER || '%' or
                   TAMBULANCE.Fc_im is NULL)
               and (TAMBULANCE.Fc_otch like pFC_OTCH_FILTER || '%' or
                   TAMBULANCE.Fc_otch is NULL)
               and (TAmbulance.Fd_Rojd = pFD_ROJD_FILTER or
                   pFD_ROJD_FILTER IS NULL)
               and (TAMBULANCE.FK_IBID = pFK_IBID_FILTER or
                   pFK_IBID_FILTER is NULL)
               and (TAMBULANCE.FK_IBY = pFK_IBY_FILTER or
                   pFK_IBY_FILTER is NULL)
            union all
            select TLOG.*,'' as FC_IDENT,
                   '' as FC_FAM,
                   '' as FC_IM,
                   '' as FC_OTCH,
                   NULL as FD_ROJD,
                   /*(select */TSOTR.FC_FAM || ' ' || TSotr.FC_NAME || ' ' ||
                           TSotr.FC_OTCH
                      /*from LOGIN.Tappsotr, ASU.TSotr
                     where TSotr.Fk_Id = TAppsotr.fk_sotrid
                       and tappsotr.FK_ID = tlog.FN_USERID)*/ as FC_USER
              from ASU.TLOG,
                   LOGIN.Tappsotr, ASU.TSotr,
                   (select DISTINCT FK_OWNER
                      from ASU.TLOG, ASU.TKARTA  Tambulance,LOGIN.Tappsotr, ASU.TSotr
                     where (TAMBULANCE.Fc_fam like pFC_FAM_FILTER || '%' or
                           TAMBULANCE.Fc_fam is NULL)
                       and (TAMBULANCE.Fc_im like pFC_IM_FILTER || '%' or
                           TAMBULANCE.Fc_im is NULL)
                       and (TAMBULANCE.Fc_otch like pFC_OTCH_FILTER || '%' or
                           TAMBULANCE.Fc_otch is NULL)
                       and (TAmbulance.Fd_Rojd = pFD_ROJD_FILTER or
                           pFD_ROJD_FILTER IS NULL)
                       and (TAMBULANCE.FK_IBID = pFK_IBID_FILTER or
                           pFK_IBID_FILTER is NULL)
                       and (TAMBULANCE.FK_IBY = pFK_IBY_FILTER or
                           pFK_IBY_FILTER is NULL)
                       and TO_CHAR(TAMBULANCE.FK_ID) = TLOG.FC_OLD
                       and TLOG.FC_FIELD = 'FK_PACID'
                       and TLOG.FC_ACTION = 'DELETE'
                       and TLOG.FC_TABLE = pFC_TABLE_FILTER
                       and TSotr.Fk_Id = TAppsotr.fk_sotrid
                       and tappsotr.FK_ID = tlog.FN_USERID
                       and ( TSotr.Fk_Id = pFK_SOTRID_FILTER or
                           pFK_SOTRID_FILTER IS NULL)
                       and TLOG.FD_LOGONTIME between pFD_BEGIN_FILTER and
                           pFD_END_FILTER) TLOGOWNER
             where TLOG.FC_TABLE = pFC_TABLE_FILTER
               and TLOG.FK_OWNER = TLOGOWNER.FK_OWNER
              -- and TO_CHAR(TAMBULANCE.FK_ID) = TLOG.FC_OLD
               and TSotr.Fk_Id = TAppsotr.fk_sotrid
               and tappsotr.FK_ID = tlog.FN_USERID
            --   and TLOG.FC_FIELD = 'FK_PACID'
               and TLOG.FC_TABLE = pFC_TABLE_FILTER
               and TLOG.FD_LOGONTIME between pFD_BEGIN_FILTER and
                   pFD_END_FILTER
               and (TLOG.FN_USERID = pFK_SOTRID_FILTER or
                   pFK_SOTRID_FILTER is NULL)
               and TLOG.FC_ACTION = 'DELETE'
               and ((pFC_ACTION_FILTER IS NULL) or (pFC_ACTION_FILTER = 'DELETE'))) T
     order by FK_OWNER, FD_LOGONTIME, FN_USERID;
-------------------------------
-------------------------------  Полиса
-------------------------------
 cursor cPolis is
    select *
      from (select TLOG.*,TINSURDOCS.Fc_Num as FC_IDENT,
                   TPEOPLES.FC_FAM,
                   TPEOPLES.FC_IM,
                   TPEOPLES.FC_OTCH,
                   TPEOPLES.FD_ROJD,
                   TSOTR.FC_FAM ||' '|| TSotr.FC_NAME ||' '||TSotr.FC_OTCH as FC_USER
              from ASU.TLOG, asu.TINSURDOCS, ASU.TPEOPLES,LOGIN.Tappsotr, ASU.TSotr, ASU.TCOMPANY
             where TLOG.FC_TABLE = pFC_TABLE_FILTER
               and NVL(TLOG.FC_OLD, 'NULLVALUE') <>
                   NVL(TLOG.FC_NEW, 'NULLVALUE')
               and TINSURDOCS.FK_PEPLID = TPEOPLES.FK_ID
               and TSotr.Fk_Id = TAppsotr.fk_sotrid
               and TINSURDOCS.FK_COMPANYID = TCOMPANY.FK_ID
               and tappsotr.FK_ID = tlog.FN_USERID
               and TLOG.FD_LOGONTIME between pFD_BEGIN_FILTER and
                   pFD_END_FILTER
               and TINSURDOCS.FK_ID = TLOG.FK_OWNER
               and ( TSotr.Fk_Id = pFK_SOTRID_FILTER or
                   pFK_SOTRID_FILTER is NULL)
               and (pFC_ACTION_FILTER IS NULL or
                   TLOG.Fc_Action = pFC_ACTION_FILTER)
               and (TPEOPLES.Fc_fam like pFC_FAM_FILTER || '%' or
                   TPEOPLES.Fc_fam is NULL)
               and (TPEOPLES.Fc_im like pFC_IM_FILTER || '%' or
                   TPEOPLES.Fc_im is NULL)
               and (TPEOPLES.Fc_otch like pFC_OTCH_FILTER || '%' or
                   TPEOPLES.Fc_otch is NULL)
               and (TPEOPLES.Fd_Rojd = pFD_ROJD_FILTER or
                   pFD_ROJD_FILTER IS NULL)
            union all
            select TLOG.*,'' as FC_IDENT,
                   '' as FC_FAM,
                   '' as FC_IM,
                   '' as FC_OTCH,
                   NULL as FD_ROJD,
                   TSOTR.FC_FAM || ' ' || TSotr.FC_NAME || ' ' || TSotr.FC_OTCH as FC_USER
              from ASU.TLOG,
                   LOGIN.Tappsotr, ASU.TSotr,
                   (select DISTINCT FK_OWNER
                      from ASU.TLOG, ASU.TPeoples,LOGIN.Tappsotr, ASU.TSotr
                     where (TPEOPLES.Fc_fam like pFC_FAM_FILTER || '%' or
                            TPEOPLES.Fc_fam is NULL)
                       and (TPEOPLES.Fc_im like pFC_IM_FILTER || '%' or
                            TPEOPLES.Fc_im is NULL)
                       and (TPEOPLES.Fc_otch like pFC_OTCH_FILTER || '%' or
                            TPEOPLES.Fc_otch is NULL)
                       and (TPEOPLES.Fd_Rojd = pFD_ROJD_FILTER or
                           pFD_ROJD_FILTER IS NULL)
                       and TO_CHAR(TPEOPLES.FK_ID) = TLOG.FC_OLD
                       and TLOG.FC_FIELD = 'FK_PEPELID'
                       and TLOG.FC_ACTION = 'DELETE'
                       and TLOG.FC_TABLE = pFC_TABLE_FILTER
                       and TSotr.Fk_Id = TAppsotr.fk_sotrid
                       and tappsotr.FK_ID = tlog.FN_USERID
                       and (TSotr.Fk_Id = pFK_SOTRID_FILTER or
                           pFK_SOTRID_FILTER IS NULL)
                       and TLOG.FD_LOGONTIME between pFD_BEGIN_FILTER and pFD_END_FILTER) TLOGOWNER
             where TLOG.FC_TABLE = pFC_TABLE_FILTER
               and TLOG.FK_OWNER = TLOGOWNER.FK_OWNER
               and TSotr.Fk_Id = TAppsotr.fk_sotrid
               and tappsotr.FK_ID = tlog.FN_USERID
               and TLOG.FC_TABLE = pFC_TABLE_FILTER
               and TLOG.FD_LOGONTIME between pFD_BEGIN_FILTER and
                   pFD_END_FILTER
               and (TLOG.FN_USERID = pFK_SOTRID_FILTER or pFK_SOTRID_FILTER is NULL)
               and TLOG.FC_ACTION = 'DELETE'
               and ((pFC_ACTION_FILTER IS NULL) or (pFC_ACTION_FILTER = 'DELETE'))) T
     order by FK_OWNER, FD_LOGONTIME, FN_USERID;
---
--- Диагнозы амбулатория
---
 cursor cDiagAmb is
 select *
      from (select TLOG.*,TSMID.FK_MKB10 as FC_IDENT,
                   TAMBULANCE.FC_FAM,
                   TAMBULANCE.FC_IM,
                   TAMBULANCE.FC_OTCH,
                   TAMBULANCE.FD_ROJD,
                   TSOTR.FC_FAM ||' '|| TSotr.FC_NAME ||' '||TSotr.FC_OTCH as FC_USER
              from ASU.TLOG, asu.TDIAG, ASU.TAMBULANCE,LOGIN.Tappsotr, ASU.TSotr, ASU.TSMID
             where TLOG.FC_TABLE = 'TDIAG'
               and  (TAMBULANCE.Fc_fam like pFC_FAM_FILTER || '%' or TAMBULANCE.Fc_fam is NULL)
               and (TAMBULANCE.Fc_im like pFC_IM_FILTER || '%' or TAMBULANCE.Fc_im is NULL)
               and (TAMBULANCE.Fc_otch like pFC_OTCH_FILTER || '%' or TAMBULANCE.Fc_otch is NULL)
               and (TAmbulance.Fd_Rojd = pFD_ROJD_FILTER or pFD_ROJD_FILTER IS NULL)
               and (TAMBULANCE.FK_IBID = pFK_IBID_FILTER or pFK_IBID_FILTER is NULL)
               and (TAMBULANCE.FK_IBY = pFK_IBY_FILTER or pFK_IBY_FILTER is NULL)
               and NVL(TLOG.FC_OLD, 'NULLVALUE') <> NVL(TLOG.FC_NEW, 'NULLVALUE')
               and TDIAG.FK_PACID = TAMBULANCE.FK_ID
               and TSotr.Fk_Id = TAppsotr.fk_sotrid
               and (TLOG.FN_USERID = pFK_SOTRID_FILTER or pFK_SOTRID_FILTER is NULL)
               and TDIAG.FK_SMDIAGID = TSMID.FK_ID
               and (pFC_ACTION_FILTER IS NULL or TLOG.Fc_Action = pFC_ACTION_FILTER)
               and tappsotr.FK_ID = tlog.FN_USERID
               and TLOG.FD_LOGONTIME between pFD_BEGIN_FILTER and pFD_END_FILTER
               and TDIAG.FK_ID = TLOG.FK_OWNER
            union all
            select TLOG.*,'' as FC_IDENT,
                   '' as FC_FAM,
                   '' as FC_IM,
                   '' as FC_OTCH,
                   NULL as FD_ROJD,
                   TSOTR.FC_FAM || ' ' || TSotr.FC_NAME || ' ' || TSotr.FC_OTCH as FC_USER
              from ASU.TLOG,
                   LOGIN.Tappsotr, ASU.TSotr,
                   (select DISTINCT FK_OWNER
                      from ASU.TLOG, ASU.TAMBULANCE,LOGIN.Tappsotr, ASU.TSotr
                     where
                       TO_CHAR(TAMBULANCE.FK_ID) = TLOG.FC_OLD
                       and (TAMBULANCE.Fc_fam like pFC_FAM_FILTER || '%' or TAMBULANCE.Fc_fam is NULL)
                       and (TAMBULANCE.Fc_im like pFC_IM_FILTER || '%' or TAMBULANCE.Fc_im is NULL)
                       and (TAMBULANCE.Fc_otch like pFC_OTCH_FILTER || '%' or TAMBULANCE.Fc_otch is NULL)
                       and (TAmbulance.Fd_Rojd = pFD_ROJD_FILTER or pFD_ROJD_FILTER IS NULL)
                       and (TAMBULANCE.FK_IBID = pFK_IBID_FILTER or pFK_IBID_FILTER is NULL)
                       and (TAMBULANCE.FK_IBY = pFK_IBY_FILTER or pFK_IBY_FILTER is NULL)
                       and TLOG.FC_FIELD = 'FK_PACID'
                       and TLOG.FC_TABLE = 'TDIAG'
                       and TLOG.FC_ACTION = 'DELETE'
                       and (TLOG.FN_USERID = pFK_SOTRID_FILTER or pFK_SOTRID_FILTER is NULL)
                       and TSotr.Fk_Id = TAppsotr.fk_sotrid
                       and tappsotr.FK_ID = tlog.FN_USERID
                       and TLOG.FD_LOGONTIME between pFD_BEGIN_FILTER and pFD_END_FILTER ) TLOGOWNER
             where TLOG.FC_TABLE = 'TDIAG'
               and TLOG.FK_OWNER = TLOGOWNER.FK_OWNER
              and (TLOG.FN_USERID = pFK_SOTRID_FILTER or pFK_SOTRID_FILTER is NULL)
               and TSotr.Fk_Id = TAppsotr.fk_sotrid
               and tappsotr.FK_ID = tlog.FN_USERID
               and TLOG.FC_TABLE = 'TDIAG'
               and TLOG.FD_LOGONTIME between pFD_BEGIN_FILTER and pFD_END_FILTER
               and TLOG.FC_ACTION = 'DELETE'
               and ((pFC_ACTION_FILTER IS NULL) or (pFC_ACTION_FILTER = 'DELETE'))
            ) T
     order by FK_OWNER, FD_LOGONTIME, FN_USERID;


cursor cDiagStac is
 select *
      from (select TLOG.*,TSMID.FK_MKB10 as FC_IDENT,
                   TKARTA.FC_FAM,
                   TKARTA.FC_IM,
                   TKARTA.FC_OTCH,
                   TKARTA.FD_ROJD,
                   TSOTR.FC_FAM ||' '|| TSotr.FC_NAME ||' '||TSotr.FC_OTCH as FC_USER
              from ASU.TLOG, asu.TDIAG, ASU.TKARTA,LOGIN.Tappsotr, ASU.TSotr, ASU.TSMID
             where TLOG.FC_TABLE = 'TDIAG'
               and (pFC_ACTION_FILTER IS NULL or TLOG.Fc_Action = pFC_ACTION_FILTER)
               and (TKARTA.Fc_fam like pFC_FAM_FILTER || '%' or TKARTA.Fc_fam is NULL)
               and (TKARTA.Fc_im like pFC_IM_FILTER || '%' or TKARTA.Fc_im is NULL)
               and (TKARTA.Fc_otch like pFC_OTCH_FILTER || '%' or TKARTA.Fc_otch is NULL)
               and (TKARTA.Fd_Rojd = pFD_ROJD_FILTER or pFD_ROJD_FILTER IS NULL)
               and (TKARTA.FK_IBID = pFK_IBID_FILTER or pFK_IBID_FILTER is NULL)
               and (TKARTA.FK_IBY = pFK_IBY_FILTER or pFK_IBY_FILTER is NULL)
               and NVL(TLOG.FC_OLD, 'NULLVALUE') <> NVL(TLOG.FC_NEW, 'NULLVALUE')
               and TDIAG.FK_PACID = TKARTA.FK_ID
               and TSotr.Fk_Id = TAppsotr.fk_sotrid
               and (TLOG.FN_USERID = pFK_SOTRID_FILTER or pFK_SOTRID_FILTER is NULL)
               and TDIAG.FK_SMDIAGID = TSMID.FK_ID
               and tappsotr.FK_ID = tlog.FN_USERID
               and TLOG.FD_LOGONTIME between pFD_BEGIN_FILTER and pFD_END_FILTER
               and TDIAG.FK_ID = TLOG.FK_OWNER
            union all
            select TLOG.*,'' as FC_IDENT,
                   '' as FC_FAM,
                   '' as FC_IM,
                   '' as FC_OTCH,
                   NULL as FD_ROJD,
                   TSOTR.FC_FAM || ' ' || TSotr.FC_NAME || ' ' || TSotr.FC_OTCH as FC_USER
              from ASU.TLOG,
                   LOGIN.Tappsotr, ASU.TSotr,
                   (select DISTINCT FK_OWNER
                      from ASU.TLOG, ASU.TKARTA,LOGIN.Tappsotr, ASU.TSotr
                     where
                       TO_CHAR(TKARTA.FK_ID) = TLOG.FC_OLD
                       and (TKARTA.Fc_fam like pFC_FAM_FILTER || '%' or TKARTA.Fc_fam is NULL)
                       and (TKARTA.Fc_im like pFC_IM_FILTER || '%' or TKARTA.Fc_im is NULL)
                       and (TKARTA.Fc_otch like pFC_OTCH_FILTER || '%' or TKARTA.Fc_otch is NULL)
                       and (TKARTA.Fd_Rojd = pFD_ROJD_FILTER or pFD_ROJD_FILTER IS NULL)
                       and (TKARTA.FK_IBID = pFK_IBID_FILTER or pFK_IBID_FILTER is NULL)
                       and (TKARTA.FK_IBY = pFK_IBY_FILTER or pFK_IBY_FILTER is NULL)
                       and TLOG.FC_FIELD = 'FK_PACID'
                       and TLOG.FC_TABLE = 'TDIAG'
                       and TLOG.FC_ACTION = 'DELETE'
                       and (TLOG.FN_USERID = pFK_SOTRID_FILTER or pFK_SOTRID_FILTER is NULL)
                       and TSotr.Fk_Id = TAppsotr.fk_sotrid
                       and tappsotr.FK_ID = tlog.FN_USERID
                       and TLOG.FD_LOGONTIME between pFD_BEGIN_FILTER and pFD_END_FILTER ) TLOGOWNER
             where TLOG.FC_TABLE = 'TDIAG'
               and TLOG.FK_OWNER = TLOGOWNER.FK_OWNER
               and (TLOG.FN_USERID = pFK_SOTRID_FILTER or pFK_SOTRID_FILTER is NULL)
               and TSotr.Fk_Id = TAppsotr.fk_sotrid
               and tappsotr.FK_ID = tlog.FN_USERID
               and TLOG.FC_TABLE = 'TDIAG'
               and TLOG.FD_LOGONTIME between pFD_BEGIN_FILTER and pFD_END_FILTER
               and TLOG.FC_ACTION = 'DELETE'
               and ((pFC_ACTION_FILTER IS NULL) or (pFC_ACTION_FILTER = 'DELETE'))
            ) T
     order by FK_OWNER, FD_LOGONTIME, FN_USERID;

---
--- Талоны для амбулаторных
---
cursor cTalonAmb is
select *
      from (select TLOG.*,TO_CHAR(TAMBTALON.FD_OPENED,'DD.MM.YYYY') as FC_IDENT,
                   TAMBULANCE.FC_FAM,
                   TAMBULANCE.FC_IM,
                   TAMBULANCE.FC_OTCH,
                   TAMBULANCE.FD_ROJD,
                   TSOTR.FC_FAM ||' '|| TSotr.FC_NAME ||' '||TSotr.FC_OTCH as FC_USER
              from ASU.TLOG, asu.TAMBTALON, ASU.TAMBULANCE,LOGIN.Tappsotr, ASU.TSotr
             where TLOG.FC_TABLE = 'TAMBTALON'
               and NVL(TLOG.FC_OLD, 'NULLVALUE') <>
                   NVL(TLOG.FC_NEW, 'NULLVALUE')
               and TAMBTALON.FK_AMBID = TAMBULANCE.FK_ID
               and (pFC_ACTION_FILTER IS NULL or TLOG.Fc_Action = pFC_ACTION_FILTER)
               and (TAMBULANCE.Fc_fam like pFC_FAM_FILTER || '%' or TAMBULANCE.Fc_fam is NULL)
               and (TAMBULANCE.Fc_im like pFC_IM_FILTER || '%' or TAMBULANCE.Fc_im is NULL)
               and (TAMBULANCE.Fc_otch like pFC_OTCH_FILTER || '%' or TAMBULANCE.Fc_otch is NULL)
               and (TAmbulance.Fd_Rojd = pFD_ROJD_FILTER or pFD_ROJD_FILTER IS NULL)
               and (TAMBULANCE.FK_IBID = pFK_IBID_FILTER or pFK_IBID_FILTER is NULL)
               and (TAMBULANCE.FK_IBY = pFK_IBY_FILTER or pFK_IBY_FILTER is NULL)
               and TSotr.Fk_Id = TAppsotr.fk_sotrid
               and (TLOG.FN_USERID = pFK_SOTRID_FILTER or pFK_SOTRID_FILTER is NULL)
               and tappsotr.FK_ID = tlog.FN_USERID
               and TLOG.FD_LOGONTIME between pFD_BEGIN_FILTER and pFD_END_FILTER
               and TAMBTALON.FK_ID = TLOG.FK_OWNER
            union all
            select TLOG.*,'' as FC_IDENT,
                   '' as FC_FAM,
                   '' as FC_IM,
                   '' as FC_OTCH,
                   NULL as FD_ROJD,
                   TSOTR.FC_FAM || ' ' || TSotr.FC_NAME || ' ' || TSotr.FC_OTCH as FC_USER
              from ASU.TLOG,
                   LOGIN.Tappsotr, ASU.TSotr,
                   (select DISTINCT FK_OWNER
                      from ASU.TLOG, ASU.TAMBULANCE,LOGIN.Tappsotr, ASU.TSotr
                     where
                       TO_CHAR(TAMBULANCE.FK_ID) = TLOG.FC_OLD
                       and TLOG.FC_FIELD = 'FK_AMBID'
                       and TLOG.FC_TABLE = 'TAMBTALON'
                       and TLOG.FC_ACTION = 'DELETE'
                       and (TAMBULANCE.Fc_fam like pFC_FAM_FILTER || '%' or TAMBULANCE.Fc_fam is NULL)
                       and (TAMBULANCE.Fc_im like pFC_IM_FILTER || '%' or TAMBULANCE.Fc_im is NULL)
                       and (TAMBULANCE.Fc_otch like pFC_OTCH_FILTER || '%' or TAMBULANCE.Fc_otch is NULL)
                       and (TAmbulance.Fd_Rojd = pFD_ROJD_FILTER or pFD_ROJD_FILTER IS NULL)
                       and (TAMBULANCE.FK_IBID = pFK_IBID_FILTER or pFK_IBID_FILTER is NULL)
                       and (TAMBULANCE.FK_IBY = pFK_IBY_FILTER or pFK_IBY_FILTER is NULL)
                       and TSotr.Fk_Id = TAppsotr.fk_sotrid
                       and (TLOG.FN_USERID = pFK_SOTRID_FILTER or pFK_SOTRID_FILTER is NULL)
                       and tappsotr.FK_ID = tlog.FN_USERID
                       and TLOG.FD_LOGONTIME between pFD_BEGIN_FILTER and pFD_END_FILTER ) TLOGOWNER
             where TLOG.FC_TABLE = 'TAMBTALON'
               and TLOG.FK_OWNER = TLOGOWNER.FK_OWNER
               and TSotr.Fk_Id = TAppsotr.fk_sotrid
               and tappsotr.FK_ID = tlog.FN_USERID
               and (TLOG.FN_USERID = pFK_SOTRID_FILTER or pFK_SOTRID_FILTER is NULL)
               and TLOG.FC_TABLE = 'TDIAG'
               and TLOG.FD_LOGONTIME between pFD_BEGIN_FILTER and pFD_END_FILTER
               and TLOG.FC_ACTION = 'TAMBTALON'
               and TLOG.FC_ACTION = 'DELETE'
               and ((pFC_ACTION_FILTER IS NULL) or (pFC_ACTION_FILTER = 'DELETE'))
               ) T
     order by FK_OWNER, FD_LOGONTIME, FN_USERID;

cursor cTalonStac is
select *
      from (select TLOG.*,TO_CHAR(TAMBTALON.FD_OPENED,'DD.MM.YYYY') as FC_IDENT,
                   TKARTA.FC_FAM,
                   TKARTA.FC_IM,
                   TKARTA.FC_OTCH,
                   TKARTA.FD_ROJD,
                   TSOTR.FC_FAM ||' '|| TSotr.FC_NAME ||' '||TSotr.FC_OTCH as FC_USER
              from ASU.TLOG, asu.TAMBTALON, ASU.TKARTA,LOGIN.Tappsotr, ASU.TSotr
             where TLOG.FC_TABLE = 'TAMBTALON'
               and NVL(TLOG.FC_OLD, 'NULLVALUE') <>
                   NVL(TLOG.FC_NEW, 'NULLVALUE')
               and TAMBTALON.FK_AMBID = TKARTA.FK_ID
               and (pFC_ACTION_FILTER IS NULL or TLOG.Fc_Action = pFC_ACTION_FILTER)
               and (TKARTA.Fc_fam like pFC_FAM_FILTER || '%' or TKARTA.Fc_fam is NULL)
               and (TKARTA.Fc_im like pFC_IM_FILTER || '%' or TKARTA.Fc_im is NULL)
               and (TKARTA.Fc_otch like pFC_OTCH_FILTER || '%' or TKARTA.Fc_otch is NULL)
               and (TKARTA.Fd_Rojd = pFD_ROJD_FILTER or pFD_ROJD_FILTER IS NULL)
               and (TKARTA.FK_IBID = pFK_IBID_FILTER or pFK_IBID_FILTER is NULL)
               and (TKARTA.FK_IBY = pFK_IBY_FILTER or pFK_IBY_FILTER is NULL)
               and TSotr.Fk_Id = TAppsotr.fk_sotrid
               and (TLOG.FN_USERID = pFK_SOTRID_FILTER or pFK_SOTRID_FILTER is NULL)
               and tappsotr.FK_ID = tlog.FN_USERID
               and TLOG.FD_LOGONTIME between pFD_BEGIN_FILTER and pFD_END_FILTER
               and TAMBTALON.FK_ID = TLOG.FK_OWNER
            union all
            select TLOG.*,'' as FC_IDENT,
                   '' as FC_FAM,
                   '' as FC_IM,
                   '' as FC_OTCH,
                   NULL as FD_ROJD,
                   TSOTR.FC_FAM || ' ' || TSotr.FC_NAME || ' ' || TSotr.FC_OTCH as FC_USER
              from ASU.TLOG,
                   LOGIN.Tappsotr, ASU.TSotr,
                   (select DISTINCT FK_OWNER
                      from ASU.TLOG, ASU.TKARTA,LOGIN.Tappsotr, ASU.TSotr
                     where
                       TO_CHAR(TKARTA.FK_ID) = TLOG.FC_OLD
                       and TLOG.FC_FIELD = 'FK_AMBID'
                       and TLOG.FC_TABLE = 'TAMBTALON'
                       and TLOG.FC_ACTION = 'DELETE'
                       and (TKARTA.Fc_fam like pFC_FAM_FILTER || '%' or TKARTA.Fc_fam is NULL)
                       and (TKARTA.Fc_im like pFC_IM_FILTER || '%' or TKARTA.Fc_im is NULL)
                       and (TKARTA.Fc_otch like pFC_OTCH_FILTER || '%' or TKARTA.Fc_otch is NULL)
                       and (TKARTA.Fd_Rojd = pFD_ROJD_FILTER or pFD_ROJD_FILTER IS NULL)
                       and (TKARTA.FK_IBID = pFK_IBID_FILTER or pFK_IBID_FILTER is NULL)
                       and (TKARTA.FK_IBY = pFK_IBY_FILTER or pFK_IBY_FILTER is NULL)
                       and TSotr.Fk_Id = TAppsotr.fk_sotrid
                       and (TLOG.FN_USERID = pFK_SOTRID_FILTER or pFK_SOTRID_FILTER is NULL)
                       and tappsotr.FK_ID = tlog.FN_USERID
                       and TLOG.FD_LOGONTIME between pFD_BEGIN_FILTER and pFD_END_FILTER ) TLOGOWNER
             where TLOG.FC_TABLE = 'TAMBTALON'
               and TLOG.FK_OWNER = TLOGOWNER.FK_OWNER
               and TSotr.Fk_Id = TAppsotr.fk_sotrid
               and tappsotr.FK_ID = tlog.FN_USERID
               and (TLOG.FN_USERID = pFK_SOTRID_FILTER or pFK_SOTRID_FILTER is NULL)
               and TLOG.FC_TABLE = 'TDIAG'
               and TLOG.FD_LOGONTIME between pFD_BEGIN_FILTER and pFD_END_FILTER
               and TLOG.FC_ACTION = 'TAMBTALON'
               and TLOG.FC_ACTION = 'DELETE'
               and ((pFC_ACTION_FILTER IS NULL) or (pFC_ACTION_FILTER = 'DELETE'))
               ) T
     order by FK_OWNER, FD_LOGONTIME, FN_USERID;
---
--- Для адреса
---
cursor cAdressPAc Is
 Select * from (
             select TLOG.*,DECODE(TADRESS.Fk_Type,61,'Адрес прописки',63,'Адрес проживания','Место жительства') as FC_IDENT,
                   TPEOPLES.FC_FAM,
                   TPEOPLES.FC_IM,
                   TPEOPLES.FC_OTCH,
                   TPEOPLES.FD_ROJD,
                   TSOTR.FC_FAM ||' '|| TSotr.FC_NAME ||' '||TSotr.FC_OTCH as FC_USER
              from ASU.TLOG, asu.TADRESS, ASU.TPEOPLES,LOGIN.Tappsotr, ASU.TSotr
             where TLOG.FC_TABLE = pFC_TABLE_FILTER
               and NVL(TLOG.FC_OLD, 'NULLVALUE') <>
                   NVL(TLOG.FC_NEW, 'NULLVALUE')
               and TADRESS.FK_PACID = TPEOPLES.FK_ID
               and TSotr.Fk_Id = TAppsotr.fk_sotrid
               and tappsotr.FK_ID = tlog.FN_USERID
               and TLOG.FD_LOGONTIME between pFD_BEGIN_FILTER and
                   pFD_END_FILTER
               and TADRESS.FK_ID = TLOG.FK_OWNER
               and ( TSotr.Fk_Id = pFK_SOTRID_FILTER or
                   pFK_SOTRID_FILTER is NULL)
               and (pFC_ACTION_FILTER IS NULL or
                   TLOG.Fc_Action = pFC_ACTION_FILTER)
               and (TPEOPLES.Fc_fam like pFC_FAM_FILTER || '%' or
                   TPEOPLES.Fc_fam is NULL)
               and (TPEOPLES.Fc_im like pFC_IM_FILTER || '%' or
                   TPEOPLES.Fc_im is NULL)
               and (TPEOPLES.Fc_otch like pFC_OTCH_FILTER || '%' or
                   TPEOPLES.Fc_otch is NULL)
               and (TPEOPLES.Fd_Rojd = pFD_ROJD_FILTER or
                   pFD_ROJD_FILTER IS NULL)
            union all
            select TLOG.*,'' as FC_IDENT,
                   '' as FC_FAM,
                   '' as FC_IM,
                   '' as FC_OTCH,
                   NULL as FD_ROJD,
                   TSOTR.FC_FAM || ' ' || TSotr.FC_NAME || ' ' || TSotr.FC_OTCH as FC_USER
              from ASU.TLOG,
                   LOGIN.Tappsotr, ASU.TSotr,
                   (select DISTINCT FK_OWNER
                      from ASU.TLOG, ASU.TPeoples,LOGIN.Tappsotr, ASU.TSotr
                     where (TPEOPLES.Fc_fam like pFC_FAM_FILTER || '%' or
                            TPEOPLES.Fc_fam is NULL)
                       and (TPEOPLES.Fc_im like pFC_IM_FILTER || '%' or
                            TPEOPLES.Fc_im is NULL)
                       and (TPEOPLES.Fc_otch like pFC_OTCH_FILTER || '%' or
                            TPEOPLES.Fc_otch is NULL)
                       and (TPEOPLES.Fd_Rojd = pFD_ROJD_FILTER or
                           pFD_ROJD_FILTER IS NULL)
                       and TO_CHAR(TPEOPLES.FK_ID) = TLOG.FC_OLD
                       and TLOG.FC_FIELD = 'FK_PEPELID'
                       and TLOG.FC_ACTION = 'DELETE'
                       and TLOG.FC_TABLE = pFC_TABLE_FILTER
                       and TSotr.Fk_Id = TAppsotr.fk_sotrid
                       and tappsotr.FK_ID = tlog.FN_USERID
                       and (TSotr.Fk_Id = pFK_SOTRID_FILTER or
                           pFK_SOTRID_FILTER IS NULL)
                       and TLOG.FD_LOGONTIME between pFD_BEGIN_FILTER and pFD_END_FILTER) TLOGOWNER
             where TLOG.FC_TABLE = pFC_TABLE_FILTER
               and TLOG.FK_OWNER = TLOGOWNER.FK_OWNER
               and TSotr.Fk_Id = TAppsotr.fk_sotrid
               and tappsotr.FK_ID = tlog.FN_USERID
               and TLOG.FC_TABLE = pFC_TABLE_FILTER
               and TLOG.FD_LOGONTIME between pFD_BEGIN_FILTER and
                   pFD_END_FILTER
               and (TLOG.FN_USERID = pFK_SOTRID_FILTER or pFK_SOTRID_FILTER is NULL)
               and TLOG.FC_ACTION = 'DELETE'
               and ((pFC_ACTION_FILTER IS NULL) or (pFC_ACTION_FILTER = 'DELETE'))) T
     order by FK_OWNER, FD_LOGONTIME, FN_USERID;
---------------------------------------------------------------------------------------
cursor cPeopleDoc is
    select *
      from (select TLOG.*,
                   TPEOPLES.FC_FAM||' '||TPEOPLES.FC_IM||' '||TPEOPLES.FC_OTCH as FC_IDENT,
                   TPEOPLES.FC_FAM,
                   TPEOPLES.FC_IM,
                   TPEOPLES.FC_OTCH,
                   TPEOPLES.FD_ROJD,

                   /*(select */TSOTR.FC_FAM || ' ' || TSotr.FC_NAME || ' ' ||
                           TSotr.FC_OTCH /*
                      from LOGIN.Tappsotr, ASU.TSotr
                     where TSotr.Fk_Id = TAppsotr.fk_sotrid
                       and tappsotr.FK_ID = tlog.FN_USERID)*/ as FC_USER
              from ASU.TLOG, asu.TPEOPLES, LOGIN.Tappsotr, ASU.TSotr
             where TLOG.FC_TABLE = pFC_TABLE_FILTER
               and NVL(TLOG.FC_OLD, 'NULLVALUE') <>
                   NVL(TLOG.FC_NEW, 'NULLVALUE')
               and TSotr.Fk_Id = TAppsotr.fk_sotrid
               and TAppSotr.FK_ID = tlog.FN_USERID
               and TLOG.FD_LOGONTIME between pFD_BEGIN_FILTER and
                   pFD_END_FILTER
               and TPEOPLES.FK_ID = TLOG.FK_OWNER
               and ( TSotr.Fk_Id = pFK_SOTRID_FILTER or
                   pFK_SOTRID_FILTER is NULL)
               and (pFC_ACTION_FILTER IS NULL or
                   TLOG.Fc_Action = pFC_ACTION_FILTER)
               and (TPEOPLES.Fc_fam like pFC_FAM_FILTER || '%' or
                   TPEOPLES.Fc_fam is NULL)
               and (TPEOPLES.Fc_im like pFC_IM_FILTER || '%' or
                   TPEOPLES.Fc_im is NULL)
               and (TPEOPLES.Fc_otch like pFC_OTCH_FILTER || '%' or
                   TPEOPLES.Fc_otch is NULL)
               and (TPEOPLES.Fd_Rojd = pFD_ROJD_FILTER or
                   pFD_ROJD_FILTER IS NULL)
             ) T
     order by FK_OWNER, FD_LOGONTIME, FN_USERID;
----------------------------------------------------------------------------------------------
cursor cPacAmb Is
 Select * from (
             select TLOG.*,(TAMBULANCE.FC_FAM||' '||TAMBULANCE.FC_IM||' '|| TAMBULANCE.FC_OTCH) as FC_IDENT,
                   TAMBULANCE.FC_FAM,
                   TAMBULANCE.FC_IM,
                   TAMBULANCE.FC_OTCH,
                   TAMBULANCE.FD_ROJD,
                   TSOTR.FC_FAM ||' '|| TSotr.FC_NAME ||' '||TSotr.FC_OTCH as FC_USER
              from ASU.TLOG, ASU.TAMBULANCE,LOGIN.Tappsotr, ASU.TSotr
             where TLOG.FC_TABLE = pFC_TABLE_FILTER
               and NVL(TLOG.FC_OLD, 'NULLVALUE') <>
                   NVL(TLOG.FC_NEW, 'NULLVALUE')
               and TSotr.Fk_Id = TAppsotr.fk_sotrid
               and tappsotr.FK_ID = tlog.FN_USERID
               and TLOG.FD_LOGONTIME between pFD_BEGIN_FILTER and
                   pFD_END_FILTER
               and TAMBULANCE.FK_ID = TLOG.FK_OWNER
               and ( TSotr.Fk_Id = pFK_SOTRID_FILTER or
                   pFK_SOTRID_FILTER is NULL)
               and (pFC_ACTION_FILTER IS NULL or
                   TLOG.Fc_Action = pFC_ACTION_FILTER)
               and (TAMBULANCE.Fc_fam like pFC_FAM_FILTER || '%' or
                   TAMBULANCE.Fc_fam is NULL)
               and (TAMBULANCE.Fc_im like pFC_IM_FILTER || '%' or
                   TAMBULANCE.Fc_im is NULL)
               and (TAMBULANCE.Fc_otch like pFC_OTCH_FILTER || '%' or
                   TAMBULANCE.Fc_otch is NULL)
               and (TAMBULANCE.Fd_Rojd = pFD_ROJD_FILTER or
                   pFD_ROJD_FILTER IS NULL)
            union all
            select TLOG.*,'' as FC_IDENT,
                   '' as FC_FAM,
                   '' as FC_IM,
                   '' as FC_OTCH,
                   NULL as FD_ROJD,
                   TSOTR.FC_FAM || ' ' || TSotr.FC_NAME || ' ' || TSotr.FC_OTCH as FC_USER
              from ASU.TLOG,
                   LOGIN.Tappsotr, ASU.TSotr,
                   (select DISTINCT FK_OWNER
                      from ASU.TLOG, ASU.TPeoples,LOGIN.Tappsotr, ASU.TSotr
                     where (TPEOPLES.Fc_fam like pFC_FAM_FILTER || '%' or
                            TPEOPLES.Fc_fam is NULL)
                       and (TPEOPLES.Fc_im like pFC_IM_FILTER || '%' or
                            TPEOPLES.Fc_im is NULL)
                       and (TPEOPLES.Fc_otch like pFC_OTCH_FILTER || '%' or
                            TPEOPLES.Fc_otch is NULL)
                       and (TPEOPLES.Fd_Rojd = pFD_ROJD_FILTER or
                           pFD_ROJD_FILTER IS NULL)
                       and TO_CHAR(TPEOPLES.FK_ID) = TLOG.FC_OLD
                       and TLOG.FC_FIELD = 'FK_ID'
                       and TLOG.FC_ACTION = 'DELETE'
                       and TLOG.FC_TABLE = pFC_TABLE_FILTER
                       and TSotr.Fk_Id = TAppsotr.fk_sotrid
                       and tappsotr.FK_ID = tlog.FN_USERID
                       and (TSotr.Fk_Id = pFK_SOTRID_FILTER or
                           pFK_SOTRID_FILTER IS NULL)
                       and TLOG.FD_LOGONTIME between pFD_BEGIN_FILTER and pFD_END_FILTER) TLOGOWNER
             where TLOG.FC_TABLE = pFC_TABLE_FILTER
               and TLOG.FK_OWNER = TLOGOWNER.FK_OWNER
               and TSotr.Fk_Id = TAppsotr.fk_sotrid
               and tappsotr.FK_ID = tlog.FN_USERID
               and TLOG.FC_TABLE = pFC_TABLE_FILTER
               and TLOG.FD_LOGONTIME between pFD_BEGIN_FILTER and
                   pFD_END_FILTER
               and (TLOG.FN_USERID = pFK_SOTRID_FILTER or pFK_SOTRID_FILTER is NULL)
               and TLOG.FC_ACTION = 'DELETE'
               and ((pFC_ACTION_FILTER IS NULL) or (pFC_ACTION_FILTER = 'DELETE'))) T
     order by FK_OWNER, FD_LOGONTIME, FN_USERID;
-----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
cursor cPacStac Is
 Select * from (
             select TLOG.*,(TAMBULANCE.FC_FAM||' '||TAMBULANCE.FC_IM||' '|| TAMBULANCE.FC_OTCH) as FC_IDENT,
                   TAMBULANCE.FC_FAM,
                   TAMBULANCE.FC_IM,
                   TAMBULANCE.FC_OTCH,
                   TAMBULANCE.FD_ROJD,
                   TSOTR.FC_FAM ||' '|| TSotr.FC_NAME ||' '||TSotr.FC_OTCH as FC_USER
              from ASU.TLOG, ASU.TKARTA TAMBULANCE,LOGIN.Tappsotr, ASU.TSotr
             where TLOG.FC_TABLE = pFC_TABLE_FILTER
               and NVL(TLOG.FC_OLD, 'NULLVALUE') <>
                   NVL(TLOG.FC_NEW, 'NULLVALUE')
               and TSotr.Fk_Id = TAppsotr.fk_sotrid
               and tappsotr.FK_ID = tlog.FN_USERID
               and TLOG.FD_LOGONTIME between pFD_BEGIN_FILTER and
                   pFD_END_FILTER
               and TAMBULANCE.FK_ID = TLOG.FK_OWNER
               and ( TSotr.Fk_Id = pFK_SOTRID_FILTER or
                   pFK_SOTRID_FILTER is NULL)
               and (pFC_ACTION_FILTER IS NULL or
                   TLOG.Fc_Action = pFC_ACTION_FILTER)
               and (TAMBULANCE.Fc_fam like pFC_FAM_FILTER || '%' or
                   TAMBULANCE.Fc_fam is NULL)
               and (TAMBULANCE.Fc_im like pFC_IM_FILTER || '%' or
                   TAMBULANCE.Fc_im is NULL)
               and (TAMBULANCE.Fc_otch like pFC_OTCH_FILTER || '%' or
                   TAMBULANCE.Fc_otch is NULL)
               and (TAMBULANCE.Fd_Rojd = pFD_ROJD_FILTER or
                   pFD_ROJD_FILTER IS NULL)
            union all
            select TLOG.*,'' as FC_IDENT,
                   '' as FC_FAM,
                   '' as FC_IM,
                   '' as FC_OTCH,
                   NULL as FD_ROJD,
                   TSOTR.FC_FAM || ' ' || TSotr.FC_NAME || ' ' || TSotr.FC_OTCH as FC_USER
              from ASU.TLOG,
                   LOGIN.Tappsotr, ASU.TSotr,
                   (select DISTINCT FK_OWNER
                      from ASU.TLOG, ASU.TPeoples,LOGIN.Tappsotr, ASU.TSotr
                     where (TPEOPLES.Fc_fam like pFC_FAM_FILTER || '%' or
                            TPEOPLES.Fc_fam is NULL)
                       and (TPEOPLES.Fc_im like pFC_IM_FILTER || '%' or
                            TPEOPLES.Fc_im is NULL)
                       and (TPEOPLES.Fc_otch like pFC_OTCH_FILTER || '%' or
                            TPEOPLES.Fc_otch is NULL)
                       and (TPEOPLES.Fd_Rojd = pFD_ROJD_FILTER or
                           pFD_ROJD_FILTER IS NULL)
                       and TO_CHAR(TPEOPLES.FK_ID) = TLOG.FC_OLD
                       and TLOG.FC_FIELD = 'FK_ID'
                       and TLOG.FC_ACTION = 'DELETE'
                       and TLOG.FC_TABLE = pFC_TABLE_FILTER
                       and TSotr.Fk_Id = TAppsotr.fk_sotrid
                       and tappsotr.FK_ID = tlog.FN_USERID
                       and (TSotr.Fk_Id = pFK_SOTRID_FILTER or
                           pFK_SOTRID_FILTER IS NULL)
                       and TLOG.FD_LOGONTIME between pFD_BEGIN_FILTER and pFD_END_FILTER) TLOGOWNER
             where TLOG.FC_TABLE = pFC_TABLE_FILTER
               and TLOG.FK_OWNER = TLOGOWNER.FK_OWNER
               and TSotr.Fk_Id = TAppsotr.fk_sotrid
               and tappsotr.FK_ID = tlog.FN_USERID
               and TLOG.FC_TABLE = pFC_TABLE_FILTER
               and TLOG.FD_LOGONTIME between pFD_BEGIN_FILTER and
                   pFD_END_FILTER
               and (TLOG.FN_USERID = pFK_SOTRID_FILTER or pFK_SOTRID_FILTER is NULL)
               and TLOG.FC_ACTION = 'DELETE'
               and ((pFC_ACTION_FILTER IS NULL) or (pFC_ACTION_FILTER = 'DELETE'))) T
     order by FK_OWNER, FD_LOGONTIME, FN_USERID;
-----------------------------------------------------------------------------------------



cursor GetDiagWrite(pFK_DIAGID in NUMBER) is
 select FC_WRITE from ASU.TDIAG where FK_ID = pFK_DIAGID;

cursor GetDocVidWrite(pFK_ID in NUMBER) is
 select FC_NAME from ASU.tviddoc where FK_ID = pFK_ID;

cursor GetInsNum(pFK_INSID in NUMBER) is
 select FC_SER|| ' '||FC_NUM from ASU.TINSURDOCS where FK_ID = pFK_INSID;

--процедурки для вставки данных
---
procedure DoInsertNaz is
Begin
 if (pFK_OWNER <> -1) and
                             (pFD_RUN_OLD is not NULL OR pFD_RUN_NEW  is not  NULL OR
                             pFD_NAZ_OLD  is not  NULL OR pFD_NAZ_NEW  is not  NULL OR
                             pFC_NAME_OLD  is not  NULL OR pFC_NAME_NEW  is not  NULL OR
                             pFC_SOS_OLD  is not  NULL OR pFC_SOS_NEW  is not  NULL OR
                             pFC_ISPOL_OLD  is not  NULL OR pFC_ISPOL_NEW  is not  NULL
                             or pFC_ACTION = 'INSERT') then
                            insert into asu.tlogextnaz
                              (FD_DATE,
                               FK_OWNER,
                               FC_USER,
                               FC_FAM,
                               FC_IM,
                               FC_OTCH,
                               FD_ROJD,
                               FC_ISPOL_OLD,
                               FD_NAZ_OLD,
                               FD_RUN_OLD,
                               FC_NAME_OLD,
                               FC_SOS_OLD,
                               FC_DIAGN_OLD,
                               FC_DIAGP_OLD,
                               FC_DIAGS_OLD,
                               FC_DIAGZ_OLD,
                               FC_ISPOL_NEW,
                               FD_NAZ_NEW,
                               FD_RUN_NEW,
                               FC_NAME_NEW,
                               FC_SOS_NEW,
                               FC_DIAGN_NEW,
                               FC_DIAGP_NEW,
                               FC_DIAGS_NEW,
                               FC_DIAGZ_NEW,
                               FC_ACTION,
                               FC_IDENT)
                            values
                              (pFD_DATE,
                               pFK_OWNER,
                               pFC_USER,
                               pFC_FAM,
                               pFC_IM,
                               pFC_OTCH,
                               pFD_ROJD,
                               pFC_ISPOL_OLD,
                               pFD_NAZ_OLD,
                               pFD_RUN_OLD,
                               pFC_NAME_OLD,
                               pFC_SOS_OLD,
                               pFC_DIAGN_OLD,
                               pFC_DIAGP_OLD,
                               pFC_DIAGS_OLD,
                               pFC_DIAGZ_OLD,
                               pFC_ISPOL_NEW,
                               pFD_NAZ_NEW,
                               pFD_RUN_NEW,
                               pFC_NAME_NEW,
                               pFC_SOS_NEW,
                               pFC_DIAGN_NEW,
                               pFC_DIAGP_NEW,
                               pFC_DIAGS_NEW,
                               pFC_DIAGZ_NEW,
                               pFC_ACTION,
                               pFC_IDENT);

                           -- pFD_DATE      := NULL;
                            --pFK_OWNER     := NULL;
                           -- pFC_USER      := NULL;
                            pFC_FAM       := NULL;
                            pFC_IM        := NULL;
                            pFC_OTCH      := NULL;
                            pFD_ROJD      := NULL;
                            pFC_ISPOL_OLD := NULL;
                            pFD_NAZ_OLD   := NULL;
                            pFD_RUN_OLD   := NULL;
                            pFC_NAME_OLD  := NULL;
                            pFC_SOS_OLD   := NULL;
                            pFC_DIAGN_OLD := NULL;
                            pFC_DIAGP_OLD := NULL;
                            pFC_DIAGS_OLD := NULL;
                            pFC_DIAGZ_OLD := NULL;
                            pFC_ISPOL_NEW := NULL;
                            pFD_NAZ_NEW   := NULL;
                            pFD_RUN_NEW   := NULL;
                            pFC_NAME_NEW  := NULL;
                            pFC_SOS_NEW   := NULL;
                            pFC_DIAGN_NEW := NULL;
                            pFC_DIAGP_NEW := NULL;
                            pFC_DIAGS_NEW := NULL;
                            pFC_DIAGZ_NEW := NULL;
                            --pFC_IDENT := NULL;
                         --   pFC_ACTION    := NULL;
                          end if;
End;
---
procedure DoInsertIns is
Begin
 if (pFK_OWNER <> -1) and
              (
                  pFC_SER_OLD is  not NULL or
                  pFC_NUM_OLD is  not NULL or
                  pFD_BEGIN_OLD is  not NULL or
                  pFD_END_OLD is  not NULL or
                  pFD_PROLONG_OLD is  not NULL or
                  pFK_COMPANYID_OLD is  not NULL or
                  pFK_TYPEDOCID_OLD is  not NULL or
                  pFC_SER_NEW is  not NULL or
                  pFC_NUM_NEW is  not NULL or
                  pFD_BEGIN_NEW is  not NULL or
                  pFD_END_NEW is  not NULL or
                  pFD_PROLONG_NEW is  not NULL or
                  pFK_COMPANYID_NEW is  not NULL or
                  pFK_TYPEDOCID_NEW is  not NULL
              ) then
             insert into asu.TLOGEXTINSURDOCS
               (
                  FD_DATE,
                  FK_OWNER,
                  FC_USER,
                  FC_FAM,
                  FC_IM,
                  FC_OTCH,
                  FD_ROJD,
                  FC_SER_OLD,
                  FC_NUM_OLD,
                  FD_BEGIN_OLD,
                  FD_END_OLD,
                  FD_PROLONG_OLD,
                  FK_COMPANYID_OLD,
                  FK_TYPEDOCID_OLD,
                  FC_SER_NEW,
                  FC_NUM_NEW,
                  FD_BEGIN_NEW,
                  FD_END_NEW,
                  FD_PROLONG_NEW,
                  FK_COMPANYID_NEW,
                  FK_TYPEDOCID_NEW,
                  FC_ACTION,
                  FC_IDENT
                )
             values
               (  pFD_DATE,
                  pFK_OWNER,
                  pFC_USER,
                  pFC_FAM,
                  pFC_IM,
                  pFC_OTCH,
                  pFD_ROJD,
                  pFC_SER_OLD,
                  pFC_NUM_OLD,
                  pFD_BEGIN_OLD,
                  pFD_END_OLD,
                  pFD_PROLONG_OLD,
                  pFK_COMPANYID_OLD,
                  pFK_TYPEDOCID_OLD,
                  pFC_SER_NEW,
                  pFC_NUM_NEW,
                  pFD_BEGIN_NEW,
                  pFD_END_NEW,
                  pFD_PROLONG_NEW,
                  pFK_COMPANYID_NEW,
                  pFK_TYPEDOCID_NEW,
                  pFC_ACTION,
                  pFC_IDENT);

                  pFC_SER_OLD := NULL;
                  pFC_NUM_OLD := NULL;
                  pFD_BEGIN_OLD := NULL;
                  pFD_END_OLD := NULL;
                  pFD_PROLONG_OLD := NULL;
                  pFK_COMPANYID_OLD := NULL;
                  pFK_TYPEDOCID_OLD := NULL;
                  pFC_SER_NEW := NULL;
                  pFC_NUM_NEW := NULL;
                  pFD_BEGIN_NEW := NULL;
                  pFD_END_NEW := NULL;
                  pFD_PROLONG_NEW := NULL;
                  pFK_COMPANYID_NEW := NULL;
                  pFK_TYPEDOCID_NEW := NULL;
           end if;
End;
---
procedure DoInsertAdr is
Begin
 if (pFK_OWNER <> -1) and
              (
                   pFC_ADR_OLD       is  not NULL or
                   pFK_KLADR_OLD     is  not NULL or
                   pFC_HOUSE_OLD     is  not NULL or
                   pFC_KVARTIRA_OLD  is  not NULL or
                   pFC_KORPUS_OLD    is  not NULL or

                   pFC_ADR_NEW       is  not NULL or
                   pFK_KLADR_NEW     is  not NULL or
                   pFC_HOUSE_NEW     is  not NULL or
                   pFC_KVARTIRA_NEW  is  not NULL or
                   pFC_KORPUS_NEW    is  not NULL

              ) then
             insert into ASU.Tlogextadress
               (
                  FD_DATE,
                  FK_OWNER,
                  FC_USER,
                  FC_FAM,
                  FC_IM,
                  FC_OTCH,
                  FD_ROJD,

                  FC_ADR_OLD,
                  FK_KLADR_OLD,
                  FC_HOUSE_OLD,
                  FC_KVARTIRA_OLD,
                  FC_KORPUS_OLD,

                  FC_ADR_NEW,
                  FK_KLADR_NEW,
                  FC_HOUSE_NEW,
                  FC_KVARTIRA_NEW,
                  FC_KORPUS_NEW,

                  FC_ACTION,
                  FC_IDENT
                )
             values
               (  pFD_DATE,
                  pFK_OWNER,
                  pFC_USER,
                  pFC_FAM,
                  pFC_IM,
                  pFC_OTCH,
                  pFD_ROJD,

                  pFC_ADR_OLD,
                  pFK_KLADR_OLD,
                  pFC_HOUSE_OLD,
                  pFC_KVARTIRA_OLD,
                  pFC_KORPUS_OLD,

                  pFC_ADR_NEW,
                  pFK_KLADR_NEW,
                  pFC_HOUSE_NEW,
                  pFC_KVARTIRA_NEW,
                  pFC_KORPUS_NEW,

                  pFC_ACTION,
                  pFC_IDENT);

                  pFC_ADR_OLD := NULL;
                  pFK_KLADR_OLD := NULL;
                  pFC_HOUSE_OLD := NULL;
                  pFC_KVARTIRA_OLD := NULL;
                  pFC_KORPUS_OLD := NULL;

                  pFC_ADR_NEW := NULL;
                  pFK_KLADR_NEW := NULL;
                  pFC_HOUSE_NEW := NULL;
                  pFC_KVARTIRA_NEW := NULL;
                  pFC_KORPUS_NEW := NULL;
           end if;
End;
---
procedure DoInsertDiag is
Begin
 if (pFK_OWNER <> -1) and
              (
                  pFK_SMDIAGID_OLD is  not NULL or
                  pFP_TYPE_OLD is  not NULL or
                  pFL_FIRST_OLD is  not NULL or
                  pFC_WRITE_OLD is  not NULL or
                  pFD_DATE_OLD is  not NULL or
                  pFK_VRACHID_OLD is  not NULL or
                  pFL_MAIN_OLD is  not NULL or

                  pFK_SMDIAGID_NEW is  not NULL or
                  pFP_TYPE_NEW is  not NULL or
                  pFL_FIRST_NEW is  not NULL or
                  pFC_WRITE_NEW is  not NULL or
                  pFD_DATE_NEW is  not NULL or
                  pFK_VRACHID_NEW is  not NULL or
                  pFL_MAIN_NEW is  not NULL
              ) then
             insert into asu.TLOGEXTDIAG
               (
                  FD_DATE,
                  FK_OWNER,
                  FC_USER,
                  FC_FAM,
                  FC_IM,
                  FC_OTCH,
                  FD_ROJD,
                  FK_SMDIAGID_OLD,
                  FP_TYPE_OLD,
                  FL_FIRST_OLD,
                  FC_WRITE_OLD,
                  FD_DATE_OLD,
                  FK_VRACHID_OLD,
                  FL_MAIN_OLD,

                  FK_SMDIAGID_NEW,
                  FP_TYPE_NEW,
                  FL_FIRST_NEW,
                  FC_WRITE_NEW,
                  FD_DATE_NEW,
                  FK_VRACHID_NEW,
                  FL_MAIN_NEW,
                  FC_ACTION,
                  FC_IDENT
                )
             values
               (  pFD_DATE,
                  pFK_OWNER,
                  pFC_USER,
                  pFC_FAM,
                  pFC_IM,
                  pFC_OTCH,
                  pFD_ROJD,
                  pFK_SMDIAGID_OLD,
                  pFP_TYPE_OLD,
                  pFL_FIRST_OLD,
                  pFC_WRITE_OLD,
                  pFD_DATE_OLD,
                  pFK_VRACHID_OLD,
                  pFL_MAIN_OLD,

                  pFK_SMDIAGID_NEW,
                  pFP_TYPE_NEW,
                  pFL_FIRST_NEW,
                  pFC_WRITE_NEW,
                  pFD_DATE_NEW,
                  pFK_VRACHID_NEW,
                  pFL_MAIN_NEW,
                  pFC_ACTION,
                  pFC_IDENT);

                  pFK_SMDIAGID_OLD := NULL;
                  pFP_TYPE_OLD := NULL;
                  pFL_FIRST_OLD := NULL;
                  pFC_WRITE_OLD := NULL;
                  pFD_DATE_OLD := NULL;
                  pFK_VRACHID_OLD := NULL;
                  pFL_MAIN_OLD := NULL;

                  pFK_SMDIAGID_NEW := NULL;
                  pFP_TYPE_NEW := NULL;
                  pFL_FIRST_NEW := NULL;
                  pFC_WRITE_NEW := NULL;
                  pFD_DATE_NEW := NULL;
                  pFK_VRACHID_NEW := NULL;
                  pFL_MAIN_NEW := NULL;
           end if;
End;
---
procedure DoInsertTalon is
Begin
 if (pFK_OWNER <> -1) and
                             (pFD_OPENED_OLD is not NULL OR
                              pFN_SOS_OLD is not NULL OR
                              pFK_DIAGMAIN_OLD is not NULL OR
                              pFK_INSURANCEID_OLD is not NULL OR
                              pFK_RESULT_OLD is not NULL OR
                              pFK_DOPISHODID_OLD is not NULL OR
                              pFK_DIAGMAINPRED_OLD is not NULL OR
                              pFD_NAPRDATE_OLD is not NULL OR
                              pFC_NAPRNUM_OLD is not NULL OR
                              pFC_TALON_COMMENT_OLD is not NULL OR

                              pFD_OPENED_NEW is not NULL OR
                              pFN_SOS_NEW is not NULL OR
                              pFK_DIAGMAIN_NEW is not NULL OR
                              pFK_INSURANCEID_NEW is not NULL OR
                              pFK_RESULT_NEW is not NULL OR
                              pFK_DOPISHODID_NEW is not NULL OR
                              pFK_DIAGMAINPRED_NEW is not NULL OR
                              pFD_NAPRDATE_NEW is not NULL OR
                              pFC_NAPRNUM_NEW is not NULL OR
                              pFC_TALON_COMMENT_NEW is not NULL
                             or pFC_ACTION = 'INSERT') then
                            insert into asu.tlogexttalon
                              (FD_DATE,
                               FK_OWNER,
                               FC_USER,
                               FC_FAM,
                               FC_IM,
                               FC_OTCH,
                               FD_ROJD,
                               FD_OPENED_OLD,
                               FN_SOS_OLD,
                               FK_DIAGMAIN_OLD,
                               FK_INSURANCEID_OLD,
                               FK_RESULT_OLD,
                               FK_DOPISHODID_OLD,
                               FK_DIAGMAINPRED_OLD,
                               FD_NAPRDATE_OLD,
                               FC_NAPRNUM_OLD,
                               FC_TALON_COMMENT_OLD,
                               FD_OPENED_NEW,
                               FN_SOS_NEW,
                               FK_DIAGMAIN_NEW,
                               FK_INSURANCEID_NEW,
                               FK_RESULT_NEW,
                               FK_DOPISHODID_NEW,
                               FK_DIAGMAINPRED_NEW,
                               FD_NAPRDATE_NEW,
                               FC_NAPRNUM_NEW,
                               FC_TALON_COMMENT_NEW,
                               FC_ACTION,
                               FC_IDENT)
                            values
                              (pFD_DATE,
                               pFK_OWNER,
                               pFC_USER,
                               pFC_FAM,
                               pFC_IM,
                               pFC_OTCH,
                               pFD_ROJD,
                               pFD_OPENED_OLD,
                               pFN_SOS_OLD,
                               pFK_DIAGMAIN_OLD,
                               pFK_INSURANCEID_OLD,
                               pFK_RESULT_OLD,
                               pFK_DOPISHODID_OLD,
                               pFK_DIAGMAINPRED_OLD,
                               pFD_NAPRDATE_OLD,
                               pFC_NAPRNUM_OLD,
                               pFC_TALON_COMMENT_OLD,
                               pFD_OPENED_NEW,
                               pFN_SOS_NEW,
                               pFK_DIAGMAIN_NEW,
                               pFK_INSURANCEID_NEW,
                               pFK_RESULT_NEW,
                               pFK_DOPISHODID_NEW,
                               pFK_DIAGMAINPRED_NEW,
                               pFD_NAPRDATE_NEW,
                               pFC_NAPRNUM_NEW,
                               pFC_TALON_COMMENT_NEW,
                               pFC_ACTION,
                               pFC_IDENT);

                           -- pFD_DATE      := NULL;
                            --pFK_OWNER     := NULL;
                           -- pFC_USER      := NULL;
                              pFD_OPENED_OLD  := NULL;
                              pFN_SOS_OLD  := NULL;
                              pFK_DIAGMAIN_OLD   := NULL;
                              pFK_INSURANCEID_OLD  := NULL;
                              pFK_RESULT_OLD  := NULL;
                              pFK_DOPISHODID_OLD  := NULL;
                              pFK_DIAGMAINPRED_OLD  := NULL;
                              pFD_NAPRDATE_OLD  := NULL;
                              pFC_NAPRNUM_OLD  := NULL;
                              pFC_TALON_COMMENT_OLD  := NULL;
                              pFD_OPENED_NEW  := NULL;
                              pFN_SOS_NEW  := NULL;
                              pFK_DIAGMAIN_NEW := NULL;
                              pFK_INSURANCEID_NEW  := NULL;
                              pFK_RESULT_NEW  := NULL;
                              pFK_DOPISHODID_NEW  := NULL;
                              pFK_DIAGMAINPRED_NEW  := NULL;
                              pFD_NAPRDATE_NEW  := NULL;
                              pFC_NAPRNUM_NEW := NULL;
                              pFC_TALON_COMMENT_NEW  := NULL;

                            --pFC_IDENT := NULL;
                         --   pFC_ACTION    := NULL;
                          end if;
End;
---
procedure DoInsertPac is
Begin
 if (pFK_OWNER <> -1) and
                             (
                                 pFC_FAM_OLD  is not NULL OR
                                 pFC_IM_OLD   is not NULL OR
                                 pFC_OTCH_OLD   is not NULL OR
                                 pFD_ROJD_OLD   is not NULL OR
                                 pFP_SEX_OLD    is not NULL OR
                                 pFK_DOCVID_OLD  is not NULL OR
                                 pFC_DOCSER_OLD  is not NULL OR
                                 pFC_DOCNUM_OLD  is not NULL OR
                                 pFD_DOCDATE_OLD    is not NULL OR
                                 pFC_DOCVIDAN_OLD   is not NULL OR
                                 pFC_RABOTA_OLD   is not NULL OR           
                                 pFK_WORK_COMPANYID_OLD   is not NULL OR   
                                 pFK_OTDEL_OLD   is not NULL OR            
                                 pFK_DOLGNOST_OLD   is not NULL OR
                                 pFC_FAM_NEW     is not NULL OR
                                 pFC_IM_NEW    is not NULL OR
                                 pFC_OTCH_NEW    is not NULL OR
                                 pFD_ROJD_NEW    is not NULL OR
                                 pFP_SEX_NEW      is not NULL OR
                                 pFK_DOCVID_NEW    is not NULL OR
                                 pFC_DOCSER_NEW      is not NULL OR
                                 pFC_DOCNUM_NEW      is not NULL OR
                                 pFD_DOCDATE_NEW      is not NULL OR
                                 pFC_DOCVIDAN_NEW is not NULL OR
                                 pFC_RABOTA_NEW is not NULL OR           
                                 pFK_WORK_COMPANYID_NEW is not NULL OR   
                                 pFK_OTDEL_NEW is not NULL OR            
                                 pFK_DOLGNOST_NEW is not NULL 
                                 
                             ) then
                            insert into asu.tlogextpac
                              (
                                 FD_DATE,
                                 FK_OWNER,
                                 FC_USER,
                                 FC_FAM,
                                 FC_IM,
                                 FC_OTCH,
                                 FD_ROJD,
                                 FC_FAM_OLD,
                                 FC_IM_OLD,
                                 FC_OTCH_OLD,
                                 FD_ROJD_OLD,
                                 FP_SEX_OLD,
                                 FK_DOCVID_OLD,
                                 FC_DOCSER_OLD,
                                 FC_DOCNUM_OLD,
                                 FD_DOCDATE_OLD,
                                 FC_DOCVIDAN_OLD,
                                 FC_FAM_NEW,
                                 FC_IM_NEW,
                                 FC_OTCH_NEW,
                                 FD_ROJD_NEW,
                                 FP_SEX_NEW,
                                 FK_DOCVID_NEW ,
                                 FC_DOCSER_NEW ,
                                 FC_DOCNUM_NEW ,
                                 FD_DOCDATE_NEW ,
                                 FC_DOCVIDAN_NEW,
                                 FC_ACTION,
                                 FC_IDENT,
                                 FC_RABOTA_NEW,
                                 FK_WORK_COMPANYID_NEW,
                                 FK_OTDEL_NEW,
                                 FK_DOLGNOST_NEW
                               )
                            values
                              (  pFD_DATE,
                                 pFK_OWNER,
                                 pFC_USER,
                                 pFC_FAM,
                                 pFC_IM,
                                 pFC_OTCH,
                                 pFD_ROJD,
                                 pFC_FAM_OLD,
                                 pFC_IM_OLD ,
                                 pFC_OTCH_OLD ,
                                 pFD_ROJD_OLD ,
                                 pFP_SEX_OLD ,
                                 pFK_DOCVID_OLD ,
                                 pFC_DOCSER_OLD ,
                                 pFC_DOCNUM_OLD ,
                                 pFD_DOCDATE_OLD ,
                                 pFC_DOCVIDAN_OLD ,
                                 pFC_FAM_NEW   ,
                                 pFC_IM_NEW   ,
                                 pFC_OTCH_NEW ,
                                 pFD_ROJD_NEW ,
                                 pFP_SEX_NEW ,
                                 pFK_DOCVID_NEW,
                                 pFC_DOCSER_NEW ,
                                 pFC_DOCNUM_NEW  ,
                                 pFD_DOCDATE_NEW  ,
                                 pFC_DOCVIDAN_NEW,
                                 pFC_ACTION,
                                 pFC_IDENT,
                                 pFC_RABOTA_NEW,
                                 pFK_WORK_COMPANYID_NEW,
                                 pFK_OTDEL_NEW,
                                 pFK_DOLGNOST_NEW);

                                 pFD_DATE := NULL;
                                 pFK_OWNER := NULL;
                                 pFC_USER := NULL;
                                 pFC_FAM := NULL;
                                 pFC_IM := NULL;
                                 pFC_OTCH := NULL;
                                 pFD_ROJD := NULL;
                                 pFC_FAM_OLD := NULL;
                                 pFC_IM_OLD := NULL;
                                 pFC_OTCH_OLD := NULL;
                                 pFD_ROJD_OLD := NULL;
                                 pFP_SEX_OLD := NULL;
                                 pFK_DOCVID_OLD := NULL;
                                 pFC_DOCSER_OLD := NULL;
                                 pFC_DOCNUM_OLD := NULL;
                                 pFD_DOCDATE_OLD := NULL;
                                 pFC_DOCVIDAN_OLD := NULL;
                                 pFC_FAM_NEW := NULL;
                                 pFC_IM_NEW := NULL;
                                 pFC_OTCH_NEW := NULL;
                                 pFD_ROJD_NEW := NULL;
                                 pFP_SEX_NEW := NULL;
                                 pFK_DOCVID_NEW := NULL;
                                 pFC_DOCSER_NEW := NULL;
                                 pFC_DOCNUM_NEW := NULL;
                                 pFD_DOCDATE_NEW := NULL;
                                 pFC_DOCVIDAN_NEW := NULL;
                                 pFC_RABOTA_NEW := NULL;
                                 pFK_WORK_COMPANYID_NEW := NULL;
                                 pFK_OTDEL_NEW := NULL;
                                 pFK_DOLGNOST_NEW := NULL;
                                 pFC_RABOTA_OLD := NULL;
                                 pFK_WORK_COMPANYID_OLD := NULL;
                                 pFK_OTDEL_OLD := NULL;
                                 pFK_DOLGNOST_OLD := NULL;
                                 pFC_ACTION := NULL;
                                 pFC_IDENT := NULL;
                          end if;
End;
---
function GetTalonState(p in number)return varchar2 is
Begin
 if p = 0 then
  return 'Открыт';
 else
  If p = 1 then
   return 'Закрыт';
  else
   If p = 2 then
    return 'Неявка';
   else
    return '';
   end if;
  end if;
 end if;
end;
---
begin
  pFD_DATE  := sysdate - 100 * 365;
  pFK_OWNER := -1;
  pFC_USER  := '';
  pFC_ACTION := '';

  delete from asu.tlogextnaz;
  pcount_to_commit := 0;

  if pFC_TABLE_FILTER = 'VNAZ' then
   if pFC_PAC_TYPE = 0 then
                      FOR c in cNazAmb loop
                        if c.fc_user <> pFC_USER or c.fd_logontime <> pFD_DATE or
                           c.Fk_Owner <> pFK_OWNER or pFC_ACTION <> c.fc_action then
                          --Чтобы не вставлялось в первый раз
                          DoInsertNaz;
                          pFD_DATE  := c.fd_logontime;
                          pFK_OWNER := c.Fk_Owner;
                          pFC_USER  := c.fc_user;
                          pcount_to_commit := pcount_to_commit + 1;
                          if mod(pcount_to_commit,24) = 0 then
                           NULL;--commit;
                          end if;
                        end if;

                        if c.Fc_Field = 'FD_RUN' then
                         if c.fc_old <> ' ' then
                          pFD_RUN_OLD := TO_DATE(c.fc_old, 'DD.MM.YYYY HH24:MI:SS');
                         else
                          pFD_RUN_OLD := NULL;
                         end if;

                         if c.fc_new <> ' ' then
                          pFD_RUN_NEW := TO_DATE(c.fc_new, 'DD.MM.YYYY HH24:MI:SS');
                         else
                          pFD_RUN_NEW := NULL;
                         end if;
                        end if;

                        if c.Fc_Field = 'FD_NAZ' then
                          if c.fc_old = ' ' then
                           pFD_NAZ_OLD := TO_DATE(c.fc_old, 'DD.MM.YYYY HH24:MI:SS');
                          else
                           pFD_NAZ_OLD := NULL;
                          end if;

                          if c.fc_new = ' ' then
                           pFD_NAZ_NEW := TO_DATE(c.fc_new, 'DD.MM.YYYY HH24:MI:SS');
                          else
                           pFD_NAZ_NEW := NULL;
                          end if;
                        end if;

                        if c.Fc_Field = 'FK_SMID' then
                          pFC_NAME_OLD := asu.get_fullpath_sha(TO_NUMBER(c.fc_old));
                          pFC_NAME_NEW := asu.get_fullpath_sha(TO_NUMBER(c.fc_new));
                        end if;

                        if c.Fc_Field = 'FK_NAZSOSID' then
                          pFC_SOS_OLD := ASU.Get_Nazsos(TO_NUMBER(c.fc_old));
                          pFC_SOS_NEW := ASU.Get_Nazsos(TO_NUMBER(c.fc_new));
                        end if;

                        if c.Fc_Field = 'FK_ISPOLID' then
                          pFC_ISPOL_OLD := ASU.Do_Vrachfio(TO_NUMBER(c.fc_old));
                          pFC_ISPOL_NEW := ASU.Do_Vrachfio(TO_NUMBER(c.fc_new));
                        end if;

                        pFC_ACTION := c.FC_ACTION;
                        pFC_IDENT := c.FC_IDENT;

                        IF pFC_ACTION = 'DELETE' then
                          if c.fc_FIELD = 'FK_PACID' then
                             OPEN cGET_FIO_ROJD_AMB(TO_NUMBER(c.Fc_Old));
                             FETCH cGET_FIO_ROJD_AMB into  pFC_FAM, pFC_IM, pFC_OTCH, pFD_ROJD;
                             CLOSE cGET_FIO_ROJD_AMB;
                          end if;
                        else
                          pFC_FAM    := c.FC_FAM;
                          pFC_IM     := c.FC_IM;
                          pFC_OTCH   := c.FC_OTCH;
                          pFD_ROJD   := c.FD_ROJD;
                        end if;
                      end loop;
                      DoInsertNaz;
        else
                       FOR c in cNazStac loop
                        if c.fc_user <> pFC_USER or c.fd_logontime <> pFD_DATE or
                           c.Fk_Owner <> pFK_OWNER or pFC_ACTION <> c.fc_action then
                          --Чтобы не вставлялось в первый раз
                          DoInsertNaz;
                          pFD_DATE  := c.fd_logontime;
                          pFK_OWNER := c.Fk_Owner;
                          pFC_USER  := c.fc_user;
                          pcount_to_commit := pcount_to_commit + 1;
                          if mod(pcount_to_commit,24) = 0 then
                          NULL;-- commit;
                          end if;
                        end if;

                        if c.Fc_Field = 'FD_RUN' then
                         if c.fc_old <> ' ' then
                          pFD_RUN_OLD := TO_DATE(c.fc_old, 'DD.MM.YYYY HH24:MI:SS');
                         else
                          pFD_RUN_OLD := NULL;
                         end if;

                         if c.fc_new <> ' ' then
                          pFD_RUN_NEW := TO_DATE(c.fc_new, 'DD.MM.YYYY HH24:MI:SS');
                         else
                          pFD_RUN_NEW := NULL;
                         end if;
                        end if;

                        if c.Fc_Field = 'FD_NAZ' then
                          if c.fc_old = ' ' then
                           pFD_NAZ_OLD := TO_DATE(c.fc_old, 'DD.MM.YYYY HH24:MI:SS');
                          else
                           pFD_NAZ_OLD := NULL;
                          end if;

                          if c.fc_new = ' ' then
                           pFD_NAZ_NEW := TO_DATE(c.fc_new, 'DD.MM.YYYY HH24:MI:SS');
                          else
                           pFD_NAZ_NEW := NULL;
                          end if;
                        end if;

                        if c.Fc_Field = 'FK_SMID' then
                          pFC_NAME_OLD := asu.get_fullpath_sha(TO_NUMBER(c.fc_old));
                          pFC_NAME_NEW := asu.get_fullpath_sha(TO_NUMBER(c.fc_new));
                        end if;

                        if c.Fc_Field = 'FK_NAZSOSID' then
                          pFC_SOS_OLD := ASU.Get_Nazsos(TO_NUMBER(c.fc_old));
                          pFC_SOS_NEW := ASU.Get_Nazsos(TO_NUMBER(c.fc_new));
                        end if;

                        if c.Fc_Field = 'FK_ISPOLID' then
                          pFC_ISPOL_OLD := ASU.Do_Vrachfio(TO_NUMBER(c.fc_old));
                          pFC_ISPOL_NEW := ASU.Do_Vrachfio(TO_NUMBER(c.fc_new));
                        end if;

                       pFC_ACTION := c.FC_ACTION;
                       IF pFC_ACTION = 'DELETE' then
                          if c.fc_FIELD = 'FK_PACID' then
                             OPEN cGET_FIO_ROJD_STAC(TO_NUMBER(c.Fc_Old));
                             FETCH cGET_FIO_ROJD_STAC into  pFC_FAM, pFC_IM, pFC_OTCH, pFD_ROJD;
                             CLOSE cGET_FIO_ROJD_STAC;
                          end if;
                        else
                          pFC_FAM    := c.FC_FAM;
                          pFC_IM     := c.FC_IM;
                          pFC_OTCH   := c.FC_OTCH;
                          pFD_ROJD   := c.FD_ROJD;
                        end if;



                        pFC_ACTION := c.FC_ACTION;
                        pFC_IDENT := c.FC_IDENT;
                      end loop;
                      --Вставляем если возможно то, что осталось в последней записи
                      DoInsertNaz;
        end if;
   --commit;
  else
    if pFC_TABLE_FILTER = 'TINSURDOCS' then
      delete from asu.TLOGEXTINSURDOCS;
      FOR c in cPolis loop
         if c.fc_user <> pFC_USER or c.fd_logontime <> pFD_DATE or c.Fk_Owner <> pFK_OWNER or pFC_ACTION <> c.fc_action then
           --Чтобы не вставлялось в первый раз
           DoInsertIns;
           pFD_DATE  := c.fd_logontime;
           pFK_OWNER := c.Fk_Owner;
           pFC_USER  := c.fc_user;
           pcount_to_commit := pcount_to_commit + 1;
           if mod(pcount_to_commit,24) = 0 then
            NULL;--commit;
           end if;
         end if;

         if c.Fc_Field = 'FD_BEGIN' then
          if c.fc_old <> ' ' then
           pFD_BEGIN_OLD := TO_DATE(c.fc_old, 'DD.MM.YYYY HH24:MI:SS');
          else
           pFD_BEGIN_OLD := NULL;
          end if;

          if c.fc_new <> ' ' then
           pFD_BEGIN_NEW := TO_DATE(c.fc_new, 'DD.MM.YYYY HH24:MI:SS');
          else
           pFD_BEGIN_NEW := NULL;
          end if;



         end if;

         if c.Fc_Field = 'FD_END' then

          if c.fc_old <> ' ' then
            pFD_END_OLD := TO_DATE(c.fc_old, 'DD.MM.YYYY HH24:MI:SS');
          else
            pFD_END_OLD := NULL;
          end if;


          if c.fc_new <> ' ' then
            pFD_END_NEW := TO_DATE(c.fc_new, 'DD.MM.YYYY HH24:MI:SS');
          else
            pFD_END_NEW := NULL;
          end if;

         end if;

         if c.Fc_Field = 'FD_PROLONG' then
          if c.fc_old <> ' ' then
            pFD_PROLONG_OLD := TO_DATE(c.fc_old, 'DD.MM.YYYY HH24:MI:SS');
          else
            pFD_PROLONG_OLD := NULL;
          end if;


          if c.fc_new <> ' ' then
            pFD_PROLONG_NEW := TO_DATE(c.fc_new, 'DD.MM.YYYY HH24:MI:SS');
          else
            pFD_PROLONG_NEW := NULL;
          end if;





         end if;

         if c.Fc_Field = 'FC_SER' then
           pFC_SER_OLD := c.fc_old;
           pFC_SER_NEW := c.fc_new;
         end if;

         if c.Fc_Field = 'FC_NUM' then
           pFC_NUM_OLD := c.fc_old;
           pFC_NUM_NEW := c.fc_new;
         end if;

         if c.Fc_Field = 'FK_COMPANYID' then
           pFK_COMPANYID_OLD := ASU.Get_Company_Shortname(TO_NUMBER(c.fc_old));
           pFK_COMPANYID_NEW := ASU.Get_Company_Shortname(TO_NUMBER(c.fc_new));
         end if;


         if c.Fc_Field = 'FK_TYPEDOCID' then
           pFC_ISPOL_OLD := ASU.Get_Typedocname(TO_NUMBER(c.fc_old));
           pFC_ISPOL_NEW := ASU.Get_Typedocname(TO_NUMBER(c.fc_new));
         end if;

        pFC_ACTION := c.FC_ACTION;
        IF pFC_ACTION = 'DELETE' then
           if c.fc_FIELD = 'FK_PEPLID' then
              OPEN cGET_FIO_ROJD_PEPL(TO_NUMBER(c.Fc_Old));
              FETCH cGET_FIO_ROJD_PEPL into  pFC_FAM, pFC_IM, pFC_OTCH, pFD_ROJD;
              CLOSE cGET_FIO_ROJD_PEPL;
           end if;
         else
           pFC_FAM    := c.FC_FAM;
           pFC_IM     := c.FC_IM;
           pFC_OTCH   := c.FC_OTCH;
           pFD_ROJD   := c.FD_ROJD;
         end if;

         pFC_ACTION := c.FC_ACTION;
         pFC_IDENT := c.FC_IDENT;
       end loop;
       DoInsertIns;
    ELSE
     if  pFC_TABLE_FILTER = 'TDIAG' then
      delete from ASU.Tlogextdiag;
      if pFC_PAC_TYPE = 0 then
                      FOR c in cDiagAmb loop
                        if c.fc_user <> pFC_USER or c.fd_logontime <> pFD_DATE or
                           c.Fk_Owner <> pFK_OWNER or pFC_ACTION <> c.fc_action then
                          --Чтобы не вставлялось в первый раз
                          DoInsertDiag;
                          pFD_DATE  := c.fd_logontime;
                          pFK_OWNER := c.Fk_Owner;
                          pFC_USER  := c.fc_user;
                          pcount_to_commit := pcount_to_commit + 1;
                          if mod(pcount_to_commit,24) = 0 then
                           NULL;--commit;
                          end if;
                        end if;

                        if c.Fc_Field = 'FD_DATE' then

                          if c.fc_old <> ' ' then
                            pFD_DATE_OLD := TO_DATE(c.fc_old, 'DD.MM.YYYY HH24:MI:SS');
                          else
                            pFD_DATE_OLD := NULL;
                          end if;


                          if c.fc_new <> ' ' then
                           pFD_DATE_NEW := TO_DATE(c.fc_new, 'DD.MM.YYYY HH24:MI:SS');
                          else
                           pFD_DATE_NEW := NULL;
                          end if;




                        end if;

                        if c.Fc_Field = 'FK_SMDIAGID' then
                          pFK_SMDIAGID_OLD := asu.get_mkb10_from_tsmid(TO_NUMBER(c.fc_old));
                          pFK_SMDIAGID_NEW := asu.get_mkb10_from_tsmid(TO_NUMBER(c.fc_new));
                        end if;

                        if c.Fc_Field = 'FP_TYPE' then
                          pFP_TYPE_OLD := asu.get_name_from_smid(TO_NUMBER(c.fc_old));
                          pFP_TYPE_NEW := asu.get_name_from_smid(TO_NUMBER(c.fc_new));
                        end if;

                        if c.Fc_Field = 'FL_FIRST' then
                          pFL_FIRST_OLD := asu.get_name_from_smid(TO_NUMBER(c.fc_old));
                          pFL_FIRST_NEW := asu.get_name_from_smid(TO_NUMBER(c.fc_new));
                        end if;

                        if c.Fc_Field = 'FL_MAIN' then
                          pFL_MAIN_OLD := asu.get_name_from_smid(TO_NUMBER(c.fc_old));
                          pFL_MAIN_NEW := asu.get_name_from_smid(TO_NUMBER(c.fc_new));
                        end if;

                        if c.Fc_Field = 'FC_WRITE' then
                          pFC_WRITE_OLD := c.fc_old;
                          pFC_WRITE_NEW := c.fc_new;
                        end if;

                        if c.Fc_Field = 'FK_VRACHID' then
                          pFK_VRACHID_OLD := ASU.Do_Vrachfio(TO_NUMBER(c.fc_old));
                          pFK_VRACHID_NEW := ASU.Do_Vrachfio(TO_NUMBER(c.fc_new));
                        end if;

                        pFC_ACTION := c.FC_ACTION;
                        pFC_IDENT := c.FC_IDENT;

                        IF pFC_ACTION = 'DELETE' then
                          if c.fc_FIELD = 'FK_PACID' then
                             OPEN cGET_FIO_ROJD_AMB(TO_NUMBER(c.Fc_Old));
                             FETCH cGET_FIO_ROJD_AMB into  pFC_FAM, pFC_IM, pFC_OTCH, pFD_ROJD;
                             CLOSE cGET_FIO_ROJD_AMB;
                          end if;
                        else
                          pFC_FAM    := c.FC_FAM;
                          pFC_IM     := c.FC_IM;
                          pFC_OTCH   := c.FC_OTCH;
                          pFD_ROJD   := c.FD_ROJD;
                        end if;
                      end loop;
                      DoInsertDiag;
        else
                        FOR c in cDiagStac loop
                        if c.fc_user <> pFC_USER or c.fd_logontime <> pFD_DATE or
                           c.Fk_Owner <> pFK_OWNER or pFC_ACTION <> c.fc_action then
                          --Чтобы не вставлялось в первый раз
                          DoInsertDiag;
                          pFD_DATE  := c.fd_logontime;
                          pFK_OWNER := c.Fk_Owner;
                          pFC_USER  := c.fc_user;
                          pcount_to_commit := pcount_to_commit + 1;
                          if mod(pcount_to_commit,24) = 0 then
                           NULL;--commit;
                          end if;
                        end if;

                        if c.Fc_Field = 'FD_DATE' then

                          if c.fc_old <> ' ' then
                            pFD_DATE_OLD := TO_DATE(c.fc_old, 'DD.MM.YYYY HH24:MI:SS');
                          else
                            pFD_DATE_OLD := NULL;
                          end if;


                          if c.fc_new <> ' ' then
                           pFD_DATE_NEW := TO_DATE(c.fc_new, 'DD.MM.YYYY HH24:MI:SS');
                          else
                           pFD_DATE_NEW := NULL;
                          end if;




                        end if;

                        if c.Fc_Field = 'FK_SMDIAGID' then
                          pFK_SMDIAGID_OLD := asu.get_mkb10_from_tsmid(TO_NUMBER(c.fc_old));
                          pFK_SMDIAGID_NEW := asu.get_mkb10_from_tsmid(TO_NUMBER(c.fc_new));
                        end if;

                        if c.Fc_Field = 'FP_TYPE' then
                          pFP_TYPE_OLD := asu.get_name_from_smid(TO_NUMBER(c.fc_old));
                          pFP_TYPE_NEW := asu.get_name_from_smid(TO_NUMBER(c.fc_new));
                        end if;

                        if c.Fc_Field = 'FL_FIRST' then
                          pFL_FIRST_OLD := asu.get_name_from_smid(TO_NUMBER(c.fc_old));
                          pFL_FIRST_NEW := asu.get_name_from_smid(TO_NUMBER(c.fc_new));
                        end if;

                        if c.Fc_Field = 'FL_MAIN' then
                          pFL_MAIN_OLD := asu.get_name_from_smid(TO_NUMBER(c.fc_old));
                          pFL_MAIN_NEW := asu.get_name_from_smid(TO_NUMBER(c.fc_new));
                        end if;

                        if c.Fc_Field = 'FC_WRITE' then
                          pFC_WRITE_OLD := c.fc_old;
                          pFC_WRITE_NEW := c.fc_new;
                        end if;

                        if c.Fc_Field = 'FK_VRACHID' then
                          pFK_VRACHID_OLD := ASU.Do_Vrachfio(TO_NUMBER(c.fc_old));
                          pFK_VRACHID_NEW := ASU.Do_Vrachfio(TO_NUMBER(c.fc_new));
                        end if;

                        pFC_ACTION := c.FC_ACTION;
                        pFC_IDENT := c.FC_IDENT;

                        IF pFC_ACTION = 'DELETE' then
                          if c.fc_FIELD = 'FK_PACID' then
                             OPEN cGET_FIO_ROJD_AMB(TO_NUMBER(c.Fc_Old));
                             FETCH cGET_FIO_ROJD_AMB into  pFC_FAM, pFC_IM, pFC_OTCH, pFD_ROJD;
                             CLOSE cGET_FIO_ROJD_AMB;
                          end if;
                        else
                          pFC_FAM    := c.FC_FAM;
                          pFC_IM     := c.FC_IM;
                          pFC_OTCH   := c.FC_OTCH;
                          pFD_ROJD   := c.FD_ROJD;
                        end if;
                      end loop;
                      DoInsertDiag;
        end if;
     else
      if pFC_TABLE_FILTER = 'TAMBTALON' then
       delete from ASU.Tlogexttalon;
       if pFC_PAC_TYPE = 0 then
                      FOR c in cTalonAmb loop
                        if c.fc_user <> pFC_USER or c.fd_logontime <> pFD_DATE or
                           c.Fk_Owner <> pFK_OWNER or pFC_ACTION <> c.fc_action then
                          --Чтобы не вставлялось в первый раз
                          DoInsertTalon;
                          pFD_DATE  := c.fd_logontime;
                          pFK_OWNER := c.Fk_Owner;
                          pFC_USER  := c.fc_user;
                          pcount_to_commit := pcount_to_commit + 1;
                          if mod(pcount_to_commit,24) = 0 then
                           NULL;--commit;
                          end if;
                        end if;

                        if c.Fc_Field = 'FD_OPENED' then

                          if c.fc_old <> ' ' then
                            pFD_OPENED_OLD := TO_DATE(c.fc_old, 'DD.MM.YYYY HH24:MI:SS');
                          else
                            pFD_OPENED_OLD := NULL;
                          end if;


                          if c.fc_new <> ' ' then
                           pFD_OPENED_NEW := TO_DATE(c.fc_new, 'DD.MM.YYYY HH24:MI:SS');
                          else
                           pFD_OPENED_NEW := NULL;
                          end if;




                        END IF;

                        if c.Fc_Field = 'FN_SOS' then
                         pFN_SOS_OLD := GetTalonState(TO_NUMBER(c.fc_old));
                         pFN_SOS_NEW := GetTalonState(TO_NUMBER(c.fc_NEW));
                        END IF;

                        if c.Fc_Field = 'FK_DIAGMAIN' then

                         OPEN GetDiagWrite(TO_NUMBER(c.fc_old));
                         FETCH GetDiagWrite into pFK_DIAGMAIN_OLD;
                         CLOSE GetDiagWrite;

                         OPEN GetDiagWrite(TO_NUMBER(c.fc_new));
                         FETCH GetDiagWrite into pFK_DIAGMAIN_NEW;
                         CLOSE GetDiagWrite;

                        END IF;

                        if c.Fc_Field = 'FK_INSURANCEID' then
                          OPEN GetInsNum(TO_NUMBER(c.fc_old));
                          FETCH GetInsNum into pFK_INSURANCEID_OLD ;
                          CLOSE GetInsNum;

                          OPEN GetInsNum(TO_NUMBER(c.fc_new));
                          FETCH GetInsNum into pFK_INSURANCEID_NEW;
                          CLOSE GetInsNum;
                        END IF;

                        if c.Fc_Field = 'FK_RESULT' then
                         pFK_RESULT_OLD := ASU.GET_NAME_FROM_SMID(TO_NUMBER(c.fc_old));
                         pFK_RESULT_NEW := ASU.GET_NAME_FROM_SMID(TO_NUMBER(c.fc_new));
                        END IF;

                        if c.Fc_Field = 'FK_DOPISHODID' then
                         pFK_DOPISHODID_OLD := ASU.GET_NAME_FROM_SMID(TO_NUMBER(c.fc_old));
                         pFK_DOPISHODID_NEW := ASU.GET_NAME_FROM_SMID(TO_NUMBER(c.fc_new));
                        END IF;

                        if c.Fc_Field = 'FK_DIAGMAINPRED' then
                         OPEN GetDiagWrite(TO_NUMBER(c.fc_old));
                         FETCH GetDiagWrite into pFK_DIAGMAINPRED_OLD;
                         CLOSE GetDiagWrite;

                         OPEN GetDiagWrite(TO_NUMBER(c.fc_new));
                         FETCH GetDiagWrite into pFK_DIAGMAINPRED_NEW;
                         CLOSE GetDiagWrite;
                        END IF;

                        if c.Fc_Field = 'FD_NAPRDATE' then
                          if c.fc_old <> ' ' then
                            pFD_NAPRDATE_OLD := TO_DATE(c.fc_old, 'DD.MM.YYYY HH24:MI:SS');
                          else
                            pFD_NAPRDATE_OLD := NULL;
                          end if;


                          if c.fc_new <> ' ' then
                           pFD_NAPRDATE_NEW := TO_DATE(c.fc_new, 'DD.MM.YYYY HH24:MI:SS');
                          else
                           pFD_NAPRDATE_NEW := NULL;
                          end if;





                        END IF;

                        if c.Fc_Field = 'FC_NAPRNUM' then
                         pFC_NAPRNUM_OLD  := c.FC_OLD;
                         pFC_NAPRNUM_NEW  := c.FC_NEW;
                        END IF;

                        if c.Fc_Field = 'FC_TALON_COMMENT' then
                         pFC_TALON_COMMENT_OLD  := c.FC_OLD;
                         pFC_TALON_COMMENT_NEW  := c.FC_NEW;
                        END IF;

                        pFC_ACTION := c.FC_ACTION;
                        pFC_IDENT := c.FC_IDENT;

                        IF pFC_ACTION = 'DELETE' then
                          if c.fc_FIELD = 'FK_PACID' then
                             OPEN cGET_FIO_ROJD_AMB(TO_NUMBER(c.Fc_Old));
                             FETCH cGET_FIO_ROJD_AMB into  pFC_FAM, pFC_IM, pFC_OTCH, pFD_ROJD;
                             CLOSE cGET_FIO_ROJD_AMB;
                          end if;
                        else
                          pFC_FAM    := c.FC_FAM;
                          pFC_IM     := c.FC_IM;
                          pFC_OTCH   := c.FC_OTCH;
                          pFD_ROJD   := c.FD_ROJD;
                        end if;
                      end loop;
                      DoInsertTalon;
        else
                       FOR c in cTalonStac loop
                        if c.fc_user <> pFC_USER or c.fd_logontime <> pFD_DATE or
                           c.Fk_Owner <> pFK_OWNER or pFC_ACTION <> c.fc_action then
                          --Чтобы не вставлялось в первый раз
                          DoInsertTalon;
                          pFD_DATE  := c.fd_logontime;
                          pFK_OWNER := c.Fk_Owner;
                          pFC_USER  := c.fc_user;
                          pcount_to_commit := pcount_to_commit + 1;
                          if mod(pcount_to_commit,24) = 0 then
                           NULL;--commit;
                          end if;
                        end if;

                        if c.Fc_Field = 'FD_OPENED' then


                          if c.fc_old <> ' ' then
                            pFD_OPENED_OLD := TO_DATE(c.fc_old, 'DD.MM.YYYY HH24:MI:SS');
                          else
                            pFD_OPENED_OLD := NULL;
                          end if;


                          if c.fc_new <> ' ' then
                           pFD_OPENED_NEW := TO_DATE(c.fc_new, 'DD.MM.YYYY HH24:MI:SS');
                          else
                           pFD_OPENED_NEW := NULL;
                          end if;




                        END IF;

                        if c.Fc_Field = 'FN_SOS' then
                         pFN_SOS_OLD := GetTalonState(TO_NUMBER(c.fc_old));
                         pFN_SOS_NEW := GetTalonState(TO_NUMBER(c.fc_NEW));
                        END IF;

                        if c.Fc_Field = 'FK_DIAGMAIN' then

                         OPEN GetDiagWrite(TO_NUMBER(c.fc_old));
                         FETCH GetDiagWrite into pFK_DIAGMAIN_OLD;
                         CLOSE GetDiagWrite;

                         OPEN GetDiagWrite(TO_NUMBER(c.fc_new));
                         FETCH GetDiagWrite into pFD_OPENED_NEW;
                         CLOSE GetDiagWrite;

                        END IF;

                        if c.Fc_Field = 'FK_INSURANCEID' then
                          OPEN GetInsNum(TO_NUMBER(c.fc_old));
                          FETCH GetInsNum into pFK_INSURANCEID_OLD ;
                          CLOSE GetInsNum;

                          OPEN GetInsNum(TO_NUMBER(c.fc_new));
                          FETCH GetInsNum into pFK_INSURANCEID_NEW;
                          CLOSE GetInsNum;
                        END IF;

                        if c.Fc_Field = 'FK_RESULT' then
                         pFK_RESULT_OLD := ASU.GET_NAME_FROM_SMID(TO_NUMBER(c.fc_old));
                         pFK_RESULT_NEW := ASU.GET_NAME_FROM_SMID(TO_NUMBER(c.fc_new));
                        END IF;

                        if c.Fc_Field = 'FK_DOPISHODID' then
                         pFK_DOPISHODID_OLD := ASU.GET_NAME_FROM_SMID(TO_NUMBER(c.fc_old));
                         pFK_DOPISHODID_NEW := ASU.GET_NAME_FROM_SMID(TO_NUMBER(c.fc_new));
                        END IF;

                        if c.Fc_Field = 'FK_DIAGMAINPRED' then
                         OPEN GetDiagWrite(TO_NUMBER(c.fc_old));
                         FETCH GetDiagWrite into pFK_DIAGMAINPRED_OLD;
                         CLOSE GetDiagWrite;

                         OPEN GetDiagWrite(TO_NUMBER(c.fc_new));
                         FETCH GetDiagWrite into pFK_DIAGMAINPRED_NEW;
                         CLOSE GetDiagWrite;
                        END IF;

                        if c.Fc_Field = 'FD_NAPRDATE' then
                          if c.fc_old <> ' ' then
                            pFD_NAPRDATE_OLD := TO_DATE(c.fc_old, 'DD.MM.YYYY HH24:MI:SS');
                          else
                            pFD_NAPRDATE_OLD := NULL;
                          end if;


                          if c.fc_new <> ' ' then
                           pFD_NAPRDATE_NEW := TO_DATE(c.fc_new, 'DD.MM.YYYY HH24:MI:SS');
                          else
                           pFD_NAPRDATE_NEW := NULL;
                          end if;



                        END IF;

                        if c.Fc_Field = 'FC_NAPRNUM' then
                         pFC_NAPRNUM_OLD  := c.FC_OLD;
                         pFC_NAPRNUM_NEW  := c.FC_NEW;
                        END IF;

                        if c.Fc_Field = 'FC_TALON_COMMENT' then
                         pFC_TALON_COMMENT_OLD  := c.FC_OLD;
                         pFC_TALON_COMMENT_NEW  := c.FC_NEW;
                        END IF;

                        pFC_ACTION := c.FC_ACTION;
                        pFC_IDENT := c.FC_IDENT;

                        IF pFC_ACTION = 'DELETE' then
                          if c.fc_FIELD = 'FK_PACID' then
                             OPEN cGET_FIO_ROJD_AMB(TO_NUMBER(c.Fc_Old));
                             FETCH cGET_FIO_ROJD_AMB into  pFC_FAM, pFC_IM, pFC_OTCH, pFD_ROJD;
                             CLOSE cGET_FIO_ROJD_AMB;
                          end if;
                        else
                          pFC_FAM    := c.FC_FAM;
                          pFC_IM     := c.FC_IM;
                          pFC_OTCH   := c.FC_OTCH;
                          pFD_ROJD   := c.FD_ROJD;
                        end if;
                      end loop;
                      --DoInsertTalon;
                      --Вставляем если возможно то, что осталось в последней записи
                      DoInsertTalon;
        end if;
      else
       if pFC_TABLE_FILTER = 'TADRESS' then
        delete from asu.TLOGEXTADRESS;
         FOR c in cAdressPAc loop
          if c.fc_user <> pFC_USER or c.fd_logontime <> pFD_DATE or c.Fk_Owner <> pFK_OWNER or pFC_ACTION <> c.fc_action then
            --Чтобы не вставлялось в первый раз
             DoInsertAdr;
             pFD_DATE  := c.fd_logontime;
             pFK_OWNER := c.Fk_Owner;
             pFC_USER  := c.fc_user;
             pcount_to_commit := pcount_to_commit + 1;
             if mod(pcount_to_commit,24) = 0 then
              NULL;--commit;
             end if;
          end if;



         if c.Fc_Field = 'FK_KLADR' then

           --if c.fc_old <> '' then
            pFK_KLADR_OLD := GET_KLADR_ADDR_BY_ID(TO_NUMBER(c.fc_old));
           --else
           --  pFK_KLADR_OLD := ' ';
           --end if;

          -- if c.FC_NEW <> '' then
            pFK_KLADR_NEW := GET_KLADR_ADDR_BY_ID(TO_NUMBER(c.fc_new));
          -- else
          --  pFK_KLADR_NEW := ' ';
          -- end if;

         end if;

         if c.Fc_Field = 'FC_ADR' then
           pFC_ADR_OLD := c.fc_old;
           pFC_ADR_NEW := c.fc_new;
         end if;

         if c.Fc_Field = 'FC_HOUSE' then
           pFC_HOUSE_OLD := c.fc_old;
           pFC_HOUSE_NEW := c.fc_new;
         end if;

         if c.Fc_Field = 'FC_KVARTIRA' then
           pFC_KVARTIRA_OLD := c.fc_old;
           pFC_KVARTIRA_NEW := c.fc_new;
         end if;

         if c.Fc_Field = 'FC_KORPUS' then
           pFC_KORPUS_OLD := c.fc_old;
           pFC_KORPUS_NEW := c.fc_new;
         end if;



        pFC_ACTION := c.FC_ACTION;
         IF pFC_ACTION = 'DELETE' then
           if c.fc_FIELD = 'FK_PACID' then
              OPEN cGET_FIO_ROJD_PEPL(TO_NUMBER(c.Fc_Old));
              FETCH cGET_FIO_ROJD_PEPL into  pFC_FAM, pFC_IM, pFC_OTCH, pFD_ROJD;
              CLOSE cGET_FIO_ROJD_PEPL;
           end if;
         else
           pFC_FAM    := c.FC_FAM;
           pFC_IM     := c.FC_IM;
           pFC_OTCH   := c.FC_OTCH;
           pFD_ROJD   := c.FD_ROJD;
         end if;

         pFC_ACTION := c.FC_ACTION;
         pFC_IDENT := c.FC_IDENT;
       end loop;
        DoInsertAdr;
       ELSE
        if pFC_TABLE_FILTER = 'TPEOPLES' then
         delete from asu.TLOGEXTPAC;

         FOR c in  cPeopleDoc loop
          if c.fc_user <> pFC_USER or c.fd_logontime <> pFD_DATE or c.Fk_Owner <> pFK_OWNER or pFC_ACTION <> c.fc_action then
            --Чтобы не вставлялось в первый раз
             DoInsertPac;
             pFD_DATE  := c.fd_logontime;
             pFK_OWNER := c.Fk_Owner;
             pFC_USER  := c.fc_user;
             pcount_to_commit := pcount_to_commit + 1;
             if mod(pcount_to_commit,24) = 0 then
              NULL;--commit;
             end if;
           end if;




         if c.Fc_Field = 'FK_DOCVID' then
           OPEN GetDocVidWrite(TO_NUMBER(c.fc_old));
           FETCH GetDocVidWrite into pFK_DOCVID_OLD;
           CLOSE GetDocVidWrite;

           OPEN GetDocVidWrite(TO_NUMBER(c.fc_new));
           FETCH GetDocVidWrite into pFK_DOCVID_NEW;
           CLOSE GetDocVidWrite;
         end if;

         if c.Fc_Field = 'FC_DOCSER' then
           pFC_DOCSER_OLD := c.fc_old;
           pFC_DOCSER_NEW := c.fc_new;
         end if;

         if c.Fc_Field = 'FC_DOCNUM' then
           pFC_DOCNUM_OLD := c.fc_old;
           pFC_DOCNUM_NEW := c.fc_new;
         end if;

         if c.Fc_Field = 'FD_DOCDATE' then
           if c.fc_old <> ' ' then
            pFD_DOCDATE_OLD := TO_DATE(c.fc_old, 'DD.MM.YYYY HH24:MI:SS');
           else
            pFD_DOCDATE_OLD := NULL;
           end if;

           if c.fc_new <> ' ' then
            pFD_DOCDATE_NEW := TO_DATE(c.fc_new, 'DD.MM.YYYY HH24:MI:SS');
           else
            pFD_DOCDATE_NEW := NULL;
           end if;


         end if;

         if c.Fc_Field = 'FC_DOCVIDAN' then
           pFC_DOCVIDAN_OLD := c.fc_old;
           pFC_DOCVIDAN_NEW := c.fc_new;
         end if;
         
         
         
         if c.Fc_Field = 'FC_RABOTA' then
           pFC_RABOTA_OLD := c.fc_old;
           pFC_RABOTA_NEW := c.fc_new;
         end if;
         
         if c.Fc_Field = 'FK_COMPANYID' then
           pFK_WORK_COMPANYID_OLD := ASU.Get_Company_Shortname(TO_NUMBER(c.fc_old));
           pFK_WORK_COMPANYID_NEW := ASU.Get_Company_Shortname(TO_NUMBER(c.fc_new));
         end if;
         
         if c.Fc_Field = 'FK_OTDEL' then
          pFK_OTDEL_OLD := ASU.GET_PACCOMPANY_OTDEL(TO_NUMBER(c.fc_old));
          pFK_OTDEL_NEW := ASU.GET_PACCOMPANY_OTDEL(TO_NUMBER(c.fc_new));
         end if; 
         
         if c.Fc_Field = 'FK_DOLGNOST' then
          pFK_DOLGNOST_OLD := ASU.GET_PACCOMPANY_DOLGNOST(TO_NUMBER(c.fc_old));  
          pFK_DOLGNOST_NEW := ASU.GET_PACCOMPANY_DOLGNOST(TO_NUMBER(c.fc_new));
         end if; 
         
        pFC_ACTION := c.FC_ACTION;
         IF pFC_ACTION = 'DELETE' then
           if c.fc_FIELD = 'FK_PACID' then
              OPEN cGET_FIO_ROJD_PEPL(TO_NUMBER(c.Fc_Old));
              FETCH cGET_FIO_ROJD_PEPL into  pFC_FAM, pFC_IM, pFC_OTCH, pFD_ROJD;
              CLOSE cGET_FIO_ROJD_PEPL;
           end if;
         else
           pFC_FAM    := c.FC_FAM;
           pFC_IM     := c.FC_IM;
           pFC_OTCH   := c.FC_OTCH;
           pFD_ROJD   := c.FD_ROJD;
         end if;

         pFC_ACTION := c.FC_ACTION;
         pFC_IDENT := c.FC_IDENT;
       end loop;
        DoInsertPac;
        else
         if/* (pFC_TABLE_FILTER = 'TKARTA') or*/ (pFC_TABLE_FILTER = 'TAMBULANCE')  then
          delete from asu.TLOGEXTPAC;

          FOR c in  cPacAmb loop
           if c.fc_user <> pFC_USER or c.fd_logontime <> pFD_DATE or c.Fk_Owner <> pFK_OWNER or pFC_ACTION <> c.fc_action then
             --Чтобы не вставлялось в первый раз
              DoInsertPac;
              pFD_DATE  := c.fd_logontime;
              pFK_OWNER := c.Fk_Owner;
              pFC_USER  := c.fc_user;
              pcount_to_commit := pcount_to_commit + 1;
              if mod(pcount_to_commit,24) = 0 then
               NULL;--commit;
              end if;
           end if;




           if c.Fc_Field = 'FC_FAM' then
             pFC_FAM_OLD := c.fc_old;
             pFC_FAM_NEW := c.fc_new;
           end if;

           if c.Fc_Field = 'FC_IM' then
             pFC_IM_OLD := c.fc_old;
             pFC_IM_NEW := c.fc_new;
           end if;

           if c.Fc_Field = 'FC_OTCH' then
             pFC_OTCH_OLD := c.fc_old;
             pFC_OTCH_NEW := c.fc_new;
           end if;

           if c.Fc_Field = 'FD_ROJD' then
             pFD_ROJD_OLD := c.fc_old;
             pFD_ROJD_NEW := c.fc_new;
           end if;

           if c.Fc_Field = 'FP_SEX' then
             if c.fc_old = '1' then
               pFP_SEX_OLD := 'Мужской';
             else
               pFP_SEX_OLD := 'Женский';
             end if;

             if c.fc_new = '1' then
               pFP_SEX_NEW := 'Мужской';
             else
               pFP_SEX_NEW := 'Женский';
             end if;

           end if;





           pFC_ACTION := c.FC_ACTION;
           IF pFC_ACTION = 'DELETE' then
             if c.fc_FIELD = 'FK_PACID' then
                OPEN cGET_FIO_ROJD_PEPL(TO_NUMBER(c.Fc_Old));
                FETCH cGET_FIO_ROJD_PEPL into  pFC_FAM, pFC_IM, pFC_OTCH, pFD_ROJD;
                CLOSE cGET_FIO_ROJD_PEPL;
             end if;
           else
             pFC_FAM    := c.FC_FAM;
             pFC_IM     := c.FC_IM;
             pFC_OTCH   := c.FC_OTCH;
             pFD_ROJD   := c.FD_ROJD;
           end if;

           pFC_ACTION := c.FC_ACTION;
           pFC_IDENT := c.FC_IDENT;
          end loop;
          DoInsertPac;
         else
          if/* (pFC_TABLE_FILTER = 'TKARTA') or*/ (pFC_TABLE_FILTER = 'TKARTA')  then
           delete from asu.TLOGEXTPAC;

           FOR c in  cPacStac loop
            if c.fc_user <> pFC_USER or c.fd_logontime <> pFD_DATE or c.Fk_Owner <> pFK_OWNER or pFC_ACTION <> c.fc_action then
              --Чтобы не вставлялось в первый раз
               DoInsertPac;
               pFD_DATE  := c.fd_logontime;
               pFK_OWNER := c.Fk_Owner;
               pFC_USER  := c.fc_user;
               pcount_to_commit := pcount_to_commit + 1;
               if mod(pcount_to_commit,24) = 0 then
                NULL;--commit;
               end if;
            end if;




            if c.Fc_Field = 'FC_FAM' then
              pFC_FAM_OLD := c.fc_old;
              pFC_FAM_NEW := c.fc_new;
            end if;

            if c.Fc_Field = 'FC_IM' then
              pFC_IM_OLD := c.fc_old;
              pFC_IM_NEW := c.fc_new;
            end if;

            if c.Fc_Field = 'FC_OTCH' then
              pFC_OTCH_OLD := c.fc_old;
              pFC_OTCH_NEW := c.fc_new;
            end if;

            if c.Fc_Field = 'FD_ROJD' then
              pFD_ROJD_OLD :=c.fc_old;
              pFD_ROJD_NEW :=c.fc_new;
            end if;

            if c.Fc_Field = 'FP_SEX' then
              if c.fc_old = '1' then
                pFP_SEX_OLD := 'Мужской';
              else
                pFP_SEX_OLD := 'Женский';
              end if;

              if c.fc_new = '1' then
                pFP_SEX_NEW := 'Мужской';
              else
                pFP_SEX_NEW := 'Женский';
              end if;

            end if;





            pFC_ACTION := c.FC_ACTION;
            IF pFC_ACTION = 'DELETE' then
              if c.fc_FIELD = 'FK_PACID' then
                 OPEN cGET_FIO_ROJD_PEPL(TO_NUMBER(c.Fc_Old));
                 FETCH cGET_FIO_ROJD_PEPL into  pFC_FAM, pFC_IM, pFC_OTCH, pFD_ROJD;
                 CLOSE cGET_FIO_ROJD_PEPL;
              end if;
            else
              pFC_FAM    := c.FC_FAM;
              pFC_IM     := c.FC_IM;
              pFC_OTCH   := c.FC_OTCH;
              pFD_ROJD   := c.FD_ROJD;
            end if;

            pFC_ACTION := c.FC_ACTION;
            pFC_IDENT := c.FC_IDENT;
           end loop;
           DoInsertPac;
          else
           NULL;
          end if;
         end if;
        end if;
       end if;
      end if;
     end if;
    END if;
  end if;
end;
/

SHOW ERRORS;


