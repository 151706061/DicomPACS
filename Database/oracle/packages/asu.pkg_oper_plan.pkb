DROP PACKAGE BODY ASU.PKG_OPER_PLAN
/

--
-- PKG_OPER_PLAN  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_OPER_PLAN" 
IS
   --created by Netrebenko
   --modified by A.Nakorjakov 14.07.08
   FUNCTION GetSotrList(pFK_NAZID IN NUMBER, pFP_MEMTYPE IN NUMBER) RETURN VARCHAR2
    IS
     CURSOR c is
        select do_vrachfio(fk_sotrid) fio
        from tnazoper_naz
        where fk_nazid=pFK_NAZID
          and fp_memtype=pFP_MEMTYPE order by fio;
     str VARCHAR2(4000);
   BEGIN
     str:='';
     for c1 in c loop
       str:=str||c1.fio||'; ';
     end loop;
     return str;
   END;
END;
/

SHOW ERRORS;


