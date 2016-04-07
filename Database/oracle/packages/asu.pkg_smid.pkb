DROP PACKAGE BODY ASU.PKG_SMID
/

--
-- PKG_SMID  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_SMID" IS
  PROCEDURE DO_MOVE_COPY_LEVEL (pFK_ID IN NUMBER, pFK_NEWOWNER IN NUMBER, pFL_MOVE IN NUMBER) IS
    PRAGMA AUTONOMOUS_TRANSACTION;

    CURSOR cColNames IS
      SELECT DISTINCT column_name
        FROM all_col_comments
       WHERE table_name = 'TSMID'
         AND COLUMN_NAME NOT IN ('FC_SYNONIM', 'FK_OWNER','FK_ID');
    TYPE tDNumber IS RECORD (NEWOWNER NUMBER,OLDOWNER NUMBER);
    type TStack IS TABLE OF TDNumber INDEX BY BINARY_INTEGER;
    aStack TStack;
    strCols VARCHAR2(4000);
    CURSOR cIDS IS SELECT/*+index_asc (TSMID TSMID_BY_OWNER_ORDER)*/
         fk_id, fk_owner
        FROM tsmid
       START WITH fk_id = pFK_ID
      CONNECT BY PRIOR fk_id = fk_owner;
    strSQL VARCHAR2(4000);
    i NUMBER;
    lOwner NUMBER;
    bFound BOOLEAN;
  BEGIN
    IF pFL_MOVE = 1 THEN
      UPDATE TSMID
         SET FK_OWNER = pFK_NEWOWNER
       WHERE FK_ID = pFK_ID;
    ELSE
      FOR p IN cColNames LOOP
        IF cColNames%ROWCOUNT=1 THEN
          strCols:=' '||p.COLUMN_NAME;
        ELSE
          strCols:=strCols||','||p.COLUMN_NAME||' ';
        END IF;
      END LOOP;
      i:=pFK_NEWOWNER;
      strSQl:='BEGIN INSERT INTO TSMID ( '||strCols||' ,FK_OWNER) SELECT '||strCols||' ,:FK_OWNER FROM TSMID WHERE FK_ID=:FK_ID; SELECT SEQ_TSMID.CURRVAL INTO :RETID FROM DUAL; END;';
      FOR p IN cIDS LOOP
        IF cIDS%ROWCOUNT=1 THEN
          aStack(1).NEWOWNER:=pFK_NEWOWNER;
          lOwner:=p.FK_OWNER;
          aStack(1).OLDOWNER:=p.FK_OWNER;
        END IF;

        IF p.FK_OWNER<>lOwner THEN
          bFound:=FALSE;
          FOR j IN aStack.FIRST..aStack.LAST LOOP
            IF aStack(j).OLDOWNER=p.FK_OWNER THEN
              aStack.DELETE(j+1,aStack.LAST);
              bFound:=TRUE;
              EXIT;
            END IF;
          END LOOP;
          IF NOT bFound THEN
            aStack(aStack.LAST+1).NEWOWNER:=i;
                aStack(aStack.LAST).OLDOWNER:=p.FK_OWNER;
          END IF;

        END IF;
        EXECUTE IMMEDIATE strSQl USING aStack(aStack.LAST).NEWOWNER,p.FK_ID,OUT i;
        lOwner:=p.FK_OWNER;
      END LOOP;
    END IF;

    COMMIT;
    DO_REARRANGE_ROWS (pFK_NEWOWNER, 0, 0);
  END;

  PROCEDURE DO_REARRANGE_ROWS (pFK_OWNER IN NUMBER, pFN_REQNUM IN NUMBER, pFL_RESERVE IN NUMBER) IS
    CURSOR c IS
      SELECT FK_ID
        FROM TSMID
       WHERE FK_OWNER = pFK_OWNER
       ORDER BY FN_ORDER;

    PRAGMA AUTONOMOUS_TRANSACTION;
    i NUMBER;
  BEGIN
  /*
    IF pFL_RESERVE = 1 THEN
      UPDATE TSMID
         SET FN_ORDER = FN_ORDER + 1
       WHERE FN_ORDER >= pFN_REQNUM
         AND FK_OWNER = pFK_OWNER;
    ELSE
      FOR p IN c LOOP
        i  := c%ROWCOUNT;
        UPDATE TSMID
           SET FN_ORDER = i
         WHERE FK_ID = p.FK_ID;
      END LOOP;
    END IF;

    COMMIT;
  */

  NULL;

  END;

  PROCEDURE DO_SET_ROW_NUM (pFK_ID IN NUMBER, pFN_REQNUM IN NUMBER) IS
    PRAGMA AUTONOMOUS_TRANSACTION;
  BEGIN
    UPDATE TSMID
       SET FN_ORDER = pFN_REQNUM
     WHERE FK_ID = pFK_ID;

    COMMIT;
  END;

  PROCEDURE WRITE_ANAL (pFK_ID IN NUMBER, pFK_OWNER IN NUMBER, pFC_NAME IN VARCHAR2, pFC_ED_IZM IN VARCHAR2, pFC_SYNONIM IN VARCHAR2, pFN_ORDER IN NUMBER, pFC_TYPE IN VARCHAR2, pFN_LOW_M IN VARCHAR2,
    pFN_HI_M IN VARCHAR2, pFN_LOW_W IN VARCHAR2, pFN_HI_W IN VARCHAR2, pFL_SHOWANAL IN NUMBER, pFP_PAT IN NUMBER, pFC_TIME IN NUMBER, pFK_DEFAULT IN NUMBER, pFK_CLASS IN NUMBER,
    pFK_LOINC_CODE IN NUMBER, pFN_COST1 IN VARCHAR2, pFN_COST2 IN VARCHAR2, pFN_COST3 IN VARCHAR2, pFP_INOUT IN NUMBER, pFL_STAT IN NUMBER, pFC_SHORT IN VARCHAR2, pFN_ED IN NUMBER,
    pFC_ANSWER IN VARCHAR2, pFP_BOLD IN NUMBER DEFAULT 0) IS
    CURSOR c (pID NUMBER) IS
      SELECT COUNT (FK_ID)
        FROM TSMID
       WHERE FK_ID = pID;

    n NUMBER;
    new_fk_id NUMBER;
    PRAGMA AUTONOMOUS_TRANSACTION;
  BEGIN
    DO_REARRANGE_ROWS (pFK_OWNER, pFN_ORDER, 1);
    OPEN c (pFK_ID);
    FETCH c INTO n;
    CLOSE c;

    IF n = 0 THEN
      INSERT INTO TSMID
                  (
                    FK_ID,
                    FK_OWNER,
                    FC_NAME,
                    FC_ED_IZM,
                    FC_SYNONIM,
                    FN_ORDER,
                    FC_TYPE,
                    FN_LOW_M,
                    FN_HI_M,
                    FN_LOW_W,
                    FN_HI_W,
                    FL_SHOWANAL,
                    FP_PAT,
                    FC_TIME,
                    FK_DEFAULT,
                    FK_CLASS,
                    FK_LOINC_CODE,
                    FN_COST1,
                    FN_COST2,
                    FN_COST3,
                    FP_INOUT,
                    FL_STAT,
                    FK_MKB9,
                    FN_ED
                  )
           VALUES (
             pFK_ID,
             pFK_OWNER,
             pFC_NAME,
             pFC_ED_IZM,
             pFC_SYNONIM,
             pFN_ORDER,
             pFC_TYPE,
             pFN_LOW_M,
             pFN_HI_M,
             pFN_LOW_W,
             pFN_HI_W,
             pFL_SHOWANAL,
             pFP_PAT,
             pFC_TIME,
             pFK_DEFAULT,
             pFK_CLASS,
             pFK_LOINC_CODE,
             pFN_COST1,
             pFN_COST2,
             pFN_COST3,
             pFP_INOUT,
             pFL_STAT,
             pFC_SHORT,
             pFN_ED
           ) RETURNING fk_id INTO new_fk_id;
      set_bold(new_fk_id,pfp_bold);
    ELSE
      UPDATE TSMID
         SET FL_STAT = pFL_STAT,
             FC_NAME = pFC_NAME,
             FC_ED_IZM = pFC_ED_IZM,
             FC_SYNONIM = pFC_SYNONIM,
             FN_ORDER = pFN_ORDER,
             FC_TYPE = pFC_TYPE,
             FN_LOW_M = pFN_LOW_M,
             FN_HI_M = pFN_HI_M,
             FN_LOW_W = pFN_LOW_W,
             FN_HI_W = pFN_HI_W,
             FL_SHOWANAL = pFL_SHOWANAL,
             FP_PAT = pFP_PAT,
             FC_TIME = pFC_TIME,
             FK_DEFAULT = pFK_DEFAULT,
             FK_CLASS = pFK_CLASS,
             FK_LOINC_CODE = pFK_LOINC_CODE,
             FN_COST1 = pFN_COST1,
             FN_COST2 = pFN_COST2,
             FN_COST3 = pFN_COST3,
             FP_INOUT = pFP_INOUT,
             FK_MKB9 = pFC_SHORT,
             FN_ED = pFN_ED,
             FC_ANSWER = pFC_ANSWER
       WHERE FK_ID = pFK_ID;
       set_bold(pfk_id,pfp_bold);
    END IF;

    COMMIT;
    DO_REARRANGE_ROWS (pFK_OWNER, pFN_ORDER, 0);
  END;
  PROCEDURE DELETE_VALUE (pFK_ID IN NUMBER) IS
    PRAGMA AUTONOMOUS_TRANSACTION;

    CURSOR c IS
      SELECT FK_OWNER
        FROM TSMID
       WHERE FK_ID = pFK_ID;

    i NUMBER;
  BEGIN
    OPEN c;
    FETCH c INTO i;
    CLOSE c;

    DELETE
      FROM TSMID
     WHERE FK_ID IN (SELECT FK_ID
                       FROM TSMID
                      START WITH FK_ID = pFK_ID
                     CONNECT BY PRIOR FK_ID = FK_OWNER);

    COMMIT;
    DO_REARRANGE_ROWS (i, 0, 0);
  END;
  PROCEDURE ADD_ROOTVALUE (pFC_NAME IN VARCHAR2, pFC_SYNONYM IN VARCHAR2, pFK_OWNER IN NUMBER := 0) IS
  BEGIN
    UPDATE TSMID
       SET FC_SYNONIM = ''
     WHERE FC_SYNONIM = pFC_SYNONYM;

    INSERT INTO TSMID
                (FC_NAME, FC_SYNONIM, FK_OWNER)
         VALUES (pFC_NAME, pFC_SYNONYM, pFK_OWNER);
  END;
  PROCEDURE SET_SYNONYM (pFK_ID IN NUMBER, pFC_SYNONYM IN VARCHAR2) IS
  BEGIN
    UPDATE TSMID
       SET FC_SYNONIM = ''
     WHERE FC_SYNONIM = pFC_SYNONYM;

    UPDATE TSMID
       SET FC_SYNONIM = pFC_SYNONYM
     WHERE FK_ID = pFK_ID;
  END;

  PROCEDURE DO_WRITE_DIAG (pFK_ID IN NUMBER, pFK_OWNER IN NUMBER, pFC_NAME IN VARCHAR2, pFK_DEFAULT IN NUMBER, pFN_ORDER IN NUMBER, pFP_PAT IN NUMBER, pFL_SHOWANAL IN NUMBER, pFK_MKB9 IN VARCHAR2,
    pFK_MKB10 IN VARCHAR2, pFC_SYNONYM IN VARCHAR2,pFC_ANSWER IN VARCHAR2 ) IS
    PRAGMA AUTONOMOUS_TRANSACTION;

    CURSOR c (pID NUMBER) IS
      SELECT FK_ID
        FROM TSMID
       WHERE FK_ID = pID;

    i NUMBER;
  BEGIN
    DO_REARRANGE_ROWS (pFK_OWNER, pFN_ORDER, 1);
    OPEN c (pFK_ID);
    FETCH c INTO i;

    IF c%NOTFOUND THEN
      INSERT INTO TSMID
                  (FK_ID, FK_OWNER, FC_NAME, FK_DEFAULT, FN_ORDER, FP_PAT, FL_SHOWANAL, FK_MKB9, FK_MKB10, FC_SYNONIM,FC_ANSWER)
           VALUES (pFK_ID, pFK_OWNER, pFC_NAME, pFK_DEFAULT, pFN_ORDER, pFP_PAT, pFL_SHOWANAL, pFK_MKB9, pFK_MKB10, pFC_SYNONYM,pFC_ANSWER);
    ELSE
      UPDATE TSMID
         SET FK_OWNER = pFK_OWNER,
             FC_NAME = pFC_NAME,
             FK_DEFAULT = pFK_DEFAULT,
             FN_ORDER = pFN_ORDER,
             FP_PAT = pFP_PAT,
             FL_SHOWANAL = pFL_SHOWANAL,
             FK_MKB9 = pFK_MKB9,
             FK_MKB10 = pFK_MKB10,
             FC_SYNONIM = pFC_SYNONYM,
             FC_ANSWER=pFC_ANSWER
       WHERE FK_ID = pFK_ID;
    END IF;

    CLOSE c;
    COMMIT;
    DO_REARRANGE_ROWS (pFK_OWNER, pFN_ORDER, 0);
  END;

  FUNCTION MAKE_DIAGS_LIST
    RETURN NUMBER IS
    CURSOR cGroup IS
      SELECT FK_ID, LPAD (FC_NAME, LENGTH (FC_NAME) + 2 * LEVEL) FC_NAME
        FROM tsmid
       START WITH fk_owner = 2872
      CONNECT BY PRIOR fk_id = fk_owner;

    CURSOR cDiag (pD NUMBER) IS
      SELECT FK_ID, FC_NAME, FK_MKB10
        FROM tsmid
       WHERE FK_OWNER = 2241
         AND FK_DEFAULT = pD;

    CURSOR cSubDiag (pD NUMBER) IS
      SELECT FC_NAME, FK_MKB10
        FROM tsmid
       WHERE FK_OWNER = pD;

    CURSOR cCSubDiag (pD NUMBER) IS
      SELECT COUNT (FK_ID)
        FROM tsmid
       WHERE FK_OWNER = pD;

    cC CLOB;
    nC NUMBER;
    str VARCHAR2 (4000);
    i NUMBER;
  BEGIN
    INSERT INTO TCLOBS
                (FC_CLOB)
         VALUES (EMPTY_CLOB () )
      RETURNING FK_ID, FC_CLOB
      INTO nC, cC;

    DBMS_LOB.OPEN (cC, DBMS_LOB.LOB_READWRITE);
    str  := '<html><head><meta http-equiv="Content-Type" content="text/html; charset=windows-1251"></head>' || CHR (13);
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

    FOR P IN cGroup LOOP
      str  := '<P ALIGN="CENTER"><FONT SIZE="+2"><B>' || p.FC_NAME || '</B></FONT><BR>' || CHR (13);
      DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
      str  := '<table align="center" width="100%" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bordercolor="#FFFFFF" bgcolor="#FFFFFF" cellpadding="0" cellspacing="0">' || CHR (13);
      DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
      str  := '<TR ALIGN="CENTER"><TD><B>Диагноз:</B></TD><TD><B>Поддиагноз:</B></TD><TD><B>МКБ-X:</B></TD></TR>' || CHR (13);
      DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

      FOR n IN cDiag (p.FK_ID) LOOP
        OPEN cCSubDiag (n.FK_ID);
        FETCH cCSubDiag INTO i;
        CLOSE cCSubDiag;
        str  := '<TR><TD ROWSPAN="' || (i + 1) || '"><B>' || n.FC_NAME || '&nbsp;</B></TD><TD>&nbsp;</TD><TD>' || n.FK_MKB10 || '&nbsp;</TD></TR>' || CHR (13);
        DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

        FOR z IN cSubDiag (n.FK_ID) LOOP
          str  := '<TR><TD>' || z.FC_NAME || '&nbsp;</TD><TD>' || z.FK_MKB10 || '&nbsp;</TD></TR>' || CHR (13);
          DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
        END LOOP;
      END LOOP;

      str  := '</P></TABLE>' || CHR (13);
      DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    END LOOP;

    str  := '</BODY></HTML>' || CHR (13);
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    DBMS_LOB.CLOSE (cC);
    RETURN nC;
  END;

  PROCEDURE DO_WRITE_NORM(pFK_ID IN NUMBER,pFK_SMID IN NUMBER,pFN_YEAR1 IN NUMBER,pFN_YEAR2 IN NUMBER,pFN_LOW_M IN NUMBER,pFN_HI_M IN NUMBER,pFN_LOW_W IN NUMBER,pFN_HI_W IN NUMBER) IS
  BEGIN
    IF pFK_ID=-1 THEN
      INSERT INTO TSMIDNORMS(FK_SMID,FN_YEAR1,FN_YEAR2,FN_LOW_M,FN_HI_M,FN_LOW_W,FN_HI_W) VALUES (pFK_SMID,pFN_YEAR1,pFN_YEAR2,pFN_LOW_M,pFN_HI_M,pFN_LOW_W,pFN_HI_W);
    ELSE
      UPDATE TSMIDNORMS SET FN_YEAR1=pFN_YEAR1,FN_YEAR2=pFN_YEAR2,FN_LOW_M=pFN_LOW_M,FN_HI_M=pFN_HI_M,FN_LOW_W=pFN_LOW_W,FN_HI_W=pFN_HI_W WHERE FK_ID=pFK_ID;
    END IF;
  END;

  PROCEDURE DO_DELETE_NORM(pFK_ID IN NUMBER) IS
  BEGIN
    DELETE FROM TSMIDNORMS WHERE FK_ID=pFK_ID;
  END;

  function get_edchild(pFK_ID in number) return number
  is
    nRes number:=0.0;
    cursor c(pID in number) is select FN_EDCHILD from tsmid where fk_id=pID;
  begin
    open c(pFK_ID);
    fetch c into nRes;
    close c;
    return nRes;
  end;

  function get_ed(pFK_ID in number) return number
  is
    nRes number:=0.0;
    cursor c(pID in number) is select FN_ED from tsmid where fk_id=pID;
  begin
    open c(pFK_ID);
    fetch c into nRes;
    close c;
    return nRes;
  end;
--------------------------------------------------------------------------------

FUNCTION get_bold(pfk_id IN NUMBER) RETURN NUMBER IS
    r  NUMBER := 0;
    CURSOR c IS
        SELECT fp_bold FROM tsmidlab WHERE fk_id=pfk_id;
BEGIN
    OPEN c;
    FETCH c INTO r;
    CLOSE c;
    RETURN r;
END;

PROCEDURE set_bold(pfk_id IN NUMBER, pfp_bold NUMBER) IS
    CURSOR c IS
        SELECT COUNT(*) FROM tsmidlab WHERE fk_id=pfk_id;
    n   NUMBER;
BEGIN
    OPEN c;
    FETCH c INTO n;
    CLOSE c;
    IF n=0 THEN
        INSERT INTO tsmidlab(fk_id, fp_bold) VALUES (pfk_id, pfp_bold);
    ELSE
        UPDATE tsmidlab SET fp_bold=pfp_bold WHERE fk_id = pfk_id;
    END IF;
END;
--------------------------------------------------------------------------------
-- Возвращает FK_ID самого верхнего уровня длл переданного FK_ID
-- Author: Ura

FUNCTION getrootlevelid (p_fk_id IN INTEGER)
  RETURN INTEGER
AS
  v_ret   INTEGER;
BEGIN
  SELECT     ss.fk_id
        INTO v_ret
        FROM tsmid ss
       WHERE LEVEL = (SELECT     MAX (LEVEL)
                            FROM tsmid s
                      CONNECT BY s.fk_id = PRIOR s.fk_owner
                      START WITH s.fk_id = p_fk_id)
  CONNECT BY ss.fk_id = PRIOR ss.fk_owner
  START WITH ss.fk_id = p_fk_id;

  RETURN v_ret;
END;                                                           --GetRootLeveID

--------------------------------------------------------------------------------
-- Возвращает FK_ID раздела для переданного FK_ID
-- Используется алгоритм определния раздела с помщью TCONST
-- Author: Ura
function GetRootLevelID1(p_FK_ID in Integer) return integer
as
  v_Ret Integer;
begin
  SELECT S.FK_ID into v_Ret
    FROM  TSMID S
   WHERE
    S.fk_id IN (SELECT FN_CONST FROM TCONST WHERE FC_FUNC LIKE 'RAZDEL_%')
  CONNECT BY   S.FK_ID= PRIOR S.fk_owner
  START WITH  S.fk_ID=p_FK_ID;
  Return v_Ret;
end;--GetRootLeveID1
--------------------------------------------------------------------------------
-- Возвращает НАЗВАНИЕ Раздела по FK_ID
-- Используется алгоритм определния раздела с помщью TCONST
-- Author: Ura
/* Formatted on 2004/11/09 10:50 (Formatter Plus v4.8.0) */
FUNCTION getrootlevelname1 (p_fk_id IN INTEGER)
  RETURN VARCHAR2
AS
  v_ret   VARCHAR2 (150);
BEGIN
  SELECT     s.fc_name
        INTO v_ret
        FROM tsmid s
       WHERE s.fk_id IN (SELECT fn_const
                           FROM tconst
                          WHERE fc_func LIKE 'RAZDEL_%')
  CONNECT BY s.fk_id = PRIOR s.fk_owner
  START WITH s.fk_id = p_fk_id;

  RETURN v_ret;
END;                                                       --GetRootLevelName1
--------------------------------------------------------------------------------
-- Возвращает Название самого верхнего уровня для переданного FK_ID
-- Author: Ura
FUNCTION getrootlevelname (p_fk_id IN INTEGER)
   RETURN VARCHAR
AS
   v_ret   VARCHAR2 (150);
BEGIN
   SELECT     ss.fc_name
         INTO v_ret
         FROM tsmid ss
        WHERE LEVEL = (SELECT     MAX (LEVEL)
                             FROM tsmid s
                       CONNECT BY s.fk_id = PRIOR s.fk_owner
                       START WITH s.fk_id = p_fk_id)
   CONNECT BY ss.fk_id = PRIOR ss.fk_owner
   START WITH ss.fk_id = p_fk_id;

   RETURN v_ret;
END; --GetRootLevelName

--------------------------------------------------------------------------------
FUNCTION is_childpresent (p_fk_smid IN INTEGER, p_string_of_num VARCHAR)
   RETURN BOOLEAN
AS
   v_lev   INTEGER;
BEGIN
   EXECUTE IMMEDIATE    'SELECT    MAX (LEVEL)
                          FROM tsmid ss
                         WHERE fk_id = '
                     || TO_CHAR (p_fk_smid)
                     || ' CONNECT BY ss.fk_id = PRIOR ss.fk_owner
                    START WITH ss.fk_id IN ('
                     || p_string_of_num
                     || ')'
                INTO v_lev;

   IF v_lev > 1
   THEN
      RETURN TRUE;
   ELSE
      RETURN FALSE;
   END IF;
END is_childpresent;
--------------------------------------------------------------------------------
-- Возвращает количесвто детей для процедуры  Get_ShortValuesStrig
FUNCTION get_childcountwithoutparent (
   p_fk_smid         IN   INTEGER,
   p_string_of_num        VARCHAR
)
   RETURN INTEGER
AS
   v_ret   INTEGER;
   v_SQL VARCHAR(4000);
BEGIN
  v_SQL:='SELECT   Count( SS.fk_id) FROM tsmid ss
      WHERE LEVEL < (SELECT     MAX (LEVEL)
                           FROM tsmid ss
                          WHERE fk_id = '|| TO_CHAR (p_fk_smid)
                         || ' CONNECT BY ss.fk_id = PRIOR ss.fk_owner
                      START WITH ss.fk_id IN (' || p_string_of_num || '))
                      AND FK_OWNER='|| TO_CHAR (p_fk_smid)|| ' AND LEVEL=1 '
                      || ' CONNECT BY ss.fk_id = PRIOR ss.fk_owner
                       START WITH ss.fk_id IN ('|| p_string_of_num|| ')';
--    plvprs.display_wrap(v_SQL);
   EXECUTE IMMEDIATE  v_SQL  INTO v_ret;

   RETURN v_ret;
END get_childcountwithoutparent;

--------------------------------------------------------------------------------

-- Возвращает сторку с названиями разделом пречисленных в строке p_String_OF_NUM
-- При этом не происходит подеъема выше уровня p_FK_SMID
--  в строке p_String_OF_NUM разделителем являестя ;
-- Notes
--  Используется динамический SQL, что может быть потенциальным торомозом,
--  но из-за испоьзования конструкции IN передалть на параметры не получается
--   "Return Value" := pkg_smid.get_shortvaluesstrig(1258,'31853,31855');
--

FUNCTION Get_ShortValuesStrig(p_FK_SMID IN INTEGER, p_String_OF_NUM VARCHAR)
RETURN VARCHAR
AS
  TYPE cv_type IS REF CURSOR;
  cv cv_type;

  v_fk_id INTEGER;
  v_parent INTEGER;
  v_name VARCHAR(4000);
  v_res VARCHAR2(4000);
  v_child_Count INTEGER;
  v_SQL VARCHAR(2000);
BEGIN


--1. для нашего уоровня находим все уникальные FK_ID
--2. Выдодим его имя
--3. Если есть дети, то входим в рекурсию для выдода детей

  v_SQL:='SELECT distinct  SS.fk_id'
         || ' FROM tsmid ss'
         ||' WHERE LEVEL < (SELECT     MAX (LEVEL) AS level1'
                         || ' FROM tsmid ss '
                         ||' WHERE fk_id = '||TO_CHAR(p_FK_SMID)
                    ||' CONNECT BY ss.fk_id = PRIOR ss.fk_owner'
                    ||' START WITH ss.fk_id IN ('|| p_String_OF_NUM ||'))'
           ||' AND FK_OWNER='||TO_CHAR(p_FK_SMID)
    ||' CONNECT BY ss.fk_id = PRIOR ss.fk_owner'
    ||' START WITH ss.fk_id IN ('|| p_String_OF_NUM ||')';
--    plvprs.display_wrap(v_SQL);

    OPEN cv FOR v_SQL;
    LOOP
      FETCH cv into v_fk_id;
      EXIT WHEN cv%NOTFOUND;

       -- имя
        SELECT SS.fc_name INTO v_name
          FROM TSMID SS
         WHERE SS.fk_id=v_fk_id;
        if  not (v_res  is Null) then
          v_res:=v_res||', ';
        end if;
        v_res:=v_res||v_name;
        if is_childpresent(v_fk_id,p_String_OF_NUM) then
          v_child_Count:=get_childcountwithoutparent(v_fk_id,p_String_OF_NUM);
          IF v_child_Count>1 THEN
            -- детей много
            v_res:=v_res||'[';
            v_res:=v_res||Get_ShortValuesStrig(v_fk_id,p_String_OF_NUM); -- рекурсия!!!
            v_res:=v_res||']';
          ELSE -- одно дите
            v_res:=v_res||' '||Get_ShortValuesStrig(v_fk_id,p_String_OF_NUM); -- рекурсия!!!
          END IF;
        END IF;
--      DBMS_OUTPUT.put_line(v_res);
    END LOOP;
    CLOSE cv;
  RETURN v_res;


END Get_ShortValuesStrig;
--------------------------------------------------------------------------------
-- Возвращает полное название для раздла TSMID, с учетом флага fl_showprint
-- Author: Ura
-- Notes: Сделано для Хант, отчет прием врача
FUNCTION get_path_showprint (p_fk_smid IN INTEGER)
  RETURN VARCHAR
AS
  v_res    VARCHAR (4000);
  v_name   VARCHAR (4000);

  CURSOR c1
  IS
    SELECT     fc_name
          FROM tsmid
         WHERE fk_owner <> 0 AND tsmid.fl_showprint = 1
    START WITH fk_id = p_fk_smid
    CONNECT BY PRIOR fk_owner = fk_id
    ORDER BY ROWNUM DESC;
BEGIN
  OPEN c1;
  FETCH c1 INTO v_name;
  IF c1%FOUND THEN
    v_res := v_res || v_name || ':';
  END IF;

  LOOP
    FETCH c1 INTO v_name;
    EXIT WHEN c1%NOTFOUND;
    v_res := v_res || ' ' || v_name;
  END LOOP;

  CLOSE c1;

  IF SUBSTR (v_res, LENGTH (v_res), 1) = ':' THEN
    v_res := SUBSTR (v_res, 1, LENGTH (v_res) - 1);
  END IF;

  RETURN v_res;
END get_path_showprint;

FUNCTION GetRootLevelSyn(p_FK_ID in Integer)
  RETURN VARCHAR2
AS
    v_Ret Varchar2(150);
-- Возвращает НАЗВАНИЕ СИНОНИМА по FK_ID
-- Используется алгоритм определния раздела с помщью TCONST
-- Author: Ura
-- COPYED FROM PKG_SMID --by TimurLan 18/09/04
BEGIN
  SELECT S.fc_synonim
    into v_Ret
    FROM TSMID S
   WHERE S.fk_id IN
         (SELECT FN_CONST FROM TCONST WHERE FC_FUNC LIKE 'RAZDEL_%')
  CONNECT BY S.FK_ID = PRIOR S.fk_owner
   START WITH S.fk_ID = p_FK_ID;
  Return v_Ret;
END GetRootLevelSyn;

END;-- Package Body PKG_SMID
/

SHOW ERRORS;


GRANT EXECUTE ON ASU.PKG_SMID TO LAB
/

