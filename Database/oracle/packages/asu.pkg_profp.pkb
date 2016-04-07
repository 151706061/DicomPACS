DROP PACKAGE BODY ASU.PKG_PROFP
/

--
-- PKG_PROFP  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU.pkg_profp
IS

   FUNCTION isNotZakl(listid IN number) RETURN number is
   i_1  NUMBER ;
   i_2  number;
--   i_zakl NUMBER;
--    CURSOR CU   (plistid number)
    CURSOR CU
     IS

        SELECT  v.fk_id,fk_nazsosid,v.fk_smid FROM asu.tprofp_list_naz pln,asu.vnaz v
            WHERE pln.fk_nazid = v.fk_id
                AND pln.fk_listid =
--                 plistid;
                   listid;
    BEGIN
--    i_zakl:= nGET_ZAKL_PROFP;
    i_1:=0;
    i_2:=0;
--        FOR g_CU IN CU(listid) LOOP
        FOR g_CU IN CU LOOP
            IF g_CU.fk_smid =nGET_ZAKL_PROFP AND g_CU.fk_nazsosid!=1 THEN
                inc(i_1);
            END IF;
            IF g_CU.fk_smid != nGET_ZAKL_PROFP AND g_CU.fk_nazsosid=1 THEN
                inc(i_2);
            END IF;
        END LOOP;
        IF ((i_1 > 0) AND (i_2>0)) THEN
            RETURN 1;--TRUE;
                ELSE
            RETURN 0;--FALSE;
        END IF;
    END;
    --------------------------------------------------------
FUNCTION isZAKL_PROFP (pLIST_ID number) RETURN integer --boolean
   IS
--     cursor cGetZakp is select decode(count(1),0,0,1) from asu.tprofp_list_naz t2 where fk_smid =  nGET_ZAKL_PROFP  and t2.fk_listid = pLIST_ID;
cursor cGetZakl is

      SELECT  decode(count(1),0,0,1) /* count(1)*/ x  FROM asu.tprofp_list_naz pln,asu.vnaz v
            WHERE pln.fk_nazid = v.fk_id
                AND pln.fk_listid = pLIST_ID
                and  v.fk_smid= nGET_ZAKL_PROFP
                and  fk_nazsosid=1    ;
x integer;
 begin
     open cGetZakl;
     FETCH cGetZakl  into x;
     close cGetZakl;
     return x;
--     return (nvl2(decode(x,0,null),false,true));
--return (case when x!=1 then false else true end);

end;





  FUNCTION isAllNotZakl(listid IN number) RETURN number is
    CURSOR CU(plistid number) IS
        SELECT  v.fk_id,fk_nazsosid,v.fk_smid FROM asu.tprofp_list_naz pln,asu.vnaz v
            WHERE pln.fk_nazid = v.fk_id
                AND pln.fk_listid = plistid;
    BEGIN
        FOR g_CU IN CU(listid) LOOP
            IF  g_CU.fk_nazsosid=1 THEN
            RETURN 1;
            END IF;
        END LOOP;
            RETURN 0;--FALSE;
    END;

  FUNCTION GET_COUNT_vip(listid IN number) RETURN varchar2 IS

--FN_kolvo:NUMBER;
FC_kolvo varchar(30);
    CURSOR CU(plistid number) IS
        SELECT
--      count(1)FN_kolvo,
--      sum(decode(fk_nazsosid,1,1,0))fn_vip
decode (count(1),0,'Не создано мероприятие',
'Вып '||nvl(sum(decode(fk_nazsosid,1,1,0)),0)||' из '||count(1))x
        FROM
         asu.tprofp_list_naz pln,asu.vnaz v
            WHERE pln.fk_nazid=v.fk_id(+)
                AND fk_listid = listid  ;

    BEGIN
     open CU(listid);
     FETCH CU  into FC_kolvo;
     close CU;
     return FC_kolvo;


END;

   FUNCTION GET_SOTR_BY_SMID(pSMID_ID number) RETURN NUMBER
   IS
   nSotr NUMBER;
       CURSOR cSotr --(pSMID_ID number)
       IS
        SELECT
         coalesce( (select max(fk_ispolid) keep(dense_rank last ORDER BY 0,fk_id) fk_sotrid --, 1 ORD, '0' fl_priem ,0 fk_id
             from tprofp_ispol where fk_smid=pSMID_ID and fk_ispolid is not NULL
              and fk_ispolid<>0),( select max(fk_sotrid)keep(dense_rank last ORDER BY fl_priem,fk_id)
              from
 tnazvrach where fk_smid=pSMID_ID
 ))
 x FROM dual;
   BEGIN
     open cSotr;
     FETCH cSotr  into nSotr;
     close cSotr;
     return nSotr;
   END;


procedure SET_GROUP1 (pDiagId number)
is
begin
if  ((pDiagId is null) or (pDiagId<1)) then
return;
end if;
    merge into asu.tdiagdetail d
        using (select pDiagId x from dual)t
            on (d.fk_diagid = t.x)
    WHEN MATCHED THEN
        UPDATE SET D.fk_grupid = nGET_DISP_GROUP1
   WHEN NOT MATCHED THEN
        INSERT (D.fk_diagid, D.fk_grupid)
         VALUES (pDiagId, nGET_DISP_GROUP1);
end;

procedure SET_GODEN (pNazId number)
is
begin
if  ((pNazId is null) or (pNazId<1)) then
return;
end if;

         update  asu.TPROFP_LIST_NAZ t
         set
         t.fk_resid = nGoden,
         --t.fc_conclusion = nvl2(t.fc_conclusion,' Годен '||replace( t.fc_conclusion,'Годен',''),'Годен')
         t.fc_conclusion = nvl(t.fc_conclusion,' Годен ')--||replace( t.fc_conclusion,'Годен',''),'Годен')
         where
         t.fk_nazid=pNazid;
end;


function  Get_z00 RETURN integer
is
begin
return nGET_Z00;
end;
-------------------------------------------

   function Get_NumZ00(nId number) return number
   is
   begin
        for x in 1..NumZ00.count loop
            if NumZ00(x) = nid then
                return 1;
            end if;
        end loop;
    return 0;
   end;

---------------------------------------
function  GET_ZAKL_PROFP RETURN integer
is
begin
return nGET_ZAKL_PROFP;
end;

---------------------------------------
function  GET_test RETURN integer
is
begin
return ntest;
end;
-------------------------------------------
   BEGIN
nGET_ZAKL_PROFP:=asu.get_synid('GET_ZAKL_PROF');
--select asu.seq_test.NEXTVAL into ntest from dual;
------------------------------------------------
/*      select fk_id -- reverse(sys_connect_by_path(reverse(fc_name),'->'))x, t.*
        into
        nGET_Z00
from asu.tsmid t
where t.fk_mkb10 like '%Z00.0%'
start with fc_synonim ='DIAGS_MKB10'--in (291955)-- (select fk_id from asu.tsmid t where t.fk_mkb10 like '%Z00.0%')
connect by prior  fk_id=fk_owner;
--        nGET_DISP_GROUP1:=asu.get_synid('DOPDISP_GROUP_NABL_1');
-------------------------------------------------------------
select fk_id bulk collect  into xxx  from asu.tsmid t
where t.fk_mkb10 like '%Z00.0%'
start with fc_synonim ='DIAGS_MKB10'--in (291955)-- (select fk_id from asu.tsmid t where t.fk_mkb10 like '%Z00.0%')
connect by prior  fk_id=fk_owner;

---------------------------------------
*/

FOR j IN (
select fk_id  from asu.tsmid t where t.fk_mkb10 like '%Z00.0%'
start with fc_synonim ='DIAGS_MKB10'--in (291955)-- (select fk_id from asu.tsmid t where t.fk_mkb10 like '%Z00.0%')
connect by prior  fk_id=fk_owner
) LOOP
NumZ00.extend;
NumZ00(NumZ00.count):=j.fk_id;
END LOOP;

END;
/

SHOW ERRORS;


