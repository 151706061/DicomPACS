DROP TRIGGER ASU.TNAZIS_AFTER_INSERT_TSMINI
/

--
-- TNAZIS_AFTER_INSERT_TSMINI  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   V$SESSION (Synonym)
--   DUAL (Synonym)
--   TNAZIS (Table)
--   TSMINI (Table)
--   TSMID (Table)
--   GET_RAD_ISSL (Function)
--   GET_RG_ISSL (Function)
--   DO_UPDATE_TSMINI (Procedure)
--
CREATE OR REPLACE TRIGGER ASU."TNAZIS_AFTER_INSERT_TSMINI" 
 BEFORE 
 INSERT
 ON ASU.TNAZIS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
  sMODULENAME VARCHAR2(3000);
  nCnt NUMBER;
  nNum NUMBER;
BEGIN
  SELECT PROGRAM INTO sMODULENAME
    FROM V$SESSION
   WHERE SID=USERENV('SID');

  IF (sMODULENAME <> 'List_xrays_lab.exe') AND (sMODULENAME <> 'List_xrays_vrach.exe') AND (sMODULENAME <> 'RgRegistr.exe') THEN

--raise_application_error (-20000, '!insert');

    SELECT FC_VALUE INTO nNum
      FROM TSMINI
     WHERE FC_SECTION = 'XRAY_NAPRAVLENIE'
       AND FC_KEY = 'ID_NUMBER'; -- берем порядковый номер из TSMINI
       
    SELECT COUNT (*) INTO nCnt
      FROM DUAL
    WHERE EXISTS (SELECT fk_id
                    FROM tsmid
                   WHERE fl_showanal = 1
                     AND  fl_showprint = 1
                     AND tsmid.fk_id = :NEW.fk_smid
                  CONNECT BY PRIOR fk_id = fk_owner
                  START WITH fk_id in (asu.get_rg_issl, asu.get_rad_issl)); -- проверяем рентгеновское ли это назначение
                  
    IF nCnt > 0 THEN -- если рентгеновское то прибавляем 1 к порядковому номеру
      nNUM := nNUM + 1;
      :NEW.FC_TYPE := TO_CHAR(nNUM);
      ASU.DO_UPDATE_TSMINI(nNUM);
--      UPDATE TSMINI SET FC_VALUE = TO_CHAR(nNUM) WHERE FC_SECTION = 'XRAY_NAPRAVLENIE' AND FC_KEY = 'ID_NUMBER';
 --     commit;
    END IF;
END IF;
END;
/
SHOW ERRORS;


