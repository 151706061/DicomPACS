DROP PACKAGE ASU.DIKTTASK
/

--
-- DIKTTASK  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."DIKTTASK" 
IS

   PROCEDURE addtask (pfk_blobid IN NUMBER, pfk_clobid IN NUMBER, pfc_comment IN varchar2, pfk_vrachid IN NUMBER);
   FUNCTION istaskexists (pfc_comment IN VARCHAR2) RETURN BOOLEAN;
   PROCEDURE deltask (pfk_id IN NUMBER);
   PROCEDURE deltask (pfc_comment IN varchar2);

END;
/

SHOW ERRORS;


