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
      cTemp := 'À';
    elsif cTemp = 'B' then
      cTemp := 'Â';
    elsif cTemp = 'C' then
      cTemp := 'Ñ';
    elsif cTemp = 'E' then
      cTemp := 'Å';
    elsif cTemp = 'H' then
      cTemp := 'Í';
    elsif cTemp = 'K' then
      cTemp := 'Ê';
    elsif cTemp = 'M' then
      cTemp := 'Ì';
    elsif cTemp = 'O' then
      cTemp := 'Î';
    elsif cTemp = 'P' then
      cTemp := 'Ð';
    elsif cTemp = 'T' then
      cTemp := 'Ò';
    elsif cTemp = 'X' then
      cTemp := 'Õ';
    elsif cTemp = 'Y' then
      cTemp := 'Ó';
    end if;
    Result:=Result||cTemp;
  END LOOP;
  return(Result);
end DO_IN_RUCHAR;
/

SHOW ERRORS;


