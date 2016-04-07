DROP FUNCTION ASU.GET_VETKU_SMIDA
/

--
-- GET_VETKU_SMIDA  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU.GET_VETKU_SMIDA(pFK_ID number default -1)
return varchar2 is result varchar2(500);
begin
SELECT rtrim(reverse(sys_connect_by_path(REVERSE(fc_name),'~')),'~')x into result FROM asu.tsmid t
where CONNECT_BY_ISLEAF=1
CONNECT by PRIOR fk_owner=fk_id
START WITH fk_id = pFK_ID;--792620
return result;
end;
/

SHOW ERRORS;


