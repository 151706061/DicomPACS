DROP PACKAGE ASU.PKG_INSPECTIONCOPY
/

--
-- PKG_INSPECTIONCOPY  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_INSPECTIONCOPY" IS
  /* Ефимов Виктор 03.12.2008 Возвращает в виде страки значение по
     TIB.FK_ID (pIBID). Значение выбирается в зависимости от типа */
  FUNCTION GET_IBVALUEBYID(pIBID Number) RETURN VARCHAR2;

  /* Ефимов Виктор 03.12.2008 Возвращает соответствующее название TSMID.FC_NAME
     Для всех типов кроме COMBOBOX название берётся по FK_SMID,
     для COMBOBOX по FK_SMEDITID */
  FUNCTION GET_IBNAMEBYID(pIBID Number) RETURN VARCHAR2;

  /* Ефимов Виктор 03.12.2008
     Для всех типов кроме COMBOBOX возвращает FK_SMID,
     для COMBOBOX - FK_SMEDITID */
  FUNCTION GET_IBSMIDIDBYID(pIBID Number) RETURN NUMBER;

  /* Ефимов Виктор 05.12.2008 Возвращает 1 если типы совпадают */
  FUNCTION IsTSmidSameType(pTo Number, pFrom Number) RETURN NUMBER;

  /* Ефимов Виктор 28.01.2009 Добавляет pSmid во временную таблицу T_TMP_INSPECTION_COPY_IN_SMID*/
--  procedure INSERT_TMP_IN_SMID(pSmid Number);

  /* Ефимов Виктор 29.01.2009 заполняет временную таблицу результатов копирования полей asu.T_TMP_INSPECTION_COPY_RESULT для поля pSmid типа VARCHAR2*/
--  procedure INSERT_TMP_COPY_RESULT_VC2(pSmid Number, pPeopleID Number);

  /* Ефимов Виктор 30.01.2009 заполняет временную таблицу результатов копирования полей asu.T_TMP_INSPECTION_COPY_RESULT для полей из таблицы asu.T_TMP_INSPECTION_COPY_IN_SMID относящихся к типам EDIT, NUMBER, COMBOBOX, DATE*/
--  procedure INSERT_TMP_COPY_RESULT(pPeopleID Number);

  /* Ефимов Виктор 30.01.2009 добавляет во временную таблицу результатов копирования полей для полей asu.T_TMP_INSPECTION_COPY_RESULT из таблицы asu.T_TMP_INSPECTION_COPY_IN_SMID */
--  procedure ADD_TMP_COPY_RESULT(pPeopleID Number);

  /* Ефимов Виктор 29.01.2009 Выбор отчёта (asu.tib.fk_pacid) к которому относится наиболее позднее
     из всех полей связанных с полем pSmidID типа varchar2 для пациента pPeopleID */
  FUNCTION GET_OLDES_VARCHAR2_PACID(pSmid Number, pPeopleID Number) RETURN NUMBER;

  /* Ефимов Виктор 03.02.2009 Если pValue не null, то вернёт pValue, иначе pName */
  FUNCTION ValueOrName(pValue Varchar2, pName Varchar2) RETURN Varchar2;
END;
/

SHOW ERRORS;


