DROP FUNCTION ASU.GET_TEMPOARY_TABLE
/

--
-- GET_TEMPOARY_TABLE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   DBMS_SQL (Synonym)
--   DBMS_UTILITY (Synonym)
--   TTIPROOM (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_TEMPOARY_TABLE" -- Created by TimurLan 4 rPutsPlan
  RETURN  VARCHAR2 IS
  CURSOR cRoom IS
         select fk_id,fc_vid
           from ttiproom
          where fk_id > 0
          order by 1;
  cID NUMBER;
  cSQL VARCHAR2(4000);
  cTableName VARCHAR2(30);
  dummy NUMBER;
BEGIN
  cTableName:='TEMPORARY'||TO_CHAR(SYSDATE,'yyyyddmmhh24miss')||DBMS_UTILITY.GET_TIME;
  cSQL:='create table '||cTableName||' (';
  FOR p in cRoom LOOP
    cSQL:=cSQL||'COL_'||p.FK_ID||' NUMBER(15) default 0, ';
  END LOOP;
  cSQL:=cSQL||' FK_ID NUMBER(15) )';
  cID:=dbms_sql.open_cursor;
  dbms_sql.parse(cID, cSQL, dbms_sql.native);
  dummy := dbms_sql.execute(cID);
  dbms_sql.close_cursor(cID);
  RETURN cTableName;
END;
/

SHOW ERRORS;


