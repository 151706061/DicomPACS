DROP PROCEDURE ASU.SET_PACKUR
/

--
-- SET_PACKUR  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TANAMNEZ (Table)
--
CREATE OR REPLACE PROCEDURE ASU."SET_PACKUR" 
   (pFK_ID IN NUMBER, pFN_KUR IN NUMBER)
   IS
  CURSOR cTemp IS SELECT/*+rule*/ FP_KUR FROM TANAMNEZ WHERE FK_PACID=pFK_ID;
  nTemp NUMBER;
BEGIN
  if pFN_KUR=0 then
    UPDATE TANAMNEZ SET FP_KUR=0 WHERE FK_PACID=pFK_ID;
  ELSE
    OPEN cTemp;
    FETCH cTemp INTO nTemp;
    CLOSE cTemp;
--    raise_application_error(-20001,to_char(nTemp));
    if nTemp<=1 or nTemp is NULL then
      UPDATE TANAMNEZ SET FP_KUR=1 WHERE FK_PACID=pFK_ID;
    end if;
  end if;
END; -- Procedure
/

SHOW ERRORS;


