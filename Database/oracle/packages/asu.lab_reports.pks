DROP PACKAGE ASU.LAB_REPORTS
/

--
-- LAB_REPORTS  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   CT_YEAR (Type)
--   TNAZAN (Table)
--   TDIAG (Table)
--   TLABREG (Table)
--   TRESAN (Table)
--   TSMID (Table)
--   DO_DIAG (Function)
--   GET_AMBFIO (Function)
--   GET_AMBIB (Function)
--   GET_AMBSEX (Function)
--   GET_AMBVOZR (Function)
--   GET_AMBVRACH (Function)
--   GET_BIOPROBEPAC (Function)
--   GET_FCPALATA (Function)
--   GET_FIO (Function)
--   GET_IB (Function)
--   GET_NAME_FROM_SMID (Function)
--   GET_ORDER (Function)
--   GET_OWNER_FROM_SMID (Function)
--   GET_PACFIO (Function)
--   GET_PACPALATAID (Function)
--   GET_PACSEX (Function)
--   GET_PACVOZR (Function)
--   GET_PACVRACH (Function)
--   GET_SYNID (Function)
--   GET_TYPE_FROM_SMID (Function)
--   IS_AMBULANCE (Function)
--   DO_VRACHFIO (Function)
--   TEXPAN (Table)
--
CREATE OR REPLACE PACKAGE ASU."LAB_REPORTS" IS
--
-- Purpose: Попытка объединить все (Основные) отчеты по лаборатории
--
--By Philip A. Milovanov
--  TYPE TTextID IS (FK_ID NUMBER,FC_NAME VARCHAR2(100));
--  TYPE TTextIDTable IS TABLE OF TTextID;
  TYPE TNumTable IS TABLE OF INTEGER
    INDEX BY BINARY_INTEGER;
  TYPE TDateTable IS TABLE OF DATE
    INDEX BY BINARY_INTEGER;
  CURSOR cBioFio (pFD_D DATE) IS
    SELECT DISTINCT LPAD (get_bioprobepac (tlabreg.fk_pacid, pFD_D), 6, '0') FC_BIO, get_ib (tlabreg.fk_pacid) FC_IB, GET_PACFIO (TLABREG.FK_PACID) FC_FIO, SUBSTR(GET_PACSEX (TLABREG.FK_PACID),1,1)
                                 FC_SEX,
                             tlabreg.fk_pacid, GET_PACVOZR (TLABREG.FK_PACID) FC_VOZR, GET_FCPALATA (GET_PACPALATAID (TLABREG.FK_PACID)) FC_PALATA,DO_VRACHFIO(GET_PACVRACH(TLABREG.FK_PACID))FC_VRACH
      FROM tlabreg, tnazan,
           (SELECT GET_SYNID ('ANAL_BIOHIM') FK_BIO
              FROM DUAL)
     WHERE fk_smid = FK_BIO
       AND tnazan.FK_ID = fk_nazid
       AND TRUNC (fd_regist) = TRUNC (pFD_D)
       AND is_ambulance (tlabreg.fk_pacid) = 0
    UNION
    SELECT
       DISTINCT LPAD (get_bioprobepac (tlabreg.fk_pacid, pFD_D), 6, '0') FC_BIO, get_AMBib (tlabreg.fk_pacid) FC_IB, GET_AMBFIO (TLABREG.FK_PACID) FC_FIO, SUBSTR(GET_AMBSEX (TLABREG.FK_PACID),1,1) FC_SEX,
                tlabreg.fk_pacid, GET_AMBVOZR (TLABREG.FK_PACID) FC_VOZR, 'Амб.' FC_PALATA,DO_VRACHFIO(GET_AMBVRACH(TLABREG.FK_PACID))FC_VRACH
      FROM tlabreg, tnazan,
           (SELECT GET_SYNID ('ANAL_BIOHIM') FK_BIO
              FROM DUAL)
     WHERE fk_smid = FK_BIO
       AND tnazan.FK_ID = fk_nazid
       AND TRUNC (fd_regist) = TRUNC (pFD_D)
       AND is_ambulance (tlabreg.fk_pacid) = 1
     ORDER BY 1;
  CURSOR cBioPac (pFD_D DATE) IS
    SELECT  DISTINCT TLABREG.FK_PACID, get_bioprobepac (tlabreg.fk_pacid, pFD_D) FC_BIO,GET_FIO(TLABREG.FK_PACID) FC_FIO
      FROM tlabreg, tnazan,
           (SELECT GET_SYNID ('RAZ_BIOHIM') FK_BIO
              FROM DUAL)
     WHERE GET_OWNER_FROM_SMID(fk_smid) = FK_BIO
       AND tnazan.FK_ID = fk_nazid
       AND TRUNC (fd_regist) = TRUNC (pFD_D)
     ORDER BY FC_BIO;
  CURSOR cIsContr (pFD_D DATE, pFK_SM NUMBER) IS
    SELECT COUNT (tlabreg.fk_id)
      FROM tnazan, tlabreg, texpan
     WHERE fd_regist = pFD_D
       AND tnazan.fk_id = tlabreg.fk_nazid
       AND tnazan.fk_id = texpan.fk_nazid
       AND texpan.fk_smid = pFK_SM;
  CURSOR cIsPac (pFD_D DATE, pFK_PAC NUMBER, pFK_SM NUMBER) IS
    SELECT COUNT (tlabreg.fk_id)
      FROM tnazan, tlabreg, texpan
     WHERE fd_regist = pFD_D
       AND tlabreg.fk_pacid = pFK_PAC
       AND tnazan.fk_id = tlabreg.fk_nazid
       AND tnazan.fk_id = texpan.fk_nazid
       AND texpan.fk_smid = pFK_SM;
  CURSOR cGetVal (pFK_PAC NUMBER, pFK_SM NUMBER, pFD_INS DATE) IS
    SELECT GET_TYPE_FROM_SMID (FK_SMID), FN_RES, FN_RES2, FC_RES, GET_NAME_FROM_SMID (FK_BLOBID), GET_TYPE_FROM_SMID (FK_BLOBID)
      FROM TRESAN
     WHERE FK_PACID = pFK_PAC
       AND FK_SMID = pFK_SM
       AND FD_INS = (SELECT MAX (FD_INS)
                       FROM TRESAN
                      WHERE FK_PACID = pFK_PAC
                        AND FK_SMID = pFK_SM
                        AND FD_INS < pFD_INS);
  CURSOR cDiag (pFK_PACID NUMBER) IS
    SELECT do_diag (fk_id) FC_DIAG
      FROM tdiag
     WHERE fk_pacid = pFK_PACID
       AND fp_type = 2
     ORDER BY FL_MAIN DESC;
  CURSOR cBioIssl IS
   SELECT/*+rule index_asc (TSMID TSMID_BY_OWNER_ORDER)*/ LEVEL,FK_ID, FC_NAME, FK_MKB9,GET_ORDER(FK_ID)
      FROM tsmid WHERE FL_SHOWANAL IN (2,3,4)
     START WITH FK_OWNER=GET_SYNID ('RAZ_BIOHIM') CONNECT BY PRIOR FK_ID=FK_OWNER;
--    SELECT/*+rule*/ FK_ID, FC_NAME, FK_MKB9
--      FROM (SELECT GET_SYNID ('ANAL_BIOHIM') FK_BIO
--              FROM DUAL), tsmid
--     WHERE FK_OWNER = FK_BIO
--     ORDER BY FN_ORDER;

 /*    SELECT/*+rule*/
                       /*DISTINCT fk_smid, get_name_from_smid (fk_smid) fc_name
      FROM tlabreg, texpan,
           (SELECT GET_SYNID ('ANAL_BIOHIM') FK_BIO
              FROM DUAL)
     WHERE TRUNC (fd_regist) = TRUNC (pFD_D)
       AND TLABREG.fk_nazid = texpan.fk_nazid
       AND GET_OWNER_FROM_SMID (fk_smid) = fk_bio;
*/
/*   SELECT FK_SMID, GET_NAME_FROM_SMID (FK_SMID) FC_NAME FROM
    (SELECT  DISTINCT FK_SMID FROM TEXPAN,
    (SELECT FK_NAZID FK_VNAZID FROM TLABREG WHERE TRUNC (FD_REGIST) = TRUNC (pFD_D))
      WHERE FK_NAZID = FK_VNAZID)  , (SELECT GET_SYNID ('ANAL_BIOHIM') FK_BIO FROM DUAL),tsmid
   WHERE TSMID.FK_ID=FK_SMID AND FK_OWNER = FK_BIO ORDER BY FN_ORDER;
*/
  FUNCTION GET_TEMPTABLENAME
    RETURN VARCHAR2;
  FUNCTION GET_LABORANTINFO (pFD_DATE IN DATE, pFK_SMID IN NUMBER)
    RETURN NUMBER;
  FUNCTION GET_BIOHIMFIO (pFD_DATE IN DATE)
    RETURN NUMBER;
  FUNCTION GET_BIOHIMISSL (pFD_DATE IN DATE)
    RETURN NUMBER;
  FUNCTION GET_DONEISSLRAZD (pFD_DATE1 IN DATE, pFD_DATE2 IN DATE, pFK_SMID IN NUMBER)
    RETURN NUMBER;
  FUNCTION GET_PROIZV_LAB_VITIAZ (pFN_YEAR IN NUMBER, pFN_COUNT IN NUMBER, pFK_VRACHID IN NUMBER)
    RETURN NUMBER;
  FUNCTION GET_COUNT_ISSL_YEAR (pFN_YEAR IN NUMBER, pFN_TYPE IN NUMBER)
    RETURN NUMBER;
  FUNCTION GET_DAILY_WORK_VITIAZ (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_VRACHID IN NUMBER)
    RETURN NUMBER;
  FUNCTION GET_LAB_WORK_ISSL_VITIAZ (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_VRACHID IN NUMBER)
    RETURN NUMBER;
  FUNCTION GET_FUCK_POVT_CONTR_LAB_DUB (pFN_YEAR IN NUMBER, pFN_COUNT IN NUMBER, pFK_VRACHID IN NUMBER) RETURN NUMBER;
  FUNCTION GET_LAB_POKAZ_DUB (pFN_YEAR IN NUMBER, pFN_COUNT IN NUMBER, pFK_VRACHID IN NUMBER) RETURN NUMBER;
  FUNCTION GET_LAB_PROIZV_DUB (pFN_YEAR IN NUMBER, pFN_COUNT IN NUMBER, pFK_VRACHID IN NUMBER) RETURN NUMBER;
  FUNCTION GET_LAB_PROV_ISSL_RAZD_DUB (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_RAZDID IN NUMBER,pFK_VRACHID IN NUMBER) RETURN NUMBER;
  FUNCTION GET_LAB_WORK_OTDEL_DUB (pFD_DATA1 IN DATE, pFD_DATA2 IN DATE, pFK_RAZDID IN NUMBER,pFK_VRACHID IN NUMBER) RETURN NUMBER;

  FUNCTION GET_LABORANTINFO2 (pFD_DATE IN DATE)
    RETURN NUMBER;
 /*-----------------------------------------------------------------------------
  * Функция которая собирает текст результатов назначений
  *
  * @param pfk_pacid
  *  Код пациента
  *
  * @param pft_clobs типа CT_YEAR
  *  Массив идентификаторов назначений
  *
  * @retrun CLOB
  *---------------------------------------------------------------------------*/
  FUNCTION GET_PRINT_RESULT (pfk_pacid IN NUMBER, pft_clobs IN CT_YEAR)
    RETURN CLOB;

 /*-----------------------------------------------------------------------------
  * Функция которая собирает текст результата назначения
  *
  * @param pfk_nazid
  *  Код пациента
  *
  * @retrun CLOB
  *---------------------------------------------------------------------------*/
  FUNCTION GET_NAZ_RESULT (pfk_nazid IN NUMBER)
    RETURN CLOB;
 /*-----------------------------------------------------------------------------
  * Отчет "Заявка в Клиническую лабораторию"
  *
  * В отчете выводиться следующая информация:
  * № Строки
  * № Истории болезни
  * ФИО
  * № Палаты
  * В строке все назначения на клиническую лабораторию на данную дату
  * Время свертывания на данную дату
  * Длительность кровотечения на данную дату
  * Поле ПРИМЕЧАНИЕ всегда пустое для заполнения после печати отчета
  *
  * @param pfk_otdelid
  *  Код отдела
  *
  * @param pfd_date
  *  Дата на которую собираеться отчет
  *
  * @retrun CLOB
  *---------------------------------------------------------------------------*/
  FUNCTION GET_ZAYAVKA (pfk_otdelid IN NUMBER,
                        pfd_date    IN DATE)
    RETURN NUMBER;
/*----------------------------------------------------------------------------*/
  FUNCTION GET_ALL_NAZ_ON_DATE (pfd_date IN DATE,
                                pfk_pacid IN NUMBER,
                                pfk_razdid IN NUMBER)
    RETURN VARCHAR2;
/*----------------------------------------------------------------------------*/
END;                                                                                                                                                                -- Package Specification LAB_REPORTS
/

SHOW ERRORS;


