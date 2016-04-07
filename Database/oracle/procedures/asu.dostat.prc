DROP PROCEDURE ASU.DOSTAT
/

--
-- DOSTAT  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   DBMS_STATS (Synonym)
--
CREATE OR REPLACE PROCEDURE ASU.DoStat(aOwner Varchar2, aTable Varchar2) is
begin
  DBMS_STATS.GATHER_TABLE_STATS(aOwner, aTable, CASCADE => TRUE);
END;
/

SHOW ERRORS;


