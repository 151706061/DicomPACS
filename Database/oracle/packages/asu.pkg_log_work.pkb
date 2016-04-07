DROP PACKAGE BODY ASU.PKG_LOG_WORK
/

--
-- PKG_LOG_WORK  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_LOG_WORK" 
IS

-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  ------------------------------------------
   -- Enter procedure, function bodies as shown below

PROCEDURE READ_LOG_BY_ID( pID IN NUMBER, pTableName IN VARCHAR, pTempTable IN VARCHAR, pTempField IN VARCHAR, pFirst IN BOOLEAN, pSourceTable IN VARCHAR := '', pSourceField in VARCHAR := '') IS
  nFlg NUMBER;
BEGIN
    if pFirst then
        for c in (select * from TLOG
            where fc_table = pTableName and fk_id >= (
            select fk_id from TLOG where fc_table = pTableName and fc_field = 'FK_ID'
                    and fc_action = 'INSERT' and fc_new = pID
            ) and (fk_id - 15) <= (

            select max(fk_id) from TLOG where fc_table = pTableName and fc_field = 'FK_ID'
                    and (fc_new = pID or fc_old = pID)
            ) order by fk_id)
        loop
            if c.fc_field = 'FK_ID' then
                if (c.fc_old = pID or c.fc_new = pID) then
                    nFlg:= 1;
                    if c.fc_action = 'INSERT' then
                        EXECUTE IMMEDIATE 'insert into ' || pTempTable ||' ( ' ||pTempField || ' ) values ( ' || c.fk_id||' )';
                    end if;
                else
                    nFlg:= 0;
                end if;
            else
                if nFlg = 1 then
                    dbms_output.put_line(c.fk_id||' '||c.fc_table||' '||c.fc_field
                    ||' '||c.fc_action||' '||c.fc_old||' '||c.fc_new||' '||c.fc_osuser
                    ||' '||c.fc_machine||' '||c.fc_terminal||' '||c.fc_module||' '||c.fc_osform
                    ||c.fn_userid||' '||c.fd_logontime||' '||c.fc_process);
                    EXECUTE IMMEDIATE 'insert into '||pTempTable||' ( '||pTempField|| ' ) values ( ' ||c.fk_id || ' )';
                end if;
            end if;
        end loop;
   ELSE
        for c in (select * from TLOG
            where fc_table = pTableName and fk_id >= (
            select fk_id from TLOG where fc_table = pTableName and fc_field = 'FK_ID'
                    and fc_action = 'INSERT' and fc_new = pID
            ) and (fk_id - 15) <= (

            select max(fk_id) from TLOG where fc_table = pTableName and fc_field = 'FK_ID'
                    and (fc_new = pID or fc_old = pID)
            ) order by fk_id)
        loop
            if c.fc_field = 'FK_ID' then
                if (c.fc_old = pID or c.fc_new = pID) then
                    nFlg:= 1;
                    if c.fc_action = 'INSERT' then
                        EXECUTE IMMEDIATE 'insert into ' || pTempTable ||' ( ' ||pTempField || ' ) values ( ' || c.fk_id||' )';
                    end if;
                else
                    nFlg:= 0;
                end if;
            else
                if nFlg = 1 then
                    dbms_output.put_line(c.fk_id||' '||c.fc_table||' '||c.fc_field
                    ||' '||c.fc_action||' '||c.fc_old||' '||c.fc_new||' '||c.fc_osuser
                    ||' '||c.fc_machine||' '||c.fc_terminal||' '||c.fc_module||' '||c.fc_osform
                    ||c.fn_userid||' '||c.fd_logontime||' '||c.fc_process);
                    EXECUTE IMMEDIATE 'insert into '||pTempTable||' ( '||pTempField|| ' ) values ( ' ||c.fk_id || ' )';
                end if;
            end if;
        end loop;
   END IF;

END; -- Procedure


PROCEDURE READ_LOG_PERESEL( pID IN NUMBER, pTempTable IN VARCHAR, pTempField IN VARCHAR, pFirst IN BOOLEAN, pSourceTable IN VARCHAR := '', pSourceField in VARCHAR := '') IS
CURSOR cc (pPerID in NUMBER, pPerOldID in NUMBER) IS
    select * from TLOG
            where fc_table = 'TPERESEL'
            and fk_id >= pPerID
            and fk_id < pPerOldID
            order by fk_id;
nFlg NUMBER;
nFlg1 NUMBER;
pTableName VARCHAR2 (30);
pOldID NUMBER;
BEGIN
 --   pTableName:='TPERESEL';
    select max(fk_id)+15 into pOldID from TLOG where fc_table = 'TPERESEL' and fc_field = 'FK_PACID'
                    and fc_action = 'INSERT' and fc_new = pID   ;
    for c in (select * from TLOG
        where fc_table = 'TPERESEL' and fk_id >= (
        select min(fk_id)-15 from TLOG where fc_table = 'TPERESEL' and fc_field = 'FK_PACID'
                and fc_action = 'INSERT' and fc_new = pID
        ) and fk_id <= (

        select max(fk_id)+15 from TLOG where fc_table = 'TPERESEL' and fc_field = 'FK_PACID'
                and fc_action = 'INSERT' and fc_new = pID
        )
        order by fk_id desc)
    loop
        if c.fc_field = 'FK_PACID' then
            if (c.fc_new = pID or c.fc_old = pID) then
                nFlg1:=1;
            else
                nFlg1:=0;
            end if;
        end if;
        if nFlg1 = 1 then
            if c.fc_field = 'FK_ID' and c.fc_action = 'INSERT' then
            for cc1 in cc (c.fk_id, pOldID)
                loop
                    if cc1.fc_field = 'FK_ID' then
                        if (cc1.fc_old = c.fc_new or cc1.fc_new = c.fc_new) then
                            nFlg:= 1;
                            if cc1.fc_action = 'INSERT' then
                                --insert into BUH.T_TEMP (FN_D) values (cc1.fk_id);
                                EXECUTE IMMEDIATE 'insert into ' || pTempTable ||' ( ' ||pTempField || ' ) values ( ' || cc1.fk_id||' )';
                            end if;
                        else
                            nFlg:= 0;
                        end if;
                    else
                        if nFlg = 1 then
                            dbms_output.put_line(cc1.fk_id||' '||cc1.fc_table||' '||cc1.fc_field
                            ||' '||cc1.fc_action||' '||cc1.fc_old||' '||cc1.fc_new||' '||cc1.fc_osuser
                            ||' '||cc1.fc_machine||' '||cc1.fc_terminal||' '||cc1.fc_module||' '||cc1.fc_osform
                            ||cc1.fn_userid||' '||cc1.fd_logontime||' '||cc1.fc_process);
                            --insert into BUH.T_TEMP (FN_D) values (cc1.fk_id);
                            EXECUTE IMMEDIATE 'insert into ' || pTempTable ||' ( ' ||pTempField || ' ) values ( ' || cc1.fk_id||' )';
                        end if;
                    end if;
                end loop;
                pOldID:=c.fk_id;
            end if;

        end if;
    end loop;
END; -- Procedure


PROCEDURE DO_DEL_TLOGCAPTION_RIGHTS(pFK_SOTRID IN BINARY_INTEGER, pFK_LOGID IN BINARY_INTEGER) IS
BEGIN
  DELETE FROM TLOGCAPTION_RIGHTS
   WHERE FK_SOTRID = pFK_SOTRID
     AND FK_LOGID IN (SELECT FK_ID
                      FROM TLOGCAPTION
                      START WITH FK_ID = pFK_LOGID
                      CONNECT BY PRIOR FK_ID = FK_OWNER);
END;

PROCEDURE DO_ADD_TLOGCAPTION_RIGHTS(pFK_SOTRID IN BINARY_INTEGER, pFK_LOGID IN BINARY_INTEGER) IS
BEGIN
  FOR p IN (SELECT DISTINCT FK_ID
            FROM TLOGCAPTION
            WHERE FL_DEL = 0
            START WITH FK_ID = pFK_LOGID
            CONNECT BY PRIOR FK_ID = FK_OWNER) LOOP
    BEGIN
      INSERT INTO TLOGCAPTION_RIGHTS
        (FK_SOTRID, FK_LOGID)
      VALUES
        (pFK_SOTRID, p.FK_ID);
    EXCEPTION
      WHEN others THEN
        IF sqlcode = -6512 THEN
          NULL;
        END IF;
    END;
  END LOOP;
END;

FUNCTION GET_FIELDVALUE(pTABLE IN VARCHAR, pFIELD IN VARCHAR, pACTION IN VARCHAR, pValue IN VARCHAR) RETURN VARCHAR IS
  CURSOR cGETVAL IS SELECT TLOGLINK.FC_TSOURCETABLE, TLOGLINK.FC_TSOURCEFIELD, TLOGLINK.FC_FUNCTION
                    FROM TLOGLINK
                    WHERE FK_TLOGCAPTION IN
                            (SELECT FK_ID
                             FROM TLOGCAPTION
                             WHERE TLOGCAPTION.FC_NAME = pFIELD
                                   AND TLOGCAPTION.FC_ACTION = pACTION
                                   START WITH TLOGCAPTION.FC_NAME = pTABLE
                                   CONNECT BY PRIOR TLOGCAPTION.FK_ID = TLOGCAPTION.FK_OWNER );
  sValue VARCHAR2(255);
  sRes VARCHAR2 (255);

BEGIN
   FOR sValue IN cGETVAL LOOP
    IF sValue.FC_TSOURCETABLE IS NOT NULL AND sValue.FC_TSOURCEFIELD IS NOT NULL THEN
       EXECUTE IMMEDIATE 'SELECT TO_CHAR(' || sValue.FC_TSOURCEFIELD || ')  FROM ' || sValue.FC_TSOURCETABLE || '  WHERE FK_ID = ' || TO_NUMBER(pValue)  INTO  sRes;
       RETURN sRes;
    ELSIF sValue.FC_FUNCTION IS NOT NULL THEN
       EXECUTE IMMEDIATE 'SELECT TO_CHAR(' || sValue.FC_FUNCTION || '( ' || TO_NUMBER(pValue) || ' )) FROM  DUAL' INTO sRes;
       RETURN sRes;
    ELSE
      RETURN pValue;
    END IF;
   END LOOP;

Return pValue;
EXCEPTION
      WHEN others THEN
        RETURN pValue;

END;

FUNCTION GET_SOTRFIO(pID IN NUMBER) RETURN VARCHAR IS
    CURSOR cAppSotr IS SELECT FC_FAM || ' ' || DECODE (VarcharIsNUll(TSOTR.FC_NAME), 1, '', SUBSTR (TSOTR.FC_NAME, 0, 1) || '. ' || DECODE (VarcharIsNUll(FC_OTCH), 1, '', SUBSTR (FC_OTCH, 0, 1) || '. '))
                 FROM TSOTR, LOGIN.TAPPSOTR
                 WHERE TAPPSOTR.FK_ID = pID AND FK_SOTRID = TSOTR.FK_ID;
    CURSOR cSotr IS SELECT FC_FAM || ' ' || DECODE (VarcharIsNUll(TSOTR.FC_NAME), 1, '', SUBSTR (TSOTR.FC_NAME, 0, 1) || '. ' || DECODE (VarcharIsNUll(FC_OTCH), 1, '', SUBSTR (FC_OTCH, 0, 1) || '. '))
                 FROM TSOTR
                 WHERE FK_ID = pID;                 
Result VARCHAR(32767);
BEGIN
  OPEN cAppSotr;
  FETCH cAppSotr into Result;
  CLOSE cAppSotr;
  Result := TRIM(' ' FROM Result);
  IF Result IS NULL THEN
     OPEN cSotr;
     FETCH cSotr into Result;
     CLOSE cSotr;
     Result := TRIM(' ' FROM Result);
  END IF;
  
  RETURN(Result);
EXCEPTION
      WHEN others THEN
          RETURN pID;
END;

FUNCTION GET_SOTRFULL(pID IN NUMBER) RETURN VARCHAR IS
    CURSOR cFULL IS SELECT FC_NAME FROM LOGIN.TOTDEL WHERE FK_OWNERID > 0 START WITH FK_ID = (SELECT FK_OTDELID FROM LOGIN.TSOTR WHERE FK_ID = pID) CONNECT BY PRIOR FK_OWNERID = FK_ID;
    cTEMP VARCHAR (1000);
    cCur VARCHAR (1000);
BEGIN
    cTEMP := '';
    FOR cCur IN cFULL LOOP
       IF cTEMP = '' THEN
        cTEMP :=  cCur.FC_NAME;
       ELSE
        cTEMP :=  cCur.FC_NAME || '\' || cTEMP;
       END IF;
    END LOOP;
    cTEMP := cTEMP ||  GET_SOTRNAME(pID);
    RETURN cTEMP;

EXCEPTION
      WHEN others THEN
          RETURN pID;
END;

PROCEDURE READ_LOG_TABLE
   ( pID IN NUMBER)
   IS

-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  -------------------------------------------
-- Nefedov S.M. 17.04.2007
nFlg NUMBER;
pTableName VARCHAR2 (30);
BEGIN
    pTableName:='TKARTA';

    for c in (select * from TLOG
        where fc_table = pTableName and fk_id >= (
        select fk_id from TLOG where fc_table = pTableName and fc_field = 'FK_ID'
                and fc_action = 'INSERT' and fc_new = pID
        ) and (fk_id - 15) <= (

        select max(fk_id) from TLOG where fc_table = pTableName and fc_field = 'FK_ID'
                and (fc_new = pID or fc_old = pID)
        ) order by fk_id)
    loop
        if c.fc_field = 'FK_ID' then
            if (c.fc_old = pID or c.fc_new = pID) then
                nFlg:= 1;
                if c.fc_action = 'INSERT' then
                    insert into BUH.T_TEMP (FN_D) values (c.fk_id);
                end if;
            else
                nFlg:= 0;
            end if;
        else
            if nFlg = 1 then
                dbms_output.put_line(c.fk_id||' '||c.fc_table||' '||c.fc_field
                ||' '||c.fc_action||' '||c.fc_old||' '||c.fc_new||' '||c.fc_osuser
                ||' '||c.fc_machine||' '||c.fc_terminal||' '||c.fc_module||' '||c.fc_osform
                ||c.fn_userid||' '||c.fd_logontime||' '||c.fc_process);
                insert into BUH.T_TEMP (FN_D) values (c.fk_id);
            end if;
        end if;
    end loop;
END; -- Procedure

END;
/

SHOW ERRORS;


