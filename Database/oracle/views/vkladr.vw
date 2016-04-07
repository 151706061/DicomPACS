DROP VIEW ASU.VKLADR
/

/* Formatted on 06.04.2016 15:19:05 (QP5 v5.115.810.9015) */
--
-- VKLADR  (View)
--
--  Dependencies:
--   TKLADR (Table)
--

CREATE OR REPLACE FORCE VIEW ASU.VKLADR
(
   FK_ID,
   FC_NAME,
   FC_CODE,
   FC_PREFIX,
   FL_DEL,
   FK_OWNER,
   FN_LEVEL,
   FC_OKATO,
   FC_NAME2,
   FC_NAME3
)
AS
   SELECT   T."FK_ID",
            T."FC_NAME",
            T."FC_CODE",
            T."FC_PREFIX",
            T."FL_DEL",
            T."FK_OWNER",
            T."FN_LEVEL",
            T."FC_OKATO",
            T.FC_PREFIX || '.' || fc_name FC_NAME2,
            fc_name || ' ' || T.FC_PREFIX || '.' FC_NAME3
     FROM   ASU.TKLADR T
/


