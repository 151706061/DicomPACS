DROP FUNCTION ASU.GET_ANAL_NAME
/

--
-- GET_ANAL_NAME  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_ANAL_NAME" 
  ( pFK_ID IN NUMBER)
  RETURN  VARCHAR2 IS
  CURSOR c IS select fc_name, rownum from
                (select fk_id, fc_name, fk_owner,FL_SHOWANAL
                from tsmid start with fk_id=pFK_ID
                connect by prior fk_owner=fk_id)
                where fk_owner<>0 AND FL_SHOWANAL IN (2,3,4)
                order by rownum desc;
  str VARCHAR2(1000);
BEGIN
  FOR p IN c LOOP
    IF str IS NULL THEN
      str:=p.FC_NAME||':';
    ELSE
      str:=str||' '||p.FC_NAME;
    END IF;
  END LOOP;
  RETURN str;
END; -- Function GET_ANAL_NAME
/

SHOW ERRORS;


