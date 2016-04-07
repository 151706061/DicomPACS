DROP FUNCTION ASU.GET_FIORASPPAC
/

--
-- GET_FIORASPPAC  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TPACLST (Table)
--   GET_PACFIO (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_FIORASPPAC" (agrid  in number,
                                          anazid in number) RETURN varchar2 IS
  res varchar2(255);
  cursor c is
    select get_pacfio(fk_pacid) as fio
      from tpaclst
     where fk_graphid = agrid and nazid = anazid;

BEGIN
  open c;
  fetch c
    into res;
  close c;
  return res;
END;
/

SHOW ERRORS;


