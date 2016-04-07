DROP FUNCTION ASU.GET_VIDOPLATY
/

--
-- GET_VIDOPLATY  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZIS (Table)
--   TPAC_INSURANCE (Table)
--   TAMBTALON (Table)
--   TAMBTALON_NAZ (Table)
--   TTYPEDOC (Table)
--   TINSURDOCS (Table)
--   IS_AMBULANCE (Function)
--   TKARTA (Table)
--
CREATE OR REPLACE FUNCTION ASU.get_vidoplaty (pPacid IN NUMBER) RETURN VARCHAR2 IS
-- Created 20070125 by Fomin A.
-- Функция возвращает вид оплаты по пациенту

   sTmp asu.ttypedoc.fc_name%type:='';

BEGIN
  select case asu.is_ambulance(pPacid) when 1 then
    (select max(td.fc_name) from
               ASU.tambtalon t, ASU.TINSURDOCS i, ASU.tambtalon_naz an, asu.ttypedoc td, asu.tnazis n
                WHERE  t.FK_INSURANCEID = i.FK_ID
                and an.FK_TALONID = t.FK_ID
                and td.fk_id=i.fk_typedocid
                and an.fk_nazid=n.fk_id
                and n.fk_pacid=pPacid
    )
  else
    ( select  max(td.fc_name)
        from asu.tkarta t, asu.tpac_insurance i, ASU.TINSURDOCS d, asu.ttypedoc td
        where i.fk_pacid=t.fk_id
        and i.fk_insurdocid=d.fk_id
        and td.fk_id=d.fk_typedocid
        and t.fk_id=pPacid
    )
  end as assa
  INTO sTmp
  from dual ;
 RETURN sTmp;
END;




-- End of DDL Script for Function ASU.GET_VIDOPLATY
/

SHOW ERRORS;


