DROP FUNCTION ASU.GET_LECHVRACH
/

--
-- GET_LECHVRACH  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TVRACH (Table)
--   TAMBVRACH (Table)
--   GET_IB (Function)
--   GET_PACFIO (Function)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_LECHVRACH" ( pFK_PACID in number)
  RETURN  number IS
cursor c1 is select/*+first_row*/fk_vrachid from tvrach where fk_pacid=pFK_PACID and fl_vid='M' UNION
select/*+first_row*/fk_vrachid from tAMBvrach where fk_pacid=pFK_PACID and fl_vid='M';
cursor c2 is select get_pacfio(fk_id), get_ib(fk_id) from tkarta where fk_id=pFK_PACID;
nRes number;
sFIO varchar2(150);
sIB varchar2(12);
BEGIN
  open c1;
  fetch c1 into nRes;
--  if c1%notfound then
--    close c1;
--    open c2;
--    fetch c2 into sFio, sIB;
--    close c2;
--    raise_application_error(-20001,'Пациенту'||sFIO||' № И.Б. '||sIB||' не назначен лечащий врач, обратитесь в регистратуру');
--  end if;
close c1;
return nRes;

END; -- Function GET_LECHVRACH
/

SHOW ERRORS;


