DROP PROCEDURE ASU.DO_ALLHTMLDIAGLST
/

--
-- DO_ALLHTMLDIAGLST  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_LOB (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--   TCLOBS (Table)
--   VPRINTDYNAMINFORM (View)
--   GET_DIAGID (Function)
--   GET_FULLPATH (Function)
--   GET_GROUPDIAGID (Function)
--   GET_HTMLDIAGLST (Function)
--   GET_ISSLEDID (Function)
--   GET_KONSID (Function)
--   GET_PROCID (Function)
--   INC (Procedure)
--
CREATE OR REPLACE PROCEDURE ASU."DO_ALLHTMLDIAGLST" 
IS
  TYPE number_table IS TABLE OF NUMBER
    INDEX BY BINARY_INTEGER;

  CURSOR c
  IS
    SELECT get_fullpath (fk_id) FC_NAME, FK_ID
      FROM (SELECT fk_id, fn_order
              FROM tsmid
             WHERE NOT EXISTS (SELECT fk_id
                                 FROM tsmid ts
                                WHERE ts.fk_owner = tsmid.fk_id)
             START WITH fk_id = get_groupdiagid
            CONNECT BY PRIOR fk_id = fk_owner) q1
     WHERE EXISTS (SELECT fk_id
                     FROM tsmid
                    WHERE fk_default = q1.fk_id
                      AND fk_owner = get_diagid)
     ORDER BY fn_order;

  CURSOR cNaz (pFK_OWNER IN NUMBER)
  IS
    SELECT/*+index_asc (tsmid tsmid_by_owner_order)*/
       get_fullpath (fk_id) AS fc_name, fk_id
      FROM tsmid ts
     WHERE fl_showanal = 1
       AND NOT EXISTS (SELECT fk_id
                         FROM tsmid
                        WHERE fk_owner = ts.fk_id
                          AND fl_showanal = 1)
     START WITH fk_id = pFK_OWNER
    CONNECT BY PRIOR fk_id = fk_owner;

  CURSOR cDynForms
  IS
    SELECT fc_name
      FROM vprintdynaminform;

  CURSOR cRazdelForm (pFK_OWNER IN NUMBER)
  IS
SELECT/*+index_asc (tsmid tsmid_by_owner_type)*/
         LPAD (' ', (LEVEL - 1) * 3) || fc_name ||
         DECODE (fc_type,
           'VARCHAR2', '(множественный выбор)',
           'NUMBER', '(число)',
           'COMBOBOX', '(выбор одного варианта)',
           'FORM', '(окно)',
           'DATE', '(дата)',
           NULL, '(вариант ответа)',
           '(поле ввода)'
         ) AS fc_name
      FROM tsmid
     START WITH fk_owner = pFK_OWNER
    CONNECT BY PRIOR fk_id = fk_owner;

  nID     NUMBER;
  nIDs    number_table;
  j       NUMBER           := 0;
  clAll   CLOB;
  clTmp   CLOB;
  sTmp    VARCHAR2 (32767);
BEGIN
  FOR i IN c LOOP
    nIDs (j)  := GET_HTMLDIAGLST (i.fk_id);
    inc (j);
  END LOOP;
  DBMS_LOB.CREATETEMPORARY (clAll, TRUE, 2);
  sTmp  := '<html><head><title>Список диагнозов по группам</title>' || '<meta http-equiv="Content-Type" content="text/html; charset=windows-1251"></head>' || '<body bgcolor="#FFFFFF">';
  sTmp  := sTmp || '<h1>Диагнозы<h1>';
  DBMS_LOB.writeappend (clAll, LENGTH (sTmp), sTmp);
  FOR i IN 0 .. j - 1 LOOP
    SELECT fc_clob
      INTO clTmp
      FROM tclobs
     WHERE fk_id = nIDs (i);
    DBMS_LOB.append (clAll, clTmp);
  END LOOP;
  FOR i IN cDynForms LOOP
    sTmp  := '<pre>' || i.fc_name || '</pre>';
    DBMS_LOB.writeappend (clAll, LENGTH (sTmp), sTmp);
  END LOOP;
  ---
  sTmp  := '<h1>Процедуры</h1>';
  FOR i IN cNaz (get_procid) LOOP
    sTmp  := '<h3>'||i.fc_name||'</h3>';
    DBMS_LOB.writeappend (clAll, LENGTH (sTmp), sTmp);
    FOR j IN cRazdelForm (i.fk_id) LOOP
      sTmp  := '<pre>' || j.fc_name || '</pre>';
      DBMS_LOB.writeappend (clAll, LENGTH (sTmp), sTmp);
    END LOOP;
  END LOOP;
  ---
  sTmp  := '<h1>Исследования</h1>';
  FOR i IN cNaz (get_issledid) LOOP
    sTmp  := '<h3>'||i.fc_name||'</h3>';
    DBMS_LOB.writeappend (clAll, LENGTH (sTmp), sTmp);
    FOR j IN cRazdelForm (i.fk_id) LOOP
      sTmp  := '<pre>' || j.fc_name || '</pre>';
      DBMS_LOB.writeappend (clAll, LENGTH (sTmp), sTmp);
    END LOOP;
  END LOOP;
  ---
  sTmp  := '<h1>Консультации</h1>';
  FOR i IN cNaz (get_konsid) LOOP
    sTmp  := '<h3>'||i.fc_name||'</h3>';
    DBMS_LOB.writeappend (clAll, LENGTH (sTmp), sTmp);
    FOR j IN cRazdelForm (i.fk_id) LOOP
      sTmp  := '<pre>' || j.fc_name || '</pre>';
      DBMS_LOB.writeappend (clAll, LENGTH (sTmp), sTmp);
    END LOOP;
  END LOOP;
  ------ end
  sTmp  := '</html></body>';
  DBMS_LOB.writeappend (clAll, LENGTH (sTmp), sTmp);

  INSERT INTO tclobs
              (fk_id, fc_clob)
       VALUES (-1, clAll);

  COMMIT;
END;
/

SHOW ERRORS;


