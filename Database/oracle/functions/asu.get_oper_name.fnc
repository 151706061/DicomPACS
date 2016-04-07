DROP FUNCTION ASU.GET_OPER_NAME
/

--
-- GET_OPER_NAME  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   GET_IBSMIDVALUES (Function)
--   TIB (Table)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_OPER_NAME" (NFK_ID NUMBER) RETURN VARCHAR2 AS
  /*
   Created By Spasskiy S.N. 02.10.2008
   возвращает название операции
  */
  stmp VARCHAR2(4000);
BEGIN
  FOR C IN (SELECT REPLACE(MAX(tib.fc_char), '.', '. ') s
              FROM (SELECT fk_id, fc_name
                      FROM tsmid
                     WHERE fc_synonim = 'PROTHOPER_NAME') sm,
                   asu.tib
             WHERE tib.fk_pacid = NFK_ID
               AND tib.fk_smid = sm.fk_id) LOOP
    sTmp := C.s;
  END LOOP;
  FOR C IN (SELECT REPLACE(MAX(tib.fc_char), '.', '. ') s
              FROM (SELECT fk_id
                      FROM tsmid
                    CONNECT BY PRIOR fk_id = fk_owner
                     START WITH fc_synonim = 'PROTHOPER_DOPNAME') sm,
                   asu.tib
             WHERE tib.fk_pacid = NFK_ID
               AND tib.fk_smid = sm.fk_id) LOOP
    sTmp := sTmp || ' ' || C.s;
  END LOOP;
  FOR C IN (SELECT sm.fc_name s
              FROM (SELECT fk_id, fc_name
                      FROM tsmid
                    CONNECT BY PRIOR fk_id = fk_owner
                     START WITH fc_synonim = 'PROT_HOPERDOPNAME2') sm,
                   asu.tib
             WHERE tib.fk_pacid = NFK_ID
               AND tib.fk_smid = sm.fk_id) LOOP
    sTmp := sTmp || ' ' || C.s;
  END LOOP;
  sTmp := sTmp || ', ' || stat.get_ibsmidvalues(NFK_ID, 'RENTGENXIR_NAME');
  /*FOR C IN (SELECT sm.fc_name s
              FROM (SELECT fk_id, fc_name
                      FROM tsmid
                    CONNECT BY PRIOR fk_id = fk_owner
                     START WITH fc_synonim = 'RENTGENXIR_NAME') sm,
                   asu.tib
             WHERE tib.fk_pacid = NFK_ID
               AND tib.fk_smid = sm.fk_id) LOOP
    sTmp := sTmp || ', ' || C.s;
  END LOOP;*/
  RETURN stmp;
END;
/

SHOW ERRORS;


