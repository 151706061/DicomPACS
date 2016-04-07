DROP PACKAGE BODY ASU.PKG_CORE
/

--
-- PKG_CORE  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_CORE" 
IS
--------------------------------------------------------------------------------
-- Возвращает 0 если этого права нет
-- >0 если это право есть
-- Author : Ura
  FUNCTION testright (p_id_sotr IN INTEGER, p_id_right IN INTEGER)
    RETURN INTEGER
  IS
    v_ret   INTEGER;
  BEGIN
    SELECT COUNT (*)
      INTO v_ret
      FROM (SELECT DISTINCT rg.fk_right, r.fc_name AS "Право", 'Группа ' || g.fc_name AS "Причина"
                       FROM tuser_groups g, tsotr_user_groups ug, trights_groups rg, trights r
                      WHERE ug.fk_sotr = p_id_sotr
                        AND ug.fk_user_groups = g.fk_id
                        AND rg.fk_user_group = g.fk_id
                        AND rg.fn_allow = 1
                        AND r.fk_id = rg.fk_right
                        AND rg.fk_right NOT IN (
                              SELECT rg.fk_right
                                FROM tuser_groups g, tsotr_user_groups ug, trights_groups rg
                               WHERE ug.fk_sotr = p_id_sotr
                                 AND ug.fk_user_groups = g.fk_id
                                 AND rg.fk_user_group = g.fk_id
                                 AND rg.fn_allow = 0)                            --) "Права с групп"
            UNION
            SELECT                                                             -- Права пользователя
                   r.fk_id AS fk_right, r.fc_name AS "Право", 'Прямое право' AS "Причина"
              FROM trights_user ru, trights r
             WHERE ru.fk_sotr = p_id_sotr AND ru.fn_allow = 1 AND r.fk_id = ru.fk_right) aa
     WHERE aa.fk_right NOT IN (SELECT                              -- Права пользователя Запрешенные
                                      ru.fk_right
                                 FROM trights_user ru
                                WHERE ru.fk_sotr = p_id_sotr AND ru.fn_allow = 0)
       AND aa.fk_right = p_id_right;

    RETURN v_ret;
  END testright;                                                                                   --

--------------------------------------------------------------------------------

  -- Возвращает значение константы по ее имени
-- Author : Ura
  FUNCTION get_constbyname (p_name IN VARCHAR)
    RETURN NUMBER
  IS
    v_ret   INTEGER;
  BEGIN
    SELECT fn_const
      INTO v_ret
      FROM tconst
     WHERE fc_func = p_name;

    RETURN v_ret;
  EXCEPTION
    WHEN OTHERS
    THEN                                                          -- Caution: Handles all exceptions
      raise_application_error
              (-20005,
               'Проблема в PKG_CORE.Get_CONSTBYNAME. Возможно неправильно заполнена таблица TCONST'
              );
  END get_constbyname;

--------------------------------------------------------------------------------
--  Ищет в таблице TCONST запись по p_func
-- и если не находи, то добавляет соответсвующую запись
  PROCEDURE tconst_checkrecorddefault (p_const IN INTEGER, p_name IN VARCHAR2, p_func IN VARCHAR2)
  IS
    v_t   INTEGER;
  BEGIN
    SELECT COUNT (a.fk_id)
      INTO v_t
      FROM tconst a
     WHERE a.fc_func = p_func;

    IF v_t = 0
    THEN
      INSERT      /*+ NOPARALLEL(TCONST, ) */INTO tconst
                  (fc_name, fc_func, fn_const
                  )
           VALUES (p_name, p_func, p_const
                  );
    END IF;
  END tconst_checkrecorddefault;

--------------------------------------------------------------------------------
-- Добавляет в таблицу TConst настройки для разделов по умолчанию
  PROCEDURE set_defaultrazdels
  IS
  BEGIN
    tconst_checkrecorddefault (1360, 'Раздел процедур в TSMID', 'RAZDEL_PROC');
    tconst_checkrecorddefault (1321, 'Раздел Аланлизов в TSMID', 'RAZDEL_ANAL');
    tconst_checkrecorddefault (1324, 'Раздел консультаций в TSMID', 'RAZDEL_KONS');
    tconst_checkrecorddefault (1323, 'Раздел Исследований в TSMID', 'RAZDEL_ISSLED');
  END set_defaultrazdels;

--------------------------------------------------------------------------------
-- записывает в TIB занчение
  PROCEDURE write_tib_val (p_fk_pacid IN INTEGER, p_fk_smeditid IN INTEGER, p_val IN INTEGER)
  AS
    v_tib   INTEGER;
  BEGIN
    SELECT COUNT (fk_id)
      INTO v_tib
      FROM tib
     WHERE fk_pacid = p_fk_pacid AND fk_smeditid = p_fk_smeditid;

    IF v_tib = 0
    THEN
      INSERT INTO tib
                  (fk_pacid, fk_smeditid, fk_smid
                  )
           VALUES (p_fk_pacid, p_fk_smeditid, p_val
                  );
    ELSE
      UPDATE tib
         SET fk_smid = p_val
       WHERE fk_pacid = p_fk_pacid AND fk_smeditid = p_fk_smeditid;
    END IF;
  END write_tib_val;

--------------------------------------------------------------------------------
--записывает в TIB занчение для текстовых полей
  PROCEDURE write_tib_val_text (
    p_fk_pacid      IN   INTEGER,
    p_fk_smeditid   IN   INTEGER,
    p_val           IN   VARCHAR2,
    p_fk_sotr       IN   INTEGER
  )
  AS
    v_tib   INTEGER;
  BEGIN
    SELECT COUNT (fk_id)
      INTO v_tib
      FROM tib
     WHERE fk_pacid = p_fk_pacid AND fk_smeditid = p_fk_smeditid;

    IF v_tib = 0
    THEN
      INSERT INTO tib
                  (fk_pacid, fk_smeditid, fk_smid, fc_char, fk_vrachid
                  )
           VALUES (p_fk_pacid, p_fk_smeditid, p_fk_smeditid, p_val, p_fk_sotr
                  );
    ELSE
      UPDATE tib
         SET fc_char = p_val,
             fk_vrachid = p_fk_sotr
       WHERE fk_pacid = p_fk_pacid AND fk_smeditid = p_fk_smeditid;
    END IF;
  END write_tib_val_text;

--------------------------------------------------------------------------------
-- записывает в TIB значение типа ДАТА
  PROCEDURE write_tib_val_date (
    p_fk_pacid      IN   INTEGER,
    p_fk_smeditid   IN   INTEGER,
    p_val           IN   DATE,
    p_fk_sotr       IN   INTEGER
  )
  AS
    v_tib   INTEGER;
  BEGIN
    SELECT COUNT (fk_id)
      INTO v_tib
      FROM tib
     WHERE fk_pacid = p_fk_pacid AND fk_smeditid = p_fk_smeditid;

    IF v_tib = 0
    THEN
      INSERT INTO tib
                  (fk_pacid, fk_smeditid, fk_smid, fd_date, fk_vrachid
                  )
           VALUES (p_fk_pacid, p_fk_smeditid, p_fk_smeditid, p_val, p_fk_sotr
                  );
    ELSE
      UPDATE tib
         SET fd_date = p_val,
             fk_vrachid = p_fk_sotr
       WHERE fk_pacid = p_fk_pacid AND fk_smeditid = p_fk_smeditid;
    END IF;


    NULL;
  END write_tib_val_date;

--------------------------------------------------------------------------------
-- записывает в TIB занчение, аналог первого , но с доп параметром
  PROCEDURE write_tib_val_num (
    p_fk_pacid      IN   INTEGER,
    p_fk_smeditid   IN   INTEGER,
    p_fk_sotr       IN   INTEGER,
    p_fn_num        IN   NUMBER
  )
  AS
    v_tib   INTEGER;
  BEGIN
    SELECT COUNT (fk_id)
      INTO v_tib
      FROM tib
     WHERE fk_pacid = p_fk_pacid AND fk_smeditid = p_fk_smeditid;

    IF v_tib = 0
    THEN
      INSERT INTO tib
                  (fk_pacid, fk_smeditid, fk_smid, fn_num, fk_vrachid
                  )
           VALUES (p_fk_pacid, p_fk_smeditid, p_fk_smeditid, p_fn_num, p_fk_sotr
                  );
    ELSE
      UPDATE tib
         SET fn_num = p_fn_num,
             fk_vrachid = p_fk_sotr
       WHERE fk_pacid = p_fk_pacid AND fk_smeditid = p_fk_smeditid;
    END IF;
  END write_tib_val_num;

--------------------------------------------------------------------------------
-- записывает в TIB занчение
-- в отличии от предыдущей версии, сохранет еще ссылку на врача
-- и применяется для Varchar, для combobox использовать предыдущую функцию
  PROCEDURE write_tib_val1 (
    p_fk_pacid      IN   INTEGER,
    p_fk_smeditid   IN   INTEGER,
    p_val           IN   INTEGER,
    p_fk_sotr       IN   INTEGER
  )
  AS
    v_tib   INTEGER;
  BEGIN
    SELECT COUNT (fk_id)
      INTO v_tib
      FROM tib
     WHERE fk_pacid = p_fk_pacid AND fk_smeditid = p_fk_smeditid AND fk_smid = p_val;

    IF v_tib = 0
    THEN
      INSERT INTO tib
                  (fk_pacid, fk_smeditid, fk_smid, fk_vrachid
                  )
           VALUES (p_fk_pacid, p_fk_smeditid, p_val, p_fk_sotr
                  );
    ELSE
      UPDATE tib
         SET fk_vrachid = p_fk_sotr
       WHERE fk_pacid = p_fk_pacid AND fk_smeditid = p_fk_smeditid AND fk_smid = p_val;
    END IF;
  END write_tib_val1;
--------------------------------------------------------------------------------
END;
/

SHOW ERRORS;


