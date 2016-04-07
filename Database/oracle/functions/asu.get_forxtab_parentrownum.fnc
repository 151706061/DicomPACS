DROP FUNCTION ASU.GET_FORXTAB_PARENTROWNUM
/

--
-- GET_FORXTAB_PARENTROWNUM  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   DBMS_SQL (Synonym)
--
CREATE OR REPLACE FUNCTION ASU.GET_FORXTAB_PARENTROWNUM(A_ROWNUM IN NUMBER, A_TABLEPATH IN VARCHAR2) RETURN INTEGER IS

  RETURN INTEGER;
  PPARENT                             INTEGER;-- -1
  L_CURCURSOR                         INTEGER;--ID-������� �������
  L_CUR2                              INTEGER;--ID ������� �������
  L_CURSTATUS                         INTEGER;--����� ����� ������� EXECUTE ID=1
  L_CUR2STAT                          INTEGER;--����� ����� ������� EXECUTE ID=2
  I                                   INTEGER;--��� �ר�����
  PCOLIDX                             INTEGER;--������ ���������  � ��������� �������
  L_DESCTBL                           DBMS_SQL.DESC_TAB;-- ��� �������� �������� SELECT'A
  PCOLVALUE                           NUMBER DEFAULT NULL;
  L_COLCOUNT                          NUMBER DEFAULT NULL;
  PROW                                INTEGER;--�� ��� ����� � I-�� ������ ID=2
  PROW2                               VARCHAR2(4000);

BEGIN
  --------------------------------������ � ������ ��������--------------------------
  --��������� ������
  L_CUR2 := DBMS_SQL.OPEN_CURSOR;  --L_CUR2 FOR GETCOLINDEX
    --��������� SQL
  DBMS_SQL.PARSE(C =>                 L_CUR2,
                 STATEMENT =>         'SELECT * FROM (SELECT ROWNUM R, T.* FROM '||A_TABLEPATH||
                                      ' T ) WHERE R = '||A_ROWNUM,
                 LANGUAGE_FLAG =>     DBMS_SQL.NATIVE
                );
  --�������� ������ ������� � �������� ���������
  DBMS_SQL.DESCRIBE_COLUMNS(L_CUR2,L_COLCOUNT,L_DESCTBL );
  DBMS_SQL.DEFINE_COLUMN(L_CUR2,1,PROW);
  FOR I IN 2 .. L_COLCOUNT
  LOOP
    DBMS_SQL.DEFINE_COLUMN(L_CUR2,I,PROW2,4000);
  END LOOP;
  --��������� SQL  � ��������� ���-�� �����
  L_CUR2STAT := DBMS_SQL.EXECUTE(L_CUR2);

  IF (DBMS_SQL.FETCH_ROWS(L_CUR2) > 0)
  THEN
  FOR I IN 2 .. L_COLCOUNT
      LOOP
        DBMS_SQL.COLUMN_VALUE(L_CUR2,I,PROW2);
        --IF NVL(PCOLVALUE,'') <> ''
        IF LENGTH(PROW2) > 0
        THEN
          PCOLIDX := I;
          EXIT;
        END IF;
      END LOOP;
  END IF;

  DBMS_SQL.CLOSE_CURSOR(L_CUR2);

  IF  PCOLIDX <= 2 OR PCOLIDX IS NULL
  THEN
  RETURN -1;
  END IF;

  --------------------------------������ �� ������ ��������--------------------------
  L_CURCURSOR := DBMS_SQL.OPEN_CURSOR;
    DBMS_SQL.PARSE(C =>                 L_CURCURSOR,
                 STATEMENT =>         'SELECT ROWNUM, T.* FROM '||A_TABLEPATH||
                                      ' T WHERE ROWNUM < '||A_ROWNUM,
                 LANGUAGE_FLAG =>     DBMS_SQL.NATIVE
                );
  DBMS_SQL.DESCRIBE_COLUMNS(L_CURCURSOR,L_COLCOUNT,L_DESCTBL);
  DBMS_SQL.DEFINE_COLUMN(L_CURCURSOR,1,PROW);
  FOR I IN 2 .. L_COLCOUNT
  LOOP
    DBMS_SQL.DEFINE_COLUMN(L_CURCURSOR,I,PROW2,4000);
  END LOOP;

  L_CURSTATUS := DBMS_SQL.EXECUTE(L_CURCURSOR);

  WHILE  (DBMS_SQL.FETCH_ROWS(L_CURCURSOR) > 0)
  LOOP
    DBMS_SQL.COLUMN_VALUE(L_CURCURSOR,PCOLIDX-1,PROW2);
    --IF NVL(PCOLVALUE,'') <> ''
      IF LENGTH(PROW2) > 0
    THEN
     DBMS_SQL.COLUMN_VALUE(L_CURCURSOR,1,PPARENT); --�������� � ������� ROWNUM �������� � PPARENT
    END IF;
 END LOOP;

 DBMS_SQL.CLOSE_CURSOR(L_CURCURSOR);

 RETURN  PPARENT;

EXCEPTION
WHEN OTHERS THEN
  BEGIN
    IF DBMS_SQL.IS_OPEN(L_CUR2) THEN
      DBMS_SQL.CLOSE_CURSOR(L_CUR2);
    END IF;
    IF DBMS_SQL.IS_OPEN(L_CURCURSOR) THEN
      DBMS_SQL.CLOSE_CURSOR(L_CURCURSOR);
    END IF;
  END;

END GET_FORXTAB_PARENTROWNUM;
/

SHOW ERRORS;


