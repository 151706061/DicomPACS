DROP FUNCTION ASU.DO_IN_RUCHAR
/

--
-- DO_IN_RUCHAR  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE FUNCTION ASU."DO_IN_RUCHAR" (pFC_VALUE IN VARCHAR2)
 return varchar2 is-- created by TimurLan
  Result varchar2(32676);
  cTemp char(1);
begin
  IF pFC_VALUE is NULL then
    return('');
  end if;
  Result:='';
  FOR i IN 1..Length(pFC_VALUE) LOOP
    cTemp:=SUBSTR(UPPER(pFC_VALUE),i,1);
    if cTemp = 'A' then
      cTemp := '�';
    elsif cTemp = 'B' then
      cTemp := '�';
    elsif cTemp = 'C' then
      cTemp := '�';
    elsif cTemp = 'E' then
      cTemp := '�';
    elsif cTemp = 'H' then
      cTemp := '�';
    elsif cTemp = 'K' then
      cTemp := '�';
    elsif cTemp = 'M' then
      cTemp := '�';
    elsif cTemp = 'O' then
      cTemp := '�';
    elsif cTemp = 'P' then
      cTemp := '�';
    elsif cTemp = 'T' then
      cTemp := '�';
    elsif cTemp = 'X' then
      cTemp := '�';
    elsif cTemp = 'Y' then
      cTemp := '�';
    end if;
    Result:=Result||cTemp;
  END LOOP;
  return(Result);
end DO_IN_RUCHAR;
/

SHOW ERRORS;


