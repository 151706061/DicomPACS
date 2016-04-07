DROP PROCEDURE ASU.DO_ADDAUDIT
/

--
-- DO_ADDAUDIT  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   V$MYSTAT (Synonym)
--   V$SESSION (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TAUDIT (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_ADDAUDIT" (
  sfc_bulo      IN   VARCHAR2
 ,sfc_stalo     IN   VARCHAR2
 ,sfc_object    IN   VARCHAR2
 ,nfk_vrachid   IN   NUMBER
 ,sFC_OPER           VARCHAR2 DEFAULT NULL
)
IS
  sfc_terminal   VARCHAR2 (80);
  sfc_osuser     VARCHAR2 (80);
BEGIN
  SELECT terminal, osuser
    INTO sfc_terminal, sfc_osuser
    FROM v$session
   WHERE sid = (SELECT sid
                  FROM v$mystat
                 WHERE ROWNUM = 1);

  INSERT INTO taudit
              (fc_terminal, fc_osuser, fc_bulo, fc_stalo, fc_object, fk_vrachid, fc_oper)
       VALUES (sfc_terminal, sfc_osuser, sfc_bulo, sfc_stalo, sfc_object, nfk_vrachid, sFC_OPER);
END;
/

SHOW ERRORS;


