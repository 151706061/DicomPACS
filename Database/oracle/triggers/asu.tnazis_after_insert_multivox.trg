DROP TRIGGER ASU.TNAZIS_AFTER_INSERT_MULTIVOX
/

--
-- TNAZIS_AFTER_INSERT_MULTIVOX  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   V$SESSION (Synonym)
--   SET_CLOB_MULTIVOX (Function)
--   TNAZIS (Table)
--   TSMID (Table)
--   GET_ENDOSCOP_ISSL (Function)
--   GET_PASS_REGISTRATOR (Function)
--   "DbConnector" (Table)
--   NEW_UUID (Function)
--
CREATE OR REPLACE TRIGGER ASU."TNAZIS_AFTER_INSERT_MULTIVOX" 
 AFTER 
 INSERT
 ON ASU.TNAZIS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  sMODULENAME VARCHAR2(100);
  sGUID VARCHAR2(36);
  nOwner NUMBER;
BEGIN
  SELECT PROGRAM INTO sMODULENAME
    FROM V$SESSION
   WHERE SID=USERENV('SID');
-- -->> 1. ��������� ���������� �� ���������� ����� ������ �������� ��� �������� ������ ��� �����������
  IF (sMODULENAME = 'List_xrays_lab.exe') OR
     (sMODULENAME = 'List_xrays_vrach.exe') OR
     (sMODULENAME = 'RgRegistr.exe') OR
     (sMODULENAME = 'TestMultiVox.exe') THEN

    sGUID := NEW_UUID;
    INSERT INTO ASU."DbConnector"("oID", "UID", "Source", "Destination", "ContentType", "Message", "SendTime", "ExchangeTime", "NazID")
    VALUES(LOWER(NEW_UUID), LOWER(sGUID), 'MIS', 'RIS', NULL,
           ASU.SET_CLOB_MULTIVOX(:NEW.FK_ID,
                                 :NEW.FK_PACID,
                                 :NEW.FK_VRACHID,
                                 :NEW.FD_RUN, 
                                 :NEW.FC_TYPE,
                                 :NEW.FK_SMID,
                                 :NEW.FK_ISPOLID,
                                 :NEW.FK_ROOMID,
                                 sGUID,
                                 :NEW.FK_NAZSOSID),
           systimestamp, to_date('01.01.1900', 'dd.mm.yyyy'), :NEW.FK_ID);
  else -- ���� �� ����� ������ �������, �� ��������� ��� �� ������������
    select fk_owner into nOwner from asu.tsmid where fk_id = :new.fk_smid;
    if nOwner = asu.get_endoscop_issl then
      if :new.fk_nazsosid <> asu.get_pass_registrator then
        sGUID := NEW_UUID;
        INSERT INTO ASU."DbConnector"("oID", "UID", "Source", "Destination", "ContentType", "Message", "SendTime", "ExchangeTime", "NazID")
        VALUES(LOWER(NEW_UUID), LOWER(sGUID), 'MIS', 'RIS', NULL,
               ASU.SET_CLOB_MULTIVOX(:NEW.FK_ID,
                                     :NEW.FK_PACID,
                                     :NEW.FK_VRACHID,
                                     :NEW.FD_RUN,
                                     :NEW.FC_TYPE,
                                     :NEW.FK_SMID,
                                     :NEW.FK_ISPOLID,
                                     :NEW.FK_ROOMID,
                                     sGUID,
                                     :NEW.FK_NAZSOSID),
               systimestamp, to_date('01.01.1900', 'dd.mm.yyyy'), :NEW.FK_ID);
      end if;
    end if;           
  END IF; 
END;
/
SHOW ERRORS;


