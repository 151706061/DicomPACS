DROP FUNCTION ASU.GET_ANAL_RESULT_SINGLE
/

--
-- GET_ANAL_RESULT_SINGLE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TRESAN (Table)
--   GET_NAME_FROM_SMID (Function)
--   GET_TYPE_FROM_SMID (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_ANAL_RESULT_SINGLE" 
  ( pFK_NAZID IN NUMBER,pFK_SMID IN NUMBER)
  RETURN VARCHAR2 IS
-- Purpose: Собирает для одной строчки назначения текст
-- By Philip A. Milovanov
  CURSOR c(pNAZID NUMBER,pSMID NUMBER) IS select TRESAN.FN_RES,GET_NAME_FROM_SMID(FK_BLOBID) FC_COMBO,FC_RES,GET_TYPE_FROM_SMID(FK_BLOBID) FC_COMTYPE, GET_TYPE_FROM_SMID(FK_SMID) FC_TYPE
              from tresan
              where fk_patid>0 and fk_nazid=pNAZID and FK_SMID=pSMID;
  str VARCHAR2(200);
BEGIN
  FOR p IN c(pFK_NAZID,pFK_SMID) LOOP
    if p.FC_TYPE='NUMBER' then
      str:=p.FN_RES;
    elsif p.FC_TYPE='VARCHAR2' then
      str:=p.FC_RES;
    elsif p.FC_TYPE='COMBOBOX' then
      str:=p.FC_COMBO;
      if p.FC_COMTYPE='NUMBER' then
        str:=str||' '||p.FN_RES;
      end if;
    END IF;
  END LOOP;
  RETURN str;
END; -- Function GET_ANAL_RESULT_SINGLE
/

SHOW ERRORS;


