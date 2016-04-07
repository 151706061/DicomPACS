DROP FUNCTION ASU.GET_IBEDITVALUE
/

--
-- GET_IBEDITVALUE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TIB (Table)
--   TSMID (Table)
--   GET_FULLEDITVALUE (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_IBEDITVALUE" (pacid IN NUMBER, smeditid IN NUMBER)
  RETURN VARCHAR2
IS
  CURSOR c1
  IS
    SELECT /*+ rule*/
       fc_char, fn_num, fk_smid, fd_date, DECODE (fl_showprint, 1, fc_name, 0, '') AS fc_name
      FROM tib, tsmid
     WHERE fk_pacid = pacid
       AND fk_smeditid = smeditid
       AND tsmid.fk_id = tib.fk_smid
     ORDER BY fn_order;

--получить тип СМИД
  CURSOR cType
  IS
    SELECT fc_type
      FROM tsmid
     WHERE fk_id = smeditid;

  CURSOR cSMIDs
  IS
    SELECT/*+ index_asc(tsmid tsmid_by_owner_order)*/
       fk_id AS fk_smid
      FROM tsmid
     WHERE EXISTS (SELECT/*+ INDEX(TIB TIB_I_FK_PACID_FK_SMID)*/
                      fk_id
                     FROM tib
                    WHERE fk_smid = tsmid.fk_id
                      AND fk_pacid = pacid)
     START WITH fk_owner = smeditid
    CONNECT BY PRIOR fk_id = fk_owner;

  CURSOR cSMIDNumbers (pNumID IN NUMBER)
  IS
    SELECT fn_num
      FROM tib
     WHERE fk_pacid = pacid
       AND fk_smeditid = smeditid
       AND fk_smid = pNumID
       AND fn_num IS NOT NULL
     ORDER BY fk_id;

  CURSOR csmidowner (pid NUMBER)
  IS
    SELECT fk_owner, fc_name
      FROM tsmid
     WHERE fk_id = pid;

  CURSOR cDopolnit
  IS
    SELECT fc_char
      FROM tib
     WHERE fk_pacid = pacid
       AND fk_smeditid = smeditid
       AND fc_char IS NOT NULL;

  nowner      NUMBER;
  ncurowner   NUMBER;
  ncurid      NUMBER;
  sowner      VARCHAR2 (100);
  sname       VARCHAR2 (1000);
  sres        VARCHAR2 (4000) := NULL;
  schar       VARCHAR2 (4000);
  snum        VARCHAR2 (20);
  dDat        DATE;
  sedizm      VARCHAR2 (20);
  nsmid       NUMBER;
  i           NUMBER;
  stype       VARCHAR2 (25);
  bExists     BOOLEAN;

  FUNCTION get_pathfromto (pIDFrom IN NUMBER, pIDTo IN NUMBER)
    RETURN VARCHAR2
  IS
    CURSOR c
    IS
      SELECT fc_name, fk_id
        FROM tsmid
       START WITH fk_id = pIDFrom
      CONNECT BY PRIOR fk_owner = fk_id;

    s   VARCHAR (4000);
  BEGIN
    FOR i IN c LOOP
      EXIT WHEN i.fk_id = pIDTo;
      s  := i.fc_name || ' ' || s;
    END LOOP;
    RETURN s;
  END;
BEGIN
  IF NOT cType%ISOPEN THEN
    OPEN cType;
  END IF;
  FETCH cType INTO stype;
  IF NOT c1%ISOPEN THEN
    OPEN c1;
  END IF;
  FETCH c1 INTO schar, snum, nsmid, dDat, sname;
  IF sType = 'DATA' THEN
    SELECT DECODE (fl_showprint, 1, fc_name, 0, '')
      INTO sres
      FROM tsmid
     WHERE fk_id = smeditid;
    sres  := sres || ' ' || TO_CHAR (dDat, 'dd.mm.yyyy');
    IF sChar IS NOT NULL THEN
      sres  := sres || ', ' || schar;
    END IF;
  END IF;
  IF stype = 'COMBOBOX' THEN
    SELECT DECODE (fl_showprint, 1, fc_name, 0, '') AS fc_name
      INTO sres
      FROM tsmid
     WHERE fk_id = smeditid;
    sres  := sres || ' ' || sname;
  END IF;
  IF stype = 'NUMBER' THEN
    SELECT DECODE (fl_showprint, 1, fc_name, 0, ''), fc_ed_izm
      INTO sres, sedizm
      FROM tsmid
     WHERE fk_id = smeditid;
    IF ROUND (TO_NUMBER (sNum)) = TO_NUMBER (sNum) THEN
      sres  := sres || ' ' || TO_NUMBER (sNum) || ' ' || sedizm ||',';
    ELSE
      sres  := sres || ' ' || TO_CHAR (TO_NUMBER (sNum), 'FM99999990D999') || ' ' || sedizm ||',';
    END IF;
    IF schar IS NOT NULL THEN
      sres  := sres || ', ' || schar||',';
    END IF;
  END IF;
  IF stype IN ('EDIT', 'MEMO', 'BIGMEMO') THEN
    IF sname IS NOT NULL THEN
      sres  := sname || ' ';
    END IF;
    sres  := sres || schar;
    IF stype IN ('MEMO', 'BIGMEMO') THEN
      sres  := sres || CHR (10);
    END IF;
  ELSIF stype = 'VARCHAR2' THEN
    SELECT DECODE (fl_showprint, 1, fc_name, 0, '') AS fc_name
      INTO sres
      FROM tsmid
     WHERE fk_id = smeditid;
    sRes       := sRes || ' ';
    nCurOwner  := -1;
    bExists    := FALSE;
    FOR rIDS IN cSMIDs LOOP
      bExists    := TRUE;
      sres       := sRes || get_fulleditvalue (rIDS.FK_SMID, nCurOwner) || ' ,';
      FOR pNums IN cSMIDNumbers (rIDS.FK_SMID) LOOP
        IF SUBSTR (TO_CHAR (pNums.FN_NUM, 'FM99999990D999'), LENGTH (TO_CHAR (pNums.FN_NUM, 'FM99999990D999')), 1) = ',' THEN
          sRes  :=
            REPLACE (SUBSTR (sRes, 1, INSTR (sRes, '...') + 3), '...', TO_CHAR (pNums.FN_NUM)) ||
              SUBSTR (sRes, INSTR (sRes, '...') + 3);
        ELSE
          sRes  :=
            REPLACE (SUBSTR (sRes, 1, INSTR (sRes, '...') + 3), '...', TO_CHAR (pNums.FN_NUM, 'FM99999990D999')) ||
              SUBSTR (sRes, INSTR (sRes, '...') + 3);
        END IF;
      END LOOP;
      nCurOwner  := rIDs.FK_SMID;
    END LOOP;
    sres       := REPLACE (SUBSTR (sres, 1, LENGTH (sres) - 1), ': ,', ': ');
    -- дополнительные данные
    FOR i IN cdopolnit LOOP
      IF bExists THEN
        sres  := sres || ', ' || i.fc_char;
      ELSE
        sres  := sres || ' ' || i.fc_char;
      END IF;
    END LOOP;
  END IF;
  IF cType%ISOPEN THEN
    CLOSE cType;
  END IF;
  IF c1%ISOPEN THEN
    CLOSE c1;
  END IF;
  sRes  := REPLACE (sRes, ' ,', ', ');
  sRes  := REPLACE (sRes, ' ,', ', ');
  RETURN sres;
END;
/

SHOW ERRORS;


