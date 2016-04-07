DROP PACKAGE BODY ASU.PKG_SYNC
/

--
-- PKG_SYNC  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_SYNC" is

  eColumnExists EXCEPTION;
  PRAGMA EXCEPTION_INIT(eColumnExists, -1430);
  eIdxExists EXCEPTION;
  PRAGMA EXCEPTION_INIT(eIdxExists, -1408);
  eObjExists EXCEPTION;
  PRAGMA EXCEPTION_INIT(eObjExists, -955);
  eObjNotExists EXCEPTION;
  PRAGMA EXCEPTION_INIT(eObjNotExists, -942);
  eIdxNotExists EXCEPTION;
  PRAGMA EXCEPTION_INIT(eIdxNotExists, -1418);


procedure sync1(pTable in varchar2,
                pKey   in varchar2,
                pDir   in varchar2,
                pDup   in number := 0,
                pFK    in varchar2 := null) is
  str varchar2(32000);
  str2 varchar2(32000);
  str3 varchar2(32000);
  sstr varchar2(200);
  srtT varchar2(200);
  i   integer;
  j   integer;
begin
  begin
    execute immediate 'alter table '|| pTable ||
     ' add FK_GUID varchar2(32) default sys_guid()';
  exception when eColumnExists then null;
  end;

  for i in (select t.trigger_name from sys.user_triggers t where t.table_name=upper(pTable) and t.table_owner=user)
  loop
    execute immediate 'alter trigger '|| i.trigger_name ||' compile';
  end loop;

  begin
      execute immediate 'create index idx_'|| pTable ||'_sync on '|| pTable ||' ('||pKey||')';
  exception when eObjExists or eIdxExists then null;
  end;

  begin
    execute immediate 'create index idx_'|| pTable ||'_guid on '|| pTable ||' (FK_GUID)';
  exception when eObjExists or eIdxExists then null;
  end;

  if pDup = 1 then
    begin
      execute immediate 'drop table asu.tp';
    exception when eObjNotExists then null;
    end;

    begin
      execute immediate 'drop index idx_tp_sync';
    exception when eObjNotExists or eIdxNotExists then null;
    end;

    execute immediate 'create table asu.tp as select '||pKey||', max(t.fk_guid) fk_guid
                       from asu.'|| pTable || ' t
                       group by '||pKey||'
                       having count(1)>1';


    begin
      execute immediate 'create index idx_tp_sync on '|| pTable ||' ('||pKey||')';
    exception when eObjExists or eIdxExists then null;
    end;

    --str := pKey;
    j := 1;
    loop
      i := instr(pKey, ',', j);
      if i = 0 then
        sstr := substr(pKey,j);
      else
        sstr := substr(pKey,j,i-j);
      end if;

      str := str || 't.' || sstr || ' = p.'|| sstr || ' and ';
      exit when i = 0;
      j := i+1;
    end loop;
    str := substr(str, 1, length(str) - 5);

    execute immediate 'update '|| pTable ||' t set t.fk_guid = (select p.fk_guid  from ASU.tp p
                                      where ' || str ||')
                        where exists (select 1 from asu.tp p where ' || str ||')';

    begin
      execute immediate 'drop table asu.tp';
    exception when eObjNotExists then null;
    end;
  end if;

  execute immediate 'create or replace directory sync as '''||pDir||'''';

  begin
    execute immediate 'drop table '|| pTable ||'2';
  exception when eObjNotExists then null;
  end;

  if pfk is not null then
    j := 1;
    str := '';
    str2 := '';
    str3 := '';
    loop
      i := instr(pFK, ',', j);
      if i = 0 then
        sstr := substr(pFK,j);
      else
        sstr := substr(pFK,j,i-j);
      end if;

      srtT := substr(sstr, instr(sstr,'.')+1, instr(sstr,'.',1,2)-instr(sstr,'.') - 1);
      if instr(str2,srtT) > 0 then
        if instr(str2,srtT||'1') > 0 then
          str2 := replace(str2,srtT, srtT||' '||srtT||'1');
          str := replace(str,srtT,srtT||'1');
          str3 := replace(str3,srtT,srtT||'1');
        else
          str2 := replace(str2,srtT, srtT||' '||srtT||'0');
          str := replace(str,srtT,srtT||'0');
          str3 := replace(str3,srtT,srtT||'0');
        end if;
      end if;

      str2 := str2 || srtT|| ',';
      str3 := str3 || substr(sstr, instr(sstr,'.')+1, instr(sstr,'.',1,2)-instr(sstr,'.') - 1)|| '.fk_guid '||substr(sstr, 1, instr(sstr,'.')-1)||'g,';

      str := str || 't.' || substr(sstr, 1, instr(sstr,'.')-1) || ' = '|| substr(sstr, instr(sstr,'.')+1) || '(+) and ';
      exit when i = 0;
      j := i+1;
    end loop;
    str := substr(str, 1, length(str) - 5);
    --str3 := replace(str2,',', '.fk_guid,');
    str2 := substr(str2, 1, length(str2) - 1);
    str3 := substr(str3, 1, length(str3) - 1);

    execute immediate 'create table '|| pTable ||'2 as select t.*,'||str3||
                                  ' from '||pTable||' t,'||str2||
                                  ' where '||str;
  else
    execute immediate 'create table '|| pTable ||'2 as select * from '|| pTable;
  end if;
end sync1;

--***********************************************************************

procedure sync2(pTable in varchar2,
                pKey   in varchar2,
                pSeq   in varchar2,
                pDir   in varchar2,
                pDup   in number := 0,
                pFK    in varchar2 := null) is
  str varchar2(32000);
  str2 varchar2(32000);
  str3 varchar2(32000);
  sstr varchar2(50);
  srtT varchar2(50);
  strFKU varchar2(32000);
  strFKtab varchar2(32000);
  strFKf varchar2(32000);
  strFKif varchar2(32000);
  --str2f  varchar2(32000);
  i   integer;
  j   integer;
  vSelf boolean := false;
begin

  begin
    execute immediate 'alter table '|| pTable ||' add FK_GUID varchar2(32) default sys_guid()';
  exception when eColumnExists then null;
  end;

  for i in (select t.trigger_name from sys.user_triggers t where t.table_name=upper(pTable) and t.table_owner=user)
  loop
    execute immediate 'alter trigger '|| i.trigger_name ||' compile';
  end loop;

  begin
    execute immediate 'create index ASU.idx_'|| pTable ||'_sync on '|| pTable ||' ('||pKey||')';
  exception when eObjExists or eIdxExists then null;
  end;

  begin
    execute immediate 'create index ASU.idx_'|| pTable ||'_guid on '|| pTable ||' (FK_GUID)';
  exception when eObjExists or eIdxExists then null;
  end;

  begin
    execute immediate 'create index ASU.idx_'|| pTable ||'2_sync on '|| pTable ||'2 ('||pKey||')';
  exception when eObjExists or eIdxExists then null;
  end;

  begin
    execute immediate 'create index ASU.idx_'|| pTable ||'2_guid on '|| pTable ||'2 (FK_GUID)';
  exception when eObjExists or eIdxExists then null;
  end;

  for i in (select t.COLUMN_NAME
              from sys.user_tab_columns t, sys.user_tab_columns tt
             where t.TABLE_NAME = upper(pTable) and t.COLUMN_NAME <> 'FK_ID'
               and tt.TABLE_NAME = upper(pTable||'2') and tt.COLUMN_NAME = t.COLUMN_NAME)
  loop
      str2 := str2 || i.COLUMN_NAME || ',';
  end loop;
  str2 := substr(str2, 1, length(str2) - 1);

  j := 1;

    loop
      i := instr(pKey, ',', j);

      if i = 0 then
        sstr := substr(pKey,j);
      else
        sstr := substr(pKey,j,i-j);
      end if;

      str := str || 't.' || sstr || ' = tt.'|| sstr || ' and ';
      exit when i = 0;
      j := i+1;
    end loop;
    str := substr(str, 1, length(str) - 5);

  execute immediate 'update '|| pTable ||' t set t.fk_guid = (select tt.fk_guid  from '||pTable||'2 tt
                                      where ' || str ||' and rownum=1)
                        where exists (select 1 from '||pTable||'2 tt where ' || str ||')';



  if pfk is not null then
    j := 1;
    loop
      i := instr(pFK, ',', j);
      if i = 0 then
        sstr := substr(pFK,j);
      else
        sstr := substr(pFK,j,i-j);
      end if;

      srtT := substr(sstr, instr(sstr,'.')+1, instr(sstr,'.',1,2)-instr(sstr,'.') - 1);
      if instr(strFKtab,srtT) > 0 then
        if instr(strFKtab,srtT||'1') > 0 then
          strFKtab := replace(strFKtab,srtT, srtT||' '||srtT||'1');
          strFKf := replace(strFKf,srtT,srtT||'1');
          strFKU := replace(strFKU,srtT,srtT||'1');
        else
          strFKtab := replace(strFKtab,srtT, srtT||' '||srtT||'0');
          strFKf := replace(strFKf,srtT,srtT||'0');
          strFKU := replace(strFKU,srtT,srtT||'0');
        end if;
      end if;

      strFKtab := strFKtab || srtT|| ',';

      if lower(ltrim(rtrim(srtT)))=lower(ltrim(rtrim(pTable))) then
        vSelf := true;
      end if;

      --strFKtab := strFKtab || substr(sstr, instr(sstr,'.')+1, instr(sstr,'.',1,2)-instr(sstr,'.') - 1)|| ',';
      strFKf := strFKf || substr(sstr, instr(sstr,'.')+1)||',';
      strFKif := strFKif || substr(sstr, 1, instr(sstr,'.')-1)||',';

      str2 := replace(str2, upper(substr(sstr, 1, instr(sstr,'.')-1)));
      str2 := replace(str2, ',,',',');

      strFKU := strFKU || 'tt.' || substr(sstr, 1, instr(sstr,'.')-1) || 'g = '|| substr(sstr, instr(sstr,'.')+1, instr(sstr,'.',1,2)-instr(sstr,'.') - 1) || '.fk_guid(+) and ';
      exit when i = 0;
      j := i+1;
    end loop;
    strFKU := substr(strFKU, 1, length(strFKU) - 5);
    --str3 := replace(str2,',', '.fk_guid,');
    strFKtab := substr(strFKtab, 1, length(strFKtab) - 1);
    strFKf := substr(strFKf, 1, length(strFKf) - 1);
    strFKif := substr(strFKif, 1, length(strFKif) - 1);
    str2 := ltrim(rtrim(str2,','),',');
    str3 := 'tt.'||replace(str2,',',',tt.');

    execute immediate
     'insert into '|| pTable ||' (fk_id, '||str2||','||strFKif||')
                  select '||pSeq||'.nextval, '||str3||','||strFKf||'
                    from '|| pTable ||'2 tt,'||strFKtab||'
                   where not exists (select 1 from '|| pTable ||' t
                                      where '||str||') and '||strFKU;

  else
    execute immediate 'insert into '|| pTable ||' (fk_id, '||str2||')
                  select '||pSeq||'.nextval, '||str2||'
                    from '|| pTable ||'2 tt
                   where not exists (select 1 from '|| pTable ||' t
                                      where '||str||')';
  end if;

  if pDup = 1 then
    begin
      execute immediate 'drop table asu.tp';
    exception when eObjNotExists then null;
    end;

    begin
      execute immediate 'drop index idx_tp_sync';
    exception when eObjNotExists or eIdxNotExists then null;
    end;

    execute immediate 'create table asu.tp as select '||pKey||', max(t.fk_guid) fk_guid
                       from asu.'|| pTable || ' t
                       group by '||pKey||'
                       having count(1)>1';


    begin
      execute immediate 'create index idx_tp_sync on '|| pTable ||' ('||pKey||')';
    exception when eObjExists or eIdxExists then null;
    end;

    --str := pKey;
    j := 1;
    strFKif := '';
    loop
      i := instr(pKey, ',', j);

      if i = 0 then
        sstr := substr(pKey,j);
      else
        sstr := substr(pKey,j,i-j);
      end if;

      strFKif := strFKif || 't.' || sstr || ' = p.'|| sstr || ' and ';
      exit when i = 0;
      j := i+1;
    end loop;
    strFKif := substr(strFKif, 1, length(strFKif) - 5);

    execute immediate 'update '|| pTable ||' t set t.fk_guid = (select p.fk_guid  from ASU.tp p
                                      where ' || strFKif ||')
                        where exists (select 1 from asu.tp p where ' || strFKif ||')';
  end if;

  if vSelf then
    j := 1;
    loop
      i := instr(pFK, ',', j);
      if i = 0 then
        sstr := substr(pFK,j);
      else
        sstr := substr(pFK,j,i-j);
      end if;

      srtT := substr(sstr, instr(sstr,'.')+1, instr(sstr,'.',1,2)-instr(sstr,'.') - 1);
      if lower(ltrim(rtrim(srtT)))=lower(ltrim(rtrim(pTable))) then
      execute immediate

      'update '||pTable||' t
            set '||substr(sstr, 1, instr(sstr,'.')-1)||' =
                 (select ttt'||substr(sstr,instr(sstr,'.',1,2))||'
                    from '||pTable||'2 tt, '||pTable||' ttt
                   where tt.'||substr(sstr, 1, instr(sstr,'.')-1)||'g = ttt.fk_guid
                     and t.fk_guid = tt.fk_guid and rownum=1)
          where t.'||substr(sstr, 1, instr(sstr,'.')-1)||' is null
            and t.fk_guid in (select tt.fk_guid from '||pTable||'2 tt
                               where tt.'||substr(sstr, 1, instr(sstr,'.')-1)||'g is not null)';

      end if;
    exit when i = 0;
      j := i+1;
    end loop;
  end if;

  begin
    execute immediate 'drop table '|| pTable ||'3';
  exception when eObjNotExists then null;
  end;

  if pfk is not null then
    j := 1;
    strFKU := '';
    strFKtab := '';
    strFKif := '';
    loop
      i := instr(pFK, ',', j);
      if i = 0 then
        sstr := substr(pFK,j);
      else
        sstr := substr(pFK,j,i-j);
      end if;

      srtT := substr(sstr, instr(sstr,'.')+1, instr(sstr,'.',1,2)-instr(sstr,'.') - 1);
      if instr(strFKtab,srtT) > 0 then
        if instr(strFKtab,srtT||'1') > 0 then
          strFKtab := replace(strFKtab,srtT, srtT||' '||srtT||'1');
          strFKf := replace(strFKf,srtT,srtT||'1');
          strFKU := replace(strFKU,srtT,srtT||'1');
          strFKif := replace(strFKif,srtT,srtT||'1');
        else
          strFKtab := replace(strFKtab,srtT, srtT||' '||srtT||'0');
          strFKf := replace(strFKf,srtT,srtT||'0');
          strFKU := replace(strFKU,srtT,srtT||'0');
          strFKif := replace(strFKif,srtT,srtT||'0');
        end if;
      end if;

      strFKtab := strFKtab || srtT|| ',';

      strFKif := strFKif || substr(sstr, instr(sstr,'.')+1, instr(sstr,'.',1,2)-instr(sstr,'.') - 1)|| '.fk_guid '||substr(sstr, 1, instr(sstr,'.')-1)||'g,';

      strFKU := strFKU || 'tt.' || substr(sstr, 1, instr(sstr,'.')-1) || ' = '|| substr(sstr, instr(sstr,'.')+1) || '(+) and ';
      exit when i = 0;
      j := i+1;
    end loop;
    strFKU := substr(strFKU, 1, length(strFKU) - 5);
    strFKif := substr(strFKif, 1, length(strFKif) - 1);
    strFKtab := substr(strFKtab, 1, length(strFKtab) - 1);

   execute immediate

    'create table '|| pTable ||'3 as
                      select tt.*,'||strFKif||' from '|| pTable ||' tt, '||strFKtab||'
                       where not exists (select 1 from '|| pTable ||'2 t
                                          where ' || str ||') and '|| strFKU;
  else
    execute immediate 'create table '|| pTable ||'3 as
                      select * from '|| pTable ||' tt
                       where not exists (select 1 from '|| pTable ||'2 t
                                          where ' || str ||')';
  end if;

  execute immediate 'create or replace directory sync as '''||pDir||'''';

  begin
    execute immediate 'drop index ASU.idx_'|| pTable ||'_sync';
  exception when eObjNotExists or eIdxNotExists then null;
  end;

  begin
    execute immediate 'drop index ASU.idx_'|| pTable ||'2_sync';
  exception when eObjNotExists or eIdxNotExists then null;
  end;

  begin
    execute immediate 'drop index ASU.idx_'|| pTable ||'2_guid';
  exception when eObjNotExists or eIdxNotExists then null;
  end;

end sync2;


procedure sync3(pTable in varchar2,
                pKey   in varchar2,
                pSeq   in varchar2,
                pDir   in varchar2,
                pDup   in number := 0,
                pFK    in varchar2 := null) is
  str varchar2(32000);
  str2 varchar2(32000);
  str3 varchar2(32000);
  sstr varchar2(50);
  srtT varchar2(50);
  strFKU varchar2(32000);
  strFKtab varchar2(32000);
  strFKf varchar2(32000);
  strFKif varchar2(32000);
  i   integer;
  j   integer;
  vSelf boolean := false;
begin
  for i in (select t.COLUMN_NAME
              from sys.user_tab_columns t, sys.user_tab_columns tt
             where t.TABLE_NAME = upper(pTable) and t.COLUMN_NAME <> 'FK_ID'
               and tt.TABLE_NAME = upper(pTable||'3') and tt.COLUMN_NAME = t.COLUMN_NAME)
  loop
      str2 := str2 || i.COLUMN_NAME || ',';
  end loop;
  str2 := substr(str2, 1, length(str2) - 1);

  j := 1;
  loop
      i := instr(pKey, ',', j);

      if i = 0 then
        sstr := substr(pKey,j);
      else
        sstr := substr(pKey,j,i-j);
      end if;

      str := str || 't.' || sstr || ' = tt.'|| sstr || ' and ';
      exit when i = 0;
      j := i+1;
  end loop;
  str := substr(str, 1, length(str) - 5);
  if pfk is not null then
    j := 1;
    loop
      i := instr(pFK, ',', j);
      if i = 0 then
        sstr := substr(pFK,j);
      else
        sstr := substr(pFK,j,i-j);
      end if;

      srtT := substr(sstr, instr(sstr,'.')+1, instr(sstr,'.',1,2)-instr(sstr,'.') - 1);
      if instr(strFKtab,srtT) > 0 then
        if instr(strFKtab,srtT||'1') > 0 then
          strFKtab := replace(strFKtab,srtT, srtT||' '||srtT||'1');
          strFKf := replace(strFKf,srtT,srtT||'1');
          strFKU := replace(strFKU,srtT,srtT||'1');
        else
          strFKtab := replace(strFKtab,srtT, srtT||' '||srtT||'0');
          strFKf := replace(strFKf,srtT,srtT||'0');
          strFKU := replace(strFKU,srtT,srtT||'0');
        end if;
      end if;

      strFKtab := strFKtab || srtT|| ',';

      if lower(ltrim(rtrim(srtT)))=lower(ltrim(rtrim(pTable))) then
        vSelf := true;
      end if;

      --strFKtab := strFKtab || substr(sstr, instr(sstr,'.')+1, instr(sstr,'.',1,2)-instr(sstr,'.') - 1)|| ',';
      strFKf := strFKf || substr(sstr, instr(sstr,'.')+1)||',';
      strFKif := strFKif || substr(sstr, 1, instr(sstr,'.')-1)||',';

      str2 := replace(str2, upper(substr(sstr, 1, instr(sstr,'.')-1)));
      str2 := replace(str2, ',,',',');

      strFKU := strFKU || 'tt.' || substr(sstr, 1, instr(sstr,'.')-1) || 'g = '|| substr(sstr, instr(sstr,'.')+1, instr(sstr,'.',1,2)-instr(sstr,'.') - 1) || '.fk_guid(+) and ';
      exit when i = 0;
      j := i+1;
    end loop;
    strFKU := substr(strFKU, 1, length(strFKU) - 5);
    --str3 := replace(str2,',', '.fk_guid,');
    strFKtab := substr(strFKtab, 1, length(strFKtab) - 1);
    strFKf := substr(strFKf, 1, length(strFKf) - 1);
    strFKif := substr(strFKif, 1, length(strFKif) - 1);
    str2 := ltrim(rtrim(str2,','),',');
    str3 := 'tt.'||replace(str2,',',',tt.');

    execute immediate

     'insert into '|| pTable ||' (fk_id, '||str2||','||strFKif||')
                  select '||pSeq||'.nextval, '||str3||','||strFKf||'
                    from '|| pTable ||'3 tt,'||strFKtab||'
                   where not exists (select 1 from '|| pTable ||' t
                                      where '||str||') and '||strFKU;
  else
    execute immediate
     'insert into '|| pTable ||' (fk_id, '||str2||')
                  select '||pSeq||'.NEXTVAL, '||str2||'
                    from '|| pTable ||'3 tt
                   where not exists (select 1 from '|| pTable ||' t
                                      where '||str||')';

  end if;

  if vSelf then
    j := 1;
    loop
      i := instr(pFK, ',', j);
      if i = 0 then
        sstr := substr(pFK,j);
      else
        sstr := substr(pFK,j,i-j);
      end if;

      srtT := substr(sstr, instr(sstr,'.')+1, instr(sstr,'.',1,2)-instr(sstr,'.') - 1);
      if lower(ltrim(rtrim(srtT)))=lower(ltrim(rtrim(pTable))) then
     execute immediate

      'update '||pTable||' t
            set '||substr(sstr, 1, instr(sstr,'.')-1)||' =
                 (select ttt'||substr(sstr,instr(sstr,'.',1,2))||'
                    from '||pTable||'3 tt, '||pTable||' ttt
                   where tt.'||substr(sstr, 1, instr(sstr,'.')-1)||'g = ttt.fk_guid
                     and t.fk_guid = tt.fk_guid and rownum=1)
          where t.'||substr(sstr, 1, instr(sstr,'.')-1)||' is null
            and t.fk_guid in (select tt.fk_guid from '||pTable||'3 tt
                               where tt.'||substr(sstr, 1, instr(sstr,'.')-1)||'g is not null)';

      end if;
    exit when i = 0;
      j := i+1;
    end loop;
  end if;

  begin
    execute immediate 'drop table asu.tp';
  exception when eObjNotExists then null;
  end;
  /*begin
    execute immediate 'drop table '|| pTable ||'2';
  exception when eObjNotExists then null;
  end;
  begin
    execute immediate 'drop table '|| pTable ||'3';
  exception when eObjNotExists then null;
  end;*/
  begin
    execute immediate 'drop index ASU.idx_'|| pTable ||'_sync';
  exception when eObjNotExists or eIdxNotExists then null;
  end;
  begin
    execute immediate 'drop index ASU.idx_'|| pTable ||'2_sync';
  exception when eObjNotExists or eIdxNotExists then null;
  end;
end sync3;

procedure crtr(pTable in varchar2, pFK in varchar2, pSeq in varchar) is
  j integer;
  i integer;
  sstr varchar2(50);
  str2 varchar2(32000);
  str3 varchar2(32000);
  strFKtab varchar2(32000);
  strFKtabu varchar2(32000);
  strFKf varchar2(32000);
  strFKU varchar2(32000);
  srtT varchar2(32000);
  strFKif varchar2(32000);
  strFKiff varchar2(32000);
  strFKifu varchar2(32000);
  strUpd varchar2(32000);
  strUpdf varchar2(32000);
begin


  for i in (select t.COLUMN_NAME
              from sys.user_tab_columns t
             where t.TABLE_NAME = upper(pTable) and t.COLUMN_NAME <> 'FK_ID')
  loop
    str2 := str2 ||':new.'|| i.COLUMN_NAME || ',';
  end loop;
  str2 := substr(str2, 1, length(str2) - 1);

  if pFK is not null then
    j := 1;
    loop
      i := instr(pFK, ',', j);
      if i = 0 then
        sstr := substr(pFK,j);
      else
        sstr := substr(pFK,j,i-j);
      end if;

      srtT := substr(sstr, instr(sstr,'.')+1, instr(sstr,'.',1,2)-instr(sstr,'.') - 1);

      strFKtab := strFKtab ||
        'begin
          select t.fk_guid into  v'||srtT||substr(sstr, 1,  instr(sstr,'.')-1)||' from asu.'||srtT||' t where t.'||substr(sstr, instr(sstr,'.',1,2)+1)||' = :new.'||substr(sstr, 1, instr(sstr,'.')-1)||';
         exception when others then
           v'||srtT||substr(sstr, 1,  instr(sstr,'.')-1)||' := null;
         end;
        ';
      strFKtabu := strFKtabu||
        'begin
          select t.'||substr(sstr, instr(sstr,'.',1,2)+1)||' into v'||srtT||substr(sstr, 1,  instr(sstr,'.')-1)||' from asu.'||srtT||' t where t.fk_guid = :new.'||substr(sstr, 1, instr(sstr,'.')-1)||'g'||';
         exception when others then null;
         end;
        ';

      strFKU := strFKU || ' v'||srtT||substr(sstr, 1,  instr(sstr,'.')-1)||' varchar(32);
      ';
      strFKf := strFKf ||'v'||srtT||substr(sstr, 1,  instr(sstr,'.')-1)||',';
      strFKif := strFKif || substr(sstr, 1, instr(sstr,'.')-1)||'g,';
      strFKiff := strFKiff || substr(sstr, 1, instr(sstr,'.')-1)||',';
      str2 := replace(str2, ':new.'||upper(substr(sstr, 1, instr(sstr,'.')-1)));
      str2 := replace(str2, ',,',',');

      strUpdf := strUpdf || substr(sstr, 1, instr(sstr,'.')-1) || ' = v'||srtT||substr(sstr, 1,  instr(sstr,'.')-1)||',' ;

      exit when i = 0;
      j := i+1;
    end loop;

    end if;

    /*strFKU := substr(strFKU, 1, length(strFKU) - 5);*/
    strFKtab := substr(strFKtab, 1, length(strFKtab) - 1);
    strFKf := substr(strFKf, 1, length(strFKf) - 1);
    if length(strFKif) >0 then
      strFKif := substr(strFKif, 1, length(strFKif) - 1);

      strFKifu := ', sys_guid() '||replace(strFKif,',',', sys_guid() ');
      strFKiff := substr(strFKiff, 1, length(strFKiff) - 1);
    end if;
    str2 := ltrim(rtrim(str2,','),',');
    str3 := replace(str2,':new.','')||',';

    j := 1;
    loop
      i := instr(str3, ',', j);
      if i = 0 then
        sstr := substr(str3,j);
      else
        sstr := substr(str3,j,i-j);
      end if;

      exit when i = 0;
      strUpd := strUpd || sstr || ' = :new.'|| sstr ||',';

      j := i+1;
    end loop;
    --strUpd := substr(strUpd, 1, length(strUpd)-1);

  begin
    execute immediate 'drop table '||pTable||'_s';
  exception when eObjNotExists then null;
  end;

  begin
    execute immediate 'create table '||pTable||'_s as select t.*,systimestamp fd_edittime '||strFKifu||'
                       from '||pTable||' t where 1=0';
  exception when eObjExists then null;
  end;

 begin
   execute immediate

   'CREATE OR REPLACE TRIGGER tr_'||pTable||'
     AFTER INSERT OR UPDATE OR DELETE ON '||pTable||' FOR EACH ROW
   declare
     vID  number;
     vStr varchar2(2000);
    '||strFKU||'
   begin
     if PKG_sync.v_is_repl = 0 then
       PKG_sync.v_is_repl := 2;
       if INSERTING then
         '||strFKtab||'
         insert into '||pTable||'_s (FK_ID'||replace(','||str3||strFKif||',',',,',',')||'fd_edittime)
              values (0'||replace(','||str2||','||strFKf||',',',,',',')||'systimestamp);
       elsif DELETING then
         insert into '||pTable||'_s (fk_id, fk_guid, fd_edittime)
              values (1, :old.fk_guid, systimestamp);
       elsif UPDATING then
         '||strFKtab||'
         insert into '||pTable||'_s (FK_ID'||replace(','||str3||strFKif||',',',,',',')||'fd_edittime)
              values (2'||replace(','||str2||','||strFKf||',',',,',',')||'systimestamp);
       end if;
       PKG_sync.v_is_repl := 0;
     end if;
   exception when others then
     begin
      PKG_sync.v_is_repl := 0;
      select seq_sync_log.nextval into vID from dual;
      vStr := SQLERRM;
      insert into tsync_log values (vID, systimestamp(3), vStr);
     end;
   end;';

 exception when others then null;
 end;


 strFKU := replace(strFKU,'varchar(32)','number');


 begin
 execute immediate

 'CREATE OR REPLACE TRIGGER tr_'||pTable||'_s
    AFTER INSERT ON '||pTable||'_s FOR EACH ROW
  declare
    vID  number;
    vStr varchar(2000);
    '||strFKU||'
  BEGIN
   if PKG_sync.v_is_repl = 0 then
    PKG_sync.v_is_repl := 1;
    if :new.fk_id = 1 then
      delete from '||pTable||' t where t.fk_guid = :new.fk_guid;
    elsif :new.fk_id = 2 then
      '||strFKtabu||'
      update '||pTable||' set '|| rtrim(replace(strUpd || strUpdf,',,',','),',') || '
      where fk_guid = :new.fk_guid;
    elsif :new.fk_id = 0 then
      '||strFKtabu||'
        insert into '||pTable||'(FK_ID'||rtrim(replace(','||str3||strFKiff,',,',','),',')||')
             values ('||pSeq||'.nextval'||rtrim(replace(','||str2||','||strFKf,',,',','),',')||');
    end if;
    
    PKG_sync.v_is_repl := 0;
   end if;
exception when others then
     begin
      PKG_sync.v_is_repl := 0;
      select seq_sync_log.nextval into vID from dual;
      vStr := SQLERRM;
      insert into tsync_log values (vID, systimestamp(3), vStr);
     end;
END;
 ';
exception when others then null;
 end;
end crtr;

function get_smid(fk_id in number) return boolean is
pragma autonomous_transaction;
  vRes integer(1) := 0;
begin

  select 1 into vRes from dual where fk_id in (select t.fk_owner from tsmid t
                            where t.fc_synonim in ('PERELIV_OPERAC','PERELIV_POS','PERELIV_TERAP')
                            union all
                           select t.fk_owner from tsmid t
                            start with t.fk_id = 1321
                            connect by prior t.fk_id = t.fk_owner);
  return true;

exception when others then return  false;
end get_smid;

function get_company(pfk_id in number) return boolean is
pragma autonomous_transaction;
  vRes integer(1) := 0;
begin

  select 1 into vRes from dual where pfk_id in (
          select p.fk_id from asu.tcompany p
        connect by prior p.fk_id = p.fk_owner
        start with fc_synonim = 'ROOT_LPU');
  return true;

exception when others then return  false;
end get_company;


function get_smid_owner(pfk_ownerg in varchar) return number is
pragma autonomous_transaction;
vtsmidfk_owner number;
begin
  select t.fk_id into vtsmidfk_owner from asu.tsmid t where t.fk_guid = pfk_ownerg;
  return vtsmidfk_owner;
exception when others then return null;
end;

function get_smid_ownerg(pfk_ownerg in number) return varchar is
pragma autonomous_transaction;
vtsmidfk_ownerg varchar(32);
begin
  select t.fk_guid into vtsmidfk_ownerg from asu.tsmid t where t.fk_id = pfk_ownerg;
  return vtsmidfk_ownerg;
exception when others then return null;
end;

  function GetGuidByID(ID in number, tab_name in varchar2) return varchar2 is
    PRAGMA AUTONOMOUS_TRANSACTION;
    guid1 varchar2(32);
    sTmp  varchar2(200);
  begin
    sTmp := 'select FK_GUID from ' || tab_name || ' where FK_ID = ' ||
            to_char(ID);
    begin
      execute immediate sTmp into guid1;
    exception
      when others then return null;
    end;
    return guid1;
  end;

  function GetIDByGuid(GUID in varchar2, tab_name in varchar2) return number is
    PRAGMA AUTONOMOUS_TRANSACTION;
    id1   number;
    sTmp  varchar2(200);
  begin
    sTmp := 'select FK_ID from ' || tab_name || ' where FK_GUID = ''' || GUID||'''';
    begin
      execute immediate sTmp into id1;
    exception
      when others then return null;
    end;
    return id1;
  end;

end pkg_sync;
/

SHOW ERRORS;


