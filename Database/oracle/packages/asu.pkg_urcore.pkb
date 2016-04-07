DROP PACKAGE BODY ASU.PKG_URCORE
/

--
-- PKG_URCORE  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_URCORE" 
IS
--
-- Purpose: This is Core of Universal Report
--
-- Wrote by Philip A. Milovanov
-- 10.09.2001
FUNCTION GET_SMID_CELL(pFC_PERIOD IN VARCHAR2,pFK_ID IN NUMBER,pFN_COL IN NUMBER,pFK_SMID IN NUMBER,pFL_SHOWANAL IN NUMBER,pFL_ORIENTATION IN NUMBER) RETURN VARCHAR2
IS
CURSOR cFormula(pID NUMBER,pCol NUMBER,pRow NUMBER) IS SELECT TURALGO.FK_ID,FK_FUNCID,FC_SIGN,FP_SEX,FN_AGE1,FN_AGE2,FL_AMB,FN_VALUE,TURALGO.FN_COL,TURALGO.FN_ROW
                          FROM TURALGO,TURCELLS
                          WHERE TURALGO.FK_CELLID=TURCELLS.FK_ID AND TURCELLS.FK_REPORTID=pID
                                AND TURCELLS.FN_COL=pCol AND TURCELLS.FN_ROW=pRow ORDER BY FN_ORDER;
CURSOR cGetFunc(pFUNCID NUMBER) IS SELECT FC_NAME FROM TURFUNCS WHERE FK_ID=pFUNCID;
CURSOR cCheckFormula(pID NUMBER,pCol NUMBER,pRow NUMBER) IS SELECT COUNT(TURALGO.FK_ID)
                          FROM TURALGO,TURCELLS
                          WHERE TURALGO.FK_CELLID=TURCELLS.FK_ID AND TURCELLS.FK_REPORTID=pID
                                AND TURCELLS.FN_COL=pCol AND TURCELLS.FN_ROW=pRow ORDER BY FN_ORDER;
CURSOR cGetText(pID NUMBER,pCol NUMBER,pRow NUMBER) IS SELECT FC_NAME
                          FROM TURCELLS
                          WHERE TURCELLS.FK_REPORTID=pID
                                AND TURCELLS.FN_COL=pCol AND TURCELLS.FN_ROW=pRow;
CURSOR cFuncParams(pFUNCID NUMBER) IS SELECT FP_PARAM FROM TURFUNCSPARAMS WHERE FK_FUNCID=pFUNCID;
CURSOR cCountFuncParams(pFUNCID NUMBER) IS SELECT COUNT(FK_ID) FROM TURFUNCSPARAMS WHERE FK_FUNCID=pFUNCID;
str VARCHAR2(1000);
strT VARCHAR2(100);
strA VARCHAR2(4000);
i NUMBER;
nCol NUMBER;
nRow NUMBER;
BEGIN
  IF pFL_ORIENTATION=0 THEN
    nCol:=pFN_COL;
    nRow:=0;
  ELSIF pFL_ORIENTATION=1 THEN
    nCol:=0;
    nRow:=pFN_COL;
  END IF;
  FOR p IN cFormula(pFK_ID,nCOL,nRow) LOOP
    IF p.FC_SIGN IS NOT NULL THEN
      str:=str||' '||p.FC_SIGN;
    ELSE
      OPEN cGetFunc(p.FK_FUNCID);
      FETCH cGetFunc INTO strT;
      CLOSE cGetFunc;
      IF pFL_ORIENTATION=0 THEN
        strA:=chr(13)||strT||'('||pFC_PERIOD||','||pFK_ID||','||pFN_COL||','||0;
      ELSIF pFL_ORIENTATION=1 THEN
        strA:=chr(13)||strT||'('||pFC_PERIOD||','||pFK_ID||','||0||','||pFN_COL;
      END IF;
      OPEN cCountFuncParams(p.FK_FUNCID);
      FETCH cCountFuncParams INTO i;
      CLOSE cCountFuncParams;
      IF i=0 THEN
--        NULL;
        strA:=strA||')';
      ELSE
        FOR z IN cFuncParams(p.FK_FUNcID) LOOP
          IF z.FP_PARAM=0 THEN
            IF pFL_SHOWANAL=0 THEN
              strA:=strA||', '' AND FK_OTDELID='||pFK_SMID||' ''';
            ELSIF pFL_SHOWANAL=1 THEN
              strA:=strA||', '' AND FK_RAZDID='||pFK_SMID||' ''';
            ELSIF pFL_SHOWANAL=2 THEN
              strA:=strA||', '' AND FK_ISSLID='||pFK_SMID||' ''';
            ELSIF pFL_SHOWANAL IN (3,4) THEN
              strA:=strA||', '' AND FK_SMID='||pFK_SMID||' ''';
            ELSIF pFL_SHOWANAL =-1 THEN
              strA:=strA||', '' AND (FK_SMID IN (SELECT FK_SMID FROM TURALGOSMID WHERE FK_ALGOID='||pFK_ID||') OR FK_OTDELID IN (SELECT FK_SMID FROM TURALGOSMID WHERE FK_ALGOID='||pFK_ID||') OR FK_ISSLID IN (SELECT FK_SMID FROM TURALGOSMID WHERE FK_ALGOID='||pFK_ID||') OR FK_RAZDID IN (SELECT FK_SMID FROM TURALGOSMID WHERE FK_ALGOID='||pFK_ID||') )''';
            END IF;
          ELSIF z.FP_PARAM=1 THEN
            IF p.FL_AMB=-2 THEN
              strA:=strA||','||''' ''';
            ELSIF p.FL_AMB=-1 THEN
              strA:=strA||','||''' AND FL_AMB=0 ''';
            ELSIF p.FL_AMB=0 THEN
              strA:=strA||','||''' AND FL_AMB=1 ''';
            ELSIF p.FL_AMB>0 THEN
              strA:=strA||','||''' AND FL_AMB='||p.FL_AMB||' ''';
            END IF;
--            str:=str||','||p.FL_AMB;
          ELSIF z.FP_PARAM=2 THEN
            IF p.FP_SEX=2 THEN
              strA:=strA||', '' ''';
            ELSIF p.FP_SEX=1 THEN
              strA:=strA||', '' AND FP_SEX=1 ''';
            ELSIF p.FP_SEX=0 THEN
              strA:=strA||', '' AND FP_SEX=0 ''';
            END IF;
          ELSIF z.FP_PARAM=3 THEN
            IF p.FN_AGE1 IS NOT NULL AND p.FN_AGE2 IS NOT NULL THEN
              strA:=strA||','' AND FN_VOZR BETWEEN '||p.FN_AGE1||' AND '||p.FN_AGE2||''' ';
            ELSE
              strA:=strA||', '' '' ';
            END IF;
          ELSIF z.FP_PARAM=4 THEN
            IF pFL_ORIENTATION=0 THEN
              strA:='('||GET_SMID_CELL(pFC_PERIOD,pFK_ID,p.FN_COL,pFK_SMID,pFL_SHOWANAL,pFL_ORIENTATION);
            ELSIF pFL_ORIENTATION=1 THEN
              strA:='('||GET_SMID_CELL(pFC_PERIOD,pFK_ID,p.FN_ROW,pFK_SMID,pFL_SHOWANAL,pFL_ORIENTATION);
            END IF;
          ELSIF z.FP_PARAM=5 THEN
            strA:=strA||','''||p.FN_VALUE||'''';
          END IF;
        END LOOP;
        strA:=strA||')';
      END IF;
      str:=str||strA;
    END IF;
  END LOOP;
  RETURN str;
END;
FUNCTION GET_CATEGORY_CELL(pFC_PERIOD IN VARCHAR2,pFK_ID IN NUMBER,pFN_COL IN NUMBER,pFL_AMB IN NUMBER,pFL_ORIENTATION IN NUMBER) RETURN VARCHAR2
IS
CURSOR cFormula(pID NUMBER,pCol NUMBER,pRow NUMBER) IS SELECT TURALGO.FK_ID,FK_FUNCID,FC_SIGN,FP_SEX,FN_AGE1,FN_AGE2,FL_AMB,FN_VALUE,TURALGO.FN_COL,TURALGO.FN_ROW
                          FROM TURALGO,TURCELLS
                          WHERE TURALGO.FK_CELLID=TURCELLS.FK_ID AND TURCELLS.FK_REPORTID=pID
                                AND TURCELLS.FN_COL=pCol AND TURCELLS.FN_ROW=pRow ORDER BY FN_ORDER;
CURSOR cGetFunc(pFUNCID NUMBER) IS SELECT FC_NAME FROM TURFUNCS WHERE FK_ID=pFUNCID;
CURSOR cCheckFormula(pID NUMBER,pCol NUMBER,pRow NUMBER) IS SELECT COUNT(TURALGO.FK_ID)
                          FROM TURALGO,TURCELLS
                          WHERE TURALGO.FK_CELLID=TURCELLS.FK_ID AND TURCELLS.FK_REPORTID=pID
                                AND TURCELLS.FN_COL=pCol AND TURCELLS.FN_ROW=pRow ORDER BY FN_ORDER;
CURSOR cGetText(pID NUMBER,pCol NUMBER,pRow NUMBER) IS SELECT FC_NAME
                          FROM TURCELLS
                          WHERE TURCELLS.FK_REPORTID=pID
                                AND TURCELLS.FN_COL=pCol AND TURCELLS.FN_ROW=pRow;
CURSOR cFuncParams(pFUNCID NUMBER) IS SELECT FP_PARAM FROM TURFUNCSPARAMS WHERE FK_FUNCID=pFUNCID;
CURSOR cCountFuncParams(pFUNCID NUMBER) IS SELECT COUNT(FK_ID) FROM TURFUNCSPARAMS WHERE FK_FUNCID=pFUNCID;
CURSOR cCheckSMID (pFK_ALGOID NUMBER) IS SELECT COUNT(FK_SMID) FROM TURALGOSMID WHERE FK_ALGOID=pFK_ALGOID;
str VARCHAR2(1000);
strT VARCHAR2(100);
strA VARCHAR2(4000);
i NUMBER;
nCol NUMBER;
nRow NUMBER;
nSMID NUMBER;
BEGIN
  IF pFL_ORIENTATION=0 THEN
    nCol:=pFN_COL;
    nRow:=0;
  ELSIF pFL_ORIENTATION=1 THEN
    nCol:=0;
    nRow:=pFN_COL;
  END IF;
  FOR p IN cFormula(pFK_ID,nCOL,nRow) LOOP
    IF p.FC_SIGN IS NOT NULL THEN
      str:=str||' '||p.FC_SIGN;
    ELSE
      OPEN cGetFunc(p.FK_FUNCID);
      FETCH cGetFunc INTO strT;
      CLOSE cGetFunc;
      IF pFL_ORIENTATION=0 THEN
        strA:=chr(13)||strT||'('||pFC_PERIOD||','||pFK_ID||','||pFN_COL||','||0;
      ELSIF pFL_ORIENTATION=1 THEN
        strA:=chr(13)||strT||'('||pFC_PERIOD||','||pFK_ID||','||0||','||pFN_COL;
      END IF;
      OPEN cCountFuncParams(p.FK_FUNCID);
      FETCH cCountFuncParams INTO i;
      CLOSE cCountFuncParams;
      IF i=0 THEN
        NULL;
      ELSE
        FOR z IN cFuncParams(p.FK_FUNcID) LOOP
          IF z.FP_PARAM=0 THEN
            OPEN cCheckSMID(p.FK_ID);
            FETCH cCheckSMID INTO nSMID;
            CLOSE cCheckSMID;
            IF nSMID>0 THEN
              strA:=strA||', '' AND FK_SMID IN (SELECT FK_SMID FROM TURALGOSMID WHERE FK_ALGOID='||p.FK_ID||')''';
            ELSE
              strA:=strA||', '' ''';
            END IF;
          ELSIF z.FP_PARAM=1 THEN
            IF pFL_AMB=-2 THEN
              strA:=strA||','||''' ''';
            ELSIF pFL_AMB=-1 THEN
              strA:=strA||','||''' AND FL_AMB=0 ''';
            ELSIF pFL_AMB=0 THEN
              strA:=strA||','||''' AND FL_AMB=1 ''';
            ELSIF pFL_AMB>0 THEN
              strA:=strA||','||''' AND FL_AMB='||pFL_AMB||' ''';
            END IF;
          ELSIF z.FP_PARAM=2 THEN
            IF p.FP_SEX=2 THEN
              strA:=strA||', '' ''';
            ELSIF p.FP_SEX=1 THEN
              strA:=strA||', '' AND FP_SEX=1 ''';
            ELSIF p.FP_SEX=0 THEN
              strA:=strA||', '' AND FP_SEX=0 ''';
            END IF;
          ELSIF z.FP_PARAM=3 THEN
            IF p.FN_AGE1 IS NOT NULL AND p.FN_AGE2 IS NOT NULL THEN
              strA:=strA||','' AND FN_VOZR BETWEEN '||p.FN_AGE1||' AND '||p.FN_AGE2||''' ';
            ELSE
              strA:=strA||', '' '' ';
            END IF;
          ELSIF z.FP_PARAM=4 THEN
            IF pFL_ORIENTATION=0 THEN
              strA:='('||GET_CATEGORY_CELL(pFC_PERIOD,pFK_ID,p.FN_COL,pFL_AMB,pFL_ORIENTATION);
            ELSIF pFL_ORIENTATION=1 THEN
              strA:='('||GET_CATEGORY_CELL(pFC_PERIOD,pFK_ID,p.FN_ROW,pFL_AMB,pFL_ORIENTATION);
            END IF;
          ELSIF z.FP_PARAM=5 THEN
            strA:=strA||','''||p.FN_VALUE||'''';
          END IF;
        END LOOP;
        strA:=strA||')';
      END IF;
      str:=str||strA;
    END IF;
  END LOOP;
  RETURN str;
END;
FUNCTION GET_AGE_CELL(pFC_PERIOD IN VARCHAR2,pFK_ID IN NUMBER,pFN_COL IN NUMBER,pFN_AGE1 IN NUMBER,pFN_AGE2 IN NUMBER,pFL_ORIENTATION IN NUMBER) RETURN VARCHAR2
IS
CURSOR cFormula(pID NUMBER,pCol NUMBER,pRow NUMBER) IS SELECT TURALGO.FK_ID,FK_FUNCID,FC_SIGN,FP_SEX,FN_AGE1,FN_AGE2,FL_AMB,FN_VALUE,TURALGO.FN_COL,TURALGO.FN_ROW
                          FROM TURALGO,TURCELLS
                          WHERE TURALGO.FK_CELLID=TURCELLS.FK_ID AND TURCELLS.FK_REPORTID=pID
                                AND TURCELLS.FN_COL=pCol AND TURCELLS.FN_ROW=pRow ORDER BY FN_ORDER;
CURSOR cGetFunc(pFUNCID NUMBER) IS SELECT FC_NAME FROM TURFUNCS WHERE FK_ID=pFUNCID;
CURSOR cCheckFormula(pID NUMBER,pCol NUMBER,pRow NUMBER) IS SELECT COUNT(TURALGO.FK_ID)
                          FROM TURALGO,TURCELLS
                          WHERE TURALGO.FK_CELLID=TURCELLS.FK_ID AND TURCELLS.FK_REPORTID=pID
                                AND TURCELLS.FN_COL=pCol AND TURCELLS.FN_ROW=pRow ORDER BY FN_ORDER;
CURSOR cGetText(pID NUMBER,pCol NUMBER,pRow NUMBER) IS SELECT FC_NAME
                          FROM TURCELLS
                          WHERE TURCELLS.FK_REPORTID=pID
                                AND TURCELLS.FN_COL=pCol AND TURCELLS.FN_ROW=pRow;
CURSOR cFuncParams(pFUNCID NUMBER) IS SELECT FP_PARAM FROM TURFUNCSPARAMS WHERE FK_FUNCID=pFUNCID;
CURSOR cCountFuncParams(pFUNCID NUMBER) IS SELECT COUNT(FK_ID) FROM TURFUNCSPARAMS WHERE FK_FUNCID=pFUNCID;
CURSOR cCheckSMID (pFK_ALGOID NUMBER) IS SELECT COUNT(FK_SMID) FROM TURALGOSMID WHERE FK_ALGOID=pFK_ALGOID;
str VARCHAR2(1000);
strT VARCHAR2(100);
strA VARCHAR2(4000);
i NUMBER;
nCol NUMBER;
nRow NUMBER;
nSMID NUMBER;
BEGIN
  IF pFL_ORIENTATION=0 THEN
    nCol:=pFN_COL;
    nRow:=0;
  ELSIF pFL_ORIENTATION=1 THEN
    nCol:=0;
    nRow:=pFN_COL;
  END IF;
  FOR p IN cFormula(pFK_ID,nCOL,nRow) LOOP
    IF p.FC_SIGN IS NOT NULL THEN
      str:=str||' '||p.FC_SIGN;
    ELSE
      OPEN cGetFunc(p.FK_FUNCID);
      FETCH cGetFunc INTO strT;
      CLOSE cGetFunc;
      IF pFL_ORIENTATION=0 THEN
        strA:=chr(13)||strT||'('||pFC_PERIOD||','||pFK_ID||','||pFN_COL||','||0;
      ELSIF pFL_ORIENTATION=1 THEN
        strA:=chr(13)||strT||'('||pFC_PERIOD||','||pFK_ID||','||0||','||pFN_COL;
      END IF;
      OPEN cCountFuncParams(p.FK_FUNCID);
      FETCH cCountFuncParams INTO i;
      CLOSE cCountFuncParams;
      IF i=0 THEN
--        NULL;
        strA:=strA||')';
      ELSE
        FOR z IN cFuncParams(p.FK_FUNcID) LOOP
          IF z.FP_PARAM=0 THEN
            OPEN cCheckSMID(p.FK_ID);
            FETCH cCheckSMID INTO nSMID;
            CLOSE cCheckSMID;
            IF nSMID>0 THEN
              strA:=strA||', '' AND FK_SMID IN (SELECT FK_SMID FROM TURALGOSMID WHERE FK_ALGOID='||p.FK_ID||')''';
            ELSE
              strA:=strA||', '' ''';
            END IF;
          ELSIF z.FP_PARAM=1 THEN
            IF p.FL_AMB=-2 THEN
              strA:=strA||','||''' ''';
            ELSIF p.FL_AMB=-1 THEN
              strA:=strA||','||''' AND FL_AMB=0 ''';
            ELSIF p.FL_AMB=0 THEN
              strA:=strA||','||''' AND FL_AMB=1 ''';
            ELSIF p.FL_AMB>0 THEN
              strA:=strA||','||''' AND FL_AMB='||p.FL_AMB||' ''';
            END IF;
--            str:=str||','||p.FL_AMB;
          ELSIF z.FP_PARAM=2 THEN
            IF p.FP_SEX=2 THEN
              strA:=strA||', '' ''';
            ELSIF p.FP_SEX=1 THEN
              strA:=strA||', '' AND FP_SEX=1 ''';
            ELSIF p.FP_SEX=0 THEN
              strA:=strA||', '' AND FP_SEX=0 ''';
            END IF;
          ELSIF z.FP_PARAM=3 THEN
            IF pFN_AGE1 IS NOT NULL AND pFN_AGE2 IS NOT NULL THEN
              strA:=strA||','' AND FN_VOZR BETWEEN '||pFN_AGE1||' AND '||pFN_AGE2||''' ';
            ELSE
              strA:=strA||', '' '' ';
            END IF;
          ELSIF z.FP_PARAM=4 THEN
            IF pFL_ORIENTATION=0 THEN
              strA:='('||GET_AGE_CELL(pFC_PERIOD,pFK_ID,p.FN_COL,pFN_AGE1,pFN_AGE2,pFL_ORIENTATION);
            ELSIF pFL_ORIENTATION=1 THEN
              strA:='('||GET_AGE_CELL(pFC_PERIOD,pFK_ID,p.FN_ROW,pFN_AGE1,pFN_AGE2,pFL_ORIENTATION);
            END IF;
          ELSIF z.FP_PARAM=5 THEN
            strA:=strA||','''||p.FN_VALUE||'''';
          END IF;
        END LOOP;
        strA:=strA||')';
      END IF;
      str:=str||strA;
    END IF;
  END LOOP;
  RETURN str;
END;
FUNCTION GET_SEX_CELL(pFC_PERIOD IN VARCHAR2,pFK_ID IN NUMBER,pFN_COL IN NUMBER,pFP_SEX IN NUMBER,pFL_ORIENTATION IN NUMBER) RETURN VARCHAR2
IS
CURSOR cFormula(pID NUMBER,pCol NUMBER,pRow NUMBER) IS SELECT TURALGO.FK_ID,FK_FUNCID,FC_SIGN,FP_SEX,FN_AGE1,FN_AGE2,FL_AMB,FN_VALUE,TURALGO.FN_COL,TURALGO.FN_ROW
                          FROM TURALGO,TURCELLS
                          WHERE TURALGO.FK_CELLID=TURCELLS.FK_ID AND TURCELLS.FK_REPORTID=pID
                                AND TURCELLS.FN_COL=pCol AND TURCELLS.FN_ROW=pRow ORDER BY FN_ORDER;
CURSOR cGetFunc(pFUNCID NUMBER) IS SELECT FC_NAME FROM TURFUNCS WHERE FK_ID=pFUNCID;
CURSOR cCheckFormula(pID NUMBER,pCol NUMBER,pRow NUMBER) IS SELECT COUNT(TURALGO.FK_ID)
                          FROM TURALGO,TURCELLS
                          WHERE TURALGO.FK_CELLID=TURCELLS.FK_ID AND TURCELLS.FK_REPORTID=pID
                                AND TURCELLS.FN_COL=pCol AND TURCELLS.FN_ROW=pRow ORDER BY FN_ORDER;
CURSOR cGetText(pID NUMBER,pCol NUMBER,pRow NUMBER) IS SELECT FC_NAME
                          FROM TURCELLS
                          WHERE TURCELLS.FK_REPORTID=pID
                                AND TURCELLS.FN_COL=pCol AND TURCELLS.FN_ROW=pRow;
CURSOR cFuncParams(pFUNCID NUMBER) IS SELECT FP_PARAM FROM TURFUNCSPARAMS WHERE FK_FUNCID=pFUNCID;
CURSOR cCountFuncParams(pFUNCID NUMBER) IS SELECT COUNT(FK_ID) FROM TURFUNCSPARAMS WHERE FK_FUNCID=pFUNCID;
CURSOR cCheckSMID (pFK_ALGOID NUMBER) IS SELECT COUNT(FK_SMID) FROM TURALGOSMID WHERE FK_ALGOID=pFK_ALGOID;
str VARCHAR2(1000);
strT VARCHAR2(100);
strA VARCHAR2(4000);
i NUMBER;
nCol NUMBER;
nRow NUMBER;
nSMID NUMBER;
BEGIN
  IF pFL_ORIENTATION=0 THEN
    nCol:=pFN_COL;
    nRow:=0;
  ELSIF pFL_ORIENTATION=1 THEN
    nCol:=0;
    nRow:=pFN_COL;
  END IF;
  FOR p IN cFormula(pFK_ID,nCOL,nRow) LOOP
    IF p.FC_SIGN IS NOT NULL THEN
      str:=str||' '||p.FC_SIGN;
    ELSE
      OPEN cGetFunc(p.FK_FUNCID);
      FETCH cGetFunc INTO strT;
      CLOSE cGetFunc;
      IF pFL_ORIENTATION=0 THEN
        strA:=chr(13)||strT||'('||pFC_PERIOD||','||pFK_ID||','||pFN_COL||','||0;
      ELSIF pFL_ORIENTATION=1 THEN
        strA:=chr(13)||strT||'('||pFC_PERIOD||','||pFK_ID||','||0||','||pFN_COL;
      END IF;
      OPEN cCountFuncParams(p.FK_FUNCID);
      FETCH cCountFuncParams INTO i;
      CLOSE cCountFuncParams;
      IF i=0 THEN
--        NULL;
        strA:=strA||')';
      ELSE
        FOR z IN cFuncParams(p.FK_FUNcID) LOOP
          IF z.FP_PARAM=0 THEN
            OPEN cCheckSMID(p.FK_ID);
            FETCH cCheckSMID INTO nSMID;
            CLOSE cCheckSMID;
            IF nSMID>0 THEN
              strA:=strA||', '' AND FK_SMID IN (SELECT FK_SMID FROM TURALGOSMID WHERE FK_ALGOID='||p.FK_ID||')''';
            ELSE
              strA:=strA||', '' ''';
            END IF;
          ELSIF z.FP_PARAM=1 THEN
            IF p.FL_AMB=-2 THEN
              strA:=strA||','||''' ''';
            ELSIF p.FL_AMB=-1 THEN
              strA:=strA||','||''' AND FL_AMB=0 ''';
            ELSIF p.FL_AMB=0 THEN
              strA:=strA||','||''' AND FL_AMB=1 ''';
            ELSIF p.FL_AMB>0 THEN
              strA:=strA||','||''' AND FL_AMB='||p.FL_AMB||' ''';
            END IF;
--            str:=str||','||p.FL_AMB;
          ELSIF z.FP_PARAM=2 THEN
            IF pFP_SEX=2 THEN
              strA:=strA||', '' ''';
            ELSIF pFP_SEX=1 THEN
              strA:=strA||', '' AND FP_SEX=1 ''';
            ELSIF pFP_SEX=0 THEN
              strA:=strA||', '' AND FP_SEX=0 ''';
            END IF;
          ELSIF z.FP_PARAM=3 THEN
            IF p.FN_AGE1 IS NOT NULL AND p.FN_AGE2 IS NOT NULL THEN
              strA:=strA||','' AND FN_VOZR BETWEEN '||p.FN_AGE1||' AND '||p.FN_AGE2||''' ';
            ELSE
              strA:=strA||', '' '' ';
            END IF;
          ELSIF z.FP_PARAM=4 THEN
            IF pFL_ORIENTATION=0 THEN
              strA:='('||GET_SEX_CELL(pFC_PERIOD,pFK_ID,p.FN_COL,pFP_SEX,pFL_ORIENTATION);
            ELSIF pFL_ORIENTATION=1 THEN
              strA:='('||GET_SEX_CELL(pFC_PERIOD,pFK_ID,p.FN_ROW,pFP_SEX,pFL_ORIENTATION);
            END IF;
          ELSIF z.FP_PARAM=5 THEN
            strA:=strA||','''||p.FN_VALUE||'''';
          END IF;
        END LOOP;
        strA:=strA||')';
      END IF;
      str:=str||strA;
    END IF;
  END LOOP;
  RETURN str;
END;
/*FUNCTION GET_COMPARE_CELL(pFC_PERIOD IN VARCHAR2,pFK_ID IN NUMBER,pFN_ROW IN NUMBER) RETURN VARCHAR2
IS
CURSOR cFormula(pID NUMBER,pCol NUMBER,pRow NUMBER) IS SELECT TURALGO.FK_ID,FK_FUNCID,FC_SIGN,FP_SEX,FN_AGE1,FN_AGE2,FL_AMB,FN_VALUE,TURALGO.FN_COL,TURALGO.FN_ROW
                          FROM TURALGO,TURCELLS
                          WHERE TURALGO.FK_CELLID=TURCELLS.FK_ID AND TURCELLS.FK_REPORTID=pID
                                AND TURCELLS.FN_COL=pCol AND TURCELLS.FN_ROW=pRow ORDER BY FN_ORDER;
CURSOR cGetFunc(pFUNCID NUMBER) IS SELECT FC_NAME FROM TURFUNCS WHERE FK_ID=pFUNCID;
CURSOR cCheckFormula(pID NUMBER,pCol NUMBER,pRow NUMBER) IS SELECT COUNT(TURALGO.FK_ID)
                          FROM TURALGO,TURCELLS
                          WHERE TURALGO.FK_CELLID=TURCELLS.FK_ID AND TURCELLS.FK_REPORTID=pID
                                AND TURCELLS.FN_COL=pCol AND TURCELLS.FN_ROW=pRow ORDER BY FN_ORDER;
CURSOR cGetText(pID NUMBER,pCol NUMBER,pRow NUMBER) IS SELECT FC_NAME,FC_FUNC
                          FROM TURCELLS
                          WHERE TURCELLS.FK_REPORTID=pID
                                AND TURCELLS.FN_COL=pCol AND TURCELLS.FN_ROW=pRow;
CURSOR cFuncParams(pFUNCID NUMBER) IS SELECT FP_PARAM FROM TURFUNCSPARAMS WHERE FK_FUNCID=pFUNCID;
CURSOR cCountFuncParams(pFUNCID NUMBER) IS SELECT COUNT(FK_ID) FROM TURFUNCSPARAMS WHERE FK_FUNCID=pFUNCID;
str VARCHAR2(1000);
strT VARCHAR2(100);
strA VARCHAR2(4000);
strFunc VARCHAR2(100);
i NUMBER;
BEGIN
  OPEN cCheckFormula(pFK_ID,pFN_COL,pFN_ROW);
  FETCH cCheckFormula INTO i;
  CLOSE cCheckFormula;
  IF i=0 THEN
    OPEN cGetText(pFK_ID,pFN_COL,pFN_ROW);
    FETCH cGetText INTO str,strFunc;
    CLOSE cGetText;
    IF str IS NULL THEN
      str:='&nbsp;';
    END IF;
    IF strFunc='ORDER' AND str IS NULL THEN
      str:=pFN_ROW;
    END IF;
    RETURN str;
  END IF;
  str:='';
  FOR p IN cFormula(pFK_ID,pFN_COL,pFN_ROW) LOOP
    IF p.FC_SIGN IS NOT NULL THEN
--      raise_application_error(-20002,str);
      str:=str||p.FC_SIGN;
    ELSE
      OPEN cGetFunc(p.FK_FUNCID);
      FETCH cGetFunc INTO strT;
      CLOSE cGetFunc;
      strA:=chr(13)||strT||'('||pFC_PERIOD||','||pFK_ID||','||pFN_COL||','||pFN_ROW;
      OPEN cCountFuncParams(p.FK_FUNCID);
      FETCH cCountFuncParams INTO i;
      CLOSE cCountFuncParams;
      IF i=0 THEN
        NULL;
--        strA:=strA||')';
      ELSE
        FOR z IN cFuncParams(p.FK_FUNcID) LOOP
          IF z.FP_PARAM=0 THEN
            strA:=strA||', '' AND FK_SMID IN (SELECT FK_SMID FROM TURALGOSMID WHERE FK_ALGOID='||p.FK_ID||')''';
          ELSIF z.FP_PARAM=1 THEN
            IF p.FL_AMB=-2 THEN
              strA:=strA||','||''' ''';
            ELSIF p.FL_AMB=-1 THEN
              strA:=strA||','||''' AND FL_AMB=0 ''';
            ELSIF p.FL_AMB=0 THEN
              strA:=strA||','||''' AND FL_AMB=1 ''';
            ELSIF p.FL_AMB>0 THEN
              strA:=strA||','||''' AND FL_AMB='||p.FL_AMB||' ''';
            END IF;
--            str:=str||','||p.FL_AMB;
          ELSIF z.FP_PARAM=2 THEN
            IF p.FP_SEX=0 THEN
              strA:=strA||', '' AND FP_SEX=0 ''';
            ELSIF p.FP_SEX=1 THEN
              strA:=strA||', '' AND FP_SEX=1 ''';
            ELSIF p.FP_SEX=2 THEN
              strA:=strA||', '' ''';
            END IF;
          ELSIF z.FP_PARAM=3 THEN
            IF p.FN_AGE1 IS NOT NULL AND p.FN_AGE2 IS NOT NULL THEN
              strA:=strA||','' AND FN_VOZR BETWEEN '||p.FN_AGE1||' AND '||p.FN_AGE2||''' ';
            ELSE
              strA:=strA||', '' '' ';
            END IF;
          ELSIF z.FP_PARAM=4 THEN
            strA:='('||GET_FORM_CELL(pFC_PERIOD,pFK_ID,p.FN_COL,p.FN_ROW);
          ELSIF z.FP_PARAM=5 THEN
            strA:=strA||','''||p.FN_VALUE||'''';
          END IF;
        END LOOP;
        strA:=strA||')';
      END IF;
      str:=str||strA;
    END IF;
  END LOOP;
  RETURN str;
END;
*/
FUNCTION GET_FORM_CELL(pFC_PERIOD IN VARCHAR2,pFK_ID IN NUMBER,pFN_COL IN NUMBER,pFN_ROW IN NUMBER) RETURN VARCHAR2
IS
CURSOR cFormula(pID NUMBER,pCol NUMBER,pRow NUMBER) IS SELECT TURALGO.FK_ID,FK_FUNCID,FC_SIGN,FP_SEX,FN_AGE1,FN_AGE2,FL_AMB,FN_VALUE,TURALGO.FN_COL,TURALGO.FN_ROW
                          FROM TURALGO,TURCELLS
                          WHERE TURALGO.FK_CELLID=TURCELLS.FK_ID AND TURCELLS.FK_REPORTID=pID
                                AND TURCELLS.FN_COL=pCol AND TURCELLS.FN_ROW=pRow ORDER BY FN_ORDER;
CURSOR cGetFunc(pFUNCID NUMBER) IS SELECT FC_NAME FROM TURFUNCS WHERE FK_ID=pFUNCID;
CURSOR cCheckFormula(pID NUMBER,pCol NUMBER,pRow NUMBER) IS SELECT COUNT(TURALGO.FK_ID)
                          FROM TURALGO,TURCELLS
                          WHERE TURALGO.FK_CELLID=TURCELLS.FK_ID AND TURCELLS.FK_REPORTID=pID
                                AND TURCELLS.FN_COL=pCol AND TURCELLS.FN_ROW=pRow ORDER BY FN_ORDER;
CURSOR cGetText(pID NUMBER,pCol NUMBER,pRow NUMBER) IS SELECT FC_NAME,FC_FUNC
                          FROM TURCELLS
                          WHERE TURCELLS.FK_REPORTID=pID
                                AND TURCELLS.FN_COL=pCol AND TURCELLS.FN_ROW=pRow;
CURSOR cFuncParams(pFUNCID NUMBER) IS SELECT FP_PARAM FROM TURFUNCSPARAMS WHERE FK_FUNCID=pFUNCID;
CURSOR cCountFuncParams(pFUNCID NUMBER) IS SELECT COUNT(FK_ID) FROM TURFUNCSPARAMS WHERE FK_FUNCID=pFUNCID;
CURSOR cCheckSMID (pFK_ALGOID NUMBER) IS SELECT COUNT(FK_SMID) FROM TURALGOSMID WHERE FK_ALGOID=pFK_ALGOID;
str VARCHAR2(1000);
strT VARCHAR2(100);
strA VARCHAR2(4000);
strFunc VARCHAR2(100);
i NUMBER;
nSMID NUMBER;
BEGIN
  OPEN cCheckFormula(pFK_ID,pFN_COL,pFN_ROW);
  FETCH cCheckFormula INTO i;
  CLOSE cCheckFormula;
  IF i=0 THEN
    OPEN cGetText(pFK_ID,pFN_COL,pFN_ROW);
    FETCH cGetText INTO str,strFunc;
    CLOSE cGetText;
    IF str IS NULL THEN
      str:='&nbsp;';
    END IF;
    IF strFunc='ORDER' AND str IS NULL THEN
      str:=pFN_ROW;
    END IF;
    RETURN str;
  END IF;
  str:='';
  FOR p IN cFormula(pFK_ID,pFN_COL,pFN_ROW) LOOP
    IF p.FC_SIGN IS NOT NULL THEN
--      raise_application_error(-20002,str);
      str:=str||' '||p.FC_SIGN;
    ELSE
      OPEN cGetFunc(p.FK_FUNCID);
      FETCH cGetFunc INTO strT;
      CLOSE cGetFunc;
      strA:=chr(13)||strT||'('||pFC_PERIOD||','||pFK_ID||','||pFN_COL||','||pFN_ROW;
      OPEN cCountFuncParams(p.FK_FUNCID);
      FETCH cCountFuncParams INTO i;
      CLOSE cCountFuncParams;
      IF i=0 THEN
--        NULL;
        strA:=strA||')';
      ELSE
        FOR z IN cFuncParams(p.FK_FUNcID) LOOP
          IF z.FP_PARAM=0 THEN
            OPEN cCheckSMID(p.FK_ID);
            FETCH cCheckSMID INTO nSMID;
            CLOSE cCheckSMID;
            IF nSMID>0 THEN
              strA:=strA||', '' AND FK_SMID IN (SELECT FK_SMID FROM TURALGOSMID WHERE FK_ALGOID='||p.FK_ID||')''';
            ELSE
              strA:=strA||', '' ''';
            END IF;
          ELSIF z.FP_PARAM=1 THEN
            IF p.FL_AMB=-2 THEN
              strA:=strA||','||''' ''';
            ELSIF p.FL_AMB=-1 THEN
              strA:=strA||','||''' AND FL_AMB=0 ''';
            ELSIF p.FL_AMB=0 THEN
              strA:=strA||','||''' AND FL_AMB=1 ''';
            ELSIF p.FL_AMB>0 THEN
              strA:=strA||','||''' AND FL_AMB='||p.FL_AMB||' ''';
            END IF;
--            str:=str||','||p.FL_AMB;
          ELSIF z.FP_PARAM=2 THEN
            IF p.FP_SEX=0 THEN
              strA:=strA||', '' AND FP_SEX=0 ''';
            ELSIF p.FP_SEX=1 THEN
              strA:=strA||', '' AND FP_SEX=1 ''';
            ELSIF p.FP_SEX=2 THEN
              strA:=strA||', '' ''';
            END IF;
          ELSIF z.FP_PARAM=3 THEN
            IF p.FN_AGE1 IS NOT NULL AND p.FN_AGE2 IS NOT NULL THEN
              strA:=strA||','' AND FN_VOZR BETWEEN '||p.FN_AGE1||' AND '||p.FN_AGE2||''' ';
            ELSE
              strA:=strA||', '' '' ';
            END IF;
          ELSIF z.FP_PARAM=4 THEN
            strA:='('||GET_FORM_CELL(pFC_PERIOD,pFK_ID,p.FN_COL,p.FN_ROW);
          ELSIF z.FP_PARAM=5 THEN
            strA:=strA||','''||p.FN_VALUE||'''';
          END IF;
        END LOOP;
        strA:=strA||')';
      END IF;
      str:=str||strA;
    END IF;
  END LOOP;
  RETURN str;
END;
FUNCTION GET_COMPARE_CELL(pFC_PERIOD IN VARCHAR2,pFK_ID IN NUMBER,pFN_COL IN NUMBER,pFN_ROW IN NUMBER) RETURN VARCHAR2
IS
CURSOR cFormula(pID NUMBER,pCol NUMBER,pRow NUMBER) IS SELECT TURALGO.FK_ID,FK_FUNCID,FC_SIGN,FP_SEX,FN_AGE1,FN_AGE2,FL_AMB,FN_VALUE,TURALGO.FN_COL,TURALGO.FN_ROW
                          FROM TURALGO,TURCELLS
                          WHERE TURALGO.FK_CELLID=TURCELLS.FK_ID AND TURCELLS.FK_REPORTID=pID
                                AND TURCELLS.FN_COL=pCol AND TURCELLS.FN_ROW=pRow ORDER BY FN_ORDER;
CURSOR cGetFunc(pFUNCID NUMBER) IS SELECT FC_NAME FROM TURFUNCS WHERE FK_ID=pFUNCID;
CURSOR cCheckFormula(pID NUMBER,pCol NUMBER,pRow NUMBER) IS SELECT COUNT(TURALGO.FK_ID)
                          FROM TURALGO,TURCELLS
                          WHERE TURALGO.FK_CELLID=TURCELLS.FK_ID AND TURCELLS.FK_REPORTID=pID
                                AND TURCELLS.FN_COL=pCol AND TURCELLS.FN_ROW=pRow ORDER BY FN_ORDER;
CURSOR cGetText(pID NUMBER,pCol NUMBER,pRow NUMBER) IS SELECT FC_NAME,FC_FUNC
                          FROM TURCELLS
                          WHERE TURCELLS.FK_REPORTID=pID
                                AND TURCELLS.FN_COL=pCol AND TURCELLS.FN_ROW=pRow;
CURSOR cFuncParams(pFUNCID NUMBER) IS SELECT FP_PARAM FROM TURFUNCSPARAMS WHERE FK_FUNCID=pFUNCID;
CURSOR cCountFuncParams(pFUNCID NUMBER) IS SELECT COUNT(FK_ID) FROM TURFUNCSPARAMS WHERE FK_FUNCID=pFUNCID;
CURSOR cCheckSMID (pFK_ALGOID NUMBER) IS SELECT COUNT(FK_SMID) FROM TURALGOSMID WHERE FK_ALGOID=pFK_ALGOID;
str VARCHAR2(1000);
strT VARCHAR2(100);
strA VARCHAR2(4000);
strFunc VARCHAR2(100);
i NUMBER;
nSMID NUMBER;
BEGIN
/*  OPEN cCheckFormula(pFK_ID,pFN_COL,pFN_ROW);
  FETCH cCheckFormula INTO i;
  CLOSE cCheckFormula;
  IF i=0 THEN
    OPEN cGetText(pFK_ID,pFN_COL,pFN_ROW);
    FETCH cGetText INTO str,strFunc;
    CLOSE cGetText;
    IF str IS NULL THEN
      str:='&nbsp;';
    END IF;
    IF strFunc='ORDER' AND str IS NULL THEN
      str:=pFN_ROW;
    END IF;
    RETURN str;
  END IF;
  str:='';
*/
  FOR p IN cFormula(pFK_ID,pFN_COL,pFN_ROW) LOOP
    IF p.FC_SIGN IS NOT NULL THEN
--      raise_application_error(-20002,str);
      str:=str||' '||p.FC_SIGN;
    ELSE
      OPEN cGetFunc(p.FK_FUNCID);
      FETCH cGetFunc INTO strT;
      CLOSE cGetFunc;
      strA:=chr(13)||strT||'('||pFC_PERIOD||','||pFK_ID||','||pFN_COL||','||pFN_ROW;
      OPEN cCountFuncParams(p.FK_FUNCID);
      FETCH cCountFuncParams INTO i;
      CLOSE cCountFuncParams;
      IF i=0 THEN
--        NULL;
        strA:=strA||')';
      ELSE
        FOR z IN cFuncParams(p.FK_FUNcID) LOOP
          IF z.FP_PARAM=0 THEN
            OPEN cCheckSMID(p.FK_ID);
            FETCH cCheckSMID INTO nSMID;
            CLOSE cCheckSMID;
            IF nSMID>0 THEN
              strA:=strA||', '' AND FK_SMID IN (SELECT FK_SMID FROM TURALGOSMID WHERE FK_ALGOID='||p.FK_ID||')''';
            ELSE
              strA:=strA||', '' ''';
            END IF;
          ELSIF z.FP_PARAM=1 THEN
            IF p.FL_AMB=-2 THEN
              strA:=strA||','||''' ''';
            ELSIF p.FL_AMB=-1 THEN
              strA:=strA||','||''' AND FL_AMB=0 ''';
            ELSIF p.FL_AMB=0 THEN
              strA:=strA||','||''' AND FL_AMB=1 ''';
            ELSIF p.FL_AMB>0 THEN
              strA:=strA||','||''' AND FL_AMB='||p.FL_AMB||' ''';
            END IF;
--            str:=str||','||p.FL_AMB;
          ELSIF z.FP_PARAM=2 THEN
            IF p.FP_SEX=0 THEN
              strA:=strA||', '' AND FP_SEX=0 ''';
            ELSIF p.FP_SEX=1 THEN
              strA:=strA||', '' AND FP_SEX=1 ''';
            ELSIF p.FP_SEX=2 THEN
              strA:=strA||', '' ''';
            END IF;
          ELSIF z.FP_PARAM=3 THEN
            IF p.FN_AGE1 IS NOT NULL AND p.FN_AGE2 IS NOT NULL THEN
              strA:=strA||','' AND FN_VOZR BETWEEN '||p.FN_AGE1||' AND '||p.FN_AGE2||''' ';
            ELSE
              strA:=strA||', '' '' ';
            END IF;
          ELSIF z.FP_PARAM=4 THEN
            strA:='('||GET_COMPARE_CELL(pFC_PERIOD,pFK_ID,p.FN_COL,p.FN_ROW);
          ELSIF z.FP_PARAM=5 THEN
            strA:=strA||','''||p.FN_VALUE||'''';
          END IF;
        END LOOP;
        strA:=strA||')';
      END IF;
      str:=str||strA;
    END IF;
  END LOOP;
  RETURN str;
END;
FUNCTION DO_EXTRACT_DATES (pFC_DATES IN VARCHAR2,pFK_PERIOD IN NUMBER) RETURN TPERIODS IS
aPeriods TPERIODS;
str VARCHAR2(1000);
str2 VARCHAR2(1000);
i NUMBER;
BEGIN
  IF pFK_PERIOD=0 THEN
    aPeriods(1).dData1:=TO_DATE(pFC_DATES,'dd.mm.yyyy');
    aPeriods(1).dData2:=NULL;
  ELSIF pFK_PERIOD=1 THEN
    aPeriods(1).dData1:=TO_DATE(SUBSTR(pFC_DATES,1,pos ('-',pFC_DATES)-1),'dd.mm.yyyy');
    aPeriods(1).dData2:=TO_DATE(SUBSTR(pFC_DATES,pos ('-',pFC_DATES)+1,10),'dd.mm.yyyy');
  ELSIF pFK_PERIOD=2 THEN
    str:=pFC_DATES;
    i:=1;
    LOOP
      EXIT WHEN str IS NULL;
      str2:=SUBSTR(str,1,pos ('|',str)-1);
      str:=SUBSTR(str,pos ('|',str)+1,LENGTH(str)-pos ('|',str));
/*      aPeriods(i).dData1:=TO_DATE(SUBSTR(str2,1,pos ('-',pFC_DATES)-1),'dd.mm.yyyy');
      aPeriods(i).dData2:=TO_DATE(SUBSTR(str2,pos ('-',pFC_DATES)+1,10),'dd.mm.yyyy');
*/
      aPeriods(i).dData1:=TO_DATE(SUBSTR(str2,1,pos ('-',str2)-1),'dd.mm.yyyy');
      aPeriods(i).dData2:=TO_DATE(SUBSTR(str2,pos ('-',str2)+1,10),'dd.mm.yyyy');
      str2:=SUBSTR(str2,pos ('(',str2)+1,LENGTH(str2)-pos ('(',str2));
      aPeriods(i).strDatas:=SUBSTR(str2,1,pos (')',str2)-1);
      i:=i+1;
    END LOOP;
  END IF;
  RETURN aPeriods;
END;
FUNCTION DO_CALC_FORM(pFK_ID IN NUMBER,pFD_DATES IN VARCHAR2) RETURN NUMBER IS
CURSOR cInfoReport IS SELECT FC_NAME,FK_PERIOD,FL_SETKA,FL_NULS,FK_DIVIDE,FL_OUT FROM TUREPORTS WHERE FK_ID=pFK_ID;
CURSOR cRows(ID NUMBER) IS SELECT DISTINCT FN_ROW FROM TURCELLS WHERE FK_REPORTID=ID ORDER BY FN_ROW;
CURSOR cCols(ID NUMBER,nROW NUMBER) IS SELECT DISTINCT FN_COL FROM TURCELLS WHERE FK_REPORTID=ID AND FN_ROW=nROW ORDER BY FN_COL;
CURSOR cCountRows(ID NUMBER) IS SELECT COUNT(DISTINCT FN_ROW) FROM TURCELLS WHERE FK_REPORTID=ID;
CURSOR cCountCols(ID NUMBER) IS SELECT COUNT(DISTINCT FN_COL) FROM TURCELLS WHERE FK_REPORTID=ID;
CURSOR cCheckFormula(pID NUMBER,pCol NUMBER,pRow NUMBER) IS SELECT COUNT(TURALGO.FK_ID)
                          FROM TURALGO,TURCELLS
                          WHERE TURALGO.FK_CELLID=TURCELLS.FK_ID AND TURCELLS.FK_REPORTID=pID
                                AND TURCELLS.FN_COL=pCol AND TURCELLS.FN_ROW=pRow ORDER BY FN_ORDER;
strName VARCHAR2(200);
nPeriod NUMBER;
bSetka NUMBER;
bNuls NUMBER;
nDivide NUMBER;
aPeriods TPERIODS;
CC CLOB;
str VARCHAR2(4000);
nc NUMBER;
strPeriod VARCHAR2(400);
bOut NUMBER;
i NUMBER;
j NUMBER;
BEGIN
  OPEN cInfoReport;
  FETCH cInfoReport INTO strName,nPeriod,bSetka,bNuls,nDivide,bOut;
  CLOSE cInfoReport;
  aPeriods:=DO_EXTRACT_DATES(pFD_DATES,nPeriod);
  strPeriod:=''' AND (';
  FOR i IN 1..aPeriods.COUNT LOOP
    IF aPeriods(i).dData2 IS NULL THEN
      IF i>1 THEN
        strPeriod:=strPeriod||' OR ';
      END IF;
      IF bOut=0 THEN
        strPeriod:=strPeriod||' FD_INS='''''||aPeriods(i).dData1||''''' ';
      ELSE
        strPeriod:=strPeriod||' FD_OUT='''''||aPeriods(i).dData1||''''' ';
      END IF;
    ELSE
      IF i>1 THEN
        strPeriod:=strPeriod||' OR ';
      END IF;
      IF bOut=0 THEN
        strPeriod:=strPeriod||' FD_INS BETWEEN '''''||aPeriods(i).dData1||''''' AND '''''||aPeriods(i).dData2||'''''';
      ELSE
        strPeriod:=strPeriod||' FD_OUT BETWEEN '''''||aPeriods(i).dData1||''''' AND '''''||aPeriods(i).dData2||'''''';
      END IF;
    END IF;
  END LOOP;
  strPeriod:=strPeriod||' ) ''';
--Собсно сбор отчета
  DBMS_LOB.CREATETEMPORARY (cc, TRUE, DBMS_LOB.SESSION);
  str     :=GET_HTML_HEADER(1,bSetka)||'<COMON>';
  DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
  str     := '<table align="center" width="100%" border="1" class = "sm_table" cellpadding="0" cellspacing="0">';
  DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
  OPEN cCountCols(pFK_ID);
  FETCH cCountCols INTO i;
  CLOSE cCountCols;
  OPEN cCountRows(pFK_ID);
  FETCH cCountRows INTO j;
  CLOSE cCountRows;

  PROGRESS_BAR.SETMAXVALUE(i*j);

  FOR R IN cRows(pFK_ID) LOOP
    str:='<TR ALIGN="CENTER">';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    FOR c IN cCols(pFK_ID,R.FN_ROW) LOOP
      PROGRESS_BAR.SETSTROUT('Расчет ячейки ['||cCols%ROWCOUNT||','||cRows%ROWCOUNT||']');
      PROGRESS_BAR.STEPIT;
      OPEN cCheckFormula(pFK_ID,c.FN_COL,R.FN_ROW);
      FETCH cCheckFormula INTO i;
      CLOSE cCheckFormula;
      IF i=0 THEN
        str:='<TD class="sm_td " > '||GET_FORM_CELL(strPeriod,pFK_ID,C.FN_COL,R.FN_ROW)||'</TD>';
      ELSE
        BEGIN
          EXECUTE IMMEDIATE 'SELECT '||GET_FORM_CELL(strPeriod,pFK_ID,C.FN_COL,R.FN_ROW)||' FROM DUAL' INTO i;
        EXCEPTION
          WHEN OTHERS THEN
              raise_application_error(-20002,'Ошибка в формуле');

        END;

        IF i IS NULL THEN
          i:=0;
        END IF;
        IF i=0 AND bNuls=0 THEN
          str:='<TD class="sm_td "  > &nbsp;</TD>';
        ELSE
          str:='<TD class="sm_td " style=''font-family:AdverGothic;''> '||i||'</TD>';
        END IF;
      END IF;
      DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    END LOOP;
    str:='</TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
  END LOOP;
  str     := '</TABLE>';
  DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
--
  INSERT INTO TCLOBS(FC_CLOB) VALUES (cc) RETURNING FK_ID INTO nC;
  RETURN nC;
END;
FUNCTION DO_CALC_COMPARE(pFK_ID IN NUMBER,pFD_DATES IN VARCHAR2) RETURN NUMBER IS
CURSOR cInfoReport IS SELECT FC_NAME,FK_PERIOD,FL_SETKA,FL_NULS,FK_DIVIDE,FL_OUT FROM TUREPORTS WHERE FK_ID=pFK_ID;
CURSOR cRows(ID NUMBER) IS SELECT DISTINCT FN_ROW FROM TURCELLS WHERE FK_REPORTID=ID ORDER BY FN_ROW;
CURSOR cCountRows(ID NUMBER) IS SELECT COUNT(DISTINCT FN_ROW) FROM TURCELLS WHERE FK_REPORTID=ID ;
CURSOR cCols(ID NUMBER,nROW NUMBER) IS SELECT DISTINCT FN_COL FROM TURCELLS WHERE FK_REPORTID=ID AND FN_ROW=nROW ORDER BY FN_COL;
CURSOR cCheckFormula(pID NUMBER,pCol NUMBER,pRow NUMBER) IS SELECT COUNT(TURALGO.FK_ID)
                          FROM TURALGO,TURCELLS
                          WHERE TURALGO.FK_CELLID=TURCELLS.FK_ID AND TURCELLS.FK_REPORTID=pID
                                AND TURCELLS.FN_COL=pCol AND TURCELLS.FN_ROW=pRow ORDER BY FN_ORDER;
CURSOR cGetText(pID NUMBER,pCol NUMBER,pRow NUMBER) IS SELECT FC_NAME,FC_FUNC
                          FROM TURCELLS
                          WHERE TURCELLS.FK_REPORTID=pID
                                AND TURCELLS.FN_COL=pCol AND TURCELLS.FN_ROW=pRow;
CURSOR cGetVozr IS SELECT FK_ID,FC_NAME,FN_1,FN_2 FROM TVOZR
                     UNION
                   SELECT -1,'Всего',TO_NUMBER(NULL),TO_NUMBER(NULL) FROM DUAL
                   ORDER BY FN_1;
CURSOR cGetAmb IS SELECT FK_ID,FC_NAME FROM TNAPR ORDER BY FN_ORDER;
CURSOR cGetSMID IS SELECT FK_SMID,GET_FULLPATH(FK_SMID) FC_NAME,FL_SHOWANAL,GET_ORDER(FK_SMID) FN_ORDER FROM TURALGOSMID,TSMID WHERE FK_ALGOID=pFK_ID AND TSMID.FK_ID=FK_SMID
                     UNION
                   SELECT GET_SYNID('RAZ_ANAL'),'Всего анализов',-1,GET_ORDER(GET_SYNID('RAZ_ANAL')) FROM DUAL ORDER BY 4;
strName VARCHAR2(200);
nPeriod NUMBER;
bSetka NUMBER;
bNuls NUMBER;
nDivide NUMBER;
aPeriods TPERIODS;
CC CLOB;
str VARCHAR2(4000);
nc NUMBER;
i NUMBER(10,2);
nDiv NUMBER;
aDivide TRECORDS;
nRow NUMBER;
strText VARCHAR2(50);
strFunc VARCHAR2(100);
dMin DATE;
dMax DATE;
strOut VARCHAR2(100);
strSQL VARCHAR2(3000);
bOut NUMBER;
BEGIN
  OPEN cInfoReport;
  FETCH cInfoReport INTO strName,nPeriod,bSetka,bNuls,nDivide,bOut;
  CLOSE cInfoReport;
  aPeriods:=DO_EXTRACT_DATES(pFD_DATES,nPeriod);
  dMin:=TO_DATE('31.12.2100','dd.mm.yyyy');
  dMax:=TO_DATE('01.01.1900','dd.mm.yyyy');
  FOR i IN 1..aPeriods.COUNT LOOP
    IF aPeriods(i).dData1<dMin THEN
      dMin:=aPeriods(i).dData1;
    END IF;
    IF aPeriods(i).dData2>dMax THEN
      dMax:=aPeriods(i).dData2;
    END IF;
  END LOOP;
  aPeriods(aPeriods.COUNT+1).dData1:=dMin;
  aPeriods(aPeriods.COUNT).dData2:=dMax;
  aPeriods(aPeriods.COUNT).strDatas:='Итого';
--Собсно сбор отчета
  DBMS_LOB.CREATETEMPORARY (cc, TRUE, DBMS_LOB.SESSION);
  str     :=GET_HTML_HEADER(1,bSetka)||'<COMON>';
  DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
  str     := '<table align="center" width="100%" border="1" class = "sm_table" cellpadding="0" cellspacing="0">';
  DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);

  OPEN cCountRows(pFK_ID);
  FETCH cCountRows INTO i;
  CLOSE cCountRows;
  PROGRESS_BAR.SETMaxValue(i*(aPeriods.COUNT+1));
  FOR c IN cRows(pFK_ID) LOOP
    str:='<TR ALIGN="CENTER">';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    FOR nRow IN 0..aPeriods.COUNT LOOP
      OPEN cGetText(pFK_ID,0,C.FN_ROW);
      FETCH cGetText INTO strText,strFunc;
      CLOSE cGetText;
      IF nRow>0 THEN
        IF strFunc='ORDER' THEN
          str:='<TD class="sm_td " > '||nRow||'</TD>';
        ELSIF strFunc='NAME' THEN
          str:='<TD class="sm_td " > '||aPeriods(nRow).strDatas||':</TD>';
        ELSE
          BEGIN
--            strSQL:=
            i:=0;
            IF bOut=0 THEN
              EXECUTE IMMEDIATE 'SELECT '||GET_COMPARE_CELL(''' AND FD_INS BETWEEN '''''||aPeriods(nRow).dData1||''''' AND '''''||aPeriods(nRow).dData2||'''''''',pFK_ID,0,c.FN_ROW)||' FROM DUAL' INTO i;
            ELSe
              EXECUTE IMMEDIATE 'SELECT '||GET_COMPARE_CELL(''' AND FD_OUT BETWEEN '''''||aPeriods(nRow).dData1||''''' AND '''''||aPeriods(nRow).dData2||'''''''',pFK_ID,0,c.FN_ROW)||' FROM DUAL' INTO i;
            END IF;
          EXCEPTION
            WHEN OTHERS THEN
--              raise_application_error(-20002,'Ошибка в формуле');
--              raise;
              NULL;
--            raise_application_error(-20002,'SELECT '||GET_COMPARE_CELL(''' AND FD_INS BETWEEN '''''||aPeriods(nRow).dData1||''''' AND '''''||aPeriods(nRow).dData2||'''''''',pFK_ID,0,c.FN_ROW)||' FROM DUAL');
          END;
          IF i IS NULL THEN
            i:=0;
          END IF;
          IF i=0 AND bNuls=0 THEN
            str:='<TD class="sm_td " > &nbsp;</TD>';
          ELSE
            str:='<TD class="sm_td " > '||i||'</TD>';
          END IF;
        END IF;
      ELSE
        IF strText IS NULL THEN
          str:='<TD class="sm_td " > &nbsp;</TD>';
        ELSe
          str:='<TD class="sm_td " > '||strText||'</TD>';
          strOut:=strText;
        END IF;
      END IF;
      DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
      IF nRow>0 THEN
        PROGRESS_BAR.SETSTROUT('Сборка параметра '||strOut||' за период с '||aPeriods(nRow).dData1||' по '||aPeriods(nRow).dData2);
      END IF;
      PROGRESS_BAR.STEPIT;
    END LOOP;
    str:='</TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
  END LOOP;
  str     := '</TABLE>';
  DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
--
  INSERT INTO TCLOBS(FC_CLOB) VALUES (cc) RETURNING FK_ID INTO nC;
  RETURN nC;
END;
FUNCTION DO_CALC_SVOD(pFK_ID IN NUMBER,pFD_DATES IN VARCHAR2) RETURN NUMBER IS
CURSOR cInfoReport IS SELECT FC_NAME,FK_PERIOD,FL_SETKA,FL_NULS,FK_DIVIDE,FL_OUT FROM TUREPORTS WHERE FK_ID=pFK_ID;
CURSOR cRows(ID NUMBER) IS SELECT DISTINCT FN_ROW FROM TURCELLS WHERE FK_REPORTID=ID ORDER BY FN_ROW;
CURSOR cCols(ID NUMBER,nROW NUMBER) IS SELECT DISTINCT FN_COL FROM TURCELLS WHERE FK_REPORTID=ID AND FN_ROW=nROW ORDER BY FN_COL;
CURSOR cCheckFormula(pID NUMBER,pCol NUMBER,pRow NUMBER) IS SELECT COUNT(TURALGO.FK_ID)
                          FROM TURALGO,TURCELLS
                          WHERE TURALGO.FK_CELLID=TURCELLS.FK_ID AND TURCELLS.FK_REPORTID=pID
                                AND TURCELLS.FN_COL=pCol AND TURCELLS.FN_ROW=pRow ORDER BY FN_ORDER;
CURSOR cGetText(pID NUMBER,pCol NUMBER,pRow NUMBER) IS SELECT FC_NAME,FC_FUNC
                          FROM TURCELLS
                          WHERE TURCELLS.FK_REPORTID=pID
                                AND TURCELLS.FN_COL=pCol AND TURCELLS.FN_ROW=pRow;
CURSOR cGetVozr IS SELECT FK_ID,FC_NAME,FN_1,FN_2 FROM TVOZR
                     UNION
                   SELECT -1,'Всего',TO_NUMBER(NULL),TO_NUMBER(NULL) FROM DUAL
                   ORDER BY FN_1;
CURSOR cGetAmb IS SELECT FK_ID,FC_NAME FROM TNAPR ORDER BY FN_ORDER;
CURSOR cGetSMID IS SELECT FK_SMID,GET_FULLPATH(FK_SMID) FC_NAME,FL_SHOWANAL,GET_ORDER(FK_SMID) FN_ORDER FROM TURALGOSMID,TSMID WHERE FK_ALGOID=pFK_ID AND TSMID.FK_ID=FK_SMID
                     UNION
                   SELECT GET_SYNID('RAZ_ANAL'),'Всего анализов',-1,GET_ORDER(GET_SYNID('RAZ_ANAL')) FROM DUAL ORDER BY 4;
CURSOR cCountRows(ID NUMBER) IS SELECT COUNT(DISTINCT FN_ROW) FROM TURCELLS WHERE FK_REPORTID=ID ;
strName VARCHAR2(200);
nPeriod NUMBER;
bSetka NUMBER;
bNuls NUMBER;
nDivide NUMBER;
aPeriods TPERIODS;
CC CLOB;
str VARCHAR2(4000);
nc NUMBER;
strPeriod VARCHAR2(400);
i NUMBER;
nDiv NUMBER;
aDivide TRECORDS;
nRow NUMBER;
strText VARCHAR2(50);
strFunc VARCHAR2(100);
strOut VARCHAR2(100);
bOut NUMBER;
BEGIN
  OPEN cInfoReport;
  FETCH cInfoReport INTO strName,nPeriod,bSetka,bNuls,nDivide,bOut;
  CLOSE cInfoReport;
  aPeriods:=DO_EXTRACT_DATES(pFD_DATES,nPeriod);
  strPeriod:=''' AND (';
  FOR i IN 1..aPeriods.COUNT LOOP
    IF aPeriods(i).dData2 IS NULL THEN
      IF i>1 THEN
        strPeriod:=strPeriod||' OR ';
      END IF;
      IF bOut=0 THEN
        strPeriod:=strPeriod||' FD_INS='''''||aPeriods(i).dData1||''''' ';
      ELSe
        strPeriod:=strPeriod||' FD_OUT='''''||aPeriods(i).dData1||''''' ';
      END IF;
    ELSE
      IF i>1 THEN
        strPeriod:=strPeriod||' OR ';
      END IF;
      IF bOut=0 THEN
        strPeriod:=strPeriod||' FD_INS BETWEEN '''''||aPeriods(i).dData1||''''' AND '''''||aPeriods(i).dData2||'''''';
      ELSE
        strPeriod:=strPeriod||' FD_OUT BETWEEN '''''||aPeriods(i).dData1||''''' AND '''''||aPeriods(i).dData2||'''''';
      END IF;
    END IF;
  END LOOP;
  strPeriod:=strPeriod||' ) ''';
--Собсно сбор отчета
  DBMS_LOB.CREATETEMPORARY (cc, TRUE, DBMS_LOB.SESSION);
  str     :=GET_HTML_HEADER(1,bSetka)||'<COMON>';
  DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
  str     := '<table align="center" width="100%" border="1" class = "sm_table" cellpadding="0" cellspacing="0">';
  DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
  IF nDivide=0 THEN
    aDivide(1).ID:=1;
    aDivide(1).NAME:='Мужской';
    aDivide(2).ID:=0;
    aDivide(2).NAME:='Женский';
    aDivide(3).ID:=2;
    aDivide(3).NAME:='Всего';
  ELSIF nDivide=1 THEN
    FOR p IN cGetVozr LOOP
      aDivide(cGetVozr%ROWCOUNT).ID:=p.FK_ID;
      aDivide(cGetVozr%ROWCOUNT).NAME:=p.FC_NAME;
      aDivide(cGetVozr%ROWCOUNT).AGE1:=p.FN_1;
      aDivide(cGetVozr%ROWCOUNT).AGE2:=p.FN_2;
    END LOOP;
  ELSIF nDivide=2 THEN
    aDivide(1).ID:=-1;
    aDivide(1).NAME:='Пациенты';
    aDivide(2).ID:=0;
    aDivide(2).NAME:='Амбулаторные всего';
    i:=2;
    FOR p IN cGetAmb LOOP
      aDivide(2+cGetAmb%ROWCOUNT).ID:=p.FK_ID;
      aDivide(2+cGetAmb%ROWCOUNT).NAME:='В т.ч. '||p.FC_NAME;
      i:=2+cGetAmb%ROWCOUNT;
    END LOOP;
    aDivide(i+1).ID:=-2;
    aDivide(i+1).NAME:='Всего';
  ELSIF nDivide=3 THEN
    FOR p IN cGetSMID LOOP
      aDivide(cGetSMID%ROWCOUNT).ID:=p.FK_SMID;
      aDivide(cGetSMID%ROWCOUNT).NAME:=p.FC_NAME;
      aDivide(cGetSMID%ROWCOUNT).AGE1:=p.FL_SHOWANAL;
    END LOOP;
  END IF;
  OPEN cCountRows(pFK_ID);
  FETCH cCOuntRows INTO i;
  CLOSE cCountRows;
  PROGRESS_BAR.SETMAXVALUE(i+(aDivide.COUNT+1));
--  FOR nRow IN 0..aDivide.COUNT LOOP
  FOR c IN cRows(pFK_ID) LOOP
    str:='<TR ALIGN="CENTER">';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
--    FOR c IN cCols(pFK_ID,0) LOOP
    FOR nRow IN 0..aDivide.COUNT LOOP
      OPEN cGetText(pFK_ID,0,C.FN_ROW);
      FETCH cGetText INTO strText,strFunc;
      CLOSE cGetText;
       IF nRow>0 THEN
        IF strFunc='ORDER' THEN
          str:='<TD class="sm_td " > '||nRow||'</TD>';
        ELSIF strFunc='NAME' THEN
          str:='<TD class="sm_td " > '||aDivide(nRow).NAME||'</TD>';
        ELSE
          BEGIN
            IF nDivide=0 THEN
              EXECUTE IMMEDIATE 'SELECT '||GET_SEX_CELL(strPeriod,pFK_ID,C.FN_ROW,aDivide(nRow).ID,1)||' FROM DUAL' INTO i;
            ELSIF nDivide=1 THEN
              EXECUTE IMMEDIATE 'SELECT '||GET_AGE_CELL(strPeriod,pFK_ID,C.FN_ROW,aDivide(nRow).AGE1,aDivide(nRow).AGE2,1)||' FROM DUAL' INTO i;
            ELSIF nDivide=2 THEN
              EXECUTE IMMEDIATE 'SELECT '||GET_CATEGORY_CELL(strPeriod,pFK_ID,C.FN_ROW,aDivide(nRow).ID,1)||' FROM DUAL' INTO i;
            ELSIF nDivide=3 THEN
              EXECUTE IMMEDIATE 'SELECT '||GET_SMID_CELL(strPeriod,pFK_ID,C.FN_ROW,aDivide(nRow).ID,aDivide(nRow).AGE1,1)||' FROM DUAL' INTO i;
            END IF;
          EXCEPTION
            WHEN OTHERS THEN
----              NULL;
              raise_application_error(-20002,'Ошибка в формуле');
--              raise_application_error(-20002,'SELECT '||GET_SEX_CELL(strPeriod,pFK_ID,C.FN_ROW,aDivide(nRow).ID,1)||' FROM DUAL');
          END;
          IF i IS NULL THEN
            i:=0;
          END IF;
          IF i=0 AND bNuls=0 THEN
            str:='<TD class="sm_td " > &nbsp;</TD>';
          ELSE
            str:='<TD class="sm_td " > '||i||'</TD>';
          END IF;
        END IF;
      ELSE
        IF strText IS NULL THEN
          str:='<TD class="sm_td " > &nbsp;</TD>';
        ELSe
          str:='<TD class="sm_td " > '||strText||'</TD>';
          strOut:=strText;
        END IF;
      END IF;
      DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
      IF nRow>0 THEN
        PROGRESS_BAR.SETSTROUT('Подсчет параметра '||strOut||' по категории '||aDivide(nRow).NAME);
      END IF;
      PROGRESS_BAR.STEPIT;
    END LOOP;
    str:='</TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
  END LOOP;
  str     := '</TABLE>';
  DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
--
  INSERT INTO TCLOBS(FC_CLOB) VALUES (cc) RETURNING FK_ID INTO nC;
  RETURN nC;
END;
FUNCTION DO_CALC_TABLE(pFK_ID IN NUMBER,pFD_DATES IN VARCHAR2) RETURN NUMBER IS
CURSOR cInfoReport IS SELECT FC_NAME,FK_PERIOD,FL_SETKA,FL_NULS,FK_DIVIDE,FL_OUT FROM TUREPORTS WHERE FK_ID=pFK_ID;
CURSOR cRows(ID NUMBER) IS SELECT DISTINCT FN_ROW FROM TURCELLS WHERE FK_REPORTID=ID ORDER BY FN_ROW;
CURSOR cCols(ID NUMBER,nROW NUMBER) IS SELECT DISTINCT FN_COL FROM TURCELLS WHERE FK_REPORTID=ID AND FN_ROW=nROW ORDER BY FN_COL;
CURSOR cCountCols(ID NUMBER) IS SELECT COUNT(DISTINCT FN_COL) FROM TURCELLS WHERE FK_REPORTID=ID;
CURSOR cCheckFormula(pID NUMBER,pCol NUMBER,pRow NUMBER) IS SELECT COUNT(TURALGO.FK_ID)
                          FROM TURALGO,TURCELLS
                          WHERE TURALGO.FK_CELLID=TURCELLS.FK_ID AND TURCELLS.FK_REPORTID=pID
                                AND TURCELLS.FN_COL=pCol AND TURCELLS.FN_ROW=pRow ORDER BY FN_ORDER;
CURSOR cGetText(pID NUMBER,pCol NUMBER,pRow NUMBER) IS SELECT FC_NAME,FC_FUNC
                          FROM TURCELLS
                          WHERE TURCELLS.FK_REPORTID=pID
                                AND TURCELLS.FN_COL=pCol AND TURCELLS.FN_ROW=pRow;
CURSOR cGetVozr IS SELECT FK_ID,FC_NAME,FN_1,FN_2 FROM TVOZR
                     UNION
                   SELECT -1,'Всего',TO_NUMBER(NULL),TO_NUMBER(NULL) FROM DUAL
                   ORDER BY FN_1;
CURSOR cGetAmb IS SELECT FK_ID,FC_NAME FROM TNAPR ORDER BY FN_ORDER;
CURSOR cGetSMID IS SELECT FK_SMID,GET_FULLPATH(FK_SMID)FC_NAME,FL_SHOWANAL,GET_ORDER(FK_SMID) FN_ORDER FROM TURALGOSMID,TSMID WHERE FK_ALGOID=pFK_ID AND TSMID.FK_ID=FK_SMID
                     UNION
                   SELECT GET_SYNID('RAZ_ANAL'),'Всего анализов',-1,GET_ORDER(GET_SYNID('RAZ_ANAL')) FROM DUAL ORDER BY 4;
strName VARCHAR2(200);
nPeriod NUMBER;
bSetka NUMBER;
bNuls NUMBER;
nDivide NUMBER;
aPeriods TPERIODS;
CC CLOB;
str VARCHAR2(4000);
nc NUMBER;
strPeriod VARCHAR2(400);
i NUMBER;
nDiv NUMBER;
aDivide TRECORDS;
nRow NUMBER;
strText VARCHAR2(50);
strFunc VARCHAR2(100);
strOut VARCHAR2(100);
bOut NUMBER;
BEGIN
  OPEN cInfoReport;
  FETCH cInfoReport INTO strName,nPeriod,bSetka,bNuls,nDivide,bOut;
  CLOSE cInfoReport;
  aPeriods:=DO_EXTRACT_DATES(pFD_DATES,nPeriod);
  strPeriod:=''' AND (';
  FOR i IN 1..aPeriods.COUNT LOOP
    IF aPeriods(i).dData2 IS NULL THEN
      IF i>1 THEN
        strPeriod:=strPeriod||' OR ';
      END IF;
      IF bOut=0 THEN
        strPeriod:=strPeriod||' FD_INS='''''||aPeriods(i).dData1||''''' ';
      ELSE
        strPeriod:=strPeriod||' FD_OUT='''''||aPeriods(i).dData1||''''' ';
      END IF;
    ELSE
      IF i>1 THEN
        strPeriod:=strPeriod||' OR ';
      END IF;
      IF bOut=0 THEN
        strPeriod:=strPeriod||' FD_INS BETWEEN '''''||aPeriods(i).dData1||''''' AND '''''||aPeriods(i).dData2||'''''';
      ELSE
        strPeriod:=strPeriod||' FD_OUT BETWEEN '''''||aPeriods(i).dData1||''''' AND '''''||aPeriods(i).dData2||'''''';
      END IF;
    END IF;
  END LOOP;
  strPeriod:=strPeriod||' ) ''';
--Собсно сбор отчета
  DBMS_LOB.CREATETEMPORARY (cc, TRUE, DBMS_LOB.SESSION);
  str     :=GET_HTML_HEADER(1,bSetka)||'<COMON>';
  DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
  str     := '<table align="center" width="100%" border="1" class = "sm_table" cellpadding="0" cellspacing="0">';
  DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
  IF nDivide=0 THEN
    aDivide(1).ID:=1;
    aDivide(1).NAME:='Мужской';
    aDivide(2).ID:=0;
    aDivide(2).NAME:='Женский';
    aDivide(3).ID:=2;
    aDivide(3).NAME:='Всего';
  ELSIF nDivide=1 THEN
    FOR p IN cGetVozr LOOP
      aDivide(cGetVozr%ROWCOUNT).ID:=p.FK_ID;
      aDivide(cGetVozr%ROWCOUNT).NAME:=p.FC_NAME;
      aDivide(cGetVozr%ROWCOUNT).AGE1:=p.FN_1;
      aDivide(cGetVozr%ROWCOUNT).AGE2:=p.FN_2;
    END LOOP;
  ELSIF nDivide=2 THEN
    aDivide(1).ID:=-1;
    aDivide(1).NAME:='Пациенты';
    aDivide(2).ID:=0;
    aDivide(2).NAME:='Амбулаторные всего';
    i:=2;
    FOR p IN cGetAmb LOOP
      aDivide(2+cGetAmb%ROWCOUNT).ID:=p.FK_ID;
      aDivide(2+cGetAmb%ROWCOUNT).NAME:='В т.ч. '||p.FC_NAME;
      i:=2+cGetAmb%ROWCOUNT;
    END LOOP;
    aDivide(i+1).ID:=-2;
    aDivide(i+1).NAME:='Всего';
  ELSIF nDivide=3 THEN
    FOR p IN cGetSMID LOOP
      aDivide(cGetSMID%ROWCOUNT).ID:=p.FK_SMID;
      aDivide(cGetSMID%ROWCOUNT).NAME:=p.FC_NAME;
      aDivide(cGetSMID%ROWCOUNT).AGE1:=p.FL_SHOWANAL;
    END LOOP;
  END IF;
  OPEN cCountCols(pFK_ID);
  FETCH cCountCols INTO i;
  CLOSE cCountCols;
  PROGRESS_BAR.SETMAXVALUE(i*(aDivide.COUNT+1));
  FOR nRow IN 0..aDivide.COUNT LOOP
    str:='<TR ALIGN="CENTER">';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
    FOR c IN cCols(pFK_ID,0) LOOP
      OPEN cGetText(pFK_ID,C.FN_COL,0);
      FETCH cGetText INTO strText,strFunc;
      CLOSE cGetText;
       IF nRow>0 THEN
        IF strFunc='ORDER' THEN
          str:='<TD class="sm_td " > '||nRow||'</TD>';
        ELSIF strFunc='NAME' THEN
          str:='<TD class="sm_td " > '||aDivide(nRow).NAME||'</TD>';
        ELSE
          BEGIN
            IF nDivide=0 THEN
              EXECUTE IMMEDIATE 'SELECT '||GET_SEX_CELL(strPeriod,pFK_ID,C.FN_COL,aDivide(nRow).ID,0)||' FROM DUAL' INTO i;
            ELSIF nDivide=1 THEN
              EXECUTE IMMEDIATE 'SELECT '||GET_AGE_CELL(strPeriod,pFK_ID,C.FN_COL,aDivide(nRow).AGE1,aDivide(nRow).AGE2,0)||' FROM DUAL' INTO i;
            ELSIF nDivide=2 THEN
              EXECUTE IMMEDIATE 'SELECT '||GET_CATEGORY_CELL(strPeriod,pFK_ID,C.FN_COL,aDivide(nRow).ID,0)||' FROM DUAL' INTO i;
            ELSIF nDivide=3 THEN
              EXECUTE IMMEDIATE 'SELECT '||GET_SMID_CELL(strPeriod,pFK_ID,C.FN_COL,aDivide(nRow).ID,aDivide(nRow).AGE1,0)||' FROM DUAL' INTO i;
            END IF;
          EXCEPTION
            WHEN OTHERS THEN
              raise_application_error(-20002,'Ошибка в формуле');
--              NULL;
--              raise_application_error(-20002,'Ошибка в формуле');
--              raise_application_error(-20002,'SELECT '||GET_FORM_CELL(strPeriod,pFK_ID,C.FN_COL,R.FN_ROW)||' FROM DUAL');
          END;
          IF i IS NULL THEN
            i:=0;
          END IF;
          IF i=0 AND bNuls=0 THEN
            str:='<TD class="sm_td " > &nbsp;</TD>';
          ELSE
            str:='<TD class="sm_td " > '||i||'</TD>';
          END IF;
        END IF;
      ELSE
        IF strText IS NULL THEN
          str:='<TD class="sm_td " > &nbsp;</TD>';
        ELSe
          str:='<TD class="sm_td " > '||strText||'</TD>';
          strOut:=strText;
        END IF;
      END IF;
      DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
      IF nRow>0 THEN
        PROGRESS_BAR.SETSTROUT('Подсчет параметра '||strOut||' по категории '||aDivide(nRow).NAME);
      END IF;
      PROGRESS_BAR.STEPIT;
    END LOOP;
    str:='</TR>';
    DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
  END LOOP;
  str     := '</TABLE>';
  DBMS_LOB.WRITEAPPEND (cC, LENGTH (str), str);
--
  INSERT INTO TCLOBS(FC_CLOB) VALUES (cc) RETURNING FK_ID INTO nC;
  RETURN nC;
END;
FUNCTION DO_CALCULATE_REPORT(pFK_ID IN NUMBER,pFD_DATES IN VARCHAR2) RETURN NUMBER IS
CURSOR cWhatTheReport IS SELECT FK_TYPE FROM TUREPORTS WHERE FK_ID=pFK_ID;
i NUMBER;
BEGIN
  OPEN cWhatTheReport;
  FETCH cWhatTheReport INTO i;
  CLOSE cWhatTheReport;
  IF i=0 THEN
    i:=DO_CALC_FORM(pFK_ID,pFD_DATES);
  ELSIF i=1 THEN
    i:=DO_CALC_TABLE(pFK_ID,pFD_DATES);
  ELSIF i=2 THEN
    i:=DO_CALC_SVOD(pFK_ID,pFD_DATES);
  ELSIF i=3 THEN
    i:=DO_CALC_COMPARE(pFK_ID,pFD_DATES);
  END IF;
  RETURN i;
END;
END; -- Package Body PKG_URCORE
/

SHOW ERRORS;


