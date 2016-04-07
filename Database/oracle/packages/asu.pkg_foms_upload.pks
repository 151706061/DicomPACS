DROP PACKAGE ASU.PKG_FOMS_UPLOAD
/

--
-- PKG_FOMS_UPLOAD  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TSLUCH_DBF (Table)
--   TUSL_DBF (Table)
--   TEXSLUCH_ERR (Table)
--
CREATE OR REPLACE PACKAGE ASU.PKG_FOMS_UPLOAD IS
 -- Глобальные переменные
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 lpu_code         asu.tsluch_dbf.lpu_id%type; -- Родное ЛПУ
 vYEAR            asu.tsluch_dbf.year%type;
 vMONTH           asu.tsluch_dbf.month%type;
 OPER_KOYKAVIDID  NUMBER(1) := -5; -- тип кеойки, который устанавливается у стационарной услуги, если она является операцией, а не переводом
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 ------------------------------------------------------------------------------
 procedure ClearLog;
 procedure AddLog(pSTART DATE, pACTION varchar2, pFUNCTION varchar2);

 function  GetDIA_E(aSluchID ASU.tsluch_dbf.fk_id%type) return VARCHAR2;

-- procedure ClearLog;
-- procedure AddLog(pSTART DATE, pACTION varchar2, pFUNCTION varchar2);
-- FUNCTION  GET_IS_POLY(pSluchID IN ASU.tsluch_dbf.fk_id%TYPE) RETURN NUMBER;
-- FUNCTION  GET_IS_POLY_BY_NAZ(pUslID IN ASU.tusl_dbf.fk_id%TYPE) RETURN NUMBER;
-- FUNCTION  GET_ID_ILL(pSluchID IN ASU.tsluch_dbf.fk_id%TYPE) RETURN NUMBER;
-- FUNCTION  GET_ID_ILL_BY_NAZ(pUslID IN ASU.tusl_dbf.fk_id%TYPE) RETURN NUMBER;

 PROCEDURE ADD_LOAD_ERR(pYEAR       ASU.texsluch_err.YEAR%TYPE,
                        pMONTH      ASU.texsluch_err.MONTH%TYPE,
                        pLPU_ID     ASU.texsluch_err.LPU_ID%TYPE,
                        pPERSON_IDL ASU.texsluch_err.PERSON_IDL%TYPE,
                        pID_ILL     ASU.texsluch_err.ID_ILL%TYPE,
                        pID_ILL_U   ASU.texsluch_err.ID_ILL_U%TYPE,
                        pP_ID_ILL   ASU.texsluch_err.P_ID_ILL%TYPE,
                        pFC_CODE    ASU.texsluch_err.FC_CODE%TYPE,
                        pFC_MSG_ERR ASU.texsluch_err.FC_MSG_ERR%TYPE,
                        pFC_FIELDS  ASU.texsluch_err.FC_FIELDS%TYPE);

 PROCEDURE ADD_SLUCH_ERR(pSluchID IN ASU.tsluch_dbf.fk_id%TYPE,
                         pFC_CODE ASU.texsluch_err.fc_code%TYPE,
                         pFC_MSG_ERR ASU.texsluch_err.FC_MSG_ERR%TYPE,
                         pFC_FIELDS ASU.texsluch_err.FC_FIELDS%TYPE);
 PROCEDURE FILL_EXSLUCH_ERR_SLUCH(pSluchID IN ASU.tsluch_dbf.fk_id%TYPE,
                                  pYear IN ASU.tsluch_dbf.year%TYPE,
                                  pMonth IN ASU.tsluch_dbf.month%TYPE);
 PROCEDURE ADD_USL_ERR(pUslID IN ASU.tusl_dbf.fk_id%TYPE,
                       pFC_CODE ASU.texsluch_err.fc_code%TYPE,
                       pFC_MSG_ERR ASU.texsluch_err.FC_MSG_ERR%TYPE,
                       pFC_FIELDS ASU.texsluch_err.FC_FIELDS%TYPE);
 PROCEDURE FILL_EXSLUCH_ERR_USL(pUslID IN ASU.tusl_dbf.fk_id%TYPE,
                                pYear IN ASU.tsluch_dbf.year%TYPE,
                                pMonth IN ASU.tsluch_dbf.month%TYPE);

 procedure FILL_SLUCH_DBF_CALC(pBeg DATE, pEnd DATE, pAddUnExSluch NUMBER, pAddSluchByYear NUMBER default 1,
                               pSluchType NUMBER default 0,
                               pUseStorage integer default 0,
                               pUseTDBFEXCH_TYPE_V_MU integer default 1);
 PROCEDURE FILL_STAC(pOMS_ONLY NUMBER default 1, pOWN NUMBER default 0);
 PROCEDURE FILL_STAC_USL;
 PROCEDURE FILL_STAC_SLUCH;
 PROCEDURE FILL_FIRST_TABLE_DBF(pOMS_ONLY NUMBER default 1, pSluchType NUMBER default 0, pOWN NUMBER default 0);
 PROCEDURE CLEAR_TABLES;
 PROCEDURE DELETE_FROM_SLUCH_DBF_CALC;
 PROCEDURE FILL_CACHE;
 PROCEDURE ADD_MAIN_DATA;
 PROCEDURE ADD_INSUR_AND_ALIEN_DATA(pSluchID IN ASU.tsluch_dbf.fk_id%TYPE);
 PROCEDURE ADD_ALL_DIAG_DATA;
 PROCEDURE ADD_ALL_INSUR_AND_ALIEN_DATA;
 PROCEDURE ADD_ALL_SLUCH_DATA;
 PROCEDURE FILL_AMB_USL;
 PROCEDURE ADD_DISP_USL;
 PROCEDURE ADD_CHILD_USL;
 PROCEDURE ADD_STAC_OPER;
 PROCEDURE ADD_STAC_OPER_SK;
 PROCEDURE ADD_AMB_USL_AND_OPER_DOC_DATA;
 PROCEDURE ADD_AMB_SUM_DATA(aAmbGroupMode Integer default 0);
 PROCEDURE ADD_ER;
 PROCEDURE DELETE_ZERO_COST_USL;
 PROCEDURE ADD_TOTAL;
 PROCEDURE SYNC_AMB_DATA;
 PROCEDURE FILL_BY_PERSON;
 FUNCTION  GET_TOTAL_RSA RETURN NUMBER;
 FUNCTION  GET_TOTAL_USA RETURN NUMBER;
 PROCEDURE GROUP_AMB_SLUCH;
 PROCEDURE UNGROUP_AMB_SLUCH;
 PROCEDURE FILL_EXSLUCH_ERR;
 procedure LoadFromStorage(aYear integer default vYEAR, aMonth integer default vMONTH);
 procedure SaveToStorage(aErrOnly integer default 0);
 procedure FillGrids;
 procedure CalculateAndSave/*(aLastPeriod integer default 1)*/;
 procedure CalculateAndSaveExt (pBeg DATE, pEnd DATE, pAddUnExSluch NUMBER, pOMS_ONLY NUMBER, pAddSluchByYear NUMBER, pSluchType NUMBER, pOWN NUMBER,
                                pUseStorage integer default 0, pIsGroupAmbSluch integer default 0, pStartFromCLEAR_TABLES integer default 0, pReCalc integer default 0);
END;
/

SHOW ERRORS;


