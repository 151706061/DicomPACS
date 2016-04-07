DROP FUNCTION ASU.IS_DOP_DISP_DOC
/

--
-- IS_DOP_DISP_DOC  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   DOC_DISP_DOP (Function)
--   GET_IS_EXIST_OBJECT (Function)
--
CREATE OR REPLACE FUNCTION ASU.IS_DOP_DISP_DOC(pFK_USLVID NUMBER)
RETURN NUMBER
       IS
vRet         NUMBER;
vFK_DOP_DISP NUMBER;
BEGIN
  vRet := 0;
  vFK_DOP_DISP := -1979;

  IF ASU.GET_IS_EXIST_OBJECT('doc_disp_dop') > 0
  THEN
    vFK_DOP_DISP := asu.doc_disp_dop;
  END IF;

  IF pFK_USLVID IN (vFK_DOP_DISP, 1401, 1461, 841)
  THEN
     vRet := 1;
  END IF;

  Return vRet;
END;
/

SHOW ERRORS;


