DROP FUNCTION ASU.MERGE_DUPLICATES
/

--
-- MERGE_DUPLICATES  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--
CREATE OR REPLACE FUNCTION ASU."MERGE_DUPLICATES" (pPRIMARY_T IN VARCHAR2,
                                             pFOREIGN_T in VARCHAR2,
                                             pFOREIGN_T_FIELD in VARCHAR2,
                                             pNEW_ID IN NUMBER,
                                             pOLD_ID_LIST IN VARCHAR2,
                                             pFOREIGN_PK_FIELD IN VARCHAR2 DEFAULT 'FK_ID')
RETURN  NUMBER
 -- Created 20070328 by Linnikov
 -- Функция удаления и логирования изменений в дубликатах
IS
  TYPE RK_T IS REF CURSOR;
  RK RK_T;
  nTmp1 NUMBER;
  nTmp2 NUMBER;
  nCnt NUMBER DEFAULT 0;
  sTmp VARCHAR2 (2000);
  VSQL VARCHAR(2000);

BEGIN
  VSQL := 'SELECT ' || pFOREIGN_PK_FIELD || ', ' || pFOREIGN_T_FIELD || ' FROM '|| pFOREIGN_T ||
                        ' WHERE ' || pFOREIGN_T_FIELD || ' IN (' || pOLD_ID_LIST || ')';
  OPEN RK FOR VSQL;
   LOOP
    FETCH RK into nTmp1, nTmp2;
    EXIT WHEN RK%NOTFOUND;
    sTmp:=
    'INSERT INTO TDUPLICATE_LOG ' ||
           '(FC_PRIMARY_TABLE,' ||
            'FC_FOREIGN_TABLE,' ||
            'FK_UPDATED_ID,' ||
            'FK_OLD,' ||
            'FK_NEW) ' ||
    'VALUES (''' || pPRIMARY_T || ''',' ||
            ''''|| pFOREIGN_T || ''',' ||
            nTmp1 || ',' ||
            nTmp2 || ',' ||
            pNEW_ID ||')';
    EXECUTE IMMEDIATE sTmp;
    nCnt := nCnt + 1;
   END LOOP;
  CLOSE RK;

  sTmp:=
  'UPDATE ' || pFOREIGN_T ||
  '   SET ' || pFOREIGN_T_FIELD || ' = ' || pNEW_ID ||
  ' WHERE ' || pFOREIGN_T_FIELD || ' IN (' || pOLD_ID_LIST || ')';

  EXECUTE IMMEDIATE sTmp;

  RETURN nCnt;
END;
/

SHOW ERRORS;


