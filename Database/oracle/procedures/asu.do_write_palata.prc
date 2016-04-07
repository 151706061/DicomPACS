DROP PROCEDURE ASU.DO_WRITE_PALATA
/

--
-- DO_WRITE_PALATA  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TROOM (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_WRITE_PALATA" 
   ( pFK_ID IN NUMBER,pFC_PALATA IN VARCHAR2,pFN_FLOOR IN NUMBER,pFC_OPIS IN VARCHAR2,pFK_VRACHID IN NUMBER)
   IS
BEGIN
  if pFC_PALATA IS NULL then
    raise_application_error(-20030,'Не введено название палаты!');
  end if;
  if pFN_FLOOR<=0 then
    raise_application_error(-20031,'Не введен номер этажа!');
  end if;
  if pFK_VRACHID<=0 then
    raise_application_error(-20032,'Не введен закрепленный врач!');
  end if;
  UPDATE TROOM SET FC_PALATA=pFC_PALATA,FN_FLOOR=pFN_FLOOR,FC_OPIS=pFC_OPIS,FK_VRACHID=pFK_VRACHID WHERE FK_ID=pFK_ID;
END; -- Procedure
/

SHOW ERRORS;


