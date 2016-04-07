DROP TRIGGER ASU.TAMBULANCE_BEFORE_INSERT
/

--
-- TAMBULANCE_BEFORE_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SEQ_TKARTA (Sequence)
--   TAMBULANCE (Table)
--   TAMBVRACH (Table)
--   TANAMNEZ (Table)
--   TEPID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TAMBULANCE_BEFORE_INSERT" 
 BEFORE 
 INSERT
 ON ASU.TAMBULANCE  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
Begin
  SELECT SEQ_TKARTA.NEXTVAL INTO :NEW.FK_ID FROM DUAL;
/*  :NEW.FK_IBY:=TO_CHAR(SYSDATE,'YYYY');
  SELECT MAX(FK_IBID)+1 INTO :NEW.FK_IBID FROM TAMBULANCE WHERE  FK_IBY=:NEW.FK_IBY;
  IF :NEW.FK_IBID is NULL then
    :NEW.FK_IBID:=1;
  end IF;
*/
  insert into TANAMNEZ (FK_PACID,FL_AMB) VALUES(:NEW.FK_ID,1);
  insert into TEPID (FK_PACID,FL_AMB) VALUES(:NEW.FK_ID,1);
  insert into TAMBVRACH (FK_PACID,FL_VID) VALUES(:NEW.FK_ID,'M');
End;
/
SHOW ERRORS;

