DROP PACKAGE BODY ASU.PKG_VACCIN
/

--
-- PKG_VACCIN  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_VACCIN" 
IS

/** �������� */
-- ����� ��� ����������
-- Author: Ura
-- ����� ��������� � ������ ����������, �� ASU2 ����� ��������� ���������� ������� ����������� � ������
-- � �� ����� ���������
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- ������������� ��� ��������� ��������, ����������� ��� ����������.
-------------------------------------------------------------------------------
  TYPE GROUP_ACTIONS_COLLECTION_TYPE IS TABLE OF NUMBER
      INDEX BY BINARY_INTEGER;

  v_peoples_collection GROUP_ACTIONS_COLLECTION_TYPE;

-------------------------------------------------------------------------------
-- ��� ������������� ������ ��������
-------------------------------------------------------------------------------
  TYPE RESTORE_VAC_PLAN_RECORD_TYPE IS RECORD (
      fk_people    NUMBER,
      fk_infection NUMBER,
      fn_kratn     NUMBER);

  TYPE RESTORE_VAC_PLAN_TABLE_TYPE IS TABLE OF RESTORE_VAC_PLAN_RECORD_TYPE
      INDEX BY BINARY_INTEGER;

  v_restore_vac_plan_table RESTORE_VAC_PLAN_TABLE_TYPE;

------------------------------------------------------------------------------
-- ������������� ��� ���������� � ��������� ��������� fk_id ��������.
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
-- ������������� ��� ������������� ���������, ���������� fk_id ��������.
------------------------------------------------------------------------------

  PROCEDURE INIT_VAC_PLAN_COLLECTION
  AS
  BEGIN

    v_restore_vac_plan_table.delete;

  END INIT_VAC_PLAN_COLLECTION;

------------------------------------------------------------------------------
-- ������������� ��� ������� ��������� ������������� ��������������� �����,
-- � ����������� �� ��������� ��������.
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
-- ������������� ��� ���������� v_peoples_collection
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
    v_old             NUMBER (16, 3);                                   -- ���� �� ������ ���������
    v_new             NUMBER (16, 3);                                            -- ����� �� ������
  BEGIN
    OPEN vps;

    FETCH vps
     INTO rec;
    -- TODO ���������� �� NOT EXISTS
    IF vps%NOTFOUND
    THEN
      IF p_type <> 1
      THEN
        RETURN;
      -- ����������� ��������, �� ������ �� �������� �����, ������� �������� ������ ������
      END IF;

      v_old := 0;                                                   -- �� ���� �� ������ ����� �����

      INSERT INTO tvaccin_prep_store
                  (fk_vaccin_prep, fc_series, fd_fitness, fn_remainder, fk_store
                  )
           VALUES (p_fk_vaccin_prep, p_fc_series, p_fd_fitness, p_fn, p_fk_store
                  )
        RETURNING fk_id
             INTO v_fk_prep_store;

      v_new := p_fn;                                                              -- ����� �� ������
    ELSE
      v_fk_prep_store := rec.fk_id;                               -- ������ ���� ����� ������ FK_ID
      v_old := rec.fn_remainder;                                                  -- ���� �� ������

      IF p_type = 1
      THEN
        v_new := rec.fn_remainder + p_fn;                                        -- ����� �� ������

        UPDATE tvaccin_prep_store
           SET fn_remainder = v_new
         WHERE fk_id = rec.fk_id;
      ELSIF p_type IN (2, 3, 4)
      THEN
        -- � ��� ����� ����� �������� �� ���������� ������������
        v_new := rec.fn_remainder - p_fn;                                        -- ����� �� ������

        UPDATE tvaccin_prep_store
           SET fn_remainder = v_new
         WHERE fk_id = rec.fk_id;
      END IF;
    END IF;

--� ������ �������� � ���
    INSERT INTO tvaccin_prep_store_log
                (fk_vaccin_prep_store, fd, fn_type, fn_num, fk_sotr, fc_rem, fn_old, fn_new
                )
         VALUES (v_fk_prep_store, SYSDATE, p_type, p_fn, p_fk_sotr, p_fc_rem, v_old, v_new
                );

    CLOSE vps;
  END storetransaction;

--------------------------------------------------------------------------------
-- ���������� ��� ��� ������������ ������ ������� �� ������
  PROCEDURE storetransaction (
    p_fk_prep_store   IN   INTEGER,                                            -- �������� �� ������
    p_fn              IN   NUMBER,                                                     -- ����������
    p_type            IN   INTEGER,                                                  -- ��� ��������
    p_fk_sotr         IN   INTEGER,
    p_fd_create       IN   DATE,                                                    -- ���� ��������
    p_fc_rem          IN   VARCHAR2
--1- ������; 2-������; 3-��������; 4- �������; 5- ����������� �� ������� �����
  )
  IS
    CURSOR vps
    IS
      SELECT fk_id, tvaccin_prep_store.fn_remainder
        FROM tvaccin_prep_store
       WHERE fk_id = p_fk_prep_store;

    rec     vps%ROWTYPE;
    v_old   NUMBER (16, 3);                                             -- ���� �� ������ ���������
    v_new   NUMBER (16, 3);                                                      -- ����� �� ������
  BEGIN
    OPEN vps;

    FETCH vps
     INTO rec;

    IF vps%NOTFOUND
    THEN
      -- ��� ����� ������ �� ������ - ��� ������
      raise_application_error (-21000, '��� ��������� �� ������');
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
      -- � ��� ����� ����� �������� �� ���������� ������������
      IF p_fn > rec.fn_remainder
      THEN
        raise_application_error (-21001, '������������ ���������� ���������');
        RETURN;
      END IF;

      v_new := rec.fn_remainder - p_fn;

      UPDATE tvaccin_prep_store
         SET fn_remainder = v_new
       WHERE fk_id = rec.fk_id;
    END IF;

--� ������ �������� � ���
    INSERT INTO tvaccin_prep_store_log
                (fk_vaccin_prep_store, fd, fn_type, fn_num, fk_sotr, fc_rem, fn_old, fn_new
                )
         VALUES (p_fk_prep_store, p_fd_create, p_type, p_fn, p_fk_sotr, p_fc_rem, v_old, v_new
                );
  END;                                                                          --storetransaction 2

--------------------------------------------------------------------------------
/*
-- ������� ���������� �� ���������� ������ � ����������� � ����������
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

      -- ������� ���������� � ��������
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
-- �������� ������� �� ������������ ����
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

  -- �������� ����� 100 !
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
    RETURN;                                                      -- ��� �� �������� ������ ��������
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
   p_fk_vaccin_prep   IN   INTEGER,                                            -- ��������
   p_series           IN   VARCHAR,                                               -- �����
   p_num              IN   NUMBER,                                                -- �����
   p_date             IN   DATE,                                                   -- ����
   p_vrach_fio        IN   VARCHAR,
   -- ���� �����������,  �����, ��������� ���� ������ ������ ������ � ����������
   p_fk_vrach         IN   INTEGER,
   p_sotr_fio         IN   VARCHAR,                -- ��� ���������� ���������� ����������
   p_fk_sotr          IN   VARCHAR,                 -- ���������, ������� ����� ����������
   p_fk_lpy           IN   INTEGER,                -- ������ � ����� ��� ������ ����������
   p_lpy              IN   VARCHAR,
   -- �������� ���,  ���������� ���� ������ � ���������� ��� ���� ��������� ��������
   p_status           IN   INTEGER,                                              -- ������
   p_fn_kratn         IN   INTEGER,                                           -- ���������
   p_fk_input_type    IN   INTEGER,                                    --   ������ �������
   p_fk_otdel         IN   INTEGER                                            -- ���������
)
   RETURN INTEGER
AS
   v_fk_vac_unit   INTEGER;
   v_vacn_name     VARCHAR (150);
   v_ret           INTEGER;
BEGIN
-- TODO ������ �������� �� ���������� ���������� ����
-- TODO ��������� ������� �� ������� �������� ������ � ���� �����
--������� ������� ���������
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
   p_fk_vaccin_prep   IN   INTEGER,                                            -- ��������
   p_series           IN   VARCHAR,                                               -- �����
   p_num              IN   NUMBER,                                                -- �����
   p_date             IN   DATE,                                                   -- ����
   p_vrach_fio        IN   VARCHAR,
   -- ���� �����������,  �����, ��������� ���� ������ ������ ������ � ����������
   p_fk_vrach         IN   INTEGER,
   p_sotr_fio         IN   VARCHAR,                -- ��� ���������� ���������� ����������
   p_fk_sotr          IN   VARCHAR,                 -- ���������, ������� ����� ����������
   p_fk_lpy           IN   INTEGER,                -- ������ � ����� ��� ������ ����������
   p_lpy              IN   VARCHAR,
   -- �������� ���,  ���������� ���� ������ � ���������� ��� ���� ��������� ��������
   p_status           IN   INTEGER,                                              -- ������
   p_fn_kratn         IN   INTEGER,                                           -- ���������
   p_fk_input_type    IN   INTEGER,                                     --   ������ �������
   p_fk_otdel         IN   INTEGER                                            -- ���������

)
AS
   v_fk_vac_unit   INTEGER;
   v_vacn_name     VARCHAR (150);
BEGIN
-- TODO ������ �������� �� ���������� ���������� ����
-- TODO ��������� ������� �� ������� �������� ������ � ���� �����
--������� ������� ���������
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
-- ���������� ��������� �� ���������� ������� - ��������� ����� ������� ������ ���������� ��������
FUNCTION getkratnnamebyvaccin (p_fk_vac_people IN INTEGER)
   RETURN VARCHAR2
IS
   v_ret   VARCHAR2 (150);
BEGIN
  -- ����� ���������, ��� ������ ����������

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
               );                                         -- ������ �������� �� �������� �

   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 1, ADD_MONTHS (v_fd_rojd, 1) +3, 12
               );                                         -- ������ �������� �� �������� �

   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 9, v_fd_rojd + 3, 10
               );                                                 -- ���������� ����������

   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 2, ADD_MONTHS (v_fd_rojd, 3), 11
               );                                               -- ������ ������� ��������
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 3, ADD_MONTHS (v_fd_rojd, 3), 11
               );                                               -- ������ ������� ������
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 8, ADD_MONTHS (v_fd_rojd, 3), 11
               );                                               -- ������ ������� ��������

   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 7, ADD_MONTHS (v_fd_rojd, 3), 11
               );                                               -- ������ ������� ����������

   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 31, ADD_MONTHS (v_fd_rojd, 3), 11
               );                                               -- ������ ������� ����������� ��������
--
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 2, Trunc(ADD_MONTHS (v_fd_rojd, 4.5))+15, 12
               );                                               -- ������ ������� ��������
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 3, Trunc(ADD_MONTHS (v_fd_rojd, 4.5))+15, 12
               );                                               -- ������ ������� ������
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 8, Trunc(ADD_MONTHS (v_fd_rojd, 4.5))+15, 12
               );                                               -- ������ ������� ��������

   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 7, Trunc(ADD_MONTHS (v_fd_rojd, 4.5))+15, 12
               );                                               -- ������ ������� ����������

   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 31,Trunc(ADD_MONTHS (v_fd_rojd, 4.5)) +15, 13
               );                                               -- ������ ������� ����������� ��������
--
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 2, Trunc(ADD_MONTHS (v_fd_rojd, 6)), 13
               );                                               -- ������ ������� ��������
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 3, Trunc(ADD_MONTHS (v_fd_rojd, 6)), 13
               );                                               -- ������ ������� ������
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 8, Trunc(ADD_MONTHS (v_fd_rojd, 6)), 13
               );                                               -- ������ ������� ��������

   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 7, Trunc(ADD_MONTHS (v_fd_rojd, 6)), 13
               );                                               -- ������ ������� ����������

   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 31,Trunc(ADD_MONTHS (v_fd_rojd,6)), 13
               );                                               -- ������ ������� ����������� ��������
--
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 1,Trunc(ADD_MONTHS (v_fd_rojd,6)), 13
               );                                               -- ������ ������� ������� B
--
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 4,Trunc(ADD_MONTHS (v_fd_rojd,12)), 11
               );                                               -- ������ ���������� ����

   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 6,Trunc(ADD_MONTHS (v_fd_rojd,12)), 11
               );                                               -- ������ ���������� �������
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 5,Trunc(ADD_MONTHS (v_fd_rojd,12)), 11
               );                                               -- ������ ���������� ��������
--
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 2, Trunc(ADD_MONTHS (v_fd_rojd, 18)), 20
               );                                               -- ������������ ��������
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 3, Trunc(ADD_MONTHS (v_fd_rojd, 18)), 20
               );                                               -- ������������ ������
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 8, Trunc(ADD_MONTHS (v_fd_rojd, 18)), 20
               );                                               -- ������������ ��������

   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 7, Trunc(ADD_MONTHS (v_fd_rojd, 18)), 20
               );                                               -- ������������ ����������

   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 31,Trunc(ADD_MONTHS (v_fd_rojd,18)), 20
               );                                               -- ������������ ����������� ��������
--
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 7,Trunc(ADD_MONTHS (v_fd_rojd,20)), 20
               );                                               -- 2 ������������ ����������

--
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 4,Trunc(ADD_MONTHS (v_fd_rojd,12*6)), 12
               );                                               -- ������ ���������� ����

   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 6,Trunc(ADD_MONTHS (v_fd_rojd,12*6)), 12
               );                                               -- ������ ���������� �������
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 5,Trunc(ADD_MONTHS (v_fd_rojd,12*6)), 12
               );                                               -- ������ ���������� ��������
--
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 2,Trunc(ADD_MONTHS (v_fd_rojd,12*7)), 30
               );                                               -- ������ ������������ ��������
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 8,Trunc(ADD_MONTHS (v_fd_rojd,12*7)), 30
               );                                               -- ������ ������������ ��������
   INSERT INTO tvac_plan
               (fk_people, fk_infection, fd, fn_kratn
               )
        VALUES (p_fk_people, 9,Trunc(ADD_MONTHS (v_fd_rojd,12*7)), 20
               );                                               -- ����� ������������ ��������

--   INSERT INTO tvac_plan
--               (fk_people, fk_infection, fd, fn_kratn
  --             )
--        VALUES (p_fk_people, 1,Trunc(ADD_MONTHS (v_fd_rojd,12*13)), 20
--               );                                               -- ����� ������������ ��������
END create_plan;

/**  ���������� ������� �� ������������ ����
  ��� ����� � �� ������ */
FUNCTION show_age (p_rojd IN DATE, p_date IN DATE)
   RETURN VARCHAR2
AS
/**  ���������� ������� �� ������������ ����
  ��� ����� � �� ������ */
   v_diff         INTEGER;
   v_month_diff   INTEGER;
   v_year_diff    INTEGER;
   v_day_diff     INTEGER;
   v_ret          VARCHAR2 (30);
   v_mod          INTEGER;                                        -- ��������� �� �������
BEGIN
   v_diff := TRUNC (p_date - p_rojd);

   IF v_diff < 0
   THEN
      RETURN '0';
   END IF;

   IF v_diff < 30
   THEN                                                                   -- ������ ������
      RETURN TO_CHAR (v_diff) || ' ' || '��';
   ELSE
      v_month_diff := TRUNC (MONTHS_BETWEEN (p_date, p_rojd));

      IF v_month_diff < 6
      THEN
         v_day_diff := p_date - TRUNC (ADD_MONTHS (p_rojd, v_month_diff));
         v_ret := TO_CHAR (v_month_diff) || ' ���. ';

         IF v_day_diff > 1
         THEN
            v_ret := v_ret || TO_CHAR (v_day_diff) || ' ��';
         END IF;

         RETURN v_ret;
      ELSIF v_month_diff < 12
      THEN
         RETURN TO_CHAR (v_month_diff) || ' ���. ';
      ELSE
         v_year_diff := TRUNC (v_month_diff / 12);

         IF v_year_diff < 5
         THEN
            RETURN    TO_CHAR (v_year_diff)
                   || ' �. '
                   || TO_CHAR (v_month_diff - v_year_diff * 12)
                   || ' ���.';
         ELSE
            -- ������� �� ��������� �����
            v_mod := MOD (v_year_diff, 10);

            IF v_mod = 1
            THEN
               RETURN TO_CHAR (v_year_diff) || ' ���';
            ELSIF v_mod IN (2, 3, 4)
            THEN
               RETURN TO_CHAR (v_year_diff) || ' ����';
            ELSE
               RETURN TO_CHAR (v_year_diff) || ' ��� ';
            END IF;
         END IF;
      END IF;
   END IF;
END show_age;
--------------------------------------------------------------------------------
-- ���������� ttherpoints.fk_id �� ����� � ������ ����

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
                                              -- �� ������ � ���������� �������
   END IF;
END get_terpoint_fk_id;
--------------------------------------------------------------------------------
-- ���������� TINFECTION.FK_ID �� ��������� �������� ���-10
-- ���� �� ����� �������� �� ���������� -1

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
   -- �� TAMBULANCE
   INSERT INTO tvac_sicness
               (fk_infection, fd_end, fc_rem, fk_diag, fk_people, fk_lpy, fc_vrach)
      SELECT pkg_vaccin.get_infectionby_mkb (tsmid.fk_mkb10), tdiag.fd_date, tdiag.fc_write,
             tdiag.fk_id, tambulance.fk_peplid, 111, get_sotrname (tdiag.fk_vrachid) AS "����"
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

-- �� TKARTA
   INSERT INTO tvac_sicness
               (fk_infection, fd_end, fc_rem, fk_diag, fk_people, fk_lpy, fc_vrach)
      SELECT pkg_vaccin.get_infectionby_mkb (tsmid.fk_mkb10), tdiag.fd_date, tdiag.fc_write,
             tdiag.fk_id, tkarta.fk_peplid, 111, get_sotrname (tdiag.fk_vrachid) AS "����"
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
-- ���������� ��������� �� ���������� ������� ������ � ��������� ��������
-- ������������ ������ ����� ��������� ���������
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
-- ���������� MAX(TPEOPLES.FK_ID) ��� ����� � ����������� �����������
-- ������������� ��-�� ���� ��� � ���� ���� ��������� �����
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
-- �� ����������� TPEOPLES.FK_ID
-- %return 1  ��������� ���������� ����� ����� �� �������� p_out_FK_PEOPLE
--         2  ��������� ���������� ����� ��� ������ ������� p_out_FK_PEOPLE (����������� �� ����������)
--         3 ������������� ����������� ����� p_out_FK_VAC_MAP ��� ����� �� �������� p_out_FK_PEOPLE
-- �������� ��������� �� �������� ���� �� ��������� ���� ���� �� 5 ����� � ��������
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
   -- ��������
   -- 0 ���� ���� �� ����� ������ �� ���������� 1

   --1 ���� ���� �� ����� �� ��� � �� � ����� � ����� �����
   --2 ���� ����� ���� , �� ������� � 4
   --2.1 ������� ���� �� ����������� ����� ��� ����� ��������, ���� ����
   --   �� ������� � �.6
   --3. ���������� 1, � p_out_FK_PEOPLE
   --4. ����� ��������� ����� ���� ���� �� � ���� ���� ����������� �����, ���� ���� �� 5 ����� 6
   --5. ���������� 3, � p_out_FK_PEOPLE � p_out_FK_VAC_MAP ��������� � �.4
   --6. ���������� 2, � max(p_out_FK_PEOPLE)
   SELECT a.fc_fam, a.fc_im, a.fc_otch, a.fp_sex, a.fd_rojd
     INTO v_fam, v_im, v_otch, v_sex, v_rojd
     FROM tpeoples a
    WHERE a.fk_id = p_tpeoples_fk_id;

    if (v_fam is NULL) or (v_im is NULL) or (v_otch is NULL) or (v_sex is NULL) or (v_rojd is NULL)
    then
      p_out_fk_people := p_tpeoples_fk_id;
      p_out_fk_vac_map := 0;
      RETURN 1;                                                                        -- ����� 5

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
      -- ������ ����� ���
      SELECT COUNT (*)
        INTO v_fk_vac_map
        FROM DUAL
       WHERE EXISTS (SELECT 1
                       FROM tvac_map aa
                      WHERE aa.fk_people = v_fk_people);

      IF v_fk_vac_map = 0
      THEN
         -- ����� ���
         p_out_fk_people := p_tpeoples_fk_id;
         p_out_fk_vac_map := 0;
         RETURN 1;                                                                       -- ����� 3
      ELSE
         -- �� ����� ����
         SELECT aa.fk_id
           INTO v_fk_vac_map
           FROM tvac_map aa
          WHERE aa.fk_people = v_fk_people;

         p_out_fk_people := p_tpeoples_fk_id;
         p_out_fk_vac_map := v_fk_vac_map;
         RETURN 3;                                                                        -- ����� 5
      END IF;                                                                   -- �������� �� �����
   ELSE
      -- ���� ������ ���� � ����� �� ��������
      -- ���� � ���� �� ��� ���� ����������� ����
      OPEN c_map_by_fio (v_fam, v_im, v_otch, v_sex, v_rojd);

      FETCH c_map_by_fio
       INTO v_map_by_fio;

      IF c_map_by_fio%NOTFOUND
      THEN
         -- ����� 6
         p_out_fk_people := v_fk_people;
         p_out_fk_vac_map := 0;
         RETURN 2;
      ELSE
         -- ����� 5
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
    -- ���������, ���������� �� ������� � ����� id
    SELECT COUNT(*) INTO v_cnt
    FROM DUAL
    WHERE EXISTS (
        SELECT NULL
        FROM tvac_map a WHERE a.fk_people = p_fk_id);

    IF v_cnt = 1 THEN
      -- ������������, ���������, ���� �� ��������� � ����������� �����
      -- ���������� ��������.
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
        -- ��, �� ��� �� ����������, ��������� ������, ��������� �
        -- ����������� ������ ��������
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

      -- ��������� �� ������������� ������ �������� �� ��� id � ����.
      SELECT COUNT(*)
      INTO v_cnt
      FROM DUAL
      WHERE EXISTS(
          SELECT NULL FROM tadress
          WHERE fk_pacid = p_fk_id AND fk_type = 61 AND ROWNUM = 1);

      IF v_cnt = 1 THEN
        -- ���������, ���� �� ������ ����� ��������.
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
          -- ������ ��������� � ����� ��������.
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

      -- ��������� ������� ������������ � ����
      SELECT COUNT(*) INTO v_cnt
      FROM DUAL
      WHERE EXISTS (
          SELECT NULL
          FROM tpeoples a WHERE a.fk_id = p_fk_id);

      IF v_cnt = 1 THEN
        -- ���������, ���� �� ������� ��������� ��������
        SELECT a.fk_dolgnost
        INTO v_position
        FROM tpeoples a WHERE a.fk_id = p_fk_id;

        IF NVL(v_position, -1) <> NVL(p_fk_dolgnost, -1) THEN
          -- ��������� ������ ��������
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
    -- ��������� ������� ������������ � ����
    SELECT COUNT(*) INTO v_cnt
    FROM DUAL
    WHERE EXISTS (
        SELECT NULL
          FROM tpeoples a
         WHERE a.fk_id = p_fk_id);

    IF v_cnt = 1 THEN

      -- ���������, ���� �� ������� ��������� ��������
      SELECT a.fk_dolgnost
        INTO v_position
        FROM tpeoples a
       WHERE a.fk_id = p_fk_id;

      IF NVL(v_position, -1) <> NVL(p_fk_dolgnost, -1) THEN

        -- ��������� ������ ��������
        UPDATE tpeoples
           SET fk_dolgnost = p_fk_dolgnost
         WHERE fk_id = p_fk_id;
      END IF;

      -- ��������� �� ������������� ������ �������� �� ��� id � ����.
      SELECT COUNT(*)
      INTO v_cnt
      FROM DUAL
      WHERE EXISTS(
          SELECT NULL
            FROM tadress
           WHERE fk_pacid = p_fk_id AND fk_type = 61 AND ROWNUM = 1);

      IF v_cnt = 1 THEN

        -- ���������, ���� �� ������ ����� ��������.
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

           -- ������ ��������� � ����� ��������.
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

      -- ������� ����� ����� ��� ��������
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
    -- ���������, ���������� �� ������� � ����� id
    SELECT COUNT(*) INTO v_cnt
    FROM DUAL
    WHERE EXISTS (
        SELECT NULL
        FROM tvac_map a WHERE a.fk_people = p_fk_id);

    IF v_cnt = 1 THEN
      -- ������ �������, ��� ����������� ����� �������� �������.
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
    -- ���������, ���������� �� ������� � ����� id
    SELECT COUNT(*) INTO v_cnt
    FROM DUAL
    WHERE EXISTS (
        SELECT NULL
        FROM tvac_peoples_test t WHERE t.fk_id = p_fk_id);

    IF v_cnt = 1 THEN
      -- ������������, ���������, ���� �� ��������� ����������
      -- ����� ���������� ��������.
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
    -- ���������, ���������� �� ������� � ����� id
    SELECT COUNT(*) INTO v_cnt
    FROM DUAL
    WHERE EXISTS (
        SELECT NULL
        FROM tvac_peoples_test t WHERE t.fk_id = p_fk_id);

    IF v_cnt = 1 THEN
      -- ������������, ������� ����� ���������� ��������.
      DELETE FROM tvac_peoples_test t
      WHERE t.fk_id = p_fk_id AND ROWNUM = 1;
    END IF;
  END DELETE_TEST_DATA;
------------------------------------------------------------------------------
-- ���������� �������, ���,
-- �������� ���������� �� Id
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
-- ���������� ��� ����������
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
           -- ��� ���������� ����� ��������.
           NEXT_VACINATION_ROUND(NVL(p_fk_people, -1),
                                 NVL(p_fk_infection, -1)),

           -- ���� ����������� ������ ��������.
           CASE p_fk_id_new_prep
             WHEN p_fk_id_cur_prep THEN
               CURRENT_VACINATION_ROUND(NVL(p_fk_vac_people, -1),
                                        NVL(p_fk_infection, -1))
             ELSE
               -- ���� ��� �������������� ������
               -- �������� �������� ��������
               NEXT_VACINATION_ROUND(NVL(p_fk_people, -1),
                                     NVL(p_fk_infection, -1))
           END
          )
     INTO v_return
     FROM dual;

    RETURN v_return;
  END VACINATION_ROUND;

------------------------------------------------------------------------------
-- ���������� ��������� ��� ����������
------------------------------------------------------------------------------
  FUNCTION NEXT_VACINATION_ROUND(
    p_fk_people    IN INTEGER,
    p_fk_infection IN INTEGER
  ) RETURN NUMBER
  AS
    v_return NUMBER;

  BEGIN
    -- ���� ��������� ��� ����������.
    SELECT NVL(MAX(fn_kratn), 10)
          INTO v_return
      FROM tvac_people a, tvac_kratn b
     WHERE a.fk_people = p_fk_people
       AND b.fk_vac_people = a.fk_id
       AND b.fk_infection = p_fk_infection;

    -- �������� ��������� ��� ����������.
    IF v_return < 13 then
      v_return := v_return + 1;
    ELSE
      v_return := TRUNC((v_return + 10), -1);
    end if;

    RETURN v_return;
  END NEXT_VACINATION_ROUND;

------------------------------------------------------------------------------
-- ���������� ������� ��� ����������
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
-- ��������� ������������ ����������
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

     -- ��������, ������, �����������, ����������,
     -- �������� ������� �, ����, ������������� �������, ��������
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

    -- ��������� ������ � 2-� ������ �������.
    -- �� ����������� - �������� � ��������� �� �� ���������.
    -- �� ��������� - ������� ��������������.
    v_valid_pos := (p_kratn_count * (p_age_pos - 1) + p_kratn_pos) +
        v_offset(p_infec_pos);

    RETURN v_vac_valid(v_valid_pos);
  END IS_VALID_VACCINATION;

------------------------------------------------------------------------------
-- �������� Id �������-����������������� ����������
------------------------------------------------------------------------------
  FUNCTION LPY_ID_DEFAULT RETURN INTEGER
  IS
    v_result INTEGER;

  BEGIN
    v_result := 15093;

    RETURN v_result;
  END LPY_ID_DEFAULT;


------------------------------------------------------------------------------
-- ����������� ���������� ��������
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
      -- ���������� ��� ������.
      UPDATE tvac_cancel SET fk_people = p_united_id
       WHERE fk_people = p_connectable_id;

      dbms_output.put_line('update tvac_cancel: ' || SQL%ROWCOUNT);
      p_cnt_cancel := p_cnt_cancel + SQL%ROWCOUNT;

      -- ���������� ��� �������.
      UPDATE tvac_sicness SET fk_people = p_united_id
       WHERE fk_people = p_connectable_id;

      dbms_output.put_line('update tvac_sicness: ' || SQL%ROWCOUNT);

      -- ���������� ��� �����.
      UPDATE tvac_peoples_test SET fk_people = p_united_id
       WHERE fk_people = p_connectable_id;

      dbms_output.put_line('update tvac_peoples_test: ' || SQL%ROWCOUNT);

      -- ���������� �����.
      UPDATE tvac_plan SET fk_people = p_united_id
       WHERE fk_people = p_connectable_id;

      dbms_output.put_line('update tvac_plan: ' || SQL%ROWCOUNT);

      -- ���������� ��������.
      UPDATE tvac_people SET fk_people = p_united_id
       WHERE fk_people = p_connectable_id;

      dbms_output.put_line('update tvac_people: ' || SQL%ROWCOUNT);
      p_cnt_tvac_people := p_cnt_tvac_people + SQL%ROWCOUNT;

      -- ������� ����� ��������.
      FOR cur_vaccin IN (
          -- �������� �� ����� �������� �� ������� ���������.
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

      -- ������� ������ �����.
      DELETE FROM tvac_map
            WHERE fk_people = p_connectable_id;

      dbms_output.put_line('delete from tvac_map: ' || SQL%ROWCOUNT);
      p_cnt_map_del := p_cnt_map_del +  SQL%ROWCOUNT;

    END IF; -- IF v_cnt = 1 THEN
  END MERGEING_PEOPLE;

------------------------------------------------------------------------------
-- ����� � ����������� ����� � �����������
-- ���������, �������, ����������, ������ �������� � �����.
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
        -- ����� id ������������ ������, ������� ����� ������������.
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
        '����� ���������� ����: ' || TO_CHAR(v_count));
    dbms_output.put_line(
        '����� ���������� �������: ' || TO_CHAR(v_cnt_cancel) );
    dbms_output.put_line(
        '����� ������������ �������: ' || TO_CHAR(v_cnt_tvac_people) );
    dbms_output.put_line(
        '����� ��������� �������: ' || TO_CHAR(v_cnt_vac_del) );
    dbms_output.put_line(
        '������� ����: ' || TO_CHAR(v_cnt_map_del) );

  END MERGER_DUPLICATE;

------------------------------------------------------------------------------
-- ���� ������� ����� ���������� �����,
-- �� ��� ������ ��� ���� ����������� ���� ��������.
------------------------------------------------------------------------------

  FUNCTION IS_NOT_CANCEL_PEOPLE(
    p_fk_people      IN INTEGER) RETURN BOOLEAN
  IS
    c_fl_all       CONSTANT NUMBER := 1;
    v_valid_people NUMBER;
    v_result       BOOLEAN;

  BEGIN
    v_result := FALSE;

    -- ���������, ���� �� � �������� ���������� �����
    -- �� ���� �������� � ������.
    SELECT COUNT(*)
      INTO v_valid_people
      FROM DUAL
     WHERE EXISTS (SELECT NULL
                     FROM tvac_cancel, tvaccancel_type
                    WHERE tvac_cancel.fk_type = tvaccancel_type.fk_id
                      AND tvaccancel_type.fl_all = c_fl_all
                      AND fk_people = p_fk_people);

    IF v_valid_people = 0 THEN
      -- � �������� ��� ������ �� ���� �������� � ������.
      v_result := TRUE;
    END IF;

    RETURN v_result;
  END IS_NOT_CANCEL_PEOPLE;

------------------------------------------------------------------------------
-- ���������, ���� �� ������� ����������. ���� �������, �� ����������
-- ������������� ���������.
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
-- �������� �� ������� ����������� ��������
-- � �������� ������ ���� �� ������ ����� ����������� �������� �
-- ���������� ��������� � ����������.
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

    -- �� ������ ������ �� ������ �������� ����� ������������
    -- ������ ���� �������������� ����,
    -- ������� ���� tvac_private_plan � tvac_planning
    -- ����������� �� ��������. ��� ��������� ����� ������� ���� ��������
    -- � ������� ����������.
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
-- � ������������ � �������� ��������� ����������� ���� ����������
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
    -- �� ��������� ��������� ���� ����������� �������� ��
    -- ���� ������������ ��������������� �����.
    v_result := ADD_MONTHS(SYSDATE, p_fn_period);

    -- ���������� ������, ������� ��������� ��� �����������
    -- ����������� ����.
    IF c_fk_from_birthday = p_fk_period_type THEN

      v_vaccin_period := p_fn_period;
    ELSE
      -- ��� ���������� ����������� ���� �� ���� ��������� ����������,
      -- ���������� ���������� ������������ ������
      -- �����������, �� ���� ��������, ��������.
      SELECT MAX(fn_period)
        INTO v_max_period
        FROM tvac_plan_pattern
       WHERE fk_planning = p_fk_planning
         AND tvac_plan_pattern.fk_period_type = c_fk_from_birthday;

      v_vaccin_period := v_max_period + p_fn_period;

    END IF; -- ELSE IF c_fk_from_birthday = p_fk_period_type

    -- ���� ����������� �� ���� �������� ��������.
    -- �������� ���� �������� ��������.
    SELECT fd_rojd
      INTO v_people_date
      FROM tpeoples
     WHERE fk_id = p_fk_people;

    IF v_people_date IS NOT NULL THEN
      -- ��������� ����������� ���� ���������.
      v_result := ADD_MONTHS(v_people_date, v_vaccin_period);

      -- ��������� ���� �� ������, ���� ���� ���������, �� ���������
      -- ����������� ���� � ����� ������.
      SELECT COUNT(*)
        INTO v_valid_cancel
        FROM DUAL
       WHERE EXISTS (SELECT NULL
                       FROM tvac_cancel
                      WHERE fk_people = p_fk_people
                        AND MONTHS_BETWEEN(fd_end, v_result) > 0);

      IF v_valid_cancel > 0 THEN
        -- �������, ���������� �������� � ��������� ���� ����� ������ ��
        -- ����������� ���� ��������.
        SELECT MONTHS_BETWEEN(fd_end, v_result)
          INTO v_offset_dates
          FROM tvac_cancel
         WHERE fk_people = p_fk_people
           AND MONTHS_BETWEEN(fd_end, v_result) > 0;

        -- ����� ����������� ���� �������� ��������� �� ����� ������.
        v_result := ADD_MONTHS(v_result, v_offset_dates);
      END IF;
    END IF; -- IF v_people_date IS NOT NULL

    RETURN v_result;

  END CREATE_PLAN_DATE;

------------------------------------------------------------------------------
-- ���������� ����������� �������� � �������������� ����
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
    -- ����������� �������� ��������� ������ �����, ����� � ���.
    v_result := (
        NOT PKG_VACCIN.IS_EXIST_VACCIN_PLAN(
        p_fk_people, p_fk_infection, p_fn_kratn));

    IF v_result THEN
      -- ���������, ����� �������� ��� �������.
      -- ���� �������, �� �������� ��������
      IF PKG_VACCIN.IS_EXIST_VACCIN(
          p_fk_people, p_fk_infection, p_fn_kratn, v_fk_vac_people) THEN

        -- �������� ��� �������, ������������� �������� � �����
        -- ��� ���������.
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

        -- �������� ������� ������������ ����������� ��������, ���
        -- ������ ����������� ����� ��������� ������ ����� ��������� ����������
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
-- �� ���� ������� ��������� �������������� ���� ��������
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

    -- ��������� ������� �������� � ����� ���������������.
    SELECT COUNT(*)
      INTO v_valid_people
      FROM DUAL
     WHERE EXISTS (SELECT NULL
                     FROM tvac_map
                    WHERE tvac_map.fk_people = p_fk_people);

    -- ��������� ������� ������� � ���������� �����
    SELECT COUNT(*)
      INTO v_valid_plan
      FROM DUAL
     WHERE EXISTS (SELECT NULL
                     FROM tvac_plan_pattern
                    WHERE tvac_plan_pattern.fk_planning = p_fk_planning);

    IF (v_valid_plan > 0) AND (v_valid_people > 0) THEN

      -- ��� ������ ����������� ����, ���� ���� ���������� �����
      -- ��� �������������� ���� ��� ��������� �������� ��� �����������.
      IF PKG_VACCIN.IS_NOT_CANCEL_PEOPLE(p_fk_people) THEN

        -- �������� ��� ��������
        SELECT fp_sex
          INTO v_people_sex
          FROM tpeoples
         WHERE fk_id = p_fk_people;

        -- ������������, ������ ����� �� ������� � ���������
        -- �������������� ����.
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

          -- �������� ����� ���� ��������� ������ ���������������
          -- ������ ����, ���� ������ ������������ ���.
          IF (v_people_sex = cur_pattern.fn_sex) OR
              (cur_pattern.fn_sex = c_all_peoples) THEN

            -- � ������������ � ����������� ������� ��������� ����.
            v_plan_date := PKG_VACCIN.CREATE_PLAN_DATE(
                p_fk_people, p_fk_planning,
                cur_pattern.fn_kratn, cur_pattern.fn_period,
                cur_pattern.fk_period_type);

            -- ��������� ������� ���������� ����������� ����������.
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

            -- ��������� �������������� ����.
            v_add_result := PKG_VACCIN.IS_ADD_VACCIN_PRIVATE_PLAN(
                p_fk_people, cur_pattern.fk_infection,
                v_plan_date, cur_pattern.fn_kratn, v_not_vaccin,
                v_not_exist_prev_vaccin, v_vaccin_period, 0);

            -- ���� ���� �� ���� ����� ����� ��� ��������,
            -- ������ ���� ��������� �����������.
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
-- ������������� ��� ������������ ��������������� �����
-- �������� ������������� ���������.
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

    -- ��� ������ ����������� ����, ���� ���� ���������� �����.
    IF IS_NOT_CANCEL_PEOPLE(p_fk_people) THEN

      -- �������� ��� ��������
      SELECT fp_sex, fd_rojd
        INTO v_people_sex, v_birthday
        FROM tpeoples
       WHERE fk_id = p_fk_people;

      FOR nat_calendar_cur IN (
          SELECT fk_infection, kratn, plan_date, sex,
                 vaccin_period, not_vaccin
            FROM (SELECT 1 as fk_infection, -- ������� �
                         10 as kratn,
                         v_birthday + 1 as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 9 as fk_infection, -- ����������
                         10 as kratn,
                         v_birthday + 7 as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 1 as fk_infection, -- ������� �
                         12 as kratn,
                         ADD_MONTHS(v_birthday, 1) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  --
                  SELECT 2 as fk_infection, -- ��������
                         10 as kratn,
                         ADD_MONTHS(v_birthday, (1*3)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 3 as fk_infection, -- ������
                         10 as kratn,
                         ADD_MONTHS(v_birthday, (1*3)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 8 as fk_infection, -- ��������
                         10 as kratn,
                         ADD_MONTHS(v_birthday, (1*3)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 7 as fk_infection, -- �����������
                         10 as kratn,
                         ADD_MONTHS(v_birthday, (1*3)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  --
                  SELECT 2 as fk_infection, -- ��������
                         12 as kratn,
                         ADD_MONTHS(v_birthday, (1*5)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 3 as fk_infection, -- ������
                         12 as kratn,
                         ADD_MONTHS(v_birthday, (1*5)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 8 as fk_infection, -- ��������
                         12 as kratn,
                         ADD_MONTHS(v_birthday, (1*5)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 7 as fk_infection, -- �����������
                         12 as kratn,
                         ADD_MONTHS(v_birthday, (1*5)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  --
                  SELECT 2 as fk_infection, -- ��������
                         13 as kratn,
                         ADD_MONTHS(v_birthday, (1*6)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 3 as fk_infection, -- ������
                         13 as kratn,
                         ADD_MONTHS(v_birthday, (1*6)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 8 as fk_infection, -- ��������
                         13 as kratn,
                         ADD_MONTHS(v_birthday, (1*6)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 7 as fk_infection, -- �����������
                         13 as kratn,
                         ADD_MONTHS(v_birthday, (1*6)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 1 as fk_infection, -- ������� �
                         13 as kratn,
                         ADD_MONTHS(v_birthday, (1*6)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  --
                  SELECT 4 as fk_infection, -- ����
                         10 as kratn,
                         ADD_MONTHS(v_birthday, (1*12)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 5 as fk_infection, -- ��������
                         10 as kratn,
                         ADD_MONTHS(v_birthday, (1*12)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 6 as fk_infection, -- �������
                         10 as kratn,
                         ADD_MONTHS(v_birthday, (1*12)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  --
                  SELECT 2 as fk_infection, -- ��������
                         20 as kratn,
                         ADD_MONTHS(v_birthday, (1*18)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 3 as fk_infection, -- ������
                         20 as kratn,
                         ADD_MONTHS(v_birthday, (1*18)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 8 as fk_infection, -- ��������
                         20 as kratn,
                         ADD_MONTHS(v_birthday, (1*18)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 7 as fk_infection, -- �����������
                         20 as kratn,
                         ADD_MONTHS(v_birthday, (1*18)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  --
                  SELECT 7 as fk_infection, -- �����������
                         22 as kratn,
                         ADD_MONTHS(v_birthday, (1*20)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  --
                  SELECT 4 as fk_infection, -- ����
                         20 as kratn,
                         ADD_MONTHS(v_birthday, (6*12)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 5 as fk_infection, -- ��������
                         20 as kratn,
                         ADD_MONTHS(v_birthday, (6*12)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 6 as fk_infection, -- �������
                         20 as kratn,
                         ADD_MONTHS(v_birthday, (6*12)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  --
                  SELECT 9 as fk_infection, -- ����������
                         20 as kratn,
                         ADD_MONTHS(v_birthday, (7*12)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 2 as fk_infection, -- ��������
                         30 as kratn,
                         ADD_MONTHS(v_birthday, (7*12)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 8 as fk_infection, -- ��������
                         30 as kratn,
                         ADD_MONTHS(v_birthday, (7*12)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  --
                  SELECT 5 as fk_infection, -- ��������
                         20 as kratn,
                         ADD_MONTHS(v_birthday, (13*12)) as plan_date,
                         0 as sex,
                         0 as vaccin_period,
                         1 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 1 as fk_infection, -- ������� �
                         10 as kratn,
                         ADD_MONTHS(v_birthday, (13*12)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         1 as not_vaccin
                    FROM DUAL UNION ALL
                  --
                  SELECT 2 as fk_infection, -- ��������
                         40 as kratn,
                         ADD_MONTHS(v_birthday, (14*12)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 8 as fk_infection, -- ��������
                         40 as kratn,
                         ADD_MONTHS(v_birthday, (14*12)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         0 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 9 as fk_infection, -- ����������
                         20 as kratn,
                         ADD_MONTHS(v_birthday, (14*12)) as plan_date,
                         2 as sex,
                         0 as vaccin_period,
                         1 as not_vaccin
                    FROM DUAL UNION ALL
                  SELECT 7 as fk_infection, -- �����������
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

        -- ��������� �������������� ����.
        v_add_result := PKG_VACCIN.IS_ADD_VACCIN_PRIVATE_PLAN(
            p_fk_people, nat_calendar_cur.fk_infection,
            nat_calendar_cur.plan_date, nat_calendar_cur.kratn,
            nat_calendar_cur.not_vaccin, v_not_exist_prev_vaccin,
            nat_calendar_cur.vaccin_period, 0);

        -- ���� ���� �� ���� ����� ����� ��� ��������,
        -- ������ ���� ��������� �����������.
        IF v_add_result THEN
          v_result := v_add_result;
        END IF;
      END LOOP;
    END IF;

    USER_LOG.PKG_LOG_MNG.END_LOG_GROUP_ACTION;

    RETURN v_result;

  END IS_VACCIN_PLAN_NAT_CALENDAR;

------------------------------------------------------------------------------
-- �� ���� ������� ��������� �������� ��� ��������������� ����� ��������
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

    -- ��������� ������� �������� � ����� ���������������.
    SELECT COUNT(*)
      INTO v_valid
      FROM DUAL
     WHERE EXISTS (SELECT NULL
                     FROM tvac_map
                    WHERE tvac_map.fk_people = p_fk_people);

    IF v_valid > 0 THEN
      -- ��� ������ ����������� ���� ��������, ���� ���� ���������� �����
      IF PKG_VACCIN.IS_NOT_CANCEL_PEOPLE(p_fk_people) THEN

        -- ��������� ������� ���������� ����������� ����������.
        v_not_exist_prev_vaccin := 0;
        v_not_vaccin := 0;
        v_vaccin_period := 0;

        -- ��������� �������������� ����.
        v_result := PKG_VACCIN.IS_ADD_VACCIN_PRIVATE_PLAN(
            p_fk_people, p_fk_infection,
            p_fd_plan_date, p_fn_kratn, v_not_vaccin,
            v_not_exist_prev_vaccin, v_vaccin_period, p_fk_sotr);
      END IF;
    END IF;

    RETURN v_result;

  END IS_CREATE_VACCIN_PLAN;

------------------------------------------------------------------------------
-- ������������� ��� ����������� ������ ����� ��� ������.
-- (������ ���������� � ���� ��������)
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
    -- ���������� ��� ������
    SELECT COUNT(*)
      INTO v_permanent
      FROM DUAL
     WHERE EXISTS (SELECT NULL
                     FROM tvaccancel_type
                    WHERE tvaccancel_type.fk_id = p_fk_cancel_type
                      AND tvaccancel_type.fn_permanent > 0);

    IF v_permanent > 0 THEN
      -- �������� �������� ���������� �����
      UPDATE tvac_private_plan
         SET tvac_private_plan.fk_status = c_cancel_status
       WHERE tvac_private_plan.fk_people = p_fk_people
         AND tvac_private_plan.fk_status = c_plan_status;
    ELSE
      -- ����� ��������� ����� ��������� �������� ���
      -- ������ ����������� ��������
      SELECT MIN(fd_plan_date)
        INTO v_begin_plan_date
        FROM tvac_private_plan
       WHERE fk_people = p_fk_people
         AND fk_status = c_plan_status
         AND fd_plan_date > p_fd_begin
         AND fd_plan_date <= p_fd_end;

      v_begin_plan_date := v_begin_plan_date + 1;

      -- ����������� ��� ��������������� �������� �� ����, ��������� �
      -- �������� ���� ������.
      UPDATE tvac_private_plan
         SET fd_plan_date = p_fd_end + (v_begin_plan_date - fd_plan_date)
       WHERE fk_people = p_fk_people
         AND fk_status = c_plan_status
         AND fd_plan_date > p_fd_begin
         AND fd_plan_date <= p_fd_end;
    END IF;
  END SHIFT_PRIVATE_PLAN;

------------------------------------------------------------------------------
-- ������������� ��� �������� ����������� �������� ���� ������� ���������
-- ������������, ������ �������� ������������� ����.
-- (������ ���������� � ���� �������� ��� ���������� �����������)
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

      -- ������� ��������������� ��������, ���������� � ����������� ����.
      -- ������� ��������, �� ��������� �� ������� ����������.
      DELETE FROM tvac_private_plan
            WHERE fk_people = p_fk_people
              AND fk_infection = p_fk_infection
              AND fn_vaccin_period = 0
              AND fk_status = c_plan_status
              AND fd_plan_date <= v_end_date;

      -- ��������� ��������������� ��������, ��������� �� �������
      -- ����������
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

      -- ������� ��������������� ��������, ���������� � ����������� ����.
      -- ������� ��������, ��������� �� ������� ����������.
      DELETE FROM tvac_private_plan
            WHERE fk_people = p_fk_people
              AND fk_infection = p_fk_infection
              AND fn_vaccin_period > 0
              AND fk_status = c_plan_status
              AND fd_plan_date <= v_end_date;
    END IF;
  END DELETE_VAC_PLAN;

------------------------------------------------------------------------------
-- ������������� ��� �������������� ��������������� �����
-- ��� �������� ��������.
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

    -- ���������, ���� �� � �������� �������������� ����
    SELECT COUNT(*)
      INTO v_valid_plan
      FROM DUAL
     WHERE EXISTS (SELECT NULL
                     FROM tvac_private_plan
                    WHERE tvac_private_plan.fk_infection = p_fk_infection
                      AND tvac_private_plan.fk_people = p_fk_people
                      AND tvac_private_plan.fn_kratn = p_fn_kratn);

    IF v_valid_plan > 0 THEN
      -- �������� ������� - ���������� ����������� ��������.
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
-- ������������� ��� ����������� ��������������� �����
-- ��� ��� ����������.
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

      -- ���������, ���� �� � �������� �������������� ����
      SELECT COUNT(*)
        INTO v_valid_plan
        FROM DUAL
       WHERE EXISTS (SELECT NULL
                       FROM tvac_private_plan
                      WHERE fk_infection = cur_vac_people.fk_infection
                        AND fk_people = cur_vac_people.fk_people);

      IF v_valid_plan > 0 THEN
        -- ����������� �������� � ��������
        -- "����� �� �����������", ����� ������� ����������.
        DELETE FROM tvac_private_plan
         WHERE fn_kratn >= cur_vac_people.fn_kratn
           AND fk_people = cur_vac_people.fk_people
           AND fk_status = c_plan_status
           AND fk_infection = cur_vac_people.fk_infection
           AND fn_not_vaccin > 0;

        -- �������� ���� ����������� ��������, ������� ����� ��������
        -- ��� ����������. ���������� ��� ������ ��������� �� �����������.
        FOR cur_plan IN (
            SELECT fd_plan_date, fk_infection
              FROM tvac_private_plan
             WHERE fn_kratn = cur_vac_people.fn_kratn
               AND fk_people = cur_vac_people.fk_people
               AND fk_status = c_plan_status
               AND fk_infection = cur_vac_people.fk_infection) LOOP

          -- ���� �����������, �� �����������, ����������� ��������
          -- ����� ������� "�� ����������� � ���������� ������", ��
          -- �� ����� ������� �����������.
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

        -- ���������, ���� ������ ����������� �������� ����������� �� ����
        -- �������, �� ���������� �������� � �������������� ����
        -- ����� ������������� �������.
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

        -- �������� ��������� - ������ ������� � �����.
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
-- ������������� ��� ������������ ������ ��� ��� combobox
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
-- ������������� ��� ������������ ��������������� ����� ��� ������
-- ���������.
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
-- ���������� ��������� �� ���������� �������
-- ������� ���������� ��� APEX (����������� ������� ����� ����� ������ ���������)
--------------------------------------------------------------------------------
-- ���������� ��������� �� ���������� �������
-- ������� ���������� ��� APEX (����������� ������� ����� ����� ������ ���������)
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
      v_sql := v_sql || '"�������"';
      v_sql1 := ' and a.fp_sex=0';
   ELSIF p_sex = 1
   THEN
      v_sql := v_sql || '"�������"';
      v_sql1 := ' and a.fp_sex=1';
   ELSE
      v_sql := v_sql || '"���"';
   END IF;

   v_sql := v_sql || CHR (13)||'  FROM tpeoples a, tvac_map';
   v_sql := v_sql ||CHR (13)|| '  WHERE a.fk_id = tvac_map.fk_people AND tvac_map.fl_del <> 1';
   v_sql := v_sql || CHR (13);
   v_sql := v_sql || '  and a.fd_rojd <= sysdate';

   IF v_sql1 <> ''
   THEN
      v_sql := v_sql || CHR (13) || v_sql1;
   END IF;

   -- ������
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


