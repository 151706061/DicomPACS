CREATE OR REPLACE TRIGGER ASU.TNAZIS_BEFORE_DELETE_MULTIVOX
 BEFORE 
 DELETE
 ON ASU.TNAZIS
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW 
DECLARE
  sMODULENAME VARCHAR2(100);
  sGUID VARCHAR2(36);
  nOwner NUMBER;
BEGIN
  SELECT PROGRAM INTO sMODULENAME
    FROM V$SESSION
   WHERE SID=USERENV('SID');
-- -->> 1. Проверяем происходит ли добавление через модули рентгена
  IF ( asu.get_tnazis_mod(:OLD.FK_SMID) is not null ) or
     (sMODULENAME = 'List_xrays_lab.exe') OR
     (sMODULENAME = 'List_xrays_vrach.exe') OR
     (sMODULENAME = 'RgRegistr.exe') OR
     (sMODULENAME = 'TestMultiVox.exe') THEN
    sGUID := NEW_UUID;
    INSERT INTO ASU."DbConnector"("oID", "UID", "Source", "Destination", "ContentType", "Message", "SendTime", "ExchangeTime", "NazID")
    VALUES(LOWER(NEW_UUID), LOWER(sGUID), 'MIS', 'RIS', NULL,
           ASU.SET_CLOB_MULTIVOX(:OLD.FK_ID,
                                 :OLD.FK_PACID,
                                 :OLD.FK_VRACHID,
                                 :OLD.FD_RUN, 
                                 :OLD.FC_TYPE,
                                 :OLD.FK_SMID,
                                 :OLD.FK_ISPOLID,
                                 :OLD.FK_ROOMID,
                                 sGUID,
                                 :OLD.FK_NAZSOSID,
                                 'CA'),
           systimestamp, to_date('01.01.1900', 'dd.mm.yyyy'), :OLD.FK_ID);
  else
    select fk_owner into nOwner from asu.tsmid where fk_id = :old.fk_smid;
    if nOwner = asu.get_endoscop_issl then
      sGUID := NEW_UUID;
      INSERT INTO ASU."DbConnector"("oID", "UID", "Source", "Destination", "ContentType", "Message", "SendTime", "ExchangeTime", "NazID")
      VALUES(LOWER(NEW_UUID), LOWER(sGUID), 'MIS', 'RIS', NULL,
             ASU.SET_CLOB_MULTIVOX(:OLD.FK_ID,
                                   :OLD.FK_PACID,
                                   :OLD.FK_VRACHID,
                                   :OLD.FD_RUN,
                                   :OLD.FC_TYPE,
                                   :OLD.FK_SMID,
                                   :OLD.FK_ISPOLID,
                                   :OLD.FK_ROOMID,
                                   sGUID,
                                   :OLD.FK_NAZSOSID,
                                   'CA'),
             systimestamp, to_date('01.01.1900', 'dd.mm.yyyy'), :OLD.FK_ID);
    end if;
  END IF; 
END;
/
