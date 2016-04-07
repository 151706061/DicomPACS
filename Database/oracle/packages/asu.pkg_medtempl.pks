DROP PACKAGE ASU.PKG_MEDTEMPL
/

--
-- PKG_MEDTEMPL  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."PKG_MEDTEMPL" is
	procedure prescr_save(p_templid integer, p_nazid integer);
	procedure prescr_load(
		p_pacid integer,
		p_templid integer,
		p_sotrid integer,
		p_osmotrid integer
	);
	procedure prescr_load_naz(
		p_pacid integer,
		p_nazid integer,
		p_sotrid integer,
		p_osmotrid integer,
    p_check_ost INTEGER DEFAULT 0,
    p_result OUT VARCHAR2
	);
	procedure prescr_remove(p_templid integer);
	function prescr_fullname(
		p_id integer,
		p_show_daydoze integer default 1,
		p_is_nazparid integer default 0
	) return varchar2;
end;
/

SHOW ERRORS;


