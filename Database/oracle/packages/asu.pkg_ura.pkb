DROP PACKAGE BODY ASU.PKG_URA
/

--
-- PKG_URA  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_URA" 
IS
--------------------------------------------------------------------------------
-- возвращает CLOB с результатми назначени€
-- ¬ любом случае не попадет туда ѕлан ведени€ (синоним 'PRIEM_LECH_VRACH_PLAN_VED')
-- Author: Ura
-- Notes: —оздаетс€ временный блоб, по идее должен уничтожатс€ по окончании транзакции
-- есть правильна€ верси€ этой функции
  FUNCTION get_vnaz_result_error (p_vnaz_fk_id IN NUMBER)
    RETURN CLOB
  IS
    temp_lob                    CLOB;

    CURSOR smidvalues
    IS
      SELECT   tsmid.fc_name, tsmid.fk_id, tsmid.fc_type,
               DECODE (tsmid.fc_type,
                       'EDIT', get_smid_values.get_fc_char (tsmid.fk_id, p_vnaz_fk_id,
                                                            tsmid.fc_type),
                       'MEMO', get_smid_values.get_fc_char (tsmid.fk_id, p_vnaz_fk_id,
                                                            tsmid.fc_type),
                       'BIGMEMO', get_smid_values.get_fc_char (tsmid.fk_id,
                                                               p_vnaz_fk_id,
                                                               tsmid.fc_type
                                                              ),
                       'COMBOBOX', get_smidname (get_smid_values.get_cbx (tsmid.fk_id,
                                                                          p_vnaz_fk_id,
                                                                          tsmid.fc_type
                                                                         )
                                                ),
                       'NUMBER', TO_CHAR (get_smid_values.get_number (tsmid.fk_id,
                                                                      p_vnaz_fk_id,
                                                                      tsmid.fc_type
                                                                     )
                                         ),
                       'VARCHAR2', get_smid_values.get_edit (tsmid.fk_id,
                                                             p_vnaz_fk_id,
                                                             tsmid.fc_type
                                                            )
                      ) AS sm_value,
               tsmidowner.fc_name AS owner_name, tsmidowner.fk_id AS owner_fk_id,
               tsmidowner.fl_showprint, tsmid.fl_showprint
          FROM tsmid, (SELECT DISTINCT tib.fk_smeditid
                                  FROM tib
                                 WHERE tib.fk_pacid = p_vnaz_fk_id) tibsmid, tsmid tsmidowner
         WHERE tsmid.fk_id = tibsmid.fk_smeditid
           AND tsmid.fk_owner = tsmidowner.fk_id
           AND NVL (tsmid.fc_synonim, ' ') <> 'PRIEM_LECH_VRACH_PLAN_VED'
      ORDER BY tsmidowner.fn_order, tsmid.fn_order;

    v_smid_name                 VARCHAR (4000);
    v_smid_fk_id                VARCHAR (4000);
    v_smid_type                 VARCHAR (50);
    v_sm_value                  VARCHAR (4000);
    v_owner_name                VARCHAR (4000);
    v_owner_fk_id_last          INTEGER;
    v_owner_fk_id               INTEGER;
    v_fl_showprint              INTEGER;
    v_smid_name_fl_show_print   INTEGER;
  BEGIN
    DBMS_LOB.createtemporary (temp_lob, TRUE, DBMS_LOB.CALL);
    v_owner_fk_id_last := 0;

    OPEN smidvalues;

    LOOP
      FETCH smidvalues
       INTO v_smid_name, v_smid_fk_id, v_smid_type, v_sm_value, v_owner_name, v_owner_fk_id,
            v_fl_showprint, v_smid_name_fl_show_print;

      EXIT WHEN smidvalues%NOTFOUND;

      IF (v_owner_fk_id_last <> v_owner_fk_id)
      THEN
        IF (v_fl_showprint = 1)                               -- значит нужно печать заголовк формы
        THEN                                                             -- печатаем заголовк формы
          IF v_owner_fk_id_last <> 0
          THEN                              -- если это не самое начло, то вставл€ем перевод строки
            DBMS_LOB.writeappend (temp_lob, 1, CHR (10));
          END IF;

          -- теперь собственно сам заголовк формы
          DBMS_LOB.writeappend (temp_lob, LENGTH (v_owner_name), UPPER (v_owner_name));
          DBMS_LOB.writeappend (temp_lob, 1, CHR (10));
          v_owner_fk_id_last := v_owner_fk_id;
        ELSE                                                           -- ѕечатать заголовк не нужно
          -- просто вставл€ем перевод строки
          IF v_owner_fk_id_last <> 0
          THEN
            DBMS_LOB.writeappend (temp_lob, 1, CHR (10));
          END IF;
        END IF;
      END IF;                                                              -- конец печати заголовка

      -- собственно само значение
      IF v_smid_name_fl_show_print = 1
      THEN
        v_smid_name := TRIM (v_smid_name) || ': ';
        DBMS_LOB.writeappend (temp_lob, LENGTH (v_smid_name), v_smid_name);
      END IF;

      v_sm_value := REPLACE (v_sm_value, CHR (10) || '.', '.');
      --переводы перед точкой
      v_sm_value := TRIM (v_sm_value);
      DBMS_LOB.writeappend (temp_lob, LENGTH (v_sm_value), v_sm_value);

      -- точку в конце
      IF SUBSTR (v_sm_value, LENGTH (v_sm_value), 1) <> '.'
      THEN
        DBMS_LOB.writeappend (temp_lob, 2, '. ');
      ELSE
        DBMS_LOB.writeappend (temp_lob, 1, ' ');
      END IF;
    END LOOP;

    CLOSE smidvalues;

    RETURN temp_lob;
  END get_vnaz_result_error;

--------------------------------------------------------------------------------
-- ƒл€ назначени€ p_vnaz_fk_id возворащает значение элемента SMID заданного синонимом p_smid_synonym
-- ѕример использовани€:
-- select pkg_ura.get_vnaz_item_result(fk_id,'PROTHOPER_NUM') from vnaz where fk_id=:fk_id
-- Author: Ura
  FUNCTION get_vnaz_item_result (p_vnaz_fk_id IN INTEGER, p_smid_synonym IN VARCHAR2)
    RETURN VARCHAR2
  IS
    v_ret   VARCHAR2 (4000);
  BEGIN
    SELECT DECODE (tsmid.fc_type,
                   'EDIT', get_smid_values.get_fc_char (tsmid.fk_id, p_vnaz_fk_id, tsmid.fc_type),
                   'MEMO', get_smid_values.get_fc_char (tsmid.fk_id, p_vnaz_fk_id, tsmid.fc_type),
                   'BIGMEMO', get_smid_values.get_fc_char (tsmid.fk_id, p_vnaz_fk_id, tsmid.fc_type),
                   'COMBOBOX', get_smidname (get_smid_values.get_cbx (tsmid.fk_id,
                                                                      p_vnaz_fk_id,
                                                                      tsmid.fc_type
                                                                     )
                                            ),
                   'NUMBER', TO_CHAR (get_smid_values.get_number (tsmid.fk_id,
                                                                  p_vnaz_fk_id,
                                                                  tsmid.fc_type
                                                                 )
                                     ),
                   'VARCHAR2', get_smid_values.get_edit (tsmid.fk_id, p_vnaz_fk_id, tsmid.fc_type)
                  )
      INTO v_ret
      FROM tib, tsmid
     WHERE tib.fk_pacid = p_vnaz_fk_id
       AND tsmid.fc_synonim = p_smid_synonym
       AND tib.fk_smeditid = tsmid.fk_id;

    RETURN v_ret;
  EXCEPTION
    WHEN OTHERS
    THEN
      RETURN NULL;
  END get_vnaz_item_result;

--------------------------------------------------------------------------------
-- ¬озрващает занчение из TIB в виде строки
FUNCTION get_smid_value (p_fk_smid IN INTEGER, p_type IN VARCHAR, p_pacid IN INTEGER)
  RETURN VARCHAR2
IS
  v_ret   VARCHAR2 (4000);
  v_ed    VARCHAR2 (30);
BEGIN
  IF p_type = 'EDIT' OR p_type = 'MEMO' OR p_type = 'BIGMEMO'
  THEN
    v_ret := get_smid_values.get_fc_char (p_fk_smid, p_pacid, p_type);
    -- “.к. get_smid_values.get_fc_char выводит дл€ html, то теперь € произвожу обратную замену
    v_ret := REPLACE (v_ret, '&quot', '"');
  ELSIF p_type = 'COMBOBOX'
  THEN
    v_ret := get_smidname (get_smid_values.get_cbx (p_fk_smid, p_pacid, p_type));
  ELSIF p_type = 'NUMBER'
  THEN
    v_ed := get_ed_izm (p_fk_smid);
    v_ret := TO_CHAR (get_smid_values.get_number (p_fk_smid, p_pacid, p_type));

    -- нужно еще выодить единицу измерени€ -- см баг 0000055
    IF v_ed IS NOT NULL
    THEN
      v_ret := v_ret || ' ' || v_ed;
--      dbms_output.put_line(v_ret);
      RETURN v_ret;
    END IF;
  ELSIF p_type = 'VARCHAR2'
  THEN
    v_ret := get_smid_values.get_edit (p_fk_smid, p_pacid, p_type);
    v_ret := REPLACE (v_ret, '&quot', '"');

  ELSIF p_type = 'DATE'
  THEN
    v_ret := get_smid_values.get_date (p_fk_smid, p_pacid, p_type);
  END IF;

  RETURN v_ret;
END get_smid_value;

--------------------------------------------------------------------------------
-- более правильна€ верси€ get_vnaz_result1
-- возвращает CLOB с результатми назначени€
-- ¬ любом случае не попадет туда ѕлан ведени€ (синоним 'PRIEM_LECH_VRACH_PLAN_VED')
-- Author: Ura
-- Notes: —оздаетс€ временный блоб, по идее должен уничтожатс€ по окончании транзакции
FUNCTION get_vnaz_result (p_vnaz_fk_id IN NUMBER)
  RETURN CLOB
IS
  temp_lob         CLOB;
  v_smid_naz       INTEGER;
  v_smid_fk_id     INTEGER;
  v_fc_name        VARCHAR (4000);
  v_fc_type        VARCHAR (100);
  v_fl_showprint   INTEGER;
  v_item_value     VARCHAR (4000);
  v_isfirst        BOOLEAN;

  CURSOR smidvalues (p_vnaz_smid IN INTEGER)
  IS
    SELECT   smvalues.fk_id, smvalues.fc_name, smvalues.fc_type, smvalues.fl_showprint,
             pkg_ura.get_smid_value (smvalues.fk_id, smvalues.fc_type, p_vnaz_fk_id) AS item_value
        FROM (SELECT DISTINCT tsmid.fk_id, tsmid.fc_name, tsmid.fc_type, tsmid.fl_showprint
                         FROM tsmid
                        WHERE fl_del IS NOT NULL
                          AND fl_del = 0
                          AND NVL (tsmid.fc_synonim, ' ') <> 'PRIEM_LECH_VRACH_PLAN_VED'
                   CONNECT BY fk_id = PRIOR fk_owner
                   START WITH fk_id IN (SELECT DISTINCT tib.fk_smeditid
                                                   FROM tib
                                                  WHERE tib.fk_pacid = p_vnaz_fk_id)) smvalues,
             (SELECT     fk_id,
                         pkg_hierarchy.branch (LEVEL, TO_CHAR (fn_order, '00000000'), '\') charsort
                    FROM tsmid
                   WHERE fc_type IS NOT NULL AND fl_del IS NOT NULL AND fl_del = 0
              CONNECT BY PRIOR fk_id = fk_owner
              START WITH fk_owner = p_vnaz_smid) smsort
       WHERE smvalues.fk_id = smsort.fk_id
    ORDER BY charsort;
BEGIN
  DBMS_LOB.createtemporary (temp_lob, TRUE, DBMS_LOB.CALL);

  -- получим занчение SMID из vnaz
  -- 2005.12.14  ћазунин описал ситуацию при которой он переадет vres.vnaz_fk_id
  -- который ссылаетс€ на несуществубщий vnaz.fk_id в итоге ошибка noDatafount
  -- елси бы соблюдалась бы целостность данных такой ошибки быть не должно
  SELECT fk_smid
    INTO v_smid_naz
    FROM vnaz
   WHERE fk_id = p_vnaz_fk_id;

  OPEN smidvalues (v_smid_naz);

  v_isfirst := TRUE;                         -- это дл€ того чтобы не печатать впереди перево строки

  LOOP
    FETCH smidvalues
     INTO v_smid_fk_id, v_fc_name, v_fc_type, v_fl_showprint, v_item_value;

    EXIT WHEN smidvalues%NOTFOUND;

    IF v_fc_type = 'FORM'                                            -- дл€ форм печатаем заголовки
    THEN
      IF NOT v_isfirst                     -- если это не самое начало, то вставл€ем перевод строки
      THEN
        DBMS_LOB.writeappend (temp_lob, 1, CHR (10));
      END IF;

      v_isfirst := FALSE;

      IF v_fl_showprint = 1
      THEN
        DBMS_LOB.writeappend (temp_lob, LENGTH (v_fc_name), UPPER (v_fc_name));
        DBMS_LOB.writeappend (temp_lob, 1, CHR (10));
      -- dbms_output.put_line(v_fc_name);
      END IF;
    ELSE                                                                             -- это значение
      --
      IF v_fl_showprint = 1
      THEN                                                                    -- заголовок значени€
        v_fc_name := TRIM (v_fc_name) || ': ';
        DBMS_LOB.writeappend (temp_lob, LENGTH (v_fc_name), v_fc_name);
      END IF;

      -- а теперь само значение
      v_item_value := REPLACE (v_item_value, CHR (10) || '.', '.');
      --переводы перед точкой
      v_item_value := TRIM (v_item_value);
      DBMS_LOB.writeappend (temp_lob, LENGTH (v_item_value), v_item_value);

      -- точку в конце
      IF SUBSTR (v_item_value, LENGTH (v_item_value), 1) <> '.'
      THEN
        DBMS_LOB.writeappend (temp_lob, 2, '. ');
      ELSE
        DBMS_LOB.writeappend (temp_lob, 1, ' ');
      END IF;
    --
    END IF;
  END LOOP;

  CLOSE smidvalues;

  RETURN temp_lob;

  EXCEPTION
  WHEN others THEN -- caution handles all exceptions
    RETURN temp_lob; -- обработчик который глушит ошибки см комментарий вначале поста

  
END get_vnaz_result;
--------------------------------------------------------------------------------
FUNCTION get_path_delim (p_fk_smid IN INTEGER, p_delim  In Char)
  RETURN VARCHAR
AS
  v_res    VARCHAR (4000);
  v_name   VARCHAR (4000);

  CURSOR c1
  IS
    SELECT     fc_name
          FROM tsmid
--         WHERE fk_owner <> 0
    START WITH fk_id = p_fk_smid
    CONNECT BY PRIOR fk_owner = fk_id
    ORDER BY ROWNUM DESC;
BEGIN
  OPEN c1;
  FETCH c1 INTO v_name;
  IF c1%FOUND THEN
    v_res :=  v_name ;
  END IF;

  LOOP
    FETCH c1 INTO v_name;
    EXIT WHEN c1%NOTFOUND;
    v_res := v_res || p_delim || v_name;
  END LOOP;

  CLOSE c1;

  RETURN v_res;
END get_path_delim;



END pkg_ura;
/

SHOW ERRORS;


