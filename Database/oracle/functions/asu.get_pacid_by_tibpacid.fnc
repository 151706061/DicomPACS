DROP FUNCTION ASU.GET_PACID_BY_TIBPACID
/

--
-- GET_PACID_BY_TIBPACID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZAN (Table)
--   TNAZIS (Table)
--   TNAZKONS (Table)
--   TNAZLECH (Table)
--   TTECHBOLEZNI (Table)
--   TKARTA (Table)
--   VNAZ (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_PACID_BY_TIBPACID" (pfk_pacid IN NUMBER)
   RETURN NUMBER
IS
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- Sam        01.06.2000
-- получает код пациента по его коду из таблицы TIB,
-- т.к. там в ѕј÷»ƒ лежат коды назначений
-- ---------   ------  -------------------------------------------
   CURSOR ckarta
   IS
      SELECT fk_id
        FROM tkarta
       WHERE fk_id = pfk_pacid;

   CURSOR cnaz
   IS
      SELECT fk_pacid
        FROM tnazan
       WHERE fk_id = pfk_pacid
      UNION
      SELECT fk_pacid
        FROM tnazis
       WHERE fk_id = pfk_pacid
      UNION
      SELECT fk_pacid
        FROM tnazkons
       WHERE fk_id = pfk_pacid
      UNION
      SELECT fk_pacid
        FROM tnazlech
       WHERE fk_id = pfk_pacid
      UNION
      SELECT fk_pacid
        FROM vnaz
       WHERE fk_id = pfk_pacid
      UNION
      SELECT fk_pacid
        FROM ttechbolezni
       WHERE fk_tibid = pfk_pacid;

   fk_pacid   NUMBER;
BEGIN
   fk_pacid := -1;

   OPEN ckarta;

   FETCH ckarta
    INTO fk_pacid;

   IF ckarta%NOTFOUND
   THEN
      OPEN cnaz;

      FETCH cnaz
       INTO fk_pacid;

      IF cnaz%NOTFOUND
      THEN
--      raise_application_error (-20002, '¬нимание в таблице TIB есть записи не соответсвущие не одному пациенту');
         NULL;
      END IF;

      CLOSE cnaz;
   END IF;

   CLOSE ckarta;

   RETURN fk_pacid;
END;                                                     -- Function GET_PACID_BY_TIBPACID
/

SHOW ERRORS;


