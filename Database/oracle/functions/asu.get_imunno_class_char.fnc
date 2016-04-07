DROP FUNCTION ASU.GET_IMUNNO_CLASS_CHAR
/

--
-- GET_IMUNNO_CLASS_CHAR  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   V$NLS_PARAMETERS (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   IS_NUMBER1 (Function)
--
CREATE OR REPLACE FUNCTION ASU.get_imunno_class_char(pFC_VALUE in varchar2)
return varchar2 is
  cursor cNls is select value from v$nls_parameters where parameter = 'NLS_LANGUAGE';
  sLang varchar2(100);
begin
  open cNls;
  fetch cNls into sLang;
  close cNls;

  if sLang = 'RUSSIAN' then
    if (pFC_VALUE is NULL) or (pFC_VALUE = ';') or
       ((asu.is_number1(replace(replace(pFC_VALUE, ' ', ''), '.', ','))=0) and
        (rtrim(replace(pFC_VALUE, ' ', ''), '0') <> ';0.1') and (rtrim(replace(pFC_VALUE, ' ', ''), '0') <> '<0.1') and
        (rtrim(replace(pFC_VALUE, ' ', ''), '0') <> ';0,1') and (rtrim(replace(pFC_VALUE, ' ', ''), '0') <> '<0,1') and
        ((replace(pFC_VALUE, ' ', '') <> ';100') and (replace(pFC_VALUE, ' ', '') <> '>100'))) then
--    raise_application_error(-20001, pFC_VALUE);
      return '';
    else
      if (rtrim(replace(pFC_VALUE, ' ', ''), '0') = ';0.1') or (rtrim(replace(pFC_VALUE, ' ', ''), '0') = ';0,1') or (rtrim(replace(pFC_VALUE, ' ', ''), '0') = '<0,1') or (rtrim(replace(pFC_VALUE, ' ', ''), '0') = '<0.1') then
        return 'Класс 0';
      else if (replace(pFC_VALUE, ' ', '') = ';100') or (replace(pFC_VALUE, ' ', '') = '>100') then
        return 'Класс 6';
      else if replace(replace(pFC_VALUE, ' ', ''), '.', ',') >= 0.0 and replace(replace(pFC_VALUE, ' ', ''), '.', ',') < 0.35 then
        return 'Класс 0';
      else if replace(replace(pFC_VALUE, ' ', ''), '.', ',') >= 0.35 and replace(replace(pFC_VALUE, ' ', ''), '.', ',') < 0.70 then
        return 'Класс 1';
      else if replace(replace(pFC_VALUE, ' ', ''), '.', ',') >= 0.70 and replace(replace(pFC_VALUE, ' ', ''), '.', ',') < 3.5 then
        return 'Класс 2';
      else if replace(replace(pFC_VALUE, ' ', ''), '.', ',') >= 3.5 and replace(replace(pFC_VALUE, ' ', ''), '.', ',') < 17.5 then
        return 'Класс 3';
      else if replace(replace(pFC_VALUE, ' ', ''), '.', ',') >= 17.5 and replace(replace(pFC_VALUE, ' ', ''), '.', ',') < 52.5 then
        return 'Класс 4';
      else if replace(replace(pFC_VALUE, ' ', ''), '.', ',') >= 52.5 and replace(replace(pFC_VALUE, ' ', ''), '.', ',') < 100 then
        return 'Класс 5';
      else if replace(replace(pFC_VALUE, ' ', ''), '.', ',') >= 100 then
        return 'Класс 6';
      else return '';
      end if;
      end if;
      end if;
      end if;
      end if;
      end if;
      end if;
      end if;
      end if;
    end if;
 else
    if (pFC_VALUE is NULL) or (pFC_VALUE = ';') or
       ((asu.is_number1(replace(replace(pFC_VALUE, ' ', ''), ',', '.'))=0) and
        (rtrim(replace(pFC_VALUE, ' ', ''), '0') <> ';0.1') and (rtrim(replace(pFC_VALUE, ' ', ''), '0') <> '<0.1') and
        (rtrim(replace(pFC_VALUE, ' ', ''), '0') <> ';0,1') and (rtrim(replace(pFC_VALUE, ' ', ''), '0') <> '<0,1') and
        ((replace(pFC_VALUE, ' ', '') <> ';100') and (replace(pFC_VALUE, ' ', '') <> '>100'))) then
--     raise_application_error(-20000, pfc_value);
     return '';
   else
     if (rtrim(replace(pFC_VALUE, ' ', ''), '0') = ';0.1') or (rtrim(replace(pFC_VALUE, ' ', ''), '0') = ';0,1') or (rtrim(replace(pFC_VALUE, ' ', ''), '0') = '<0,1') or (rtrim(replace(pFC_VALUE, ' ', ''), '0') = '<0.1') then
       return 'Класс 0';
     else if (replace(pFC_VALUE, ' ', '') = ';100') or (replace(pFC_VALUE, ' ', '') = '>100') then
       return 'Класс 6';
     else if replace(replace(pFC_VALUE, ' ', ''), ',', '.') >= 0.0 and replace(replace(pFC_VALUE, ' ', ''), ',', '.') < 0.35 then
       return 'Класс 0';
     else if replace(replace(pFC_VALUE, ' ', ''), ',', '.') >= 0.35 and replace(replace(pFC_VALUE, ' ', ''), ',', '.') < 0.70 then
       return 'Класс 1';
     else if replace(replace(pFC_VALUE, ' ', ''), ',', '.') >= 0.70 and replace(replace(pFC_VALUE, ' ', ''), ',', '.') < 3.5 then
       return 'Класс 2';
     else if replace(replace(pFC_VALUE, ' ', ''), ',', '.') >= 3.5 and replace(replace(pFC_VALUE, ' ', ''), ',', '.') < 17.5 then
       return 'Класс 3';
     else if replace(replace(pFC_VALUE, ' ', ''), ',', '.') >= 17.5 and replace(replace(pFC_VALUE, ' ', ''), ',', '.') < 52.5 then
       return 'Класс 4';
     else if replace(replace(pFC_VALUE, ' ', ''), ',', '.') >= 52.5 and replace(replace(pFC_VALUE, ' ', ''), ',', '.') < 100 then
       return 'Класс 5';
     else if replace(replace(pFC_VALUE, ' ', ''), ',', '.') >= 100 then
       return 'Класс 6';
     else return '';
     end if;
     end if;
     end if;
     end if;
     end if;
     end if;
     end if;
     end if;
     end if;
   end if;
  end if;
end;
/

SHOW ERRORS;


