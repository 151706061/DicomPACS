CREATE OR REPLACE TRIGGER TNAZIS_BEFORE_INSERT_AN
 BEFORE
 INSERT
 ON ASU.TNAZIS
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
declare
 v_tmp number;
BEGIN
  -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  для сургут травмы не нужен 
--  begin
--    select ASU.GET_DEF_FUNCT('xray_genAcc',1) into v_tmp from dual;
--  exception
--  when others then
--    v_tmp:=0;
--  end;
  -- запись ACCESSIONNUMBER
--  if ((v_tmp=1) and (trim(:new.fc_accessionnumber) is null)) then
  if (trim(:new.fc_accessionnumber) is null) then
    select to_char(MED.SEQ_TANNMBSTR.NEXTVAL) into :new.fc_accessionnumber from dual;
  end if;
  -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
END;
/


