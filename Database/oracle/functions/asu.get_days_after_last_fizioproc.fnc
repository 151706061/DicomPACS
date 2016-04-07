DROP FUNCTION ASU.GET_DAYS_AFTER_LAST_FIZIOPROC
/

--
-- GET_DAYS_AFTER_LAST_FIZIOPROC  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TLASTNAZS (Table)
--   TAMBTALON (Table)
--
CREATE OR REPLACE FUNCTION ASU.get_days_after_last_fizioproc(pTALONID IN NUMBER, pPACID IN NUMBER)
  RETURN NUMBER IS
  Res NUMBER;
  pFD_OPENED date;
  pFD_FIZIOPROCINSDATE date;
  CURSOR cTalon is select fd_opened from asu.tambtalon where fk_id = pTALONID;
  CURSOR cLastNaz is select fd_fizioprocinsdate from asu.tlastnazs where fk_pacid = pPACID;
BEGIN 
  open cLastNaz;
  fetch cLastNaz into pFD_FIZIOPROCINSDATE;
  close cLastNaz;  

  if pFD_FIZIOPROCINSDATE is null then
    Res := 0;
  else
    open cTalon;
    fetch cTalon into pFD_OPENED;
    close cTalon;
    if pFD_OPENED > pFD_FIZIOPROCINSDATE then
      Res := 0;
    else
      Res := sysdate - pFD_FIZIOPROCINSDATE;  
    end if;
  end if;
  RETURN Res;    
END;
/

SHOW ERRORS;


