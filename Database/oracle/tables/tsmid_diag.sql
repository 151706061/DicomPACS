DROP TABLE ASU.TSMID_DIAG CASCADE CONSTRAINTS
/

--
-- TSMID_DIAG  (Table) 
--
CREATE GLOBAL TEMPORARY TABLE ASU.TSMID_DIAG
(
  FK_ID                NUMBER(15)               NOT NULL,
  FC_NAME              VARCHAR2(250 BYTE),
  FK_CLASS             NUMBER(2),
  FK_CHANGE            NUMBER(3),
  FC_ED_IZM            VARCHAR2(20 BYTE),
  FN_LOW_M             NUMBER(9,3),
  FN_HI_M              NUMBER(9,3),
  FN_LOW_W             NUMBER(9,3),
  FN_HI_W              NUMBER(9,3),
  FP_PAT               VARCHAR2(1 BYTE),
  FC_TIME              VARCHAR2(8 BYTE),
  FN_ED                NUMBER(5,2),
  FC_REMARK            VARCHAR2(254 BYTE),
  FK_LOINC_CODE        VARCHAR2(6 BYTE),
  FC_SYNONIM           VARCHAR2(254 BYTE),
  FC_ANSWER            VARCHAR2(254 BYTE),
  FC_ANSWER_W          VARCHAR2(25 BYTE),
  FC_ANSWER_M          VARCHAR2(25 BYTE),
  FK_MKB9              VARCHAR2(20 BYTE),
  FK_MKB10             VARCHAR2(8 BYTE),
  FK_OWNER             NUMBER(15),
  FP_ISFOLDER          NUMBER(1),
  FC_TYPE              VARCHAR2(25 BYTE),
  FN_ORDER             NUMBER(15),
  FK_DEFAULT           NUMBER(15,4),
  FN_COUNT             NUMBER(5),
  FN_PEOPLE            NUMBER(2),
  FN_PRICE             NUMBER(6,2),
  FN_NORM0             NUMBER(9,3),
  FN_NORM0M            NUMBER(9,3),
  FN_NORM1             NUMBER(9,3),
  FN_NORM1M            NUMBER(9,3),
  FN_COST1             NUMBER(6,2),
  FN_COST2             NUMBER(6,2),
  FN_COST3             NUMBER(6,2),
  FP_INOUT             NUMBER(1),
  FL_SHOWANAL          NUMBER(1),
  FL_STAT              NUMBER(1),
  FL_SHOWPRINT         NUMBER(1),
  FL_SHOWDIAGPREDZAKL  NUMBER(1),
  FN_EDCHILD           NUMBER(5,2),
  FL_PLATDEFAULT       NUMBER(1),
  FL_USLUGA            NUMBER(1)
)
ON COMMIT PRESERVE ROWS
NOCACHE
/


