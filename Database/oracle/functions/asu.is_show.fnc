DROP FUNCTION ASU.IS_SHOW
/

--
-- IS_SHOW  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."IS_SHOW" ( fk_smid IN NUMBER) RETURN NUMBER IS
CURSOR c1 is select /*+rule*/ fl_showanal from tsmid start with fk_id=fk_smid
             connect by prior fk_id=fk_owner;
Show NUMBER :=0.0;
BEGIN
  for i in c1 loop
    if i.fl_showanal=1 then
      return 1;
    end if;
  end loop;
  RETURN 0;
END;
/

SHOW ERRORS;


