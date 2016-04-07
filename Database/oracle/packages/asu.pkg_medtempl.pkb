DROP PACKAGE BODY ASU.PKG_MEDTEMPL
/

--
-- PKG_MEDTEMPL  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_MEDTEMPL"
/*
 * Предназначен для экспорта/импорта медикаментозных назначений
 * в шаблоны и из шаблонов соответственно.
 */
is
	/*
	 * Экспортирует медикаментозное назначение в
	 * указанный шаблон.
	 *
	 * @param p_templid
	 *  идентификатор шаблона
	 * @param p_nazid
	 *  идентификатор назначения
	 */
	procedure prescr_save(p_templid integer, p_nazid integer)
	is
		l_mednaz integer;
	begin
		-- Сохраняем назначение
		insert into tnazwizzard_mednaz(
			fk_template,
			fk_vvodpath,
			fk_frequency,
			fn_duration,
			fc_remark
		)
		select
			p_templid,
			nm.fk_vvodpathid,
			nm.fk_frequencyid,
			nm.fn_duration,
			nm.fc_remark
		from tnazmed nm
		where nm.fk_id = p_nazid;
		if sql%rowcount > 0 then
			-- Сохраняем параметры назначения
			select seq_nazwizzard_mednaz.currval into l_mednaz from dual;
			insert into tnazwizzard_medpar(
				fk_nazwizzard_mednaz,
				fk_medic,
				fk_dozunit,
				fk_kolunit,
				fn_doza,
				fn_kol,
				fc_remark
			)
			select
				l_mednaz,
				nml.fk_medicid,
				nml.fk_dozunits,
				nml.FK_KOLUNITS,
				nml.fn_doza,
				nml.fn_kol,
				nml.fc_remark
			from tnazmedlech nml
			where nml.fk_nazmedid = p_nazid;
		end if;
	end;

	/*
	 * Импортирует медикаментозное назначение
	 * из указанного шаблона.
	 *
	 * @param p_pacid
	 *  идентификатор пациента
	 * @param p_templid
	 *  идентификатор шаблона
	 * @param p_sotrid
	 *  идентификатор сотрудника создающего назначение
	 * @param p_osmotrid
	 *  идентификатор осмотра
	 */
	procedure prescr_load(
		p_pacid integer,
		p_templid integer,
		p_sotrid integer,
		p_osmotrid integer
	)
	is
		cursor c_mednaz(p_templid integer)
		is
			select
				nwm.fk_vvodpath,
				nwm.fn_duration,
				nwm.fk_frequency,
				nwm.fc_remark
			from tnazwizzard_mednaz nwm
			where nwm.fk_template = p_templid;

		l_mednaz integer;
	begin
		for i in c_mednaz(p_templid) loop
			insert into tnazmed(
				fk_pacid,
				fk_vrachid,
				fk_vvodpathid,
				fd_begin,
				fn_duration,
				fk_frequencyid,
				fc_remark,
				fk_osmotrid
			)
			values (
				p_pacid,
				p_sotrid,
				i.fk_vvodpath,
				trunc(sysdate),
				i.fn_duration,
				i.fk_frequency,
				i.fc_remark,
				p_osmotrid
			)
			returning fk_id into l_mednaz;
			if sql%rowcount > 0 then
				-- Извлекаем параметры назначения
				insert into tnazmedlech(
					fk_nazmedid,
					fn_doza,
					fk_medicid,
					fc_remark,
					fk_dozunits,
					fk_kolunits,
					fn_kol
				)
				select
					l_mednaz,
					nwp.fn_doza,
					nwp.fk_medic,
					nwp.fc_remark,
					nwp.fk_dozunit,
					nwp.fk_kolunit,
					nwp.fn_kol
				from tnazwizzard_medpar nwp
				where nwp.fk_nazwizzard_mednaz in (
					select fk_id
					from tnazwizzard_mednaz
					where fk_template = p_templid
				);
			end if;
		end loop;
	end;

	/*
	 * Импортирует медикаментозное назначение - одно назначение
	 * из указанного шаблона.
	 *
	 * @param p_pacid
	 *  идентификатор пациента
	 * @param p_templid
	 *  идентификатор шаблона
	 * @param p_sotrid
	 *  идентификатор сотрудника создающего назначение
	 * @param p_osmotrid
	 *  идентификатор осмотра
	 */
	procedure prescr_load_naz(
		p_pacid integer,
		p_nazid integer,
		p_sotrid integer,
		p_osmotrid INTEGER,
    p_check_ost INTEGER DEFAULT 0,
    p_result OUT VARCHAR2
	)
	is
		cursor c_mednaz(p_nazid integer)
		is
			select
				nwm.fk_vvodpath,
				nwm.fn_duration,
				nwm.fk_frequency,
				nwm.fc_remark
			from tnazwizzard_mednaz nwm
			where nwm.fk_id = p_nazid;
      
    CURSOR c_not_will_added
    IS
      SELECT pkg_medtempl.prescr_fullname(NWP.FK_ID,0,1) FC_NAME, NVL(NWP.FN_KOL,0) FN_KOL, -1*(NVL(VKO.FN_KOLOST,0) - NVL(NWP.FN_KOL,0)) FN_KOLOST
        FROM TNAZWIZZARD_MEDPAR NWP,
             (SELECT MEDICID, SUM(FN_KOLOST) FN_KOLOST FROM MED.VMEDKART_KOLOST GROUP BY MEDICID) VKO
       WHERE NWP.FK_NAZWIZZARD_MEDNAZ = p_nazid
         AND NWP.FK_MEDIC = VKO.MEDICID (+)
         AND (((NVL(VKO.FN_KOLOST,0) - NVL(NWP.FN_KOL,0)) < 0) OR (NVL(NWP.FN_KOL,0) = 0));

		l_mednaz integer;
    pMO NUMBER;
    cnt_rec  NUMBER; --Кол-во медикаментов в назначении
    cnt_fail NUMBER; --Кол-во позиций, которые не добавляем
	BEGIN
    ------------------------------------------------------------
    -- Добавил проверку на наличие медикаментов в остатках    --
    -- Если нет на остатках, то не медикамент не добавляется  --
    -- в назначение                                           --
    -- Added by Neronov A.S. 31.01.2012                       --
    ------------------------------------------------------------
    IF p_check_ost = 1 THEN  -- Проверяем на наличие остатков
      -- Возвращаем список тех медикаментов, которых нет в наличии
      SELECT NVL(MAX(MOID),-1) INTO pMO FROM MED.TMO T WHERE T.FK_SOTRID = p_sotrid;
      MED.PKG_MEDSES.set_curmo(pMO);
      MED.PKG_MEDSES.ResetDatePeriod;
      p_result := '';
      cnt_fail := 0;
      
      FOR c IN c_not_will_added LOOP
        p_result := p_result || c.fc_name || ' Кол-во: ' || to_char(c.fn_kol) || ' (остаток ' || to_char(c.fn_kolost) || ')' || chr(10);
        cnt_fail := cnt_fail + 1; --Считаем кол-во медикаментов-неудачников
      END LOOP;
      p_result := substr(p_result,1,length(p_result)-1);
      IF cnt_fail > 0 THEN
        p_result := 'Следующих медикаментов не хватает на остатках:' || chr(10) || chr(10) || p_result;
      END IF;
      
      SELECT COUNT(*) INTO cnt_rec FROM TNAZWIZZARD_MEDPAR WHERE FK_NAZWIZZARD_MEDNAZ = p_nazid;
      
      IF cnt_fail <> cnt_rec THEN
        for i in c_mednaz(p_nazid) loop
          insert into tnazmed(
            fk_pacid,
            fk_vrachid,
            fk_vvodpathid,
            fd_begin,
            fn_duration,
            fk_frequencyid,
            fc_remark,
            fk_osmotrid
          )
          values (
            p_pacid,
            p_sotrid,
            i.fk_vvodpath,
            trunc(sysdate),
            i.fn_duration,
            i.fk_frequency,
            i.fc_remark,
            p_osmotrid
          )
          returning fk_id into l_mednaz;
          if sql%rowcount > 0 then
            -- Извлекаем параметры назначения
            insert into tnazmedlech(
              fk_nazmedid,
              fn_doza,
              fk_medicid,
              fc_remark,
              fk_dozunits,
              fk_kolunits,
              fn_kol
            )
            select
              l_mednaz,
              nwp.fn_doza,
              nwp.fk_medic,
              nwp.fc_remark,
              nwp.fk_dozunit,
              nwp.fk_kolunit,
              nwp.fn_kol
            from tnazwizzard_medpar nwp LEFT JOIN
                 (SELECT MEDICID, SUM(FN_KOLOST) FN_KOLOST FROM MED.VMEDKART_KOLOST GROUP BY MEDICID) VKO --Added
                 ON NWP.FK_MEDIC = VKO.MEDICID                                                            --Added
            where nwp.fk_nazwizzard_mednaz = p_nazid
              AND NOT (((NVL(VKO.FN_KOLOST,0) - NVL(NWP.FN_KOL,0)) < 0) OR (NVL(NWP.FN_KOL,0) = 0));      --Added
          end if;
        end loop;
      END IF; --IF cnt_fail <> cnt_rec
    ELSE -- По старой схеме (без проверки на наличие в остатках)
      for i in c_mednaz(p_nazid) loop
        insert into tnazmed(
          fk_pacid,
          fk_vrachid,
          fk_vvodpathid,
          fd_begin,
          fn_duration,
          fk_frequencyid,
          fc_remark,
          fk_osmotrid
        )
        values (
          p_pacid,
          p_sotrid,
          i.fk_vvodpath,
          trunc(sysdate),
          i.fn_duration,
          i.fk_frequency,
          i.fc_remark,
          p_osmotrid
        )
        returning fk_id into l_mednaz;
        if sql%rowcount > 0 then
          -- Извлекаем параметры назначения
          insert into tnazmedlech(
            fk_nazmedid,
            fn_doza,
            fk_medicid,
            fc_remark,
            fk_dozunits,
            fk_kolunits,
            fn_kol
          )
          select
            l_mednaz,
            nwp.fn_doza,
            nwp.fk_medic,
            nwp.fc_remark,
            nwp.fk_dozunit,
            nwp.fk_kolunit,
            nwp.fn_kol
          from tnazwizzard_medpar nwp
          where nwp.fk_nazwizzard_mednaz = p_nazid;
        end if;
      end loop;
    END IF;
	end;


	/*
	 * Удаляет данные о назначении.
	 *
	 * @param p_templid
	 *  идентификатор шаблона
	 */
	procedure prescr_remove(p_templid integer)
	is
	begin
		delete from tnazwizzard_mednaz nwm where nwm.fk_template = p_templid;
		-- Из tnazwizzard_medpar записи удалятся автоматически
	end;

	/*
	 * Выводит полное наименование назначения.
	 *
	 * @param p_id
	 *	идентификатор, значение которого зависит от p_is_nazparid
	 * @param p_show_daydoze
	 *  флаг, 0/1 - скрыть/показать суточную дозу
	 *  по-умолчанию 1.
	 * @param p_is_nazparid
	 *  флаг, 0/1 - если равен 0 тогда значение
	 *  p_id интерпретируется как идентификатор назначения, если равен 1,
	 *  то как идентификатор параметра назначения. По-умолчанию 0.
	 * @return
	 *  Наименование назначения.
	 */
	function prescr_fullname(
		p_id integer,
		p_show_daydoze integer,
		p_is_nazparid integer
	) return varchar2
	is
		cursor c_nazmed(p_nazid integer, p_daydoze integer)
		is
			select
--				initcap(e.fc_name)
--					|| decode(e.fc_name,'','','. ')
--					||
                     initcap(m.fc_name) || ' '
--					|| decode(m.fn_mass, 0, '', m.fn_mass || ' '|| u2.fc_shortname) || ' по '
					|| DECODE(NVL(l.fn_doza,0), 0, '', to_char(l.fn_doza, 'fm999g990d099', 'nls_numeric_characters = ''. '''))
					|| DECODE(u.fc_shortname, null, '', ' Ед.изм. '|| u.fc_shortname)
                    || DECODE(NVL(l.fn_kol,0), 0, '', ' Кол-во: '||to_char(l.fn_kol, 'fm999g999g990d099999', 'nls_numeric_characters = ''. '''))
                    || DECODE(u2.fc_shortname, null, '', ' Ед.изм. '|| u2.fc_shortname)||' '
--					|| e.fc_name || ') '
					|| f.fc_name || '. '
					|| n.fc_remark
					|| decode(p_daydoze, 0, '', 1, chr(10)
                    || decode(NVL(f.fn_mnog * l.fn_doza,0),0, '', ' Суточная доза ' || to_char(f.fn_mnog * l.fn_doza,'fm999g999g990d099999', 'nls_numeric_characters = ''. ''') || ' ' || u.fc_shortname || '.'))
				as fc_mednaz
			from
				tnazwizzard_mednaz n,
				tnazwizzard_medpar l,
                MED.TLATIN_NAMES M,
--				med.tmedic m,
--				med.tei e,
				med.tmassunits u,
				tfrequency f,
				med.tmassunits u2,
				tvvodpath v
			where n.fk_id = l.fk_nazwizzard_mednaz
--				and l.fk_medic = m.medicid
				and l.fk_medic = m.FK_ID
--				and e.eiid(+) = m.fk_fpackid
				and l.fk_dozunit = u.fk_id(+)
				and n.fk_frequency = f.fk_id
				and l.fk_kolunit = u2.fk_id(+)
				and n.fk_vvodpath = v.fk_id
				and n.fk_id = p_nazid
			order by m.fc_name;

		cursor c_nazmedpar(p_nazparid integer, p_daydoze integer)
		is
			select
--				initcap(e.fc_name)
--					|| decode(e.fc_name, '', '', '. ')
--					||
                     initcap(m.fc_name) || ' '
--					|| decode(m.fn_mass, 0, '', m.fn_mass || --' ' || u2.fc_shortname) ||
--                     ' по '
					|| DECODE(NVL(l.fn_doza,0), 0, '', ' Доза: '||to_char(l.fn_doza, 'fm999g990d099', 'nls_numeric_characters = ''. '''))
					|| DECODE(u.fc_shortname, null, '', ' Ед.изм. '||u.fc_shortname)
                    || DECODE(NVL(l.fn_kol,0), 0, '', ' Кол-во: '||to_char(l.fn_kol, 'fm999g999g990d099999', 'nls_numeric_characters = ''. '''))
                    || DECODE(u2.fc_shortname, null, '', ' Ед.изм. '||u2.fc_shortname)||' '
--					|| e.fc_name || ') '
					|| ' '||f.fc_name || '. '
					|| ' ' ||n.fc_remark
					|| decode(p_daydoze, 0, '', 1, chr(10)
                    || decode(NVL(f.fn_mnog * l.fn_doza,0),0, '', ' Суточная доза: ' || to_char(f.fn_mnog * l.fn_doza, 'fm999g999g990d099999', 'nls_numeric_characters = ''. ''') || ' ' || u.fc_shortname || '.'))
				as fc_mednaz
			from
				tnazwizzard_mednaz n,
				tnazwizzard_medpar l,
--				med.tmedic m,
                MED.TLATIN_NAMES M,
--				med.tei e,
				med.tmassunits u,
				tfrequency f,
				med.tmassunits u2,
				tvvodpath v
			where n.fk_id = l.fk_nazwizzard_mednaz
--				and l.fk_medic = m.medicid
				and l.fk_medic = m.FK_ID
--				and e.eiid(+) = m.fk_fpackid
				and l.fk_dozunit = u.fk_id(+)
				and n.fk_frequency = f.fk_id
				and l.fk_kolunit = u2.fk_id(+)
				and n.fk_vvodpath = v.fk_id
				and l.fk_id = p_nazparid
			order by m.fc_name;

		vcname varchar2(1000);
		res    varchar2(2000);
	begin
		if p_is_nazparid = 0 then
			open c_nazmed(p_id, p_show_daydoze);
			loop
				fetch c_nazmed into vcname;
				exit when c_nazmed%notfound;
				res := res || vcname || ';' ||chr(10);
			end loop;
			close c_nazmed;
			res := substr(res,0,length(res) - 2);
		elsif p_is_nazparid = 1 then
			open c_nazmedpar(p_id, p_show_daydoze);
			fetch c_nazmedpar into res;
			close c_nazmedpar;
		end if;
		return res;
	end;
end;
/

SHOW ERRORS;


