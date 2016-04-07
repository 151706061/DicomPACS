DROP PACKAGE ASU.PKG_VRES
/

--
-- PKG_VRES  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_VRES" 
IS

-- MODIFICATION HISTORY
-- Andrew      11.04.2002
   FUNCTION get_nazproc_count (pnazid IN NUMBER, psmid IN NUMBER)
      RETURN NUMBER; -- Возвращает количество процедур которое храниться в TNAZPARAM, на данное назначение.
   FUNCTION get_nazproc_mask (pnazid IN NUMBER, psmid IN NUMBER)
      RETURN VARCHAR2; -- Возвращает маску прохождения процедур на данное назначение.
   PROCEDURE Write_proccount (pnazid NUMBER, psmid NUMBER, pCount number);

   PROCEDURE insert_someproc (
      psmid     IN   NUMBER,
      ppacid    IN   NUMBER,
      pnazid    IN   NUMBER,
--      psosid    IN   NUMBER,
      pdayins        DATE
   ); --Вставляет количество
   FUNCTION get_num_of_sunday
      RETURN NUMBER;
END;
/

SHOW ERRORS;


