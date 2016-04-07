DROP FUNCTION ASU.GET_KARTA_PROFOSMOTR
/

--
-- GET_KARTA_PROFOSMOTR  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_LOB (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   GET_IBSMIDVALUES (Function)
--   TPROFFACTOR (Table)
--   TPROFFACTOR_PEOPLES (Table)
--   TPROFP_LIST (Table)
--   TPROFP_LIST_NAZ (Table)
--   TIB (Table)
--   TCONTACTS (Table)
--   TDIAG (Table)
--   TAMBULANCE (Table)
--   TPEOPLES (Table)
--   PKG_PROFP (Package)
--   PKG_REGIST_PACFUNC (Package)
--   PKG_REGIST_PEPLFUNC (Package)
--   PKG_SMINI (Package)
--   GET_COMPANY_LONGNAME (Function)
--   GET_MKB10_FROM_TSMID (Function)
--   GET_PACCOMPANY_DOLGNOST (Function)
--   GET_PACCOMPANY_OTDEL (Function)
--   GET_REGISTID (Function)
--   GET_SMIDNAME (Function)
--   GET_STREET (Function)
--   GET_SYNID (Function)
--   GET_TOWN (Function)
--   VNAZ (Table)
--
CREATE OR REPLACE FUNCTION ASU.GET_KARTA_PROFOSMOTR (pFK_PEPLID IN NUMBER) RETURN CLOB IS

    db_name varchar2(10);
    s CLOB;
    S1 VARCHAR2(32767);
    cnt number;


    CURSOR cLpuInfo IS
      SELECT 'г.'||' '||ASU.GET_TOWN(UPPER( ASU.PKG_SMINI.READSTRING( 'CONFIG', 'S_TOWN', '') ) )
             ||', '||ASU.GET_STREET(UPPER(ASU.PKG_SMINI.READSTRING('CONFIG', 'S_STREET', '') ) ) ||','||' '||UPPER( ASU.PKG_SMINI.READSTRING('CONFIG', 'S_HOUSE', '') ) AS LPU_ADDRES,
             'Тел:'||ASU.PKG_SMINI.READSTRING('CONFIG', 'S_PHONE', '')||','||' '||'Факс:'||' '||ASU.PKG_SMINI.READSTRING('CONFIG', 'S_FAX', '') AS LPU_PHONE
        FROM DUAL;

    CURSOR cMain IS
      SELECT TPEOPLES.FC_FAM, TPEOPLES.FC_IM, TPEOPLES.FC_OTCH,
             asu.PKG_REGIST_PEPLFUNC.GET_PEPL_ADRFULL(TPEOPLES.FK_ID) ||' тел '|| TPEOPLES.FC_PHONE FC_ADR,
             asu.PKG_REGIST_PEPLFUNC.GET_PEPL_WORKPLACE(TPEOPLES.FK_ID) FC_RABOTA,
             TPEOPLES.FD_ROJD,
             'Код больного '||pFK_PEPLID||'. Пол: '||LOWER(asu.PKG_REGIST_PEPLFUNC.GET_PEPL_SEX(TPEOPLES.FK_ID)) FC_SEX,
             LOWER(asu.PKG_REGIST_PEPLFUNC.GET_PEPL_SEX(TPEOPLES.FK_ID)) FC_SEX_STRING,

             asu.PKG_REGIST_PEPLFUNC.GET_PEPL_ADRFULL(TPEOPLES.FK_ID)  AS FC_ADR_STRING,
             asu.PKG_REGIST_PEPLFUNC.GET_PEPL_ADRFULL(TPEOPLES.FK_ID, ASU.GET_REGISTID) FC_ADR_REGIST,
             TPEOPLES.FC_PHONE AS FC_PHONE_STRING,
            /*asu.GET_PACCOMPANY(FK_COMPANYID)*/ASU."GET_COMPANY_LONGNAME"(FK_COMPANYID)||' '||ASU.GET_PACCOMPANY_OTDEL(FK_OTDEL)||
            decode(asu.pkg_smini.READSTRING('IBTITUL_LIST','IS_PRINT_RABOTA','0'), '1', ' '||TPEOPLES.FC_RABOTA,'')  AS WORK_PLACE_STR,
            asu.GET_PACCOMPANY_DOLGNOST(FK_DOLGNOST) AS WORK_DOLGN_STR,

            asu.PKG_REGIST_PEPLFUNC.GET_PEPL_INSURANCE(TPEOPLES.FK_ID) AS POLIS_STR,
            /*FK_IBID||'/'||FK_IBY*/ ASU.PKG_REGIST_PACFUNC.GET_PAC_IB(TAmbulance.FK_ID) AS AMBIB_STR,
            to_char(TAmbulance.FK_IBID) AS IBID_STR,
            (SELECT MAX(FC_CONTACT) FROM ASU.TCONTACTS WHERE FK_PACID = TPEOPLES.FK_ID AND FK_TYPE = 11) FC_RABPHONE,
            ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_SNILS(TPEOPLES.FK_ID) SNILS,
            STAT.GET_IBSMIDVALUES(TPEOPLES.FK_ID, 'LD_INV') INV,
            STAT.GET_IBSMIDVALUES(TPEOPLES.FK_ID, 'LD_SOC_POL') SOC_POL,
            STAT.GET_IBSMIDVALUES(TPEOPLES.FK_ID, 'LD_GRAGZ') AS LD_GRAGZ
        FROM TPEOPLES, TAmbulance
         WHERE (TPEOPLES.FK_ID = TAmbulance.fk_peplid) AND (TAmbulance.fk_id = pFK_PEPLID);


  BEGIN
    db_name := ASU.PKG_SMINI.READSTRING('CONFIG', 'DB_NAME', 'H');


    s1   :=
    '<DIV style="FONT-SIZE: 10pt">'  ||CHR(13)||
    '<TABLE width="100%" border=0 cellpadding="0" cellspacing="0">' ||CHR(13)||
    '  <TR>' ||CHR(13)||
    '    <TD width="20%" valign=top>' ||CHR(13)||
    '       ##NBSP' ||CHR(13)||
    '    </TD>' ||CHR(13)||
    '    <TD width="60%" valign=top align=center style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; HEIGHT: 12px" colSpan=3>' ||CHR(13)||
    '        ##S_FULLNAME' ||
    '    </TD>' ||CHR(13)||
    '    <TD width="20%" valign=top>' ||CHR(13)||
    '       ##NBSP' ||
    '    </TD>' ||CHR(13)||
    '  </TR>' ||CHR(13)||

    '  <TR>' ||CHR(13)||
    '    <TD valign=top>' ||CHR(13)||
    '       ##NBSP' ||
    '    </TD>' ||CHR(13)||

    '    <TD valign=bottom align=center style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 36px" colSpan=3>' ||CHR(13)||
    '        ИСТОРИЯ БОЛЕЗНИ № <u>##VALUE107</u>' ||CHR(13)||
    '    </TD>' ||CHR(13)||

    '    <TD valign=top>' ||CHR(13)||
    '       ##NBSP' ||CHR(13)||
    '    </TD>' ||CHR(13)||

    '  <TR>' ||CHR(13)||
    '    <TD valign=top>' ||CHR(13)||
    '       ##NBSP' ||CHR(13)||
    '    </TD>' ||CHR(13)||

    '    <TD valign=bottom align=center style="FONT-WEIGHT: bold; FONT-SIZE: 8pt; HEIGHT: 12px" colSpan=3>' ||CHR(13)||
    '        Консультативно-поликлиническое отделение' ||CHR(13)||
    '    </TD>' ||CHR(13)||

    '    <TD valign=top>' ||CHR(13)||
    '       ##NBSP' ||CHR(13)||
    '    </TD>' ||CHR(13)||

    '  </TR>' ||CHR(13)||
    '</TABLE>' ||CHR(13)||


    '<TABLE width="100%" border=0 cellpadding="0" cellspacing="0" style="FONT-SIZE: 10pt">' ||CHR(13)||
    '  <TR>' ||CHR(13)||
    '    <TD width="15%">1.##NBSPФамилия:</TD>' ||CHR(13)||
    '    <TD class="WhiteRLT" align="center" style="FONT-SIZE: 13pt">' ||CHR(13)||
    '      <B>##VALUE04</B>' ||
    '    </TD>' ||CHR(13)||
    '  </TR>' ||CHR(13)||

    '  <TR>' ||CHR(13)||
    '    <TD width="15%">2.##NBSPИмя:</TD>' ||CHR(13)||
    '    <TD class="WhiteRLT" align="center" style="FONT-SIZE: 13pt">' ||CHR(13)||
    '      <B>##VALUE07</B>' ||
    '    </TD>' ||CHR(13)||
    '  </TR>' ||CHR(13)||

    '  <TR>' ||CHR(13)||
    '    <TD width="15%">3.##160Отчество:</TD>' ||CHR(13)||
    '    <TD class="WhiteRLT" align="center" style="FONT-SIZE: 13pt">' ||CHR(13)||
    '      <B>##VALUE09</B>' ||
    '    </TD>' ||CHR(13)||
    '  </TR>' ||CHR(13)||
    '</TABLE>' ||CHR(13)||


    '<TABLE width="100%" border=0 cellpadding="0" cellspacing="0" style="FONT-SIZE: 10pt">' ||CHR(13)||
    '  <TR>' ||CHR(13)||
    '    <TD width=10%>4.##NBSPПол:##NBSP</TD>' ||CHR(13)||
    '    <TD width="25%" align="center">' ||CHR(13)||
    '      <U><B>##VALUE103</B></U>' ||
    '    </TD>' ||CHR(13)||
    '    <TD width="25%">5.##160Дата##160рождения:##160</TD>' ||CHR(13)||
    '    <TD width="25%" align="center">' ||CHR(13)||
    '      <U><B>##VALUE11</B></U>' ||
    '    </TD>' ||CHR(13)||
    '  </TR>' ||CHR(13)||
    '</TABLE>' ||CHR(13)||


    '<TABLE width="100%" border=0 cellpadding="0" cellspacing="0" style="FONT-SIZE: 10pt">' ||CHR(13)||
    '  <TR>' ||CHR(13)||
    '    <TD width="20%">6.##NBSPМесто##NBSPработы:##160</TD>' ||CHR(13)||
    '    <TD class="WhiteRLT">' ||CHR(13)||
    '      <B>##WORKPLACE</B>' ||
    '    </TD>' ||CHR(13)||
    '  </TR>' ||CHR(13)||
    '</TABLE>' ||CHR(13)||

    '<p style="FONT-SIZE: 10pt"></p>' ||CHR(13)||

    '<TABLE ALIGN="CENTER" WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BORDER="0" STYLE="FONT-FAMILY:TIMES NEW ROMAN; FONT-SIZE:10PT;">' ||CHR(13)||
    '  <TR>' ||CHR(13)||
    '    <TD WIDTH="100%" ALIGN="LEFT" CLASS="WHITEALLNON">##160<br>7.##160Условия труда (в настоящее время):##160</TD>' ||CHR(13)||
    '  </TR>' ||CHR(13)||
    '</TABLE>' ||CHR(13)||


    '<TABLE ALIGN="CENTER" WIDTH="100%" CELLSPACING="0" CELLPADDING="3" BORDER="1" STYLE="FONT-FAMILY:TIMES NEW ROMAN; FONT-SIZE:10PT;">' ||CHR(13)||
    '  <TR>' ||CHR(13)||
    '    <TD WIDTH="10%" ALIGN="CENTER" CLASS="WHITER"><b>Код</b></TD>' ||CHR(13)||
    '    <TD ALIGN="CENTER" CLASS="WHITER"><b>Наименование производственного фактора, вида работ</b></TD>' ||CHR(13)||
    '  </TR>' ||CHR(13);

    cnt := 0;

    FOR PF IN (SELECT pp.fk_pacid,
                      a.code,
                      a.name,
                      pp.FC_FAK_FAK,
                      pp.rowid

                 FROM asu.tproffactor_peoples pp,
                      asu.tproffactor a,
                      asu.tprofp_list tpl

                 WHERE pp.fk_profactor = a.fk_id
                   AND pp.fk_pacid = tpl.fk_id
                   and tpl.fk_ambulanceid = pFK_PEPLID

                 ORDER BY
                   nvl( to_number(regexp_substr(code, '([[:digit:]]+)',1,1)),0),
                   nvl( to_number(regexp_substr(code, '([[:digit:]]+)',1,2)),0),
                   nvl( to_number(regexp_substr(code, '([[:digit:]]+)',1,3)),0),
                   nvl( to_number(regexp_substr(code, '([[:digit:]]+)',1,4)),0),
                   nvl( to_number(regexp_substr(code, '([[:digit:]]+)',1,5)),0),
                   nvl( to_number(regexp_substr(code, '([[:digit:]]+)',1,6)),0)
              )
    LOOP
      s1 := s1 ||
      '  <TR>' ||CHR(13)||
      '    <TD ALIGN="CENTER" CLASS="WHITERT">' || PF.CODE || '</TD>' ||CHR(13)||
      '    <TD ALIGN="LEFT" CLASS="WHITERT">' || PF.NAME || '</TD>'   ||CHR(13)||
      '  </TR>' ||CHR(13);

      cnt := cnt + 1;
    END LOOP;

    if (cnt <= 0) then
      s1 := s1 ||
      '  <TR>' ||CHR(13)||
      '    <TD ALIGN="CENTER" CLASS="WHITERT">##160</TD>' ||CHR(13)||
      '    <TD ALIGN="LEFT" CLASS="WHITERT">##160</TD>'   ||CHR(13)||
      '  </TR>' ||CHR(13)||

      '  <TR>' ||CHR(13)||
      '    <TD ALIGN="CENTER" CLASS="WHITERT">##160</TD>' ||CHR(13)||
      '    <TD ALIGN="LEFT" CLASS="WHITERT">##160</TD>'   ||CHR(13)||
      '  </TR>' ||CHR(13)||

      '  <TR>' ||CHR(13)||
      '    <TD ALIGN="CENTER" CLASS="WHITERT">##160</TD>' ||CHR(13)||
      '    <TD ALIGN="LEFT" CLASS="WHITERT">##160</TD>'   ||CHR(13)||
      '  </TR>' ||CHR(13);
    end if;

    s1 := s1 ||
    '</TABLE>';

    DBMS_LOB.CREATETEMPORARY(s, TRUE, DBMS_LOB.SESSION);
    DBMS_LOB.WRITEAPPEND(s, LENGTH(s1), s1);

    s1 := s1 ||
    '<p style="FONT-SIZE: 10pt"></p>' ||CHR(13)||


    '<TABLE ALIGN="CENTER" WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BORDER="0" STYLE="FONT-FAMILY:TIMES NEW ROMAN; FONT-SIZE:10PT;">' ||CHR(13)||
    '  <TR>' ||CHR(13)||
    '    <TD WIDTH="100%" ALIGN="LEFT" CLASS="WHITEALLNON">##160<br>8.##160Заключение по обследованию##160</TD>' ||CHR(13)||
    '  </TR>' ||CHR(13)||
    '</TABLE>' ||CHR(13) ||


    '<TABLE ALIGN="CENTER" WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BORDER="0" STYLE="FONT-FAMILY:TIMES NEW ROMAN; FONT-SIZE:10PT;">' ||CHR(13)||
    '  <TR>' ||CHR(13)||
    '    <TD WIDTH="100%" ALIGN="LEFT" CLASS="WHITEALLNON">Диагноз:##160</TD>' ||CHR(13)||
    '  </TR>' ||CHR(13);

    cnt := 0;

    FOR DS IN (select d.fc_write || ' (' || asu.get_mkb10_from_tsmid(d.fk_mkb_10) || ')' AS X
                 from asu.tdiag d
                where d.fk_nazid in (select fk_id -- max(fk_id)
                                       from asu.vnaz v
                                      where v.fk_pacid = pFK_PEPLID
                                        and v.fk_smid = asu.pkg_profp.GET_ZAKL_PROFP
                                        -- in (select fk_id from asu.tsmid where fc_synonim = 'GET_ZAKL_PROF')
                                    )
                order by d.fd_date
              )
    LOOP
      s1 := s1 ||
      '  <TR>' ||CHR(13)||
      '    <TD WIDTH="100%" ALIGN="LEFT" class="WhiteRLT">' || DS.X || ';<br></TD>' ||CHR(13)||
      '  </TR>' ||CHR(13);

      cnt := cnt + 1;
    END LOOP;

    if (cnt <= 0) then
      s1 := s1 ||
      '  <TR>' ||CHR(13)||
      '    <TD WIDTH="100%" ALIGN="LEFT" class="WhiteRLT">##160</TD>' ||CHR(13)||
      '  </TR>' ||CHR(13);
    end if;

    s1 := s1 ||
    '</TABLE>' ||CHR(13);

    DBMS_LOB.CREATETEMPORARY(s, TRUE, DBMS_LOB.SESSION);
    DBMS_LOB.WRITEAPPEND(s, LENGTH(s1), s1);

    s1 := s1 ||
    '<p style="FONT-SIZE: 10pt"></p>' ||CHR(13)||

    '<TABLE ALIGN="CENTER" WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BORDER="0" STYLE="FONT-FAMILY:TIMES NEW ROMAN; FONT-SIZE:10PT;">' ||CHR(13)||
    '  <TR>' ||CHR(13)||
    '    <TD WIDTH="100%" ALIGN="LEFT" CLASS="WHITEALLNON">##160<br>Трудовые рекомендации:##160</TD>' ||CHR(13)||
    '  </TR>' ||CHR(13);

    FOR RC IN (SELECT fc_recommends
                 FROM asu.tprofp_list_naz l
                WHERE fk_nazid in (select fk_id --max(fk_id)
                                     from asu.vnaz v
                                    where v.fk_pacid = pFK_PEPLID
                                      and v.fk_smid = asu.pkg_profp.GET_ZAKL_PROFP
                                      --in (select fk_id from asu.tsmid where fc_synonim = 'GET_ZAKL_PROF')
                                  )
                --  AND rownum < 2
              )
    LOOP
      s1 := s1 ||
      '  <TR>' ||CHR(13)||
      '    <TD WIDTH="100%" ALIGN="LEFT" class="WhiteRLT">' || RC.FC_RECOMMENDS || '<br></TD>' ||CHR(13)||
      '  </TR>' ||CHR(13);
    END LOOP;

    FOR CH IN (select asu.get_smidname(fk_smid) X
                 from asu.tib
                where fk_pacid in (select fk_id
                                     from asu.tprofp_list_naz
                                    where fk_nazid in (select max(fk_id)
                                                         from asu.vnaz v
                                                        where v.fk_pacid = pFK_PEPLID
                                                          and v.fk_smid 
                                                          = asu.pkg_profp.GET_ZAKL_PROFP
                                                          --in (select fk_id from asu.tsmid where fc_synonim = 'GET_ZAKL_PROF')
                                                      )
                                  )
                  and fk_smeditid = asu.get_synid('PAC_PROFP_NOTES', 0)
              )
    LOOP
      s1 := s1 ||
      '  <TR>' ||CHR(13)||
      '    <TD WIDTH="100%" ALIGN="LEFT" class="WhiteRLT">' || CH.X || '<br></TD>' ||CHR(13)||
      '  </TR>' ||CHR(13);
    END LOOP;

    s1 := s1 ||
    '</TABLE>' ||CHR(13);



    DBMS_LOB.CREATETEMPORARY(s, TRUE, DBMS_LOB.SESSION);
    DBMS_LOB.WRITEAPPEND(s, LENGTH(s1), s1);


    s1 := s1 ||
    '<p style="FONT-SIZE: 10pt">##160</p>' ||CHR(13)||

    '<TABLE ALIGN="CENTER" WIDTH="100%" CELLSPACING="0" CELLPADDING="2" BORDER="0" STYLE="FONT-FAMILY:TIMES NEW ROMAN; FONT-SIZE:10PT;">' ||CHR(13)||
    '  <TR>' ||CHR(13)||
    '    <TD WIDTH="2%" ALIGN="right" CLASS="WHITEALLNON">Дата##160</TD>' ||CHR(13)||
    '    <TD WIDTH="10%" ALIGN="LEFT" CLASS="WhiteRLT">##160</TD>' ||CHR(13)||
    '    <TD WIDTH="5%" ALIGN="LEFT" CLASS="WHITEALLNON">##160</TD>' ||CHR(13)||
    '    <TD WIDTH="30%" ALIGN="right" CLASS="WHITEALLNON">Подпись врача-консультанта##160</TD>' ||CHR(13)||
    '    <TD WIDTH="15%" ALIGN="LEFT" CLASS="WhiteRLT">##160</TD>' ||CHR(13)||
    '    <TD ALIGN="LEFT" CLASS="WHITEALLNON">##160</TD>' ||CHR(13)||
    '  </TR>' ||CHR(13)||

    '  <TR valign=bottom height="24px">' ||CHR(13)||
    '    <TD WIDTH="2%" ALIGN="right" CLASS="WHITEALLNON">##160</TD>' ||CHR(13)||
    '    <TD WIDTH="10%" ALIGN="LEFT" CLASS="WHITEALLNON">##160</TD>' ||CHR(13)||
    '    <TD WIDTH="5%" ALIGN="LEFT" CLASS="WHITEALLNON">##160</TD>' ||CHR(13)||
    '    <TD WIDTH="30%" ALIGN="right" CLASS="WHITEALLNON">Подпись зав.облпрофцентром##160</TD>' ||CHR(13)||
    '    <TD WIDTH="15%" ALIGN="LEFT" CLASS="WhiteRLT">##160</TD>' ||CHR(13)||
    '    <TD ALIGN="LEFT" CLASS="WHITEALLNON">##160</TD>' ||CHR(13)||
    '  </TR>' ||CHR(13)||
    '</TABLE>' ||CHR(13)||


    '<p style="FONT-SIZE: 10pt">##160</p>' ||CHR(13)||


    '<TABLE ALIGN="CENTER" WIDTH="100%" CELLSPACING="0" CELLPADDING="2" BORDER="0" STYLE="FONT-FAMILY:TIMES NEW ROMAN; FONT-SIZE:10PT;">' ||CHR(13)||
    '  <TR>' ||CHR(13)||
    '    <TD WIDTH="25%" ALIGN="right" CLASS="WHITEALLNON">Дата выдачи заключения##160</TD>' ||CHR(13)||
    '    <TD WIDTH="10%" ALIGN="LEFT" CLASS="WhiteRLT">##160</TD>' ||CHR(13)||
    '    <TD WIDTH="5%" ALIGN="LEFT" CLASS="WHITEALLNON">##160</TD>' ||CHR(13)||
    '    <TD WIDTH="15%" ALIGN="right" CLASS="WHITEALLNON">##160</TD>' ||CHR(13)||
    '    <TD WIDTH="15%" ALIGN="LEFT" CLASS="WHITEALLNON">##160</TD>' ||CHR(13)||
    '    <TD ALIGN="LEFT" CLASS="WHITEALLNON">##160</TD>' ||CHR(13)||
    '  </TR>' ||CHR(13)||

    '  <TR valign=bottom height="24px">' ||CHR(13)||
    '    <TD WIDTH="25%" ALIGN="right" CLASS="WHITEALLNON">Извещение выслано##160</TD>' ||CHR(13)||
    '    <TD WIDTH="10%" ALIGN="LEFT" CLASS="WhiteRLT">##160</TD>' ||CHR(13)||
    '    <TD WIDTH="5%" ALIGN="LEFT" CLASS="WHITEALLNON">##160</TD>' ||CHR(13)||
    '    <TD WIDTH="15%" ALIGN="right" CLASS="WHITEALLNON">Подпись##160</TD>' ||CHR(13)||
    '    <TD WIDTH="15%" ALIGN="LEFT" CLASS="WhiteRLT">##160</TD>' ||CHR(13)||
    '    <TD ALIGN="LEFT" CLASS="WHITEALLNON">##160</TD>' ||CHR(13)||
    '  </TR>' ||CHR(13)||

    '  <TR valign=top>' ||CHR(13)||
    '    <TD WIDTH="25%" ALIGN="right" CLASS="WHITEALLNON">##160</TD>' ||CHR(13)||
    '    <TD WIDTH="10%" ALIGN="center" CLASS="WHITEALLNON" STYLE="FONT-SIZE:8PT;">(дата)##160</TD>' ||CHR(13)||
    '    <TD WIDTH="5%" ALIGN="LEFT" CLASS="WHITEALLNON">##160</TD>' ||CHR(13)||
    '    <TD WIDTH="15%" ALIGN="right" CLASS="WHITEALLNON">##160</TD>' ||CHR(13)||
    '    <TD WIDTH="15%" ALIGN="LEFT" CLASS="WHITEALLNON">##160</TD>' ||CHR(13)||
    '    <TD ALIGN="LEFT" CLASS="WHITEALLNON">##160</TD>' ||CHR(13)||
    '  </TR>' ||CHR(13)||
    '</TABLE>' ||CHR(13);

    DBMS_LOB.CREATETEMPORARY(s, TRUE, DBMS_LOB.SESSION);
    DBMS_LOB.WRITEAPPEND(s, LENGTH(s1), s1);




    FOR NM IN (select asu.pkg_smini.readstring('CONFIG', 'S_FULLNAME', ' ') AS s_fullname from dual)
    LOOP
      S := REPLACE(S, '##S_FULLNAME', NM.S_FULLNAME);
    END LOOP;

    S := REPLACE(S, '##NBSP', '&nbsp;');
    S := REPLACE(S, '##160', '&#160;');
--    S := REPLACE(S, '##160', ' ');

    S := REPLACE(s, '##VID_OPL', '');
    S := REPLACE(s, '##STRAH_ORG', '');

    FOR p in cMain LOOP
       s := REPLACE(s, '##VALUE03', p.FC_SEX);
       s := REPLACE(s, '##VALUE04', p.FC_FAM);
       s := REPLACE(s, '##VALUE07', p.FC_IM);
       s := REPLACE(s, '##VALUE09', p.FC_OTCH);
       s := REPLACE(s, '##VALUE11', TO_CHAR(p.FD_ROJD, 'dd/mm/yyyy'));
       s := REPLACE(s, '##VALUE13', p.FC_RABOTA);
       s := REPLACE(s, '##VALUE16', p.FC_ADR);
       s := REPLACE(s, '##SNILS', p.SNILS);
       s := REPLACE(s, '##VALUE101', p.FC_ADR_STRING);
       s := REPLACE(s, '##VALUE102', p.FC_PHONE_STRING);
       s := REPLACE(s, '##VALUE103', p.FC_SEX_STRING);
       s := REPLACE(s, '##VALUE104', p.WORK_PLACE_STR);
       s := REPLACE(s, '##VALUE105', p.WORK_DOLGN_STR);
       s := REPLACE(s, '##WORKPLACE', p.WORK_PLACE_STR || ' ' ||p.WORK_DOLGN_STR);
       s := REPLACE(s, '##INVALID', p.INV);
       s := REPLACE(s, '##LD_GRAGZ', p.LD_GRAGZ);
       s := REPLACE(s, '##VALUE106', p.POLIS_STR);
       s := REPLACE(s, '##NUMBER_FONTSIZE', '12');
       s := REPLACE(s, '##VALUE107', p.AMBIB_STR);
       s := REPLACE(s, '##OGRN', '');
       s := REPLACE(s, '##VALUE109', p.FC_RABPHONE);
       s := REPLACE(s, '##FC_ADR_REGIST', p.FC_ADR_REGIST);
    END LOOP;

    FOR p in cLpuInfo LOOP
      s := REPLACE(s, '##VALUE108', p.LPU_ADDRES);
    END LOOP;

    s1 := '</DIV>';
    s1 := s1 || '<br style="page-break-before:always">';

    DBMS_LOB.WRITEAPPEND(s, LENGTH(s1), s1);

    RETURN s;
END;
/

SHOW ERRORS;


