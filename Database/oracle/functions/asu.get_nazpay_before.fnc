DROP FUNCTION ASU.GET_NAZPAY_BEFORE
/

--
-- GET_NAZPAY_BEFORE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TUSLUG (Synonym)
--
CREATE OR REPLACE FUNCTION ASU."GET_NAZPAY_BEFORE" 
  ( pNAZID IN NUMBER)
  RETURN  VARCHAR2 IS
  CURSOR c1 is select fl_opl fl_opl from tuslug where fk_medDocID=pNAZID;
  nTmp NUMBER;
  sTmp VARCHAR2(3);
BEGIN
OPEN c1;
FETCH c1 INTO nTmp;
CLOSE c1;
sTmp:= 'мер';
if (nTmp =1)or(nTmp=-1) then sTmp:= 'дю';
END IF;
RETURN sTmp;

END;
/

SHOW ERRORS;


