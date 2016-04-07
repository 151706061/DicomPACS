DROP PACKAGE ASU.PKG_BITOPS
/

--
-- PKG_BITOPS  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU.PKG_BITOPS is

  -- Ищуков С.С.
  function raw_ascii(p_dec number) return raw;
  function ascii_raw(p_raw varchar2) return number;

  function bitand(p_dec1 number, p_dec2 number) return number;
  function bitor (p_dec1 number, p_dec2 number) return number;
  function bitxor(p_dec1 number, p_dec2 number) return number;

end;
/

SHOW ERRORS;


