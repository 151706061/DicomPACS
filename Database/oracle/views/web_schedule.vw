DROP VIEW ASU.WEB_SCHEDULE
/

/* Formatted on 06.04.2016 15:19:29 (QP5 v5.115.810.9015) */
--
-- WEB_SCHEDULE  (View)
--
--  Dependencies:
--   PKG_EXCHANGE (Package)
--   TGRAPH (Table)
--   TRASPIS (Table)
--   PKG_EXCH_SAMOZAPIS (Package)
--   TSMID (Table)
--   PKG_SMINI (Package)
--   GET_FULLMKB10 (Function)
--   GET_ISSLEDID (Function)
--   GET_KONSSPECID (Function)
--   GET_PROCID (Function)
--   GET_SMIDNAME (Function)
--   GET_SOTRNAME (Function)
--   EXCHANGE_SAMOZAPIS (Function)
--   TNAZVRACH (View)
--   TKABINET (Table)
--

CREATE OR REPLACE FORCE VIEW ASU.WEB_SCHEDULE
(
   ENDON,
   LPU,
   STARTON,
   FN_INTERVAL,
   FT_END,
   FK_SOTRID,
   SYSUSER,
   CABINET,
   FK_KABINETID,
   FK_SMID,
   PRESCTYPE,
   OUR_NAME,
   OUR_SOTR,
   FK_ID,
   RECEPTIONTYPE,
   NAZID,
   SHOWONSITE,
   NEED_TRANSFER
)
AS
   SELECT   DECODE (
               FT_END,
               NULL,
               DECODE (A.FN_INTERVAL,
                       NULL, A.STARTON + NUMTODSINTERVAL (1, 'SECOND') /*NVL(LAG(STARTON) OVER(PARTITION BY TRUNC(A.STARTON)
                                                                                ORDER BY A.STARTON DESC),
                                                                           A.STARTON + NUMTODSINTERVAL(1, 'SECOND'))*/
                                                                      ,
                       A.STARTON + NUMTODSINTERVAL (A.FN_INTERVAL, 'MINUTE')),
               FT_END
            )
               AS ENDON,
            asu.pkg_exch_samozapis.GET_WEB_LPU_BY_SOTR (FK_SOTRID) LPU,
            /*       ASU.PKG_SMINI.READSTRING('CONFIG_SAMOZAPIS', 'LPU_OID', '') LPU,*/
            A."STARTON",
            A."FN_INTERVAL",
            A."FT_END",
            A."FK_SOTRID",
            A."SYSUSER",
            A."CABINET",
            A."FK_KABINETID",
            A."FK_SMID",
            A."PRESCTYPE",
            A."OUR_NAME",
            A."OUR_SOTR",
            A."FK_ID",
            A."RECEPTIONTYPE",
            A."NAZID",
            A."SHOWONSITE",
            A."NEED_TRANSFER"
     FROM   ( /*SELECT TRUNC(G.FD_DATE) + NUMTODSINTERVAL(G.FT_HOUR, 'HOUR') +
                     NUMTODSINTERVAL(G.FT_MIN, 'MINUTE') STARTON,
                     G.FN_INTERVAL,
                     G.FT_END,
                     N.FK_SOTRID,
                     EXCH43.PKG_EXCHANGE.GET_THEIR_ID_STR(ASU.EXCHANGE_SAMOZAPIS,
                                                          'SYSUSER',
                                                          'TSOTR',
                                                          N.FK_SOTRID) SYSUSER,
                     (SELECT FC_NAME FROM ASU.TKABINET WHERE FK_ID = N.FK_KABINETID) CABINET,
                     N.FK_KABINETID,
                     N.FK_SMID,
                     EXCH43.PKG_EXCHANGE.GET_THEIR_ID_STR(ASU.EXCHANGE_SAMOZAPIS,
                                                          'PRESCTYPE',
                                                          'TSMID',
                                                          N.FK_SMID) PRESCTYPE,
                     ASU.GET_SMIDNAME(N.FK_SMID) OUR_NAME,
                     ASU.GET_SOTRNAME(N.FK_SOTRID) OUR_SOTR,
                     G.FK_ID,
                     ASU.PKG_SMINI.READSTRING('CONFIG_SAMOZAPIS',
                                              'RECEPTIOTYPE_NAPR',
                                              'a43522d6-c755-41a3-965f-dad42f5bdc7d') RECEPTIONTYPE,
                     FK_NAZVRACHID NAZID,
                     0 SHOWONSITE
                FROM ASU.TRASPIS_SCHEMA R,
                     ASU.TNAZVRACH N,
                     ASU.TGRAPH G,
                     (SELECT FK_ID
                        FROM ASU.TSMID
                       WHERE FC_SYNONIM = 'RASPIS_SCHEMA') SM,
                     --I?eoeinu aiaaaeou oaeia ia?aie?aiea, o.e. caiaiee R.FK_NAZVRACHID = N.FK_ID ia R.FK_NAZVRACHID = N.FK_SOTRKABID
                     (SELECT TSS.FK_ID
                        FROM (SELECT * FROM ASU.TSMID TSS WHERE TSS.FL_SHOWANAL = 1) TSS
                       START WITH TSS.FK_ID IN (ASU.GET_KONSSPECID,
                                                ASU.GET_ISSLEDID,
                                                ASU.GET_PROCID)
                      CONNECT BY PRIOR TSS.FK_ID = TSS.FK_OWNER) SM_NAZ
               WHERE R.FK_NAZVRACHID = N.FK_SOTRKABID
                 AND G.FK_RASPID = R.FK_GRAPHID
                 AND R.FK_SCHEMAID = SM.FK_ID
                 AND N.FK_SMID = SM_NAZ.FK_ID
              UNION ALL*/
             SELECT     TRUNC (G.FD_DATE)
                      + NUMTODSINTERVAL (G.FT_HOUR, 'HOUR')
                      + NUMTODSINTERVAL (G.FT_MIN, 'MINUTE')
                         STARTON,
                      G.FN_INTERVAL,
                      G.FT_END,
                      N.FK_SOTRID,
                      EXCH43.PKG_EXCHANGE.GET_THEIR_ID_STR (
                         ASU.EXCHANGE_SAMOZAPIS,
                         'SYSUSER',
                         'TSOTR',
                         N.FK_SOTRID
                      )
                         SYSUSER,
                      (SELECT   FC_NAME
                         FROM   ASU.TKABINET
                        WHERE   FK_ID = N.FK_KABINETID)
                         CABINET,
                      N.FK_KABINETID,
                      N.FK_SMID,
                      EXCH43.PKG_EXCHANGE.GET_THEIR_ID_STR (
                         ASU.EXCHANGE_SAMOZAPIS,
                         'PRESCTYPE',
                         'TSMID',
                         N.FK_SMID
                      )
                         PRESCTYPE,
                      ASU.GET_SMIDNAME (N.FK_SMID) OUR_NAME,
                      ASU.GET_SOTRNAME (N.FK_SOTRID) OUR_SOTR,
                      G.FK_ID,
                      ASU.PKG_SMINI.READSTRING (
                         'CONFIG_SAMOZAPIS',
                         'RECEPTIOTYPE_PLAN',
                         '371ebf00-6fde-424e-b29c-710a9e28a7ee'
                      )
                         RECEPTIONTYPE,
                      FK_NAZVRACHID NAZID,
                      CASE
                         WHEN (R.FL_SHOW = 1) AND (G.FL_SHOW = 1) THEN 1
                         ELSE 0
                      END
                         AS SHOWONSITE,
                      R.FL_SHOW AS NEED_TRANSFER
               FROM   ASU.TRASPIS R,
                      ASU.TNAZVRACH N,
                      ASU.TGRAPH G,
                      --I?eoeinu aiaaaeou oaeia ia?aie?aiea, o.e. caiaiee R.FK_NAZVRACHID = N.FK_ID ia R.FK_NAZVRACHID = N.FK_SOTRKABID
                      (    SELECT   TSS.FK_ID
                             FROM   (SELECT   *
                                       FROM   ASU.TSMID TSS
                                      WHERE   TSS.FL_SHOWANAL = 1) TSS
                       START WITH   TSS.FK_ID IN
                                          (ASU.GET_KONSSPECID,
                                           ASU.GET_ISSLEDID,
                                           ASU.GET_PROCID)
                       CONNECT BY   PRIOR TSS.FK_ID = TSS.FK_OWNER) SM_NAZ
              WHERE       R.FK_NAZVRACHID = N.FK_SOTRKABID
                      AND G.FK_RASPID = R.FK_GRAPHID
                      AND N.FK_SMID = SM_NAZ.FK_ID) A
/


