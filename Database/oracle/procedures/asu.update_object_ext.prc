DROP PROCEDURE ASU.UPDATE_OBJECT_EXT
/

--
-- UPDATE_OBJECT_EXT  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   DBMS_SQL (Synonym)
--   PARSE (Procedure)
--   UPDATE_OBJECT (Procedure)
--
CREATE OR REPLACE PROCEDURE ASU.update_object_ext(aObjectType varchar2,
                                              aOwner      varchar2,
                                              aPkgName    varchar2,
                                              aStartStr   varchar2,
                                              aFinishStr  varchar2,
                                              aNewStr     varchar2,
                                              aCheckValid integer default 1) is
-- Efimov V.A. 20120306 Расширенная версия asu.update_object, которая опзволяет получить DDL объекта, под правами его владельца
-- Подробнее см. комментарии к asu.update_object,
/*
Пример работы, изменяется пакет STAT.PKG_HANT

было:
CREATE OR REPLACE PACKAGE BODY STAT."PKG_HANT"
...
--25. Листок Нетрудоспособности: открыт_ _._ _._ _ _ _ _закрыт: _ _._ _._ _ _ _ _
  sHtml:=sHtml||'<tr><td colspan="14"  rowspan="1"  class="WhiteALLNOn" >25. Листок нетрудоспособности:';
  sTmp:=' ';
  FOR C IN(SELECT ROWNUM rn,F.FC_SERIES ||' '||F.FC_NUMBER sn,TO_CHAR(asu.get_sl_begin(I.FK_ID),'DD.MM.YYYY') dBeg,TO_CHAR(asu.get_sl_end(I.FK_ID),'DD.MM.YYYY') dEnd
        ,DECODE(F.fn_state,4,'(открыт)',5,'(закрыт)') st
        FROM asu.TSLINFO I,asu.TSLFORM F
        WHERE FK_PACID=pPacid AND F.FK_ID(+) = I.FK_SLFORMID) LOOP
  if c.rn>1 then sTmp:= '<br>'||c.sn||' '||C.dBeg||' - '||C.dEnd||CR||' '||C.st;
  else sTmp:=c.sn||' '||C.dBeg||' - '||C.dEnd||CR||' '||C.st; end if;
  END LOOP;
  IF sTmp=' ' THEN sTmp:=vTmp; END IF;
  sHtml:=sHTml||sTMp||'</td></tr>';
 --25.1. По уходу за больным Полных лет: _ _ Пол: муж 1 жен 2
...
end;

вызов процедуры:
begin
  asu.update_object_ext('PACKAGE BODY',
                        'STAT',
                        'PKG_HANT',
                        '--25. Листок Нетрудоспособности: открыт_ _._ _._ _ _ _ _закрыт: _ _._ _._ _ _ _ _',
                        ' --25.1. По уходу за больным Полных лет: _ _ Пол: муж 1 жен 2',
                        '  sHtml:=sHtml||''<tr><td colspan="14"  rowspan="1"  class="WhiteALLNOn" >25. Листок нетрудоспособности: '';' || chr(10) ||
                        '  sTmp:='' '';' || chr(10) ||
                        '  for C IN(select t.FD_ALL_SL_BEG dBeg, t.FD_ALL_SL_END dEnd' || chr(10) ||
                        '             from (select LAST_VALUE(t.FD_ALL_SL_BEG) OVER(ORDER BY t.FD_END ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) FD_ALL_SL_BEG,' || chr(10) ||
                        '                          LAST_VALUE(t.FD_ALL_SL_END) OVER(ORDER BY t.FD_END ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) FD_ALL_SL_END' || chr(10) ||
                        '                     from (SELECT TO_CHAR(asu.PKG_SICK_LIST.GET_PAC_SL_BEGIN_ALL(I.FK_PACID), ''DD.MM.YYYY'') FD_ALL_SL_BEG,' || chr(10) ||
                        '                                  DECODE(I.FN_STATE, 2, TO_CHAR(asu.PKG_SICK_LIST.GET_PAC_SL_END_ALL(I.FK_PACID), ''DD.MM.YYYY''), '''') FD_ALL_SL_END,' || chr(10) ||
                        '                                  DECODE(I.FN_STATE, 2, asu.PKG_SICK_LIST.GET_PAC_SL_END_ALL(I.FK_PACID), trunc(sysdate + 365)) FD_END' || chr(10) ||
                        '                             FROM asu.TSLINFO I' || chr(10) ||
                        '                            WHERE I.FL_DEl = 0' || chr(10) ||
                        '                              AND I.FK_PACID = pPacid) t) t' || chr(10) ||
                        '            group by t.FD_ALL_SL_BEG, t.FD_ALL_SL_END)' || chr(10) ||
                        '  loop' || chr(10) ||
                        '    sTmp := C.dBeg||'' - ''||C.dEnd||CR;' || chr(10) ||
                        '  END LOOP;' || chr(10) ||
                        '  IF sTmp='' '' THEN' || chr(10) ||
                        '    sTmp:=vTmp;' || chr(10) ||
                        '  END IF;' || chr(10) ||
                        '  sHtml:=sHTml||sTMp||''</td></tr>'';',
                        1);
end;

после того, как процедура отработала:
CREATE OR REPLACE PACKAGE BODY STAT."PKG_HANT"
...
--25. Листок Нетрудоспособности: открыт_ _._ _._ _ _ _ _закрыт: _ _._ _._ _ _ _ _
--   sHtml:=sHtml||'<tr><td colspan="14"  rowspan="1"  class="WhiteALLNOn" >25. Листок нетрудоспособности:';
--   sTmp:=' ';
--   FOR C IN(SELECT ROWNUM rn,F.FC_SERIES ||' '||F.FC_NUMBER sn,TO_CHAR(asu.get_sl_begin(I.FK_ID),'DD.MM.YYYY') dBeg,TO_CHAR(asu.get_sl_end(I.FK_ID),'DD.MM.YYYY') dEnd
--         ,DECODE(F.fn_state,4,'(открыт)',5,'(закрыт)') st
--         FROM asu.TSLINFO I,asu.TSLFORM F
--         WHERE FK_PACID=pPacid AND F.FK_ID(+) = I.FK_SLFORMID) LOOP
--   if c.rn>1 then sTmp:= '<br>'||c.sn||' '||C.dBeg||' - '||C.dEnd||CR||' '||C.st;
--   else sTmp:=c.sn||' '||C.dBeg||' - '||C.dEnd||CR||' '||C.st; end if;
--   END LOOP;
--   IF sTmp=' ' THEN sTmp:=vTmp; END IF;
--   sHtml:=sHTml||sTMp||'</td></tr>';
  sHtml:=sHtml||'<tr><td colspan="14"  rowspan="1"  class="WhiteALLNOn" >25. Листок нетрудоспособности: ';
  sTmp:=' ';
  for C IN(select t.FD_ALL_SL_BEG dBeg, t.FD_ALL_SL_END dEnd
             from (select LAST_VALUE(t.FD_ALL_SL_BEG) OVER(ORDER BY t.FD_END ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) FD_ALL_SL_BEG,
                          LAST_VALUE(t.FD_ALL_SL_END) OVER(ORDER BY t.FD_END ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) FD_ALL_SL_END
                     from (SELECT TO_CHAR(asu.PKG_SICK_LIST.GET_PAC_SL_BEGIN_ALL(I.FK_PACID), 'DD.MM.YYYY') FD_ALL_SL_BEG,
                                  DECODE(I.FN_STATE, 2, TO_CHAR(asu.PKG_SICK_LIST.GET_PAC_SL_END_ALL(I.FK_PACID), 'DD.MM.YYYY'), '') FD_ALL_SL_END,
                                  DECODE(I.FN_STATE, 2, asu.PKG_SICK_LIST.GET_PAC_SL_END_ALL(I.FK_PACID), trunc(sysdate + 365)) FD_END
                             FROM asu.TSLINFO I
                            WHERE I.FL_DEl = 0
                              AND I.FK_PACID = pPacid) t) t
            group by t.FD_ALL_SL_BEG, t.FD_ALL_SL_END)
  loop
    sTmp := C.dBeg||' - '||C.dEnd||CR;
  END LOOP;
  IF sTmp=' ' THEN
    sTmp:=vTmp;
  END IF;
  sHtml:=sHTml||sTMp||'</td></tr>';
 --25.1. По уходу за больным Полных лет: _ _ Пол: муж 1 жен 2
...
end;
*/
  vProcNameStr varchar2(100);
  vGetDLL_ObjectType varchar2(100);
  clParse CLOB;
  clDDL CLOB;
  cur integer;
  r integer;
begin
  -- Создаётся временная функция, принадлежащая владельцу объекта, которая позволит получить его DDL, избегая трудностей с правами
  vProcNameStr := aOwner || '.' || 'GET_DDL_' || to_char(sysdate, 'yyyymmdd');
  vGetDLL_ObjectType := replace(aObjectType, ' ', '_');

  clParse :=
    'create or replace function pProcNameStr' || chr(10) ||
    'RETURN CLOB IS' || chr(10) ||
    '  clBefore CLOB;' || chr(10) ||
    'begin' || chr(10) ||
    '  SELECT DBMS_METADATA.GET_DDL(pGetDLL_ObjectType, pPkgName, pOwner) INTO clBefore FROM DUAL;' || chr(10) ||
    '  Return clBefore;' || chr(10) ||
    'end;';
  clParse := Replace(clParse, 'pProcNameStr', vProcNameStr);
  clParse := Replace(clParse, 'pGetDLL_ObjectType', '''' || vGetDLL_ObjectType || '''');
  clParse := Replace(clParse, 'pPkgName', '''' || aPkgName || '''');
  clParse := Replace(clParse, 'pOwner', '''' || aOwner || '''');
  asu.parse(clParse);

  -- Выполняется созданная ранее временная функция, в clDDL сохраняется скрипт, соответствующий объекту БД
  cur := dbms_sql.open_cursor;
  dbms_sql.parse(cur, 'select ' || vProcNameStr || ' as FC_CLOB from dual', dbms_sql.native);
  dbms_sql.define_column(cur, 1, clDDL);
  r := dbms_sql.execute(cur);
  if r > 0 then
    raise_application_error (-20200,'Не удалось получить объект БД ' || aOwner || '.' || aPkgName || ' типа ' || aObjectType);
  else
    loop
      if dbms_sql.Fetch_Rows(cur) = 0 then
        exit;
      else
        dbms_sql.column_value(cur, 1, clDDL);
      end if;
    end loop;
  end if;
	dbms_sql.close_cursor(cur);

  -- Изменение объекта БД
  asu.update_object(clDDL,
                    aObjectType,
                    aOwner,
                    aPkgName,
                    aStartStr,
                    aFinishStr,
                    aNewStr,
                    aCheckValid);

  -- Веменная функция удаляется
  clParse := 'drop function pProcNameStr';
  clParse := Replace(clParse, 'pProcNameStr', vProcNameStr);
  asu.parse(clParse);
end;
/

SHOW ERRORS;


