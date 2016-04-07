DROP VIEW ASU.VLECHFACT
/

/* Formatted on 06.04.2016 15:19:06 (QP5 v5.115.810.9015) */
--
-- VLECHFACT  (View)
--
--  Dependencies:
--   TSMID (Table)
--

CREATE OR REPLACE FORCE VIEW ASU.VLECHFACT
(
   FK_ID,
   FC_NAME,
   FK_CLASS,
   FK_CHANGE,
   FC_ED_IZM,
   FN_LOW_M,
   FN_HI_M,
   FN_LOW_W,
   FN_HI_W,
   FP_PAT,
   FC_TIME,
   FN_ED,
   FC_REMARK,
   FK_LOINC_CODE,
   FC_SYNONIM,
   FC_ANSWER,
   FC_ANSWER_W,
   FC_ANSWER_M,
   FK_MKB9,
   FK_MKB10,
   FK_OWNER,
   FP_ISFOLDER,
   FC_TYPE
)
AS
       SELECT   "FK_ID",
                "FC_NAME",
                "FK_CLASS",
                "FK_CHANGE",
                "FC_ED_IZM",
                "FN_LOW_M",
                "FN_HI_M",
                "FN_LOW_W",
                "FN_HI_W",
                "FP_PAT",
                "FC_TIME",
                "FN_ED",
                "FC_REMARK",
                "FK_LOINC_CODE",
                "FC_SYNONIM",
                "FC_ANSWER",
                "FC_ANSWER_W",
                "FC_ANSWER_M",
                "FK_MKB9",
                "FK_MKB10",
                "FK_OWNER",
                "FP_ISFOLDER",
                "FC_TYPE"
         FROM   tsmid
        WHERE   NOT EXISTS (SELECT   fk_id
                              FROM   tsmid ts
                             WHERE   ts.fk_owner = tsmid.fk_id)
   START WITH   fk_owner = 1360
   CONNECT BY   PRIOR fk_id = fk_owner
   UNION
       SELECT   "FK_ID",
                "FC_NAME",
                "FK_CLASS",
                "FK_CHANGE",
                "FC_ED_IZM",
                "FN_LOW_M",
                "FN_HI_M",
                "FN_LOW_W",
                "FN_HI_W",
                "FP_PAT",
                "FC_TIME",
                "FN_ED",
                "FC_REMARK",
                "FK_LOINC_CODE",
                "FC_SYNONIM",
                "FC_ANSWER",
                "FC_ANSWER_W",
                "FC_ANSWER_M",
                "FK_MKB9",
                "FK_MKB10",
                "FK_OWNER",
                "FP_ISFOLDER",
                "FC_TYPE"
         FROM   tsmid
        WHERE   NOT EXISTS (SELECT   fk_id
                              FROM   tsmid ts
                             WHERE   ts.fk_owner = tsmid.fk_id)
   START WITH   fk_owner = 1321
   CONNECT BY   PRIOR fk_id = fk_owner
   UNION
       SELECT   "FK_ID",
                "FC_NAME",
                "FK_CLASS",
                "FK_CHANGE",
                "FC_ED_IZM",
                "FN_LOW_M",
                "FN_HI_M",
                "FN_LOW_W",
                "FN_HI_W",
                "FP_PAT",
                "FC_TIME",
                "FN_ED",
                "FC_REMARK",
                "FK_LOINC_CODE",
                "FC_SYNONIM",
                "FC_ANSWER",
                "FC_ANSWER_W",
                "FC_ANSWER_M",
                "FK_MKB9",
                "FK_MKB10",
                "FK_OWNER",
                "FP_ISFOLDER",
                "FC_TYPE"
         FROM   tsmid
        WHERE   NOT EXISTS (SELECT   fk_id
                              FROM   tsmid ts
                             WHERE   ts.fk_owner = tsmid.fk_id)
   START WITH   fk_owner = 1323
   CONNECT BY   PRIOR fk_id = fk_owner
   UNION
       SELECT   "FK_ID",
                "FC_NAME",
                "FK_CLASS",
                "FK_CHANGE",
                "FC_ED_IZM",
                "FN_LOW_M",
                "FN_HI_M",
                "FN_LOW_W",
                "FN_HI_W",
                "FP_PAT",
                "FC_TIME",
                "FN_ED",
                "FC_REMARK",
                "FK_LOINC_CODE",
                "FC_SYNONIM",
                "FC_ANSWER",
                "FC_ANSWER_W",
                "FC_ANSWER_M",
                "FK_MKB9",
                "FK_MKB10",
                "FK_OWNER",
                "FP_ISFOLDER",
                "FC_TYPE"
         FROM   tsmid
        WHERE   NOT EXISTS (SELECT   fk_id
                              FROM   tsmid ts
                             WHERE   ts.fk_owner = tsmid.fk_id)
   START WITH   fk_owner = 1324
   CONNECT BY   PRIOR fk_id = fk_owner
/


