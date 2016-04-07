DROP PACKAGE BODY ASU.PKG_URFUNCS
/

--
-- PKG_URFUNCS  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_URFUNCS" 
IS
--
-- Purpose: Function wich are used to calculate data in universal report
--
-- Wrote by Philip A. Milovanov
-- 22 august 2001
-- All functions which are added must have following arguments list:
--pFC_PERIOD IN VARCHAR - Where clause of FD_INS field
--pFK_ID IN NUMBER - Report ID
--pFN_COL - column number
--pFN_ROW - row number
--Followed parameters (all of them have type VARCHAR2) are not required, but if some of them there, then they must have following order:
-- 0 - FK_SMID clause
-- 1 - FL_AMB clause
-- 2 - FP_SEX clause
-- 3 - FN_AGE clause
-- all clauses connects due AND operator.
-- Example:
--FUNCTION SOME_FUNCTION(pFC_PERIOD IN VARCHAR2,pFK_ID IN NUMBER,pFN_COL IN NUMBER,pFN_ROW IN NUMBER,pFK_SMID IN VARCHAR2,pFL_AMB IN VARCHAR2,
--                       pFP_SEX IN VARCHAR2,pFN_AGE IN VARCHAR2 ) RETURN VARCHAR2
FUNCTION GET_NUMBER(pFC_PERIOD IN VARCHAR2,pFK_ID IN NUMBER,pFN_COL IN NUMBER,pFN_ROW IN NUMBER,pFN_NUMBER IN NUMBER) RETURN NUMBER IS
BEGIN
  RETURN pFN_NUMBER;
END;
FUNCTION GET_CELL(pFN_COL IN NUMBER,pFN_ROW IN NUMBER) RETURN NUMBER IS
BEGIN
  RETURN -1;
END;
FUNCTION GET_SMID(pFC_SMID IN VARCHAR2) RETURN VARCHAR2 IS
str VARCHAR2(3000);
str2 VARCHAR2(100);
BEGIN
  str:=pFC_SMID;
  LOOP
    EXIT WHEN LENGTH(str)=0;
    str2:='';
  END LOOP;
  RETURN str;
END;
FUNCTION GET_COUNT_ISSL(pFC_PERIOD IN VARCHAR2,pFK_ID IN NUMBER,pFN_COL IN NUMBER,pFN_ROW IN NUMBER,pFK_SMID IN VARCHAR2,
                        pFL_AMB IN VARCHAR2,pFP_SEX IN VARCHAR2,pFN_AGE IN VARCHAR2 )
                        RETURN NUMBER IS
  strSQL VARCHAR2 (3000);
  i NUMBER;
BEGIN
  strSQL:=  'SELECT /*+ rule*/ NVL(SUM (FN_SUM),0) '||
            '   FROM (SELECT SUM (fn_count * get_ed_from_SMID (FK_SMID) ) FN_SUM '||
            '           FROM (SELECT COUNT (fk_smid) fn_count, fk_smid '||
            '                   FROM (SELECT DISTINCT FK_SMID, FK_COLID, FK_NAZID '||
            '                           FROM VRESAN '||
            '                          WHERE FK_ID=FK_ID  '||
--            '                            :FD_DATE '||
            ' '||pFK_SMID||' '||
--            '                            :FL_AMB '||
            ' '||pFL_AMB||' '||
--            '                            :FP_SEX '||
            ' '||pFP_SEX||' '||
--            '                            :FN_AGE '||
            ' '||pFN_AGE||' '||
--            '                            :FK_SMID ) '||
            ' '||pFC_PERIOD||') '||
            '                  GROUP BY fk_smid) ) ';
/*   IF pFN_COL=5 AND pFN_ROW=3 THEN
    raise_application_error(-20002,strSQL);
   END IF;
*/
  EXECUTE IMMEDIATE strSQL INTO i;
  RETURN i;
END;
FUNCTION GET_OUTCOME(pFC_PERIOD IN VARCHAR2,pFK_ID IN NUMBER,pFN_COL IN NUMBER,pFN_ROW IN NUMBER,pFP_SEX IN VARCHAR2,pFN_AGE IN VARCHAR2) RETURN NUMBER IS
  strSQL VARCHAR2 (3000);
  i NUMBER;
BEGIN
  strSQL:='SELECT COUNT(FK_ID) FROM (SELECT TKARTA.FK_ID,FP_SEX,ROUND((SYSDATE-FD_ROJD)/365)FN_VOZR FROM TKARTA,TSROKY WHERE TKARTA.FK_ID=TSROKY.FK_PACID AND FK_PRYB=3 '||pFC_PERIOD||')';
  strSQL:=strSQL||' WHERE FK_ID=FK_ID '||pFP_SEX||' '||pFN_AGE;
  strSQL:=REPLACE(strSQL,'FD_INS','FD_DATA1');
  strSQL:=REPLACE(strSQL,'FD_OUT','FD_DATA1');
--  raise_application_error(-20002,strSQL);
  EXECUTE IMMEDIATE strSQL INTO i;
  RETURN i;
END;
FUNCTION GET_COUNT_ISSL_PAC(pFC_PERIOD IN VARCHAR2,pFK_ID IN NUMBER,pFN_COL IN NUMBER,pFN_ROW IN NUMBER,pFK_SMID IN VARCHAR2,
                        pFL_AMB IN VARCHAR2,pFP_SEX IN VARCHAR2,pFN_AGE IN VARCHAR2 )
                        RETURN NUMBER IS
  strSQL VARCHAR2 (3000);
  i NUMBER;
BEGIN
  strSQL:=  'SELECT COUNT(FK_PACID) FROM( SELECT DISTINCT FK_PACID,FK_NAPRID'||
            '                           FROM VRESAN '||
            '                          WHERE FK_ID=FK_ID '||
--            '                            :FD_DATE '||
            ' '||pFK_SMID||' '||
--            '                            :FL_AMB '||
            ' '||pFL_AMB||' '||
--            '                            :FP_SEX '||
            ' '||pFP_SEX||' '||
--            '                            :FN_AGE '||
            ' '||pFN_AGE||' '||
--            '                            :FK_SMID ) '||
            ' '||pFC_PERIOD||' )';
--  raise_application_error(-20002,strSQL);
  EXECUTE IMMEDIATE strSQL INTO i;
  RETURN i;
END;
FUNCTION GET_COUNT_ISSL_PATALOGY(pFC_PERIOD IN VARCHAR2,pFK_ID IN NUMBER,pFN_COL IN NUMBER,pFN_ROW IN NUMBER,pFK_SMID IN VARCHAR2,
                        pFL_AMB IN VARCHAR2,pFP_SEX IN VARCHAR2,pFN_AGE IN VARCHAR2 )
                        RETURN NUMBER IS
  strSQL VARCHAR2 (3000);
  i NUMBER;
BEGIN
  strSQL:=  'SELECT /*+ rule*/ NVL(SUM (FN_SUM),0) '||
            '   FROM (SELECT SUM (fn_count * get_ed_from_SMID (FK_SMID) ) FN_SUM '||
            '           FROM (SELECT COUNT (fk_smid) fn_count, fk_smid '||
            '                   FROM (SELECT DISTINCT FK_SMID, FK_COLID, FK_NAZID '||
            '                           FROM VRESAN,(select fk_id FK_VPAT from tpatname where fp_Prior>0) '||
            '                          WHERE FK_ID=FK_ID AND FK_PATID=FK_VPAT '||
--            '                            :FD_DATE '||
            ' '||pFK_SMID||' '||
--            '                            :FL_AMB '||
            ' '||pFL_AMB||' '||
--            '                            :FP_SEX '||
            ' '||pFP_SEX||' '||
--            '                            :FN_AGE '||
            ' '||pFN_AGE||' '||
--            '                            :FK_SMID ) '||
            ' '||pFC_PERIOD||') '||
            '                  GROUP BY fk_smid) ) ';
--  raise_application_error(-20002,strSQL);
  EXECUTE IMMEDIATE strSQL INTO i;
  RETURN i;
END;
FUNCTION GET_COUNT_ISSL_PATALOGY_PAC(pFC_PERIOD IN VARCHAR2,pFK_ID IN NUMBER,pFN_COL IN NUMBER,pFN_ROW IN NUMBER,pFK_SMID IN VARCHAR2,
                        pFL_AMB IN VARCHAR2,pFP_SEX IN VARCHAR2,pFN_AGE IN VARCHAR2 )
                        RETURN NUMBER IS
  strSQL VARCHAR2 (3000);
  i NUMBER;
BEGIN
  strSQL:=  'SELECT COUNT(FK_PACID) FROM (SELECT DISTINCT FK_PACID,FK_NAPRID '||
            '                           FROM VRESAN,(select fk_id FK_VPAT from tpatname where fp_Prior>0) '||
            '                          WHERE FK_ID=FK_ID AND FK_PATID=FK_VPAT '||
--            '                            :FD_DATE '||
            ' '||pFK_SMID||' '||
--            '                            :FL_AMB '||
            ' '||pFL_AMB||' '||
--            '                            :FP_SEX '||
            ' '||pFP_SEX||' '||
--            '                            :FN_AGE '||
            ' '||pFN_AGE||' '||
--            '                            :FK_SMID ) '||
            ' '||pFC_PERIOD||' )';
--  raise_application_error(-20002,strSQL);
  EXECUTE IMMEDIATE strSQL INTO i;
  RETURN i;
END;
FUNCTION GET_COUNT_PATALOGY_PAC_FIRST(pFC_PERIOD IN VARCHAR2,pFK_ID IN NUMBER,pFN_COL IN NUMBER,pFN_ROW IN NUMBER,pFK_SMID IN VARCHAR2,
                        pFL_AMB IN VARCHAR2,pFP_SEX IN VARCHAR2,pFN_AGE IN VARCHAR2 )
                        RETURN NUMBER IS
  strSQL VARCHAR2 (3000);
  i NUMBER;
BEGIN
  strSQL:=  'SELECT COUNT(FK_PACID) FROM (SELECT DISTINCT FK_PACID,FK_NAPRID '||
            '                           FROM VRESAN,(select fk_id FK_VPAT from tpatname where fp_Prior>0) '||
            '                          WHERE FK_ID=FK_ID AND FK_PATID=FK_VPAT AND FL_PATFIRST=1 '||
--            '                            :FD_DATE '||
            ' '||pFK_SMID||' '||
--            '                            :FL_AMB '||
            ' '||pFL_AMB||' '||
--            '                            :FP_SEX '||
            ' '||pFP_SEX||' '||
--            '                            :FN_AGE '||
            ' '||pFN_AGE||' '||
--            '                            :FK_SMID ) '||
            ' '||pFC_PERIOD||' )';
--  raise_application_error(-20002,strSQL);
  EXECUTE IMMEDIATE strSQL INTO i;
  RETURN i;
END;
FUNCTION GET_COUNT_PAC_POVTOR(pFC_PERIOD IN VARCHAR2,pFK_ID IN NUMBER,pFN_COL IN NUMBER,pFN_ROW IN NUMBER,pFK_SMID IN VARCHAR2,
                        pFL_AMB IN VARCHAR2,pFP_SEX IN VARCHAR2,pFN_AGE IN VARCHAR2 )
                        RETURN NUMBER IS
  strSQL VARCHAR2 (3000);
  i NUMBER;
BEGIN
    strSQL  := 'select /*+ rule*/count(*) from (select distinct fk_pacid,fk_naprid '||
                 '    from ( '||
                 '           select count(fk_smid) fn_count,fk_pacid,fk_naprid,fk_smid,fk_colid '||
                 '              from vresan,( '||
                 '                select distinct fk_pacid fk_vpacid, fk_naprid fk_vnaprid '||
                 '                   from vresan '||
                 '                   where FK_ID=FK_ID '||
                 ' '||pFK_SMID||' '||
                 ' '||pFL_AMB||' '||
                 ' '||pFP_SEX||' '||
                 ' '||pFN_AGE||' '||
                 ' '||pFC_PERIOD||' ) '||
                 '               where fk_pacid=fk_vpacid and fk_naprid=fk_vnaprid '||
                 ' '||pFK_SMID||' '||
                 ' '||pFL_AMB||' '||
                 ' '||pFP_SEX||' '||
                 ' '||pFN_AGE||' '||
                 '               group by fk_pacid,fk_naprid,fk_smid,fk_colid) '||
                 '    where '||
                 'fn_count>1)';
--  raise_application_error(-20002,strSQL);
  EXECUTE IMMEDIATE strSQL INTO i;
  RETURN i;
END;
FUNCTION GET_COUNT_PAC_POVTOR_PATOLOGY(pFC_PERIOD IN VARCHAR2,pFK_ID IN NUMBER,pFN_COL IN NUMBER,pFN_ROW IN NUMBER,pFK_SMID IN VARCHAR2,
                        pFL_AMB IN VARCHAR2,pFP_SEX IN VARCHAR2,pFN_AGE IN VARCHAR2 )
                        RETURN NUMBER IS
  strSQL VARCHAR2 (3000);
  i NUMBER;
BEGIN
    strSQL  := 'select /*+ rule*/count(*) from (select distinct fk_pacid,fk_naprid '||
                 '    from ( '||
                 '           select count(fk_smid) fn_count,fk_pacid,fk_naprid,fk_smid,fk_colid '||
                 '              from vresan,TPATNAME,( '||
                 '                select distinct fk_pacid fk_vpacid, fk_naprid fk_vnaprid '||
                 '                   from vresan '||
                 '                   where FK_ID=FK_ID '||
                 ' '||pFK_SMID||' '||
                 ' '||pFL_AMB||' '||
                 ' '||pFP_SEX||' '||
                 ' '||pFN_AGE||' '||
                 ' '||pFC_PERIOD||' ) '||
                 '               where tpatname.fk_id=fk_patid and fp_prior>0 AND fk_pacid=fk_vpacid and fk_naprid=fk_vnaprid '||
                 ' '||pFK_SMID||' '||
                 ' '||pFL_AMB||' '||
                 ' '||pFP_SEX||' '||
                 ' '||pFN_AGE||' '||
                 '               group by fk_pacid,fk_naprid,fk_smid,fk_colid) '||
                 '    where '||
                 'fn_count>1)';
--  raise_application_error(-20002,strSQL);
  EXECUTE IMMEDIATE strSQL INTO i;
  RETURN i;
END;
FUNCTION GET_COUNT_ISSL_POVTOR(pFC_PERIOD IN VARCHAR2,pFK_ID IN NUMBER,pFN_COL IN NUMBER,pFN_ROW IN NUMBER,pFK_SMID IN VARCHAR2,
                        pFL_AMB IN VARCHAR2,pFP_SEX IN VARCHAR2,pFN_AGE IN VARCHAR2 )
                        RETURN NUMBER IS
  strSQL VARCHAR2 (3000);
  i NUMBER;
BEGIN
  strSQL:=  'SELECT SUM(FN_COUNT-1) FROM '||
            '(SELECT COUNT(FK_PACID) FN_COUNT,FK_SMID,FK_PACID FROM '||
            '(SELECT DISTINCT FK_SMID, FK_COLID, FK_NAZID,FK_PACID FROM VRESAN,(SELECT FK_ID FK_VPAT FROM TPATNAME WHERE FP_PRIOR=0) '||
            'WHERE FK_ID=FK_ID AND FK_PATID=FK_VPAT '||
            ' '||pFK_SMID||' '||
            ' '||pFL_AMB||' '||
            ' '||pFP_SEX||' '||
            ' '||pFN_AGE||' '||
            ' '||pFC_PERIOD||' ) '||
            'GROUP BY FK_SMID,FK_PACID) WHERE FN_COUNT>1 ';
--  raise_application_error(-20002,strSQL);
  EXECUTE IMMEDIATE strSQL INTO i;
  RETURN i;
END;
FUNCTION GET_COUNT_PAC_GOOD_DYN(pFC_PERIOD IN VARCHAR2,pFK_ID IN NUMBER,pFN_COL IN NUMBER,pFN_ROW IN NUMBER,pFK_SMID IN VARCHAR2,
                        pFL_AMB IN VARCHAR2,pFP_SEX IN VARCHAR2,pFN_AGE IN VARCHAR2 )
                        RETURN NUMBER IS
  strSQL VARCHAR2 (3000);
  i NUMBER;
BEGIN
    strSQL  := 'select /*+ rule*/count(*) from (select distinct fk_pacid,fk_naprid '||
                 '    from ( '||
                 '           select count(fk_smid) fn_count,fk_pacid,fk_naprid,fk_smid,fk_colid '||
                 '              from vresan,tpatname,( '||
                 '                select distinct fk_pacid fk_vpacid, fk_naprid fk_vnaprid '||
                 '                   from vresan '||
                 '                   where FK_ID=FK_ID'||
            ' '||pFK_SMID||' '||
            ' '||pFL_AMB||' '||
            ' '||pFP_SEX||' '||
            ' '||pFN_AGE||' '||
            ' '||pFC_PERIOD||' ) '||
                 '               where tpatname.fk_id=fk_patid and fp_prior>0 and fk_pacid=fk_vpacid and fk_naprid=fk_vnaprid '||
            ' '||pFK_SMID||' '||
            ' '||pFL_AMB||' '||
            ' '||pFP_SEX||' '||
            ' '||pFN_AGE||' '||
                 '               group by fk_pacid,fk_naprid,fk_smid,fk_colid) '||
                 '    where '||
                 'fn_count>1 and GET_GOOD_DINAMIC_UNIVERSAL (FK_PACID, FK_SMID, FK_COLID) = 1)';
/*  strSQL:=  'SELECT COUNT (DISTINCT FK_PACID) FROM '||
            '(SELECT COUNT(FK_PACID) FN_COUNT,FK_SMID,FK_PACID FROM '||
            '(SELECT DISTINCT FK_SMID, FK_COLID, FK_NAZID,FK_PACID FROM VRESAN,(SELECT FK_ID FK_VPAT FROM TPATNAME WHERE FP_PRIOR=0) '||
            'WHERE FK_ID=FK_ID AND FK_PATID=FK_VPAT '||
            ' '||pFK_SMID||' '||
            ' '||pFL_AMB||' '||
            ' '||pFP_SEX||' '||
            ' '||pFN_AGE||' '||
            ' '||pFC_PERIOD||' AND GET_GOOD_DYN_LAB(FK_NAZID,FK_PACID,FD_INS,FK_SMID,FK_COLID)=1 ) '||
            'GROUP BY FK_SMID,FK_PACID) WHERE FN_COUNT>1 ';
*/
--  raise_application_error(-20002,strSQL);
  EXECUTE IMMEDIATE strSQL INTO i;
  RETURN i;
END;
--GET_GOOD_DYN_LAB (pFK_NAZID IN NUMBER, pFK_PACID IN NUMBER, pFD_INS IN DATE, pFK_SMID IN NUMBER,pFK_COLID IN NUMBER)
END; -- Package Body PKG_URFUNCS
/

SHOW ERRORS;


