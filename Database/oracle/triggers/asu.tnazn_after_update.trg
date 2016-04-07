DROP TRIGGER ASU.TNAZN_AFTER_UPDATE
/

--
-- TNAZN_AFTER_UPDATE  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   TDOC (Table)
--   TNAZN (Table)
--   TNAZN_LINK_VNAZ (Table)
--   GET_NEVIP (Function)
--   GET_NEYAV (Function)
--   GET_VIPNAZ (Function)
--   VNAZ (Table)
--
CREATE OR REPLACE TRIGGER ASU."TNAZN_AFTER_UPDATE" 
 AFTER
 UPDATE
 ON asu.tnazn
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
declare
  v_Root_SMID integer;
  v_ID_VNAZ integer;
  v_Status Integer;
  v_KARTA_ID INTEGER;
begin
  -- ������� ������ ��� VNAZ
  select FK_VNAZ into v_ID_VNAZ from TNAZN_LINK_VNAZ where FK_TNAZN=:NEW.FK_ID;
  --2004.03.30
    --  � PAC_ID ����������� ���� ���������� AMBULANCE_ID, ������� ������� �� TDOC.fk_kart_id
    -- � � docid ����� docid
  SELECT FK_KARTAID INTO v_KARTA_ID FROM TDOC WHERE fk_id=:NEW.FK_DOC_ID;
  -- ����������� ������
  select Decode(:new.FK_STATUS,1,GET_NEVIP,2,GET_VIPNAZ,3,GET_NEYAV,4,GET_NEVIP,5,GET_NEVIP) into v_Status from dual;
  UPDATE  VNAZ A
  SET
   A.FK_SMID = :NEW.FK_SMID
   , A.FC_REMARK = :new.FV_COMMENT
   , A.FD_NAZ = :NEW.FD_DATE_CREATE
   , A.FD_RUN = :NEW.FD_DATE_CREATE
   , A.FK_PACID = v_KARTA_ID
   , A.FK_DOCID=:NEW.FK_DOC_ID
   , A.FK_NAZSOSID = v_Status
   , A.FK_VRACHID = :NEW.FK_CREATOR
  where FK_ID=v_ID_VNAZ;
end;
/
SHOW ERRORS;


