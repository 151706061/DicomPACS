DROP FUNCTION ASU.GET_FULLPATH_SHA
/

--
-- GET_FULLPATH_SHA  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TIB (Table)
--   TSMID (Table)
--   GET_SMIDNAME (Function)
--   VNAZ (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_FULLPATH_SHA" (id IN NUMBER, nazid IN NUMBER default -1)
  RETURN VARCHAR2
IS
  sName   tsmid.fc_name%type;
  rn      NUMBER;
  rl      NUMBER;
  ColStom NUMBER;
  sRes    VARCHAR2(4000);
  CURSOR c1
  IS
    SELECT fc_name, ROWNUM, fl_showprint
      FROM (SELECT fk_id, fc_name, fl_showprint, fk_owner
              FROM tsmid
             START WITH fk_id = id
             CONNECT BY PRIOR fk_owner = fk_id)
     WHERE fk_owner <> 0
     ORDER BY ROWNUM desc;
     
  -- deemaric add 14.05.2009
  -- если —том. услуги, то будем искать параметры в TIB
 CURSOR curIsStom IS   
  SELECT count(fk_id)
    FROM tsmid  
   where fc_synonim = 'PROC_STOM_USL'
   START WITH fk_id = id
  CONNECT BY PRIOR fk_owner = fk_id;
  
     
  CURSOR c4 IS
select t.fk_smid,
       get_smidname(t.fk_smid) as ValueParam,
       t.fk_smeditid,
       get_smidname(t.fk_smeditid) as NameParam
  from vnaz, tib t
 where t.fk_pacid = vnaz.fk_id
   and vnaz.fk_id = nazid;
  
BEGIN
  sRes := '';
  ColStom := 0;
 

  OPEN c1;
  FETCH c1 INTO sName, rn, rl;
  IF c1%FOUND and rl=1 THEN
    sRes := sRes || sName || ':';
  END IF;
  LOOP
    FETCH c1 INTO sName, rn,rl;
    EXIT WHEN c1%NOTFOUND;
    if rl=1 then
       sRes := sRes || ' ' || sName;
    end if;
  END LOOP;
  CLOSE c1;
  IF SUBSTR (sRes, LENGTH (sRes), 1) = ':' THEN
    sRes := SUBSTR (sRes, 1, LENGTH (sRes) - 1);
  END IF;
  
     
  OPEN  curIsStom;
  FETCH curIsStom INTO ColStom; 
  CLOSE curIsStom;
  
  if ColStom > 0 then
  begin     
    for i in c4 loop
     begin
       sRes := sRes || ' ' || i.nameparam || ' '|| i.valueparam || ';';
     end;
    end loop; 
  end;
 end if;    

  
  RETURN sRes;
END;
/

SHOW ERRORS;


