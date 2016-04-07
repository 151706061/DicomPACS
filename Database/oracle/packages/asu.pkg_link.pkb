DROP PACKAGE BODY ASU.PKG_LINK
/

--
-- PKG_LINK  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_LINK" is

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
  procedure TO_EXP(pFD_CRATE    IN DATE,
                   pSchemaName  IN VARCHAR2,
                   pCommandName IN VARCHAR2,
                   pKeyValue    IN NUMBER,
                   pValue       IN NUMBER) is
  begin
    INSERT INTO TLINK_SERV
      (FD_CRATE, FC_SCHEMA, FC_COMMAND, FN_KEYID, FN_NEW)
    VALUES
      (pFD_CRATE, pSchemaName, pCommandName, pKeyValue, pValue);
  end;
  /*------------------------------------------------------------------------------------------------------------------*/
  procedure TO_EXP(pFD_CRATE    IN DATE,
                   pSchemaName  IN VARCHAR2,
                   pCommandName IN VARCHAR2,
                   pKeyValue    IN NUMBER,
                   pValue       IN DATE) is
  begin
    INSERT INTO TLINK_SERV
      (FD_CRATE, FC_SCHEMA, FC_COMMAND, FN_KEYID, FD_NEW)
    VALUES
      (pFD_CRATE, pSchemaName, pCommandName, pKeyValue, pValue);
  end;
  /*------------------------------------------------------------------------------------------------------------------*/
  procedure TO_EXP(pFD_CRATE    IN DATE,
                   pSchemaName  IN VARCHAR2,
                   pCommandName IN VARCHAR2,
                   pKeyValue    IN NUMBER,
                   pValue       IN VARCHAR2) is
  begin
    INSERT INTO TLINK_SERV
      (FD_CRATE, FC_SCHEMA, FC_COMMAND, FN_KEYID, FH_NEW)
    VALUES
      (pFD_CRATE, pSchemaName, pCommandName, pKeyValue, pValue);
  end;
  /*------------------------------------------------------------------------------------------------------------------*/
  procedure TO_EXP(pFD_CRATE    IN DATE,
                   pSchemaName  IN VARCHAR2,
                   pCommandName IN VARCHAR2,
                   pKeyValue    IN NUMBER,
                   pValue       IN CLOB) is
  begin
    INSERT INTO TLINK_SERV
      (FD_CRATE, FC_SCHEMA, FC_COMMAND, FN_KEYID, FC_NEW)
    VALUES
      (pFD_CRATE, pSchemaName, pCommandName, pKeyValue, pValue);
  end;
  /*------------------------------------------------------------------------------------------------------------------*/
  procedure TO_EXP(pFD_CRATE    IN DATE,
                   pSchemaName  IN VARCHAR2,
                   pCommandName IN VARCHAR2,
                   pKeyValue    IN NUMBER,
                   pValue       IN BLOB) is
  begin
    INSERT INTO TLINK_SERV
      (FD_CRATE, FC_SCHEMA, FC_COMMAND, FN_KEYID, FB_NEW)
    VALUES
      (pFD_CRATE, pSchemaName, pCommandName, pKeyValue, pValue);
  end;
  /*------------------------------------------------------------------------------------------------------------------*/
  function SHELL(cmd IN VARCHAR2) RETURN PLS_INTEGER as
    language C
    library MSVCRT name "system"
    parameters(cmd STRING, RETURN INT);
  /*------------------------------------------------------------------------------------------------------------------*/
  function IS_EXP(pSchemaName IN VARCHAR2,pTableName IN VARCHAR2) return BINARY_INTEGER is
    CURSOR cT is
      select trigger_name,status
        from sys.all_triggers
       where owner = UPPER(pSchemaName) and trigger_name = UPPER(pTableName) || '_EXP';
  begin
    FOR p IN cT LOOP
      if (p.status is not null) and (p.status = 'ENABLED') then
        return 1;
      else
        return 0;
      end if;
    END LOOP;
    return null;
  end;
  /*------------------------------------------------------------------------------------------------------------------*/
  procedure ENABLE_EXP(pSchemaName IN VARCHAR2) is
    CURSOR cT is
      select trigger_name
        from sys.all_triggers
       where owner = UPPER(pSchemaName) and trigger_name like '%_EXP';
  begin
    FOR p IN cT LOOP
      BEGIN
        EXECUTE IMMEDIATE 'ALTER TRIGGER ' || p.trigger_name || ' ENABLE';
      EXCEPTION
        WHEN OTHERS THEN
          NULL;
      END;
    END LOOP;
  end;
  /*------------------------------------------------------------------------------------------------------------------*/
  procedure DISABLE_EXP(pSchemaName IN VARCHAR2) is
    CURSOR cT is
      select trigger_name
        from sys.all_triggers
       where owner = UPPER(pSchemaName) and trigger_name like '%_EXP';
  begin
    FOR p IN cT LOOP
      BEGIN
        EXECUTE IMMEDIATE 'ALTER TRIGGER ' || p.trigger_name || ' DISABLE';
      EXCEPTION
        WHEN OTHERS THEN
          NULL;
      END;
    END LOOP;
  end;
  /*------------------------------------------------------------------------------------------------------------------*/
  procedure ENABLE_TAB_EXP(pSchemaName IN VARCHAR2,pTableName IN VARCHAR2) is
    CURSOR cT is
      select trigger_name
        from sys.all_triggers
       where table_owner = UPPER(pSchemaName) and table_name = UPPER(pTableName) and trigger_name like '%_EXP';
  begin
    FOR p IN cT LOOP
      BEGIN
        EXECUTE IMMEDIATE 'ALTER TRIGGER ' || p.trigger_name || ' ENABLE';
      EXCEPTION
        WHEN OTHERS THEN
          NULL;
      END;
    END LOOP;
  end;
  /*------------------------------------------------------------------------------------------------------------------*/
  procedure DISABLE_TAB_EXP(pSchemaName IN VARCHAR2,pTableName IN VARCHAR2) is
    CURSOR cT is
      select trigger_name
        from sys.all_triggers
       where table_owner = UPPER(pSchemaName) and table_name = UPPER(pTableName) and trigger_name like '%_EXP';
  begin
    FOR p IN cT LOOP
      BEGIN
        EXECUTE IMMEDIATE 'ALTER TRIGGER ' || p.trigger_name || ' DISABLE';
      EXCEPTION
        WHEN OTHERS THEN
          NULL;
      END;
    END LOOP;
  end;
  /*------------------------------------------------------------------------------------------------------------------*/
  procedure DO_IMP(pTableName IN VARCHAR2) is
    PRAGMA AUTONOMOUS_TRANSACTION;
    dTimeStamp DATE;
    cCINFO VARCHAR2(60);
    cTemp VARCHAR2(32767);
    CURSOR cImp IS
      SELECT * FROM TLINK_CLNT WHERE TLINK_CLNT.FD_DUMP IS NULL ORDER BY 1;

    function MAKE_SQL(pSchemaName IN VARCHAR2, pCommandName IN VARCHAR2)
      return VARCHAR2 is
      cTemp   VARCHAR2(32767);
      cSQL    VARCHAR2(32767);
      cAction VARCHAR2(32767);
      cTABLE  VARCHAR2(32767);
      cWhere  VARCHAR2(32767);
    begin
      cTemp := pCommandName;
      IF INSTR(cTemp, ' ') > 0 THEN
        cTABLE := UPPER(pSchemaName) || '.' || SUBSTR(cTemp, 1, INSTR(cTemp, ' ') - 1);
        cTemp  := SUBSTR(cTemp, INSTR(cTemp, ' ') + 1, LENGTH(cTemp));
      end if;

      IF INSTR(cTemp, ' ') > 0 THEN
        cAction := SUBSTR(cTemp, 1, INSTR(cTemp, ' ') - 1);
        cTemp   := SUBSTR(cTemp, INSTR(cTemp, ' ') + 1, LENGTH(cTemp));
      end if;

      IF INSTR(cTemp, ' ') > 0 THEN
        cSQL  := SUBSTR(cTemp, 1, INSTR(cTemp, ' ') - 1);
        cTemp := SUBSTR(cTemp, INSTR(cTemp, ' ') + 1, LENGTH(cTemp));
      else
        if INSTR(cTemp, 'KEY=') > 0 then
          cSQL := null;
        else
          cSQL := cTemp;
        end if;
      end if;

      IF INSTR(cTemp, ' ') > 0 THEN
        cWhere := SUBSTR(cTemp, 1, INSTR(cTemp, ' ') - 1);
        cTemp  := SUBSTR(cTemp, INSTR(cTemp, ' ') + 1, LENGTH(cTemp));
      else
        cWhere := cTemp;
      end if;

      if INSTR(cWhere, 'KEY=') > 0 then
        cWhere := 'WHERE ' || SUBSTR(cWhere, LENGTH('KEY=') + 1, LENGTH(cWhere)) || '=:FN_KEYID';
      end if;

      if cAction = 'INSERT' then
        cSQL := '(' || SUBSTR(cSQL, 1, INSTR(cSQL, '=') - 1) || ') VALUES (' || SUBSTR(cSQL, INSTR(cSQL, ':'), LENGTH(cSQL)) || ')';
        cTemp := cAction || ' INTO ' || cTABLE || ' ' || cSQL || ';';
      elsif cAction = 'DELETE' then
        cTemp := cAction || ' FROM ' || cTABLE || ' ' || cWhere || ';';
      elsif cAction = 'UPDATE' then
        cTemp := cAction || ' ' || cTABLE || ' SET ' || cSQL || ' ' || cWhere || ';';
      end if;

      return cTemp;
    end;
  begin
    dTimeStamp := SYSDATE;
    dbms_application_info.read_client_info(cCINFO);
    dbms_application_info.set_client_info('%MAIL%');

    BEGIN
      EXECUTE IMMEDIATE 'INSERT /*+APPEND*/ INTO TLINK_CLNT SELECT * FROM ' || pTableName;
      COMMIT;-- !!!
    EXCEPTION
      WHEN OTHERS THEN NULL;
    END;

    BEGIN
      EXECUTE IMMEDIATE 'DROP TABLE ' || pTableName;
    EXCEPTION
      WHEN OTHERS THEN NULL;
    END;

    FOR p in cImp LOOP
      cTemp := MAKE_SQL(p.FC_SCHEMA, p.FC_COMMAND);
      BEGIN
      if INSTR(cTemp, ':FN_KEYID') > 0 then
        begin
          if INSTR(cTemp, 'DELETE') > 0 then
            EXECUTE IMMEDIATE 'BEGIN ' || cTemp || 'END;' USING IN p.FN_KEYID;
          else
            begin
              if INSTR(cTemp, ':FN_NEW') > 0 then
                EXECUTE IMMEDIATE 'BEGIN ' || cTemp || 'END;' USING IN p.FN_NEW, p.FN_KEYID;
              elsif INSTR(cTemp, ':FD_NEW') > 0 then
                EXECUTE IMMEDIATE 'BEGIN ' || cTemp || 'END;' USING IN p.FD_NEW, p.FN_KEYID;
              elsif INSTR(cTemp, ':FH_NEW') > 0 then
                EXECUTE IMMEDIATE 'BEGIN ' || cTemp || 'END;' USING IN p.FH_NEW, p.FN_KEYID;
              elsif INSTR(cTemp, ':FC_NEW') > 0 then
                EXECUTE IMMEDIATE 'BEGIN ' || cTemp || 'END;' USING IN p.FC_NEW, p.FN_KEYID;
              elsif INSTR(cTemp, ':FB_NEW') > 0 then
                EXECUTE IMMEDIATE 'BEGIN ' || cTemp || 'END;' USING IN p.FB_NEW, p.FN_KEYID;
              end if;
            end;
          end if;
        end;
      else
        begin
          if INSTR(cTemp, 'INSERT') > 0 then
            EXECUTE IMMEDIATE 'BEGIN ' || cTemp || 'END;' USING IN p.FN_NEW;
          else
            begin
              if INSTR(cTemp, ':FN_NEW') > 0 then
                EXECUTE IMMEDIATE 'BEGIN ' || cTemp || 'END;' USING IN p.FN_NEW;
              elsif INSTR(cTemp, ':FD_NEW') > 0 then
                EXECUTE IMMEDIATE 'BEGIN ' || cTemp || 'END;' USING IN p.FD_NEW;
              elsif INSTR(cTemp, ':FH_NEW') > 0 then
                EXECUTE IMMEDIATE 'BEGIN ' || cTemp || 'END;' USING IN p.FH_NEW;
              elsif INSTR(cTemp, ':FC_NEW') > 0 then
                EXECUTE IMMEDIATE 'BEGIN ' || cTemp || 'END;' USING IN p.FC_NEW;
              elsif INSTR(cTemp, ':FB_NEW') > 0 then
                EXECUTE IMMEDIATE 'BEGIN ' || cTemp || 'END;' USING IN p.FB_NEW;
              end if;
            end;
          end if;
        end;
      end if;
      UPDATE TLINK_CLNT SET TLINK_CLNT.FD_DUMP = dTimeStamp WHERE FK_ID = p.FK_ID;
      COMMIT;-- !!!
      EXCEPTION
        WHEN OTHERS THEN NULL;
      END;
    END LOOP;

    dbms_application_info.set_client_info(cCINFO);
  end;
  /*------------------------------------------------------------------------------------------------------------------*/
  procedure ALTER_SEQUENSES(pSchemaName IN VARCHAR2,pDelta IN NUMBER) IS
    CURSOR cCur is
      SELECT * FROM SYS.ALL_SEQUENCES WHERE SEQUENCE_OWNER = UPPER(pSchemaName);
  begin
    FOR p in cCur LOOP
      BEGIN
        EXECUTE IMMEDIATE 'ALTER SEQUENCE ' || p.sequence_name || ' NOMAXVALUE INCREMENT BY '|| TO_CHAR(pDelta)||' NOCYCLE NOORDER CACHE 20 MINVALUE 1';
      EXCEPTION
        WHEN OTHERS THEN NULL;
      END;
    END LOOP;
  end;
  /*------------------------------------------------------------------------------------------------------------------*/
begin
  -- Initialization
  --<Statement>;
  NULL;
end PKG_LINK;
/

SHOW ERRORS;


