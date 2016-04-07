CREATE OR REPLACE PACKAGE ASU.PKG_SQL_DIAGNOSTIC IS

  -- Author  : ANTOJGO
  -- Created : 07.12.2015 15:38:33
  -- Purpose : çàïðîñû äëÿ ìîäóëåé èç ïàïêè DIAGNOSTIC
  -- 2015.12.07 add RgRegistr

  FUNCTION GET_LIST_RGREGISTR(ADATE IN DATE, AROOMID IN NUMBER)
    RETURN SYS_REFCURSOR;

END;
/

CREATE OR REPLACE PACKAGE BODY ASU.PKG_SQL_DIAGNOSTIC IS

  FUNCTION GET_LIST_RGREGISTR(ADATE IN DATE, AROOMID IN NUMBER)
    RETURN SYS_REFCURSOR IS
    RES SYS_REFCURSOR;
  BEGIN
    OPEN RES FOR
      SELECT ISL.ROWID,
             ISL.FC_TYPE,
             ISL.FK_ID,
             FK_SMID,
             FD_NAZ,
             TO_CHAR(FD_NAZ, 'dd.mm.yyyy hh24:mi') AS FD_NAZ_STR,
             FD_RUN,
             TO_CHAR(FD_RUN, 'dd.mm.yyyy hh24:mi') AS FD_RUN_STR,
             FK_PACID,
             FK_NAZSOSID,
             FK_ISPOLID,
             FK_NAZTYPEID,
             FK_VRACHID,
             FK_ROOMID,
             ASU.DO_VRACHFIO(FK_VRACHID) AS VRACHFIO,
             ASU.PKG_REGIST_PACFUNC.GET_PAC_FIO(FK_PACID) AS FIOPAC,
             (SELECT max(FD_ROJD)
                FROM ASU.TPEOPLES
               WHERE FK_ID = (SELECT FK_PEPLID
                                 FROM ASU.TKARTA
                                WHERE FK_ID = ISL.FK_PACID
                               UNION ALL
                               SELECT FK_PEPLID
                                 FROM ASU.TAMBULANCE
                                WHERE FK_ID = ISL.FK_PACID)) AS FD_ROJD,
             ASU.PKG_REGIST_PACFUNC.GET_PAC_AGE_NOW(ISL.FK_PACID) AS AGE,
             SUBSTR(ASU.PKG_REGIST_PACFUNC.GET_PAC_SEX(ISL.FK_PACID), 1, 1) AS SEX,
             ASU.GET_NAME_RGISSL(ISL.FK_SMID) AS FC_NAME,
             DECODE((SELECT MAX(FC_CHAR)
                      FROM ASU.TIB
                     WHERE FK_PACID = ISL.FK_ID
                       AND FK_SMID =
                           (SELECT FK_ID
                              FROM ASU.TSMID
                             WHERE FC_SYNONIM = 'XRAY_DIAGNOZ')),
                    NULL,
                    STAT.PKG_FRFORM30.GET_LAST_DIAG(FK_PACID),
                    (SELECT MAX(FC_CHAR)
                       FROM ASU.TIB
                      WHERE FK_PACID = ISL.FK_ID
                        AND FK_SMID =
                            (SELECT FK_ID
                               FROM ASU.TSMID
                              WHERE FC_SYNONIM = 'XRAY_DIAGNOZ'))) AS FC_DIAG,
             ASU.PKG_NAZ.GET_NAZPARAM1(ISL.FK_ID) AS PARAM,
             ASU.PKG_REGIST_PACFUNC.GET_PEPL_ID(FK_PACID) AS PEPLID,
             DECODE(ISL.FK_NAZSOSID,
                    2,
                    'ÍÅ ÂÛÏ.',
                    1,
                    'ÂÛÏ.' || ': ' || ASU.DO_VRACHFIO(ISL.FK_ISPOLID),
                    3,
                    'ÍÅßÂÊÀ',
                    -11,
                    'ÂÛÏ. ÐË' || ': ' || ASU.DO_VRACHFIO(ISL.FK_ISPOLID),
                    89,
                    'ÐÅÊÎÌÅÍÄÎÂÀÍÎ',
                    23,
                    'ÎÒÌÅÍÅÍÎ' || ': ' || ASU.DO_VRACHFIO(ISL.FK_ISPOLID)) AS STATE,
             TO_CHAR(FD_RUN, 'hh24:mi') AS TIME_ISL,
             ASU.IS_AMBULANCE(ISL.FK_PACID) AS IS_AMBULANCE,
             DECODE(ASU.IS_AMBULANCE(ISL.FK_PACID),
                    0,
                    'ñòàö.',
                    1,
                    'àìáóë.') AS VIDLECH,
             ASU.GET_NAPRAVLEN(ISL.FK_PACID, ISL.FK_ID) AS OTDEL,
             ASU.GET_REANIM_FOR_XRAY(ISL.FK_PACID) AS IS_REANIM,
             ASU.GET_NUMISSL_FOR_XRAY(ISL.FK_ID) AS NUMBERISSL,
             (SELECT MAX(FC_CHAR)
                FROM ASU.TIB
               WHERE FK_PACID = ISL.FK_ID
                 AND FK_SMID IN
                     (SELECT FK_ID
                        FROM ASU.TSMID
                       WHERE FC_SYNONIM = 'NUMBER_ISSL'
                          OR FC_SYNONIM = 'XRAY_FLU_NUMBER')) AS NUMBERPROTOCOL,
             (SELECT SUBSTR(ASU.GET_SMIDNAME(MAX(FK_SMID)), 1, 1)
                FROM ASU.TIB
               WHERE FK_PACID = ISL.FK_ID
                 AND FK_SMID IN
                     (SELECT FK_ID
                        FROM ASU.TSMID
                       WHERE FK_OWNER IN
                             (SELECT MAX(FK_ID)
                                FROM ASU.TSMID
                               WHERE FC_SYNONIM = 'ISSL_TARGET'))) AS ISSL_TARGET,
             (SELECT MAX(ASU.GET_COMPANY_LONGNAME(FK_COMPANYID)) AS COMPANYNAME
                FROM ASU.TPEOPLES
               WHERE FK_ID =
                     ASU.PKG_REGIST_PACFUNC.GET_PEPL_ID(ISL.FK_PACID)) AS COMPANY,
             ASU.GET_AREA_FOR_XRAY(ASU.GET_PEPLID(ISL.FK_PACID)) AS UCHASTOK,
             (SELECT MAX(ASU.TIB.FN_NUM)
                FROM ASU.TIB
               WHERE ASU.TIB.FK_PACID = ISL.FK_ID
                 AND ASU.TIB.FK_SMID IN
                     (SELECT ASU.TSMID.FK_ID
                        FROM ASU.TSMID
                       WHERE ASU.TSMID.FC_SYNONIM = 'DEZURSTVO')) AS DEZ,
             (SELECT COUNT(*)
                FROM ASU.TNAZIS
               WHERE ASU.TNAZIS.FK_PACID = ASU.GET_PEPLID(ISL.FK_PACID)
                 AND ASU.TNAZIS.FK_SMID = ASU.GET_XRAY_TUBDISPANCER
                 AND SYSDATE >= ASU.TNAZIS.FD_NAZ
                 AND (SYSDATE < ASU.TNAZIS.FD_RUN + 1 OR
                     ASU.TNAZIS.FD_RUN IS NULL)) AS CNTTUB,
             (SELECT MAX(ASU.TIB.FC_CHAR)
                FROM ASU.TIB
               WHERE ASU.TIB.FK_PACID = ISL.FK_ID
                 AND ASU.TIB.FK_SMID IN
                     (SELECT ASU.TSMID.FK_ID
                        FROM ASU.TSMID
                       WHERE FC_SYNONIM = 'OTMETKI_FLU_RESUME1')) AS RESUME1,
             (SELECT MAX(ASU.TIB.FC_CHAR)
                FROM ASU.TIB
               WHERE ASU.TIB.FK_PACID = ISL.FK_ID
                 AND ASU.TIB.FK_SMID IN
                     (SELECT ASU.TSMID.FK_ID
                        FROM ASU.TSMID
                       WHERE ASU.TSMID.FC_SYNONIM = 'OTMETKI_FLU_RESUME2')) AS RESUME2,
             --  TPACS.ARCHIVED
             (SELECT GREATEST(FL_VYB, FL_VYB2)
                FROM ASU.TKARTA
               WHERE TKARTA.FK_ID = FK_PACID
              UNION ALL
              SELECT FL_VYB
                FROM ASU.TAMBULANCE
               WHERE TAMBULANCE.FK_ID = FK_PACID) AS ARCHIVED
      
        FROM ASU.TNAZIS ISL
      /* inner join (SELECT TKARTA.fk_id, GREATEST(FL_VYB, FL_VYB2) ARCHIVED FROM asu.TKARTA
      UNION ALL 
      SELECT TAMBULANCE.fk_id, FL_VYB ARCHIVED FROM asu.TAMBULANCE) tpacs on tpacs.fk_id = ISL.FK_PACID */
       WHERE ISL.FK_ROOMID = AROOMID
         AND FD_RUN >= ADATE
         AND FD_RUN < ADATE + 1
         AND FK_NAZSOSID NOT IN
             (ASU.GET_PASS_REGISTRATOR, ASU.GET_PASS_REGISTRATOR_DD)
      
       ORDER BY FD_RUN;
    RETURN RES;
  END;

END;
/