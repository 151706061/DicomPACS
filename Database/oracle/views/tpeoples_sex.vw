DROP VIEW ASU.TPEOPLES_SEX
/

/* Formatted on 06.04.2016 15:18:57 (QP5 v5.115.810.9015) */
--
-- TPEOPLES_SEX  (View)
--
--  Dependencies:
--   DUAL (Synonym)
--

CREATE OR REPLACE FORCE VIEW ASU.TPEOPLES_SEX
(
   FK_ID,
   FC_LETTER,
   FC_SHORTNAME,
   FC_FULLNAME
)
AS
   SELECT   1 fk_id,
            CAST ('М' AS VARCHAR2 (1)) fc_letter,
            CAST ('Муж' AS VARCHAR2 (3)) fc_shortname,
            CAST ('Мужской' AS VARCHAR2 (7)) fc_fullname
     FROM   DUAL
   UNION ALL
   SELECT   0 fk_id,
            CAST ('Ж' AS VARCHAR2 (1)) fc_letter,
            CAST ('Жен' AS VARCHAR2 (3)) fc_shortname,
            CAST ('Женский' AS VARCHAR2 (7)) fc_fullname
     FROM   DUAL
/


