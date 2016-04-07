DROP PROCEDURE ASU.INIT_CC
/

--
-- INIT_CC  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   PKG_SMINI (Package)
--
CREATE OR REPLACE PROCEDURE ASU."INIT_CC" IS
  v_sql VARCHAR2(32767);
  /*
  Created by Spasskiy S.N. 05102009
  Инициализирует параметры для компиляции пакетов
  Запуск влечет перекомпиляцию зависымых объектов
  */
BEGIN
  v_sql := 'CREATE OR REPLACE PACKAGE ASU.PKG_COMPILE_CONDITIONS IS';
  v_sql := v_sql || ' bUSE_DS CONSTANT BOOLEAN :=';
  --ЭЦП
  IF ASU.PKG_SMINI.READSTRING('COMPILE_CONDITIONS', 'USE_DIGITSUBSCRIBE', '0') = 1 THEN
     v_sql := v_sql || 'TRUE;';
  ELSE
     v_sql := v_sql || 'FALSE;';
  END IF;
  -- Трасфузиология
  v_sql := v_sql || ' bUSE_TRASFUS CONSTANT BOOLEAN :=';
  IF ASU.PKG_SMINI.READSTRING('COMPILE_CONDITIONS', 'USE_TRANSFUS', '0') = 1 THEN
     v_sql := v_sql || 'TRUE;';
  ELSE
     v_sql := v_sql || 'FALSE;';
  END IF;

  v_sql := v_sql || ' END PKG_COMPILE_CONDITIONS;';
  EXECUTE IMMEDIATE V_SQL;
END;
/

SHOW ERRORS;


