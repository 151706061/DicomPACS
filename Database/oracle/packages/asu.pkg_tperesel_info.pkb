DROP PACKAGE BODY ASU.PKG_TPERESEL_INFO
/

--
-- PKG_TPERESEL_INFO  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU.PKG_TPERESEL_INFO IS
---------------------------------------------------------------------------------------------------------
Function GetINFO_BY_PERESEL(pFK_PERESEL in number, pFL_IN_INTERIM in number) return number is
  Res number := 0;
  cursor DoesExists is select count(1) from ASU.TPERESEL_INFO t where t.Fk_Peresel = pFK_PERESEL and t.fl_in_interim = pFL_IN_INTERIM;
Begin
  OPEN DoesExists; FETCH DoesExists into Res; CLOSE DoesExists; return Res;
End;
---------------------------------------------------------------------------------------------------------
procedure SetFK_TRANSFSOTR(pFK_PERESEL in number, pFK_TRANSFSOTR in number, pFL_IN_INTERIM in number) is
Begin
  IF GetINFO_BY_PERESEL(pFK_PERESEL, pFL_IN_INTERIM) = 0 then
    INSERT INTO ASU.TPERESEL_INFO(FK_PERESEL, FK_TRANSFSOTR, FL_IN_INTERIM)
    values(pFK_PERESEL, pFK_TRANSFSOTR, pFL_IN_INTERIM);
  else
    UPDATE ASU.TPERESEL_INFO
       SET FK_TRANSFSOTR = pFK_TRANSFSOTR
     where FK_PERESEL = pFK_PERESEL
       and FL_IN_INTERIM = pFL_IN_INTERIM;
  end if;
End;
---------------------------------------------------------------------------------------------------------
function GetFK_TRANSFSOTR(pFK_PERESEL in number) return number is
  pFK_TRANSFSOTR number;
  cursor C is Select nvl(max(t.FK_TRANSFSOTR), -1)
                from ASU.TPERESEL_INFO t
               where t.Fk_Peresel = pFK_PERESEL;
Begin
  pFK_TRANSFSOTR := 0;
  OPEN C;
  FETCH C INTO pFK_TRANSFSOTR;
  CLOSE C;
  return pFK_TRANSFSOTR;
End;

---------------------------------------------------------------------------------------------------------
Function GetINFO_BY_PERESEL_I(pFK_PERESEL_INTERIM in number) return number is
  Res number := 0;
  cursor DoesExists is select count(1) from ASU.TPERESEL_INTERIM_INFO t where t.Fk_PERESEL_INTERIM = pFK_PERESEL_INTERIM;
Begin
  OPEN DoesExists; FETCH DoesExists into Res; CLOSE DoesExists; return Res;
End;
---------------------------------------------------------------------------------------------------------
procedure SetFK_TRANSFSOTR_I(pFK_PERESEL_INTERIM in number, pFK_TRANSFSOTR in number) is
Begin
  IF GetINFO_BY_PERESEL_I(pFK_PERESEL_INTERIM) = 0 then
    INSERT INTO ASU.TPERESEL_INTERIM_INFO(FK_PERESEL_INTERIM, FK_TRANSFSOTR)
    values(pFK_PERESEL_INTERIM, pFK_TRANSFSOTR);
  else
    UPDATE ASU.TPERESEL_INTERIM_INFO
       SET FK_TRANSFSOTR = pFK_TRANSFSOTR
     where FK_PERESEL_INTERIM = pFK_PERESEL_INTERIM;
  end if;
End;
---------------------------------------------------------------------------------------------------------
function GetFK_TRANSFSOTR_I(pFK_PERESEL_INTERIM in number) return number is
  pFK_TRANSFSOTR number;
  cursor C is Select nvl(max(t.FK_TRANSFSOTR), -1)
                from ASU.TPERESEL_INTERIM_INFO t
               where t.Fk_PERESEL_INTERIM = pFK_PERESEL_INTERIM;
Begin
  pFK_TRANSFSOTR := 0;
  OPEN C;
  FETCH C INTO pFK_TRANSFSOTR;
  CLOSE C;
  return pFK_TRANSFSOTR;
End;

---------------------------------------------------------------------------------------------------------
-- pIS_INTERIM = 1, значит pFK_ID это TPERESEL_INTERIM.FK_ID, иначе TPERESEL.FK_ID
procedure SetPrevFK_TRANSFSOTR(pFK_ID in number, pIS_INTERIM in number, pFK_TRANSFSOTR in number) is
  vPacId number;
  vfk_prev number;
  vfl_prev_interim number;
Begin
  if pIS_INTERIM = 1 then
    select Max(fk_pacid) into vPacId from asu.tperesel_interim where fk_id = pFK_ID;
  else
    select Max(fk_pacid) into vPacId from asu.tperesel where fk_id = pFK_ID;
  end if;

  select max(fk_prev), max(fl_prev_interim)
    into vfk_prev, vfl_prev_interim
    from (select t.fk_id,
                 t.fl_interim,
                 lag(t.fk_id, 1, -1) over(partition by t.fk_pacid order by t.fd_data1, t.fk_srokid, t.fk_id) fk_prev,
                 lag(t.fl_interim, 1, -1) over(partition by t.fk_pacid order by t.fd_data1, t.fk_srokid, t.fk_id) fl_prev_interim
            from (select t.fk_id,
                         0 fl_interim,
                         t.fk_id fk_pereselid,
                         t.fd_data1,
                         t.fk_srokid,
                         t.fk_pacid
                    from asu.tperesel t
                   where t.fk_pacid = vPacId
                  union
                  select ti.fk_id,
                         1 fl_interim,
                         ti.fk_pereselid,
                         ti.fd_data1,
                         t.fk_srokid,
                         ti.fk_pacid
                    from asu.tperesel_interim ti
                   inner join asu.tperesel t on t.fk_id = ti.fk_pereselid
                   where ti.fk_pacid = vPacId
                     and (pIS_INTERIM = 1 or
                         (pIS_INTERIM = 0 and ti.FL_LEAVE = 0))) t) -- при переводе в основное (pIS_INTERIM = 0) должны рассматриваться только не закрытые
   where fk_id = pFK_ID
     and fl_interim = pIS_INTERIM;

  if vfl_prev_interim = 1 then
    SetFK_TRANSFSOTR_I(vfk_prev, pFK_TRANSFSOTR);
  else
    SetFK_TRANSFSOTR(vfk_prev, pFK_TRANSFSOTR, pIS_INTERIM);
  end if;
End;

---------------------------------------------------------------------------------------------------------
procedure SetLastFK_TRANSFSOTR(pFK_PACID in number, pFK_TRANSFSOTR in number) is
  vfk_last number;
  vfl_last_interim number;
Begin
  select max(fk_last), max(fk_last_interim)
    into vfk_last, vfl_last_interim
    from (select t.fk_id,
                 t.fl_interim,
                 LAST_VALUE(t.fk_id) OVER(PARTITION BY t.fk_pacid ORDER BY t.fd_data1, t.fk_srokid, t.fk_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fk_last,
                 LAST_VALUE(t.fl_interim) OVER(PARTITION BY t.fk_pacid ORDER BY t.fd_data1, t.fk_srokid, t.fk_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) fk_last_interim
            from (select t.fk_id,
                         0 fl_interim,
                         t.fk_id fk_pereselid,
                         t.fd_data1,
                         t.fk_srokid,
                         t.fk_pacid
                    from asu.tperesel t
                   where t.fk_pacid = pFK_PACID
                  union
                  select ti.fk_id,
                         1 fl_interim,
                         ti.fk_pereselid,
                         ti.fd_data1,
                         t.fk_srokid,
                         ti.fk_pacid
                    from asu.tperesel_interim ti
                   inner join asu.tperesel t on t.fk_id = ti.fk_pereselid
                   where ti.fk_pacid = pFK_PACID
                     and ti.FL_LEAVE = 0) t)
   where rownum = 1;

  if vfl_last_interim = 1 then
    SetFK_TRANSFSOTR_I(vfk_last, pFK_TRANSFSOTR);
  else
    SetFK_TRANSFSOTR(vfk_last, pFK_TRANSFSOTR, 0);
  end if;
End;

END;
/

SHOW ERRORS;


