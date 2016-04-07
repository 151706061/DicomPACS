DROP FUNCTION ASU.MY_TO_CHAR
/

--
-- MY_TO_CHAR  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."MY_TO_CHAR" ( pNUM IN NUMBER )
  RETURN  VARCHAR2 IS

  nc VARCHAR2(100):='';

BEGIN

   -- nc := to_char(pNUM,'FMB9G999G999G990D99','NLS_NUMERIC_CHARACTERS = ''. '' ');
    nc:=nvl(to_char(pNUM,'FM9G999G999G990D99','NLS_NUMERIC_CHARACTERS = ''. '' '),0);
    if substr(nc,length(nc),1) = '.' then
        nc := substr(nc, 1 ,length(nc)-1);
    end if;

    RETURN nc ;
END;
/

SHOW ERRORS;


