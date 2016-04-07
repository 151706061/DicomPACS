DROP PACKAGE BODY ASU.GRAFOSV_OLD
/

--
-- GRAFOSV_OLD  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."GRAFOSV_OLD" -- Modified by TimurLan
IS
  CURSOR cKorp IS
    SELECT * FROM tkorp;
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
|               del_temptablename
\*-------------------------------------------------------------------------------------------*/
  PROCEDURE del_table (tName in varchar2)
  IS
  BEGIN
    EXECUTE IMMEDIATE 'drop table '|| tname;
  END;
/*-------------------------------------------------------------------------------------------*\
|
\*-------------------------------------------------------------------------------------------*/
  Function COUNT_OUT(pFD_DATAC IN DATE) RETURN NUMBER
   IS
  CURSOR C IS
         SELECT/* + rule*/COUNT (tperesel.fk_id)
           FROM tperesel, troom
          WHERE TRUNC(fd_data2) = pFD_DATAC
            AND tperesel.fk_id = get_maxpereselid (fk_pacid)
            AND tperesel.fk_palataid = troom.fk_id;
/*         SELECT \* + rule*\COUNT(FK_ID)
           FROM TSROKY
          WHERE TRUNC(fd_data1) = pFD_DATAC
            AND FK_PRYB=3;*/
  i NUMBER;
  BEGIN
   OPEN c;
   FETCH c INTO i;
   CLOSE c;
   RETURN i;
  END;
/*-------------------------------------------------------------------------------------------*\
|
\*-------------------------------------------------------------------------------------------*/
  FUNCTION COUNT_OUT_KORP_FLOOR (pFD_DATAC IN DATE, pfk_korpid IN NUMBER, pfn_floor IN NUMBER) RETURN NUMBER
   IS
  CURSOR c IS
         SELECT/* + rule*/COUNT (tperesel.fk_id)
           FROM tperesel, troom
          WHERE TRUNC(fd_data2) = pFD_DATAC
            AND tperesel.fk_id = get_maxpereselid (fk_pacid)
            AND troom.fk_korpid = pFK_KORPID
            AND fn_floor = pfn_floor
            AND tperesel.fk_palataid = troom.fk_id;
  i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;
    RETURN i;
  END;
/*-------------------------------------------------------------------------------------------*\
|               DoFillMe
\*-------------------------------------------------------------------------------------------*/
  FUNCTION DoFillMe (d1 IN DATE, d2 IN DATE) RETURN VARCHAR2
  IS-- Used in rGrafOsv.dpr;
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
      inc (nCounter);
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
        EXECUTE IMMEDIATE 'comment on column ' || res || '.fn_' || aKorp (i).fk_id || '_' || j || ' is ''' || aKorp (i).fc_name || '|' || ' эт. ' || j || '''';
        sINS  := sINS || ', :pfn_' || aKorp (i).fk_id || '_' || j;
      END LOOP;
    END LOOP;
    sINS      := sINS || ')';
    cid       := DBMS_SQL.open_cursor;
    DBMS_SQL.parse (cid, sINS, DBMS_SQL.native);
    --подсчитаем итого
    d         := d1;
    FOR curD IN 1 .. (d2 - d1 + 1) LOOP
      FOR i IN 1 .. aKorp.COUNT LOOP
        FOR j IN 1 .. aKorp (i).fn_floor LOOP
          DBMS_SQL.bind_variable (cid, ':pfd_data', TO_CHAR (d, 'dd.mm.yyyy'));
          DBMS_SQL.bind_variable (cid, ':pfn_total', count_out (d));
          DBMS_SQL.bind_variable (cid, ':pfn_' || aKorp (i).fk_id || '_' || j, COUNT_OUT_KORP_FLOOR (d, aKorp (i).fk_id, j));
        END LOOP;
      END LOOP;
      nCounter  := DBMS_SQL.execute (cid);
      d         := d + 1;
    END LOOP;
    COMMIT;
    RETURN res;
  END;
END;
/

SHOW ERRORS;


