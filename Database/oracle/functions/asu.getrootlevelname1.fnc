DROP FUNCTION ASU.GETROOTLEVELNAME1
/

--
-- GETROOTLEVELNAME1  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TCONST (Table)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."GETROOTLEVELNAME1" (p_FK_ID in Integer)
  return Varchar2 as
  v_Ret Varchar2(150);
-- Возвращает НАЗВАНИЕ Раздела по FK_ID
-- Используется алгоритм определния раздела с помщью TCONST
-- Author: Ura 
-- COPYED FROM PKG_SMID --by TimurLan 18/09/04
begin
  SELECT S.fc_name
    into v_Ret
    FROM TSMID S
   WHERE S.fk_id IN
         (SELECT FN_CONST FROM TCONST WHERE FC_FUNC LIKE 'RAZDEL_%')
  CONNECT BY S.FK_ID = PRIOR S.fk_owner
   START WITH S.fk_ID = p_FK_ID;
  Return v_Ret;
end;
/

SHOW ERRORS;


