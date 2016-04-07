CREATE OR REPLACE TRIGGER MED.TINVLIST_UPD_DEL_TRG
  BEFORE 
    UPDATE OR DELETE ON MED.TINVLIST  
  REFERENCING NEW AS NEW OLD AS OLD     
  FOR EACH ROW
begin
  if :OLD.FL_EDIT = 0 then
      RAISE_APPLICATION_ERROR ( -20001, 'Инвентаризация уже подписана!');
      return;
  end if;    

  delete from med.TINVOPIS op
  where op.INVLISTID = :OLD.INVLISTID;
end;
/
