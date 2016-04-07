DROP PROCEDURE ASU.DO_WRITE_UCHSTOK
/

--
-- DO_WRITE_UCHSTOK  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TUCHASTOK (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_WRITE_UCHSTOK" 
   ( pFK_ID IN NUMBER,pFC_PALATA IN VARCHAR2,pFC_OPIS IN VARCHAR2,pFK_VRACHID IN NUMBER)
   IS
BEGIN
  if pFC_PALATA IS NULL then
    raise_application_error(-20030,'?? ??????? ???????? ??????!');
  end if;
  if pFK_VRACHID<=0 then
    raise_application_error(-20032,'?? ?????? ???????????? ????!');
  end if;
  UPDATE TUCHASTOK SET FC_NAME=pFC_PALATA,FC_OPIS=pFC_OPIS,FK_VRACHID=pFK_VRACHID WHERE FK_ID=pFK_ID;
END; -- Procedure
/

SHOW ERRORS;


