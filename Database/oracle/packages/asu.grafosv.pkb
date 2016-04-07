DROP PACKAGE BODY ASU.GRAFOSV
/

--
-- GRAFOSV  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."GRAFOSV" 
IS
   CURSOR cKorp
   IS
      SELECT *
        FROM tkorp;

   TYPE TKorp IS TABLE OF cKorp%ROWTYPE
      INDEX BY BINARY_INTEGER;

/*-------------------------------------------------------------------------------------------*\
|               get_temptablename
\*-------------------------------------------------------------------------------------------*/
   FUNCTION get_temptablename
      RETURN VARCHAR2
   IS
   BEGIN
      RETURN 'grafosv' || TO_CHAR (SYSDATE, 'ddmmyyyyhh24miss');
   END;

/*-------------------------------------------------------------------------------------------*\
|               DoFillMe
\*-------------------------------------------------------------------------------------------*/
   FUNCTION DoFillMe (d1 IN DATE, d2 IN DATE)
      RETURN VARCHAR2
   IS
      res        VARCHAR2 (255);
      sSQL       VARCHAR2 (32767);
      sINS       VARCHAR2 (32767);
      cid        NUMBER;
      nCounter   NUMBER;
      aKorp      TKorp;
      d          DATE;
   BEGIN
      res       := get_temptablename;
      -- занесем в ПЛ-СКЛ таблицу корпуса
      nCounter  := 1;
      FOR i IN cKorp LOOP
         aKorp (nCounter)  := i;
         inc(nCounter);
      END LOOP;
      --сформируем СКЛ-ник для создания таблицы
      sSQL      := 'create table ' || res || ' (fd_data varchar2(10), fn_total number (3,0)';
      sINS      := 'insert into ' || res || '(fd_data, fn_total';
      FOR i IN 1 .. aKorp.COUNT LOOP
         FOR j IN 1 .. aKorp (i).fn_floor LOOP
            sSQL  := sSQL || ', fn_' || aKorp (i).fk_id || '_' || j || ' number(3,0)';
            sINS  := sINS || ', fn_' || aKorp (i).fk_id || '_' || j;
         END LOOP;
      END LOOP;
      sSQL      := sSQL || ')';
      sINS      := sINS || ') values (:pfd_data, :pfn_total';
      EXECUTE IMMEDIATE sSQL;
      --создадим комменатрии и одновременно сформируем запрос для вставки
      EXECUTE IMMEDIATE 'comment on column ' || res || '.fd_data is ''' || 'Дата''';
      EXECUTE IMMEDIATE 'comment on column ' || res || '.fn_total is ''' || 'Всего''';
      FOR i IN 1 .. aKorp.COUNT LOOP
         FOR j IN 1 .. aKorp (i).fn_floor LOOP
            EXECUTE IMMEDIATE 'comment on column ' || res || '.fn_' || aKorp (i).fk_id || '_' || j || ' is ''' ||
                                 aKorp (i).fc_name ||
                                 '|' ||
                                 ' эт. ' ||
                                 j ||
                                 '''';
            sINS  := sINS || ', :pfn_' || aKorp (i).fk_id || '_' || j;
         END LOOP;
      END LOOP;
      sINS      := sINS || ')';
      cid:=dbms_sql.open_cursor;
      DBMS_SQL.parse (cid, sINS, DBMS_SQL.native);
      --подсчитаем итого
      d         := d1;
      FOR curD IN 1 .. (d2 - d1+1) LOOP
         FOR i IN 1 .. aKorp.COUNT LOOP
            FOR j IN 1 .. aKorp (i).fn_floor LOOP
               DBMS_SQL.bind_variable (cid, ':pfd_data', to_char(d,'dd.mm.yyyy'));
               DBMS_SQL.bind_variable (cid, ':pfn_total', get_count_out (d));
               DBMS_SQL.bind_variable (cid,
                  ':pfn_' || aKorp (i).fk_id || '_' || j,
                  GET_COUNT_OUT_KORP_FLOOR (d, aKorp (i).fk_id, j)
               );
            END LOOP;
         END LOOP;
         nCounter  := DBMS_SQL.execute (cid);
         d         :=  d + 1;
      END LOOP;
      commit;
      RETURN res;
   END;
END;
/

SHOW ERRORS;


