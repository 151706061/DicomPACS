DROP PROCEDURE ASU.CORRECT_TNAZMED_STATE
/

--
-- CORRECT_TNAZMED_STATE  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZMED (Table)
--   TNAZMED_PROLONG (Table)
--   GET_NAZ_NOTPROCESSED (Function)
--   GET_NAZ_PROCESS (Function)
--   GET_VIPNAZ (Function)
--
CREATE OR REPLACE PROCEDURE ASU.correct_tnazmed_state
  ( FK_NAZID IN NUMBER,
    FK_NAZMARKID IN NUMBER DEFAULT -1)
--  RETURN  NUMBER
  IS
  nm_count NUMBER;
  nm_prolong_count NUMBER;
  pVIPNAZ NUMBER; -- полностью выполнено
  pNAZ_NOTPROCESSED NUMBER; -- не выполнено
  pNAZ_PROCESSING NUMBER; --выполняется
  pNAZ_CANCEL NUMBER; --отменено
BEGIN
  if NVL(FK_NAZID,-1)>0 then
    begin
    -- анализ статуса назначения - нужно поменять или нет
      select NVL(max(NM.FN_VIDANO) OVER(), 0),
             (select NVL(sum(FN_DURATION), 0)
                from ASU.TNAZMED_PROLONG NMP
               where NMP.FK_NAZMEDID = NM.FK_ID)
        into nm_count, nm_prolong_count
        from ASU.TNAZMED NM
       where NM.FK_ID = FK_NAZID;
    exception
      when others then
        nm_count := 0;
    end;

    pVIPNAZ           := ASU.GET_VIPNAZ;           -- полностью выполнено
    pNAZ_NOTPROCESSED := ASU.GET_NAZ_NOTPROCESSED; -- не выполнено
    pNAZ_PROCESSING   := ASU.GET_NAZ_PROCESS;      -- выполняется
    if (nm_count = 0) then
      update asu.tnazmed set fk_state = DECODE(fk_state,
                                               pNAZ_PROCESSING  , pNAZ_NOTPROCESSED,
                                               pVIPNAZ          , pNAZ_NOTPROCESSED,
                                                                  fk_state)
      where fk_id = FK_NAZID;
    else
      update asu.tnazmed set fk_state = DECODE(fk_state,
                                               pNAZ_NOTPROCESSED, DECODE(nvl(fn_duration,1)+nm_prolong_count, nm_count,pVIPNAZ, pNAZ_PROCESSING),
                                               pNAZ_PROCESSING  , DECODE(nvl(fn_duration,1)+nm_prolong_count, nm_count,pVIPNAZ, pNAZ_PROCESSING),
                                               pVIPNAZ          , DECODE(nvl(fn_duration,1)+nm_prolong_count, nm_count,pVIPNAZ, pNAZ_PROCESSING),
                                                                  fk_state)
      where fk_id = FK_NAZID;
    end if;
  end if;
END;
/

SHOW ERRORS;


