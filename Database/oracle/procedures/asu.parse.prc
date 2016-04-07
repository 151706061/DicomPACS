DROP PROCEDURE ASU.PARSE
/

--
-- PARSE  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   DBMS_SQL (Synonym)
--   PLITBLM (Synonym)
--
CREATE OR REPLACE PROCEDURE ASU.parse(aCLOB CLOB) is
-- Efimov V.A. 20120306 Функция выполняет скрипт aCLOB, выполнение скрипта происходит под правами пользователя, вызыввшенго функцию, а не под asu
  cur INTEGER;
  vrArray dbms_sql.varchar2s;

  i INTEGER;
  vPageCount INTEGER;
  vPerPage INTEGER;
  vPage varchar2(255);
  rows_processed INTEGER;
BEGIN
  vPerPage := 255;

  select case
           when trunc(length(aCLOB) / vPerPage) < (length(aCLOB) / vPerPage) then
            trunc(length(aCLOB) / vPerPage) + 1
           else
            trunc(length(aCLOB) / vPerPage)
         end
    into vPageCount
    from dual;

  for i in 1..vPageCount loop
    vPage := substr(aCLOB, (i - 1) * vPerPage + 1, vPerPage);
    vrArray(i) := vPage;
  end loop;

  cur := dbms_sql.open_cursor;
  dbms_sql.parse(cur, vrArray, vrArray.first, vrArray.last, false, dbms_sql.v7);
  rows_processed := DBMS_SQL.EXECUTE(cur);
  dbms_sql.close_cursor(cur);
END;
/

SHOW ERRORS;


