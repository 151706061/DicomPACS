DROP PACKAGE ASU.PKG_LOG
/

--
-- PKG_LOG  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_LOG" is

  -- Author  : TIMURLAN
  -- Created : 15.11.2002 16:22:16
  -- Purpose : 4 tracking user motions
  -- LastUpdated : 25.10.2003 by TimurLan
  function Get_value(value in number) return Varchar2;
  function Get_value(value in date) return Varchar2;
  function Get_value(value in varchar2) return Varchar2;
  function Get_client(value in varchar2) return number;
  function Get_module(value in varchar2) return Varchar2;
--  procedure Do_log(table in varchar2, field in varchar2, action in varchar2, old in number, new in number);
--  procedure Do_log(table in varchar2, field in varchar2, action in varchar2, old in date, new in date);
  procedure Do_log(tablename in varchar2, field in varchar2, action in varchar2, old in varchar2, new in varchar2, owner in number);
  procedure do_update_log;

end PKG_LOG;
/

SHOW ERRORS;


GRANT EXECUTE ON ASU.PKG_LOG TO LOGIN
/

