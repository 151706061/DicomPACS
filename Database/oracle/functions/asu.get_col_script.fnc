DROP FUNCTION ASU.GET_COL_SCRIPT
/

--
-- GET_COL_SCRIPT  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   ALL_TAB_COLUMNS (Synonym)
--
CREATE OR REPLACE FUNCTION ASU.get_col_script(sName varchar2, sOwner varchar2 default 'ASU')
return clob
is
--sName varchar2(30) default 'TMALFORMATION';
--res varchar2(32000);
res clob;
cursor x is select * from all_tab_columns where table_name = Upper(sName) and owner = upper(sOwner)  order by column_id;
begin
res:='Begin '||chr(10);
for xx in x loop
res:=res||chr(10)||'  ASU.ADD_column (''asu.'||sname||''' ,'''||xx.column_name||''','''||xx.data_type||
(case when xx.data_type != 'DATE' then ' ('||nvl(xx.data_precision,xx.data_length)||')' else '' end)
|| (case when xx.data_DEFAULT is null then '' else ' DEFAULT '||xx.data_DEFAULT end)
||''');'
;
end loop;
res:=res||chr(10)||' END;';
return res;
end;
/

SHOW ERRORS;


