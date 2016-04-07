DROP FUNCTION ASU.GET_MONTH_RODPAD
/

--
-- GET_MONTH_RODPAD  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DUAL (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--
CREATE OR REPLACE FUNCTION ASU."GET_MONTH_RODPAD" (pDate in date) return varchar2 is
  nMonth varchar2(8);
begin
  select decode(to_char(pDate, 'MM'),
                '01',
                '€нвар€',
                '02',
                'феврал€',
                '03',
                'марта',
                '04',
                'апрел€',
                '05',
                'ма€',
                '06',
                'июн€',
                '07',
                'июл€',
                '08',
                'августа',
                '09',
                'сент€бр€',
                '10',
                'окт€бр€',
                '11',
                'но€бр€',
                '12',
                'декабр€',
                null)
    into nMonth
    from dual;
  return nMonth;
exception
  when others then
    return null;
end;
/

SHOW ERRORS;


