CREATE OR REPLACE FUNCTION stat.GET_FO25_04_ONKO (pFK_PEPLID IN NUMBER, pRegistration NUMBER DEFAULT 0) RETURN CLOB IS
-------------------------------
--created sum.2006   by MEO  --
--modify  09.10.2006 by XAND --
----------------------------------------
--MODIFIED 25.06.2007 BY SPASSKIY S.N --
--FOR TAMBULANCE.FK_ID ONLY           --
----------------------------------------
-- 27.04.2009 Ефимов В.А.
-- Добавлена уникальная обработка Радужного (db_name = 'R')
----------------------------------------
     sTmp VARCHAR2(32767);
     db_name varchar2(10);
     s    CLOB;
     isDD BOOLEAN DEFAULT FALSE;
     S1 VARCHAR2(32767);
     S11 VARCHAR2(32767);
     S2 VARCHAR2(32767);
     S3 VARCHAR2(32767);
     S4 VARCHAR2(32767);
     S5 VARCHAR2(32767);
     S6 VARCHAR2(32767);
     s_socpol VARCHAR2(32767);



    CURSOR cLpuInfo IS
        SELECT
            'г.'||' '||ASU.GET_TOWN(UPPER( ASU.PKG_SMINI.READSTRING( 'CONFIG', 'S_TOWN', '') ) )
            ||', '||ASU.GET_STREET(UPPER(ASU.PKG_SMINI.READSTRING('CONFIG', 'S_STREET', '') ) ) ||','||' '||UPPER( ASU.PKG_SMINI.READSTRING('CONFIG', 'S_HOUSE', '') ) AS LPU_ADDRES,
            'Тел:'||ASU.PKG_SMINI.READSTRING('CONFIG', 'S_PHONE', '')||','||' '||'Факс:'||' '||ASU.PKG_SMINI.READSTRING('CONFIG', 'S_FAX', '') AS LPU_PHONE
        FROM
            DUAL;

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
            decode(asu.pkg_smini.READSTRING('IBTITUL_LIST','IS_PRINT_RABOTA','0'), '1',
             ' '||TPEOPLES.FC_RABOTA,'')  AS WORK_PLACE_STR,
            asu.GET_PACCOMPANY_DOLGNOST(FK_DOLGNOST) AS WORK_DOLGN_STR,
            asu.PKG_REGIST_PEPLFUNC.GET_PEPL_INSURANCE(TPEOPLES.FK_ID) AS POLIS_STR,
            FK_IBID||'/'||FK_IBY  AS AMBIB_STR,
            to_char(TAmbulance.FK_IBID) AS IBID_STR,
            (SELECT MAX(FC_CONTACT) FROM ASU.TCONTACTS WHERE FK_PACID = TPEOPLES.FK_ID AND FK_TYPE = 11) FC_RABPHONE,
            ASU.PKG_REGIST_PEPLFUNC.GET_PEPL_SNILS(TPEOPLES.FK_ID) SNILS,
            STAT.GET_IBSMIDVALUES(TPEOPLES.FK_ID, 'LD_INV') INV,
            STAT.GET_IBSMIDVALUES(TPEOPLES.FK_ID,'LD_INV_DOCSERNO') as INV_DOC,
            STAT.GET_IBSMIDVALUES(TPEOPLES.FK_ID,'DATE_UST_INVAL') as INV_DOC_DATE,
            STAT.GET_IBSMIDVALUES(TPEOPLES.FK_ID, 'LD_SOC_POL') SOC_POL,
            STAT.GET_IBSMIDVALUES(TPEOPLES.FK_ID, 'LD_GRAGZ') AS LD_GRAGZ
        FROM TPEOPLES, TAmbulance
         WHERE (TPEOPLES.FK_ID = TAmbulance.fk_peplid) AND (TAmbulance.fk_id = pFK_PEPLID);
--       WHERE (TPEOPLES.FK_ID = pFK_PEPLID) AND (TAmbulance.fk_peplid = TPEOPLES.fk_id);

    CURSOR cDiags IS
      SELECT FC_WRITE FC_NAME, TSMID.FK_MKB10, FD_DATE
        FROM (SELECT TDIAG.FK_SMDIAGID, TDIAG.FD_DATE, TDIAG.FC_WRITE
                FROM TDIAG
               WHERE FK_PACID = pFK_PEPLID/*IN
                     (SELECT FK_ID FROM TKARTA WHERE FK_PEPLID = pFK_PEPLID
                       UNION
                      SELECT FK_ID FROM TAMBULANCE WHERE FK_PEPLID = pFK_PEPLID
                       UNION
                      SELECT FK_ID FROM asu.TDOC WHERE FK_PACID = pFK_PEPLID)*/
                 AND TDIAG.FP_TYPE = PKG_STATUTIL.GET_SMIDID('PRI_VYPISKE')
                 AND TDIAG.FL_MAIN = PKG_STATUTIL.GET_SMIDID('MAIN')
                 AND TDIAG.FL_SHOWIB = 1
             --  GROUP BY TDIAG.FK_SMDIAGID
               ), TSMID
      WHERE TSMID.FK_ID = FK_SMDIAGID
      ORDER BY FD_DATE DESC;

    CURSOR cVakcine IS
      SELECT TO_CHAR(MAX(FD_RUN),'dd.mm.yyyy') FD_RUN,
             FK_SMID,
             asu.GET_SMIDNAME(FK_SMID) FC_NAME,
             SUM(asu.GET_PROCCOUNT(FK_ID)) FN_COUNT,
             SUM(asu.GET_NAZDONE(FK_ID)) FN_DONE
        FROM TNAZLECH
       WHERE FK_PACID = pFK_PEPLID /*IN
             (SELECT FK_ID
                FROM TKARTA
               WHERE FK_PEPLID = pFK_PEPLID
              UNION
              SELECT FK_ID
                FROM TAMBULANCE
               WHERE FK_PEPLID = pFK_PEPLID
              UNION
              SELECT FK_ID FROM asu.TDOC WHERE FK_PACID = pFK_PEPLID)*/
         AND FK_SMID IN (SELECT FK_ID FROM TSMID WHERE TSMID.FC_SYNONIM = 'VAKCINE')
       GROUP BY FK_SMID
       ORDER BY FD_RUN;

    CURSOR cRadio IS
      SELECT TO_CHAR(D, 'DD.MM.YYYY') FD_RUN,
             asu.GET_SMIDNAME(VNAZ.FK_SMID) FC_NAME,
             VRES.FC_RES
        FROM VRES, VNAZ,
             (SELECT FK_SMID S, MAX(VNAZ.FD_RUN) D
                FROM VNAZ
               WHERE VNAZ.FK_PACID = pFK_PEPLID/*IN
                     (SELECT FK_ID
                        FROM TKARTA
                       WHERE FK_PEPLID = pFK_PEPLID
                      UNION
                      SELECT FK_ID
                        FROM TAMBULANCE
                       WHERE FK_PEPLID = pFK_PEPLID
                      UNION
                      SELECT FK_ID FROM asu.TDOC WHERE FK_PACID = pFK_PEPLID)*/
                 AND VNAZ.FK_NAZSOSID = asu.GET_VIPNAZ
                 AND VNAZ.FK_SMID IN
                     (SELECT FK_ID
                        FROM TSMID
                       CONNECT BY PRIOR fk_id=fk_owner START WITH TSMID.FC_SYNONIM ='ISL_RENTGN')
               GROUP BY VNAZ.FK_SMID)
       WHERE VNAZ.FK_PACID = pFK_PEPLID /* IN
             (SELECT FK_ID
                FROM TKARTA
               WHERE FK_PEPLID = pFK_PEPLID
              UNION
              SELECT FK_ID
                FROM TAMBULANCE
               WHERE FK_PEPLID = pFK_PEPLID
              UNION
              SELECT FK_ID FROM asu.TDOC WHERE FK_PACID = pFK_PEPLID)*/
         AND VNAZ.FK_NAZSOSID = asu.GET_VIPNAZ
         AND VRES.FK_NAZID = VNAZ.FK_ID
         AND VRES.FK_SMID = S
         AND VNAZ.FD_RUN = D
       ORDER BY FD_RUN;
    CURSOR cAllerg IS
      SELECT FK_ID FROM TKARTA WHERE FK_PEPLID = pFK_PEPLID
       UNION
      SELECT FK_ID FROM TAMBULANCE WHERE FK_PEPLID = pFK_PEPLID
       UNION
      SELECT FK_ID FROM asu.TDOC WHERE FK_PACID = pFK_PEPLID
       ORDER BY FK_ID DESC;

    bLechVrach NUMBER;
    bDiag BOOLEAN:=FALSE;
    bProfResult BOOLEAN:=FALSE;
    bVakcine BOOLEAN:=FALSE;
    bRadio BOOLEAN:=FALSE;
    bAllerg BOOLEAN:=FALSE;

    cTemp VARCHAR2(32767);

  BEGIN
    db_name := ASU.PKG_SMINI.READSTRING('CONFIG', 'DB_NAME', 'H');

    IF db_name <> 'M' THEN
    s1   :=
    '<DIV style="FONT-SIZE: 10pt">'  ||CHR(13)||
    '<TABLE width="100%" border=0 cellpadding="0" cellspacing="0">' ||CHR(13)||
    --'  <TBODY style="FONT-SIZE: 10pt">' ||CHR(13)||
    '  <TR>' ||CHR(13)||
    '    <TD width="55%" valign=top>' ||CHR(13)||
    '      <TABLE width="100%" border=0 cellpadding="0" cellspacing="0" style="FONT-SIZE: 8pt">' ||CHR(13)||
    '        <TR>' ||CHR(13)||
    '          <TD align=middle valign=top bordercolor=black style="BORDER-BOTTOM: 1pt solid">' ||CHR(13)||
    '#MINISTER' ||CHR(13)||
    --'      Министерство здравоохранения и социального развития Российской Федерации' ||CHR(13)||
    --'      <BR>' ||CHR(13)||
    '      <BR>' ||CHR(13)||
    '           <B>##VALUE00</B>' ||CHR(13)||
    '      </TD>    ' ||CHR(13)||
    '    </TR>' ||CHR(13)||
    '        <TR>' ||CHR(13)||
    '          <TD align=middle valign=top bordercolor=black style="BORDER-BOTTOM: 1pt solid">' ||CHR(13)||
    '            (наименование медицинского учреждения)' ||CHR(13)||
    --'            <BR>' ||CHR(13)||
    '      <BR>##VALUE108' ||CHR(13)||
    '      </TD>' ||CHR(13)||
    '        </TR>' ||CHR(13)||
    '        <TR>' ||CHR(13)||
    '          <TD align=middle valign=top">' ||CHR(13)||
    '          (адрес)' ||CHR(13)||
    '          <BR>'||CHR(13)||
    /*'          <BR>' ||CHR(13)||*/
    '          </TD>' ||CHR(13)||
    '        </TR>' ||CHR(13)||
    '       </TABLE>' ||CHR(13)||
    '  </TD>' ||CHR(13)||
    '    <TD width="10%"></TD>' ||CHR(13)||
    '    <TD width="45%" valign=center align=left style="FONT-SIZE: 8pt">' ||CHR(13)||
    '    Медицинская документация' ||CHR(13)||
    '    <BR>Форма № 025/у-04' ||CHR(13)||
    '    <BR>утверждена Приказом Минздравсоцразвития России' ||CHR(13)||
    '    <BR>от 22.11.2004 № 255' ||CHR(13)||
    '  </TD>' ||CHR(13)||
    '  </TR>' ||CHR(13)||
    '  <TR>' ||CHR(13)||
    '    <TD width="45%" colSpan=1 style="FONT-SIZE: 8pt">Код ОГРН: ##OGRN<BR>' ||
    '  <TR valign=center align=middle>' ||CHR(13)||
    '    <TD style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 12px" colSpan=3>' ||CHR(13)||
    '    МЕДИЦИНСКАЯ КАРТА АМБУЛАТОРНОГО БОЛЬНОГО (ОНКО)' ||CHR(13)||
    '      <TR valign=center align=middle>' ||CHR(13)||
    '        <TD style="FONT-WEIGHT: bold; FONT-SIZE: ##NUMBER_FONTSIZEpt" colSpan=3>' ||CHR(13)||
    '        № ##VALUE107' ||CHR(13)||
    '        </TD>' ||CHR(13)||
    '      </TR>' ||CHR(13)||
    '    </TD>' ||CHR(13)||
    '  </TR>' ||CHR(13)||
    '</TABLE>'||CHR(13);
    s11   :=
    '<TABLE width="100%" border=0 cellpadding="0" cellspacing="0" style="FONT-SIZE: 10pt">' ||CHR(13)||
    '  <TR style="FONT-SIZE: 10pt">' ||CHR(13)||
    '    <TD width="1%">' ||CHR(13)||
    '        Вид;оплаты:;</TD>' ||CHR(13)||
    '    <TD idth="10%" colspan=2><B>##VID_OPL</B></TD>' ||CHR(13)||
    '  </TR>' ||CHR(13)||
    '</TABLE>'||CHR(13);
    S2    :=
    '<TABLE width="100%" border=0 cellpadding="0" cellspacing="0" style="FONT-SIZE: 10pt">' ||CHR(13)||
    '  <TR style="FONT-SIZE: 10pt">' ||CHR(13)||
    '    <TD width="1%">' ||CHR(13)||
    '    1. Страховая медицинская организация:</TD>' ||CHR(13)||
    '    <TD Width="10%"><B>##STRAH_ORG</B></TD>' ||CHR(13)||
    '  </TR>' ||CHR(13)||
    '</TABLE>'||CHR(13)||
    '<TABLE width="100%" border=0 cellpadding="0" cellspacing="0" style="FONT-SIZE: 10pt">' ||CHR(13)||
    '  <TR>' ||CHR(13)||
    '    <TD width="1%">' ||CHR(13)||
    '    2. Номер страхового полиса: </TD>' ||CHR(13)||
    '    <TD Width="10%" colspan=2>'||CHR(13)||'<B>##VALUE106</B></TD>' ||CHR(13)||
    '    </TD>' ||CHR(13)||
    '  </TR>' ||CHR(13)||
    '</TABLE>'||CHR(13)||
    '<TABLE width="100%" border=0 cellpadding="0" cellspacing="0" style="FONT-SIZE: 10pt">' ||CHR(13)||
    '  <TR>' ||CHR(13)||
    '    <TD width="1%">3. Код льготы:</TD>' ||CHR(13)||
    '    <TD class = "WhiteRLT" width="50%"> </TD>' ||CHR(13)||
    '    <TD width="1%">4. Снилс:</TD>' ||CHR(13)||
    '    <TD class = "WhiteRLT"> <B>##SNILS</B></TD>' ||CHR(13)||
    '  </TR>' ||CHR(13)||
    '</TABLE>'||CHR(13);

    S3    :=
    '<TABLE width="100%" border=0 cellpadding="0" cellspacing="0" style="FONT-SIZE: 10pt">' ||CHR(13)||
    '  <TR>' ||CHR(13)||
    '    <TD width="1%">N1. Фамилия:</TD>' ||CHR(13)||
    '    <TD class="WhiteRLT" align="center" style="FONT-SIZE: 13pt">'||CHR(13)||'<B>##VALUE04</B></TD>' ||CHR(13)||
    '  </TR>' ||CHR(13)||
    '  <TR>' ||CHR(13)||
    '    <TD width="1%">N2. Имя:</TD>' ||CHR(13)||
    '    <TD class="WhiteRLT" align="center" style="FONT-SIZE: 13pt">'||CHR(13)||'<B>##VALUE07</B></TD>' ||CHR(13)||
    '  </TR>' ||CHR(13)||
    '  <TR>' ||CHR(13)||
    '    <TD width="1%">N3. Отчество:</TD>' ||CHR(13)||
    '    <TD class="WhiteRLT" align="center" style="FONT-SIZE: 13pt">'||CHR(13)||'<B>##VALUE09</B></TD>' ||CHR(13)||
    '  </TR>'||CHR(13)||
    '</TABLE>'||CHR(13)||
    '<TABLE width="100%" border=0 cellpadding="0" cellspacing="0" style="FONT-SIZE: 10pt">' ||CHR(13)||
    '  <TR>' ||CHR(13)||
    '   <TD width="1%">N4. Пол:</TD>' ||CHR(13)||
    '    <TD width="25%"><U><B>##VALUE103</B></U></TD>' ||CHR(13)||
    '    <TD width="1%">N5. Дата рождения: </TD>' ||CHR(13)||
    '    <TD width="25%">'||CHR(13)||'<U><B>##VALUE11</B></U></TD>' ||CHR(13);
    IF db_name = 'R' THEN
      S3 := S3 ||
    '    <TD width="1%">N5a.Гражданство: </TD>' ||CHR(13)||
    '    <TD>;'||CHR(13)||'<U><B>##LD_GRAGZ</B></U></TD>' ||CHR(13);
    END IF;
    S3 := S3 ||'  </TR>'||CHR(13)||
    '</TABLE>'||CHR(13)||
    '<TABLE width="100%" border=0 cellpadding="0" cellspacing="0" style="FONT-SIZE: 10pt">' ||CHR(13)||
    '  <TR>' ||CHR(13)||
    '    <TD width="1%">N6. Адрес постоянного места жительства: </TD>' ||CHR(13)||
    '    <TD>'||CHR(13)||'<U><B>##VALUE101</B></U></TD>' ||CHR(13)||
    '  </TR>' ||CHR(13)||
    '</TABLE>'||CHR(13)||
    '<TABLE width="100%" border=0 cellpadding="0" cellspacing="0" style="FONT-SIZE: 10pt">' ||CHR(13)||
    '  <TR>' ||CHR(13)||
    '    <TD width="1%">N7. Адрес регистрации по месту пребывания:</TD>' ||CHR(13)||
    '    <TD class="WhiteRLT"> <B>##FC_ADR_REGIST</B></TD></TR>' ||CHR(13)||
    '  </TR>' ||CHR(13)||
    '</TABLE>'||CHR(13);
    S4    :=
    '<TABLE width="100%" border=0 cellpadding="0" cellspacing="0" style="FONT-SIZE: 10pt">' ||CHR(13)||
    '  <TR>' ||CHR(13)||
    '    <TD width="1%"> 12. Телефон домашний:</TD>' ||CHR(13)||
    '    <TD class="WhiteRLT" width="45%">'||CHR(13)||' <U><B>##VALUE102</B></U></TD>' ||CHR(13)||
    '    <TD width="1%"> служебный: </TD>' ||CHR(13)||
    '    <TD class="WhiteRLT" width="45%">'||CHR(13)||' <U><B>##VALUE109</B></U></TD>' ||CHR(13)||
    '  </TR>'||CHR(13)||
    '</TABLE>'||CHR(13)
    --'    <TD width="10%"></TD>' ||CHR(13)||
    --'    <TD width="45%"></TD></TR>' ||CHR(13)||
    ;
    S5   :=
    '<TABLE width="100%" border=0 cellpadding="0" cellspacing="0" style="FONT-SIZE: 10pt">' ||CHR(13)||
    '  <TR>' ||CHR(13)||
    '    <TD width="45%">N1. Документ, удостоверяющий право на льготное обеспечение </TD>' ||CHR(13)||
    '  </TR>' ||CHR(13)||
    '  <TR>' ||CHR(13)||
    '    <TD width="100%" class="WhiteRLT"> </TD>' ||CHR(13)||
    '  </TR>' ||CHR(13)||
    '</TABLE>'||CHR(13)||
    '<TABLE width="100%" border=0 cellpadding="0" cellspacing="0" style="FONT-SIZE: 10pt">' ||CHR(13)||
    '  <TR>' ||CHR(13)||
    '    <TD width="1%">N2. Инвалидность:</TD>' ||CHR(13)||
    '    <TD class="WhiteRLT"><B> ##INVALID</B></TD>' ||CHR(13)||
    '  </TR>' ||CHR(13)||
    '</TABLE>'||CHR(13)||
    '<TABLE width="100%" border=0 cellpadding="0" cellspacing="0" style="FONT-SIZE: 10pt">' ||CHR(13)||
    '  <TR>' ||CHR(13)||
    '    <TD width="1%">N3. Место работы:</TD>' ||CHR(13)||
    '    <TD class="WhiteRLT">'||CHR(13)||'<B>##VALUE104</B></TD>' ||CHR(13)||
    '  </TR>' ||CHR(13)||
    '</TABLE>'||CHR(13);

    S6   :=
    '<TABLE width="100%" border=0 cellpadding="0" cellspacing="0" style="FONT-SIZE: 10pt">' ||CHR(13)||
    '  <TR>' ||CHR(13)||
    '    <TD width="1%">профессия:</TD>' ||CHR(13)||
    '    <TD idth="30%" class="WhiteRLT"> </TD>' ||CHR(13)||
    '    <TD width="1%">должность:</TD>' ||CHR(13)||
    '    <TD idth="30%" class="WhiteRLT"> '||CHR(13)||'<B>##VALUE105</B></TD>' ||CHR(13)||
    '    <TD width="1%">иждивенец:</TD>' ||CHR(13)||
    '    <TD idth="30%" class="WhiteRLT"> </TD>' ||CHR(13)||
    ' </TR>'||
    '</TABLE>'||CHR(13);

    IF db_name = 'R' THEN
      s_socpol :=
      '<TABLE width="100%" border=0 cellpadding="0" cellspacing="0" style="FONT-SIZE: 10pt">' ||CHR(13)||
      '  <TR>' ||CHR(13)||
      '    <TD width="1%">15a. Социальное положение:</TD>' ||CHR(13)||
      '    <TD class="WhiteRLT"><B> ##SOC_POL</B></TD>' ||CHR(13)||
      '  </TR>' ||CHR(13)||
      '</TABLE>'||CHR(13);
    END IF;
ELSE
             s1   :=
        '<DIV style="FONT-SIZE: 10pt">'  ||CHR(13)||
        '<TABLE width="100%" border=0 cellpadding="0" cellspacing="0">' ||CHR(13)||
        '  <TBODY style="FONT-SIZE: 10pt">' ||CHR(13)||
        '  <TR>' ||CHR(13)||
        '    <TD width="45%" valign=top>' ||CHR(13)||
        '      <TABLE width="100%" border=0 cellpadding="0" cellspacing="0" style="FONT-SIZE: 10pt">' ||CHR(13)||
        '        <TR>' ||CHR(13)||
        '          <TD align=middle valign=top bordercolor=black style="BORDER-BOTTOM: 1pt solid">' ||CHR(13)||
        '#MINISTER' ||CHR(13)||
        --'      Министерство здравоохранения и социального развития Российской Федерации' ||CHR(13)||
        '      <BR>' ||CHR(13)||
        '      <BR>' ||CHR(13)||
        '           <B>##VALUE00</B>' ||CHR(13)||
        '      </TD>    ' ||CHR(13)||
        '    </TR>' ||CHR(13)||
        '        <TR>' ||CHR(13)||
        '          <TD align=middle valign=top bordercolor=black style="BORDER-BOTTOM: 1pt solid">' ||CHR(13)||
        '            (наименование медицинского учреждения)' ||CHR(13)||
        '            <BR>' ||CHR(13)||
        '      <BR>##VALUE108' ||CHR(13)||
        '      </TD>' ||CHR(13)||
        '        </TR>' ||CHR(13)||
        '        <TR>' ||CHR(13)||
        '          <TD align=middle valign=top">' ||CHR(13)||
        '          (адрес)' ||CHR(13)||
        '          <BR>'||CHR(13)||
        /*'          <BR>' ||CHR(13)||*/
        '          </TD>' ||CHR(13)||
        '        </TR>' ||CHR(13)||
        '       </TABLE>' ||CHR(13)||
        '  </TD>' ||CHR(13)||
        '    <TD width="10%"></TD>' ||CHR(13)||
        '    <TD width="45%" valign=center align=left style="FONT-SIZE: 10pt">' ||CHR(13)||
        '    Медицинская документация' ||CHR(13)||
        '    <BR>Форма № 025/у-04' ||CHR(13)||
        '    <BR>утверждена Приказом Минздравсоцразвития России' ||CHR(13)||
        '    <BR>от 22.11.2004 № 255' ||CHR(13)||
        '  </TD>' ||CHR(13)||
        '  </TR>' ||CHR(13)||
        '  <TR>' ||CHR(13)||
        '    <TD width="45%" colSpan=1 style="FONT-SIZE: 10pt"><BR>Код ОГРН: <BR>' ||CHR(13)||
        '    </TD>' ||CHR(13)||
        '  <TR valign=center align=middle>' ||CHR(13)||
        '    <TD style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 12px" colSpan=3>' ||CHR(13)||
        '    МЕДИЦИНСКАЯ КАРТА АМБУЛАТОРНОГО БОЛЬНОГО (ОНКО)' ||CHR(13)||
        '    <BR>№  ##VALUE107' ||CHR(13)||
        '    </TD>' ||CHR(13)||
        '  </TR>' ||CHR(13);
        s11   :=
        '  <TR style="FONT-SIZE: 10pt">' ||CHR(13)||
        '    <TD width="45%">' ||CHR(13)||
        '        Вид оплаты:</TD>' ||CHR(13)||
        '    <TD width="10%" colspan=2><B>##VID_OPL</B></TD>' ||CHR(13)||
        '  </TR>' ||CHR(13);
        S2    :=
        '  <TR style="FONT-SIZE: 10pt">' ||CHR(13)||
        '    <TD width="45%">' ||CHR(13)||
        '    1. Страховая медицинская организация:</TD>' ||CHR(13)||
        '    <TD width="10%" colspan=2><B>##STRAH_ORG</B></TD>' ||CHR(13)||
        '  </TR>' ||CHR(13)||
        '  <TR>' ||CHR(13)||
        '    <TD width="45%">' ||CHR(13)||
        '    2. Номер страхового полиса ОМС:</TD>' ||CHR(13)||
        '    <TD width="10%" colspan=2>'||CHR(13)||'<B>##VALUE106</B></TD>' ||CHR(13)||
        '    </TD>' ||CHR(13)||
        '  </TR>' ||CHR(13)||
        '  <TR>' ||CHR(13)||
        '    <TD width="45%">3. Код льготы:</TD>' ||CHR(13)||
        '    <TD width="10%"></TD>' ||CHR(13)||
        '    <TD width="45%"></TD></TR>' ||CHR(13)||
        '  <TR>' ||CHR(13)||
        '    <TD width="45%">4. Снилс:</TD>' ||CHR(13)||
        '    <TD width="10%"></TD>' ||CHR(13)||
        '    <TD width="45%"></TD></TR>' ||CHR(13)||
        '  <TR>' ||CHR(13);
        S3    :=
        '    <TD width="45%">N1. Фамилия:</TD>' ||CHR(13)||
        '    <TD width="10%" colspan=2>'||CHR(13)||'<B>##VALUE04</B></TD>' ||CHR(13)||
        '  <TR>' ||CHR(13)||
        '    <TD width="45%">N2. Имя:</TD>' ||CHR(13)||
        '    <TD width="10%" colspan=2>'||CHR(13)||'<B>##VALUE07</B></TD>' ||CHR(13)||
        '  <TR>' ||CHR(13)||
        '    <TD width="45%">N3. Отчество:</TD>' ||CHR(13)||
        '    <TD width="10%" colspan=2>'||CHR(13)||'<B>##VALUE09</B></TD>' ||CHR(13)||
        '  <TR>' ||CHR(13)||
        '   <TD width="45%">N4. Пол:</TD>' ||CHR(13)||
        '    <TD width="10%" colspan=2><B>##VALUE103</B></TD>' ||CHR(13)||
        '  <TR>' ||CHR(13)||
        '    <TD width="45%">N5. Дата рождения:</TD>' ||CHR(13)||
        '    <TD width="10%" colspan=2>'||CHR(13)||'<B>##VALUE11</B></TD>' ||CHR(13)||
        '  <TR>' ||CHR(13)||
        '    <TD width="45%">N6. Адрес постоянного места жительства:</TD>' ||CHR(13)||
        '    <TD width="10%" colspan=2>'||CHR(13)||'<B>##VALUE101</B></TD>' ||CHR(13)||
        '  <TR>' ||CHR(13)||
        '    <TD width="45%">N7. Адрес регистрации по месту пребывания:</TD>' ||CHR(13)||
        '    <TD width="10%"></TD>' ||CHR(13)||
        '    <TD width="45%"></TD></TR>' ||CHR(13)||
        '  <TR>' ||CHR(13);
        S4    :=
        '    <TD width="45%"> 12. Телефон</TD>' ||CHR(13)||
        '    <TD width="10%"></TD>' ||CHR(13)||
        '    <TD width="45%"></TD></TR>' ||CHR(13)||
        '  <TR>' ||CHR(13)||
        '    <TD width="45%">' ||CHR(13)||
        '        <UL><LI>домашний:</LI></TD>' ||CHR(13)||
        '    <TD width="10%" colspan=2>'||CHR(13)||'<B>##VALUE102</B></TD>' ||CHR(13)||
        '  <TR>' ||CHR(13)||
        '    <TD width="45%">' ||CHR(13)||
        '      <UL><LI>служебный:</LI></TD>' ||CHR(13)||
        '    <TD width="10%" colspan=2>'||CHR(13)||'<B>##VALUE109</B></TD>' ||CHR(13)
        --'    <TD width="10%"></TD>' ||CHR(13)||
        --'    <TD width="45%"></TD></TR>' ||CHR(13)||
        ;
        S5   :=
        '  <TR>' ||CHR(13)||
        '    <TD width="45%">N1. Документ, удостоверяющий право на' ||CHR(13)||
        '      льготное обеспечение </TD>' ||CHR(13)||
        '    <TD width="10%"></TD>' ||CHR(13)||
        '    <TD width="45%"></TD></TR>' ||CHR(13)||
        '  <TR>' ||CHR(13)||
        '    <TD width="45%">N2. Инвалидность:</TD>' ||CHR(13)||
        '    <TD width="10%"></TD>' ||CHR(13)||
        '    <TD width="45%"></TD></TR>' ||CHR(13)||
        '  <TR>' ||CHR(13)||
        '    <TD width="45%">N3. Место работы (наименование и' ||CHR(13)||
        '      характер производства):</TD>' ||CHR(13)||
        '    <TD width="10%" colspan=2>'||CHR(13)||'<B>##VALUE104</B></TD>' ||CHR(13);

        S6   :=
        '    <TR>' ||CHR(13)||
        '    <TD width="45%"><UL><LI>профессия:</LI></TD>' ||CHR(13)||
        '    <TD width="10%"></TD>' ||CHR(13)||
        '    <TD width="45%"></TD></TR>' ||CHR(13)||
        '  <TR>' ||CHR(13)||
        '    <TD width="45%"><UL><LI>должность:</LI></TD>' ||CHR(13)||
        '    <TD width="10%" colspan=2>'||CHR(13)||'<B>##VALUE105</B></TD>' ||CHR(13)||
        '  <TR>' ||CHR(13)||
        '    <TD width="45%"><UL><LI>иждивенец:</LI></TD></TR>' ||CHR(13)||
        '    <TD width="10%"></TD>' ||CHR(13)||
        '    <TD width="45%"></TD></TR>' ||CHR(13);
END IF;


    IF db_name = 'N'
    THEN
      FOR C IN (SELECT ROWNUM RN FROM DUAL CONNECT BY LEVEL <=7)
      LOOP
        S3:=REPLACE(S3,'N'||C.RN,C.RN+2);
        S5:=REPLACE(S5,'N'||C.RN,C.RN+9);
      END LOOP;
      S1:=REPLACE(S1,'#MINISTER','      Министерство здравоохранения и социального развития Российской Федерации')||S3||S5;
     ELSIF db_name='M' THEN
      FOR C IN (SELECT ROWNUM RN FROM DUAL CONNECT BY LEVEL <=7)
      LOOP
        S3:=REPLACE(S3,'N'||C.RN,C.RN+4);
        S5:=REPLACE(S5,'N'||C.RN,C.RN+12);
      END LOOP;
      S1:=REPLACE(S1,'#MINISTER','      Министерство иностранных дел Российской Федерации')||S11||replace(S2,'ОМС','')||S3||S4||S5||S6;
     ELSE
     FOR C IN (SELECT ROWNUM RN FROM DUAL CONNECT BY LEVEL <=7)
      LOOP
        S3:=REPLACE(S3,'N'||C.RN,C.RN+4);
        S5:=REPLACE(S5,'N'||C.RN,C.RN+12);
      END LOOP;
      S1:=REPLACE(S1,'#MINISTER','      Министерство здравоохранения и социального развития Российской Федерации')||S2||S3||S4||S5||S6||s_socpol;
     END IF;
    DBMS_LOB.CREATETEMPORARY(s, TRUE, DBMS_LOB.SESSION);
    DBMS_LOB.WRITEAPPEND(s, LENGTH(s1), s1);

   FOR C IN (SELECT (SELECT TCOMPANY.FC_NAME
                      FROM asu.tcompany
                     WHERE TCOMPANY.FK_ID = fk_companyid) FC_NAME,
                   FC_SER || ' ' || fc_NUM NUM,
                   ttypedoc.fc_name sType,
                   tinsurdocs.fk_dogovorid fk_dogovorid,
                   tinsurdocs.fk_peplid fk_peplid,
                   tinsurdocs.fk_typedocid fk_typedocid,
                   ttypedoc.fc_synonim fc_synonim,
                   tinsurdocs.fd_end fd_end,
                   tinsurdocs.fd_begin fd_begin
              FROM asu.tinsurdocs,
                   asu.ttypedoc,
                   (SELECT TAMBTALON.FK_INSURANCEID,
                           FD_OPENED,
                           FK_ID AS TALONID,
                           1 TYP
                      FROM ASU.TAMBTALON
                     WHERE FK_AMBID = pFK_PEPLID
                    UNION ALL
                    SELECT FK_INSURDOCID, NULL, P.FK_ID, 2 TYP
                      FROM ASU.TPAC_INSURANCE P
                     WHERE P.FK_PACID = pFK_PEPLID) TAL
             WHERE tinsurdocs.fk_id = TAL.FK_INSURANCEID
               AND ttypedoc.fk_id = tinsurdocs.fk_typedocid
             ORDER BY TYP, FD_OPENED DESC, TALONID DESC) LOOP
    IF (c.fc_synonim = 'DMS') AND (c.fk_dogovorid IS NOT NULL) THEN
      /*      FOR D IN (SELECT td.fd_begin, td.fd_end
                  FROM asu.tinsur_dogovor td
                 WHERE td.fk_id = c.fk_dogovorid) LOOP
        IF d.fd_end IS NOT NULL THEN
          S := REPLACE(s,
                       '##VID_OPL',
                       C.STYPE || ' (договор действителен с ' ||
                       TO_CHAR(d.fd_begin, 'dd.mm.yyyy') || ' по ' ||
                       TO_CHAR(d.fd_end, 'dd.mm.yyyy') || ')');
        ELSE
          S := REPLACE(s,
                       '##VID_OPL',
                       C.STYPE || ' (договор действителен с ' ||
                       TO_CHAR(d.fd_begin, 'dd.mm.yyyy') || ')');
        END IF;
      END LOOP;*/
      IF c.fd_end IS NOT NULL THEN
        S := REPLACE(s,
                     '##VID_OPL',
                     C.STYPE || ' (полис по договору действителен с ' ||
                     TO_CHAR(c.fd_begin, 'dd.mm.yyyy') || ' по ' ||
                     TO_CHAR(c.fd_end, 'dd.mm.yyyy') || ')');
      ELSE
        S := REPLACE(s,
                     '##VID_OPL',
                     C.STYPE || ' (полис по договору действителен с ' ||
                     TO_CHAR(c.fd_begin, 'dd.mm.yyyy') || ')');
      END IF;
    ELSE
      S := REPLACE(s, '##VID_OPL', C.STYPE);
    END IF;
    S := REPLACE(s, '##STRAH_ORG', C.FC_NAME);
    S := REPLACE(s, '##VALUE106', C.NUM);
    EXIT;
  END LOOP;
  --если нет информации о полисе
    S := REPLACE(s, '##VID_OPL', '');
    S := REPLACE(s, '##STRAH_ORG', '');
    S := REPLACE(s, '##VALUE106', '');

    s := REPLACE(s,'##VALUE00',UPPER(asu.PKG_SMINI.READSTRING('CONFIG','S_TYPE','САНАТОРИЙ-ПРОФИЛАКТОРИЙ')));

    FOR p in cMain LOOP
      s := REPLACE(s,'##VALUE03',p.FC_SEX);
      s := REPLACE(s,'##VALUE04',p.FC_FAM);
      s := REPLACE(s,'##VALUE07',p.FC_IM);
      s := REPLACE(s,'##VALUE09',p.FC_OTCH);
      s := REPLACE(s,'##VALUE11',TO_CHAR(p.FD_ROJD,'dd/mm/yyyy'));
      s := REPLACE(s,'##VALUE13',p.FC_RABOTA);
      s := REPLACE(s,'##VALUE16',p.FC_ADR);
      s := REPLACE(s,'##SNILS',p.SNILS);
      s := REPLACE(s,'##VALUE101',p.FC_ADR_STRING);
      s := REPLACE(s,'##VALUE102',p.FC_PHONE_STRING);
      s := REPLACE(s,'##VALUE103',p.FC_SEX_STRING);
      s := REPLACE(s,'##VALUE104',p.WORK_PLACE_STR);
      s := REPLACE(s,'##VALUE105',p.WORK_DOLGN_STR);
      s := REPLACE(s,'##INVALID',p.INV || ' ' || p.INV_DOC ||
                   CASE WHEN p.INV_DOC_DATE IS NOT NULL THEN ' от ' || p.INV_DOC_DATE ELSE '' END);
      s := REPLACE(s,'##LD_GRAGZ',p.LD_GRAGZ);
--      s := REPLACE(s,'##VALUE106',p.POLIS_STR);
-- Kudinov теперь для пациентов ДД нужно после номера  карты писать ДД
      FOR D IN (SELECT TUSLVID.FK_ID
                  FROM ASU.TUSLVID,
                       (SELECT OB.FK_VIDDOCID
                          FROM ASU.TAMBULANCE A, ASU.TDOCOBSL OB
                         WHERE A.FK_DOCOBSL = OB.FK_ID
                           AND A.FK_ID = PFK_PEPLID) USLVID
                 WHERE TUSLVID.FK_ID = USLVID.FK_VIDDOCID
                CONNECT BY PRIOR TUSLVID.FK_ID = TUSLVID.FK_OWNERID
                 START WITH TUSLVID.FK_ID = ASU.DOC_DISP_DOP) LOOP
        isDD := True;
      END LOOP;

      IF db_name = 'R' then
        s := REPLACE(s,'##NUMBER_FONTSIZE','18');
        s := REPLACE(s,'##VALUE107',p.IBID_STR);
        s := REPLACE(s,'##OGRN','1028601468356');
        s := REPLACE(s,'##SOC_POL',p.SOC_POL);
      ELSE
        s := REPLACE(s,'##NUMBER_FONTSIZE','12');
      IF isDD THEN
        s := REPLACE(s,'##VALUE107',p.AMBIB_STR || ' ДД');
      ELSE
      s := REPLACE(s,'##VALUE107',p.AMBIB_STR);
      END IF;
        s := REPLACE(s,'##OGRN','');
      END IF;

      s := REPLACE(s,'##VALUE109',p.FC_RABPHONE);
      s := REPLACE(s,'##FC_ADR_REGIST',p.FC_ADR_REGIST);
    END LOOP;

    FOR p in cLpuInfo LOOP
      s := REPLACE(s,'##VALUE108',p.LPU_ADDRES);
    END LOOP;
  IF db_name = 'N'  THEN
     S :=S||/*'</TBODY>' ||CHR(13)||*/
       '</TABLE>' ||CHR(13);
     RETURN S;
  END IF;

--национальность
 sTmp:=' ';
 FOR C IN (SELECT tsmid.fc_name
             FROM tsmid,
                  asu.tib, /*(SELECT pFK_PEPLID fpacid FROM DUAL)pac */
                  (SELECT FK_PEPLID fpacid
                     FROM ASU.TAMBULANCE
                    WHERE FK_ID = pFK_PEPLID) PAC
            WHERE tib.fk_pacid = pac.fPAcid
              AND tib.fk_smid = tsmid.fk_id
              AND tsmid.fk_owner = PKG_STATUTIL.GET_SMIDID('LD_NAROD')) LOOP
   sTmp := C.fc_name;
 END LOOP;
IF db_name = 'M' THEN
    s:=s||
    ' <TR>' ||CHR(13)||
    '    <TD width="45%">16. Национальность</TD>' ||CHR(13)||
    '    <TD width="10%" colspan=2>'||CHR(13)||'<B>'||sTmp||'</B></TD>' ||CHR(13)||
    '  </TR>' ||CHR(13);
ELSIF db_name = 'OLD' THEN--Старая форма печати
    s:=s||
    '<TABLE width="100%" border=0 cellpadding="0" cellspacing="0" style="FONT-SIZE: 10pt">' ||CHR(13)||
    ' <TR>' ||CHR(13)||
    '    <TD width="45%">16. Национальность</TD>' ||CHR(13)||
    '    <TD width="10%" colspan=2>'||CHR(13)||'<B>'||sTmp||'</B></TD>' ||CHR(13)||
    '  </TR></TABLE>' ||CHR(13);

ELSE
s:= s||'
<TABLE ALIGN="CENTER" WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BORDER="0" STYLE="FONT-SIZE:10PT;">
  <TR>
    <TD WIDTH="100%" ALIGN="CENTER" CLASS="WHITEALLNON"><B>16. ПЕРЕМЕНА АДРЕСА И МЕСТА РАБОТЫ</B></TD>
  </TR>
</TABLE>' ||CHR(13)||
'<TABLE ALIGN="CENTER" WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BORDER="1" STYLE="FONT-SIZE:10PT;">
  <TR>
    <TD WIDTH="15%" ALIGN="CENTER" CLASS="WHITER">Дата</TD>
    <TD IDTH="15%" ALIGN="CENTER" CLASS="WHITER">Новый адрес(новое место работы)</TD>
  </TR>
  <TR>
    <TD WIDTH="15%" ALIGN="CENTER" CLASS="WHITERT"> </TD>
    <TD IDTH="15%" ALIGN="CENTER" CLASS="WHITERT"> </TD>
  </TR>
  <TR>
    <TD WIDTH="15%" ALIGN="CENTER" CLASS="WHITERT"> </TD>
    <TD IDTH="15%" ALIGN="CENTER" CLASS="WHITERT"> </TD>
  </TR>
  <TR>
    <TD WIDTH="15%" ALIGN="CENTER" CLASS="WHITERT"> </TD>
    <TD IDTH="15%" ALIGN="CENTER" CLASS="WHITERT"> </TD>
  </TR>'||CHR(13)||
'</TABLE>';

IF pRegistration = 0 THEN
  s:= s||'<br style="page-break-before:always"> 
  <TABLE ALIGN="CENTER" WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BORDER="0" STYLE="FONT-SIZE:10PT;">
  <TR>
    <TD WIDTH="100%" ALIGN="CENTER" CLASS="WHITEALLNON"><B>17. ЗАБОЛЕВАНИЯ, ПОДЛЕЖАЩИЕ ДИСПАНСЕРНОМУ НАБЛЮДЕНИЮ</B></TD>
  </TR>
  </TABLE>
    <TABLE ALIGN="CENTER" WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BORDER="1" STYLE="FONT-SIZE:10PT;">
      <TR>
        <TD WIDTH="1%" ALIGN="CENTER" ROWSPAN ="2" CLASS="WHITER">№<BR/>п/п</TD>
        <TD WIDTH="25%" ALIGN="CENTER" ROWSPAN ="2" CLASS="WHITER">Наименование заболевания</TD>
        <TD WIDTH="10%" ALIGN="CENTER" ROWSPAN ="2" CLASS="WHITER">Код по МКБ-10</TD>
        <TD WIDTH="1%" ALIGN="CENTER" ROWSPAN ="2" CLASS="WHITER">Дата постановки на диспансерное наблюдение</TD>
        <TD IDTH="25%" ALIGN="CENTER" COLSPAN ="2" CLASS="WHITER">Врач</TD>
        <TD WIDTH="1%" ALIGN="CENTER" ROWSPAN ="2" CLASS="WHITER">Дата снятия с диспансерного наблюдения</TD>
        <TD IDTH="25%" ALIGN="CENTER" COLSPAN ="2" CLASS="WHITER">Врач</TD>
      </TR>
      <TR>
        <TD ALIGN="CENTER" CLASS="WHITERT"> Должность </TD>
        <TD ALIGN="CENTER" CLASS="WHITERT"> Подпись </TD>
        <TD ALIGN="CENTER" CLASS="WHITERT"> Должность </TD>
        <TD ALIGN="CENTER" CLASS="WHITERT"> Подпись </TD>
      </TR>
    <TR>
        <TD ALIGN="CENTER"  CLASS="WHITERT">1</TD>
        <TD ALIGN="CENTER" CLASS="WHITERT">2</TD>
        <TD ALIGN="CENTER" CLASS="WHITERT">3</TD>
        <TD ALIGN="CENTER" CLASS="WHITERT">4</TD>
        <TD ALIGN="CENTER" CLASS="WHITERT">5</TD>
        <TD ALIGN="CENTER" CLASS="WHITERT">6</TD>
        <TD ALIGN="CENTER" CLASS="WHITERT">7</TD>
        <TD ALIGN="CENTER" CLASS="WHITERT">8</TD>
        <TD ALIGN="CENTER" CLASS="WHITERT">9</TD>
      </TR>  '||CHR(13);
    FOR C IN (SELECT ROWNUM RN,A.* FROM
              (SELECT TDIAG.FC_WRITE FC_DIAG,
                     (SELECT FK_MKB10 FROM ASU.TSMID WHERE FK_ID = TDIAG.FK_SMDIAGID) MKB,
                     LOGIN.GET_SOTRNAME(TAMBTALON.FK_SOTRCLOSED) SOTR,
                     LOGIN.GET_SOTR_POSTNAME(TAMBTALON.FK_SOTRCLOSED) SOTRPOST,
                     TAMBTALON.FD_CLOSED DATE_OPENED,
                     (SELECT DISTINCT LOGIN.GET_SOTRNAME(FK_SOTRCLOSED)
                        FROM ASU.TAMBTALON A, ASU.TDIAG D
                       WHERE A.FK_AMBID = TAMBTALON.FK_AMBID
                         AND D.FK_ID = A.FK_DIAGMAIN
                         AND A.FN_SOS = 1
                         AND D.FK_SMDIAGID = TDIAG.FK_SMDIAGID
                         AND A.FD_CLOSED >= TAMBTALON.FD_CLOSED
                         AND A.FK_DISP = ANY
                       (SELECT FK_ID
                                FROM ASU.TSMID
                               WHERE FC_SYNONIM IN ('AMBTALON_DISP_TAKEOFF'))) SOTRCLOSED,
                     (SELECT DISTINCT LOGIN.GET_SOTR_POSTNAME(FK_SOTRCLOSED)
                        FROM ASU.TAMBTALON A, ASU.TDIAG D
                       WHERE A.FK_AMBID = TAMBTALON.FK_AMBID
                         AND D.FK_ID = A.FK_DIAGMAIN
                         AND A.FN_SOS = 1
                         AND D.FK_SMDIAGID = TDIAG.FK_SMDIAGID
                         AND A.FD_CLOSED >= TAMBTALON.FD_CLOSED
                         AND A.FK_DISP = ANY
                       (SELECT FK_ID
                                FROM ASU.TSMID
                               WHERE FC_SYNONIM IN ('AMBTALON_DISP_TAKEOFF'))) SOTRCLOSED_POST,
                     (SELECT DISTINCT A.FD_CLOSED
                        FROM ASU.TAMBTALON A, ASU.TDIAG D
                       WHERE A.FK_AMBID = TAMBTALON.FK_AMBID
                         AND A.FN_SOS = 1
                         AND D.FK_ID = A.FK_DIAGMAIN
                         AND D.FK_SMDIAGID = TDIAG.FK_SMDIAGID
                         AND A.FD_CLOSED >= TAMBTALON.FD_CLOSED
                         AND A.FK_DISP = ANY
                       (SELECT FK_ID
                                FROM ASU.TSMID
                               WHERE FC_SYNONIM IN ('AMBTALON_DISP_TAKEOFF'))) DATE_CLOSED

                FROM ASU.TAMBTALON
                LEFT OUTER JOIN ASU.TDIAG ON TDIAG.FK_ID = TAMBTALON.FK_DIAGMAIN
               WHERE FK_AMBID = pFK_PEPLID
                 AND FN_SOS = 1
                 AND TAMBTALON.FK_DISP = ANY
               (SELECT FK_ID
                        FROM ASU.TSMID
                       WHERE FC_SYNONIM IN ('AMBTALON_DISP_TAKEN'))
               ORDER BY DATE_OPENED) A)
    LOOP
      S:=S||'<TR>
        <TD IDTH="1%" ALIGN="CENTER" ROWSPAN ="2" CLASS="WHITER">'||C.RN||'</TD>
        <TD IDTH="25%" ALIGN="CENTER" ROWSPAN ="2" CLASS="WHITER">'||C.FC_DIAG||'</TD>
        <TD IDTH="10%" ALIGN="CENTER" ROWSPAN ="2" CLASS="WHITER">'||C.MKB||'</TD>
        <TD IDTH="25%" ALIGN="CENTER" ROWSPAN ="2" CLASS="WHITER">'||TO_CHAR(C.DATE_OPENED,'DD.MM.YYYY')||'</TD>
        <TD IDTH="10%" ALIGN="CENTER" COLSPAN ="2" CLASS="WHITER">'||C.SOTR||'</TD>
        <TD IDTH="25%" ALIGN="CENTER" ROWSPAN ="2" CLASS="WHITER">'||NVL(TO_CHAR(C.DATE_CLOSED,'DD.MM.YYYY'),' ')||'</TD>
        <TD IDTH="10%" ALIGN="CENTER" COLSPAN ="2" CLASS="WHITER">'||NVL(C.SOTRCLOSED,' ')||'</TD>
      </TR>
      <TR>
        <TD ALIGN="CENTER" CLASS="WHITERT">'||NVL(C.SOTRPOST,';')||'</TD>
        <TD ALIGN="CENTER" CLASS="WHITERT">;</TD>
        <TD ALIGN="CENTER" CLASS="WHITERT">'||NVL(C.SOTRCLOSED_POST,';')||'</TD>
        <TD ALIGN="CENTER" CLASS="WHITERT">;</TD>
      </TR>';
    END LOOP;
    STMP :='';
    FOR C IN (SELECT ASU.GET_SMIDNAME(FK_SMID) GR
      FROM ASU.TIB,
           (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = 'LD_BLOOD_GROUP') SM
     WHERE FK_PACID = ASU.PKG_REGIST_PACFUNC.GET_PEPL_ID(pFK_PEPLID)
       AND FK_SMEDITID = SM.FK_ID)
       LOOP
        sTmp := C.GR;
       END LOOP;
    FOR C IN (SELECT ASU.GET_SMIDNAME(FK_SMID) GR
      FROM ASU.TIB,
           (SELECT FK_ID FROM ASU.TSMID WHERE FC_SYNONIM = 'RESUC') SM
     WHERE FK_PACID = ASU.PKG_REGIST_PACFUNC.GET_PEPL_ID(pFK_PEPLID)
       AND FK_SMEDITID = SM.FK_ID)
       LOOP
        sTmp := sTmp||C.GR;
       END LOOP;

    S:=S||'</TABLE>' ||CHR(13)||
    '<TABLE width="100%" border=0 cellpadding="0" cellspacing="0" style="FONT-SIZE: 10pt">' ||CHR(13)||
    '  <TR>' ||CHR(13)||
    '    <TD width="1%">18. Группа крови, Rh</TD>' ||CHR(13)||
    '    <TD class="WhiteRLT" align="left">'||CHR(13)||'<B> '||sTmp||'</B></TD>' ||CHR(13)||
    '  </TR>' ||CHR(13)||
    '</TABLE>' ||CHR(13);
 END IF;
END IF;

IF pRegistration = 0 THEN
          IF DB_NAME IN ('M', 'OLD') THEN
          --лек непереносимость
          sTmp:=' ';
           FOR C IN (SELECT tsmid.fc_name s, rownum rn
                       FROM tsmid,
                            (SELECT pFK_PEPLID fpacid
                               FROM DUAL
                             UNION ALL
                             SELECT vnaz.fk_id fpacid FROM vnaz WHERE vnaz.fk_pacid = pFK_PEPLID) pac,
                            asu.tib
                      WHERE tib.fk_pacid = pac.fPacid
                        AND tib.fk_smid = tsmid.fk_id
                        AND tsmid.fk_owner = PKG_STATUTIL.GET_SMIDID('PD_LEKALERG'))
           LOOP
             IF c.rn>1 THEN
              sTmp:=sTmp||',';
             END IF;
              sTmp:=sTmp||C.s;
           END LOOP;
           if db_name = 'M' then
              s:=s||
              '  <TR>' ||CHR(13)||
              '    <TD width="45%">17. Лекарственная непереносимость</TD>' ||CHR(13)||
              '    <TD width="10%" colspan=2>'||CHR(13)||'<B>'||sTmp||'</B></TD>' ||CHR(13)||
              '  <TR>' ||CHR(13);

           else
              s:=s||'<TABLE width="100%" border=0 cellpadding="0" cellspacing="0" style="FONT-SIZE: 10pt">' ||CHR(13)||
              '  <TR>' ||CHR(13)||
              '    <TD width="45%">17. Лекарственная непереносимость</TD>' ||CHR(13)||
              '    <TD width="10%" colspan=2>'||CHR(13)||'<B>'||sTmp||'</B></TD>' ||CHR(13)||
              '  <TR>' ||CHR(13);
            end if;
          --особенности
           sTmp:=' ';
           FOR C IN (SELECT tib.fc_char s FROM tsmid,(SELECT pFK_PEPLID fpacid FROM DUAL UNION ALL SELECT vnaz.fk_id fpacid FROM vnaz WHERE vnaz.fk_pacid=pFK_PEPLID) pac,asu.tib
                     WHERE tib.fk_pacid=pac.fPacid
                           AND tib.fk_smid=tsmid.fk_id
                           AND fc_synonim='OSM_OSOBEN') LOOP
              sTmp:=C.s;
           END LOOP;
          s:=s||'  <TR>' ||CHR(13)||
          '    <TD width="45%">18. Особенности</TD>' ||CHR(13)||
          '    <TD width="10%" colspan=2>'||CHR(13)||'<B>'||sTmp||'</B></TD>' ||CHR(13)||
          '  <TR>' ||CHR(13);

          s:=s||'  </TR></TBODY>' ||CHR(13)||
          '</TABLE>' ||CHR(13);





              FOR p in cDiags LOOP
                if not bDiag then bDiag:=TRUE;
                  s := s || '<BR>Список окончательных диагнозов:<BR>'||CHR(13)||
                          '<table width=100% bordercolorlight=#000000 bordercolordark=#FFFFFF bordercolor=#FFFFFF bgcolor=#FFFFFF border=1 cellpadding=0 cellspacing=0>'||CHR(13)||
                          '<tr>'||CHR(13)||
                          ' <td width=10% align=center><b>Дата</b></td>'||CHR(13)||
                          ' <td width=80% align=center><b>Диагноз</b></td>'||CHR(13)||
                          ' <td width=10% align=center><b>МКБ-10</b></td>'||CHR(13)||
                          '</tr>'||CHR(13);
                end if;
                s := s || '<tr>'||CHR(13)||
                          ' <td align=center>'|| TO_CHAR(p.FD_DATE,'dd.mm.yyyy') ||'</td>'||CHR(13)||
                          ' <td>'|| p.FC_NAME ||'</td>'||CHR(13)||
                          ' <td>'|| asu.PKG_R_ALLFUNC.RETURN_VALUE(p.FK_MKB10) ||'</td>'||CHR(13)||
                          '</tr>'||CHR(13);
              END LOOP;
              if bDiag then
                s := s || '</table>'||CHR(13);
              else
                s := s || '<BR>Список окончательных диагнозов: <B>Отсутствуют.</B><BR>'||CHR(13);
              end if;

              FOR p in cVakcine LOOP
                if not bVakcine then bVakcine:=TRUE;
                  s := s || '<BR>Список проведенных вакцинаций:<BR>'||CHR(13)||
                          '<table width=100% bordercolorlight=#000000 bordercolordark=#FFFFFF bordercolor=#FFFFFF bgcolor=#FFFFFF border=1 cellpadding=0 cellspacing=0>'||CHR(13)||
                          '<tr>'||CHR(13)||
                          ' <td width=10% align=center><b>Дата</b></td>'||CHR(13)||
                          ' <td width=70% align=center><b>Название</b></td>'||CHR(13)||
                          ' <td width=10% align=center><b>Назначено</b></td>'||CHR(13)||
                          ' <td width=10% align=center><b>Проведено</b></td>'||CHR(13)||
                          '</tr>'||CHR(13);
                end if;
                s := s || '<tr>'||CHR(13)||
                          ' <td align=center>'|| p.FD_RUN ||'</td>'||CHR(13)||
                          ' <td>'|| p.FC_NAME ||'</td>'||CHR(13)||
                          ' <td align=center>'|| p.FN_COUNT ||'</td>'||CHR(13)||
                          ' <td align=center>'|| p.FN_DONE ||'</td>'||CHR(13)||
                          '</tr>'||CHR(13);
              END LOOP;
              if bVakcine then
                s := s || '</table>'||CHR(13);
              else
                s := s || '<BR>Список проведенных вакцинаций: <B>Отсутствуют.</B><BR>'||CHR(13);
              end if;

              FOR p in cRadio LOOP
                if not bRadio then bRadio:=TRUE;
                  s := s || '<BR>Список радиологических исследований:<BR>'||CHR(13)||
                          '<table width=100% bordercolorlight=#000000 bordercolordark=#FFFFFF bordercolor=#FFFFFF bgcolor=#FFFFFF border=1 cellpadding=0 cellspacing=0>'||CHR(13)||
                          '<tr>'||CHR(13)||
                          ' <td width=10% align=center><b>Дата</b></td>'||CHR(13)||
                          ' <td align=center><b>Название</b></td>'||CHR(13)||
                          ' <td align=center><b>Результат</b></td>'||CHR(13)||
                          '</tr>'||CHR(13);
                end if;
                s := s || '<tr>'||CHR(13)||
                          ' <td align=center>'|| p.FD_RUN ||'</td>'||CHR(13)||
                          ' <td>'|| p.FC_NAME ||'</td>'||CHR(13)||
                          ' <td>'|| p.FC_RES ||'</td>'||CHR(13)||
                          '</tr>'||CHR(13);
              END LOOP;
              if bRadio then
                s := s || '</table>'||CHR(13);
              else
                s := s || '<BR>Список радиологических исследований: <B>Отсутствует.</B><BR>'||CHR(13);
              end if;
          ELSE
              --лек непереносимость
              s:=s||'<TABLE width="100%" border=0 cellpadding="0" cellspacing="0" style="FONT-SIZE: 10pt">' ||CHR(13)||
              '  <TR>' ||CHR(13)||
              '    <TD width="45%">19. Лекарственная непереносимость</TD>' ||CHR(13)||
              '  </TR>' ||CHR(13)||
              '</TABLE>' ||CHR(13);
               sTmp:=' ';
               FOR C IN (SELECT tsmid.fc_name s, rownum rn
                           FROM tsmid,
                                (SELECT pFK_PEPLID fpacid
                                   FROM DUAL
                                 UNION ALL
                                 SELECT vnaz.fk_id fpacid FROM vnaz WHERE vnaz.fk_pacid = pFK_PEPLID) pac,
                                asu.tib
                          WHERE tib.fk_pacid = pac.fPacid
                            AND tib.fk_smid = tsmid.fk_id
                            AND tsmid.fk_owner = PKG_STATUTIL.GET_SMIDID('PD_LEKALERG'))
               LOOP
                 IF c.rn>1 THEN
                  sTmp:=sTmp||',';
                 END IF;
                  sTmp:=sTmp||C.s;
               END LOOP;
              s:=s||'<TABLE width="100%" border=0 cellpadding="0" cellspacing="0" style="FONT-SIZE: 10pt">' ||CHR(13)||
              '  <TR>' ||CHR(13)||
              '    <TD width="1%">19.1 </TD>' ||CHR(13)||
              '    <TD CLASS="WhiteRLT" width="100%"> <B>'||sTmp||'</B></TD>' ||CHR(13)||
              '  </TR>' ||CHR(13)||
              '  <TR>' ||CHR(13)||
              '    <TD width="1%">19.2 </TD>' ||CHR(13)||
              '    <TD CLASS="WhiteRLT" width="100%"> <B></B></TD>'||CHR(13)||
              '  </TR>' ||CHR(13)||
              '  <TR>' ||CHR(13)||
              '    <TD width="1%">19.3 </TD>' ||CHR(13)||
              '    <TD CLASS="WhiteRLT" width="100%"> <B></B></TD>' ||CHR(13)||
              '  </TR>' ||CHR(13)||
              '</TABLE>' ||CHR(13);

          --end if;


          END IF;
END IF;
 s := s ||'</DIV>';
--    s := s || '<HR>'||CHR(13);
    RETURN s;
  END;
