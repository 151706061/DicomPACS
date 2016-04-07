DROP PACKAGE BODY ASU.PKG_MISEXCH
/

--
-- PKG_MISEXCH  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_MISEXCH" 
IS
   FUNCTION GetSotrList(pFK_TASKID IN NUMBER) RETURN VARCHAR2
    IS
     CURSOR c is select do_vrachfio(fk_userid) fio from tmisexch_tasks_users where fk_taskid=pFK_TASKID;
     str VARCHAR2(32000);
   BEGIN
     str:='';
     for c1 in c loop
       str:=str||c1.fio||'; ';
       if length(str)>1000 then
         return substr(str,1,200);
       end if;
     end loop;
     return substr(str,1,200);
   END;
END;
/

SHOW ERRORS;


