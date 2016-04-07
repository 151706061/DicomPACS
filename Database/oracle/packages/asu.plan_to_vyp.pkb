DROP PACKAGE BODY ASU.PLAN_TO_VYP
/

--
-- PLAN_TO_VYP  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PLAN_TO_VYP" 
IS
--   TYPE TRepRec IS (FC_FAM VARCHAR2(100),FC_ROOM VARCHAR2(50));
   PROCEDURE DO_CALC_REPORT_PERIOD(pFD_DATA1 IN DATE,pFD_DATA2 IN DATE,pFK_SOTRID IN NUMBER,pFC_SAN IN VARCHAR2,pFC_TABLE OUT VARCHAR2) IS
     strTemp VARCHAR2(300);
     cid INTEGER;
     j NUMBER;
     SQLText VARCHAR2(300);
     i NUMBER;
     cRec cWhoPlan%ROWTYPE;
   BEGIN
     cid:=DBMS_SQL.OPEN_CURSOR;
     pFC_TABLE:='TPLANTOVYP_'||TO_CHAR(SYSDATE,'DDMMYYYYHHMISS');
     SQLText:='CREATE TABLE ASU.'||pFC_TABLE||' ( FC_FIELD0 VARCHAR2 (300))';
--     raise_application_error(-20001,SQLText);
     DBMS_SQL.PARSE(cid,SQLText,DBMS_SQL.NATIVE);
     j:=DBMS_SQL.EXECUTE(cid);
     DBMS_SQL.PARSE(cid,'INSERT INTO '||pFC_TABLE||' (FC_FIELD0) VALUES (:pFC_FIELD0)',DBMS_SQL.NATIVE);
     FOR i IN 0..pFD_DATA2-pFD_DATA1 LOOP
       DBMS_SQL.BIND_VARIABLE(cid,'pFC_FIELD0','          Планируются к выписке на '||TO_CHAR(pFD_DATA1+i,'dd.mm.yyyy')||' по санаторию "'||pFC_SAN||'"');
       j:=DBMS_SQL.Execute(cid);
       DBMS_SQL.BIND_VARIABLE(cid,'pFC_FIELD0','');
       j:=DBMS_SQL.Execute(cid);
       IF cWhoPlan%ISOPEN THEN
         CLOSE cWhoPlan;
       END IF;
       for  cRec IN cWhoPlan(pFD_DATA1+i) loop
         DBMS_SQL.BIND_VARIABLE(cid,'pFC_FIELD0',cRec.FC_PALATA||'   -  '||cRec.FC_FIO);
         j:=DBMS_SQL.EXECUTE(cid);
       end loop;
       DBMS_SQL.BIND_VARIABLE(cid,'pFC_FIELD0','');
       j:=DBMS_SQL.Execute(cid);
       DBMS_SQL.BIND_VARIABLE(cid,'pFC_FIELD0','Медрегистратор__________________'||DO_VRACHFIO(pFK_SOTRID));
       j:=DBMS_SQL.Execute(cid);
       DBMS_SQL.BIND_VARIABLE(cid,'pFC_FIELD0','');
       j:=DBMS_SQL.Execute(cid);
       DBMS_SQL.BIND_VARIABLE(cid,'pFC_FIELD0','');
       j:=DBMS_SQL.Execute(cid);
     END LOOP;
     COMMIT;
   END;
   -- Enter further code below as specified in the Package spec.
END;
/

SHOW ERRORS;


