DROP FUNCTION ASU.BUH_GET_PUTNO
/

--
-- BUH_GET_PUTNO  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSROKY (Table)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU."BUH_GET_PUTNO" ( fk_RegPacId IN number)
  RETURN  varchar2 IS
  pPut1  varchar2(100);
--  pPut2 : varchar2(100);
--  P     : varchar2(100);
  cursor cPut is select fc_document from tsroky where fk_pacid=fk_RegPacId and fk_pryb<>1;
BEGIN
  select fc_put into pPut1 from tkarta where fk_id= fk_RegPacId;
  for p in cPut loop
  if p.fc_Document is not null then
    pPut1 := pPut1||', '||p.fc_Document;
   end if;
  end loop;
  return pPut1;
END;
/

SHOW ERRORS;


