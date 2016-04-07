DROP FUNCTION ASU.GET_FIRSTRESLECH
/

--
-- GET_FIRSTRESLECH  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TRESLECH (Table)
--
CREATE OR REPLACE FUNCTION ASU.GET_FIRSTRESLECH(pnazid NUMBER, pSos NUMBER default null) RETURN Number IS
  vRes Number;
BEGIN
  select max(fk_id)
    into vRes
    from (select FIRST_VALUE(vr.fk_id) OVER(PARTITION BY vr.fk_nazid ORDER BY vr.fd_ins, vr.fk_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fk_id
            from asu.TRESLECH vr
           where vr.fk_nazid = pnazid
             and (pSos is null or (pSos is not null and vr.fk_sos = pSos)));

  return(vRes);
END;
/

SHOW ERRORS;


