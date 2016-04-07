DROP PROCEDURE ASU.DO_CREATE_USLUG_FROM_PROF
/

--
-- DO_CREATE_USLUG_FROM_PROF  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TPROFP_LIST_NAZ (Table)
--   TPAC_INSURANCE (Table)
--   TPAYER (Table)
--   TAMBTALON (Table)
--   TAMBTALON_NAZ (Table)
--   TAPPENDIX_NAZ (Table)
--   TINSURDOCS (Table)
--   TSMID (Table)
--   PKG_PLATUSLUG (Package)
--   PKG_REGIST_PACFUNC (Package)
--   PKG_USLUGI (Package)
--   VNAZ (Table)
--   TPLAT_USLUG (Table)
--
CREATE OR REPLACE PROCEDURE ASU.do_create_uslug_from_prof(pFK_LISTID IN NUMBER,
                                                      AMB        IN number,
                                                      APP        IN NUMBER,
                                                      pFK_SOTRID in number) IS

  v_capacityid NUMBER;
  v_payerid    NUMBER;
  v_peplid     NUMBER;
  pPlatUslugID NUMBER;
  v_app_pay    NUMBER;
  BILL_ID      number;
  v_cnt        number;
Begin

  v_peplid := asu.pkg_regist_pacfunc.GET_PEPL_ID(AMB);
  BILL_ID  := asu.pkg_platuslug.CREATE_BILL(App,
                                            pFK_SOTRID,
                                            sysdate,
                                            asu.pkg_platuslug.GET_NEWBILLNUM);
  SELECT MAX(FK_ID)
    INTO v_capacityid
    FROM ASU.TSMID
   WHERE FC_SYNONIM = 'PAYER_RENTABEL_DEFAULT';
  -- Ii?aaaeyai ieaoaeuueea oneoa (Nai iaoeaio)
  v_payerid := ASU.PKG_PLATUSLUG.GET_NEWOREXISTSPAYER_PEPL(v_peplid,
                                                           v_capacityid);
  SELECT COUNT(1), MAX(P.FK_ID), MAX(P.FK_CAPACITY)
    INTO v_cnt, v_payerid, v_capacityid
    FROM ASU.TPAYER P
   WHERE P.FK_PEOPLEID = v_peplid;
  IF v_cnt = 0 THEN
    SELECT MAX(FK_DEFAULT)
      INTO v_capacityid
      FROM ASU.TSMID
     WHERE FC_SYNONIM = 'PAYER_RENTABEL';
    v_payerid := ASU.PKG_PLATUSLUG.CREATE_PAYER_PHIS(v_peplid, v_capacityid);
  END IF;
  v_app_pay := ASU.PKG_PLATUSLUG.DOPAYER_TOAPPENDIX(APP,
                                                    v_payerid,
                                                    null,
                                                    v_capacityid);

  for c in (select TT.*,
                   ASU.PKG_USLUGI.GET_HEAL_COST(HEAL_ID, TRUNC(TT.FD_NAZ)) as COST
              from (

                    select T.*,

                            NVL(ASU.PKG_USLUGI.GET_HEAL_ID_BY_SMID_TYPE_VOZR(T.FK_SMID,
                                                                         T.FK_PACID,
                                                                         T.FD_NAZ,
                                                                         TypeOplID,
                                                                         trunc(months_between(T.FD_NAZ,
                                                                                              SYSDATE) / 12)),-1) as HEAL_ID

                      from (Select App,
                                    AMB,
                                    VNAZ.FK_ID as FK_NAZID,
                                    VNAZ.FK_ISPOLID,
                                    VNAZ.FK_SMID,
                                    VNAZ.FK_PACID,
                                    VNAZ.FD_NAZ,
                                    VNAZ.FD_RUN,
                                    VNAZ.FK_NAZSOSID,
                                    NVL((select FK_TYPEDOCID
                                          from ASU.TINSURDOCS,
                                               ASU.TAMBTALON,
                                               ASU.TAMBTALON_NAZ
                                         where TAMBTALON_NAZ.FK_NAZID =
                                               VNAZ.FK_ID
                                           and TAMBTALON_NAZ.FK_TALONID =
                                               TAMBTALON.FK_ID
                                           and TAMBTALON.FK_INSURANCEID =
                                               TINSURDOCS.FK_ID),

                                        (select FK_TYPEDOCID
                                           from ASU.TINSURDOCS, ASU.TPAC_INSURANCE
                                          where TPAC_INSURANCE.FK_INSURDOCID =
                                                TINSURDOCS.FK_ID
                                            and TPAC_INSURANCE.FK_PACID =
                                                VNAZ.FK_PACID)) as TypeOplID

                               from ASU.tprofp_list_naz, asu.VNAZ
                              where tprofp_list_naz.FK_LISTID = pFK_LISTID
                                and VNAZ.FK_ID = tprofp_list_naz.FK_NAZID) T) TT)
  loop
   if (c.Cost > 0 ) and (c.HEAL_ID > -1) then
     INSERT INTO ASU.TAPPENDIX_NAZ
       (fk_appendixID, fk_nazID, fk_PacID)
     VALUES
       (APP, c.fk_nazid, c.FK_PACID);

     INSERT INTO ASU.TPLAT_USLUG
       (FK_NAZ,
        FN_COUNT,
        FK_ASSUMEISPOL,
        FP_SOS,
        FD_RUNASSUME,
        FN_COST,
        FK_HEAL,
        FN_DURATION)
     VALUES
       (c.fk_nazid,
        1,
        C.fk_ispolid,
        c.fk_nazsosid,
        c.fd_run,
        c.Cost,
        c.HEAL_ID,
        10)
     returning FK_ID into pPlatUslugID;
     v_cnt := asu.pkg_platuslug.ADD_USLUG_TOBILL(Bill_ID,pPlatUslugID,c.Cost,1);
   end if;
  end loop;
End;
/

SHOW ERRORS;


