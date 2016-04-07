DROP PACKAGE BODY ASU.PKG_WORKDAYS
/

--
-- PKG_WORKDAYS  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_WORKDAYS"
IS
-- ѕает дл€ работы с рабочими дн€ми
-- использует таблицу TWORKDAYS
-- Author: Ura
--------------------------------------------------------------------------------
-- делает день рабочим или выходным в зависимости от параметра p_l
--  1- рабочий, 0 выходной
-- p_safely если этот параметр »—“»Ќј, то не измен€ет значение записи в таблице
-- (т.е. безопасный режим, сделан дл€ случаев, если будет происходить заполнение
-- дл€ годов в которых некоторые праздники проставлены)
PROCEDURE setworkday (p_date IN DATE, p_l IN NUMBER, p_safely BOOLEAN := FALSE)
AS
   CURSOR c_wdays (pc_date IN DATE)
   IS
      SELECT fl
        FROM tworkdays
       WHERE fd_date = pc_date;
  v_l Integer;
BEGIN
   OPEN c_wdays (p_date);
   FETCH c_wdays into v_l;
   IF c_wdays%FOUND
   THEN
      IF NOT p_safely
      THEN
         -- если без флага безопасно, то будем апдейтить
         UPDATE tworkdays
            SET fl = p_l
          WHERE fd_date = p_date;
      END IF;
   ELSE
      INSERT INTO tworkdays
                  (fd_date, fl )
           VALUES (p_date, p_l
                  );
   END IF;
   close c_wdays;
END setworkday;
--------------------------------------------------------------------------------
-- заполн€ет год значени€ми по умолчанию рабочий или нет
-- пример использовани€ pkg_workdays.yearfill(2004);
-- Author: Ura
PROCEDURE yearfill (p_year IN INTEGER)
AS
   v_c          INTEGER;
   v_firstday   DATE;
   v_date       DATE;
   i            INTEGER;
   v_weekday    INTEGER;
   v_iswork     INTEGER;
BEGIN
   v_firstday := TO_DATE ('0101' || TO_CHAR (p_year), 'DDMMYYYY');
   v_c := TO_DATE ('0101' || TO_CHAR (p_year + 1), 'DDMMYYYY') - v_firstday;

   FOR i IN 0 .. v_c-1
   LOOP
      v_date := v_firstday + i;
      v_weekday := MOD(TO_NUMBER(TO_CHAR(v_date, 'J')), 7) + 1;

      IF BITAND (POWER (2, v_weekday - 1), 65) > 0  -- 65 маска выходных дл€ субботы воскресень€
      THEN
         setworkday (v_date, 0, TRUE);                             -- выходной
      ELSE
         setworkday (v_date, 1, TRUE);                             -- рабочий
      END IF;
   END LOOP;
END yearfill;
--------------------------------------------------------------------------------
-- ¬озвращает 1 если день рабочий
-- 0 если день нерабочий
-- Author: Ura
FUNCTION isworkday (p_date IN DATE)
  RETURN NUMBER
IS
  CURSOR c_wdays (pc_date IN DATE)
  IS
    SELECT fl
      FROM tworkdays
     WHERE fd_date = pc_date;

  v_l   NUMBER;
BEGIN
  OPEN c_wdays (p_date);

  FETCH c_wdays
   INTO v_l;

  IF c_wdays%FOUND
  THEN
    RETURN v_l;
  ELSE
    raise_application_error (-20111,
                                'isWorkday: нет информации о рабочем дне'
                             || TO_CHAR (p_date, 'DD.MM.YYYY')
                            );
  END IF;

  CLOSE c_wdays;
END isworkday;
--------------------------------------------------------------------------------
-- ≈сли на обпределенную дату не заполнена таблица с рабочими дн€ми, то заполн€ет на весь год
-- Author: Ura
PROCEDURE checkfill_year (p_date IN DATE)
IS
  CURSOR c_wdays (pc_date IN DATE)
  IS
    SELECT fl
      FROM tworkdays
     WHERE fd_date = pc_date;

  v_l   NUMBER;
BEGIN
  OPEN c_wdays (p_date);

  FETCH c_wdays
   INTO v_l;

  IF c_wdays%NOTFOUND
  THEN
    yearfill (EXTRACT (YEAR FROM p_date));
  END IF;

  CLOSE c_wdays;
END checkfill_year;
--------------------------------------------------------------------------------
--  оличиество рабочих дней между датами
-- Author: Ura
FUNCTION workdays_between (p_d1 IN DATE, p_d2 IN DATE)
  RETURN NUMBER
IS
  v_ret   INTEGER;
BEGIN
  SELECT COUNT (*)
    INTO v_ret
    FROM tworkdays
   WHERE fd_date >= p_d1 AND fd_date < p_d2 AND fl = 1;

  RETURN v_ret;
EXCEPTION
  WHEN NO_DATA_FOUND
  THEN                                       -- caution handles all exceptions
    raise_application_error
                           (-20112,
                            'workdays_between: нет информации о рабочих дн€х'
                           );
END workdays_between;
--------------------------------------------------------------------------------
-- возвращает следующий рабочий день от переданной даты
-- Author: Ura
FUNCTION next_workday (p_d IN DATE)
  RETURN DATE
IS
  v_d   DATE;
BEGIN
  v_d := TRUNC (p_d) + 1;

  WHILE isworkday (v_d) <> 1
  LOOP
    v_d := v_d + 1;
  END LOOP;

  RETURN v_d;
END next_workday;
--------------------------------------------------------------------------------
-- ¬озвращает предыдущий рабочий день от переданной даты
-- Author: Ura
FUNCTION previous_workday (p_d IN DATE)
  RETURN DATE
IS
  v_d   DATE;
BEGIN
  v_d := TRUNC (p_d) + 1;

  WHILE isworkday (v_d) <> 1
  LOOP
    v_d := v_d + 1;
  END LOOP;

  RETURN v_d;
END previous_workday;
--------------------------------------------------------------------------------


END;
/

SHOW ERRORS;


