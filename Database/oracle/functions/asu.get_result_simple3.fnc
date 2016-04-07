DROP FUNCTION ASU.GET_RESULT_SIMPLE3
/

--
-- GET_RESULT_SIMPLE3  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_LOB (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TRESAN (Table)
--   TSMID (Table)
--   TCLOBS (Table)
--   GET_NAME_FROM_SMID (Function)
--   GET_NORM (Function)
--   GET_PACID_FROM_NAZID (Function)
--   GET_PATNAME (Function)
--   GET_SMIDFROMNAZ (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_RESULT_SIMPLE3" (pFK_NAZID IN NUMBER)
  RETURN NUMBER IS
  CURSOR cGetHeader (pFK_SMID NUMBER) IS
    SELECT/*+rule*/ FC_NAME, FC_ED_IZM, GET_NORM (pFK_SMID, (GET_PACID_FROM_NAZID (pFK_NAZID) ) ), FC_TYPE
      FROM TSMID
     WHERE FK_ID = pFK_SMID;
  CURSOR cGetVal (pFK_SMID NUMBER) IS
    SELECT/*+rule*/ GET_NAME_FROM_SMID (FK_BLOBID), TO_CHAR (FN_RES), FC_RES, GET_PATNAME (fk_patid), fk_patid
      FROM TRESAN
     WHERE FK_SMID = pFK_SMID
       AND FK_NAZID = pFK_NAZID
       AND FL_ZAKL <> 1;
  CURSOR cGetZakl (pFK_NAZID NUMBER) IS
    SELECT/*+rule*/ FC_RES
      FROM TRESAN
     WHERE FK_NAZID = pFK_NAZID
       AND FL_ZAKL = 1;
  CURSOR cD (pFK_SMID NUMBER) IS
    SELECT/*+rule*/ TO_CHAR (FD_INS, 'dd.mm.yyyy'), TSMID.FC_NAME
      FROM TRESAN, TSMID
     WHERE FK_NAZID = pFK_NAZID
           AND TSMID.FK_ID = pFK_SMID
       AND FL_ZAKL <> 1;
  str    VARCHAR2 (32767);
  c      VARCHAR2 (32767);
  c1     VARCHAR2 (32767);
  c2     VARCHAR2 (32767);
  c3     VARCHAR2 (32767);
  cType  VARCHAR2 (100);
  nSMID  NUMBER;
  nRes   NUMBER;
  cl     CLOB;
  n      NUMBER;
BEGIN
  DELETE
    FROM TCLOBS
   WHERE FK_ID = (SELECT FK_BLOBID
                    FROM TRESAN
                   WHERE FK_NAZID = pFK_NAZID
                     AND FL_ZAKL = 1);
  INSERT INTO TCLOBS
              (FK_ID, FC_CLOB)
       VALUES (-1, EMPTY_CLOB () )
    RETURNING FK_ID
    INTO nRes;
  SELECT FC_CLOB
    INTO cl
    FROM TCLOBS
   WHERE FK_ID = nRes
     FOR UPDATE;
  nSMID   := GET_SMIDFROMNAZ (pFK_NAZID);
  OPEN cD (nSMID);
  FETCH cD INTO c, c1;
  CLOSE cD;

  str    :='&nbsp;&nbsp;&nbsp;&nbsp;<B>' || c1 || ' :</B>';
  DBMS_LOB.WRITE (cl, LENGTH (str), 1, str);

  OPEN cGetHeader (nSMID);
  FETCH cGetHeader INTO c, c1, c2, cType;
  CLOSE cGetHeader;
  IF c IS NULL THEN
    c   := '&nbsp;';
  END IF;
  IF c1 IS NULL THEN
    c1   := '&nbsp;';
  END IF;
  IF c2 IS NULL THEN
    c2   := '&nbsp;';
  END IF;
      str  := ' &nbsp;&nbsp; ' || c || ' - ' || c1;
  DBMS_LOB.WRITE (cl, LENGTH (str), DBMS_LOB.GETLENGTH (cl) + 1, str);
  c       := '';
  c1      := '';
  c2      := '';
  c3      := '';
  OPEN cGetVal (nSMID);
  FETCH cGetVal INTO c, c1, c2, c3, n;
  CLOSE cGetVal;
  IF cType = 'NUMBER' THEN
    str   := c1 ;
  ELSIF cType = 'VARCHAR2' THEN
    str   := c2 ;
  ELSIF cType = 'COMBOBOX' THEN
    str   := c ;
  ELSE
    str   := '&nbsp;';
  END IF;

  str  := str || '<BR>';
  DBMS_LOB.WRITE (cl, LENGTH (str), DBMS_LOB.GETLENGTH (cl) + 1, str);

  RETURN nRes;
END;                                                                                       -- Function GET_RESULT_SIMPLE
/

SHOW ERRORS;


