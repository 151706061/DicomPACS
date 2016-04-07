CREATE OR REPLACE TRIGGER MED.TDPC_INS
 BEFORE 
 INSERT
 ON MED.TDPC
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW 
Begin
  if :new.DPCID is null then
    select SEQ_TDPC.nextval into :new.DPCID from dual;
  end if;
 :NEW.FK_CREATE_MO_ID := med.pkg_medses.get_curmo;
 :NEW.FD_CREATE := sysdate;
End;
/
