DROP TRIGGER ASU.TNAZVRACH_DELETE
/

--
-- TNAZVRACH_DELETE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   TNAZVRACH_OLD (Table)
--   VNAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZVRACH_DELETE" 
  BEFORE INSERT
  ON ASU.TNAZVRACH_OLD   REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW
declare
cursor c2 is select 'Есть' from dual where exists (select fc_name from vnaz where fk_roomid = :old.fk_kabinetid and fk_ispolid=:old.fk_sotrid);
Begin
  open c2;
  if not c2%notfound then
    raise_application_error(-20001, 'Этот врач уже проводил в этом кабинете назначения');
    close c2;
    return;
  end if;
End;
/
SHOW ERRORS;


