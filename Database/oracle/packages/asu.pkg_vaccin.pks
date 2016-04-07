DROP PACKAGE ASU.PKG_VACCIN
/

--
-- PKG_VACCIN  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TPEOPLES (Table)
--
CREATE OR REPLACE PACKAGE ASU."PKG_VACCIN" 
IS
-- Пакет для работы с вакцинацией
-- %Author Zhukov


  TYPE YEARS_RECORD_TYPE IS RECORD (
     id          NUMBER,
     description NUMBER);

  TYPE YEARS_TABLE_TYPE IS TABLE OF YEARS_RECORD_TYPE;

   -- Сохраняет информацию о конкретной привике
-- %param p_fk_prep_store препарат на складе
-- %param p_fn количество
-- %param p_type тип операции 1 приход; 2-расход; 3-прививка; 4- Списано; 5- Перемещение на другойй склад
-- %param p_fd_create дата операции
   PROCEDURE storetransaction (
      p_fk_prep_store   IN   INTEGER,
      p_fn              IN   NUMBER,
      p_type            IN   INTEGER,
      p_fk_sotr         IN   INTEGER,
      p_fd_create       IN   DATE,
      p_fc_rem          IN   VARCHAR2
   );

   FUNCTION get_sumvaccinbyoperation (
      p_fk_store   IN   INTEGER,
      p_fn_type    IN   INTEGER,
      p_fd_beg     IN   DATE,
      p_fd_end     IN   DATE,
      p_fk_prep    IN   INTEGER
   )
      RETURN NUMBER;

   FUNCTION get_reminderondate (
      p_fk_store   IN   INTEGER,
      p_fk_prep    IN   INTEGER,
      p_fd         IN   DATE
   )
      RETURN NUMBER;

   PROCEDURE cancel_store_transaction (
      p_fk_id_tvaccin_prep_store_log   IN   INTEGER
   );

--Возвращает название тура вакцинации
   FUNCTION get_kratname (p_kratn IN PLS_INTEGER)
      RETURN VARCHAR;
--Создает индивидуальный план прививок
   PROCEDURE create_plan (p_fk_people IN INTEGER);

/**  показывает возраст на определенную дату.
  Для плана и не только */
   FUNCTION show_age (p_rojd IN DATE, p_date IN DATE)
      RETURN VARCHAR2;

-- Возвращает кратность по конкретной вакцине - актуально когда вакцина против нескольких инфекций
   FUNCTION getkratnnamebyvaccin (p_fk_vac_people IN INTEGER)
      RETURN VARCHAR2;

-- Определяет участок по названию улицы и номера дома
-- %param p_street Название улицы. Если участок определить не удалось возвращает -1
-- %param pnum Номер дома
-- %return Возвращает ttherpoints.fk_id
   FUNCTION get_terpoint_fk_id (
      p_fk_otdel   IN   INTEGER,
      p_street     IN   VARCHAR2,
      pnum         IN   INTEGER
   )
      RETURN INTEGER;

-- добавляет инъекцию без складского учета
-- %param p_fk_people препарат
-- %param p_series серия
-- %param p_num номер
-- %param p_date дата
-- %param p_vrach_fio  врач назначивший,  текст, актулаьно если вносим станые данные о вакцинации
-- %param p_sotr_fio  ФИО сотрудника сделавшего вакцинацию
-- %param p_fk_sotr сотрудник, который делал вакцинацию
-- %param p_fk_lpy ссылка в каком ЛПУ делали вакцинацию
-- %param p_lpy  НАЗВАНИЕ ЛПУ,  авктуально если совсем в сотороннем ЛПУ была проведена инъекция
-- %param p_status статус
-- %param p_fn_kratn кратность
-- %param p_fk_input_type Способ введиня
-- %param p_fk_otdel отеделние
   FUNCTION add_inject_nostore (
      p_fk_people        IN   INTEGER,
      p_fk_vaccin_prep   IN   INTEGER,
      p_series           IN   VARCHAR,
      p_num              IN   NUMBER,
      p_date             IN   DATE,
      p_vrach_fio        IN   VARCHAR,
      p_fk_vrach         IN   INTEGER,
      p_sotr_fio         IN   VARCHAR,
      p_fk_sotr          IN   VARCHAR,
      p_fk_lpy           IN   INTEGER,
      p_lpy              IN   VARCHAR,
      p_status           IN   INTEGER,
      p_fn_kratn         IN   INTEGER,
      p_fk_input_type    IN   INTEGER,
      p_fk_otdel         IN   INTEGER
   )
      RETURN INTEGER;

   PROCEDURE edit_inject_nostore (
      p_fk_id            IN   INTEGER,
      p_fk_people        IN   INTEGER,
      p_fk_vaccin_prep   IN   INTEGER,                            -- препарат
      p_series           IN   VARCHAR,                               -- серия
      p_num              IN   NUMBER,                                -- номер
      p_date             IN   DATE,                                   -- дата
      p_vrach_fio        IN   VARCHAR,
      -- врач назначивший,  текст, актулаьно если вносим станые данные о вакцинации
      p_fk_vrach         IN   INTEGER,
      p_sotr_fio         IN   VARCHAR,
      -- ФИО сотрудника сделавшего вакцинацию
      p_fk_sotr          IN   VARCHAR, -- сотрудник, который делал вакцинацию
      p_fk_lpy           IN   INTEGER,
      -- ссылка в каком ЛПУ делали вакцинацию
      p_lpy              IN   VARCHAR,
      -- НАЗВАНИЕ ЛПУ,  авктуально если совсем в сотороннем ЛПУ была проведена инъекция
      p_status           IN   INTEGER,                              -- статус
      p_fn_kratn         IN   INTEGER,                           -- кратность
      p_fk_input_type    IN   INTEGER,                    --   Способ введиня
      p_fk_otdel         IN   INTEGER                            -- отеделние
   );

-- Возвращает код инфекции по переданному коду МКБ-10
-- %param p_fc_mkb10 КОД МКБ-10
-- %Return TINFECTION.FK_ID,
-- если подходящей инфекции не найдено, то  возвращает -1
   FUNCTION get_infectionby_mkb (p_fc_mkb10 IN VARCHAR)
      RETURN NUMBER;
  -- переносит данные из диагнов в перенесенные заболевания по вакцинации
  PROCEDURE update_tvac_sicness_from_ib;
-- Возвращает кратность по конткерной вакцине вместе с названием инфекции
-- использовать только когда небольшой ресультат

  FUNCTION get_vac_kratn (p_fk_vac_people IN INTEGER)
   RETURN VARCHAR2;
-- Возвращает MAX(TPEOPLES.FK_ID) для ледей с переданными параметрами
-- использоуется из-зи того что в базе есть дубликаты людей
-- %param p_FAM  TPEOPLES.FC_FAM
-- %param p_IM TPEOPLES.FC_IM
-- %param p_OTCH TPEOPLES.FC_OTCH
-- %param p_DATE_ROJD TPEOPLES.FD_ROJD
-- %param p_SEX TPEOPLES.FP_SEX
-- %Return MAX(TPEOPLES.FK_ID)
-- %Author: Zhukov
  FUNCTION GET_PEOPLE_FK_ID_MAX(p_FAM IN VARCHAR2,p_IM IN VARCHAR2, p_OTCH IN VARCHAR2,
    p_DATE_ROJD IN DATE, P_SEX IN TPEOPLES.fp_sex%TYPE )
RETURN NUMBER;

-- Обнавляет личные данные прививочной карты пользователя
-- %param p_fk_id id пользователя
-- %param p_fk_country_id tadress.fk_countryid
-- %param p_fk_region_id tadress.fk_regionid
-- %param p_fk_raion_id tadress.fk_raionid
-- %param p_fk_town_id tadress.fk_townid
-- %param p_fk_intown_id tadress.fk_intownid
-- %param p_fk_street_id tadress.fk_streetid
-- %param p_fc_house tadress.fc_house
-- %param p_fc_korpus tadress.fc_korpus
-- %param p_fc_flat tadress.fc_kvartira
-- %param p_fk_area tvac_map.fk_area
-- %param p_fk_org_lpu tvac_map.fk_organization_lpu
-- %param p_fk_dolgnost tpeoples.fk_dolgnost
-- %param p_org_date tvac_map.fd_organization
-- %param p_fk_org tvac_map.fk_organization
-- %param p_fd_beg tvac_map.fd_beg
-- %param p_fd_end tvac_map.fd_end
-- %param p_fl_del tvac_map.fl_del
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
  );

-- Заводим новую прививочную карту для пользователя
-- %param p_fk_id id пользователя
-- %param p_fk_country_id tadress.fk_countryid
-- %param p_fk_region_id tadress.fk_regionid
-- %param p_fk_raion_id tadress.fk_raionid
-- %param p_fk_town_id tadress.fk_townid
-- %param p_fk_intown_id tadress.fk_intownid
-- %param p_fk_street_id tadress.fk_streetid
-- %param p_fc_house tadress.fc_house
-- %param p_fc_korpus tadress.fc_korpus
-- %param p_fc_flat tadress.fc_kvartira
-- %param p_fk_area tvac_map.fk_area
-- %param p_fk_org_lpu tvac_map.fk_organization_lpu
-- %param p_fk_dolgnost tpeoples.fk_dolgnost
-- %param p_org_date tvac_map.fd_organization
-- %param p_fk_org tvac_map.fk_organization
-- %param p_fd_beg tvac_map.fd_beg
-- %param p_fd_end tvac_map.fd_end

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
  );

-- Удаляем прививочную карту пользователя
-- %param p_fk_id id пользователя

  PROCEDURE DELETE_PERSONAL_DATA(
     p_fk_id           IN INTEGER
  );

-- Добавляет новую пробу.
-- %param p_fd_create       tvac_peoples_test.fd_create
-- %param p_fd_reg          tvac_peoples_test.fd_reg
-- %param p_fk_vac_test_res tvac_peoples_test.fk_vac_test_res,
-- %param p_fc_reaction     tvac_peoples_test.fc_reaction
-- %param p_fk_people       tvac_peoples_test.fk_people
-- %param p_fk_vac_test     tvac_peoples_test.fk_vac_test
-- %param p_fk_vrach        tvac_peoples_test.fk_vrach
-- %param p_fc_vrach        tvac_peoples_test.fc_vrach
-- %param p_fk_sotr         tvac_peoples_test.fk_sotr
-- %param p_fc_sotr         tvac_peoples_test.fc_sotr
-- %param p_fk_lpy          tvac_peoples_test.fk_lpy
-- %param p_fc_lpy          tvac_peoples_test.fc_lpy
-- %param p_fn_dose         tvac_peoples_test.fn_dose
-- %param p_fk_measure_dose tvac_peoples_test.fk_measure_dose

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
  );

-- Обнавляем результаты пробы.
-- %param p_fk_id           tvac_peoples_test.fk_id
-- %param p_fd_create       tvac_peoples_test.fd_create
-- %param p_fd_reg          tvac_peoples_test.fd_reg
-- %param p_fk_vac_test_res tvac_peoples_test.fk_vac_test_res,
-- %param p_fc_reaction     tvac_peoples_test.fc_reaction
-- %param p_fk_people       tvac_peoples_test.fk_people
-- %param p_fk_vac_test     tvac_peoples_test.fk_vac_test
-- %param p_fk_vrach        tvac_peoples_test.fk_vrach
-- %param p_fc_vrach        tvac_peoples_test.fc_vrach
-- %param p_fk_sotr         tvac_peoples_test.fk_sotr
-- %param p_fc_sotr         tvac_peoples_test.fc_sotr
-- %param p_fk_lpy          tvac_peoples_test.fk_lpy
-- %param p_fc_lpy          tvac_peoples_test.fc_lpy
-- %param p_fn_dose         tvac_peoples_test.fn_dose
-- %param p_fk_measure_dose tvac_peoples_test.fk_measure_dose

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
  );

-- Удаление пробы.
-- %param p_fk_id           tvac_peoples_test.fk_id

  PROCEDURE DELETE_TEST_DATA(
    p_fk_id           IN INTEGER
  );
-- Возвращает Фамилию, Имя, Отчество сотрудника
-- %param p_fk_id           login.tsotr

  FUNCTION FIND_EMPL_NAME_BY_ID(p_fk_id IN INTEGER)
    RETURN VARCHAR2;
-- Возвращает следующий тур вакцинации
-- %param p_fk_people       tvac_people.fk_id
-- %param p_fk_infection    tvaccin_prep_infection.fk_vaccin_infection

  FUNCTION NEXT_VACINATION_ROUND(
    p_fk_people    IN INTEGER,
    p_fk_infection IN INTEGER
  ) RETURN NUMBER;

-- Возвращает текущий тур вакцинации
-- %param p_fk_people       tvac_people.fk_people
-- %param p_fk_infection    tvaccin_prep_infection.fk_vaccin_infection

  FUNCTION CURRENT_VACINATION_ROUND(
    p_fk_vac_people IN INTEGER,
    p_fk_infection IN INTEGER
  ) RETURN NUMBER;

-- Получаем Id Лечебно-профилактического учреждения
  FUNCTION LPY_ID_DEFAULT RETURN INTEGER;

-- Объединение отдельного пациента
-- %param p_united_peoples_id      tpeoples.fk_id,
--                                 id пациента к которому объединяем.
-- %param p_connectable_peoples_id tpeoples.fk_id,
--                                 id пациента которого объединяем.
-- %param p_cnt_cancel             для статистики
-- %param p_cnt_tvac_people        для статистики
-- %param p_cnt_vac_del            для статистики
-- %param p_cnt_map_del            для статистики

  PROCEDURE MERGEING_PEOPLE(
    p_united_id       IN INTEGER,
    p_connectable_id  IN INTEGER,
    p_cnt_cancel      IN OUT INTEGER,
    p_cnt_tvac_people IN OUT INTEGER,
    p_cnt_vac_del     IN OUT INTEGER,
    p_cnt_map_del     IN OUT INTEGER);

-- Поиск и объединение людей с одинаковыми
-- фамилиями, именами, отчествами, годами рождения и полом.

  PROCEDURE MERGER_DUPLICATE;

-- Проверяет корректность вакцинации
-- %param p_age_pos      индекс, по которому определяется возраст детей
-- %param p_kratn_pos    индекс, по которому определяется кратность вакцинации
-- %param p_infec_pos    индекс, по которому определяется инфекция
-- %param p_kratn_count  Размерность массива,
--                      содержащего кратности вакцинации для инфекции

  FUNCTION IS_VALID_VACCINATION(
    p_age_pos     IN INTEGER,
    p_kratn_pos   IN INTEGER,
    p_infec_pos   IN INTEGER,
    p_kratn_count IN INTEGER
  ) RETURN BOOLEAN;

-- Возвращает тур вакцинации
-- %param p_fk_people      tvac_people.fk_id
-- %param p_fk_vac_people  tvac_people.fk_people
-- %param p_fk_infection   tvaccin_prep_infection.fk_vaccin_infection
-- %param p_fk_id_new_prep tvac_people.fk_vaccin_prep
-- %param p_fk_id_cur_prep tvac_people.fk_vaccin_prep

  FUNCTION VACINATION_ROUND(
    p_fk_people      IN INTEGER,
    p_fk_vac_people  IN INTEGER,
    p_fk_infection   IN INTEGER,
    p_fk_id_new_prep IN INTEGER,
    p_fk_id_cur_prep IN INTEGER
  ) RETURN NUMBER;

-- Если пациент имеет постоянный отвод,
-- то нет смысла для него формировать план прививок.
-- %param p_fk_people      tpeoples.fk_id

  FUNCTION IS_NOT_CANCEL_PEOPLE(
    p_fk_people      IN INTEGER) RETURN BOOLEAN;

-- Проверяем, была ли сделана вакцинация. Если сделана, то возвращаем
-- идентификатор препарата.
-- %param p_fk_people      tpeoples.fk_id
-- %param p_fk_infection   tinfection.fk_id
-- %param p_fn_kratn       tvac_plan_pattern.fn_kratn
-- %param p_fk_prep        OUT

  FUNCTION IS_EXIST_VACCIN(
    p_fk_people      IN INTEGER,
    p_fk_infection   IN INTEGER,
    p_fn_kratn       IN INTEGER,
    p_fk_vac_people  OUT INTEGER) RETURN BOOLEAN;

-- В соответствии с шаблоном формирует планируемую дату вакцинации
-- %param p_fk_people      tpeoples.fk_id
-- %param p_fk_planning    tvac_planning.fk_id
-- %param p_fn_kratn       tvac_plan_pattern.fn_kratn
-- %param p_fn_period      tvac_plan_pattern.fn_period
-- %param p_fk_period_type tvac_plan_pattern.fk_period_type

  FUNCTION CREATE_PLAN_DATE(
    p_fk_people      IN INTEGER,
    p_fk_planning    IN INTEGER,
    p_fn_kratn       IN INTEGER,
    p_fn_period      IN INTEGER,
    p_fk_period_type IN INTEGER) RETURN DATE;

-- Добавление планируемой прививки в индивидуальный план
-- %param p_fk_people                tpeoples.fk_id
-- %param p_fk_infection             tinfection.fk_id
-- %param p_fd_plan_date             tvac_private_plan.fd_plan_date
-- %param p_fn_kratn                 tvac_plan_pattern.fn_kratn
-- %param p_fn_not_vaccin            в зависимости от условия tvac_plan_pattern.fk_condition
-- %param p_fn_not_exist_prev_vaccin в зависимости от условия tvac_plan_pattern.fk_condition
-- %param p_fn_vaccin_period         в зависимости от условия tvac_plan_pattern.fk_period_type: 0 или tvac_plan_pattern.fn_period
-- %param p_fk_sotr                 tsotr.fk_id

  FUNCTION IS_ADD_VACCIN_PRIVATE_PLAN(
    p_fk_people                IN INTEGER,
    p_fk_infection             IN INTEGER,
    p_fd_plan_date             IN DATE,
    p_fn_kratn                 IN INTEGER,
    p_fn_not_vaccin            IN INTEGER,
    p_fn_not_exist_prev_vaccin IN INTEGER,
    p_fn_vaccin_period         IN INTEGER,
    p_fk_sotr                  IN INTEGER) RETURN BOOLEAN;

-- Проверка на наличие планируемой прививки
-- У пациента должно быть не больше одной планируемой прививки с
-- одинаковой инфекцией и кратностью.
-- %param p_fk_people      tpeoples.fk_id
-- %param p_fk_infection   tinfection.fk_id
-- %param p_fn_kratn       tvac_plan_pattern.fn_kratn

  FUNCTION IS_EXIST_VACCIN_PLAN(
    p_fk_people      IN INTEGER,
    p_fk_infection   IN INTEGER,
    p_fn_kratn       IN INTEGER
    ) RETURN BOOLEAN;

-- Предназначена для формирования индивидуального плана
-- согласно национального календаря.
-- %param p_fk_people      tpeoples.fk_id
-- %param p_fk_sotr        tsotr.fk_id

  FUNCTION IS_VACCIN_PLAN_NAT_CALENDAR(
    p_fk_people      IN INTEGER,
    p_fk_sotr        IN INTEGER
    ) RETURN BOOLEAN;

-- На базе шаблона формирует прививку для индивидуального плана пациента
-- %param p_fk_people      tpeoples.fk_id
-- %param p_fk_infection   tinfection.fk_id
-- %param p_fk_sotr        tsotr.fk_id
-- %param p_fd_plan_date   tvac_private_plan.fd_plan_date
-- %param p_fn_kratn      tvac_plan_pattern.fn_kratn

  FUNCTION IS_CREATE_VACCIN_PLAN(
    p_fk_people      IN INTEGER,
    p_fk_infection   IN INTEGER,
    p_fk_sotr        IN INTEGER,
    p_fd_plan_date   IN DATE,
    p_fn_kratn       IN INTEGER
  ) RETURN BOOLEAN;

-- На базе шаблона формирует индивидуальный план пациента
-- %param p_fk_people      tpeoples.fk_id
-- %param p_fk_planning    tvac_planning.fk_id

  FUNCTION IS_CREATE_PRIVATE_PLAN(
    p_fk_people      IN NUMBER,
    p_fk_planning    IN NUMBER
  ) RETURN BOOLEAN;


-- Предназначена для перемещение сроков плана при отводе.
-- (Должна выполнятся в теле триггера)
-- %param p_fk_people      tpeoples.fk_id
-- %param p_fk_cancel_type tvaccancel_type.fk_id
-- %param p_fd_begin       tvac_cancel.fd_begin
-- %param p_fd_end         tvac_cancel.fd_end

  PROCEDURE SHIFT_PRIVATE_PLAN(
    p_fk_people      IN NUMBER,
    p_fk_cancel_type IN NUMBER,
    p_fd_begin       IN DATE,
    p_fd_end         IN DATE);

-- Предназначена для модификации индивидуального плана
-- при его выполнении.
-- %param p_fk_tvac_people tvac_people.fk_id

  PROCEDURE EXEC_PRIVATE_PLAN(
    p_fk_tvac_people IN NUMBER);

-- Предназначена для восстановления индивидуального плана
-- при удалении прививки.
-- %param p_fk_people    tvac_people.fk_people
-- %param p_fk_infection tvac_kratn.fk_infection
-- %param p_fn_kratn     tvac_kratn.fn_kratn

  PROCEDURE RESTORE_PRIVATE_PLAN(
    p_fk_people    IN NUMBER,
    p_fk_infection IN NUMBER,
    p_fn_kratn     IN NUMBER);

-- Предназначена для добавления в коллекцию удаляемых fk_id прививок.
-- %param p_fk_id tvac_people.fk_id

  PROCEDURE ADD_VAC_PLAN_COLLECTION(
    p_fk_id IN NUMBER);

-- Предназначена для инициализации коллекции, содержащей fk_id прививок.

  PROCEDURE INIT_VAC_PLAN_COLLECTION;

-- Предназначена для запуска процедуры востановления индивидуального плана,
-- в зависимости от удаленных прививок.

  PROCEDURE RESTORE_VAC_PLAN_COLLECTION;

-- Предназначена для удаления планируемой прививки если пациент переболел
-- заболеванием, против которого планировалась оная.
-- (Должна выполнятся в теле триггера при добавлении заболевания)
-- %param p_fk_people    tvac_sicness.fk_people
-- %param p_fk_infection tvac_sicness.fk_infection
-- %param p_fd_end       tvac_sicness.fd_end

  PROCEDURE DELETE_VAC_PLAN(
    p_fk_people      IN NUMBER,
    p_fk_infection   IN NUMBER,
    p_fd_end         IN DATE);

-- Предназначена для добавления в коллекцию fk_id пациентов, над которыми
-- будут осуществлятся групповые операции.
-- %param p_fk_id tpeoples.fk_id

  PROCEDURE ADD_PEOPLE_FOR_GROUP_ACTIONS(p_fk_id IN NUMBER);

-- Предназначена для очищения коллекции пациентов, над которыми
-- будут осуществлятся групповые операции.

  PROCEDURE INIT_GROUP_ACTIONS_COLLECTION;

-- Предназначена для формирования индивидуального плана для группы
-- пациентов.
-- %param p_fk_sotr        tsotr.fk_id

  FUNCTION IS_GROUP_PLAN_NAT_CALENDAR(
    p_fk_sotr IN INTEGER) RETURN BOOLEAN;

-- Предназначена для формирование списка лет для combobox

  FUNCTION YEARS_LIST RETURN YEARS_TABLE_TYPE parallel_enable pipelined;

-- Возвращает SQL для chart распределение людей по возрастам
-- %param p_sex пол (0,1)
-- %param p_period период в годах, за который считать людей, начиная от sysdate
-- %Author Zhukov
  FUNCTION get_sql_peoples_by_age (p_sex IN INTEGER, p_period IN INTEGER)
   RETURN VARCHAR2;
  FUNCTION apex_get_vac_kratn (p_fk_vac_people IN INTEGER)
   RETURN VARCHAR2;
  FUNCTION what_do_with_fk_people (
   p_tpeoples_fk_id   IN       NUMBER,
   p_out_fk_people    OUT      NUMBER,
   p_out_fk_vac_map   OUT      NUMBER
)
   RETURN INTEGER;
END;                                                           -- Package spec
/

SHOW ERRORS;


