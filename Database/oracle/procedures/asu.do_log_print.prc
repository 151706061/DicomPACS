DROP PROCEDURE ASU.DO_LOG_PRINT
/

--
-- DO_LOG_PRINT  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   V$MYSTAT (Synonym)
--   V$SESSION (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TREPORTSLOG (Table)
--
CREATE OR REPLACE PROCEDURE ASU.DO_LOG_PRINT (pfk_reportid IN NUMBER, pfk_sotrid IN NUMBER)
IS
  CURSOR vSess IS
  SELECT terminal,
         osuser
    FROM v$session
   WHERE sid = (SELECT sid
                  FROM v$mystat
                 WHERE ROWNUM = 1);

  sfc_terminal   VARCHAR2 (80);
  sfc_osuser     VARCHAR2 (80);
BEGIN
  sfc_terminal := '';
  sfc_osuser := '';

  FOR s IN vSess
  LOOP
    sfc_terminal := s.terminal;
    sfc_osuser := s.osuser;
  END LOOP;

  INSERT INTO asu.treportslog ( fk_reportid, fk_sotrid, fc_machine, fc_osuser )
       VALUES ( pfk_reportid, pfk_sotrid, sfc_terminal, sfc_osuser );
END;
/

SHOW ERRORS;


