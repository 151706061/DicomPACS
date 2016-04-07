DROP VIEW ASU.WEB_INSURANCE
/

/* Formatted on 06.04.2016 15:19:28 (QP5 v5.115.810.9015) */
--
-- WEB_INSURANCE  (View)
--
--  Dependencies:
--   PKG_EXCHANGE (Package)
--   TINSURDOCS (Table)
--   EXCHANGE_SAMOZAPIS (Function)
--

CREATE OR REPLACE FORCE VIEW ASU.WEB_INSURANCE
(
   INSURCOMPANY,
   INSURTYPE,
   FK_ID,
   FK_PEPLID,
   FK_GROUPID,
   FK_DOGOVORID,
   FK_TYPEDOCID,
   FC_SER,
   FD_BEGIN,
   FD_END,
   FC_NUM,
   FK_COMPANYID,
   FD_PROLONG
)
AS
   SELECT   EXCH43.PKG_EXCHANGE.GET_THEIR_ID_STR (ASU.EXCHANGE_SAMOZAPIS,
                                                  'INSURCOMPANY',
                                                  'TCOMPANY',
                                                  I.FK_COMPANYID)
               INSURCOMPANY,
            EXCH43.PKG_EXCHANGE.GET_THEIR_ID_STR (ASU.EXCHANGE_SAMOZAPIS,
                                                  'INSURTYPE',
                                                  'TTYPEDOC',
                                                  I.FK_TYPEDOCID)
               INSURTYPE,
            I."FK_ID",
            I."FK_PEPLID",
            I."FK_GROUPID",
            I."FK_DOGOVORID",
            I."FK_TYPEDOCID",
            I."FC_SER",
            I."FD_BEGIN",
            I."FD_END",
            I."FC_NUM",
            I."FK_COMPANYID",
            I."FD_PROLONG"
     FROM   ASU.TINSURDOCS I
/


