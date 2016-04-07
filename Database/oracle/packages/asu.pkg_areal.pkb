DROP PACKAGE BODY ASU.PKG_AREAL
/

--
-- PKG_AREAL  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU.pkg_areal is


function AREALIST_ON_DATE(p_arealid IN NUMBER, p_olddate IN DATE)
return tbl_UID parallel_enable pipelined is
begin
  FOR I IN (
       SELECT T.* FROM
       (
       (SELECT ACTUAL.FK_PEPLID, ACTUAL.FD_DATE_IN
        FROM ASU.TDISTRICT_PACIENT ACTUAL
        WHERE
          ACTUAL.FK_AREALID=p_arealid
          AND NOT EXISTS (SELECT INCOM.FK_PEPLID
                          FROM ASU.TDISTRICT_HISTORY INCOM
                          WHERE
                            INCOM.FD_DATE_MOVE BETWEEN p_olddate AND SYSDATE
                            AND INCOM.FC_TYPE='I'
                            AND INCOM.FK_AREAID=p_arealid
                            AND ACTUAL.FK_PEPLID=INCOM.FK_PEPLID
                         )
       )
       UNION
       (SELECT DH.FK_PEPLID, DH.FD_DATE_MOVE
        FROM ASU.TDISTRICT_HISTORY DH
        WHERE
          DH.FD_DATE_MOVE BETWEEN p_olddate AND SYSDATE
            AND DH.FC_TYPE='O'
            AND DH.FK_AREAID=p_arealid
       )) T
   ) LOOP
     PIPE ROW(I);
   END LOOP;
  RETURN;
end;
--///////////////////////////////////---
FUNCTION     GET_DIAPAZON (s varchar2)
    RETURN  tdiapazon  parallel_enable   pipelined
is
 out_record asu.pkg_areal.diapazon;
 TYPE MyType IS REF CURSOR ;
Date_ref MyType;
Date_m number;
j integer;
n number;
--n integer;
si1 varchar2(400);
si2 varchar2(400);
send varchar2(4000);
lflag integer;
BEGIN
si1:='';
 FOR n IN 1..LENGTH(s)
        LOOP
        lflag:=0;
        if SUBSTR(s, n, 1) ='-' then
          si2:=si1;
          si1:='';
        else

        begin

         if SUBSTR(s, n, 1) =',' then
            lflag:=1;
         end if;


         if n=LENGTH(s)  then
           lflag:=1;
             if length(nvl(si1,'X'))<4 and TO_NUMBER(REGEXP_INSTR(SUBSTR(s, n, 1), '^[[:digit:]]'))>0  then
             si1 :=trim(si1)||SUBSTR(s, n, 1);
           end if;
         end if;

      if lflag >0 then
         begin
                if length(send)>0 then   send:=send||chr(13)||'  union all  '||chr(13); end if;
                     if length(trim(si2))<1 or si2 is null then
                         send:=send||chr(13)||' select  '|| to_char(nvl(si1,'0')) ||'  from dual  '||chr(13);
                        else
                           send:=send||chr(13)||' select * from (select  rownum rrow  from dual  CONNECT BY LEVEL <= '||
                           to_char(nvl(greatest (si1,si2),'0'))||') where rrow >= '||to_char(nvl(least(si2,si1),'0'))||' '||chr(13);
                     end if;
                 si1:='';
                 si2:='';
               end;
         else
           begin
--           if length(nvl(si1,'X'))<4  then
             if length(nvl(si1,'X'))<4 and TO_NUMBER(REGEXP_INSTR(SUBSTR(s, n, 1), '^[[:digit:]]'))>0  then

             si1 :=trim(si1)||SUBSTR(s, n, 1);
           end if;
            null;
            end;
          end if;
        end;
        end if;
--        EXCEPTION   WHEN OTHERS THEN send:='select -1 fk_id from dual';

        END LOOP;
OPEN  Date_ref FOR send;
LOOP
   FETCH Date_ref INTO Date_m;
       EXIT WHEN Date_ref%NOTFOUND;
out_record.FK_ID:=Date_m;
PIPE ROW(out_record);
END LOOP;
CLOSE Date_ref;
RETURN;
END ;
--/////////////////////////////////////--


FUNCTION     GET_DIAPAZON2 (s varchar2)
    RETURN  tdiapazon2  parallel_enable   pipelined
is
 out_record asu.pkg_areal.diapazon2;
 TYPE MyType IS REF CURSOR ;
Date_ref MyType;
Date_m varchar2(10);
j integer;
n number;
--n integer;
si1 varchar2(400);
si2 varchar2(400);
send varchar2(4000);
lflag integer;
  l1 integer; -- 0  эни 1 нечет 2 чёт
  l2 integer;
  s1 varchar2(50);

BEGIN
si1:='';
 FOR n IN 1..LENGTH(s)
        LOOP
        lflag:=0;

   if SUBSTR(s,n,1)='#' then -- четное
   if l2 = 0 THEN
    l1:=2;
    l2:=1;
    s1:=' and 0 = mod(rrow,2) ';
   else
    l1:=0;
    l2:=0;
  --  s1:='';
   end if;

   end if;

   if SUBSTR(s,n,1)='$' then -- НЕ чётное
   if l2 = 0 THEN
    l1:=1;
    l2:=1;
     s1:=' and 1 = mod(rrow,2) ';

    else
    l1:=0;
    l2:=0;
--    s1:='';

    end if;
   end if;
        if SUBSTR(s, n, 1) ='-' then
          si2:=si1;
          si1:='';
        else

        begin

         if SUBSTR(s, n, 1) =',' then
            lflag:=1;
         end if;


         if n=LENGTH(s)  then
           lflag:=1;
             if length(nvl(si1,'X'))<6 --and TO_NUMBER(REGEXP_INSTR(SUBSTR(s, n, 1), '^[[:digit:]]'))>0
             then
             si1 :=trim(si1)||SUBSTR(s, n, 1);
           end if;
         end if;

      if lflag >0 then
         begin
                if length(send)>0 then   send:=send||chr(13)||'  union all  '||chr(13); end if;
                     if length(trim(si2))<1 or si2 is null then
                         send:=send||chr(13)||' select  '''|| to_char(nvl(si1,'0')) ||'''  from dual  '||chr(13);
                        else
                           send:=send||chr(13)||' select to_char(rrow)rrow from (select  rownum rrow  from dual  CONNECT BY LEVEL <= '||
--                           to_char(nvl(greatest (si1,si2),'0'))||') where rrow >= '||to_char(nvl(least(si2,si1),'0'))||' '||' '||s1||chr(13);
                           to_char(nvl(greatest (to_number(REGEXP_REPLACE(trim(si1),'[^[:digit:]]')),to_number(REGEXP_REPLACE(trim(si2),'[^[:digit:]]'))),'0'))||') where rrow >= '||
                           to_char(nvl(least    (to_number(REGEXP_REPLACE(trim(si2),'[^[:digit:]]')),to_number(REGEXP_REPLACE(trim(si1),'[^[:digit:]]'))),'0'))||' '||s1||chr(13);
                     end if;
                 si1:='';
                 si2:='';
               end;
         else
           begin
--           if length(nvl(si1,'X'))<4  then
             if length(nvl(si1,'X'))<6 /*and TO_NUMBER(REGEXP_INSTR(SUBSTR(s, n, 1), '^[[:digit:]]'))>0*/  then

             si1 :=trim(si1)||SUBSTR(s, n, 1);
           end if;
            null;
            end;
          end if;
        end;
        end if;
--      dbms_output.put_line(send);
--        EXCEPTION   WHEN OTHERS THEN send:='select -1 fk_id from dual';

        END LOOP;
OPEN  Date_ref FOR send;
LOOP
   FETCH Date_ref INTO Date_m;
       EXIT WHEN Date_ref%NOTFOUND;
out_record.FK_ID:=Date_m;
PIPE ROW(out_record);
END LOOP;
CLOSE Date_ref;
RETURN;
END ;
--//////////////////////////////////////////////////////

FUNCTION  CUT_ROOM (  pHouse VARCHAR2,pStr varchar2)
    RETURN  varchar2
is
lpstr VARCHAR2(4000);
begin
    lpstr:=pstr;
    if instr((')'||lpStr),(')'||pHouse||'('))>0 THEN
        lpStr:=substr(lpStr,instr(')'||lpStr,')'||pHouse||'(')+length(pHouse)+2-1,length(lpStr));
        lpStr:=substr(lpStr,1,instr(lpStr||')',')')-1);
    end if;
--    EXCEPTION   WHEN OTHERS THEN return '-1';
if length(lpstr)=length(pstr) then return '0'; end if;
return lpStr;
end;
--///////////////////////////////////////////////

FUNCTION  GET_TYPEID(pStr varchar2) RETURN NUMBER
is
lpstr VARCHAR2(4000);
BEGIN

RETURN 0;
END;
-------------------------------------------//--
PROCEDURE SET_CONST_SMID(pName VARCHAR2,pWhere varchar2)
is
 TYPE TREFCURSOR IS REF CURSOR;
        cSql          TREFCURSOR;
        REC               asu.tsmid%ROWTYPE;
  CNT  NUMBER:=0 ;
--  CNT3 NUMBER:=0 ;
     x varchar2(1000);

  sSql VARCHAR2(4000);
BEGIN
---- ATTENTION! DO NOT MODIFY THIS FUNCTION MANUALLY!!!
sSql:=  '
CREATE OR REPLACE FUNCTION ASU.GET_'||pName||'_BY_SYN(pStr varchar2) RETURN NUMBER is
Begin
---- ATTENTION! DO NOT MODIFY THIS FUNCTION MANUALLY!!!
 '   ;
x:=' SELECT *  FROM asu.tsmid '||pWhere;--' connect BY PRIOR fk_id = fk_owner START WITH  fc_synonim = ''TL''';
cnt:=0;
OPEN cSql FOR  x ;
      LOOP
       cnt:=cnt+1;
       IF cnt>100 THEN EXIT; END IF;
    FETCH cSql INTO REC;
    EXIT WHEN cSql%NOTFOUND;
     IF rec.fc_synonim IS NOT NULL THEN
      sSql:=sSql||chr(10)||' IF pStr = '''||rec.fc_synonim||''' THEN RETURN '||to_char(rec.fk_id)|| '; END IF; ';
     END IF;
END loop;
    IF cSql%ISOPEN THEN CLOSE cSql; END IF;
     sSql:=sSql||chr(10)||' Return -137;'||chr(10)||'  END; '  ;
  EXECUTE IMMEDIATE sSql;
--  EXCEPTION WHEN OTHERS THEN NULL;
    END;
--//////////////////////////////////////////////////////////////
FUNCTION     GET_AREALID_BY_ADDR (pAdrID IN TADRESS.FK_ID%TYPE,
     pType in number default -1
     )

 RETURN TDISTRICT.FK_ID%TYPE IS

 lStreet      TADRESS.FK_KLADR%TYPE;
 lHouse       TADRESS.FC_HOUSE%TYPE;
 lKorpus      TADRESS.FC_KORPUS%TYPE;
 lKVARTIRA    TADRESS.FC_KVARTIRA%TYPE;
 lDistrict    TDISTRICT.FK_ID%TYPE;
 pType2 NUMBER;
 /* ----- ЛОКАЛЬНАЯ Ф-ЦИЯ ВЫБИРАЕТ БЕЗ УЧЕТА ОТДЕЛЕНИЯ СОТРУДНИКА ---- */
 FUNCTION get_district RETURN TDISTRICT.FK_ID%TYPE IS
   lDistrict TDISTRICT.FK_ID%TYPE;
 BEGIN
   SELECT NVL(MAX(DN.FK_ID), 0) INTO lDistrict
   FROM asu.tdistrict d, asu.tdistrict_name dn
   WHERE D.FK_KLADR=lStreet -- совпадение по КЛАДР
   AND
   (  lHouse||upper(trim(decode(lKorpus, null,'','/')||lKorpus)) in  ( select fk_id from table(asu.pkg_areal.get_diapazon2(nvl(D.FC_RANGE,'1'))))
        OR
      lHouse||upper(trim(lKorpus)) in  ( select fk_id from table(asu.pkg_areal.get_diapazon2(nvl(D.FC_RANGE,'1'))))
   )
    AND
     lHouse||upper(trim(decode(lKorpus, null,'','/')||lKorpus)) NOT in  ( select fk_id from table(asu.pkg_areal.get_diapazon2(nvl(D.fc_antirange,'1000000'))))
--    NOT (','||UPPER(REPLACE(d.fc_antirange,' '))||',' LIKE '%,' || lHouse||upper(trim(lKorpus)) || ',%'))
--  )
  AND dn.fk_id=d.fk_district
  and ( dn.fk_typeid = pType2)
/*  and ((trim(fc_rooms) is  null) or (
                      (trim(fc_rooms) is not null) and  (lKVARTIRA
                         in (select fk_id from table(asu.pkg_areal.get_diapazon(asu.pkg_areal.cut_room(lHouse,  d.fc_rooms))))))

    )*/
  ;
  RETURN lDistrict;
 END;

BEGIN
 SELECT MAX(FK_KLADR), MAX(FC_HOUSE),
--- max(decode(FC_KORPUS, null,'','/')||FC_KORPUS),
 max(FC_KORPUS),
 max(FC_KVARTIRA) INTO lStreet, lHouse,lKorpus,lKVARTIRA FROM TADRESS WHERE FK_ID = pAdrID;
--    dbms_output.put_line(   lKorpus);
        pType2  :=pType;
      IF pType =-1 THEN
        pType2:=nAreal_TER;--asu.get_synid('THERAPIST_AREA');
      END IF ;

 IF (lStreet IS NULL) OR (lHouse IS NULL) THEN
  RETURN(-1);
 END IF;
   lDistrict := get_district;

 RETURN lDistrict;
 END;


FUNCTION  GET_DISTRICTNAME_BY_ID (pDistrictID IN TDISTRICT.FK_ID%TYPE,pWrite NUMBER default -1)
 RETURN TDISTRICT_NAME.FC_NAME%TYPE IS
 lDistrictName TDISTRICT_NAME.FC_NAME%TYPE;
BEGIN
 IF pDistrictID = -1 THEN
  RETURN

     (CASE WHEN  pWrite>0 THEN NULL else  /*decode(pWrite,-1,*/'Неполный адрес' end);
--  (/*decode(pWrite,-1,*/'Неполный адрес');
 END IF;
 IF NVL(pDistrictID, 0) = 0 THEN
  RETURN
  (CASE WHEN pWrite>0 THEN NULL else  /*decode(pWrite,-1,*/'Участок не определен' end);
  --(/*decode(pWrite,-1,*/'Участок не определен');
 END IF;
  --decode(pWrite,-1,'Участок не определен')
 SELECT NVL(MAX(DN.FC_NAME),
 (CASE when pWrite=-1 THEN 'Участок не определен'  end))
   INTO lDistrictName
   FROM TDISTRICT D, TDISTRICT_NAME DN
  WHERE D.FK_DISTRICT = DN.FK_ID
    AND D.FK_ID = pDistrictID;
 RETURN(lDistrictName);
END;

  FUNCTION  GET_AREAL_TYPE(pId NUMBER := - 137)
  RETURN VARCHAR2
  is
  BEGIN
  IF pId= nAreal_PED THEN   RETURN 'Педиатрический'; END IF;
  IF pId= nAreal_TER THEN   RETURN 'Терапевтический'; END IF;
  IF pId= nAreal_GYN THEN   RETURN 'Гинекологический'; END IF;
  IF pId= nAreal_sto THEN   RETURN 'Стоматологический'; END IF;
--  IF pId= nAreal_PED THEN   RETURN 'Педиатрический'; END IF;
   RETURN NULL;
  END;



 FUNCTION  isMySity(pId NUMBER := - 137)
  RETURN boolean
  is
  kolvo number;
  cursor ckolvo is
  select count(1)
  --into kolvo
    from asu.tkladr
where fk_id = pid
start with fk_id =
--asu.Get_Curr_City_Kladr_Id  --
nMySity
connect by prior fk_id = fk_owner;

  BEGIN
  open ckolvo;
  fetch ckolvo into kolvo;
  close  ckolvo;
--exception when others then
--return 1=0;

   RETURN nvl(kolvo,-1)>0;
  END;
-----------------------------------------------------------
 FUNCTION  GET_REGION_BY_ADR (pAdrID IN TADRESS.FK_ID%TYPE default null ,pPeplID IN TADRESS.fk_pacid%TYPE default null) RETURN varchar2 --ASU.TAREANAME.FC_NAME%TYPE
 is
 pStr varchar(2000);
 pfc_house varchar(10);
 pfc_korpus varchar(10);
 pfk_kladr number;
 pId number;
 pName varchar(2000);
 cursor cAddr is
  select a.fc_house,a.fc_korpus,a.fk_kladr  from asu.tadress a where fk_id = pAdrID;

 cursor cAddrPepl is
  select a.fc_house,a.fc_korpus,a.fk_kladr  from asu.tadress a where fk_pacid = pPeplID and a.fk_type = nCurrAdrType;


 begin
 if (pAdrID is not null ) then
 open caddr;
 fetch  caddr into pfc_house,pfc_korpus,pfk_kladr;
 close caddr;

 elsif (pPeplID is not null) then
  open cAddrPepl;
 fetch  cAddrPepl into pfc_house,pfc_korpus,pfk_kladr;
 close cAddrPepl;

 end if;


-- select a.fc_house,a.fc_korpus,a.fk_kladr into  pfc_house,pfc_korpus,pfk_kladr from asu.tadress a where fk_id = pAdrID;
if (nvl(pfk_kladr,-1)<1) then
return 'Адрес не КЛАДР';
end if;

if asu.pkg_areal.isMySity(pfk_kladr) then

begin
select an.fc_name||'(Из справочника)' into pStr  from asu.tareakladr ak,asu.tareaname an
  where
  ak.fk_kladrid = pfk_kladr and
  ak.fk_areanameid=an.fk_id and

   (  pfc_house||upper(trim(decode(pFC_Korpus, null,'','/')||pFC_Korpus)) in  ( select fk_id from table(asu.pkg_areal.get_diapazon2(nvl(ak.fc_dom||',$'||fc_dom1||'$,#'||fc_dom2||'#','1'))))
        OR
     pfc_house||upper(trim(pFC_Korpus)) in  ( select fk_id from table(asu.pkg_areal.get_diapazon2(nvl(ak.fc_dom||',$'||fc_dom1||'$,#'||fc_dom2||'#','1'))))
   )
    AND  pfc_house||upper(trim(decode(pFC_Korpus, null,'','/')||pFC_Korpus)) NOT in  ( select fk_id from table(asu.pkg_areal.get_diapazon2(nvl(ak.fc_domno,'1000000'))))
    ;
    exception when others then
    pstr:='Регион Н.Тагила не определён';
    end;




else

--select sys_connect_by_path(fc_name||' '||to_char(level),' - ') into pStr from asu.tkladr k start with fk_id = pfk_kladr connect by prior fk_owner=fk_id ;
begin
select  max(decode(prior fn_level,5,'', prior fc_name ||' ('|| prior fc_prefix||')')||fc_name ||' ('||fc_prefix||')') keep(dense_rank last order by level)   into pStr
 from asu.tkladr k
where
 level in (2,3)
 and
  fn_level not in (1)
start with fk_id = pfk_kladr
connect by prior fk_owner=fk_id ;
exception when others then
pstr := 'Не найден';
end;



end if;
return pstr;
 end;



---------------------------------------------------------------
BEGIN
nAreal_PED:= asu.get_synid('PEDIATR_AREA');
nAreal_GYN:= asu.get_synid('GYNEC_AREA');
nAreal_TER:= asu.get_synid('THERAPIST_AREA');
nAreal_sto:= asu.get_synid('DENTAL_AREA');
/*
946805  Типы участков               AREA_TYPE
946806  Терапевтический             THERAPIST_AREA
946807  Гинекологический            GYNEC_AREA
946808  Стоматологический           DENTAL_AREA
946809  Педиатрический              PEDIATR_AREA
946810  Причины выбытия с участка   AREA_REASON_TYPE

*/
select max(fk_id) into nMySity from asu.tkladr where fc_code = '6600002300000' and fl_del =0;
select max(fk_id) into nCurrAdrType from asu.TADRTYPE where fl_default = 1;
end;
/

SHOW ERRORS;


