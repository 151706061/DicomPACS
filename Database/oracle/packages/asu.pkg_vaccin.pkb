DROP PACKAGE BODY ASU.PKG_VACCIN
/

--
-- PKG_VACCIN  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_VACCIN" 
IS

/** Проверка */
-- Пакет для Вакцинации
-- Author: Ura
-- пакет нуждается в полной переаботке, на ASU2 будут правильно работатать функции относящиеся к складу
-- И то нужно проверять
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Предназначена для групповых операций, выполняемых над пациентами.
-------------------------------------------------------------------------------
  TYPE GROUP_ACTIONS_COLLECTION_TYPE IS TABLE OF NUMBER
      INDEX BY BINARY_INTEGER;

  v_peoples_collection GROUP_ACTIONS_COLLECTION_TYPE;

-------------------------------------------------------------------------------
-- Для использования внутри триггера
-------------------------------------------------------------------------------
  TYPE RESTORE_VAC_PLAN_RECORD_TYPE IS RECORD (
      fk_people    NUMBER,
      fk_infection NUMBER,
      fn_kratn     NUMBER);

  TYPE RESTORE_VAC_PLAN_TABLE_TYPE IS TABLE OF RESTORE_VAC_PLAN_RECORD_TYPE
      INDEX BY BINARY_INTEGER;

  v_restore_vac_plan_table RESTORE_VAC_PLAN_TABLE_TYPE;

------------------------------------------------------------------------------
-- Предназначена для добавления в коллекцию удаляемых fk_id прививок.
------------------------------------------------------------------------------

  PROCEDURE ADD_VAC_PLAN_COLLECTION(
    p_fk_id IN NUMBER
  )
  IS
    v_new_record RESTORE_VAC_PLAN_RECORD_TYPE;

  BEGIN
    FOR cur_restore IN (SELECT tvac_people.fk_people, tvac_kratn.fk_infection,
                               tvac_kratn.fn_kratn
                          FROM tvac_people, tvac_kratn
                         WHERE tvac_people.fk_id = tvac_kratn.fk_vac_people
                           AND tvac_people.fk_id = p_fk_id) LOOP

      v_new_record.fk_people    := cur_restore.fk_people;
      v_new_record.fk_infection := cur_restore.fk_infection;
      v_new_record.fn_kratn     := cur_restore.fn_kratn;

      v_restore_vac_plan_table(
          NVL(v_restore_vac_plan_table.LAST, 0) + 1) := v_new_record;
    END LOOP;
  END ADD_VAC_PLAN_COLLECTION;

------------------------------------------------------------------------------
-- Предназначена для инициализации коллекции, содержащей fk_id прививок.
------------------------------------------------------------------------------

  PROCEDURE INIT_VAC_PLAN_COLLECTION
  AS
  BEGIN

    v_restore_vac_plan_table.delete;

  END INIT_VAC_PLAN_COLLECTION;

------------------------------------------------------------------------------
-- Предназначена для запуска процедуры востановления индивидуального плана,
-- в зависимости от удаленных прививок.
------------------------------------------------------------------------------

  PROCEDURE RESTORE_VAC_PLAN_COLLECTION
  IS
    v_pos    INTEGER;
    v_fk_id  NUMBER;
    v_record RESTORE_VAC_PLAN_RECORD_TYPE;

  BEGIN
    v_pos := v_restore_vac_plan_table.FIRST;
    LOOP
      EXIT WHEN v_pos IS NULL;

      v_record := v_restore_vac_plan_table(v_pos); PKG_VACCIN.RESTORE_PRIVATE_PLAN(
          v_record.fk_people, v_record.fk_infection, v_record.fn_kratn);


      v_pos := v_restore_vac_plan_table.NEXT(v_pos);
    END LOOP;
  END RESTORE_VAC_PLAN_COLLECTION;

------------------------------------------------------------------------------
-- Предназначены для управления v_peoples_collection
------------------------------------------------------------------------------

  PROCEDURE ADD_PEOPLE_FOR_GROUP_ACTIONS(
    p_fk_id IN NUMBER
  )
  AS
  BEGIN

    v_peoples_collection(
        NVL(v_peoples_collection.LAST, 0) + 1) := p_fk_id;

  END ADD_PEOPLE_FOR_GROUP_ACTIONS;


  PROCEDURE INIT_GROUP_ACTIONS_COLLECTION
  AS
  BEGIN

    v_peoples_collection.delete;

  END INIT_GROUP_ACTIONS_COLLECTION;


  PROCEDURE storetransaction (
    p_fk_store         IN   INTEGER,
    p_fk_vaccin_prep   IN   INTEGER,
    p_fc_series        IN   VARCHAR,
    p_fn               IN   NUMBER,
    p_type             IN   INTEGER,
    p_fd_fitness       IN   DATE,
    p_fk_sotr          IN   INTEGER,
    p_fd_create        IN   DATE,
    p_fc_rem           IN   VARCHAR2
  )
  IS
    v_fk_prep_store   INTEGER;

    CURSOR vps
    IS
      SELECT fk_id, tvaccin_prep_store.fn_remainder
        FROM tvaccin_prep_store
       WHERE fk_vaccin_prep = p_fk_vaccin_prep AND fc_series = p_fc_series
             AND fk_store = p_fk_store;

    rec               vps%ROWTYPE;
    v_old             NUMBER (16, 3);                                   -- было на складе препарата
    v_new             NUMBER (16, 3);                                            -- стало на складе
  BEGIN
    OPEN vps;

    FETCH vps
     INTO rec;
    -- TODO передалать на NOT EXISTS
    IF vps%NOTFOUND
    THEN
      IF p_type <> 1
      THEN
        RETURN;
      -- Невозможная операция, на складе не такогкой серии, поэтому возможен только приход
      END IF;

      v_old := 0;                                                   -- не было на складе такой серии

      INSERT INTO tvaccin_prep_store
                  (fk_vaccin_prep, fc_series, fd_fitness, fn_remainder, fk_store
                  )
           VALUES (p_fk_vaccin_prep, p_fc_series, p_fd_fitness, p_fn, p_fk_store
                  )
        RETURNING fk_id
             INTO v_fk_prep_store;

      v_new := p_fn;                                                              -- стало на складе
    ELSE
      v_fk_prep_store := rec.fk_id;                               -- запись есть нужно узнать FK_ID
      v_old := rec.fn_remainder;                                                  -- было на складе

      IF p_type = 1
      THEN
        v_new := rec.fn_remainder + p_fn;                                        -- стало на складе

        UPDATE tvaccin_prep_store
           SET fn_remainder = v_new
         WHERE fk_id = rec.fk_id;
      ELSIF p_type IN (2, 3, 4)
      THEN
        -- а еще здесь можно проверку на количество списываемого
        v_new := rec.fn_remainder - p_fn;                                        -- стало на складе

        UPDATE tvaccin_prep_store
           SET fn_remainder = v_new
         WHERE fk_id = rec.fk_id;
      END IF;
    END IF;

--а теперь записать в лог
    INSERT INTO tvaccin_prep_store_log
                (fk_vaccin_prep_store, fd, fn_type, fn_num, fk_sotr, fc_rem, fn_old, fn_new
                )
         VALUES (v_fk_prep_store, SYSDATE, p_type, p_fn, p_fk_sotr, p_fc_rem, v_old, v_new
                );

    CLOSE vps;
  END storetransaction;

--------------------------------------------------------------------------------
-- Выолняется для уже существующей записи вакцины на складе
  PROCEDURE storetransaction (
    p_fk_prep_store   IN   INTEGER,                                            -- препарат на складе
    p_fn              IN   NUMBER,                                                     -- количество
    p_type            IN   INTEGER,                                                  -- тип операции
    p_fk_sotr         IN   INTEGER,
    p_fd_create       IN   DATE,                                                    -- дата операции
    p_fc_rem          IN   VARCHAR2
--1- приход; 2-расход; 3-прививка; 4- Списано; 5- Перемещение на другойй склад
  )
  IS
    CURSOR vps
    IS
      SELECT fk_id, tvaccin_prep_store.fn_remainder
        FROM tvaccin_prep_store
       WHERE fk_id = p_fk_prep_store;

    rec     vps%ROWTYPE;
    v_old   NUMBER (16, 3);                                             -- было на складе препарата
    v_new   NUMBER (16, 3);                                                      -- стало на складе
  BEGIN
    OPEN vps;

    FETCH vps
     INTO rec;

    IF vps%NOTFOUND
    THEN
      -- нет такой записи на складе - это ошибка
      raise_application_error (-21000, 'Нет препарата на складе');
      CLOSE vps;
      RETURN;
    END IF;

    CLOSE vps;

    v_old := rec.fn_remainder;

    IF p_type = 1
    THEN
      v_new := rec.fn_remainder + p_fn;

      UPDATE tvaccin_prep_store
         SET fn_remainder = v_new
       WHERE fk_id = rec.fk_id;
    ELSIF p_type IN (2, 3, 4)
    THEN
      -- а еще здесь можно проверку на количество списываемого
      IF p_fn > rec.fn_remainder
      THEN
        raise_application_error (-21001, 'Недостаточно количества препарата');
        RETURN;
      END IF;

      v_new := rec.fn_remainder - p_fn;

      UPDATE tvaccin_prep_store
         SET fn_remainder = v_new
       WHERE fk_id = rec.fk_id;
    END IF;

--а теперь записать в лог
    INSERT INTO tvaccin_prep_store_log
                (fk_vaccin_prep_store, fd, fn_type, fn_num, fk_sotr, fc_rem, fn_old, fn_new
                )
         VALUES (p_fk_prep_store, p_fd_create, p_type, p_fn, p_fk_sotr, p_fc_rem, v_old, v_new
                );
  END;                                                                          --storetransaction 2

--------------------------------------------------------------------------------
/*
-- удаляет информацию об иммунитете вместе с информацией о вакцинации
  PROCEDURE del_immun (p_fk_immunity IN INTEGER)
  IS
    CURSOR c_vacin
    IS
      (SELECT DISTINCT tvaccin_peoples.fk_id
                  FROM tvaccin_people_immun, tvaccin_peoples
                 WHERE tvaccin_people_immun.fk_immunity = p_fk_immunity
                   AND tvaccin_peoples.fk_id = tvaccin_people_immun.fk_vaccin_peoples);

    v_fk_id   INTEGER;
  BEGIN
    OPEN c_vacin;

    DELETE FROM tvaccin_people_immun
          WHERE tvaccin_people_immun.fk_immunity = p_fk_immunity;

    LOOP
      FETCH c_vacin
       INTO v_fk_id;

      EXIT WHEN c_vacin%NOTFOUND;

      -- удаляем информацию о вакцинах
      DELETE FROM tvaccin_peoples
            WHERE fk_id = v_fk_id;
    END LOOP;

    CLOSE c_vacin;

    DELETE FROM timmunity_peoples
          WHERE fk_id = p_fk_immunity;
  END del_immun;
*/
--------------------------------------------------------------------------------
  FUNCTION get_sumvaccinbyoperation (
    p_fk_store   IN   INTEGER,
    p_fn_type    IN   INTEGER,
    p_fd_beg     IN   DATE,
    p_fd_end     IN   DATE,
    p_fk_prep    IN   INTEGER
  )
    RETURN NUMBER
  AS
    v_ret   NUMBER;

    CURSOR c_sum
    IS
      (SELECT SUM (fn_num)
         FROM tvaccin_prep_store_log, tvaccin_prep_store
        WHERE tvaccin_prep_store_log.fk_vaccin_prep_store = tvaccin_prep_store.fk_id
          AND tvaccin_prep_store.fk_store = p_fk_store
          AND tvaccin_prep_store_log.fn_type = p_fn_type
          AND tvaccin_prep_store_log.fd >= p_fd_beg
          AND fd < p_fd_end
          AND tvaccin_prep_store.fk_vaccin_prep = p_fk_prep);
  BEGIN
    OPEN c_sum;

    FETCH c_sum
     INTO v_ret;

    IF c_sum%NOTFOUND
    THEN
      v_ret := 0;
    END IF;

    IF v_ret IS NULL
    THEN
      v_ret := 0;
    END IF;

    CLOSE c_sum;

    RETURN v_ret;
  END get_sumvaccinbyoperation;

--------------------------------------------------------------------------------
-- Получает остаток на определенную дату
FUNCTION get_reminderondate (p_fk_store IN INTEGER, p_fk_prep IN INTEGER, p_fd IN DATE)
  RETURN NUMBER
AS
  CURSOR c_remind
  IS
    (SELECT Sum(tvaccin_prep_store.fn_remainder)
       FROM tvaccin_prep_store
      WHERE tvaccin_prep_store.fk_vaccin_prep = p_fk_prep
        AND tvaccin_prep_store.fk_store = p_fk_store);

  v_ret   NUMBER;
BEGIN
  OPEN c_remind;

  FETCH c_remind
   INTO v_ret;

  IF v_ret IS NULL
  THEN
    v_ret := 0;
  END IF;

  CLOSE c_remind;

  -- Обдумать число 100 !
  v_ret := v_ret - get_sumvaccinbyoperation (p_fk_store, 1, p_fd, SYSDATE+100, p_fk_prep);
  v_ret := v_ret + get_sumvaccinbyoperation (p_fk_store, 2, p_fd, SYSDATE+100, p_fk_prep);
  v_ret := v_ret + get_sumvaccinbyoperation (p_fk_store, 3, p_fd, SYSDATE+100, p_fk_prep);
  v_ret := v_ret + get_sumvaccinbyoperation (p_fk_store, 4, p_fd, SYSDATE+100, p_fk_prep);
  RETURN v_ret;
END get_reminderondate;
--------------------------------------------------------------------------------
PROCEDURE cancel_store_transaction (p_fk_id_tvaccin_prep_store_log IN INTEGER)
AS
  CURSOR c_log
  IS
    (SELECT tvaccin_prep_store_log.fk_vaccin_prep_store, tvaccin_prep_store_log.fn_type,
            tvaccin_prep_store_log.fn_num
       FROM tvaccin_prep_store_log
      WHERE tvaccin_prep_store_log.fk_id = p_fk_id_tvaccin_prep_store_log);

  v_rec    c_log%ROWTYPE;
  v_diff   NUMBER;
BEGIN
  OPEN c_log;

  FETCH c_log
   INTO v_rec;

  IF c_log%NOTFOUND
  THEN
    RETURN;                                                      -- Тут по хорошему ошибку выдавать
  END IF;

  IF v_rec.fn_type = 1
  THEN
    v_diff := 0 - v_rec.fn_num;
  ELSE
    v_diff := v_rec.fn_num;
  END IF;

  DELETE FROM tvaccin_prep_store_log
        WHERE fk_id = p_fk_id_tvaccin_prep_store_log;

  UPDATE tvaccin_prep_store
     SET fn_remainder = fn_remainder + v_diff
   WHERE tvaccin_prep_store.fk_id = v_rec.fk_vaccin_prep_store;

  CLOSE c_log;

  NULL;
END cancel_store_transaction;
--------------------------------------------------------------------------------

FUNCTION add_inject_nostore (
   p_fk_people        IN   INTEGER,
   p_fk_vaccin_prep   IN   INTEGER,                                            -- препарат
   p_series           IN   VARCHAR,                                               -- серия
   p_num              IN   NUMBER,                                                -- номер
   p_date             IN   DATE,                                                   -- дата
   p_vrach_fio        IN   VARCHAR,
   -- врач назначивший,  текст, актулаьно если вносим станые данные о вакцинации
   p_fk_vrach         IN   INTEGER,
   p_sotr_fio         IN   VARCHAR,                -- ФИО сотрудника сделавшего вакцинацию
   p_fk_sotr          IN   VARCHAR,                 -- сотрудник, который делал вакцинацию
   p_fk_lpy           IN   INTEGER,                -- ссылка в каком ЛПУ делали вакцинацию
   p_lpy              IN   VARCHAR,
   -- НАЗВАНИЕ ЛПУ,  авктуально если совсем в сотороннем ЛПУ была проведена инъекция
   p_status           IN   INTEGER,                                              -- статус
   p_fn_kratn         IN   INTEGER,                                           -- кратность
   p_fk_input_type    IN   INTEGER,                                    --   Способ введиня
   p_fk_otdel         IN   INTEGER                                            -- отеделние
)
   RETURN INTEGER
AS
   v_fk_vac_unit   INTEGER;
   v_vacn_name     VARCHAR (150);
   v_ret           INTEGER;
BEGIN
-- TODO делать проверку на минимально допустимый срок
-- TODO изменение статуса на вакцину изменять статус у всей серии
--Находим единицу измерения
   SELECT fk_unit, fc_name
     INTO v_fk_vac_unit, v_vacn_name
     FROM tvaccin_prep
    WHERE fk_id = p_fk_vaccin_prep;

   INSERT INTO tvac_people
               (fk_people, fd_create, fn_num, fc_series, fk_unit, fn_status,
                fc_organization, fc_vrach_fio, fk_vrach, fk_sotr, fc_sotr_fio,
                fk_vaccin_prep, fc_vaccin_name, fn_status_series, fk_lpy, fk_input_type,
                fk_otdel
               )
        VALUES (p_fk_people, p_date, p_num, p_series, v_fk_vac_unit, p_status,
                p_lpy, p_vrach_fio, p_fk_vrach, p_fk_sotr, p_sotr_fio,
                p_fk_vaccin_prep, v_vacn_name, p_status, p_fk_lpy, p_fk_input_type,
                p_fk_otdel
               )
     RETURNING fk_id
          INTO v_ret;

   RETURN v_ret;
END add_inject_nostore;

--------------------------------------------------------------------------------
PROCEDURE edit_inject_nostore (
   p_fk_id            IN   INTEGER,
   p_fk_people        IN   INTEGER,
   p_fk_vaccin_prep   IN   INTEGER,                                            -- препарат
   p_series           IN   VARCHAR,                                               -- серия
   p_num              IN   NUMBER,                                                -- номер
   p_date             IN   DATE,                                                   -- дата
   p_vrach_fio        IN   VARCHAR,
   -- врач назначивший,  текст, актулаьно если вносим станые данные о вакцинации
   p_fk_vrach         IN   INTEGER,
   p_sotr_fio         IN   VARCHAR,                -- ФИО сотрудника сделавшего вакцинацию
   p_fk_sotr          IN   VARCHAR,                 -- сотрудник, который делал вакцинацию
   p_fk_lpy           IN   INTEGER,                -- ссылка в каком ЛПУ делали вакцинацию
   p_lpy              IN   VARCHAR,
   -- НАЗВАНИЕ ЛПУ,  авктуально если совсем в сотороннем ЛПУ была проведена инъекция
   p_status           IN   INTEGER,                                              -- статус
   p_fn_kratn         IN   INTEGER,                                           -- кратность
   p_fk_input_type    IN   INTEGER,                                     --   Способ введиня
   p_fk_otdel         IN   INTEGER                                            -- отеделние

)
AS
   v_fk_vac_unit   INTEGER;
   v_vacn_name     VARCHAR (150);
BEGIN
-- TODO делать проверку на минимально допустимый срок
-- TODO изменение статуса на вакцину изменять статус у всей серии
--Находим единицу измерения
   SELECT fk_unit, fc_name
     INTO v_fk_vac_unit, v_vacn_name
     FROM tvaccin_prep
    WHERE fk_id = p_fk_vaccin_prep;

   UPDATE tvac_people
      SET fk_people = p_fk_people,
          fd_create = p_date,
          fn_num = p_num,
          fc_series = p_series,
          fk_unit = v_fk_vac_unit,
          fn_status = p_status,
          fc_organization = p_lpy,
          fc_vrach_fio = p_vrach_fio,
          fk_vrach = p_fk_vrach,
          fc_sotr_fio = p_sotr_fio,
          fk_sotr = p_fk_sotr,
          fk_vaccin_prep = p_fk_vaccin_prep,
          fc_vaccin_name = v_vacn_name,
          fn_status_series = p_status,
          fk_lpy = p_fk_lpy,
          fk_input_type = p_fk_input_type,
          fk_otdel = p_fk_otdel
    WHERE fk_id = p_fk_id;
END edit_inject_nostore;

--------------------------------------------------------------------------------
FUNCTION get_kratname (p_kratn IN PLS_INTEGER)
   RETURN VARCHAR
IS
   v_ret   VARCHAR2 (5);
   v_num_vac PLS_INTEGER;
BEGIN
   IF p_kratn IS NULL
   THEN
      RETURN 'V?';
   END IF;

   v_ret := TO_CHAR (TRUNC (p_kratn / 10) - 1);

   IF v_ret = '0'
   THEN
      v_ret := 'V';
   ELSE
      v_ret := 'R' || v_ret;
   END IF;

   v_num_vac := MOD (p_kratn, 10);
   if v_num_vac >0 then
     if p_kratn >= 20 then
       v_ret := v_ret || '-' ;
     end if;
     v_ret := v_ret || TO_CHAR (v_num_vac);
   end if;

   RETURN v_ret;
END get_kratname;
--------------------------------------------------------------------------------
-- Возвращает кратность по конкретной вакцине - актуально когда вакцина против нескольких инфекций
FUNCTION getkratnnamebyvaccin (p_fk_vac_people IN INTEGER)
   RETURN VARCHAR2
IS
   v_ret   VARCHAR2 (150);
BEGIN
  -- стоит заглушкой, для первой попавшейся

   SELECT pkg_vaccin.get_kratname (tvac_kratn.fn_kratn) AS kratnname
     INTO v_ret
     FROM tvac_kratn
    WHERE tvac_kratn.fk_vac_people = p_fk_vac_people AND ROWNUM = 1;

   RETURN v_ret;
EXCEPTION
   WHEN OTHERS
   THEN                                                  -- caution handles all exceptions
      RETURN 'V';
END;                                                               --GetKratnNameBYVaccin;

--------------------------------------------------------------------------------
PROCEDURE create_plan (p_fk_people IN INTEGER)
AS
   v_fd_rojd   DATE;
BEGIN
   SELECT fd_rojd
     INTO v_fd_rojd
     FROM tpeoples
    WHERE fk_id = p_fk_people;

   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 1, v_fd_rojd, 11
               );                                         -- первая вакциная от гепатита И

   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 1, ADD_MONTHS (v_fd_rojd, 1) +3, 12
               );                                         -- вторая вакциная от гепатита И

   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 9, v_fd_rojd + 3, 10
               );                                                 -- Вакцинация туберкулез

   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 2, ADD_MONTHS (v_fd_rojd, 3), 11
               );                                               -- первая вациная дифтерия
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 3, ADD_MONTHS (v_fd_rojd, 3), 11
               );                                               -- первая вациная коклюш
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 8, ADD_MONTHS (v_fd_rojd, 3), 11
               );                                               -- первая вациная столбняк

   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 7, ADD_MONTHS (v_fd_rojd, 3), 11
               );                                               -- первая вациная полиомелит

   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 31, ADD_MONTHS (v_fd_rojd, 3), 11
               );                                               -- первая вациная гемофильная инфекция
--
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 2, Trunc(ADD_MONTHS (v_fd_rojd, 4.5))+15, 12
               );                                               -- вторая вациная дифтерия
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 3, Trunc(ADD_MONTHS (v_fd_rojd, 4.5))+15, 12
               );                                               -- вторая вациная коклюш
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 8, Trunc(ADD_MONTHS (v_fd_rojd, 4.5))+15, 12
               );                                               -- вторая вациная столбняк

   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 7, Trunc(ADD_MONTHS (v_fd_rojd, 4.5))+15, 12
               );                                               -- вторая вациная полиомелит

   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 31,Trunc(ADD_MONTHS (v_fd_rojd, 4.5)) +15, 13
               );                                               -- вторая вациная гемофильная инфекция
--
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 2, Trunc(ADD_MONTHS (v_fd_rojd, 6)), 13
               );                                               -- третья вациная дифтерия
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 3, Trunc(ADD_MONTHS (v_fd_rojd, 6)), 13
               );                                               -- третья вациная коклюш
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 8, Trunc(ADD_MONTHS (v_fd_rojd, 6)), 13
               );                                               -- третья вациная столбняк

   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 7, Trunc(ADD_MONTHS (v_fd_rojd, 6)), 13
               );                                               -- третья вациная полиомелит

   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 31,Trunc(ADD_MONTHS (v_fd_rojd,6)), 13
               );                                               -- третья вациная гемофильная инфекция
--
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 1,Trunc(ADD_MONTHS (v_fd_rojd,6)), 13
               );                                               -- третья вациная Гепатит B
--
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 4,Trunc(ADD_MONTHS (v_fd_rojd,12)), 11
               );                                               -- первая вакцинация корь

   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 6,Trunc(ADD_MONTHS (v_fd_rojd,12)), 11
               );                                               -- первая вакцинация паротит
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 5,Trunc(ADD_MONTHS (v_fd_rojd,12)), 11
               );                                               -- первая вакцинация краснуха
--
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 2, Trunc(ADD_MONTHS (v_fd_rojd, 18)), 20
               );                                               -- ревакцинация дифтерия
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 3, Trunc(ADD_MONTHS (v_fd_rojd, 18)), 20
               );                                               -- ревакцинация коклюш
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 8, Trunc(ADD_MONTHS (v_fd_rojd, 18)), 20
               );                                               -- ревакцинация столбняк

   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 7, Trunc(ADD_MONTHS (v_fd_rojd, 18)), 20
               );                                               -- ревакцинация полиомелит

   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 31,Trunc(ADD_MONTHS (v_fd_rojd,18)), 20
               );                                               -- ревакцинация гемофильная инфекция
--
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 7,Trunc(ADD_MONTHS (v_fd_rojd,20)), 20
               );                                               -- 2 ревакцинация полиомелит

--
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 4,Trunc(ADD_MONTHS (v_fd_rojd,12*6)), 12
               );                                               -- вторая вакцинация корь

   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 6,Trunc(ADD_MONTHS (v_fd_rojd,12*6)), 12
               );                                               -- вторая вакцинация паротит
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 5,Trunc(ADD_MONTHS (v_fd_rojd,12*6)), 12
               );                                               -- вторая вакцинация краснуха
--
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 2,Trunc(ADD_MONTHS (v_fd_rojd,12*7)), 30
               );                                               -- вторая ревакцинация дифтерия
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 8,Trunc(ADD_MONTHS (v_fd_rojd,12*7)), 30
               );                                               -- вторая ревакцинация столбняк
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 9,Trunc(ADD_MONTHS (v_fd_rojd,12*7)), 20
               );                                               -- перая ревакцинация столбняк

--   INSERT INTO tvac_plan
--               (fk_people, fk_infection, fd, fn_kratn
  --             )
--        VALUES (p_fk_people, 1,Trunc(ADD_MONTHS (v_fd_rojd,12*13)), 20
--               );                                               -- перая ревакцинация столбняк
END create_plan;

/**  показывает возраст на определенную дату
  для плана и не только */
FUNCTION show_age (p_rojd IN DATE, p_date IN DATE)
   RETURN VARCHAR2
AS
/**  показывает возраст на определенную дату
  для плана и не только */
   v_diff         INTEGER;
   v_month_diff   INTEGER;
   v_year_diff    INTEGER;
   v_day_diff     INTEGER;
   v_ret          VARCHAR2 (30);
   v_mod          INTEGER;                                        -- остататок от деления
BEGIN
   v_diff := TRUNC (p_date - p_rojd);

   IF v_diff < 0
   THEN
      RETURN '0';
   END IF;

   IF v_diff < 30
   THEN                                                                   -- меньше месяца
      RETURN TO_CHAR (v_diff) || ' ' || 'дн';
   ELSE
      v_month_diff := TRUNC (MONTHS_BETWEEN (p_date, p_rojd));

      IF v_month_diff < 6
      THEN
         v_day_diff := p_date - TRUNC (ADD_MONTHS (p_rojd, v_month_diff));
         v_ret := TO_CHAR (v_month_diff) || ' мес. ';

         IF v_day_diff > 1
         THEN
            v_ret := v_ret || TO_CHAR (v_day_diff) || ' дн';
         END IF;

         RETURN v_ret;
      ELSIF v_month_diff < 12
      THEN
         RETURN TO_CHAR (v_month_diff) || ' мес. ';
      ELSE
         v_year_diff := TRUNC (v_month_diff / 12);

         IF v_year_diff < 5
         THEN
            RETURN    TO_CHAR (v_year_diff)
                   || ' г. '
                   || TO_CHAR (v_month_diff - v_year_diff * 12)
                   || ' мес.';
         ELSE
            -- смотрим на последнюю цифру
            v_mod := MOD (v_year_diff, 10);

            IF v_mod = 1
            THEN
               RETURN TO_CHAR (v_year_diff) || ' год';
            ELSIF v_mod IN (2, 3, 4)
            THEN
               RETURN TO_CHAR (v_year_diff) || ' года';
            ELSE
               RETURN TO_CHAR (v_year_diff) || ' лет ';
            END IF;
         END IF;
      END IF;
   END IF;
END show_age;
--------------------------------------------------------------------------------
-- возвращает ttherpoints.fk_id по улице и номеру дома

FUNCTION get_terpoint_fk_id (p_fk_otdel IN INTEGER, p_street IN VARCHAR2, pnum IN INTEGER)
   RETURN INTEGER
AS
   v_ret   INTEGER;
BEGIN

   SELECT COUNT (DISTINCT a.fk_id)
     INTO v_ret
     FROM ttherpoints_terr a, ttherpoints_terr towner, ttherpoints
    WHERE (   (a.fp_type = 3 AND a.fn_num1 <= pnum AND a.fn_num2 >= pnum)
           OR ((a.fp_type = 2) AND (a.fn_num1 = pnum))
          )
      AND towner.fk_id = a.fk_owner
      AND towner.fk_owner = ttherpoints.fk_id
      AND ttherpoints.fk_otdel = p_fk_otdel
      AND a.fk_owner IN (
                SELECT ttherpoints_terr.fk_id
                  FROM ttherpoints_terr
                 WHERE UPPER (fc_name) LIKE UPPER (p_street)
                   AND ttherpoints_terr.fp_type = 1);

   IF v_ret = 1
   THEN
      SELECT ttherpoints.fk_id
        INTO v_ret
        FROM ttherpoints_terr a, ttherpoints_terr towner, ttherpoints
       WHERE (   (a.fp_type = 3 AND a.fn_num1 <= pnum AND a.fn_num2 >= pnum)
              OR ((a.fp_type = 2) AND (a.fn_num1 = pnum))
             )
         AND towner.fk_id = a.fk_owner
         AND towner.fk_owner = ttherpoints.fk_id
         AND ttherpoints.fk_otdel = p_fk_otdel
         AND a.fk_owner IN (
                   SELECT ttherpoints_terr.fk_id
                     FROM ttherpoints_terr
                    WHERE UPPER (fc_name) = UPPER (p_street)
                      AND ttherpoints_terr.fp_type = 1);

      RETURN v_ret;
   ELSE
     RETURN -1 - v_ret;
                                              -- не смогла я определить участок
   END IF;
END get_terpoint_fk_id;
--------------------------------------------------------------------------------
-- возвращает TINFECTION.FK_ID по строквому значению МКБ-10
-- если не нашла инфекции то возвращает -1

FUNCTION get_infectionby_mkb (p_fc_mkb10 IN VARCHAR)
   RETURN NUMBER
AS
   v_ret   INTEGER;
BEGIN
   SELECT COUNT (*)
     INTO v_ret
     FROM DUAL
    WHERE EXISTS (SELECT NULL
                    FROM tinfection_mkb
                   WHERE tinfection_mkb.fc_mkb10 LIKE SUBSTR (p_fc_mkb10, 1, 3));

   IF v_ret = 1
   THEN
      SELECT tinfection_mkb.fk_infection
        INTO v_ret
        FROM tinfection_mkb
       WHERE tinfection_mkb.fc_mkb10 LIKE SUBSTR (p_fc_mkb10, 1, 3);

      RETURN v_ret;
   END IF;

   SELECT COUNT (*)
     INTO v_ret
     FROM DUAL
    WHERE EXISTS (SELECT NULL
                    FROM tinfection_mkb
                   WHERE tinfection_mkb.fc_mkb10 LIKE SUBSTR (p_fc_mkb10, 1, 5));

   IF v_ret = 1
   THEN
      SELECT tinfection_mkb.fk_infection
        INTO v_ret
        FROM tinfection_mkb
       WHERE tinfection_mkb.fc_mkb10 LIKE SUBSTR (p_fc_mkb10, 1, 5);

      RETURN v_ret;
   END IF;

   RETURN -1;
END get_infectionby_mkb;
--------------------------------------------------------------------------------
PROCEDURE update_tvac_sicness_from_ib
AS
BEGIN
   -- из TAMBULANCE
   INSERT INTO tvac_sicness
               (fk_infection, fd_end, fc_rem, fk_diag, fk_people, fk_lpy, fc_vrach)
      SELECT pkg_vaccin.get_infectionby_mkb (tsmid.fk_mkb10), tdiag.fd_date, tdiag.fc_write,
             tdiag.fk_id, tambulance.fk_peplid, 111, get_sotrname (tdiag.fk_vrachid) AS "Врач"
        FROM tdiag, tsmid, tambulance
       WHERE tdiag.fk_smdiagid = tsmid.fk_id
         AND tambulance.fk_id = tdiag.fk_pacid
         AND tambulance.fk_peplid NOT IN (SELECT tvac_sicness.fk_people
                                            FROM tvac_sicness)
         AND tsmid.fk_id IN (SELECT     fk_id
                                   FROM tsmid
                             CONNECT BY PRIOR fk_id = fk_owner
                             START WITH tsmid.fk_mkb10 IN (SELECT tinfection_mkb.fc_mkb10
                                                             FROM tinfection_mkb));

-- из TKARTA
   INSERT INTO tvac_sicness
               (fk_infection, fd_end, fc_rem, fk_diag, fk_people, fk_lpy, fc_vrach)
      SELECT pkg_vaccin.get_infectionby_mkb (tsmid.fk_mkb10), tdiag.fd_date, tdiag.fc_write,
             tdiag.fk_id, tkarta.fk_peplid, 111, get_sotrname (tdiag.fk_vrachid) AS "Врач"
        FROM tdiag, tsmid, tkarta
       WHERE tdiag.fk_smdiagid = tsmid.fk_id
         AND tkarta.fk_id = tdiag.fk_pacid
         AND tkarta.fk_peplid NOT IN (SELECT tvac_sicness.fk_people
                                        FROM tvac_sicness)
         AND tsmid.fk_id IN (SELECT     fk_id
                                   FROM tsmid
                             CONNECT BY PRIOR fk_id = fk_owner
                             START WITH tsmid.fk_mkb10 IN (SELECT tinfection_mkb.fc_mkb10
                                                             FROM tinfection_mkb));
END update_tvac_sicness_from_ib;
--------------------------------------------------------------------------------
-- Возвращает кратность по конткерной вакцине вместе с названием инфекции
-- использовать только когда небольшой ресультат
FUNCTION get_vac_kratn (p_fk_vac_people IN INTEGER)
   RETURN VARCHAR2
AS
   v_ret   VARCHAR2 (100);

   CURSOR vackratn_cur (ip_fk_vac_people IN INTEGER)
   IS
      SELECT tinfection.fc_name || ' (' || pkg_vaccin.get_kratname (tvac_kratn.fn_kratn)
             || ')' AS tyr
        FROM tvac_kratn, tinfection
       WHERE tinfection.fk_id = tvac_kratn.fk_infection
         AND tvac_kratn.fk_vac_people = ip_fk_vac_people;
   vackratn_rec vackratn_cur%rowtype;
BEGIN
  FOR vackratn_rec In vackratn_cur(p_fk_vac_people) LOOP
    if v_ret is not null then
      v_ret := v_ret || chr(10);
    end if;
    v_ret :=v_ret ||vackratn_rec.tyr ;

  END LOOP;

  RETURN v_ret;
END get_vac_kratn;
--------------------------------------------------------------------------------
-- Возвращает MAX(TPEOPLES.FK_ID) для ледей с переданными параметрами
-- использоуется из-зи того что в базе есть дубликаты людей
--Author: Zhukov
FUNCTION get_people_fk_id_max (
   p_fam         IN   VARCHAR2,
   p_im          IN   VARCHAR2,
   p_otch        IN   VARCHAR2,
   p_date_rojd   IN   DATE,
   p_sex         IN   tpeoples.fp_sex%TYPE
)
   RETURN NUMBER
AS
   v_max_fk_id   NUMBER;
BEGIN
   SELECT MAX (fk_id)
     INTO v_max_fk_id
     FROM tpeoples
    WHERE tpeoples.fc_fam = p_fam
      AND tpeoples.fc_im = p_im
      AND tpeoples.fc_otch = p_otch
      AND tpeoples.fd_rojd = p_date_rojd
      AND tpeoples.fp_sex = p_sex;

   RETURN v_max_fk_id;
EXCEPTION
   WHEN NO_DATA_FOUND
   THEN
      RETURN -1;
END get_people_fk_id_max;

--------------------------------------------------------------------------------
-- По переданному TPEOPLES.FK_ID
-- %return 1  добавлять привиочную карту этого же человека p_out_FK_PEOPLE
--         2  добавлять привиочную карту для НОВОГО челоека p_out_FK_PEOPLE (избавляемся от дубликатов)
--         3 редактировать прививочную карту p_out_FK_VAC_MAP для этого же человека p_out_FK_PEOPLE
-- Внимание алгоритма не работает если не заполнено хоть одно из 5 полей у человека
FUNCTION what_do_with_fk_people (
   p_tpeoples_fk_id   IN       NUMBER,
   p_out_fk_people    OUT      NUMBER,
   p_out_fk_vac_map   OUT      NUMBER
)
   RETURN INTEGER
AS
   v_fam          tpeoples.fc_fam%TYPE;
   v_im           tpeoples.fc_im%TYPE;
   v_otch         tpeoples.fc_otch%TYPE;
   v_rojd         tpeoples.fd_rojd%TYPE;
   v_sex          tpeoples.fp_sex%TYPE;
   v_fk_people    NUMBER;
   v_fk_vac_map   NUMBER;

   CURSOR c_map_by_fio (p_fam VARCHAR2, p_im VARCHAR2, p_otch VARCHAR2, p_sex INTEGER, p_rojd DATE)
   IS
      SELECT   tvac_map.fk_id, tvac_map.fk_people
          FROM tpeoples a, tvac_map
         WHERE a.fc_fam = p_fam
           AND a.fc_im = p_im
           AND a.fc_otch = p_otch
           AND a.fp_sex = p_sex
           AND a.fd_rojd = p_rojd
           AND tvac_map.fk_people = a.fk_id
      ORDER BY 1 DESC;

   v_map_by_fio   c_map_by_fio%ROWTYPE;
BEGIN
   -- алгоритм
   -- 0 Если одно из полей пустое то возвращаем 1

   --1 Ищем есть ли такие же ФИО и др с полом у дргих людей
   --2 если такие есть , то переход к 4
   --2.1 смотрим есть ли прививочная карта для этого человека, если есть
   --   то переход к п.6
   --3. Возвращаем 1, и p_out_FK_PEOPLE
   --4. Среди найденных людей ищем есть лю у кого либо прививочная карта, если есть то 5 иначе 6
   --5. Возвращаем 3, и p_out_FK_PEOPLE и p_out_FK_VAC_MAP найденные в п.4
   --6. Возвращаем 2, и max(p_out_FK_PEOPLE)
   SELECT a.fc_fam, a.fc_im, a.fc_otch, a.fp_sex, a.fd_rojd
     INTO v_fam, v_im, v_otch, v_sex, v_rojd
     FROM tpeoples a
    WHERE a.fk_id = p_tpeoples_fk_id;

    if (v_fam is NULL) or (v_im is NULL) or (v_otch is NULL) or (v_sex is NULL) or (v_rojd is NULL)
    then
      p_out_fk_people := p_tpeoples_fk_id;
      p_out_fk_vac_map := 0;
      RETURN 1;                                                                        -- пункт 5

    end if;


   SELECT MAX (fk_id)
     INTO v_fk_people
     FROM tpeoples a
    WHERE a.fc_fam = v_fam
      AND a.fc_im = v_im
      AND a.fc_otch = v_otch
      AND a.fp_sex = v_sex
      AND a.fd_rojd = v_rojd;

   IF v_fk_people = p_tpeoples_fk_id
   THEN
      -- других людей нет
      SELECT COUNT (*)
        INTO v_fk_vac_map
        FROM DUAL
       WHERE EXISTS (SELECT 1
                       FROM tvac_map aa
                      WHERE aa.fk_people = v_fk_people);

      IF v_fk_vac_map = 0
      THEN
         -- карты нет
         p_out_fk_people := p_tpeoples_fk_id;
         p_out_fk_vac_map := 0;
         RETURN 1;                                                                       -- пункт 3
      ELSE
         -- но карта есть
         SELECT aa.fk_id
           INTO v_fk_vac_map
           FROM tvac_map aa
          WHERE aa.fk_people = v_fk_people;

         p_out_fk_people := p_tpeoples_fk_id;
         p_out_fk_vac_map := v_fk_vac_map;
         RETURN 3;                                                                        -- пункт 5
      END IF;                                                                   -- проверка на карту
   ELSE
      -- есть другие люди с такой же фамилией
      -- ищем у кого из них есть прививочная крта
      OPEN c_map_by_fio (v_fam, v_im, v_otch, v_sex, v_rojd);

      FETCH c_map_by_fio
       INTO v_map_by_fio;

      IF c_map_by_fio%NOTFOUND
      THEN
         -- пункт 6
         p_out_fk_people := v_fk_people;
         p_out_fk_vac_map := 0;
         RETURN 2;
      ELSE
         -- пункт 5
         p_out_fk_people := v_map_by_fio.fk_people;
         p_out_fk_vac_map := v_map_by_fio.fk_id;
         RETURN 3;
      END IF;

      NULL;
   END IF;
END what_do_with_fk_people;
--------------------------------------------------------------------------------
  PROCEDURE UPDATE_PERSONAL_DATA(
    p_fk_id         IN INTEGER,
    p_fk_country_id IN INTEGER,
    p_fk_region_id  IN INTEGER,
    p_fk_raion_id   IN INTEGER,
    p_fk_town_id    IN INTEGER,
    p_fk_intown_id  IN INTEGER,
    p_fk_street_id  IN INTEGER,
    p_fc_house      IN VARCHAR,
    p_fc_korpus     IN VARCHAR,
    p_fc_kvartira   IN VARCHAR,
    p_fk_area       IN NUMBER,
    p_fk_org_lpu    IN NUMBER,
    p_fk_dolgnost   IN INTEGER,
    p_org_date      IN DATE,
    p_fk_org        IN NUMBER,
    p_fd_beg        IN DATE,
    p_fd_end        IN DATE,
    p_fl_del        IN NUMBER
  )
  IS
    v_cnt           INTEGER;
    v_org_id        INTEGER;
    v_org_lpy_id    INTEGER;
    v_org_date      DATE;
    v_fd_beg        DATE;
    v_fd_end        DATE;
    v_area_id       INTEGER;
    v_country_id    INTEGER;
    v_region_id     INTEGER;
    v_raion_id      INTEGER;
    v_town_id       INTEGER;
    v_intown_id     INTEGER;
    v_street_id     INTEGER;
    v_house         VARCHAR(10);
    v_corps         VARCHAR(4);
    v_flat          VARCHAR(4);
    v_position      INTEGER;
    v_fl_del        INTEGER;

  BEGIN
    -- Проверяем, существует ли пациент с таким id
    SELECT COUNT(*) INTO v_cnt
    FROM DUAL
    WHERE EXISTS (
        SELECT NULL
        FROM tvac_map a WHERE a.fk_people = p_fk_id);

    IF v_cnt = 1 THEN
      -- Замечательно, проверяем, были ли изменения в прививочной карте
      -- указанного пациента.
      SELECT a.fk_organization, a.fd_organization, a.fk_area,
             a.fk_organization_lpy, a.fd_beg, a.fd_end, a.fl_del
      INTO   v_org_id, v_org_date, v_area_id,
             v_org_lpy_id, v_fd_beg, v_fd_end, v_fl_del
      FROM tvac_map a
      WHERE a.fk_people = p_fk_id;

      IF (NVL(v_org_id, -1) <> NVL(p_fk_org, -1)) OR (v_area_id <> p_fk_area) OR
          (v_org_lpy_id <> p_fk_org_lpu) OR (v_fl_del <> p_fl_del) OR
          (NVL(v_org_date, SYSDATE) <> NVL(p_org_date, SYSDATE)) OR
          (NVL(v_fd_beg, SYSDATE) <> NVL(p_fd_beg, SYSDATE)) OR
          (NVL(v_fd_end, SYSDATE) <> NVL(p_fd_end, SYSDATE)) THEN
        -- Ух, ты что то изменилось, обновляем данные, связанные с
        -- прививочной картой пациента
        UPDATE tvac_map
        SET fk_organization = p_fk_org,
            fd_organization = p_org_date,
            fk_area = p_fk_area,
            fk_organization_lpy = p_fk_org_lpu,
            fd_beg = p_fd_beg,
            fd_end = p_fd_end,
            fl_del = p_fl_del
        WHERE fk_people = p_fk_id;
      END IF;

      -- Проверяем на существование адреса пациента по его id и типу.
      SELECT COUNT(*)
      INTO v_cnt
      FROM DUAL
      WHERE EXISTS(
          SELECT NULL FROM tadress
          WHERE fk_pacid = p_fk_id AND fk_type = 61 AND ROWNUM = 1);

      IF v_cnt = 1 THEN
        -- Проверяем, были ли изменён адрес пациента.
        SELECT fk_countryid, fk_regionid, fk_raionid, fk_townid,
            fk_intownid, fk_streetid, fc_house, fc_korpus, fc_kvartira
        INTO v_country_id, v_region_id, v_raion_id, v_town_id, v_intown_id,
            v_street_id, v_house, v_corps, v_flat
        FROM tadress
        WHERE fk_pacid = p_fk_id AND fk_type = 61 AND ROWNUM = 1;


        IF (v_country_id <> p_fk_country_id) OR (v_region_id <> p_fk_region_id) OR
            (v_raion_id <> p_fk_raion_id) OR (v_town_id <> p_fk_town_id) OR
            (v_intown_id <> p_fk_intown_id) OR (v_street_id <> p_fk_street_id) OR
            (NVL(v_house, -1) <> NVL(p_fc_house, -1)) OR
            (NVL(v_corps, -1) <> NVL(p_fc_korpus, -1))  OR
            (NVL(v_flat, -1) <> NVL(p_fc_kvartira, -1)) THEN
          -- Вносим изменение в адрес пациента.
          UPDATE tadress
          SET fk_countryid = p_fk_country_id,
              fk_regionid = p_fk_region_id,
              fk_raionid = p_fk_raion_id,
              fk_townid = p_fk_town_id,
              fk_intownid = p_fk_intown_id,
              fk_streetid = p_fk_street_id,
              fc_house = p_fc_house,
              fc_korpus = p_fc_korpus,
              fc_kvartira = p_fc_kvartira
          WHERE fk_pacid = p_fk_id AND fk_type = 61 AND ROWNUM = 1;
        END IF;
      END IF;

      -- Проверяем наличие пользователя в базе
      SELECT COUNT(*) INTO v_cnt
      FROM DUAL
      WHERE EXISTS (
          SELECT NULL
          FROM tpeoples a WHERE a.fk_id = p_fk_id);

      IF v_cnt = 1 THEN
        -- Проверяем, были ли именены параметры пациента
        SELECT a.fk_dolgnost
        INTO v_position
        FROM tpeoples a WHERE a.fk_id = p_fk_id;

        IF NVL(v_position, -1) <> NVL(p_fk_dolgnost, -1) THEN
          -- Обновляем данные пациента
          UPDATE tpeoples
          SET fk_dolgnost = p_fk_dolgnost
          WHERE fk_id = p_fk_id;
        END IF;
      END IF;
    END IF;
  END UPDATE_PERSONAL_DATA;
------------------------------------------------------------------------------
  PROCEDURE INSERT_PERSONAL_DATA(
    p_fk_id         IN INTEGER,
    p_fk_country_id IN INTEGER,
    p_fk_region_id  IN INTEGER,
    p_fk_raion_id   IN INTEGER,
    p_fk_town_id    IN INTEGER,
    p_fk_intown_id  IN INTEGER,
    p_fk_street_id  IN INTEGER,
    p_fc_house      IN VARCHAR,
    p_fc_korpus     IN VARCHAR,
    p_fc_kvartira   IN VARCHAR,
    p_fk_area       IN NUMBER,
    p_fk_org_lpu    IN NUMBER,
    p_fk_dolgnost   IN INTEGER,
    p_org_date      IN DATE,
    p_fk_org        IN NUMBER,
    p_fd_beg        IN DATE,
    p_fd_end        IN DATE
  )
  IS
    v_cnt           INTEGER;
    v_org_id        INTEGER;
    v_org_lpy_id    INTEGER;
    v_org_date      DATE;
    v_area_id       INTEGER;
    v_country_id    INTEGER;
    v_region_id     INTEGER;
    v_raion_id      INTEGER;
    v_town_id       INTEGER;
    v_intown_id     INTEGER;
    v_street_id     INTEGER;
    v_house         VARCHAR(10);
    v_corps         VARCHAR(4);
    v_flat          VARCHAR(4);
    v_position      INTEGER;

  BEGIN
    -- Проверяем наличие пользователя в базе
    SELECT COUNT(*) INTO v_cnt
    FROM DUAL
    WHERE EXISTS (
        SELECT NULL
          FROM tpeoples a
         WHERE a.fk_id = p_fk_id);

    IF v_cnt = 1 THEN

      -- Проверяем, были ли именены параметры пациента
      SELECT a.fk_dolgnost
        INTO v_position
        FROM tpeoples a
       WHERE a.fk_id = p_fk_id;

      IF NVL(v_position, -1) <> NVL(p_fk_dolgnost, -1) THEN

        -- Обновляем данные пациента
        UPDATE tpeoples
           SET fk_dolgnost = p_fk_dolgnost
         WHERE fk_id = p_fk_id;
      END IF;

      -- Проверяем на существование адреса пациента по его id и типу.
      SELECT COUNT(*)
      INTO v_cnt
      FROM DUAL
      WHERE EXISTS(
          SELECT NULL
            FROM tadress
           WHERE fk_pacid = p_fk_id AND fk_type = 61 AND ROWNUM = 1);

      IF v_cnt = 1 THEN

        -- Проверяем, были ли изменён адрес пациента.
        SELECT fk_countryid, fk_regionid, fk_raionid, fk_townid,
               fk_intownid, fk_streetid, fc_house, fc_korpus, fc_kvartira
          INTO v_country_id, v_region_id, v_raion_id, v_town_id, v_intown_id,
               v_street_id, v_house, v_corps, v_flat
          FROM tadress
         WHERE fk_pacid = p_fk_id AND fk_type = 61 AND ROWNUM = 1;

        IF (v_country_id <> p_fk_country_id) OR
            (v_region_id <> p_fk_region_id) OR
            (v_raion_id <> p_fk_raion_id) OR (v_town_id <> p_fk_town_id) OR
            (v_intown_id <> p_fk_intown_id) OR
            (v_street_id <> p_fk_street_id) OR
            (NVL(v_house, -1) <> NVL(p_fc_house, -1)) OR
            (NVL(v_corps, -1) <> NVL(p_fc_korpus, -1))  OR
            (NVL(v_flat, -1) <> NVL(p_fc_kvartira, -1)) THEN

           -- Вносим изменение в адрес пациента.
           UPDATE tadress
              SET fk_countryid = p_fk_country_id,
                  fk_regionid = p_fk_region_id,
                  fk_raionid = p_fk_raion_id,
                  fk_townid = p_fk_town_id,
                  fk_intownid = p_fk_intown_id,
                  fk_streetid = p_fk_street_id,
                  fc_house = p_fc_house,
                  fc_korpus = p_fc_korpus,
                  fc_kvartira = p_fc_kvartira
            WHERE fk_pacid = p_fk_id AND fk_type = 61 AND ROWNUM = 1;
        END IF;
      END IF;

      -- Заводим новую карту для пациента
      INSERT INTO tvac_map(
          fk_people, fk_organization, fd_organization,
          fk_area, fk_organization_lpy, fd_beg, fd_end)
      VALUES(
          p_fk_id, p_fk_org, p_org_date,
          p_fk_area, p_fk_org_lpu, NVL(p_fd_beg, sysdate), p_fd_end);
    END IF;
  END INSERT_PERSONAL_DATA;

------------------------------------------------------------------------------
  PROCEDURE DELETE_PERSONAL_DATA(
     p_fk_id           IN INTEGER
  )
  IS
    v_cnt           INTEGER;
  BEGIN
    -- Проверяем, существует ли пациент с таким id
    SELECT COUNT(*) INTO v_cnt
    FROM DUAL
    WHERE EXISTS (
        SELECT NULL
        FROM tvac_map a WHERE a.fk_people = p_fk_id);

    IF v_cnt = 1 THEN
      -- Делаем пометку, что прививочная карта пациента удалена.
      UPDATE tvac_map
         SET fl_del = 1
       WHERE fk_people = p_fk_id AND ROWNUM = 1;
    END IF;
  END DELETE_PERSONAL_DATA;

------------------------------------------------------------------------------
------------------------------------------------------------------------------
  PROCEDURE INSERT_TEST(
    p_fd_create       IN DATE,
    p_fd_reg          IN DATE,
    p_fk_vac_test_res IN INTEGER,
    p_fc_reaction     IN VARCHAR,
    p_fk_people       IN INTEGER,
    p_fk_vac_test     IN INTEGER,
    p_fk_vrach        IN INTEGER,
    p_fc_vrach        IN VARCHAR,
    p_fk_sotr         IN INTEGER,
    p_fc_sotr         IN VARCHAR,
    p_fk_lpy          IN INTEGER,
    p_fc_lpy          IN VARCHAR,
    p_fn_dose         IN NUMBER,
    p_fk_measure_dose IN NUMBER
  )
  IS
  BEGIN
    INSERT INTO TVAC_PEOPLES_TEST(
        FD_CREATE, FK_VAC_TEST_RES, FC_REACTION, FK_PEOPLE,
        FK_VAC_TEST, FK_VRACH, FC_VRACH, FK_SOTR, FC_SOTR,
        FD_REG, FK_LPY, FC_LPY, FN_DOSE, FK_MEASURE_DOSE)
    VALUES(
        p_fd_create, p_fk_vac_test_res, p_fc_reaction, p_fk_people,
        p_fk_vac_test, p_fk_vrach, p_fc_vrach, p_fk_sotr, p_fc_sotr,
        p_fd_reg, p_fk_lpy, p_fc_lpy, p_fn_dose, p_fk_measure_dose);

  END INSERT_TEST;

------------------------------------------------------------------------------
------------------------------------------------------------------------------
  PROCEDURE UPDATE_TEST_DATA(
    p_fk_id           IN INTEGER,
    p_fd_create       IN DATE,
    p_fd_reg          IN DATE,
    p_fk_vac_test_res IN INTEGER,
    p_fc_reaction     IN VARCHAR,
    p_fk_people       IN INTEGER,
    p_fk_vac_test     IN INTEGER,
    p_fk_vrach        IN INTEGER,
    p_fc_vrach        IN VARCHAR,
    p_fk_sotr         IN INTEGER,
    p_fc_sotr         IN VARCHAR,
    p_fk_lpy          IN INTEGER,
    p_fc_lpy          IN VARCHAR,
    p_fn_dose         IN NUMBER,
    p_fk_measure_dose IN NUMBER
  )
  IS
    v_cnt             INTEGER;
    v_fd_create       DATE;
    v_fd_reg          DATE;
    v_fk_vac_test_res INTEGER;
    v_fc_reaction     VARCHAR(500);
    v_fk_people       INTEGER;
    v_fk_vac_test     INTEGER;
    v_fk_vrach        INTEGER;
    v_fc_vrach        VARCHAR(50);
    v_fk_sotr         INTEGER;
    v_fc_sotr         VARCHAR(50);
    v_fk_lpy          INTEGER;
    v_fc_lpy          VARCHAR(150);
    v_fn_dose         NUMBER;
    v_fk_measure_dose NUMBER;

  BEGIN
    -- Проверяем, существует ли пациент с таким id
    SELECT COUNT(*) INTO v_cnt
    FROM DUAL
    WHERE EXISTS (
        SELECT NULL
        FROM tvac_peoples_test t WHERE t.fk_id = p_fk_id);

    IF v_cnt = 1 THEN
      -- Замечательно, проверяем, были ли изменения параметров
      -- пробы указанного пациента.
      SELECT t.fd_create, t.fk_vac_test_res, t.fc_reaction, t.fk_people,
          t.fk_vac_test, t.fk_vrach, t.fc_vrach, t.fk_lpy, t.fc_lpy,
          t.fd_reg, t.fk_sotr, t.fc_sotr, t.fn_dose, t.fk_measure_dose
      INTO v_fd_create, v_fk_vac_test_res, v_fc_reaction, v_fk_people,
          v_fk_vac_test, v_fk_vrach, v_fc_vrach, v_fk_lpy, v_fc_lpy,
          v_fd_reg, v_fk_sotr, v_fc_sotr, v_fn_dose, v_fk_measure_dose
      FROM tvac_peoples_test t
      WHERE t.fk_id = p_fk_id;

      IF (v_fd_create <> p_fd_create) OR
          (v_fk_vac_test_res <> p_fk_vac_test_res) OR
          (NVL(v_fc_reaction, -1) <> NVL(p_fc_reaction, -1)) OR
          (v_fk_people <> p_fk_people) OR (v_fk_vac_test <> p_fk_vac_test) OR
          (v_fk_vrach <> p_fk_vrach) OR (v_fk_lpy <> p_fk_lpy) OR
          (v_fd_reg <> p_fd_reg) OR (v_fk_sotr <> p_fk_sotr) OR
          (v_fn_dose <> p_fn_dose) OR
          (v_fk_measure_dose <> p_fk_measure_dose) THEN

        UPDATE tvac_peoples_test
        SET fd_create       = p_fd_create,
            fk_vac_test_res = p_fk_vac_test_res,
            fc_reaction     = p_fc_reaction,
            fk_people       = p_fk_people,
            fk_vac_test     = p_fk_vac_test,
            fk_vrach        = p_fk_vrach,
            fc_vrach        = p_fc_vrach,
            fk_lpy          = p_fk_lpy,
            fc_lpy          = p_fc_lpy,
            fd_reg          = p_fd_reg,
            fk_sotr         = p_fk_sotr,
            fc_sotr         = p_fc_sotr,
            fn_dose         = p_fn_dose,
            fk_measure_dose = p_fk_measure_dose
        WHERE fk_id = p_fk_id;
      END IF;
    END IF;
  END UPDATE_TEST_DATA;

------------------------------------------------------------------------------
  PROCEDURE DELETE_TEST_DATA(
    p_fk_id           IN INTEGER
  )
  IS
    v_cnt             INTEGER;
  BEGIN
    -- Проверяем, существует ли пациент с таким id
    SELECT COUNT(*) INTO v_cnt
    FROM DUAL
    WHERE EXISTS (
        SELECT NULL
        FROM tvac_peoples_test t WHERE t.fk_id = p_fk_id);

    IF v_cnt = 1 THEN
      -- Замечательно, удаляем пробу указанного пациента.
      DELETE FROM tvac_peoples_test t
      WHERE t.fk_id = p_fk_id AND ROWNUM = 1;
    END IF;
  END DELETE_TEST_DATA;
------------------------------------------------------------------------------
-- Возвращает Фамилию, Имя,
-- Отчество сотрудника по Id
------------------------------------------------------------------------------
  FUNCTION FIND_EMPL_NAME_BY_ID(p_fk_id IN INTEGER)
    RETURN VARCHAR2
  AS
    v_return VARCHAR2(100);
    v_cnt INTEGER;

  BEGIN
    v_return := '';

    SELECT COUNT(*) INTO v_cnt
      FROM DUAL
     WHERE EXISTS (
        SELECT NULL
          FROM login.tsotr empl WHERE empl.fk_id = TO_NUMBER(p_fk_id));


    IF v_cnt = 1 THEN
      SELECT (empl.fc_fam || ' ' || UPPER(SUBSTR(empl.fc_name, 1, 1)) || '. ' ||
             UPPER(SUBSTR(empl.fc_otch, 1, 1)) || '.')
        INTO v_return
        FROM login.tsotr empl
       WHERE empl.fk_id = TO_NUMBER(p_fk_id);
    END IF;

    RETURN v_return;
  END FIND_EMPL_NAME_BY_ID;
------------------------------------------------------------------------------
-- Возвращает тур вакцинации
------------------------------------------------------------------------------
  FUNCTION VACINATION_ROUND(
    p_fk_people      IN INTEGER,
    p_fk_vac_people  IN INTEGER,
    p_fk_infection   IN INTEGER,
    p_fk_id_new_prep IN INTEGER,
    p_fk_id_cur_prep IN INTEGER
  ) RETURN NUMBER
  AS
    v_return NUMBER;

  BEGIN
    SELECT DECODE(
           p_fk_vac_people, NULL,
           -- При добавлении новой прививки.
           NEXT_VACINATION_ROUND(NVL(p_fk_people, -1),
                                 NVL(p_fk_infection, -1)),

           -- Если редактируют старую прививку.
           CASE p_fk_id_new_prep
             WHEN p_fk_id_cur_prep THEN
               CURRENT_VACINATION_ROUND(NVL(p_fk_vac_people, -1),
                                        NVL(p_fk_infection, -1))
             ELSE
               -- Если при редактировании старой
               -- прививки изменили препарат
               NEXT_VACINATION_ROUND(NVL(p_fk_people, -1),
                                     NVL(p_fk_infection, -1))
           END
          )
     INTO v_return
     FROM dual;

    RETURN v_return;
  END VACINATION_ROUND;

------------------------------------------------------------------------------
-- Возвращает следующий тур вакцинации
------------------------------------------------------------------------------
  FUNCTION NEXT_VACINATION_ROUND(
    p_fk_people    IN INTEGER,
    p_fk_infection IN INTEGER
  ) RETURN NUMBER
  AS
    v_return NUMBER;

  BEGIN
    -- Ищем последний тур вакцинации.
    SELECT NVL(MAX(fn_kratn), 10)
          INTO v_return
      FROM tvac_people a, tvac_kratn b
     WHERE a.fk_people = p_fk_people
       AND b.fk_vac_people = a.fk_id
       AND b.fk_infection = p_fk_infection;

    -- Получаем следующий тур вакцинации.
    IF v_return < 13 then
      v_return := v_return + 1;
    ELSE
      v_return := TRUNC((v_return + 10), -1);
    end if;

    RETURN v_return;
  END NEXT_VACINATION_ROUND;

------------------------------------------------------------------------------
-- Возвращает текущий тур вакцинации
------------------------------------------------------------------------------
  FUNCTION CURRENT_VACINATION_ROUND(
    p_fk_vac_people IN INTEGER,
    p_fk_infection IN INTEGER
  ) RETURN NUMBER
  AS
    v_return NUMBER;

  BEGIN
    SELECT a.fn_kratn
      INTO v_return
      FROM tvac_kratn a
     WHERE a.fk_infection = p_fk_infection
           AND a.fk_vac_people = p_fk_vac_people;

    RETURN v_return;
  END CURRENT_VACINATION_ROUND;

------------------------------------------------------------------------------
-- Проверяет корректность вакцинации
------------------------------------------------------------------------------
  FUNCTION IS_VALID_VACCINATION(
    p_age_pos     IN INTEGER,
    p_kratn_pos   IN INTEGER,
    p_infec_pos   IN INTEGER,
    p_kratn_count IN INTEGER
  ) RETURN BOOLEAN
  AS
    TYPE OFFSET_COLLECTION IS TABLE OF INTEGER;
    TYPE VALID_COLLECTION IS TABLE OF BOOLEAN;

     -- Дифтерия, Коклюш, Полиомиелит, Туберкулез,
     -- Вирусный гепатит В, Корь, Эпидемический паротит, Краснуха
    v_offset    OFFSET_COLLECTION := OFFSET_COLLECTION(
        0, 110, 154, 242, 308, 330, 418, 506);
    v_vac_valid VALID_COLLECTION := VALID_COLLECTION(
        TRUE, TRUE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE,
        TRUE, TRUE, FALSE, FALSE, FALSE, TRUE, TRUE, FALSE, FALSE, FALSE,
        TRUE, TRUE, FALSE, FALSE, FALSE, TRUE, TRUE, FALSE, FALSE, FALSE,
        TRUE, TRUE, FALSE, FALSE, FALSE, TRUE, TRUE, FALSE, FALSE, FALSE,
        TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, TRUE, FALSE, FALSE,
        TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, TRUE, FALSE, FALSE,
        TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, TRUE, FALSE, FALSE,
        TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE, FALSE,
        TRUE, TRUE, TRUE, TRUE, FALSE, TRUE, TRUE, TRUE, TRUE, TRUE,
        TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE,
        TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE,

        TRUE, FALSE, TRUE, FALSE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE,
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        TRUE, TRUE, TRUE, TRUE,

        TRUE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, TRUE, TRUE,
        TRUE, FALSE, TRUE, TRUE, TRUE, FALSE, TRUE, TRUE, TRUE, FALSE,
        TRUE, TRUE, TRUE, FALSE, TRUE, TRUE, TRUE, FALSE, TRUE, TRUE,
        TRUE, FALSE, TRUE, TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        TRUE, TRUE, TRUE, TRUE, FALSE, TRUE, TRUE, TRUE,

        TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, TRUE,
        FALSE, FALSE, TRUE, FALSE, FALSE, TRUE, FALSE, FALSE, TRUE, TRUE,
        FALSE, TRUE, TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, TRUE, FALSE,
        TRUE, TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, TRUE, FALSE, TRUE,
        TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE,
        TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
        TRUE, TRUE, TRUE, TRUE, TRUE, TRUE,

        TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE,
        TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE,
        TRUE, TRUE,

        TRUE, TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, TRUE,
        TRUE, FALSE, TRUE, TRUE, TRUE, FALSE, TRUE, TRUE, TRUE, FALSE,
        TRUE, TRUE, TRUE, FALSE, TRUE, TRUE, TRUE, FALSE, TRUE, TRUE,
        TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE,
        TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE,
        TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE,
        TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE,
        TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, FALSE, FALSE,
        TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE,

        TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, TRUE,
        TRUE, FALSE, TRUE, TRUE, TRUE, FALSE, TRUE, TRUE, TRUE, FALSE,
        TRUE, TRUE, TRUE, FALSE, TRUE, TRUE, TRUE, FALSE, TRUE, TRUE,
        TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE,
        TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE,
        TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE,
        TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE,
        TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, FALSE, FALSE,
        TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE,

        TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, TRUE,
        TRUE, FALSE, TRUE, TRUE, TRUE, FALSE, TRUE, TRUE, TRUE, FALSE,
        TRUE, TRUE, TRUE, FALSE, TRUE, TRUE, TRUE, FALSE, TRUE, TRUE,
        TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE,
        TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE,
        TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE,
        TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE,
        TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, FALSE, FALSE,
        TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE
    );
    v_valid_pos PLS_INTEGER;

  BEGIN

    -- Вычисляем индекс в 2-х мерной матрицы.
    -- По горизонтали - Инфекция и зависящая от неё кратность.
    -- По вертикали - возраст вакцинируемого.
    v_valid_pos := (p_kratn_count * (p_age_pos - 1) + p_kratn_pos) +
        v_offset(p_infec_pos);

    RETURN v_vac_valid(v_valid_pos);
  END IS_VALID_VACCINATION;

------------------------------------------------------------------------------
-- Получаем Id Лечебно-профилактического учреждения
------------------------------------------------------------------------------
  FUNCTION LPY_ID_DEFAULT RETURN INTEGER
  IS
    v_result INTEGER;

  BEGIN
    v_result := 15093;

    RETURN v_result;
  END LPY_ID_DEFAULT;


------------------------------------------------------------------------------
-- Объединение отдельного пациента
------------------------------------------------------------------------------
  PROCEDURE MERGEING_PEOPLE(
    p_united_id       IN INTEGER,
    p_connectable_id  IN INTEGER,
    p_cnt_cancel      IN OUT INTEGER,
    p_cnt_tvac_people IN OUT INTEGER,
    p_cnt_vac_del     IN OUT INTEGER,
    p_cnt_map_del     IN OUT INTEGER)
  AS
    v_cnt NUMBER;

  BEGIN

    SELECT COUNT(*) INTO v_cnt
    FROM DUAL
    WHERE EXISTS (
        SELECT NULL
        FROM tvac_map a WHERE a.fk_people = p_united_id);

    IF v_cnt = 1 THEN
      -- Объединяем все отводы.
      UPDATE tvac_cancel SET fk_people = p_united_id
       WHERE fk_people = p_connectable_id;

      dbms_output.put_line('update tvac_cancel: ' || SQL%ROWCOUNT);
      p_cnt_cancel := p_cnt_cancel + SQL%ROWCOUNT;

      -- Объединяем все болезни.
      UPDATE tvac_sicness SET fk_people = p_united_id
       WHERE fk_people = p_connectable_id;

      dbms_output.put_line('update tvac_sicness: ' || SQL%ROWCOUNT);

      -- Объединяем все пробы.
      UPDATE tvac_peoples_test SET fk_people = p_united_id
       WHERE fk_people = p_connectable_id;

      dbms_output.put_line('update tvac_peoples_test: ' || SQL%ROWCOUNT);

      -- Объединяем планы.
      UPDATE tvac_plan SET fk_people = p_united_id
       WHERE fk_people = p_connectable_id;

      dbms_output.put_line('update tvac_plan: ' || SQL%ROWCOUNT);

      -- Объединяем прививки.
      UPDATE tvac_people SET fk_people = p_united_id
       WHERE fk_people = p_connectable_id;

      dbms_output.put_line('update tvac_people: ' || SQL%ROWCOUNT);
      p_cnt_tvac_people := p_cnt_tvac_people + SQL%ROWCOUNT;

      -- Удаляем лишни прививки.
      FOR cur_vaccin IN (
          -- Получаем по одной прививки из каждого дубликата.
          SELECT fk_id
            FROM (SELECT fk_id,
                         count(*)
                         over (partition by fd_create,
                                            fk_vaccin_prep
                         ) total,
                         row_number()
                         over (partition by fd_create,
                                            fk_vaccin_prep
                               order by fk_id desc
                         ) seq
                    FROM tvac_people
                   WHERE fk_people = p_united_id)
           WHERE total > 1
             AND seq > 1) LOOP

        DELETE FROM tvac_kratn
              WHERE fk_vac_people = cur_vaccin.fk_id;

        dbms_output.put_line('delete from tvac_kratn: ' || SQL%ROWCOUNT);

        DELETE FROM tvac_people
              WHERE fk_id = cur_vaccin.fk_id;

        dbms_output.put_line('delete from tvac_people: ' || SQL%ROWCOUNT);
        p_cnt_vac_del := p_cnt_vac_del + SQL%ROWCOUNT;

      END LOOP;

      -- Удаляем лишнюю карту.
      DELETE FROM tvac_map
            WHERE fk_people = p_connectable_id;

      dbms_output.put_line('delete from tvac_map: ' || SQL%ROWCOUNT);
      p_cnt_map_del := p_cnt_map_del +  SQL%ROWCOUNT;

    END IF; -- IF v_cnt = 1 THEN
  END MERGEING_PEOPLE;

------------------------------------------------------------------------------
-- Поиск и объединение людей с одинаковыми
-- фамилиями, именами, отчествами, годами рождения и полом.
------------------------------------------------------------------------------
  PROCEDURE MERGER_DUPLICATE
  AS
    v_united_fk_id    INTEGER;
    v_count           INTEGER;
    v_cnt_cancel      INTEGER;
    v_cnt_sickness    INTEGER;
    v_cnt_vac_del     INTEGER;
    v_cnt_tvac_people INTEGER;
    v_cnt_map_del     INTEGER;

  BEGIN
    v_count := 0;
    v_cnt_cancel := 0;
    v_cnt_sickness := 0;
    v_cnt_vac_del := 0;
    v_cnt_tvac_people := 0;
    v_cnt_map_del := 0;

    FOR cur_dupl IN (
        SELECT *
          FROM (SELECT tvac_map.fk_id as map_id,
                       tpeoples.fk_id as peoples_id,
                       tpeoples.fc_fam,
                       tpeoples.fc_im,
                       tpeoples.fc_otch,
                       tpeoples.fd_rojd,
                       tpeoples.fp_sex,
                       count(*)
                       over (partition by tpeoples.fc_fam, tpeoples.fc_im,
                                          tpeoples.fc_otch,
                                          tpeoples.fd_rojd, tpeoples.fp_sex
                       ) total,
                       row_number()
                       over (partition by tpeoples.fc_fam, tpeoples.fc_im,
                                          tpeoples.fc_otch,
                                          tpeoples.fd_rojd, tpeoples.fp_sex
                                 order by tpeoples.fk_id desc) seq
                  FROM tpeoples,
                       tvac_map
                 WHERE tpeoples.fk_id = tvac_map.fk_people
               )
         WHERE total > 1) LOOP

      IF cur_dupl.seq = 1 THEN
        -- Берем id пользователя группы, который будет объединяющим.
        v_united_fk_id := cur_dupl.peoples_id;
        dbms_output.put_line(
            'united id peoples: ' || cur_dupl.peoples_id);

      ELSE
        dbms_output.put_line(
            'connectable id peoples: ' || cur_dupl.peoples_id);

        MERGEING_PEOPLE(
            v_united_fk_id, cur_dupl.peoples_id,
            v_cnt_cancel, v_cnt_tvac_people, v_cnt_vac_del, v_cnt_map_del);
      END IF;
      v_count := v_count + 1;
    END LOOP;

    dbms_output.put_line(
        'Общее количество карт: ' || TO_CHAR(v_count));
    dbms_output.put_line(
        'Общее количество отводов: ' || TO_CHAR(v_cnt_cancel) );
    dbms_output.put_line(
        'Общее объедененных привиок: ' || TO_CHAR(v_cnt_tvac_people) );
    dbms_output.put_line(
        'Общее удаленных привиок: ' || TO_CHAR(v_cnt_vac_del) );
    dbms_output.put_line(
        'Удалено карт: ' || TO_CHAR(v_cnt_map_del) );

  END MERGER_DUPLICATE;

------------------------------------------------------------------------------
-- Если пациент имеет постоянный отвод,
-- то нет смысла для него формировать план прививок.
------------------------------------------------------------------------------

  FUNCTION IS_NOT_CANCEL_PEOPLE(
    p_fk_people      IN INTEGER) RETURN BOOLEAN
  IS
    c_fl_all       CONSTANT NUMBER := 1;
    v_valid_people NUMBER;
    v_result       BOOLEAN;

  BEGIN
    v_result := FALSE;

    -- Проверяем, есть ли у пациента постоянный отвод
    -- от всех болезней и вакцин.
    SELECT COUNT(*)
      INTO v_valid_people
      FROM DUAL
     WHERE EXISTS (SELECT NULL
                     FROM tvac_cancel, tvaccancel_type
                    WHERE tvac_cancel.fk_type = tvaccancel_type.fk_id
                      AND tvaccancel_type.fl_all = c_fl_all
                      AND fk_people = p_fk_people);

    IF v_valid_people = 0 THEN
      -- У пациента нет отвода от всех болезней и вакцин.
      v_result := TRUE;
    END IF;

    RETURN v_result;
  END IS_NOT_CANCEL_PEOPLE;

------------------------------------------------------------------------------
-- Проверяем, была ли сделана вакцинация. Если сделана, то возвращаем
-- идентификатор препарата.
------------------------------------------------------------------------------

  FUNCTION IS_EXIST_VACCIN(
    p_fk_people      IN INTEGER,
    p_fk_infection   IN INTEGER,
    p_fn_kratn       IN INTEGER,
    p_fk_vac_people  OUT INTEGER) RETURN BOOLEAN
  IS
    v_result       BOOLEAN;
    v_exist_vaccin NUMBER;

  BEGIN
    v_result := FALSE;

    SELECT COUNT(*)
      INTO v_exist_vaccin
      FROM DUAL
     WHERE EXISTS (SELECT NULL
                     FROM tvac_people, tvac_kratn
                    WHERE tvac_people.fk_id = tvac_kratn.fk_vac_people
                      AND tvac_kratn.fn_kratn = p_fn_kratn
                      AND tvac_people.fk_people = p_fk_people
                      AND tvac_kratn.fk_infection = p_fk_infection);

    IF v_exist_vaccin > 0 THEN
      SELECT tvac_people.fk_id
        INTO p_fk_vac_people
        FROM tvac_people, tvac_kratn
       WHERE tvac_people.fk_id = tvac_kratn.fk_vac_people
         AND tvac_kratn.fn_kratn = p_fn_kratn
         AND tvac_people.fk_people = p_fk_people
         AND tvac_kratn.fk_infection = p_fk_infection;

      v_result := TRUE;
    END IF;

    RETURN v_result;
  END IS_EXIST_VACCIN;

------------------------------------------------------------------------------
-- Проверка на наличие планируемой прививки
-- У пациента должно быть не больше одной планируемой прививки с
-- одинаковой инфекцией и кратностью.
------------------------------------------------------------------------------

  FUNCTION IS_EXIST_VACCIN_PLAN(
    p_fk_people      IN INTEGER,
    p_fk_infection   IN INTEGER,
    p_fn_kratn       IN INTEGER) RETURN BOOLEAN
  IS
    v_result       BOOLEAN;
    v_private_plan NUMBER;

  BEGIN
    v_result := FALSE;

    -- На данный момент на каждую инфекцию можно сформировать
    -- только один индивидуальный план,
    -- поэтому ниже tvac_private_plan и tvac_planning
    -- связывается по инфекции. При изменении этого условия надо изменить
    -- и условие связывания.
    SELECT COUNT(*)
      INTO v_private_plan
      FROM DUAL
     WHERE EXISTS (SELECT NULL
                     FROM tvac_private_plan
                    WHERE tvac_private_plan.fk_people = p_fk_people
                      AND tvac_private_plan.fk_infection = p_fk_infection
                      AND tvac_private_plan.fn_kratn = p_fn_kratn);

    IF v_private_plan > 0 THEN

      v_result := TRUE;
    END IF;

    RETURN v_result;
  END IS_EXIST_VACCIN_PLAN;

------------------------------------------------------------------------------
-- В соответствии с шаблоном формирует планируемую дату вакцинации
------------------------------------------------------------------------------

  FUNCTION CREATE_PLAN_DATE(
    p_fk_people      IN INTEGER,
    p_fk_planning    IN INTEGER,
    p_fn_kratn       IN INTEGER,
    p_fn_period      IN INTEGER,
    p_fk_period_type IN INTEGER) RETURN DATE
  IS
    c_fk_from_birthday CONSTANT NUMBER := 1;
    v_offset_dates     NUMBER;
    v_vaccin_period    NUMBER;
    v_valid_cancel     NUMBER;
    v_max_period       NUMBER;
    v_people_date      DATE;
    v_result           DATE;

  BEGIN
    -- По умолчанию формируем дату планируемой прививки от
    -- даты формирования индивидуального плана.
    v_result := ADD_MONTHS(SYSDATE, p_fn_period);

    -- Определяем период, который необходим для определения
    -- планируемой даты.
    IF c_fk_from_birthday = p_fk_period_type THEN

      v_vaccin_period := p_fn_period;
    ELSE
      -- При вычислении планируемой даты от даты последней вакцинации,
      -- необходимо определить максимальный период
      -- планируемой, от даты рождения, прививки.
      SELECT MAX(fn_period)
        INTO v_max_period
        FROM tvac_plan_pattern
       WHERE fk_planning = p_fk_planning
         AND tvac_plan_pattern.fk_period_type = c_fk_from_birthday;

      v_vaccin_period := v_max_period + p_fn_period;

    END IF; -- ELSE IF c_fk_from_birthday = p_fk_period_type

    -- Дата вычисляется от даты рождения пациента.
    -- Получаем дату рождения пациента.
    SELECT fd_rojd
      INTO v_people_date
      FROM tpeoples
     WHERE fk_id = p_fk_people;

    IF v_people_date IS NOT NULL THEN
      -- Формируем планируемую дату вакцинаци.
      v_result := ADD_MONTHS(v_people_date, v_vaccin_period);

      -- Проверяем есть ли отводы, если есть временные, то согласуем
      -- планируемую дату с датой отвода.
      SELECT COUNT(*)
        INTO v_valid_cancel
        FROM DUAL
       WHERE EXISTS (SELECT NULL
                       FROM tvac_cancel
                      WHERE fk_people = p_fk_people
                        AND MONTHS_BETWEEN(fd_end, v_result) > 0);

      IF v_valid_cancel > 0 THEN
        -- Отлично, определяем смещение в наложении даты конца отвода на
        -- планируемую дату прививки.
        SELECT MONTHS_BETWEEN(fd_end, v_result)
          INTO v_offset_dates
          FROM tvac_cancel
         WHERE fk_people = p_fk_people
           AND MONTHS_BETWEEN(fd_end, v_result) > 0;

        -- Нужно планируемую дату прививки перенести на конец отвода.
        v_result := ADD_MONTHS(v_result, v_offset_dates);
      END IF;
    END IF; -- IF v_people_date IS NOT NULL

    RETURN v_result;

  END CREATE_PLAN_DATE;

------------------------------------------------------------------------------
-- Добавление планируемой прививки в индивидуальный план
------------------------------------------------------------------------------

  FUNCTION IS_ADD_VACCIN_PRIVATE_PLAN(
    p_fk_people                IN INTEGER,
    p_fk_infection             IN INTEGER,
    p_fd_plan_date             IN DATE,
    p_fn_kratn                 IN INTEGER,
    p_fn_not_vaccin            IN INTEGER,
    p_fn_not_exist_prev_vaccin IN INTEGER,
    p_fn_vaccin_period         IN INTEGER,
    p_fk_sotr                  IN INTEGER
  ) RETURN BOOLEAN
  AS
    c_plan_status           CONSTANT NUMBER := 1;
    c_exec_status           CONSTANT NUMBER := 2;
    v_fk_vac_people         NUMBER;
    v_prvt_plan_id          NUMBER;
    v_result                BOOLEAN;

  BEGIN
    -- Планируемую прививку добавляем только тогда, когда её нет.
    v_result := (
        NOT PKG_VACCIN.IS_EXIST_VACCIN_PLAN(
        p_fk_people, p_fk_infection, p_fn_kratn));

    IF v_result THEN
      -- Проверяем, может прививка уже сделана.
      -- Если сделана, то получаем препарат
      IF PKG_VACCIN.IS_EXIST_VACCIN(
          p_fk_people, p_fk_infection, p_fn_kratn, v_fk_vac_people) THEN

        -- Прививка уже сделана, следовательно помечаем в плане
        -- как выполнено.
        INSERT INTO tvac_private_plan
                    (fk_infection, fk_people,
                    fk_status, fd_plan_date, fn_kratn,
                    fn_not_vaccin, fn_not_exist_prev_vaccin,
                    fn_vaccin_period, fk_vac_people, fk_sotr)
             VALUES (p_fk_infection, p_fk_people, c_exec_status,
                    p_fd_plan_date, p_fn_kratn,
                    p_fn_not_vaccin, p_fn_not_exist_prev_vaccin,
                    p_fn_vaccin_period, v_fk_vac_people, p_fk_sotr)
          RETURNING fk_id
               INTO v_prvt_plan_id;

        -- Согласно условию формирования планируемой прививки, она
        -- должна выполняться через указанный период после последней вакцинации
        IF p_fn_vaccin_period > 0 THEN
          INSERT INTO tvac_private_plan
                      (fk_infection, fk_people,
                      fk_status, fd_plan_date, fn_kratn,
                      fn_not_vaccin, fn_not_exist_prev_vaccin,
                      fn_vaccin_period, fk_sotr)
               VALUES (p_fk_infection, p_fk_people, c_plan_status,
                      p_fd_plan_date, p_fn_kratn,
                      p_fn_not_vaccin, p_fn_not_exist_prev_vaccin,
                      p_fn_vaccin_period, p_fk_sotr);
        END IF;
      ELSE

        INSERT INTO tvac_private_plan
                    (fk_infection, fk_people,
                    fk_status, fd_plan_date, fn_kratn,
                    fn_not_vaccin, fn_not_exist_prev_vaccin,
                    fn_vaccin_period, fk_sotr)
             VALUES (p_fk_infection, p_fk_people, c_plan_status,
                    p_fd_plan_date, p_fn_kratn,
                    p_fn_not_vaccin, p_fn_not_exist_prev_vaccin,
                    p_fn_vaccin_period, p_fk_sotr);
      END IF;
    END IF;

    RETURN v_result;

  END IS_ADD_VACCIN_PRIVATE_PLAN;

------------------------------------------------------------------------------
-- На базе шаблона формирует индивидуальный план пациента
------------------------------------------------------------------------------

  FUNCTION IS_CREATE_PRIVATE_PLAN(
    p_fk_people      IN NUMBER,
    p_fk_planning    IN NUMBER) RETURN BOOLEAN
  AS
    c_all_peoples           CONSTANT NUMBER := 2;
    c_not_exist_prev_vaccin CONSTANT NUMBER := 2;
    c_not_vaccin            CONSTANT NUMBER := 1;
    c_fk_from_last_vaccin   CONSTANT NUMBER := 2;
    v_valid_plan            NUMBER;
    v_valid_people          NUMBER;
    v_people_sex            NUMBER;
    v_vaccin_period         NUMBER;
    v_plan_date             DATE;
    v_not_vaccin            NUMBER;
    v_not_exist_prev_vaccin NUMBER;
    v_result                BOOLEAN;
    v_add_result            BOOLEAN;

  BEGIN
    v_result := FALSE;

    -- Проверяем наличие пациента с таким идентификатором.
    SELECT COUNT(*)
      INTO v_valid_people
      FROM DUAL
     WHERE EXISTS (SELECT NULL
                     FROM tvac_map
                    WHERE tvac_map.fk_people = p_fk_people);

    -- Проверяем наличие шаблона у выбранного плана
    SELECT COUNT(*)
      INTO v_valid_plan
      FROM DUAL
     WHERE EXISTS (SELECT NULL
                     FROM tvac_plan_pattern
                    WHERE tvac_plan_pattern.fk_planning = p_fk_planning);

    IF (v_valid_plan > 0) AND (v_valid_people > 0) THEN

      -- Нет смысла формировать план, если есть постоянный отвод
      -- или индивидуальный план для указанной инфекции уже сформирован.
      IF PKG_VACCIN.IS_NOT_CANCEL_PEOPLE(p_fk_people) THEN

        -- Получаем пол пациента
        SELECT fp_sex
          INTO v_people_sex
          FROM tpeoples
         WHERE fk_id = p_fk_people;

        -- Замечательно, теперь бежим по шаблону и формируем
        -- индивидуальный план.
        FOR cur_pattern IN (
            SELECT tvac_planning.fk_infection,
                   tvac_plan_pattern.fn_period,
                   tvac_plan_pattern.fk_period_type,
                   tvac_plan_pattern.fn_kratn,
                   tvac_plan_pattern.fn_sex,
                   tvac_plan_pattern.fk_condition
              FROM tvac_plan_pattern, tvac_planning
             WHERE tvac_plan_pattern.fk_planning = tvac_planning.fk_id
               AND tvac_planning.fk_id = p_fk_planning) LOOP

          -- Прививка может быть назначена только представителеям
          -- одного пола, если указан определенный пол.
          IF (v_people_sex = cur_pattern.fn_sex) OR
              (cur_pattern.fn_sex = c_all_peoples) THEN

            -- В соответствии с параметрами шаблона планируем дату.
            v_plan_date := PKG_VACCIN.CREATE_PLAN_DATE(
                p_fk_people, p_fk_planning,
                cur_pattern.fn_kratn, cur_pattern.fn_period,
                cur_pattern.fk_period_type);

            -- Формируем условия выполнения планируемой вакцинации.
            v_not_exist_prev_vaccin := 0;
            v_not_vaccin := 0;

            IF c_not_exist_prev_vaccin = cur_pattern.fk_condition THEN
              v_not_exist_prev_vaccin := 1;
            ELSE
              IF c_not_vaccin = cur_pattern.fk_condition THEN
                v_not_vaccin := 1;
              END IF;
            END IF;

            v_vaccin_period := 0;
            IF c_fk_from_last_vaccin = cur_pattern.fk_period_type THEN
              v_vaccin_period := cur_pattern.fn_period;
            END IF;

            -- Формируем индивидуальный план.
            v_add_result := PKG_VACCIN.IS_ADD_VACCIN_PRIVATE_PLAN(
                p_fk_people, cur_pattern.fk_infection,
                v_plan_date, cur_pattern.fn_kratn, v_not_vaccin,
                v_not_exist_prev_vaccin, v_vaccin_period, 0);

            -- Если хотя бы один пункт плана был добавлен,
            -- значит план считается сформирован.
            IF v_add_result THEN
              v_result := v_add_result;
            END IF;
          END IF; -- IF (v_people_sex = cur_pattern.fn_sex) OR
                  --    (cur_pattern.fn_sex = c_all_peoples)
        END LOOP;
      END IF;  -- IF PKG_VACCIN.IS_NOT_CANCEL_PEOPLE(p_fk_people)
    END IF;  --  IF (v_valid_plan > 0) AND (v_valid_people > 0)

    RETURN v_result;

  END IS_CREATE_PRIVATE_PLAN;

------------------------------------------------------------------------------
-- Предназначена для формирования индивидуального плана
-- согласно национального календаря.
------------------------------------------------------------------------------

  FUNCTION IS_VACCIN_PLAN_NAT_CALENDAR(
    p_fk_people      IN INTEGER,
    p_fk_sotr        IN INTEGER
    ) RETURN BOOLEAN
  AS
    c_all_peoples           CONSTANT NUMBER := 2;
    c_plan_source           CONSTANT NUMBER := 2;
    c_add_plan_for_calendar CONSTANT NUMBER := 16;
    v_result                BOOLEAN;
    v_birthday              DATE;
    v_people_sex            NUMBER;
    v_vac_people            NUMBER;
    v_not_exist_prev_vaccin NUMBER;
    v_add_result            BOOLEAN;

  BEGIN
    v_result := FALSE;

    USER_LOG.PKG_LOG_MNG.BEGIN_LOG_GROUP_ACTION(
        c_add_plan_for_calendar, c_plan_source);

    -- Нет смысла формировать план, если есть постоянный отвод.
    IF IS_NOT_CANCEL_PEOPLE(p_fk_people) THEN

      -- Получаем пол пациента
      SELECT fp_sex, fd_rojd
        INTO v_people_sex, v_birthday
        FROM tpeoples
       WHERE fk_id = p_fk_people;

      FOR nat_calendar_cur IN (
          SELECT fk_infection, kratn, plan_date, sex,
                 vaccin_period, not_vaccin
            FROM (SELECT 1 as fk_infection, -- Гепатит В
                         10 as kratn,
                         v_birthday + 1 as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 9 as fk_infection, -- Туберкулез
                         10 as kratn,
                         v_birthday + 7 as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 1 as fk_infection, -- Гепатит В
                         12 as kratn,
                         ADD_MONTHS(v_birthday, 1) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  --
                  SELECT 2 as fk_infection, -- Дифтерия
                         10 as kratn,
                         ADD_MONTHS(v_birthday, (1*3)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 3 as fk_infection, -- Коклюш
                         10 as kratn,
                         ADD_MONTHS(v_birthday, (1*3)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 8 as fk_infection, -- Столбняк
                         10 as kratn,
                         ADD_MONTHS(v_birthday, (1*3)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 7 as fk_infection, -- Полиомиелит
                         10 as kratn,
                         ADD_MONTHS(v_birthday, (1*3)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  --
                  SELECT 2 as fk_infection, -- Дифтерия
                         12 as kratn,
                         ADD_MONTHS(v_birthday, (1*5)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 3 as fk_infection, -- Коклюш
                         12 as kratn,
                         ADD_MONTHS(v_birthday, (1*5)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 8 as fk_infection, -- Столбняк
                         12 as kratn,
                         ADD_MONTHS(v_birthday, (1*5)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 7 as fk_infection, -- Полиомиелит
                         12 as kratn,
                         ADD_MONTHS(v_birthday, (1*5)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  --
                  SELECT 2 as fk_infection, -- Дифтерия
                         13 as kratn,
                         ADD_MONTHS(v_birthday, (1*6)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 3 as fk_infection, -- Коклюш
                         13 as kratn,
                         ADD_MONTHS(v_birthday, (1*6)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 8 as fk_infection, -- Столбняк
                         13 as kratn,
                         ADD_MONTHS(v_birthday, (1*6)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 7 as fk_infection, -- Полиомиелит
                         13 as kratn,
                         ADD_MONTHS(v_birthday, (1*6)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 1 as fk_infection, -- Гепатит В
                         13 as kratn,
                         ADD_MONTHS(v_birthday, (1*6)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  --
                  SELECT 4 as fk_infection, -- Корь
                         10 as kratn,
                         ADD_MONTHS(v_birthday, (1*12)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 5 as fk_infection, -- Краснуха
                         10 as kratn,
                         ADD_MONTHS(v_birthday, (1*12)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 6 as fk_infection, -- Паротит
                         10 as kratn,
                         ADD_MONTHS(v_birthday, (1*12)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  --
                  SELECT 2 as fk_infection, -- Дифтерия
                         20 as kratn,
                         ADD_MONTHS(v_birthday, (1*18)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 3 as fk_infection, -- Коклюш
                         20 as kratn,
                         ADD_MONTHS(v_birthday, (1*18)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 8 as fk_infection, -- Столбняк
                         20 as kratn,
                         ADD_MONTHS(v_birthday, (1*18)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 7 as fk_infection, -- Полиомиелит
                         20 as kratn,
                         ADD_MONTHS(v_birthday, (1*18)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  --
                  SELECT 7 as fk_infection, -- Полиомиелит
                         22 as kratn,
                         ADD_MONTHS(v_birthday, (1*20)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  --
                  SELECT 4 as fk_infection, -- Корь
                         20 as kratn,
                         ADD_MONTHS(v_birthday, (6*12)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 5 as fk_infection, -- Краснуха
                         20 as kratn,
                         ADD_MONTHS(v_birthday, (6*12)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 6 as fk_infection, -- Паротит
                         20 as kratn,
                         ADD_MONTHS(v_birthday, (6*12)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  --
                  SELECT 9 as fk_infection, -- Туберкулез
                         20 as kratn,
                         ADD_MONTHS(v_birthday, (7*12)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 2 as fk_infection, -- Дифтерия
                         30 as kratn,
                         ADD_MONTHS(v_birthday, (7*12)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 8 as fk_infection, -- Столбняк
                         30 as kratn,
                         ADD_MONTHS(v_birthday, (7*12)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  --
                  SELECT 5 as fk_infection, -- Краснуха
                         20 as kratn,
                         ADD_MONTHS(v_birthday, (13*12)) as plan_date,
                         0 as sex,
                         0 as vaccin_period,
                         1 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 1 as fk_infection, -- Гепатит В
                         10 as kratn,
                         ADD_MONTHS(v_birthday, (13*12)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         1 as not_vaccin
                    FROM DUAL UNION ALL
                  --
                  SELECT 2 as fk_infection, -- Дифтерия
                         40 as kratn,
                         ADD_MONTHS(v_birthday, (14*12)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 8 as fk_infection, -- Столбняк
                         40 as kratn,
                         ADD_MONTHS(v_birthday, (14*12)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 9 as fk_infection, -- Туберкулез
                         20 as kratn,
                         ADD_MONTHS(v_birthday, (14*12)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         1 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 7 as fk_infection, -- Полиомиелит
                         40 as kratn,
                         ADD_MONTHS(v_birthday, (14*12)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL)
           WHERE (plan_date >= sysdate)
             AND ((c_all_peoples = sex)
              OR (sex = v_people_sex))) LOOP

        v_not_exist_prev_vaccin := 0;

        -- Формируем индивидуальный план.
        v_add_result := PKG_VACCIN.IS_ADD_VACCIN_PRIVATE_PLAN(
            p_fk_people, nat_calendar_cur.fk_infection,
            nat_calendar_cur.plan_date, nat_calendar_cur.kratn,
            nat_calendar_cur.not_vaccin, v_not_exist_prev_vaccin,
            nat_calendar_cur.vaccin_period, 0);

        -- Если хотя бы один пункт плана был добавлен,
        -- значит план считается сформирован.
        IF v_add_result THEN
          v_result := v_add_result;
        END IF;
      END LOOP;
    END IF;

    USER_LOG.PKG_LOG_MNG.END_LOG_GROUP_ACTION;

    RETURN v_result;

  END IS_VACCIN_PLAN_NAT_CALENDAR;

------------------------------------------------------------------------------
-- На базе шаблона формирует прививку для индивидуального плана пациента
------------------------------------------------------------------------------

  FUNCTION IS_CREATE_VACCIN_PLAN(
    p_fk_people      IN INTEGER,
    p_fk_infection   IN INTEGER,
    p_fk_sotr        IN INTEGER,
    p_fd_plan_date   IN DATE,
    p_fn_kratn       IN INTEGER) RETURN BOOLEAN
  AS
    c_not_exist_prev_vaccin CONSTANT NUMBER := 2;
    c_not_vaccin            CONSTANT NUMBER := 1;
    v_result                BOOLEAN;
    v_valid                 NUMBER;
    v_vaccin_period         NUMBER;
    v_not_vaccin            NUMBER;
    v_not_exist_prev_vaccin NUMBER;

  BEGIN
    v_result := FALSE;

    -- Проверяем наличие пациента с таким идентификатором.
    SELECT COUNT(*)
      INTO v_valid
      FROM DUAL
     WHERE EXISTS (SELECT NULL
                     FROM tvac_map
                    WHERE tvac_map.fk_people = p_fk_people);

    IF v_valid > 0 THEN
      -- Нет смысла формировать план прививки, если есть постоянный отвод
      IF PKG_VACCIN.IS_NOT_CANCEL_PEOPLE(p_fk_people) THEN

        -- Формируем условия выполнения планируемой вакцинации.
        v_not_exist_prev_vaccin := 0;
        v_not_vaccin := 0;
        v_vaccin_period := 0;

        -- Формируем индивидуальный план.
        v_result := PKG_VACCIN.IS_ADD_VACCIN_PRIVATE_PLAN(
            p_fk_people, p_fk_infection,
            p_fd_plan_date, p_fn_kratn, v_not_vaccin,
            v_not_exist_prev_vaccin, v_vaccin_period, p_fk_sotr);
      END IF;
    END IF;

    RETURN v_result;

  END IS_CREATE_VACCIN_PLAN;

------------------------------------------------------------------------------
-- Предназначена для перемещение сроков плана при отводе.
-- (Должна выполнятся в теле триггера)
------------------------------------------------------------------------------

  PROCEDURE SHIFT_PRIVATE_PLAN(
    p_fk_people      IN NUMBER,
    p_fk_cancel_type IN NUMBER,
    p_fd_begin       IN DATE,
    p_fd_end         IN DATE)
  AS
    c_cancel_status   CONSTANT NUMBER := 3;
    c_plan_status     CONSTANT NUMBER := 1;
    v_permanent       NUMBER;
    v_begin_plan_date DATE;

  BEGIN
    -- Определяем тип отвода
    SELECT COUNT(*)
      INTO v_permanent
      FROM DUAL
     WHERE EXISTS (SELECT NULL
                     FROM tvaccancel_type
                    WHERE tvaccancel_type.fk_id = p_fk_cancel_type
                      AND tvaccancel_type.fn_permanent > 0);

    IF v_permanent > 0 THEN
      -- Пациенту добавили постоянный отвод
      UPDATE tvac_private_plan
         SET tvac_private_plan.fk_status = c_cancel_status
       WHERE tvac_private_plan.fk_people = p_fk_people
         AND tvac_private_plan.fk_status = c_plan_status;
    ELSE
      -- Нужна отправная точка получения смещения при
      -- сдвиге планируемых прививок
      SELECT MIN(fd_plan_date)
        INTO v_begin_plan_date
        FROM tvac_private_plan
       WHERE fk_people = p_fk_people
         AND fk_status = c_plan_status
         AND fd_plan_date > p_fd_begin
         AND fd_plan_date <= p_fd_end;

      v_begin_plan_date := v_begin_plan_date + 1;

      -- Передвигаем все запланированные прививки на дату, ближайшую к
      -- конечной дате отвода.
      UPDATE tvac_private_plan
         SET fd_plan_date = p_fd_end + (v_begin_plan_date - fd_plan_date)
       WHERE fk_people = p_fk_people
         AND fk_status = c_plan_status
         AND fd_plan_date > p_fd_begin
         AND fd_plan_date <= p_fd_end;
    END IF;
  END SHIFT_PRIVATE_PLAN;

------------------------------------------------------------------------------
-- Предназначена для удаления планируемой прививки если пациент переболел
-- заболеванием, против которого планировалась оная.
-- (Должна выполнятся в теле триггера при добавлении заболевания)
------------------------------------------------------------------------------

  PROCEDURE DELETE_VAC_PLAN(
    p_fk_people      IN NUMBER,
    p_fk_infection   IN NUMBER,
    p_fd_end         IN DATE)
  AS
    c_plan_status CONSTANT NUMBER := 1;
    v_year_effect NUMBER;
    v_end_date    DATE;

  BEGIN
    SELECT fn_year_effect
      INTO v_year_effect
      FROM tinfection
     WHERE tinfection.fk_id = p_fk_infection;

    IF v_year_effect > 0 then
      v_end_date := ADD_MONTHS(p_fd_end, v_year_effect * 12);

      -- Удаляем запланированные прививки, попадаемые в карантинный срок.
      -- Удаляем прививки, не зависящие от периода вакцинации.
      DELETE FROM tvac_private_plan
            WHERE fk_people = p_fk_people
              AND fk_infection = p_fk_infection
              AND fn_vaccin_period = 0
              AND fk_status = c_plan_status
              AND fd_plan_date <= v_end_date;

      -- Добавляем запланированные прививки, зависящие от периода
      -- вакцинации
      INSERT ALL
        INTO tvac_private_plan
             (fk_infection, fk_people, fk_status,
             fd_plan_date, fn_kratn,
             fn_not_vaccin, fn_not_exist_prev_vaccin, fn_vaccin_period)
      VALUES (fk_infection, fk_people, c_plan_status,
             ADD_MONTHS(v_end_date, fn_vaccin_period), fn_kratn,
             fn_not_vaccin, fn_not_exist_prev_vaccin, fn_vaccin_period)
      SELECT fk_infection, fk_people, fn_kratn, fn_not_vaccin,
             fn_not_exist_prev_vaccin, fn_vaccin_period
        FROM tvac_private_plan
       WHERE fk_people = p_fk_people
         AND fk_status = c_plan_status
         AND fk_infection = p_fk_infection
         AND fn_vaccin_period > 0
         AND fd_plan_date <= v_end_date;

      -- Удаляем запланированные прививки, попадаемые в карантинный срок.
      -- Удаляем прививки, зависящие от периода вакцинации.
      DELETE FROM tvac_private_plan
            WHERE fk_people = p_fk_people
              AND fk_infection = p_fk_infection
              AND fn_vaccin_period > 0
              AND fk_status = c_plan_status
              AND fd_plan_date <= v_end_date;
    END IF;
  END DELETE_VAC_PLAN;

------------------------------------------------------------------------------
-- Предназначена для восстановления индивидуального плана
-- при удалении прививки.
------------------------------------------------------------------------------

  PROCEDURE RESTORE_PRIVATE_PLAN(
      p_fk_people    IN NUMBER,
      p_fk_infection IN NUMBER,
      p_fn_kratn     IN NUMBER)
  AS
    c_plan_status   CONSTANT NUMBER := 1;
    c_exec_status   CONSTANT NUMBER := 2;
    v_valid_plan    NUMBER;

  BEGIN

    -- Проверяем, есть ли у пациента индивидуальный план
    SELECT COUNT(*)
      INTO v_valid_plan
      FROM DUAL
     WHERE EXISTS (SELECT NULL
                     FROM tvac_private_plan
                    WHERE tvac_private_plan.fk_infection = p_fk_infection
                      AND tvac_private_plan.fk_people = p_fk_people
                      AND tvac_private_plan.fn_kratn = p_fn_kratn);

    IF v_valid_plan > 0 THEN
      -- Прививка удалена - возвращаем планируемую прививку.
      UPDATE tvac_private_plan
         SET fk_status = c_plan_status,
             fk_vac_people = NULL
       WHERE fn_kratn = p_fn_kratn
         AND fk_people = p_fk_people
         AND fk_status = c_exec_status
         AND fk_infection = p_fk_infection;
    END IF;
  END RESTORE_PRIVATE_PLAN;

------------------------------------------------------------------------------
-- Предназначена для модификации индивидуального плана
-- при его выполнении.
------------------------------------------------------------------------------

  PROCEDURE EXEC_PRIVATE_PLAN(
    p_fk_tvac_people IN NUMBER)
  AS
    c_plan_status   CONSTANT NUMBER := 1;
    c_exec_status   CONSTANT NUMBER := 2;
    v_valid_plan    NUMBER;

  BEGIN
    FOR cur_vac_people IN (SELECT tvac_people.fk_people,
                                  tvac_kratn.fk_infection,
                                  tvac_kratn.fn_kratn
                             FROM tvac_people, tvac_kratn
                            WHERE tvac_people.fk_id = tvac_kratn.fk_vac_people
                              AND tvac_people.fk_id = p_fk_tvac_people) LOOP

      -- Проверяем, есть ли у пациента индивидуальный план
      SELECT COUNT(*)
        INTO v_valid_plan
        FROM DUAL
       WHERE EXISTS (SELECT NULL
                       FROM tvac_private_plan
                      WHERE fk_infection = cur_vac_people.fk_infection
                        AND fk_people = cur_vac_people.fk_people);

      IF v_valid_plan > 0 THEN
        -- Планируемую прививку с условием
        -- "Ранее не прививались", можно считать выполненой.
        DELETE FROM tvac_private_plan
         WHERE fn_kratn >= cur_vac_people.fn_kratn
           AND fk_people = cur_vac_people.fk_people
           AND fk_status = c_plan_status
           AND fk_infection = cur_vac_people.fk_infection
           AND fn_not_vaccin > 0;

        -- Получаем даты планируемых прививок, которые нужно пометить
        -- как выполненые. Необходима для поиска следующей за выполненной.
        FOR cur_plan IN (
            SELECT fd_plan_date, fk_infection
              FROM tvac_private_plan
             WHERE fn_kratn = cur_vac_people.fn_kratn
               AND fk_people = cur_vac_people.fk_people
               AND fk_status = c_plan_status
               AND fk_infection = cur_vac_people.fk_infection) LOOP

          -- Если последующие, за выполненной, планируемые прививки
          -- имеет условие "Не прививались в предыдущий период", то
          -- их можно считать выполнеными.
          DELETE FROM tvac_private_plan
           WHERE fk_id IN (SELECT fk_id
                             FROM tvac_private_plan
                            WHERE fn_kratn > cur_vac_people.fn_kratn
                              AND fk_people = cur_vac_people.fk_people
                              AND fk_status = c_plan_status
                              AND fk_infection = cur_plan.fk_infection
                              AND fd_plan_date > cur_plan.fd_plan_date
                              AND fn_not_exist_prev_vaccin > 0);
        END LOOP;

        -- Проверяем, если период планируемой прививки вычисляется от даты
        -- привики, то необходимо добавить в индивидуальный план
        -- новую запланируемую привику.
        INSERT ALL
          INTO tvac_private_plan
               (fk_infection, fk_people, fk_status,
               fd_plan_date, fn_kratn,
               fn_not_vaccin, fn_not_exist_prev_vaccin, fn_vaccin_period)
        VALUES (fk_infection, fk_people, c_plan_status,
               ADD_MONTHS(SYSDATE, fn_vaccin_period), fn_kratn,
               fn_not_vaccin, fn_not_exist_prev_vaccin, fn_vaccin_period)
        SELECT fk_infection, fk_people, fn_kratn, fn_not_vaccin,
               fn_not_exist_prev_vaccin, fn_vaccin_period
          FROM tvac_private_plan
         WHERE fn_kratn = cur_vac_people.fn_kratn
           AND fk_people = cur_vac_people.fk_people
           AND fk_status = c_plan_status
           AND fk_infection = cur_vac_people.fk_infection
           AND  fn_vaccin_period > 0;

        -- Прививка выполнена - делаем отметку в плане.
        UPDATE tvac_private_plan
           SET fk_status = c_exec_status,
               fk_vac_people = p_fk_tvac_people
         WHERE fn_kratn = cur_vac_people.fn_kratn
           AND fk_people = cur_vac_people.fk_people
           AND fk_status = c_plan_status
           AND fk_infection = cur_vac_people.fk_infection;
      END IF; -- IF v_valid_plan > 0 THEN
    END LOOP;
  END EXEC_PRIVATE_PLAN;

------------------------------------------------------------------------------
-- Предназначена для формирование списка лет для combobox
------------------------------------------------------------------------------

  FUNCTION YEARS_LIST RETURN YEARS_TABLE_TYPE parallel_enable pipelined
  AS
    v_lower_bound  NUMBER;
    v_higher_bound NUMBER;
    v_pos          NUMBER;
    v_years_list   YEARS_RECORD_TYPE;

  BEGIN
    v_lower_bound := TO_NUMBER(EXTRACT(YEAR FROM ADD_MONTHS(SYSDATE, -12*25)));
    v_higher_bound := TO_NUMBER(EXTRACT(YEAR FROM ADD_MONTHS(SYSDATE, 12*25)));

    FOR v_pos IN v_lower_bound .. v_higher_bound LOOP

      v_years_list.id := v_pos;
      v_years_list.description := v_pos;

      pipe row (v_years_list);
    END LOOP;

    RETURN;
  END YEARS_LIST;

------------------------------------------------------------------------------
-- Предназначена для формирования индивидуального плана для группы
-- пациентов.
------------------------------------------------------------------------------

  FUNCTION IS_GROUP_PLAN_NAT_CALENDAR(
      p_fk_sotr IN INTEGER) RETURN BOOLEAN
  AS
    v_pos        NUMBER;
    v_result     BOOLEAN;
    v_add_result BOOLEAN;

  BEGIN
    v_result := FALSE;
    v_pos := v_peoples_collection.FIRST;

    LOOP
      EXIT WHEN v_pos IS NULL;

      v_add_result := IS_VACCIN_PLAN_NAT_CALENDAR(
          v_peoples_collection(v_pos), p_fk_sotr);

      IF v_add_result THEN
        v_result := v_add_result;
      END IF;

      v_pos := v_peoples_collection.NEXT(v_pos);
    END LOOP;

    RETURN v_result;
  END IS_GROUP_PLAN_NAT_CALENDAR;

------------------------------------------------------------------------------
-- Возвращает кратность по конткерной вакцине
-- сделана специально для APEX (вставляется перевод строк после каждой кратности)
--------------------------------------------------------------------------------
-- Возвращает кратность по конткерной вакцине
-- сделана специально для APEX (вставляется перевод строк после каждой кратности)
FUNCTION apex_get_vac_kratn (p_fk_vac_people IN INTEGER)
   RETURN VARCHAR2
AS
   v_ret   VARCHAR2 (100);

   CURSOR vackratn_cur (ip_fk_vac_people IN INTEGER)
   IS
      SELECT tinfection.fc_name || ' (' || pkg_vaccin.get_kratname (tvac_kratn.fn_kratn)
             || ')' AS tyr
        FROM tvac_kratn, tinfection
       WHERE tinfection.fk_id = tvac_kratn.fk_infection
         AND tvac_kratn.fk_vac_people = ip_fk_vac_people;
   vackratn_rec vackratn_cur%rowtype;
BEGIN
  FOR vackratn_rec In vackratn_cur(p_fk_vac_people) LOOP
    if v_ret is not null then
      v_ret := v_ret ||'<br>';
    end if;
    v_ret :=v_ret ||vackratn_rec.tyr ;

  END LOOP;

  RETURN v_ret;
END apex_get_vac_kratn;
------------------------------------------------------------------------------
FUNCTION get_sql_peoples_by_age (p_sex IN INTEGER, p_period IN INTEGER)
   RETURN VARCHAR2
AS
   v_sql    VARCHAR2 (4000);
   v_sql1   VARCHAR2 (100);
BEGIN
   v_sql := ' SELECT null, Extract (year from a.fd_rojd) as yyyy,Count(*) as ';

   IF p_sex = 0
   THEN
      v_sql := v_sql || '"Женщины"';
      v_sql1 := ' and a.fp_sex=0';
   ELSIF p_sex = 1
   THEN
      v_sql := v_sql || '"Мужчины"';
      v_sql1 := ' and a.fp_sex=1';
   ELSE
      v_sql := v_sql || '"Все"';
   END IF;

   v_sql := v_sql || CHR (13)||'  FROM tpeoples a, tvac_map';
   v_sql := v_sql ||CHR (13)|| '  WHERE a.fk_id = tvac_map.fk_people AND tvac_map.fl_del <> 1';
   v_sql := v_sql || CHR (13);
   v_sql := v_sql || '  and a.fd_rojd <= sysdate';

   IF v_sql1 <> ''
   THEN
      v_sql := v_sql || CHR (13) || v_sql1;
   END IF;

   -- период
   v_sql :=
      v_sql || CHR (13)
      || ('  and a.fd_rojd >= Trunc(sysdate - 365.25*' || TO_CHAR (p_period) || ')');
   v_sql := v_sql || CHR (13) || ' group by a.fp_sex,Extract (year from a.fd_rojd)';
   v_sql := v_sql || CHR (13) || 'order by 2';
   RETURN v_sql;
END get_sql_peoples_by_age;

END;
/

SHOW ERRORS;


