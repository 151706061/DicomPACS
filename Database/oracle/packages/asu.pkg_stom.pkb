DROP PACKAGE BODY ASU.PKG_STOM
/

--
-- PKG_STOM  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_STOM" is

  function getpicidbytechid(id number)
	 return number is
   res number;
	 cursor ct
	 is
		select fk_id  from tpics where fk_nazid=id;
  begin
		open ct;
		fetch ct into res;
		close ct;
    return(res);
  end;

end pkg_stom;
/

SHOW ERRORS;


