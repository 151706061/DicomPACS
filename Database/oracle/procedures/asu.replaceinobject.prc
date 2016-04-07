DROP PROCEDURE ASU.REPLACEINOBJECT
/

--
-- REPLACEINOBJECT  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBA_OBJECTS (Synonym)
--   DUAL (Synonym)
--   DBMS_STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   PARSE (Procedure)
--   GET_DDL (Function)
--
CREATE OR REPLACE PROCEDURE ASU.ReplaceInObject(aObjectType varchar2, -- тип объекта БД, указывается так, как он указан в таблице dba_objects
                                                aOwner varchar2, -- владелец объекта, как он указан в таблице dba_objects
                                                aObjectName varchar2, -- название объекта, как оно указан в таблице dba_objects
                                                aOldStr varchar2, -- строка, которую необходимо заменить
                                                aNewStr varchar2, -- строка, на которую будет заменан aOldStr
                                                aCommentStr varchar2  default '', -- если эта строка не пустая, то в строку, перед той, для которой будет произведена замена будет вставлен комменатрий aCommentStr
                                                aCheckRepeat integer default 0,-- 1 - если строка в которой есть aOldStr уже включает в себя aNewStr, то замены не будет, 2 - если aNewStr уже встречается в DDL объекта, то замены не будет
                                                aCheckValid integer default 1 -- 1 - проверять объект на валидность, после изменения
                                               ) is
-- Efimov V.A. 20120625 Функция автоматического обновления объекта БД,
-- создана в связи с задачей http://192.168.1.9/redmine/issues/18985 для обновления STAT.GET_REPORT_066_U_02
-- Функция заменяет в скрипте, строку aOldStr на aNewStr.
-- Пример импользования:
/*
BEGIN
  asu.ReplaceInObject('FUNCTION',
                      'STAT',
                      'GET_REPORT_066_U_02',
                      '''ABORT''',
                      '''ABORT'', ''UROLOG_OPER''',
                      'Efimov V.A. 20120625 http://192.168.1.9/redmine/issues/18985 Строка ниже автоматически изменена с помощью asu.ReplaceInObject',
                      1,
                      1);
end;
*/
  clDDL CLOB;
  clTmp CLOB;
  IsValid INTEGER;
  IsRepeat INTEGER;

  CURSOR c IS SELECT SUBSTR(txt, INSTR(txt, CHR(10), 1, level) + 1, INSTR(txt, CHR(10), 1, level + 1) - INSTR(txt, CHR(10), 1, level) - 1) AS str -- к каждой строке прибавляется вначале символ построчного комментирования
                FROM (select clDDL || chr(10) txt  from dual)
             CONNECT BY level <= LENGTH(txt) - LENGTH(REPLACE(txt, CHR(10), '')) - 1;
BEGIN
  clDDL := asu.GET_DDL(aObjectType, aOwner, aObjectName);

  IsRepeat := 0;
  if aCheckRepeat = 2 then
    if nvl(INSTR(clDDL, aNewStr), 0) > 0 then
      IsRepeat := 1;
    end if;
  end if;

  if IsRepeat = 0 then
    clTmp := '';
    FOR p IN c LOOP
      if (nvl(INSTR(p.str, aOldStr), 0) = 0) or (aCheckRepeat = 1 and nvl(INSTR(p.str, aNewStr), 0) > 0) then
        clTmp := clTmp || chr(10) || p.str;
      else
        if aCommentStr is null then
          clTmp := clTmp || chr(10) || Replace(p.str, aOldStr, aNewStr);
        else
            clTmp := clTmp || chr(10) || '-- ' || aCommentStr || chr(10) || Replace(p.str, aOldStr, aNewStr);
        end if;
      end if;
    END LOOP;

    -- Объект заменяется в БД
    asu.parse(clTmp);

    -- Проверка объекта на валидность
    if aCheckValid = 1 then
      select decode(t.status, 'VALID', 1, 0)
        into IsValid
        from dba_objects t
       where t.owner = aOwner
         and t.object_name = aObjectName
         and t.object_type = aObjectType;

      if IsValid = 0 then
        begin
          asu.parse(clDDL);
        exception when others then
          raise_application_error (-20200,'Ошибка при изменении объекта ' || aOwner || '.' || aObjectName || ' типа ' || aObjectType || ' Не удалось вернуть исходную версию, требуется вмешательство разработчика!');
        end;

        raise_application_error (-20200,'Ошибка при изменении объекта ' || aOwner || '.' || aObjectName || ' типа ' || aObjectType || ' Изменения отменены, возвращена исходная версия');
      end if;
    end if;
  end if;
END;
/

SHOW ERRORS;


