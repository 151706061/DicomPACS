DROP FUNCTION ASU.GET_REANIM_BASE_PERESEL
/

--
-- GET_REANIM_BASE_PERESEL  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TROOM (Table)
--   TTIPROOM (Table)
--   TPERESEL (Table)
--
CREATE OR REPLACE FUNCTION ASU.GET_REANIM_BASE_PERESEL(ppereselid IN NUMBER)
-- Efimov V.A. 20111226 Для отделений реанимации функция возвращает профиль койки базового отделения
  RETURN NUMBER IS
  vresult number;
  CURSOR c IS
    select t.fk_id, t.fc_synonim, t.fk_koykavidid
      from (SELECT p.fk_id,
                   lag(p.FD_DATA1, 1, NULL) over(ORDER BY p.fd_data1, p.fk_id) DATE_1,
                   tt.fc_synonim,
                   p.fk_koykavidid,
                   row_number() over(ORDER BY p.fd_data1, p.fk_id) - 1 N_MOVE
              FROM (select tp.fk_pacid, tp.fd_data1
                      from asu.tperesel tp
                     where tp.fk_id = ppereselid) tp
             inner join asu.tperesel p on p.fk_pacid = tp.fk_pacid
             inner join asu.troom r on r.fk_id = p.fk_palataid
              left join asu.ttiproom tt on tt.fk_id = p.fk_koykavidid
             WHERE p.fd_data1 <= tp.fd_data1
               AND p.fk_id <> ppereselid
             ORDER BY p.fd_data1, p.fk_id) t
     order by t.n_move DESC;
BEGIN
  FOR p IN c LOOP
    if (p.fc_synonim is null) or (p.fc_synonim <> 'FC_REANIM') then
      vresult := p.fk_id;
      EXIT;
    end if;
  END LOOP;

  RETURN vresult;
END GET_REANIM_BASE_PERESEL;
/

SHOW ERRORS;


