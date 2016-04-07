DROP FUNCTION ASU.GET_COLUMN_LEN
/

--
-- GET_COLUMN_LEN  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   ALL_TAB_COLUMNS (Synonym)
--
CREATE OR REPLACE FUNCTION ASU.GET_COLUMN_LEN(aOWNER IN VARCHAR2, aTABLE IN VARCHAR2, aCOLUMN IN VARCHAR2) RETURN NUMBER IS
  vResult NUMBER;
begin
  select case
           when ttc.DATA_TYPE = 'NUMBER' then
            ttc.DATA_PRECISION
           when ttc.DATA_TYPE = 'VARCHAR2' then
            ttc.CHAR_COL_DECL_LENGTH
           else
            0
         end FN_LENGTH
        into vResult
    from ALL_TAB_COLUMNS ttc
   where ttc.owner = aOWNER
     and ttc.TABLE_NAME = aTABLE
     and ttc.column_name = aCOLUMN;

  return(vResult);
end;
/

SHOW ERRORS;


