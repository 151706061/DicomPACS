declare 
   vIsExists PLS_INTEGER;
begin  
  select count(1) 
    into vIsExists 
   from ALL_TYPES t
  where upper(t.OWNER) = 'MED'
    and upper(t.typecode) = 'OBJECT' 
    and upper(t.TYPE_NAME ) = 'O_RASH_AUTOFILLPLAN';

  if( vIsExists > 0 ) then
    execute IMMEDIATE 'drop type MED.O_RASH_AUTOFILLPLAN force';
  end if; 
end;
/
create or replace type MED.O_RASH_AUTOFILLPLAN is object ( 
    FK_TREB_DPCID number, -- �� ���� ������� ����������
   -- FK_MEDICID number, -- ��������� ����� ����������
    FK_KARTID number, -- ��������� ���������� �� ���� �������� (������)
    FN_KOL number    -- � ����� ���-���
)
/
