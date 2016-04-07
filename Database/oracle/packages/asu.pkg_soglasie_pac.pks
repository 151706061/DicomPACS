DROP PACKAGE ASU.PKG_SOGLASIE_PAC
/

--
-- PKG_SOGLASIE_PAC  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_SOGLASIE_PAC" is

  -- Author  : TOXA
  -- Created : 07.10.2009 16:24:15
  -- Purpose : Учет согласия пациента на обработку персональных данных
  
procedure ins_tpersonal_data(peopleid in number, ddate in date, sotrid in number, ptype in number);

function Get_Status(peopleid in number) return number;

end;
/

SHOW ERRORS;


