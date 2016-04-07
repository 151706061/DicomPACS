CREATE OR REPLACE FUNCTION GET_ADR_BY_PEPLID_LEVEL_TOWN(PFK_PEPLID IN NUMBER, PFK_TYPE IN NUMBER DEFAULT asu.get_propiskaid)
  RETURN VARCHAR2 IS

  -- Функция возвращает адрес пациента, начиная с города.
  -- Входные данные PEPLID из таблицы TPEOPLES, можно воспользоваться функцией asu.pkg_regist_pacfunc.get_pepl_id(pFK_ID)
  -- Функция создана путем переделывания функции ASU.GET_ADR_BY_PEPLID_LEVEL_STREET
  -- Автор: Неронов А.С. Дата: 10.12.2010

  cRes VARCHAR2(500);
  pKladr NUMBER;
  sHouse VARCHAR2(20);
  sFlat VARCHAR2(20);
  sKorpus VARCHAR2(20);
  sStreetTown VARCHAR2(200);
  cursor cAdr is select max(fk_kladr) as fk_kladr, max(fc_house) as fc_house,  max(fc_kvartira) as fc_kvartira,  max(fc_korpus) as fc_korpus
                   from asu.tadress
                  where fk_pacid = pfk_peplid
                    and fk_type = pfk_type;
  cursor cStreetTown is select fc_prefix || '. ' || fc_name as fc_name
                                      from asu.tkladr
                                     where fl_del = 0
                                       and fn_level > 2
                                    connect by fk_id = prior fk_owner
                                    start with fk_id = pKladr
                                    order by fn_level;
BEGIN
  open cAdr;
  fetch cAdr into pKladr, sHouse, sFlat, sKorpus;
  if cAdr%rowcount > 0 then
    sStreetTown := '';
    for c in cStreetTown loop
      sStreetTown := sStreetTown || c.fc_name || ', ';
    end loop;
  end if;
  close cAdr;
  if sHouse is not null then
    sHouse := 'д. '||sHouse||' ';
  end if;
  if sKorpus is not null then
    sKorpus := 'корп. '||sKorpus||' ';
  end if;
  if sFlat is not null then
    sFlat := 'кв. '||sFlat||' ';
  end if;
  cRes := rtrim(sStreetTown)||' '||sHouse||sKorpus||sFlat;

  RETURN cRes;
END;
