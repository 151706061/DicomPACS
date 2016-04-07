DROP TRIGGER ASU.TNAZIS_UPDATE_TSMINI
/

--
-- TNAZIS_UPDATE_TSMINI  (Trigger) 
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
CREATE OR REPLACE TRIGGER ASU."TNAZIS_UPDATE_TSMINI" 
 BEFORE 
 UPDATE
 ON ASU.TNAZIS  REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
DECLARE
   sMODULENAME VARCHAR2(3000);
   NNUM   NUMBER;
   NCNT   NUMBER;
BEGIN
  SELECT PROGRAM INTO sMODULENAME
    FROM V$SESSION
   WHERE SID=USERENV('SID');
   IF (sMODULENAME <> 'List_xrays_lab.exe') AND (sMODULENAME <> 'List_xrays_vrach.exe') AND (sMODULENAME <> 'RgRegistr.exe') THEN

--raise_application_error (-20000, '!update');

     IF :NEW.FC_TYPE IS NULL THEN

       SELECT FC_VALUE -- берем последний порядковый номер
         INTO NNUM
         FROM TSMINI
        WHERE FC_SECTION = 'XRAY_NAPRAVLENIE' AND FC_KEY = 'ID_NUMBER';

       SELECT COUNT(*) -- проверяем является ли данное назначение рентгенологическим
         INTO NCNT
         FROM DUAL
        WHERE EXISTS (SELECT FK_ID
                        FROM TSMID
                       WHERE FL_SHOWANAL = 1 AND FL_SHOWPRINT = 1 AND TSMID.FK_ID = :NEW.FK_SMID
                      CONNECT BY PRIOR FK_ID = FK_OWNER
                      START WITH FK_ID in (ASU.GET_RG_ISSL, asu.get_rad_issl));

       IF NCNT > 0 THEN
         NNUM := NNUM + 1;
         :NEW.FC_TYPE := TO_CHAR (NNUM); -- если рентгеновское то увеличиваем порядковый номер на 1

       ASU.DO_UPDATE_TSMINI(nNUM);
--       UPDATE TSMINI SET FC_VALUE = TO_CHAR (NNUM) WHERE FC_SECTION = 'XRAY_NAPRAVLENIE' AND FC_KEY = 'ID_NUMBER';
       END IF;
     END IF;
   END IF;
END;
/
SHOW ERRORS;


