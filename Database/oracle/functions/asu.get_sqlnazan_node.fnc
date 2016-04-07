DROP FUNCTION ASU.GET_SQLNAZAN_NODE
/

--
-- GET_SQLNAZAN_NODE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_SQLNAZAN_NODE" return VARCHAR is
  CLINIK_NODE constant NUMBER := 21469;
  PARAKL_OTDEL constant NUMBER := 21467;
  STACIONAR_NODE_CHILD constant NUMBER := 21466;
  PRIM_NODE_CHILD constant NUMBER := 21468;
begin
  return 'select * from('||CHR(13)||
         '  select FK_ID,'||CHR(13)||
         '         FK_OWNERID FK_OWNER,'||CHR(13)||
         '         FC_NAME,'||CHR(13)||
         '         FL_DEL,'||CHR(13)||
         '         0 FL_CHECK,'||CHR(13)||
         '         :pFK_SOTR from totdel where fk_id in (select fk_id from totdel'||CHR(13)||
         '                                                START WITH FK_ID in ('||STACIONAR_NODE_CHILD||','||PRIM_NODE_CHILD||')'||CHR(13)||
         '                                                CONNECT BY PRIOR FK_ID = FK_OWNERID  minus select fk_ownerid from totdel)'||CHR(13)||
         '  union'||CHR(13)||
         '  select FK_ID,'||CHR(13)||
         '         FK_OWNERID FK_OWNER,'||CHR(13)||
         '         FC_NAME,'||CHR(13)||
         '         FL_DEL,'||CHR(13)||
         '         0 FL_CHECK,'||CHR(13)||
         '         :pFK_SOTR from totdel'||CHR(13)||
         '      START WITH FK_ID in ('||CLINIK_NODE||','|| PARAKL_OTDEL||')'||CHR(13)||
         '      CONNECT BY PRIOR FK_ID = FK_OWNERID)'||CHR(13)||
         ' where case when fl_del = :p and :p = 0 then 1 when :p = 1 then 1 else 0 end = 1'||CHR(13)||
         ' order by fc_name';
end get_SQLNAZAN_NODE;
/

SHOW ERRORS;


