DROP FUNCTION ASU.GET_SMID_ANALIZ_ID
/

--
-- GET_SMID_ANALIZ_ID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_SMID_ANALIZ_ID" 
return NUMBER
as
  nFK_ID NUMBER := 0.0;
begin
  select fk_id into nFK_ID from tsmid where FC_NAME='Анализы';
  return nFK_ID;
end;
/

SHOW ERRORS;


