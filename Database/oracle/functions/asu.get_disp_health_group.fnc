DROP FUNCTION ASU.GET_DISP_HEALTH_GROUP
/

--
-- GET_DISP_HEALTH_GROUP  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TRICHVIEWDATA (Table)
--   TSMID (Table)
--   VNAZ (Table)
--
CREATE OR REPLACE FUNCTION ASU.GET_DISP_HEALTH_GROUP(pPacId in number)
  return varchar2
is
  tmpText clob;
  tmpStr varchar2(8);
  n1 number;
begin
  select FB_TEXT into tmpText
    from
    (
      select r.FB_TEXT, row_number() over (order by v.FD_RUN desc) r
        from ASU.TRICHVIEWDATA r, ASU.VNAZ v, ASU.TSMID s
       where r.FK_PACID = v.FK_ID
         and v.FK_SMID = s.FK_ID
         and s.FC_SYNONIM in ('KONS_DISP_1')
         and v.FK_PACID = pPacId
    )
   where r = 1;

  n1 := NVL(INSTR(tmpText, 'Группа здоровья:'), 0);
  if n1 <> 0 then
    tmpStr := TRIM('_' from TRIM(SUBSTR(tmpText, n1 + 16, 8)));
  end if;

  return tmpStr;
end;
/

SHOW ERRORS;


