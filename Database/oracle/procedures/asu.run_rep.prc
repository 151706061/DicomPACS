DROP PROCEDURE ASU.RUN_REP
/

--
-- RUN_REP  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_OUTPUT (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   DO_TABLE_TO_HTML (Function)
--
CREATE OR REPLACE PROCEDURE ASU."RUN_REP" 
   IS
id number;
BEGIN
-- medstat.naz_vr;
-- medstat.diag_naz;
 id:=DO_TABLE_TO_HTML('MS');
 dbms_output.put_line('ID='||ID);
 commit;
END; -- Procedure RUN_REP
/

SHOW ERRORS;


