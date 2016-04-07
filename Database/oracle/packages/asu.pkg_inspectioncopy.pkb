DROP PACKAGE BODY ASU.PKG_INSPECTIONCOPY
/

--
-- PKG_INSPECTIONCOPY  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_INSPECTIONCOPY" IS

  FUNCTION GET_IBVALUEBYID(pIBID Number) RETURN VARCHAR2 is
  CURSOR c_my_cursor IS
    select
      tr.fc_char,
      tr.fn_num,
      tr.fd_date,
      tr.fk_smid,
      tsr.fc_type
    from asu.tib tr
    left join asu.tsmid tsr on tsr.fk_id = tr.fk_smeditid
    where tr.fk_id = pIBID;

    vResult VARCHAR2(4000) := null;
    vValue VARCHAR2(4000) := null;
  BEGIN
    for c in c_my_cursor loop
      IF upper(c.fc_type) = 'EDIT' THEN
        vResult := c.fc_char;
      ELSIF upper(c.fc_type) = 'NUMBER' THEN
        vResult := to_char(c.fn_num);
      ELSIF upper(c.fc_type) = 'DATA' THEN
        vResult := to_char(c.fd_date, 'dd.mm.yyyy');
      ELSIF upper(c.fc_type) = 'COMBOBOX' THEN
        select t.fc_name into vResult from asu.tsmid t where t.fk_id = c.fk_smid;
      ELSE -- —читаетс€ что иначе это VARCHAR2 или что-то что к нему относитс€
        BEGIN
          select t.fc_name into vResult from asu.tsmid t where t.fk_id = c.fk_smid;
          if INSTR(vResult, '...') > 0 then
            BEGIN
              if c.fc_char is not null then
                vValue := c.fc_char;
              elsif c.fn_num is not null then
                vValue := to_char(c.fn_num);
              elsif c.fd_date is not null then
                vValue := to_char(c.fd_date, 'dd.mm.yyyy');
              end if;

              if vValue is not null then
                vResult := replace(vResult, '...', vValue);
              else
                vResult := null; -- Ќеобходимо чтобы отсеивать незаполненные пол€
              end if;
            END;
          end if;
        END;
      end if;
    end loop;

    RETURN vResult;
  END;

  /* ------------------------------------------------------------------------ */
  FUNCTION GET_IBNAMEBYID(pIBID Number) RETURN VARCHAR2 is
  CURSOR c_my_cursor IS
    select
      tr.fk_smid,
      tr.fk_smeditid,
      tsr.fc_type
    from asu.tib tr
    left join asu.tsmid tsr on tsr.fk_id = tr.fk_smeditid
    where tr.fk_id = pIBID;

    vResult asu.tsmid.fc_name%type := null;
  BEGIN
    for c in c_my_cursor loop
      if upper(c.fc_type) = 'COMBOBOX' THEN
        select t.fc_name into vResult from asu.tsmid t where t.fk_id = c.fk_smeditid;
      else
        select t.fc_name into vResult from asu.tsmid t where t.fk_id = c.fk_smid;
      end if;
    end loop;

    RETURN vResult;
  END;

  /* ------------------------------------------------------------------------ */
  FUNCTION GET_IBSMIDIDBYID(pIBID Number) RETURN NUMBER is
    CURSOR c_my_cursor IS
      select
        tr.fk_smid,
        tr.fk_smeditid,
        tsr.fc_type
      from asu.tib tr
      left join asu.tsmid tsr on tsr.fk_id = tr.fk_smeditid
      where tr.fk_id = pIBID;

    vResult NUMBER := null;
  BEGIN
    for c in c_my_cursor loop
      if upper(c.fc_type) = 'COMBOBOX' THEN
        vResult := c.fk_smeditid;
      else
        vResult := c.fk_smid;
      end if;
    end loop;

    RETURN vResult;
  END;

  /* ------------------------------------------------------------------------ */
  FUNCTION IsTSmidSameType(pTo Number, pFrom Number) RETURN NUMBER is
    vResult NUMBER := 0;
  begin
    select Count(distinct t.fc_type) into vResult from asu.tsmid t where t.fk_id in (pTo, pFrom);
    if vResult > 1 then
      vResult := 0;
    else
      vResult := 1;
    end if;

    return vResult;
  end;

  /* ------------------------------------------------------------------------ */
--  procedure INSERT_TMP_IN_SMID(pSmid Number) is
--  begin
--    insert into asu.T_TMP_INSPECTION_COPY_IN_SMID
--      (fk_smid)
--    values
--      (pSmid);
--  end;

  /* ------------------------------------------------------------------------ */
--  procedure INSERT_TMP_COPY_RESULT_VC2(pSmid Number, pPeopleID Number) is
--  begin
--    insert into asu.T_TMP_INSPECTION_COPY_RESULT
--    (
/*
      select -- ¬се пол€ кроме тех, владелец которых не представлен в таблице, о таких см. ниже.
        pSmid fk_to,
        T1.FK_ID fk_from, t1.FK_OWNER, asu.pkg_inspectioncopy.ValueOrName(t2.fc_value, T1.FC_NAME),
        t2.fc_value, t2.fd_run, t2.fk_vnaz_name, t2.fc_sotr_name,
        4 fn_type, 1 fl_check
      from
      ( -- ¬се ветки относ€щиес€ к полю типа varchar2
        SELECT T.FK_ID, T.FK_OWNER, T.FC_NAME
        FROM ASU.TSMID T
        where t.fl_del = 0
        connect by t.fk_id = prior t.fk_owner
        start with t.fk_id in
        (
          select
            t_tib.fk_smid
          from asu.tib t_tib
          inner join
          (-- ¬ыбор всех полей св€занных с полем типа varchar2
            SELECT T.FK_ID FROM ASU.TSMID T where t.fl_del = 0
            connect by prior t.fk_id = t.fk_owner start with t.fk_id  = pSmid
          ) tsr on tsr.FK_ID = t_tib.fk_smeditid
          where t_tib.fk_pacid = asu.pkg_inspectioncopy.GET_OLDES_VARCHAR2_PACID(pSmid, pPeopleID)
        )
      ) t1
      left join
      ( -- все значени€ полей относ€щиес€ к полю типа varchar2
        select
         max(pkg_inspectioncopy.get_ibvaluebyid(t_tib.fk_id)) fc_value, t_tib.fk_smid,
          tv.fk_smid fk_vnaz_smid, tv.fd_run, get_fullestpath(tv.fk_smid) fk_vnaz_name, login.get_sotrname(tv.fk_ispolid) fc_sotr_name
        from asu.tib t_tib
        inner join
        (-- ¬ыбор всех полей св€занных с полем типа varchar2
          SELECT T.FK_ID FROM ASU.TSMID T where t.fl_del = 0
          connect by prior t.fk_id = t.fk_owner start with t.fk_id  = pSmid
        ) tsr on tsr.fk_id = t_tib.fk_smeditid
        left join asu.vnaz tv on tv.fk_id = t_tib.fk_pacid
        where t_tib.fk_pacid = asu.pkg_inspectioncopy.GET_OLDES_VARCHAR2_PACID(pSmid, pPeopleID)
        group by t_tib.fk_smid, tv.fk_smid, tv.fd_run, get_fullestpath(tv.fk_smid), login.get_sotrname(tv.fk_ispolid)
      ) t2 on t2.fk_smid = t1.fk_id
      inner join
      ( -- Ќеобходимо чтобы отсечь всЄ что "выше" (в дереве smid) самого пол€ типа varchar2 и тех что св€заны с ним через tsmidcopyrules
        SELECT T.FK_ID
        FROM ASU.TSMID T
        where t.fl_del = 0
        connect by prior t.fk_id = t.fk_owner
        start with t.fk_id = pSmid
      ) t3 on t3.fk_id = t1.fk_id
      where t1.fk_owner in
      (
        select
          T1.FK_id
        from
        ( -- ¬се ветки относ€щиес€ к полю типа varchar2
          SELECT T.FK_ID, T.FK_OWNER, T.FC_NAME
          FROM ASU.TSMID T
          where t.fl_del = 0
          connect by t.fk_id = prior t.fk_owner
          start with t.fk_id in
          (
            select
              t_tib.fk_smid
            from asu.tib t_tib
            inner join
            (-- ¬ыбор всех полей св€занных с полем типа varchar2
              SELECT T.FK_ID FROM ASU.TSMID T where t.fl_del = 0
              connect by prior t.fk_id = t.fk_owner start with t.fk_id  = pSmid
            ) tsr on tsr.FK_ID = t_tib.fk_smeditid
            where t_tib.fk_pacid = asu.pkg_inspectioncopy.GET_OLDES_VARCHAR2_PACID(pSmid, pPeopleID)
          )
        ) t1
        inner join
        ( -- Ќеобходимо чтобы отсечь всЄ что "выше" (в дереве smid) самого пол€ типа varchar2 и тех что св€заны с ним через tsmidcopyrules
          SELECT T.FK_ID
          FROM ASU.TSMID T
          where t.fl_del = 0
          connect by prior t.fk_id = t.fk_owner
          start with t.fk_id  = pSmid
        ) t3 on t3.fk_id = t1.fk_id
      )
      group by
        T1.FK_ID, T1.FK_OWNER, T1.FC_NAME,
        t2.fc_value, t2.fk_vnaz_smid, t2.fd_run, t2.fk_vnaz_name,t2.fc_sotr_name

      union all

      select -- ƒл€ полей "верхнего уровн€" владелец которых не представлен в таблице владельцем будет заполн€емое поле типа varchar2
        pSmid fk_to,
        T1.FK_ID fk_from, pSmid FK_OWNER, T1.FC_NAME,
        t2.fc_value, t2.fd_run, t2.fk_vnaz_name,t2.fc_sotr_name,
        3 fn_type, 1 fl_check
      from
      ( -- ¬се ветки относ€щиес€ к полю типа varchar2
        SELECT T.FK_ID, T.FK_OWNER, T.FC_NAME
        FROM ASU.TSMID T
        where t.fl_del = 0
        connect by t.fk_id = prior t.fk_owner
        start with t.fk_id in
        (
          select
            t_tib.fk_smid
          from asu.tib t_tib
          inner join
          (-- ¬ыбор всех полей св€занных с полем типа varchar2
            SELECT T.FK_ID FROM ASU.TSMID T where t.fl_del = 0
            connect by prior t.fk_id = t.fk_owner start with t.fk_id = pSmid
          ) tsr on tsr.FK_ID = t_tib.fk_smeditid
          where t_tib.fk_pacid = asu.pkg_inspectioncopy.GET_OLDES_VARCHAR2_PACID(pSmid, pPeopleID)
        )
      ) t1
      left join
      ( -- все значени€ полей относ€щиес€ к полю типа varchar2
        select
         max(pkg_inspectioncopy.get_ibvaluebyid(t_tib.fk_id)) fc_value, t_tib.fk_smid,
          tv.fk_smid fk_vnaz_smid, tv.fd_run, get_fullestpath(tv.fk_smid) fk_vnaz_name, login.get_sotrname(tv.fk_ispolid) fc_sotr_name
        from asu.tib t_tib
        inner join
        (-- ¬ыбор всех полей св€занных с полем типа varchar2
          SELECT T.FK_ID FROM ASU.TSMID T where t.fl_del = 0
          connect by prior t.fk_id = t.fk_owner start with t.fk_id  = pSmid
        ) tsr on tsr.fk_id = t_tib.fk_smeditid
        left join asu.vnaz tv on tv.fk_id = t_tib.fk_pacid
        where t_tib.fk_pacid = asu.pkg_inspectioncopy.GET_OLDES_VARCHAR2_PACID(pSmid, pPeopleID)
        group by t_tib.fk_smid, tv.fk_smid, tv.fd_run, get_fullestpath(tv.fk_smid), login.get_sotrname(tv.fk_ispolid)
      ) t2 on t2.fk_smid = t1.fk_id
      inner join
      ( -- Ќеобходимо чтобы отсечь всЄ что "выше" (в дереве smid) самого пол€ типа varchar2 и тех что св€заны с ним через tsmidcopyrules
        SELECT T.FK_ID
        FROM ASU.TSMID T
        where t.fl_del = 0
        connect by prior t.fk_id = t.fk_owner
        start with t.fk_id = pSmid
      ) t3 on t3.fk_id = t1.fk_id
      where t1.fk_owner not in
      (
        select
          T1.FK_id
        from
        ( -- ¬се ветки относ€щиес€ к полю типа varchar2
          SELECT T.FK_ID, T.FK_OWNER, T.FC_NAME
          FROM ASU.TSMID T
          where t.fl_del = 0
          connect by t.fk_id = prior t.fk_owner
          start with t.fk_id in
          (
            select
              t_tib.fk_smid
            from asu.tib t_tib
            inner join
            (-- ¬ыбор всех полей св€занных с полем типа varchar2
              SELECT T.FK_ID FROM ASU.TSMID T where t.fl_del = 0
              connect by prior t.fk_id = t.fk_owner start with t.fk_id = pSmid
            ) tsr on tsr.FK_ID = t_tib.fk_smeditid
            where t_tib.fk_pacid = asu.pkg_inspectioncopy.GET_OLDES_VARCHAR2_PACID(pSmid, pPeopleID)
          )
        ) t1
        inner join
        ( -- Ќеобходимо чтобы отсечь всЄ что "выше" (в дереве smid) самого пол€ типа varchar2 и тех что св€заны с ним через tsmidcopyrules
          SELECT T.FK_ID
          FROM ASU.TSMID T
          where t.fl_del = 0
          connect by prior t.fk_id = t.fk_owner
          start with t.fk_id = pSmid
        ) t3 on t3.fk_id = t1.fk_id
      )
      group by
        T1.FK_ID, T1.FK_OWNER, T1.FC_NAME,
        t2.fc_value, t2.fk_vnaz_smid, t2.fd_run, t2.fk_vnaz_name,t2.fc_sotr_name;
*/
--    );
--  end;

  /* ------------------------------------------------------------------------ */
/*
  procedure INSERT_TMP_COPY_RESULT(pPeopleID Number) is
  begin
    insert into asu.T_TMP_INSPECTION_COPY_RESULT
    (
      select * from
      (
        with wt as
        (
        select
          t_smid_from.fc_type,
          t.fk_to,
          t.fk_smeditid fk_from,
          t.fk_id,
          t.fk_pacid
        from
        (
          select
            t_r.fk_to,
            t_tib.*
          from asu.tib t_tib
          right join
            (select t_r.fk_to, t_r.fk_from from asu.tsmidcopyrules t_r
            where t_r.fk_to in
            (
              select tt.fk_smid from asu.T_TMP_INSPECTION_COPY_IN_SMID tt inner join
              (select t.fk_id from tsmid t where (t.fc_type <> 'VARCHAR2' or t.fc_type is null)) ts on ts.fk_id = tt.fk_smid
            )
          ) t_r on t_r.fk_from = t_tib.fk_smeditid
          where
            t_tib.fk_pacid in
            ( select tk.fk_id from asu.tkarta tk where tk.fk_peplid = pPeopleID
              union all
              select tk.fk_id from asu.tambulance tk where tk.fk_peplid = pPeopleID
              union all
              select tv.fk_id from asu.vnaz tv where
              ( tv.fk_pacid in
                ( select tk.fk_id from asu.tkarta tk where tk.fk_peplid = pPeopleID
                  union all
                  select tk.fk_id from asu.tambulance tk where tk.fk_peplid = pPeopleID
                )
              )
            )

          union all

          select
            t_tib.fk_smeditid fk_to,
            t_tib.*
          from asu.tib t_tib
          where
            t_tib.fk_pacid in
            ( select tk.fk_id from asu.tkarta tk where tk.fk_peplid = pPeopleID
              union all
              select tk.fk_id from asu.tambulance tk where tk.fk_peplid = pPeopleID
              union all
              select tv.fk_id from asu.vnaz tv where
              ( tv.fk_pacid in
                ( select tk.fk_id from asu.tkarta tk where tk.fk_peplid = pPeopleID
                  union all
                  select tk.fk_id from asu.tambulance tk where tk.fk_peplid = pPeopleID
                )
              )
            )
            and t_tib.fk_smeditid in
            (
              select tt.fk_smid from asu.T_TMP_INSPECTION_COPY_IN_SMID tt inner join
              (select t.fk_id from tsmid t where (t.fc_type <> 'VARCHAR2' or t.fc_type is null)) ts on ts.fk_id = tt.fk_smid
            )

        ) t
        left join asu.tsmid t_smid_from on t_smid_from.fk_id = t.fk_smeditid
        left join asu.tsmid t_smid on t_smid.fk_id = t.fk_smid -- ƒл€ поиска значений комбобоксов
        where
          ( t_smid_from.fc_type = 'EDIT'
            and
            t.fc_char is not null )
          or
          ( t_smid_from.fc_type = 'NUMBER'
            and
            t.fn_num is not null )
          or
          ( t_smid_from.fc_type = 'DATA'
            and
            t.fd_date is not null )
          or
          ( t_smid_from.fc_type = 'COMBOBOX'
            and
            t_smid.fc_name is not null )
        group by
          t_smid_from.fc_type,
          t.fk_to,
          t.fk_smeditid,
          t.fk_id,
          t.fk_pacid
        )
        select -- значени€ полей, т.е. пол€ из которых производитс€ копирование
          t1.fk_to,
          max(t1.fk_from),
          t1.fk_to * t1.fk_to fk_owner,
          t1.fc_name,
          t1.fc_value,
          max(t1.fd_run),
          max(t1.fk_vnaz_name),
          max(t1.fc_sotr_name),
          t1.fn_type,
          1 fl_check
        from
        (
          select
            pkg_inspectioncopy.get_ibvaluebyid(t_wt.fk_id) fc_name,
            pkg_inspectioncopy.get_ibvaluebyid(t_wt.fk_id) fc_value,
            tv.fk_smid fk_vnaz_smid,
            tv.fd_run,
            get_fullestpath(tv.fk_smid) fk_vnaz_name,
            login.get_sotrname(tv.fk_ispolid) fc_sotr_name,
            t_wt.fc_type,
            t_wt.fk_to,
            t_wt.fk_from,
            2 fn_type,
            null fl_check
          from
            wt t_wt
            left join asu.vnaz tv on tv.fk_id = t_wt.fk_pacid
          where
          t_wt.fk_id in
          (
            select max(wt.fk_id) from wt
            group by wt.fk_to, wt.fk_from
          )

          union all

          select -- пол€ в которые производитс€ копирование
            t_smid.fc_name,
            null fc_value,
            null fk_vnaz_smid,
            null fd_run,
            null fk_vnaz_name,
            null fc_sotr_name,
            t_smid.fc_type,
            t_smid.fk_id fk_to,
            t_smid.fk_id * t_smid.fk_id fk_from,
            1 fn_type,
            1 fl_check
          from
            tsmid t_smid
          where
            t_smid.fk_id in
            (
              select tt.fk_smid from asu.T_TMP_INSPECTION_COPY_IN_SMID tt inner join
              (select t.fk_id from tsmid t where (t.fc_type <> 'VARCHAR2' or t.fc_type is null)) ts on ts.fk_id = tt.fk_smid
            )
            and
            t_smid.fk_id in
            (
             select
                t_wt.fk_to
              from
                wt t_wt
                left join asu.vnaz tv on tv.fk_id = t_wt.fk_pacid
              where
              t_wt.fk_id in
              (
                select max(wt.fk_id) from wt
                group by wt.fk_to, wt.fk_from
              )
            )
        ) t1
        group by t1.fk_to, t1.fk_to * t1.fk_to, t1.fc_name, t1.fc_value, t1.fn_type
      )
    );
  end;
*/
  /* ------------------------------------------------------------------------ */
/*
  procedure ADD_TMP_COPY_RESULT(pPeopleID Number) is
    CURSOR c_my_cursor IS
      select tt.fk_smid
      from asu.T_TMP_INSPECTION_COPY_IN_SMID tt inner join
      (select t.fk_id from tsmid t where (t.fc_type = 'VARCHAR2')) ts on ts.fk_id = tt.fk_smid;
  begin
    for c in c_my_cursor loop
      asu.pkg_inspectioncopy.INSERT_TMP_COPY_RESULT_VC2(c.fk_smid, pPeopleID);
    end loop;
    asu.pkg_inspectioncopy.INSERT_TMP_COPY_RESULT(pPeopleID);
  end;
*/
  /* ------------------------------------------------------------------------ */
  FUNCTION GET_OLDES_VARCHAR2_PACID(pSmid Number, pPeopleID Number) RETURN NUMBER is
    vResult NUMBER;
  begin
    select t_tib.fk_pacid into vResult from asu.tib t_tib where t_tib.fk_id =
    ( -- ¬ыбор наиболее позднего дл€ всех полей св€занных с полем типа varchar2 дл€ пациента
      select MAX(t_tib.fk_id) from asu.tib t_tib where t_tib.fk_smeditid in
      ( -- ¬ыбор всех полей св€занных с полем типа varchar2
        SELECT T.FK_ID FROM ASU.TSMID T where t.fl_del = 0
        connect by prior t.fk_id = t.fk_owner start with t.fk_id = pSmid
      ) and
      t_tib.fk_pacid in
      ( select tk.fk_id from asu.tkarta tk where tk.fk_peplid = pPeopleID
        union all
        select tk.fk_id from asu.tambulance tk where tk.fk_peplid = pPeopleID
        union all
        select tv.fk_id from asu.vnaz tv where tv.fk_pacid in
        ( select tk.fk_id from asu.tkarta tk where tk.fk_peplid = pPeopleID
          union all
          select tk.fk_id from asu.tambulance tk where tk.fk_peplid = pPeopleID
        )
      )
    );

    return vResult;
  end;

  /* ------------------------------------------------------------------------ */
  FUNCTION ValueOrName(pValue Varchar2, pName Varchar2) RETURN Varchar2 is
  begin
    if pValue is not null then
      return pValue;
    else
      return pName;
    end if;
  end;

end;
/

SHOW ERRORS;


