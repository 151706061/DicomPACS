declare 
   vIsExists PLS_INTEGER;
begin  
  select count(1) 
    into vIsExists 
   from ALL_TYPES t
  where upper(t.OWNER) = 'MED'
    and upper(t.typecode) = 'OBJECT' 
    and upper(t.TYPE_NAME ) = 'O_TREB_DPC_TABLE';

  if( vIsExists > 0 ) then
    execute IMMEDIATE 'drop type MED.O_TREB_DPC_TABLE force';
  end if; 
end;
/                  
create or replace type  MED.O_TREB_DPC_TABLE is table of MED.O_TREB_DPC
/
