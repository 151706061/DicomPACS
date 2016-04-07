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
                '������',
                '02',
                '�������',
                '03',
                '�����',
                '04',
                '������',
                '05',
                '���',
                '06',
                '����',
                '07',
                '����',
                '08',
                '�������',
                '09',
                '��������',
                '10',
                '�������',
                '11',
                '������',
                '12',
                '�������',
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


