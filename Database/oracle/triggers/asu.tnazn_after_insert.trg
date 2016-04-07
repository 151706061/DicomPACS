DROP TRIGGER ASU.TNAZN_AFTER_INSERT
/

--
-- TNAZN_AFTER_INSERT  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   TDOC (Table)
--   TNAZN (Table)
--   TNAZN_LINK_VNAZ (Table)
--   PKG_SMID (Package)
--   GET_ANALID (Function)
--   GET_ISSLEDID (Function)
--   GET_KONSID (Function)
--   GET_NEVIP (Function)
--   GET_NEYAV (Function)
--   GET_PROCID (Function)
--   GET_VIPNAZ (Function)
--   VNAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZN_AFTER_INSERT" 
 AFTER
 INSERT
 ON asu.tnazn
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
declare
  v_Root_SMID integer;
  v_ID integer;
  v_Status Integer;
  v_KARTA_ID INTEGER;
begin
  --DBMS_OUTPUT.put_line(TO_CHAR(:new.FK_ID));
  -- Перобразуем статус
  select Decode(:new.FK_STATUS,1,GET_NEVIP,2,GET_VIPNAZ,3,GET_NEYAV,4,GET_NEVIP,5,GET_NEVIP) into v_Status from dual;
  -- синхронизация на VNAZ
  --2004.01.30
  --  В PAC_ID оказывается надо записывать DOC_ID
  --2004.03.30
    --  В PAC_ID оказывается надо записывать AMBULANCE_ID, который берется из TDOC.fk_kart_id
    -- А в docid нужно docid
  SELECT FK_KARTAID INTO v_KARTA_ID FROM TDOC WHERE fk_id=:NEW.FK_DOC_ID;
  INSERT INTO  VNAZ
    ( FK_SMID , FC_REMARK , FD_NAZ , FD_RUN, FK_PACID ,  FK_NAZSOSID,FK_VRACHID,fk_docid )
  VALUES( :new.FK_SMID, :new.FV_COMMENT,:NEW.FD_DATE_CREATE, :NEW.FD_DATE_CREATE, v_KARTA_ID, v_Status,:NEW.FK_CREATOR,:NEW.FK_DOC_ID)
  Return FK_ID into  v_ID;
  -- Теперь в таблицу линков
  INSERT INTO  ASU.TNAZN_LINK_VNAZ   ( FK_TNAZN , FK_VNAZ )
  VALUES( :new.FK_ID, v_ID ) ;
  Return; -- остальная часть как заготовка на будующее
  v_Root_SMID:=PKG_SMID.getrootlevelid(:new.FK_SMID);
  IF v_Root_SMID = get_issledid
  THEN -- исследования
    Return;
  ELSIF v_Root_SMID = get_konsid
  THEN  -- консультации
    Return;
  ELSIF v_Root_SMID =  get_analid
  THEN  -- консультации
    Return;
  ELSIF v_Root_SMID =  get_procid
  THEN -- анализы
    Return;
  END IF;
--  Errors handling
end;
/
SHOW ERRORS;


