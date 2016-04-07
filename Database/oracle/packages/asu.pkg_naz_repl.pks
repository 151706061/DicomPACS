DROP PACKAGE ASU.PKG_NAZ_REPL
/

--
-- PKG_NAZ_REPL  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_NAZ_REPL" IS

 -- Author  : A.NAKORJAKOV
 -- Created : 16.06.2009 10:17:01
 -- Purpose : מבלום לוזהף ־Êֱ ט ֿׁÊ

 FUNCTION get_our_code(ptheir NUMBER, pfc_name VARCHAR2) RETURN NUMBER;
 FUNCTION get_their_code(pour NUMBER, pfc_name VARCHAR2) RETURN NUMBER;
 PROCEDURE do_exchange_naz;
 PROCEDURE do_exchange_res;

END pkg_naz_repl;
/

SHOW ERRORS;


