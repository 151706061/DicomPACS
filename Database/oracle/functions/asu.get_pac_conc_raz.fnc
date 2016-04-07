DROP FUNCTION ASU.GET_PAC_CONC_RAZ
/

--
-- GET_PAC_CONC_RAZ  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   XMLTYPE (Type)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   GET_SOTRNAME (Function)
--   TPROFP_LIST_NAZ (Table)
--   TSMID (Table)
--   VNAZ (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PAC_CONC_RAZ" (pPacid NUMBER,
                                                 nChSum OUT NUMBER)
  RETURN CLOB IS
  -- Created by Nikul E. 14.12.2013
  -- Собирает раздел Заключения специалистов
  cResult CLOB;
BEGIN
  NCHSUM := 0;
  FOR C IN (SELECT XMLELEMENT("CONC",
                              XMLELEMENT("EVDTIME",
                                         TO_CHAR(FD_DATE, 'DD.MM.YYYY HH24:MI')),
                              XMLELEMENT("EVNAME", XMLCDATA(FC_NAME)),
                              XMLELEMENT("EVRES", fc_res),
                              XMLELEMENT("EVCONCTEXT", FC_CONC),
                              XMLELEMENT("EVVRACH", FC_VRACH)) CL,
                              CHKSUM
              FROM (select vnaz.fd_run as fd_date,
                        --asu.get_vetku_smida(vnaz.fk_smid),
                        (select asu.tsmid.fc_name from asu.tsmid where vnaz.fk_smid=asu.tsmid.fk_id) as fc_name,
                        (select asu.tsmid.fc_name from asu.tsmid where plist_naz.fk_resid=asu.tsmid.fk_id) as fc_res,
                        plist_naz.fc_conclusion as fc_conc,
                        login.get_sotrname(vnaz.fk_ispolid) as fc_vrach,
                        length((select asu.tsmid.fc_name from asu.tsmid where plist_naz.fk_resid=asu.tsmid.fk_id)) as CHKSUM
                    from asu.vnaz vnaz, asu.tprofp_list_naz plist_naz, asu.tsmid ts
                    where vnaz.fk_id=plist_naz.fk_nazid
                          and ts.fk_id=vnaz.fk_smid
                          and ts.fk_owner=(select fk_id from asu.tsmid where fc_synonim='KONS_SPEC' and fl_del=0) --нужны только консультации
                          and vnaz.fk_nazsosid=1 --выполненено
                          and vnaz.fk_pacid=pPacID
                    order by fd_date, fc_name)
             )
  LOOP
    NCHSUM  := NCHSUM + C.CHKSUM;
    CRESULT := CRESULT || C.CL.GETCLOBVAL;
  END LOOP;
  RETURN CRESULT;
END;
/

SHOW ERRORS;


