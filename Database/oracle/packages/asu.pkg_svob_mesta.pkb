DROP PACKAGE BODY ASU.PKG_SVOB_MESTA
/

--
-- PKG_SVOB_MESTA  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_SVOB_MESTA" 
IS
  FUNCTION get_svob_mesta (data1 IN DATE, data2 IN DATE, vrach_id IN NUMBER)
    RETURN NUMBER
  IS
    CURSOR c1 (data IN DATE)
    IS
      SELECT SUM (get_palata_free_mesta (TROOM.fk_id, data))
        FROM TROOM;
    CURSOR c2 (data IN DATE, korpid IN NUMBER, floorid IN NUMBER)
    IS
      SELECT SUM (get_palata_free_mesta (TROOM.fk_id, data))
        FROM TROOM
       WHERE fk_korpid = korpid
         AND fn_floor = floorid;
    vsegoo         NUMBER;
    itogo          NUMBER;
    itog           NUMBER;
    tekdata        DATE;
    vsego          NUMBER;
    vsegonafloor   NUMBER;
    cc             CLOB;--   временный клоб
    str            VARCHAR2 (32767);--  временные строки HTML-кода
    nc             NUMBER;--   возвращаемое значение
    CURSOR c3
    IS
      SELECT fn_floor, fc_name, fk_id
        FROM tkorp;
  BEGIN
    itogo   := 0;
    vsegoo  := 0;
    DBMS_LOB.createtemporary (cc, TRUE, DBMS_LOB.session);
    str     := get_html_header (1);
    DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
--                                        Заносим данные в конец клоба
    str     := '<P ALIGN="CENTER"><B><font size="+1">График освобождения мест за период </font>';
    str     := str || ' с ' || TO_CHAR (data1, 'dd/mm/yyyy') || ' по ' || TO_CHAR (data2, 'dd/mm/yyyy') || ' по санаторию ' || PKG_SMINI.READSTRING ('CONFIG',
                                                                                                                                 'S_NAME',
                                                                                                                                 'Не известен') || '<BR>';
    DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
--                                        Заносим данные в конец клоба
    str     :=
      '<table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0" class="sm_table">';
    str     := str || '<tr><td  rowspan=2 class="sm_td" WIDTH="15%"  ALIGN="CENTER"><B>Дата:</B></td><td rowspan=2 class="sm_td"  align="center"><B>Всего:</B></td>';
    DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
    FOR c_rec1 IN c3 LOOP
--                                Шапка таблицы
      str  := '    <td  class="sm_td"  colspan=' || c_rec1.fn_floor || ' class="sm_td" align="center"><b>' || c_rec1.fc_name || ' </b></td>';
      DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
    END LOOP;
    str     := '</tr><tr >';
    DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
    FOR c_rec IN c3 LOOP
      FOR i IN 1 .. c_rec.fn_floor LOOP
        str  := '<td class="sm_td"  align="center"  > эт. ' || i || '</td>';
        DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
      END LOOP;
    END LOOP;
    str     := '</tr>';
    DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
    FOR i IN 1 .. ( (data2 - data1) + 1) LOOP
      tekdata  := data1 + i - 1;
      OPEN c1 (tekdata - 1);
      FETCH c1 INTO vsego;
      CLOSE c1;
      IF vsego IS NULL THEN
        vsego  := 0;
      END IF;
      vsegoo   := vsegoo + vsego;
      str      := '<tr ><td  class="sm_td" align="center" >' || tekdata || '</td><td class="sm_td"  align="center" >' || vsego || '</td>';
      -- DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
      FOR c_rec1 IN c3 LOOP
        FOR e IN 1 .. c_rec1.fn_floor LOOP
          OPEN c2 (tekdata, c_rec1.fk_id, e);
          FETCH c2 INTO vsegonafloor;
          CLOSE c2;
          IF vsegonafloor IS NULL THEN
            vsegonafloor  := 0;
          END IF;
          str  := str || '<td class="sm_td"  align="center" >' || vsegonafloor || '</td>';
        END LOOP;
      END LOOP;
      str      := str || '</tr>';
      DBMS_LOB.WRITEAPPEND (cc, LENGTH (str), str);
    END LOOP;
    str     := '<tr ><td  class="sm_td"  align="center" >Итого:</td><td  class="sm_td" align="center" >' || vsegoo || '</td>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    FOR c_rec IN c3 LOOP
      FOR r IN 1 .. c_rec.fn_floor LOOP
        FOR i IN 1 .. ( (data2 - data1) + 1) LOOP
          tekdata  := data1 + i - 1;
          OPEN c2 (tekdata, c_rec.fk_id, r);
          FETCH c2 INTO itog;
          CLOSE c2;
          itogo    := itogo + itog;
        END LOOP;
        IF itogo IS NULL THEN
          itogo  := 0;
        END IF;
        str    := '<td class="sm_td"  align="center" >' || itogo || '</td>';
        DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
        itogo  := 0;
      END LOOP;
    END LOOP;
    str     := '</tr>';
    str     := str || '</table><p align="left">Отчёт составил:  _________________________' || DO_VRACHFIO (vrach_id) || '</p>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
--             Концовка
    str     := '</HTML>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    INSERT INTO TCLOBS
                (FC_CLOB)
         VALUES (cc)
      RETURNING FK_ID
      INTO nC;
    RETURN nc;
  END;
END;-- Package Body PKG_SVOB_MESTA
/

SHOW ERRORS;


