DROP PACKAGE ASU.PKG_JOBS
/

--
-- PKG_JOBS  (Package) 
--
CREATE OR REPLACE PACKAGE ASU."PKG_JOBS" is

  -- Author  : TIMURLAN
  -- Created : 20.01.2004 15:51:35
  -- Purpose : for jobs running

  -- Public type declarations
  --type <TypeName> is <Datatype>;

  -- Public constant declarations
  --<ConstantName> constant <Datatype> := <Value>;

  -- Public variable declarations
  --<VariableName> <Datatype>;

  -- Public function and procedure declarations
  --function <FunctionName>(<Parameter> <Datatype>) return <Datatype>;

  procedure DO_ANALYZE_SCHEMA;
  procedure DO_UPDATE_SCHEMA_STATS;
  procedure DO_DELETE_FROM_LOGS;
  procedure DO_REFRESH;
  procedure DO_UPDATE_LOGS;
end PKG_JOBS;
/

SHOW ERRORS;


