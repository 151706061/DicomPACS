DROP FUNCTION ASU.FR_TRIMIBTEXT
/

--
-- FR_TRIMIBTEXT  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--   GET_KONSID (Function)
--
CREATE OR REPLACE FUNCTION ASU."FR_TRIMIBTEXT" (p_in IN VARCHAR2)
  RETURN VARCHAR2
-- удаляет переводы строк, и лишние проблеы пред точкой
-- Сделана специальна для печати vres.fc_res
-- Author: Ura
-- 2005.06.05
IS
  CURSOR C is select distinct fc_name from tsmid where fc_type='FORM' and level in (3)
                    start with fk_id=get_konsid connect by prior fk_id=fk_owner;
                    
  v_res   VARCHAR2 (32000);
BEGIN
  v_res:= replace (p_in, chr(10) || chr(10),'');
-- По просьбе Нетребенко оставить переводы строк
--  v_res:= replace (v_res, chr(10),'');
--  v_res:= replace (v_res, chr(10),'');
--  v_res:= replace (v_res, chr(10),'');
--  v_res:= replace (v_res, chr(10),'');
  v_res:= replace (v_res, ' .','.');
   FOR c1 in c LOOP
        v_res:= replace (v_res, c1.fc_name ,chr(10)||c1.fc_name);
   END LOOP;
  v_res:= TRIM(v_res);

  RETURN v_res;
END;
/

SHOW ERRORS;


