CREATE OR REPLACE FUNCTION "NEW_UUID" RETURN VARCHAR2 AS
  l_seed        BINARY_INTEGER;
  l_random_num  NUMBER(5);

  nGUID         VARCHAR(32);
  l_random      VARCHAR2(4);
  l_ip_address  VARCHAR2(12);
  v_CON         varchar2(250);
BEGIN
  nGUID := SYS_GUID(); -- Kulbatsky

  l_seed := TO_NUMBER(TO_CHAR(SYSDATE,'YYYYDDMMSS'));
  DBMS_RANDOM.initialize (val => l_seed);
  l_random_num := TRUNC(DBMS_RANDOM.value(low => 1, high => 65535));
  DBMS_RANDOM.terminate;

  l_random     := RPAD(system.conversion_api.to_hex(l_random_num), 4, '0');
  v_CON:= REPLACE(NVL(SYS_CONTEXT('USERENV','IP_ADDRESS'), '123.123.123.123'), '.', '');
  if INSTR(v_CON,':')>0 then
    v_CON:='127001';
  end if;
  l_ip_address := system.conversion_api.to_hex(TO_NUMBER(v_CON));

  RETURN SUBSTR(nGUID, 1, 8)                     || '-' || 
         SUBSTR(nGUID, 9, 4)                     || '-' ||
         SUBSTR(nGUID, 13, 4)                    || '-' ||
         RPAD(SUBSTR(nGUID, 17), 4, '0')         || '-' ||
         RPAD(l_random || l_ip_address, 12, '0');
END;
 
 
 
 