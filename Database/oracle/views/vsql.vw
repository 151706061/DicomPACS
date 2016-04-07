DROP VIEW ASU.VSQL
/

/* Formatted on 06.04.2016 15:19:21 (QP5 v5.115.810.9015) */
--
-- VSQL  (View)
--
--  Dependencies:
--   V$SQLAREA (Synonym)
--

CREATE OR REPLACE FORCE VIEW ASU.VSQL (SQL_TEXT, EXECUTIONS)
AS
   SELECT   sql_text, executions FROM v$sqlarea
/


