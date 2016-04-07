DROP PROCEDURE ASU.UPDATE_OBJECT
/

--
-- UPDATE_OBJECT  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBA_OBJECTS (Synonym)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   PARSE (Procedure)
--
CREATE OR REPLACE PROCEDURE ASU.update_object(clDDL CLOB, -- Скрипт, соотвтетсвующий объекту БД
                                          aObjectType varchar2, -- тип объекта БД, указывается так, как он указан в таблице dba_objects
                                          aOwner varchar2, -- владелец объекта, как он указан в таблице dba_objects
                                          aPkgName varchar2, -- название объекта, как оно указан в таблице dba_objects
                                          aStartStr varchar2, -- строка, отмечающая начало изменений, после этой строки начинается заменяемый блок
                                          aFinishStr varchar2, -- строка, отмечающая конец изменений, перед этой строкой заканчивается заменяемый блок
                                          aNewStr varchar2, -- строка, которая будет вставлена между aStartStr и aFinishStr, все, что было между aStartStr и aFinishStr прежде будет посточно закомментировано
                                          aCheckValid integer default 1 -- 1 - проверять объект на валидность, после изменения
                                         ) is
-- Efimov V.A. 20120306 Функция автоматического обновления объекта БД,
-- создана в связи с задачей http://192.168.1.9/redmine/issues/14672 для обновления stat.pkg_hant
-- Функция заменяет в скрипте, соответствующем объекту, блок который определяется двумя строками aStartStr и aFinishStr на блок aNewStr.
-- Определяется двумя строками aStartStr и aFinishStr означает что блок начинается после конца строки aStartStr и заканчивается перед началом aFinishStr
-- Заменяемый блок не удаляется, а построчно комментируется, пример вызова см. update_object_ext
  clTmp CLOB;
  IsValid INTEGER;

  vstart_len Integer;
  vfrom Integer;
  vto Integer;
  vfull_length Integer;

  CURSOR c IS SELECT '-- ' ||
                     SUBSTR(txt, INSTR(txt, CHR(10), 1, level) + 1, INSTR(txt, CHR(10), 1, level + 1) - INSTR(txt, CHR(10), 1, level) - 1) AS str -- к каждой строке прибавляется вначале символ построчного комментирования
                FROM (select substr(clDDL, vfrom + vstart_len, vto - vstart_len - vfrom) txt -- часть скрипта, между концом aStartStr и началом aFinishStr, т.е. та часть, что должна быть заменена на aNewStr
                        from dual)
             CONNECT BY level <= LENGTH(txt) - LENGTH(REPLACE(txt, CHR(10), '')) - 1;
BEGIN
  select Length(aStartStr) fn_start_len, -- длина строки, отмечающей начало изменений
         instr(clDDL, aStartStr) fn_from, -- позиция строка, отмечающей начало изменений, в скрипте, соответствующием объекту БД
         instr(clDDL, aFinishStr) fn_to, -- позиция строка, отмечающей конец изменений, в скрипте, соответствующием объекту БД
         Length(clDDL) fn_full_length -- длина скрипта, соответствующего объекту БД
    into vstart_len, vfrom, vto, vfull_length
    from dual;

  -- В clTmp сохраняется часть скрипта, соответствующего объекту БД, он его начала, до конча строки, отмечающей начало изменений (aStartStr)
  clTmp := substr(clDDL, 1, vfrom + vstart_len - 1);
  -- В clTmp добавляются построчно закомментированный блок между концом aStartStr и началом aFinishStr (т.е. комментируется та часть, что должна быть заменена на aNewStr)
  FOR p IN c LOOP
    if (trim(p.str) is not null) and (trim(p.str) <> ' ') then
      clTmp := clTmp || chr(10) || p.str;
    end if;
  END LOOP;

  -- Тут clTmp содержит часть скрипта clDDL, до начала aFinishStr. при этом блок, который должен быть заменён уже закомментирован
  -- К clTmp добавляется новый блок
  clTmp := clTmp || chr(10) || aNewStr;
  -- К clTmp добавляется часть clDDL от начала aFinishStr, до конча clDDL. в результате получаем скрипт clDDL в котором блок между aStartStr и aFinishStr была заменён на aNewStr
  clTmp := clTmp || chr(10) || substr(clDDL, vto, vfull_length - vto + 1);

  -- Объект заменяетс я вБД
  asu.parse(clTmp);

  -- Проверка объекта на валидность
  if aCheckValid = 1 then
    select decode(t.status, 'VALID', 1, 0)
      into IsValid
      from dba_objects t
     where t.owner = aOwner
       and t.object_name = aPkgName
       and t.object_type = aObjectType;

    if IsValid = 0 then
      begin
        asu.parse(clDDL);
      exception when others then
        raise_application_error (-20200,'Ошибка при изменении объекта ' || aOwner || '.' || aPkgName || ' типа ' || aObjectType || ' Не удалось вернуть исходную версию, требуется вмешательство разработчика!');
      end;

      raise_application_error (-20200,'Ошибка при изменении объекта ' || aOwner || '.' || aPkgName || ' типа ' || aObjectType || ' Изменения отменены, возвращена исходная версия');
    end if;
  end if;
END;
/

SHOW ERRORS;


