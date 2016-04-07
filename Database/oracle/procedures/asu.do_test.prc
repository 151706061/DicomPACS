DROP PROCEDURE ASU.DO_TEST
/

--
-- DO_TEST  (Procedure) 
--
--  Dependencies: 
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TRESAN (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_TEST" 
   IS
--
-- Purpose:
--
-- Wrote by Philip A. Milovanov
BEGIN
insert into tresan(fk_nazid,fk_smid,fd_ins,fk_blobid,fk_vrachid,fk_pacid,fn_res) values
                  (22747,3470,'22-jul-00',5238,47,21101,112);
END; -- Procedure DO_TEST
/

SHOW ERRORS;


