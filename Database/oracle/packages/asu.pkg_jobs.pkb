DROP PACKAGE BODY ASU.PKG_JOBS
/

--
-- PKG_JOBS  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_JOBS" is

  -- Private type declarations
  --type <TypeName> is <Datatype>;

  -- Private constant declarations
  --<ConstantName> constant <Datatype> := <Value>;

  -- Private variable declarations
  --<VariableName> <Datatype>;

  -- Function and procedure implementations
  /*function <FunctionName>(<Parameter> <Datatype>) return <Datatype> is
    <LocalVariable> <Datatype>;
  begin
    <Statement>;
    return(<Result>);
  end;*/
  procedure DO_ANALYZE_SCHEMA is
  begin
    dbms_utility.analyze_schema('ASU', 'COMPUTE');
  end;
  /*------------------------------------------------------------------------------------------------------------------*/
  procedure DO_UPDATE_SCHEMA_STATS is
    PRAGMA AUTONOMOUS_TRANSACTION;
  begin
    dbms_stats.gather_schema_stats('ASU');
    commit;
  end;
  /*------------------------------------------------------------------------------------------------------------------*/
  procedure DO_DELETE_FROM_LOGS is
    PRAGMA AUTONOMOUS_TRANSACTION;
    PART_NAME VARCHAR(50);
    DATE_PART VARCHAR(50);
    SQL_TEXT VARCHAR(300);
  begin
    SQL_TEXT := 'alter trigger ASU.TGRAPH_LOG disable';
    execute IMMEDIATE SQL_TEXT;
    DELETE FROM ASU.TPACLST
    WHERE EXISTS(SELECT 1 FROM ASU.TGRAPH WHERE TGRAPH.FD_DATE < (TRUNC(SYSDATE) - 2) AND TPACLST.FK_GRAPHID = TGRAPH.FK_ID);
    DELETE FROM TGRAPH WHERE FD_DATE < TRUNC(SYSDATE) - 2;
    SQL_TEXT := 'alter trigger ASU.TGRAPH_LOG enable';
    execute IMMEDIATE SQL_TEXT;
    SELECT PARTITION_NAME INTO PART_NAME from dba_tab_partitions where table_name = 'TLOG' and PARTITION_POSITION = 1;
    SQL_TEXT := 'ALTER TABLE ASU.TLOG DROP PARTITION ' || PART_NAME;
    execute IMMEDIATE SQL_TEXT;
    SELECT TO_CHAR(ADD_MONTHS(TO_DATE(TO_CHAR(SYSDATE, 'YYYY-MM') ||'-01', 'YYYY-MM-DD'), 2), 'YYYY-MM-DD') INTO DATE_PART FROM DUAL;
    SQL_TEXT := 'alter table ASU.TLOG add partition LOG_' || TO_CHAR(ADD_MONTHS(TRUNC(SYSDATE, 'MM'), 1), 'MM') ||
     ' values less than (TO_DATE(''' || DATE_PART || ''', ''YYYY-MM-DD'')) TABLESPACE LOG';
    dbms_output.put_line(SQL_TEXT);   
    execute IMMEDIATE SQL_TEXT;

    SQL_TEXT := 'alter index tlog_by_id rebuild';
    execute IMMEDIATE SQL_TEXT;
    SQL_TEXT := 'alter index TLOG_BY_DATE_TABLE_FIELD_ACT rebuild';
    execute IMMEDIATE SQL_TEXT;
    SQL_TEXT := 'alter index TLOG_BY_NEW rebuild';
    execute IMMEDIATE SQL_TEXT;
    SQL_TEXT := 'alter index TLOG_BY_OWNER_TABLE_FIELD rebuild';
    execute IMMEDIATE SQL_TEXT;
    SQL_TEXT := 'alter index TLOG_BY_TABLE_FIELD_ACTION_NEW rebuild';
    execute IMMEDIATE SQL_TEXT;
    SQL_TEXT := 'alter index TLOG_BY_USER_TABLE_FIELD_ACT rebuild';
    execute IMMEDIATE SQL_TEXT;
    SQL_TEXT := 'alter index TLOG_TABLE_FIELD_NEW rebuild';
    execute IMMEDIATE SQL_TEXT;
    SQL_TEXT := 'alter index TLOG_BY_OLD rebuild';
    execute IMMEDIATE SQL_TEXT;

--    DELETE FROM TLOG WHERE TLOG.FD_LOGONTIME < ADD_MONTHS(TO_DATE('01.'||TO_CHAR(SYSDATE,'MM.YYYY'),'DD.MM.YYYY'),-5);
    DELETE FROM TAUDIT WHERE TAUDIT.FD_DATE < ADD_MONTHS(TO_DATE('01.'||TO_CHAR(SYSDATE,'MM.YYYY'),'DD.MM.YYYY'),-5);
    DELETE FROM TAUDITREP WHERE TAUDITREP.FD_INS < ADD_MONTHS(TO_DATE('01.'||TO_CHAR(SYSDATE,'MM.YYYY'),'DD.MM.YYYY'),-5);
    DELETE FROM LOG_ERRORS_TAB WHERE LOG_ERRORS_TAB.TIMESTAMP< ADD_MONTHS(TO_DATE('01.'||TO_CHAR(SYSDATE,'MM.YYYY'),'DD.MM.YYYY'),-5);
    DELETE FROM TLINK_SERV WHERE TLINK_SERV.FD_DUMP < ADD_MONTHS(TO_DATE('01.'||TO_CHAR(SYSDATE,'MM.YYYY'),'DD.MM.YYYY'),-1);
    DELETE FROM TLINK_CLNT WHERE TLINK_CLNT.FD_DUMP < ADD_MONTHS(TO_DATE('01.'||TO_CHAR(SYSDATE,'MM.YYYY'),'DD.MM.YYYY'),-1);
    DELETE FROM TNAZMON;
    commit;
EXCEPTION WHEN OTHERS THEN
  BEGIN
   FOR c IN (SELECT DISTINCT fk_userid FROM asu.tmisexch_tasks_users)
   LOOP
      asu.insmsg (c.fk_userid, 'Очистка логов завершилась неуспешно '||Sqlerrm);
   END LOOP;
   
  END;
    
  end;
  /*------------------------------------------------------------------------------------------------------------------*/
  procedure DO_REFRESH is
    PRAGMA AUTONOMOUS_TRANSACTION;
  begin
    dbms_refresh.refresh('"ASU"."VCONTROL"');
    dbms_refresh.refresh('"ASU"."VNAZAN"');
    dbms_refresh.refresh('"ASU"."VNAZPAT"');
    dbms_refresh.refresh('"ASU"."VPOVTOR"');
    dbms_refresh.refresh('"ASU"."VRESPAT"');
    dbms_refresh.refresh('"ASU"."VRESAN"');
    commit;
  end;
  /*------------------------------------------------------------------------------------------------------------------*/
  procedure DO_UPDATE_LOGS IS
  PRAGMA AUTONOMOUS_TRANSACTION;
  begin
    delete from lis.tbl_results where fd_date< sysdate - 3;
    pkg_log.do_update_log;
  end;
begin
  -- Initialization
  --<Statement>;
  NULL;
end PKG_JOBS;
/

SHOW ERRORS;


