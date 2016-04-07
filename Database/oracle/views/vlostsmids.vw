DROP VIEW ASU.VLOSTSMIDS
/

/* Formatted on 06.04.2016 15:19:08 (QP5 v5.115.810.9015) */
--
-- VLOSTSMIDS  (View)
--
--  Dependencies:
--   TSMID (Table)
--

CREATE OR REPLACE FORCE VIEW ASU.VLOSTSMIDS
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
   FC_TYPE,
   FN_ORDER,
   FK_DEFAULT,
   FN_COUNT,
   FN_PEOPLE,
   FN_PRICE,
   FN_NORM0,
   FN_NORM0M,
   FN_NORM1,
   FN_NORM1M,
   FN_COST1,
   FN_COST2,
   FN_COST3,
   FP_INOUT,
   FL_SHOWANAL
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
            "FC_TYPE",
            "FN_ORDER",
            "FK_DEFAULT",
            "FN_COUNT",
            "FN_PEOPLE",
            "FN_PRICE",
            "FN_NORM0",
            "FN_NORM0M",
            "FN_NORM1",
            "FN_NORM1M",
            "FN_COST1",
            "FN_COST2",
            "FN_COST3",
            "FP_INOUT",
            "FL_SHOWANAL"
     FROM   tsmid
   MINUS
       SELECT                                                       /*+ rule*/
             "FK_ID",
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
                "FC_TYPE",
                "FN_ORDER",
                "FK_DEFAULT",
                "FN_COUNT",
                "FN_PEOPLE",
                "FN_PRICE",
                "FN_NORM0",
                "FN_NORM0M",
                "FN_NORM1",
                "FN_NORM1M",
                "FN_COST1",
                "FN_COST2",
                "FN_COST3",
                "FP_INOUT",
                "FL_SHOWANAL"
         FROM   tsmid
   START WITH   fk_owner = 0
   CONNECT BY   PRIOR fk_id = fk_owner
/


