DROP FUNCTION ASU.IS_TALON_IN_STAC_PERIOD
/

--
-- IS_TALON_IN_STAC_PERIOD  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TPAC_INSURANCE (Table)
--   TAMBTALON (Table)
--   TAMBULANCE (Table)
--   TINSURDOCS (Table)
--   TPERESEL (Table)
--   GET_DEF_FUNCT (Function)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU.IS_TALON_IN_STAC_PERIOD(pFK_TALONID in number, pFD_DATE in date) return number is


res number := 0;

cursor c is
  select count(1) 
  from ASu.Tambtalon t, ASU.TAMBULANCE a, ASU.TKARTA k, ASU.TPERESEL p
  where t.fk_ambid = a.fk_id
    and a.fk_peplid = k.fk_peplid
    and k.fk_id = p.fk_pacid
    and t.FK_ID = pFK_TALONID
    and p.fd_data1 <= pFD_DATE
    and p.fd_data2 >= pFD_DATE;

cursor c2 is
  select count(1) 
  from ASu.Tambtalon t INNER JOIN ASU.TAMBULANCE a
    ON t.fk_ambid = a.fk_id INNER JOIN ASU.TINSURDOCS ti 
    ON t.fk_insuranceid = ti.fk_id INNER JOIN ASU.TKARTA k
    ON a.fk_peplid = k.fk_peplid INNER JOIN ASU.TPAC_INSURANCE tpi 
    ON k.fk_id = tpi.fk_pacid INNER JOIN ASU.TINSURDOCS ti2 
    ON tpi.fk_insurdocid = ti2.fk_id AND ti.fk_typedocid = ti2.fk_typedocid INNER JOIN ASU.TPERESEL p 
    ON k.fk_id = p.fk_pacid
  where t.FK_ID = pFK_TALONID
    and p.fd_data1 <= pFD_DATE
    and p.fd_data2 >= pFD_DATE;

Begin

if ASU.GET_DEF_FUNCT('AMBT_STAC_CHECK_CLTINS') = 1
THEN
  open c2;
  fetch c2 into res;
  close c2;
ELSE
  open c;
  fetch c into res;
  close c;
END IF;

 return res;
End;
/

SHOW ERRORS;


