DROP FUNCTION ASU.DO_TABLE_TO_HTML
/

--
-- DO_TABLE_TO_HTML  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_LOB (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   ALL_COL_COMMENTS (Synonym)
--   DBMS_SQL (Synonym)
--   ALL_TAB_COLUMNS (Synonym)
--   PLITBLM (Synonym)
--   TCLOBS (Table)
--   WORDPOSITION (Function)
--   EXTRACTWORD (Function)
--
CREATE OR REPLACE FUNCTION ASU."DO_TABLE_TO_HTML" (sTableName IN VARCHAR2)
  RETURN NUMBER
IS
  CURSOR cTable (pTable IN VARCHAR2)
  IS
    SELECT ALL_TAB_COLUMNS.COLUMN_NAME, DATA_length, NVL (comments, ALL_TAB_COLUMNS.COLUMN_NAME) AS comments
      FROM ALL_TAB_COLUMNS, all_col_comments
     WHERE ALL_TAB_COLUMNS.table_name = UPPER (pTable)
       AND all_col_comments.table_name = UPPER (pTable)
       AND ALL_TAB_COLUMNS.column_name = all_col_comments.column_name
     ORDER BY COLUMN_ID;

  TYPE tCols IS TABLE OF cTable%ROWTYPE
    INDEX BY BINARY_INTEGER;

  sTmp        VARCHAR(32767);
  nTemp       NUMBER;
  cl          CLOB;
  cl_real     CLOB;
  nID         NUMBER;   --возвращаемый код  ЋќЅј
  cid         NUMBER;
  s           VARCHAR2(2000);
  nColCount   NUMBER                := 0;
  sSQL        VARCHAR2(4000);
  nCols       tCols;
  nRowSpan    INTEGER;
  nColSpan    INTEGER;
  aColAlign   DBMS_SQL.number_table;

  PROCEDURE CalcColSpan (i IN INTEGER, j IN INTEGER, pColSpan OUT INTEGER)
  IS
    s      VARCHAR2(2000);
    sDeb   VARCHAR2(2000);
  BEGIN
    --если вообще нет разделетилей
    IF INSTR (nCols (j).Comments, '|', 1, i) = 0 THEN
      pColSpan := 0;
      RETURN;
    END IF;
    --проверим выставили ли перед этим ColSpan
    IF     j <> 1
       AND extractword (i, nCols (j).comments, '|') = extractword (i, nCols (j - 1).comments, '|') THEN
      pColSpan := -1;   -- вообще не надо указывать <td>...</td>
      RETURN;
    END IF;
    pColSpan := 1;
    --подсчитаем значение ColSpan как кол-во колонок с таким же текстом в I-ой строке
    FOR k IN j + 1 .. nCols.COUNT
    LOOP
      s := extractword (i, nCols (j).comments, '|');
      sDeb := extractword (i, nCols (k).comments, '|');
      IF extractword (i, nCols (j).comments, '|') = extractword (i, nCols (k).comments, '|') THEN
        pColSpan := pColSpan + 1;
      ELSE
        EXIT;
      END IF;
    END LOOP;
    RETURN;
  END;
BEGIN
  sTmp := '<head> <meta http-equiv=Content-Type content="text/html; charset=windows-1251"></Head>' ||
          CHR (
            13
          ) ||
          '<table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolorlight="#000000" bordercolordark="#FFFFFF" bgcolor="#FFFFFF" bordercolor="#FFFFFF" align="center">' ||
          CHR (
            13
          );
  INSERT INTO tclobs (fk_id, fc_clob)
       VALUES (NULL, EMPTY_CLOB ())
    RETURNING fc_clob, fk_id INTO cl_real, nID;
  dbms_lob.CREATETEMPORARY (cl, TRUE, 1);
  DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
  --составим запрос дл€ выборки данных из перегон€мой таблицы
  cid := DBMS_SQL.open_cursor;
  sSQL := 'select ';
  FOR i IN cTable (sTableName)
  LOOP
    sSQL := sSQL || i.column_name || ', ';
  END LOOP;
  sSQL := SUBSTR (sSQL, 1, LENGTH (sSQL) - 2) || ' from ' || sTableName;
  DBMS_SQL.parse (cid, sSQL, DBMS_SQL.native);
  -- заполним шапку ’“ћЋ таблицы и объ€вим все колумны
  FOR i IN cTable (sTableName)
  LOOP
    nColCount := nColCount + 1;
    nCols (nColCount) := i;
    DBMS_SQL.define_column (cid, nColCount, s, i.data_length);
  END LOOP;
  --подсчитаем сколько должно быть строк в шапке
  nTemp := 1;   -- кол-во строк в шапке
  FOR i IN 1 .. nCols.COUNT
  LOOP
    sTmp := nCols (i).comments;
    IF LENGTH (REPLACE (nCols (i).comments, '|', '||')) - LENGTH (nCols (i).comments) + 1 > nTemp THEN
      nTemp := LENGTH (REPLACE (nCols (i).comments, '|', '||')) - LENGTH (nCols (i).comments) + 1;
    END IF;
  END LOOP;
  -- сформируем шапку при условии наличи€ в ней только одной строки
  sTmp := '';
  IF nTemp = 1 THEN
    FOR i IN 1 .. nCols.COUNT - 1
    LOOP
      stmp := stmp || '<td>' || nCols (i).comments || '</td>';
    END LOOP;
    sTmp := '<tr>' || sTmp || '</tr>';
  ELSE
    -- если строк в шапке более одной                                                                                                                                                                                                                  -- если строк в шапке болше одной
    FOR i IN 1 .. nTemp
    LOOP
      sTmp := sTmp || '<tr>' || CHR (13);
      FOR j IN 1 .. nCols.COUNT
      LOOP
        IF WordPosition (i + 1, nCols (j).Comments, '|') != 0 THEN
          nRowSpan := 0;
        ELSE
          nRowSpan := nTemp - i + 1;
        END IF;
        CalcColSpan (i, j, nColSpan);
        IF     nColSpan > -1
           AND nRowSpan > -1
           AND ExtractWord (i, nCols (j).Comments, '|') IS NOT NULL THEN
          sTmp := sTmp ||
                  '  <td colspan=' ||
                  nColSpan ||
                  ' rowspan=' ||
                  nRowSpan ||
                  ' align="center" valign="middle"><font color="#003366" size="+2">' ||
                  ExtractWord (i, nCols (j).Comments, '|') ||
                  '</font></td>' ||
                  CHR (13);
        END IF;
      END LOOP;
      sTmp := sTmp || '</tr>' || CHR (13);
    END LOOP;
  END IF;
  DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
  --перенесем данные из таблицы в ’“ћЋ-ку
  sTmp := '';
  nTemp := DBMS_SQL.execute (cid);
  LOOP
    IF DBMS_SQL.fetch_rows (cid) > 0 THEN
      sTmp := CHR (10) || '<tr>' || CHR (10);
      FOR i IN 1 .. nColCount
      LOOP
        DBMS_SQL.column_value (cid, i, s);
        IF s IS NULL THEN
          sTmp := sTmp || '  <td>&nbsp</td>' || CHR (13);
        ELSE
          IF nCols (i).data_length > 25 THEN   --дл€ коротких полей сделаем выравнивание по центру
            sTmp := sTmp || '  <td  align="left" valign="middle">' || REPLACE (REPLACE (s, '''', '&quot'), CHR (10), '<br>') || '</td>' || CHR (13);
          ELSE
            sTmp := sTmp || '  <td align="center" valign="middle">' || REPLACE (REPLACE (s, '''', '&quot'), CHR (10), '<br>') || '</td>' || CHR (13);
          END IF;
        END IF;
        IF i = nColCount THEN
          sTmp := sTmp || CHR (10) || '</tr>' || CHR (13);
        END IF;
        DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
        sTmp := '';
      END LOOP;
    ELSE   -- no more records in CID
      sTmp := sTmp || '</table>';
      DBMS_LOB.writeappend (cl, LENGTH (sTmp), sTmp);
      EXIT;
    END IF;
  END LOOP;
  dbms_lob.append (cl_real, cl);
  DBMS_SQL.close_cursor (cid);
  RETURN nID;
END;
/

SHOW ERRORS;


