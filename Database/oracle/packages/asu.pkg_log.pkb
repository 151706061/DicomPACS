DROP PACKAGE BODY ASU.PKG_LOG
/

--
-- PKG_LOG  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_LOG" is

  function Get_value(value in number) return varchar2
   is
  begin
    return NVL((SUBSTR(TO_CHAR(value),1,255)),' ');
  end;

  function Get_value(value in date) return varchar2
   is
  begin
    return NVL((SUBSTR(TO_CHAR(value,'dd.mm.yyyy hh24:mi:ss'),1,255)),' ');
  end;

  function Get_value(value in varchar2) return varchar2
   is
  begin
    return NVL((SUBSTR(value,1,255)),' ');
  end;

  function Get_client(value in varchar2) return number
   is
  begin
    if value is null then
      return null;
    else
      BEGIN
        return value;
      EXCEPTION
      WHEN OTHERS THEN
        return 0;
      END;
      return value;
    end if;
  end;

  function Get_module(value in varchar2) return Varchar2
   is
    CURSOR cTemp is
      select data_length
        from sys.All_Tab_Columns
       where owner = 'ASU' and table_name = 'TLOG' and column_name = 'FC_MODULE';
    nTemp NUMBER;
  begin
    for p in cTemp loop
      nTemp := p.data_length;
    end loop;
    if value is null then
      return null;
    else
      BEGIN
        return SUBSTR(value,1,nTemp);
      EXCEPTION
      WHEN OTHERS THEN
        return null;
      END;
      return value;
    end if;
  end;

   procedure Do_log(tablename in varchar2, field in varchar2, action in varchar2, old in varchar2, new in varchar2, owner in number)
   is
   CURSOR c IS
    SELECT OSUSER,MACHINE,TERMINAL,MODULE,ACTION,CLIENT_INFO,LOGON_TIME,PROCESS
      FROM V$SESSION
     WHERE AUDSID=USERENV('SESSIONID');
  --PRAGMA AUTONOMOUS_TRANSACTION;
  begin
    for p in c loop
      if p.MACHINE <> 'SERVER02' then
      INSERT INTO TLOGTMP(FC_TABLE,
                       FC_FIELD,
                       FC_ACTION,
                       FC_OLD,
                       FC_NEW,
                       FC_OSUSER,
                       FC_MACHINE,
                       FC_TERMINAL,
                       FC_MODULE,
                       FC_OSFORM,
                       FN_USERID,
                       FD_LOGONTIME,
                       FC_PROCESS,
                       FK_OWNER)
                VALUES(TABLENAME,
                       FIELD,
                       ACTION,
                       OLD,
                       NEW,
                       p.OSUSER,
                       p.MACHINE,
                       p.TERMINAL,
                       Get_module(p.MODULE),
                       p.ACTION,
                       Get_client(p.CLIENT_INFO),
                       SYSDATE,--p.LOGON_TIME,
                       p.PROCESS,
                       owner);
       end if;
    end loop;
    --commit;
  end;

procedure do_update_log IS
   v_min   NUMBER;
   v_max   NUMBER;
begin
   SELECT MIN (fk_id), MAX (fk_id)
     INTO v_min, v_max
     FROM TLOGTMP;
   WHILE v_min < v_max
   LOOP
      insert into TLOG SELECT * FROM TLOGTMP WHERE FK_ID >= v_min AND FK_ID < v_min + 50000;
      COMMIT;
      DELETE FROM TLOGTMP
            WHERE FK_ID >= v_min AND FK_ID < v_min + 50000;
      COMMIT;
      v_min := v_min + 50000;
   END LOOP;

end;

end PKG_LOG;
/

SHOW ERRORS;


GRANT EXECUTE ON ASU.PKG_LOG TO LOGIN
/

