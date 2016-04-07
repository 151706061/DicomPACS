DROP PROCEDURE ASU.LISTSPACE
/

--
-- LISTSPACE  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   USER_TABLES (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   USER_INDEXES (Synonym)
--   DBMS_SPACE (Synonym)
--
CREATE OR REPLACE PROCEDURE ASU."LISTSPACE" 
AS
  CURSOR cTables
  IS
    SELECT table_name
      FROM user_tables;

  CURSOR cIndexes(pTableName in varchar2)
  IS
    SELECT index_name
      FROM user_indexes
    where table_name = pTableName;

  total_blocks    NUMBER;
  total_bytes     NUMBER;
  unused_blocks   NUMBER;
  unused_bytes    NUMBER;
  lastextf        NUMBER;
  last_extb       NUMBER;
  lastusedblock   NUMBER;
BEGIN
  FOR i IN ( SELECT 1
               FROM user_tables
              WHERE table_name = 'SPACE$')
  LOOP
    EXECUTE IMMEDIATE 'drop table space$';
  END LOOP;
  EXECUTE IMMEDIATE 'create table space$ (table_name  varchar2(100), object_name varchar2(100), object_type  varchar2(40),  total_bytes number(9,0), unused_bytes  number(9,0), used_bytes number(9,0))';
  FOR t IN cTables
  LOOP
    DBMS_SPACE.UNUSED_SPACE ('ASU', t.table_name, 'TABLE', total_blocks, total_bytes, unused_blocks, unused_bytes, lastextf, last_extb, lastusedblock);
    EXECUTE IMMEDIATE 'insert into space$(table_name, object_name, object_type,  total_bytes, unused_bytes, used_bytes) values(:1, :2, :3, :4, :5,:6)'
      USING t.table_name, t.table_name, 'TABLE', total_bytes, unused_bytes, total_bytes - unused_bytes;
    FOR i IN cIndexes(t.table_name)
    LOOP
      DBMS_SPACE.UNUSED_SPACE ('ASU', i.index_name, 'INDEX', total_blocks, total_bytes, unused_blocks, unused_bytes, lastextf, last_extb, lastusedblock);
    EXECUTE IMMEDIATE 'insert into space$(table_name, object_name, object_type,  total_bytes, unused_bytes, used_bytes) values(:1, :2, :3, :4, :5,:6)'
        USING t.table_name, i.index_name, 'INDEX', total_bytes, unused_bytes, total_bytes - unused_bytes;
    END LOOP i;
  END LOOP t;
END;
/

SHOW ERRORS;


