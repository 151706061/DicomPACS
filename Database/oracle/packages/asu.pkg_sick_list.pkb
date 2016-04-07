DROP PACKAGE BODY ASU.PKG_SICK_LIST
/

--
-- PKG_SICK_LIST  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_SICK_LIST"
IS
-- Created  20060727 by Serg
-- Modified 20071023 by Linnikov (���������� ������ � ������� PKG_SICK_LIST.GET_PAC_SL_END_ALL )
  sTmp            VARCHAR2(1000);
  nTmp            NUMBER;
  dTmp            DATE;

FUNCTION GET_PAC_SL_ADDR (pfk_peplid IN BINARY_INTEGER) RETURN VARCHAR2 IS
-- ����������� GET_PEPL_SL_ADDR
-- ���������� ����� (� ������ ������ � �������) �� ���� �����
CURSOR C(pfk_adrid IN NUMBER)
IS
  SELECT FK_COUNTRYID COUNTRY,
         FK_REGIONID REGION
         FROM TADRESS
         WHERE FK_ID = pfk_adrid;--GET_PAC_ADRID(PFK_PACID);

CURSOR C1
IS
  SELECT C.FK_COUNTRYID,
         C.FK_REGIONID
         FROM TCOMPANY C
         WHERE C.FK_ID = (SELECT TO_NUMBER(I.FC_VALUE) ORGID
                                 FROM TSMINI I
                                 WHERE I.FC_KEY = 'SL_ORG');

CURSOR C2(pfk_adrid IN NUMBER, ptype IN NUMBER)
IS
  SELECT DECODE(ptype, 0, '', GET_REGION(FK_RAIONID))||' '|| -- 20060627 Serg ����� /*+ RULE*/
         GET_TOWN(FK_TOWNID)||' '||
         GET_INTOWN(FK_INTOWNID)||' '||
         GET_STREET(FK_STREETID)||' '||
         FC_HOUSE||' '||
         PKG_REGIST_PACFUNC.ADD_VALUE(FC_KORPUS,'����.','BEFORE')||' '||
         PKG_REGIST_PACFUNC.ADD_VALUE(FC_KVARTIRA,'��.','BEFORE') ADDR
         FROM TADRESS
         WHERE FK_ID = pfk_adrid;

    REGID2 NUMBER;
    REGID1 NUMBER;
    COUNTRY2 NUMBER;
    COUNTRY1 NUMBER;
    ADDR VARCHAR2(255);
    RESULT VARCHAR2(255);

 BEGIN
 -- OPEN C(PKG_REGIST_PACFUNC.GET_PAC_ADRID(pfk_pacid));
  OPEN C(PKG_REGIST_PEPLFUNC.GET_PEPL_ADRID(pfk_peplid));
   FETCH C INTO COUNTRY1, REGID1;
  CLOSE C;

  OPEN C1;
   FETCH C1 INTO COUNTRY2, REGID2;
  CLOSE C1;

  IF COUNTRY1 = COUNTRY2 THEN
   IF REGID1 = REGID2 THEN
   OPEN C2(PKG_REGIST_PEPLFUNC.GET_PEPL_ADRID(pfk_peplid), 0);
   FETCH C2 INTO RESULT;
   CLOSE C2;
--   RESULT := '��� ������ � �������';
   ELSE
   OPEN C2(PKG_REGIST_PEPLFUNC.GET_PEPL_ADRID(pfk_peplid), 1);
   FETCH C2 INTO RESULT;
   CLOSE C2;
--   RESULT := '��� ������';
   END IF;
  ELSE
   RESULT := PKG_REGIST_PEPLFUNC.GET_PEPL_ADRFULL(pfk_peplid);
  END IF;

  RETURN(PKG_REGIST_PACFUNC.REPLACE_SPACES(RESULT));

 END;

----------------------------------------------------------------------------------

FUNCTION GET_SL_DISAB_STR(pInfoid IN NUMBER) RETURN VARCHAR2 IS
-- Created 20060727 by Serg
-- ���������� ��������� ������ ������������������
  CURSOR C
   IS
    SELECT P.FC_DISABILITY
           FROM TSLPERIOD P
           WHERE P.FK_SLINFOID = pInfoid
           AND P.FD_BEGIN = (SELECT MAX(FD_BEGIN)
                                    FROM TSLPERIOD
                                    WHERE FK_SLINFOID = pInfoid);

  D VARCHAR2(32767);

BEGIN
 OPEN C;
 FETCH C INTO D;
 CLOSE C;
 RETURN D;
END;

----------------------------------------------------------------------------------

FUNCTION GET_MONTHNAME(pMonth NUMBER, pType NUMBER) RETURN VARCHAR2 IS
-- Created 20060802 by Serg
-- ���������� ������������ ������ ��-������
 sTmp VARCHAR2(4000);
BEGIN
  IF pType = 1 THEN
   SELECT DECODE(pMonth,1,'������',2,'�������',3,'�����',4,'������',5,'���',6,'����',7,'����',8,'�������',9,'��������',10,'�������',11,'������',12,'�������') INTO sTmp FROM DUAL;
  ELSE
   sTmp:='������';
  END IF;
 RETURN sTmp;
END;

----------------------------------------------------------------------------------

FUNCTION GET_SL_SERNUM(pInfoid NUMBER) RETURN VARCHAR2 IS
-- Created 20060803 by Serg
-- ���������� ����� � ����� �� ����� �������
 sTmp VARCHAR2(4000);
BEGIN
  SELECT F.FC_SERIES||' '||F.FC_NUMBER
         INTO sTmp
         FROM TSLINFO I,
              TSLFORM F
              WHERE I.FK_SLFORMID = F.FK_ID
              AND I.FK_ID = pInfoid;
 RETURN sTmp;
END;

----------------------------------------------------------------------------------

FUNCTION GET_FIRST_VRACHID(pInfoid NUMBER) RETURN NUMBER IS
-- Created 20060803 by Serg
-- ���������� ��� �����, ���������� ��
 nTmp NUMBER;
BEGIN
  SELECT P.FK_SOTRID
         INTO nTmp
         FROM TSLINFO I,
              TSLPERIOD P,
              (SELECT MIN(FD_BEGIN) FD_BEGIN
                      FROM TSLPERIOD P
                      WHERE P.FK_SLINFOID = pInfoid) Q
               WHERE I.FK_ID = P.FK_SLINFOID
               AND I.FK_ID = pInfoid
               AND P.FD_BEGIN = Q.FD_BEGIN;
 RETURN nTmp;
END;


----------------------------------------------------------------------------------

FUNCTION GET_LAST_VRACHID(pInfoid NUMBER) RETURN NUMBER IS
-- Created 20060803 by Serg
-- ���������� ��� �����, ����������� ������� ���� ��
 nTmp NUMBER;
BEGIN
  SELECT MAX(P.FK_SOTRID)
         INTO nTmp
         FROM TSLINFO I,
              TSLPERIOD P,
              (SELECT MAX(FD_BEGIN) FD_BEGIN
                      FROM TSLPERIOD P
                      WHERE P.FK_SLINFOID = pInfoid) Q
              WHERE I.FK_ID = P.FK_SLINFOID
              AND I.FK_ID = pInfoid
              AND P.FD_BEGIN = Q.FD_BEGIN;
 RETURN nTmp;
END;

----------------------------------------------------------------------------------

FUNCTION GET_SOTR_SPEC(pVrachid NUMBER) RETURN VARCHAR2 IS
-- Created 20060906 by Serg
-- ���������� ������������� �����
sTmp VARCHAR2(4000);
BEGIN
 SELECT MAX(SP.FC_NAME_SHORT)
        INTO sTmp
        FROM TS_SPRAV SP,
             TSOTR SO
        WHERE SO.FK_SPRAVID = SP.FK_ID
        AND SO.FK_ID = pVrachid;
 RETURN sTmp;
END;

----------------------------------------------------------------------------------

FUNCTION GET_CLOSEEVENT_DATE(pPacid NUMBER) RETURN DATE IS
-- Created 20060803 by Serg
-- ���������� ���� �������� ������
 dTmp DATE;
BEGIN
  SELECT MAX(GET_SL_END(I.FK_ID)) FD_END
          INTO dTmp
          FROM TSLINFO I,
               TSLFORM F
               WHERE I.FK_PACID = pPacid
               AND I.FK_SLFORMID = F.FK_ID
               AND F.FN_STATE = 9; -- ������ ������
 RETURN dTmp;
END;

----------------------------------------------------------------------------------

PROCEDURE SET_TMP_DATES(pDateBeg DATE,pDateEnd DATE) IS
-- Created 20060803 by Serg
-- ��������� � ���������� �� ��������, ����� ��� ����� 16 �����
BEGIN
   --��������� ��������
   DELETE FROM STAT.TKARTATABLE;
   --���� ���, ����� ���������� �� ���������!!!!!!!!!!!!!
   INSERT INTO STAT.TKARTATABLE(fk_id,fp_sex,fp_reslech,fn_age) SELECT fk_id,fp_sex, STAT.PKG_FRFORM30.GET_RESLECH(fk_id),ASU.PKG_REGIST_PACFUNC.get_pac_age_date(fk_id,(TRUNC(pDateEnd)+1-1/(24*60*60)))   from tkarta WHERE  GET_CLOSEEVENT_DATE(fk_id) BETWEEN pDateBeg AND (TRUNC(pDateEnd)+1-1/(24*60*60));
--   INSERT INTO STAT.TKARTATABLE(fk_id,fp_sex,fp_reslech,fn_age) SELECT fk_id,fp_sex, STAT.PKG_FRFORM30.GET_RESLECH(fk_id),ASU.PKG_REGIST_PACFUNC.get_pac_age_date(fk_id,(TRUNC(pDateEnd)+1-1/(24*60*60)))   from tkarta WHERE  GET_CLOSEEVENT_DATE(fk_id) BETWEEN pDateBeg AND (TRUNC(pDateEnd)+1-1/(24*60*60));
END;

----------------------------------------------------------------------------------

FUNCTION GET_SL_DAYS_ALL(pInfoid NUMBER) RETURN NUMBER IS
-- Created 20060826 by Serg
-- ���������� ���������� ���� ������������������ �� ������
 nTmp NUMBER;
BEGIN
SELECT TRUNC(MAX(P.FD_END) - MIN(P.FD_BEGIN) + 1)
-- 20061005 SELECT TRUNC(SYSDATE - MIN(P.FD_BEGIN) + 1)
       INTO nTmp
       FROM tslperiod p
       WHERE p.fk_slinfoid IN(SELECT I.FK_ID
                                     FROM TSLINFO I
                                     CONNECT BY PRIOR I.FK_OWNERID=I.FK_ID
                                     START WITH I.FK_ID=pInfoid
                              UNION
                              SELECT I.FK_ID
                                     FROM TSLINFO I
                                     CONNECT BY PRIOR I.FK_ID=I.FK_OWNERID
                                     START WITH I.FK_ID=pInfoid);
 RETURN nTmp;
END;

----------------------------------------------------------------------------------

FUNCTION GET_SL_DAYS_ALL_ONDATE(pInfoid NUMBER, pDate DATE) RETURN NUMBER IS
-- Created 20060826 by Serg
-- ���������� ���������� ���� ������������������ �� ������ �� ����
 nTmp NUMBER;
BEGIN
SELECT TRUNC(pDate - MIN(P.FD_BEGIN) + 1)
-- 20061005 SELECT TRUNC(SYSDATE - MIN(P.FD_BEGIN) + 1)
       INTO nTmp
       FROM tslperiod p
       WHERE p.fk_slinfoid IN(SELECT I.FK_ID
                                     FROM TSLINFO I
                                     CONNECT BY PRIOR I.FK_OWNERID=I.FK_ID
                                     START WITH I.FK_ID=pInfoid
                              UNION
                              SELECT I.FK_ID
                                     FROM TSLINFO I
                                     CONNECT BY PRIOR I.FK_ID=I.FK_OWNERID
                                     START WITH I.FK_ID=pInfoid);
 RETURN nTmp;
END;

----------------------------------------------------------------------------------

FUNCTION GET_PAC_DAYS_ONDATE(pPacid NUMBER, pDate DATE) RETURN NUMBER IS
-- Created 20060826 by Serg
-- ���������� ���������� ���� ������������������ �� ������ ��� ���� �� ����
 nTmp NUMBER;
 nInfoID NUMBER;
BEGIN
SELECT MAX(FK_ID)
       INTO nInfoID
       FROM TSLINFO I
       WHERE I.FK_PACID = pPacid;

SELECT TRUNC(pDate - MIN(P.FD_BEGIN) + 1)
-- 20061005 SELECT TRUNC(SYSDATE - MIN(P.FD_BEGIN) + 1)
       INTO nTmp
       FROM TSLPERIOD P
       WHERE P.FK_SLINFOID IN(SELECT I.FK_ID
                                     FROM TSLINFO I
                                     CONNECT BY PRIOR I.FK_OWNERID=I.FK_ID
                                     START WITH I.FK_ID=nInfoID
                              UNION
                              SELECT I.FK_ID
                                     FROM TSLINFO I
                                     CONNECT BY PRIOR I.FK_ID=I.FK_OWNERID
                                     START WITH I.FK_ID=nInfoID);
 RETURN nTmp;
END;

----------------------------------------------------------------------------------

FUNCTION GET_CLOSESL_DAYS_ALL(pInfoid NUMBER, pDate DATE) RETURN NUMBER IS
-- Created 20061004 by Serg
-- ���������� ���������� ���� ������������������ �� ������ ��� �������� ������� �� ����
 nTmp NUMBER;
BEGIN
--SELECT TRUNC(MAX(P.FD_END) - MIN(P.FD_BEGIN) + 1)
SELECT TRUNC(pDate - MIN(P.FD_BEGIN) + 1)
       INTO nTmp
       FROM tslperiod p
       WHERE p.fk_slinfoid IN(SELECT I.FK_ID
                                     FROM TSLINFO I
                                     WHERE I.FN_STATE <> 0
                                     CONNECT BY PRIOR I.FK_OWNERID=I.FK_ID
                                     START WITH I.FK_ID=pInfoid
                               UNION
                               SELECT I.FK_ID
                                     FROM TSLINFO I
                                     WHERE I.FN_STATE <> 0
                                     CONNECT BY PRIOR I.FK_ID=I.FK_OWNERID
                                     START WITH I.FK_ID=pInfoid);
 RETURN nTmp;
END;

----------------------------------------------------------------------------------

FUNCTION GET_SL_BEGIN_ALL(pInfoid NUMBER) RETURN DATE IS
-- Created 20060826 by Serg
-- ���������� ������ ������������������ �� ������
 dTmp DATE;
BEGIN
SELECT MIN(P.FD_BEGIN)
       INTO dTmp
       FROM tslperiod p
       WHERE p.fk_slinfoid IN(SELECT I.FK_ID
                                     FROM TSLINFO I
                                     CONNECT BY PRIOR I.FK_OWNERID=I.FK_ID
                                     START WITH I.FK_ID=pInfoid);
 RETURN dTmp;
END;

----------------------------------------------------------------------------------

FUNCTION GET_SL_END_ALL(pInfoid NUMBER) RETURN DATE IS
-- Created 20060826 by Serg
-- ���������� ��������� ������������������ �� ������
 dTmp DATE;
BEGIN
SELECT MAX(P.FD_END)
       INTO dTmp
       FROM tslperiod p
       WHERE p.fk_slinfoid IN(SELECT I.FK_ID
                                     FROM TSLINFO I
                                     CONNECT BY PRIOR I.FK_ID = I.FK_OWNERID
                                     START WITH I.FK_ID = pInfoid);
 RETURN dTmp;
END;

----------------------------------------------------------------------------------

FUNCTION GET_PAC_SL_DAYS(pInfoid NUMBER) RETURN NUMBER IS
-- Created 20060824 by Serg
-- ���������� ���������� ���� ������������������ �� ������
 nTmp NUMBER;
BEGIN
 SELECT TRUNC(MAX(P.FD_END) - MIN(P.FD_BEGIN) + 1)
        INTO nTmp
        FROM TSLINFO I,
             TSLPERIOD P
             WHERE I.FK_ID = pInfoid
             AND P.FK_SLINFOID = I.FK_ID;
 RETURN nTmp;
END;

----------------------------------------------------------------------------------

FUNCTION GET_PAC_SL_DAYS_ALL(pPacid NUMBER) RETURN NUMBER IS
-- Created 20060804 by Serg
-- ���������� ���������� ���� ������������������ �� ����
 nTmp NUMBER;
BEGIN
 SELECT TRUNC(MAX(P.FD_END) - MIN(P.FD_BEGIN) + 1)
        INTO nTmp
        FROM TSLINFO I,
             TSLPERIOD P
             WHERE I.FK_PACID = pPacid
             AND P.FK_SLINFOID = I.FK_ID;
 RETURN nTmp;
END;

----------------------------------------------------------------------------------

FUNCTION GET_PAC_SL_BEGIN_ALL(pPacid NUMBER) RETURN DATE IS
-- Created 20060824 by Serg
-- ���������� ������ ������������������ �� ����
 dTmp DATE;
BEGIN
 SELECT MIN(P.FD_BEGIN)
        INTO dTmp
        FROM TSLINFO I,
             TSLPERIOD P
             WHERE I.FK_PACID = pPacid
             AND P.FK_SLINFOID = I.FK_ID;
 RETURN dTmp;
END;

----------------------------------------------------------------------------------

FUNCTION GET_PAC_SL_END_ALL(pPacid NUMBER) RETURN DATE IS
-- Created 20060824 by Serg
-- ���������� ��������� ������������������ �� ����
 dTmp DATE;
BEGIN
 SELECT MAX(P.FD_END)
        INTO dTmp
        FROM TSLINFO I,
             TSLPERIOD P
             WHERE I.FK_PACID = pPacid
             AND P.FK_SLINFOID = I.FK_ID;
 RETURN dTmp;
END;


----------------------------------------------------------------------------------

FUNCTION GET_PAC_FAM(pPacid NUMBER) RETURN VARCHAR2 IS
-- Created 20060901 by Serg
-- ���������� ������� ����
 sTmp VARCHAR2(4000);
BEGIN
 SELECT MAX(K.FC_FAM) FC_FAM
        INTO sTmp
        FROM TAMBULANCE K
        WHERE K.FK_ID = pPacid;
 IF sTmp IS NULL THEN
  SELECT MAX(A.FC_FAM) FC_FAM
         INTO sTmp
         FROM TKARTA A
         WHERE A.FK_ID = pPacid;
 END IF;
 RETURN sTmp;
END;

----------------------------------------------------------------------------------

FUNCTION GET_SL_MAIN_ORG(pInfoid NUMBER) RETURN VARCHAR2 IS
-- Created 20060915 by Serg
-- ���������� �����������, ��������� ��
 sTmp VARCHAR2(4000);
BEGIN
 SELECT MAX(FC_NAME)
        INTO sTmp
        FROM TCOMPANY
        WHERE FK_ID = (SELECT MAX(FK_ORGID)
                               FROM TSLPERIOD
                               WHERE FK_SLINFOID = pInfoid
                               AND FD_BEGIN = (SELECT MIN(FD_BEGIN)
                                                      FROM TSLPERIOD
                                                      WHERE FK_SLINFOID = pInfoid));
-- ��� ������������� � ����������� ��������
 IF sTmp IS NULL THEN
  SELECT MAX(C.FC_NAME)
         INTO sTmp
         FROM TCOMPANY C,
              TSLINFO I
         WHERE I.FK_ORGID = C.FK_ID
         AND I.FK_ID = pInfoid;
 END IF;
 RETURN sTmp;
END;

----------------------------------------------------------------------------------

FUNCTION GET_SL_MAIN_ORGID(pInfoid NUMBER) RETURN VARCHAR2 IS
-- Created 20060915 by Serg
-- ���������� ��� �����������, ��������� ��
 nTmp NUMBER;
BEGIN
SELECT MAX(FK_ID)
       INTO nTmp
       FROM TCOMPANY
       WHERE FK_ID = (SELECT MAX(FK_ORGID)
                              FROM TSLPERIOD
                              WHERE FK_SLINFOID = pInfoid
                              AND FD_BEGIN = (SELECT MIN(FD_BEGIN)
                                                     FROM TSLPERIOD
                                                     WHERE FK_SLINFOID = pInfoid));
-- ��� ������������� � ����������� ��������
 IF nTmp IS NULL THEN
  SELECT MAX(C.FK_ID)
         INTO nTmp
         FROM TCOMPANY C,
              TSLINFO I
         WHERE I.FK_ORGID = C.FK_ID
         AND I.FK_ID = pInfoid;
 END IF;
 RETURN nTmp;
END;

----------------------------------------------------------------------------------

FUNCTION GET_SL_COUNTN(pOtdelid NUMBER) RETURN NUMBER IS
-- Created 20060915 by Serg
-- ���������� ���������� ��������������� ������� ��� ���������
 nTmp NUMBER;
BEGIN
SELECT COUNT(I.FK_ID)
       INTO nTmp
       FROM TSLINFO I,
            TSOTR S,
            TOTDEL O,
            TS_SPRAV SP
       WHERE NVL(I.FK_SLFORMID, 0) = 0
       AND I.FL_DEL = 0
       AND SP.FK_ID = S.FK_SPRAVID
       AND S.FK_OTDELID = O.FK_ID
       AND S.FK_ID = PKG_SICK_LIST.GET_LAST_VRACHID(I.FK_ID)
       AND O.FK_ID IN (SELECT O.FK_ID
                               FROM TOTDEL O
                              WHERE FL_DEL = 0
                              CONNECT BY PRIOR fk_id = fk_ownerid
                              START WITH FK_ID = pOtdelid);
 RETURN nTmp;
END;

----------------------------------------------------------------------------------

FUNCTION GET_SL_COUNTNPERIOD(pOtdelid NUMBER, dBegin DATE, dEnd DATE) RETURN NUMBER IS
-- Created 20061004 by Serg
-- ���������� ���������� ��������������� ������� ��� ��������� �� ������
 nTmp NUMBER;
BEGIN
SELECT COUNT(I.FK_ID)
       INTO nTmp
       FROM TSLINFO I,
            TSOTR S,
            TOTDEL O,
            TS_SPRAV SP
       WHERE NVL(I.FK_SLFORMID, 0) = 0
       AND I.FL_DEL = 0
       AND SP.FK_ID = S.FK_SPRAVID
       AND S.FK_OTDELID = O.FK_ID
       AND S.FK_ID = PKG_SICK_LIST.GET_LAST_VRACHID(I.FK_ID)
       AND GET_SL_BEGIN(I.FK_ID) BETWEEN dBegin AND dEnd
       AND O.FK_ID IN (SELECT O.FK_ID
                               FROM TOTDEL O
                              WHERE FL_DEL = 0
                              CONNECT BY PRIOR fk_id = fk_ownerid
                              START WITH FK_ID = pOtdelid);
 RETURN nTmp;
END;

----------------------------------------------------------------------------------

FUNCTION GET_SL_COUNTPERIOD(pOtdelid NUMBER, dBegin DATE, dEnd DATE) RETURN NUMBER IS
-- Created 20061004 by Serg
-- ���������� ���������� ������� ��� ��������� �� ������
 nTmp NUMBER;
BEGIN
SELECT COUNT(I.FK_ID)
       INTO nTmp
       FROM TSLINFO I,
            TSOTR S,
            TOTDEL O,
            TS_SPRAV SP
       WHERE I.FL_DEL = 0
       AND SP.FK_ID = S.FK_SPRAVID
       AND S.FK_OTDELID = O.FK_ID
       AND S.FK_ID = PKG_SICK_LIST.GET_LAST_VRACHID(I.FK_ID)
       AND GET_SL_BEGIN(I.FK_ID) BETWEEN dBegin AND dEnd
       AND O.FK_ID IN (SELECT O.FK_ID
                               FROM TOTDEL O
                              WHERE FL_DEL = 0
                              CONNECT BY PRIOR fk_id = fk_ownerid
                              START WITH FK_ID = pOtdelid);
 RETURN nTmp;
END;

----------------------------------------------------------------------------------
FUNCTION GET_PAC_BIRTHDAY(pPacid NUMBER) RETURN DATE IS
-- Created 20060905 by Serg
-- ���������� �� ����
 dTmp DATE;
BEGIN
 SELECT K.FD_ROJD
        INTO dTmp
        FROM TKARTA K
        WHERE FK_ID = pPacid;
IF dTmp IS NULL THEN
 SELECT A.FD_ROJD
        INTO dTmp
        FROM TAMBULANCE A
        WHERE FK_ID = pPacid;
END IF;
 RETURN dTmp;
END;

----------------------------------------------------------------------------------

FUNCTION GET_SL_VK_VRACH(pInfoid NUMBER) RETURN VARCHAR2 IS
-- Created 20060904 by Serg
-- ���������� �����, ����������� �� �� ��
CURSOR C1(pInfo IN NUMBER)
IS
SELECT P.FK_VKID
       FROM TSLPERIOD P
       WHERE P.FK_SLINFOID = pInfo;

 sTmp VARCHAR2(4000);

BEGIN
 FOR C IN C1(pInfoid) LOOP
  IF C.FK_VKID > 0 THEN
   sTmp := GET_SOTRNAME(C.FK_VKID);
  END IF;
 END LOOP;
 RETURN sTmp;
END;

----------------------------------------------------------------------------------

FUNCTION GET_DATE_IN_WORD(pDate DATE) RETURN VARCHAR2 IS
-- Created 20060913 by Serg
-- ���������� ���� ��������
 sTmp   VARCHAR2(4000);
 sDay   VARCHAR2(4000);
 sMonth VARCHAR2(4000);
 sRes   VARCHAR2(4000);
BEGIN
 sTmp := TO_CHAR(pDate, 'DD');
 IF sTmp = '01' THEN sDay := '������'; END IF;
 IF sTmp = '02' THEN sDay := '������'; END IF;
 IF sTmp = '03' THEN sDay := '������'; END IF;
 IF sTmp = '04' THEN sDay := '���������'; END IF;
 IF sTmp = '05' THEN sDay := '�����'; END IF;
 IF sTmp = '06' THEN sDay := '������'; END IF;
 IF sTmp = '07' THEN sDay := '�������'; END IF;
 IF sTmp = '08' THEN sDay := '�������'; END IF;
 IF sTmp = '09' THEN sDay := '�������'; END IF;
 IF sTmp = '10' THEN sDay := '�������'; END IF;
 IF sTmp = '11' THEN sDay := '������������'; END IF;
 IF sTmp = '12' THEN sDay := '�����������'; END IF;
 IF sTmp = '13' THEN sDay := '�����������'; END IF;
 IF sTmp = '14' THEN sDay := '�������������'; END IF;
 IF sTmp = '15' THEN sDay := '�����������'; END IF;
 IF sTmp = '16' THEN sDay := '������������'; END IF;
 IF sTmp = '17' THEN sDay := '�����������'; END IF;
 IF sTmp = '18' THEN sDay := '�������������'; END IF;
 IF sTmp = '19' THEN sDay := '�������������'; END IF;
 IF sTmp = '20' THEN sDay := '���������'; END IF;
 IF sTmp = '21' THEN sDay := '�������� ������'; END IF;
 IF sTmp = '22' THEN sDay := '�������� ������'; END IF;
 IF sTmp = '23' THEN sDay := '�������� ������'; END IF;
 IF sTmp = '24' THEN sDay := '�������� ���������'; END IF;
 IF sTmp = '25' THEN sDay := '�������� �����'; END IF;
 IF sTmp = '26' THEN sDay := '�������� ������'; END IF;
 IF sTmp = '27' THEN sDay := '�������� �������'; END IF;
 IF sTmp = '28' THEN sDay := '�������� �������'; END IF;
 IF sTmp = '29' THEN sDay := '�������� �������'; END IF;
 IF sTmp = '30' THEN sDay := '���������'; END IF;
 IF sTmp = '31' THEN sDay := '�������� ������'; END IF;
 sTmp := TO_CHAR(pDate, 'MM');
 IF sTmp = '01' THEN sMonth := '������'; END IF;
 IF sTmp = '02' THEN sMonth := '�������'; END IF;
 IF sTmp = '03' THEN sMonth := '�����'; END IF;
 IF sTmp = '04' THEN sMonth := '������'; END IF;
 IF sTmp = '05' THEN sMonth := '���'; END IF;
 IF sTmp = '06' THEN sMonth := '����'; END IF;
 IF sTmp = '07' THEN sMonth := '����'; END IF;
 IF sTmp = '08' THEN sMonth := '�������'; END IF;
 IF sTmp = '09' THEN sMonth := '��������'; END IF;
 IF sTmp = '10' THEN sMonth := '�������'; END IF;
 IF sTmp = '11' THEN sMonth := '������'; END IF;
 IF sTmp = '12' THEN sMonth := '�������'; END IF;
 sRes := sDay || ' ' || sMonth;
 RETURN sRes;
END;

----------------------------------------------------------------------------------

FUNCTION GET_PAC_STANDARTID(pPacid NUMBER, pDate DATE) RETURN NUMBER IS
-- Created 20060807 by Serg
-- ���������� �������� (-1 ��� ���������, -2 �������������� ��������), �� �������� ����� ����
  nHonStand NUMBER;
  nTmp NUMBER;
BEGIN
  SELECT MAX(SD.FK_STANDARTID)
         INTO nTmp
         FROM TSTANDARTDIAG SD
              WHERE SD.FK_PACID = pPacid;
  SELECT MAX(HS.FK_ID)
         INTO nHonStand
         FROM THONORARY_STANDART HS
              WHERE HS.FK_STANDARTID = nTmp
              AND pDate BETWEEN HS.FD_DATE1 AND NVL(HS.FD_DATE2, SYSDATE);

  IF nHonStand IS NULL
  THEN
   IF nTmp IS NULL
    THEN nTmp := -1; -- � ���� ��� ���������
   END IF;
  ELSE
   nTmp:= -2;  -- �������� ������������ � ������ ��������������
  END IF;
  RETURN nTmp;
END;


----------------------------------------------------------------------------------

FUNCTION GET_STANDART_COST(pStandartid NUMBER, pDate DATE) RETURN NUMBER IS
-- Created 20060807 by Serg
-- ���� ��� ����� �����������, ����� (����� ����� ������ �����������) ����� ������
-- ���������� ��������� ��������� (0 - ��� ���������, -1 - ������������� ��������)
  nHonStand NUMBER;
  nTmp NUMBER;
BEGIN
  SELECT MAX(SC.FN_COST)
         INTO nTmp
         FROM TSTANDART_COST SC
              WHERE SC.FK_STANDARTID = pStandartid
              AND pDate BETWEEN SC.FD_DATE1 AND NVL(SC.FD_DATE2, SYSDATE);
  SELECT MAX(HS.FK_ID)
         INTO nHonStand
         FROM THONORARY_STANDART HS
              WHERE HS.FK_STANDARTID = pStandartid
              AND pDate BETWEEN HS.FD_DATE1 AND NVL(HS.FD_DATE2, SYSDATE);

  IF nHonStand IS NULL
  THEN
   IF nTmp IS NULL
    THEN nTmp := 0; -- � ��������� ��� ���������
   END IF;
  ELSE
   nTmp:= -2;  -- �������� ������������ � ������ ��������������
  END IF;
  RETURN nTmp;
END;

----------------------------------------------------------------------------------

FUNCTION GET_DOC_SER(pPrintid NUMBER) RETURN VARCHAR2 IS
-- Created 20061115 by Serg
-- ���������� ����� �������������� ���������
 sTmp VARCHAR2(10);
BEGIN
 SELECT DECODE(P.FP_TYPE, 0, F.FC_SERIES, '')
        INTO sTmp
        FROM TSLINFO I,
             TSLFORM F,
             TSLPRINT P
             WHERE F.FK_ID = I.FK_SLFORMID
             AND P.FK_INFOID = I.FK_ID
             AND P.FK_ID = pPrintid;
 RETURN sTmp;
END;

----------------------------------------------------------------------------------

FUNCTION GET_DOC_NUM(pPrintid NUMBER) RETURN VARCHAR2 IS
-- Created 20061115 by Serg
-- ���������� ����� �������������� ���������
 sTmp VARCHAR2(10);
BEGIN
SELECT DECODE(P.FP_TYPE, 0, F.FC_NUMBER, P.FC_NUM)
       INTO sTmp
       FROM TSLINFO I,
            TSLFORM F,
            TSLPRINT P
            WHERE F.FK_ID (+) = I.FK_SLFORMID
            AND P.FK_INFOID = I.FK_ID
            AND P.FK_ID = pPrintid;
 RETURN sTmp;
END;

----------------------------------------------------------------------------------

FUNCTION GET_SL_SER(pInfoid NUMBER) RETURN VARCHAR2 IS
-- Created 20070108 by Serg
-- ���������� ����� ��
 sTmp VARCHAR2(4000);
BEGIN
  SELECT MAX(F.FC_SERIES)
         INTO sTmp
         FROM TSLINFO I,
              TSLFORM F
              WHERE I.FK_SLFORMID = F.FK_ID
              AND I.FK_ID = pInfoid;
 RETURN sTmp;
END;

----------------------------------------------------------------------------------

FUNCTION GET_SL_NUM(pInfoid NUMBER) RETURN VARCHAR2 IS
-- Created 20070108 by Serg
-- ���������� ����� ��
 sTmp VARCHAR2(4000);
BEGIN
  SELECT MAX(F.FC_NUMBER)
         INTO sTmp
         FROM TSLINFO I,
              TSLFORM F
              WHERE I.FK_SLFORMID = F.FK_ID
              AND I.FK_ID = pInfoid;
 RETURN sTmp;
END;

----------------------------------------------------------------------------------

FUNCTION GET_FIRST_SL_SER(pInfoid NUMBER) RETURN VARCHAR2 IS
-- Created 20070108 by Serg
-- ���������� ����� ���������� ��
 sTmp VARCHAR2(4000);
 nTmpInfo NUMBER;
BEGIN
  SELECT MIN(I.FK_ID)
         INTO nTmpInfo
         FROM TSLINFO I
         CONNECT BY PRIOR I.FK_OWNERID = I.FK_ID
         START WITH I.FK_ID = pInfoid;


  SELECT MAX(F.FC_SERIES)
         INTO sTmp
         FROM TSLINFO I,
              TSLFORM F
              WHERE I.FK_SLFORMID = F.FK_ID
              AND I.FK_ID = nTmpInfo;
  RETURN sTmp;
END;

----------------------------------------------------------------------------------

FUNCTION GET_FIRST_SL_NUM(pInfoid NUMBER) RETURN VARCHAR2 IS
-- Created 20070108 by Serg
-- ���������� ����� ���������� ��
 sTmp VARCHAR2(4000);
 nTmpInfo NUMBER;
BEGIN
  SELECT MIN(I.FK_ID)
         INTO nTmpInfo
         FROM TSLINFO I
         CONNECT BY PRIOR I.FK_OWNERID = I.FK_ID
         START WITH I.FK_ID = pInfoid;

  SELECT MAX(F.FC_NUMBER)
         INTO sTmp
         FROM TSLINFO I,
              TSLFORM F
              WHERE I.FK_SLFORMID = F.FK_ID
              AND I.FK_ID = nTmpInfo;
  RETURN sTmp;
END;

----------------------------------------------------------------------------------

FUNCTION GET_BEG_BY_STRNUM(pInfoid NUMBER, n NUMBER) RETURN DATE IS
-- Created 20070108 by Serg
-- ���������� ���� ������ ������� ������������������ ��� n ������
 dTmp DATE;
BEGIN
  SELECT MAX(FD_BEGIN)
         INTO dTmp
         FROM
         (SELECT P.FD_BEGIN,
                 ROWNUM RN
                 FROM ASU.TSLPERIOD P
                 WHERE P.FK_SLINFOID = pInfoID
                 ORDER BY FD_BEGIN)
         WHERE RN = n;
  RETURN dTmp;
END;

----------------------------------------------------------------------------------

FUNCTION GET_END_BY_STRNUM(pInfoid NUMBER, n NUMBER) RETURN DATE IS
-- Created 20070108 by Serg
-- ���������� ���� ��������� ������� ������������������ ��� n ������
 dTmp DATE;
BEGIN
  SELECT MAX(FD_END)
         INTO dTmp
         FROM
         (SELECT P.FD_END,
                 ROWNUM RN
                 FROM ASU.TSLPERIOD P
                 WHERE P.FK_SLINFOID = pInfoID
                 ORDER BY FD_BEGIN)
         WHERE RN = n;
  RETURN dTmp;
END;

----------------------------------------------------------------------------------

FUNCTION GET_SL_ORD_NUM(pInfoid NUMBER) RETURN NUMBER IS
-- Created 20070108 by Serg
-- ���������� ���������� ����� ������ � ������ ������������������
 nTmp NUMBER;
BEGIN
  SELECT MAX(RN)
         INTO nTmp
         FROM(SELECT FK_ID,
                     ROWNUM RN
                     FROM(SELECT I.FK_ID
                                 FROM TSLINFO I
                                 CONNECT BY PRIOR I.FK_OWNERID = I.FK_ID
                                 START WITH I.FK_ID = pInfoid
                          UNION
                          SELECT I.FK_ID
                                 FROM TSLINFO I
                                 CONNECT BY PRIOR I.FK_ID = I.FK_OWNERID
                                 START WITH I.FK_ID = pInfoid) A
              ORDER BY GET_SL_BEGIN(pInfoid))
         WHERE FK_ID = pInfoid;
  RETURN nTmp;
END;

----------------------------------------------------------------------------------

FUNCTION IS_SL_CLOSED(pInfoid NUMBER) RETURN NUMBER IS
-- Created 20070108 by Serg
-- ���������� ���������� ����� ������ � ������ ������������������
 nTmp NUMBER;
BEGIN
  SELECT DECODE(FN_STATE, 0, 0, 1)
         INTO nTmp
         FROM TSLINFO I
         WHERE FK_ID = pInfoid;
  RETURN NVL(nTmp, 0);
END;
-----------------------------------------------------------------------------------
FUNCTION GET_TOP_SL_OWNER(pSLINFOID NUMBER) RETURN NUMBER IS
-- Created 20111025 by Kashira O.A.
-- ���������� ID ��, ����������� ��������� ��� ������� ����������� � ����������
 nTmp NUMBER;
BEGIN
   -- CONNECT_BY_ISLEAF ����������� �������� � 10.2.0.3 ������ ������, �������� �������� ��������. ������� ������ �� ������ 
  SELECT MAX(FK_ID) INTO nTmp
   FROM (SELECT F.FK_ID  
          FROM TSLINFO F 
          WHERE (F.FL_DEL <> 1 OR F.FL_DEL IS NULL)
            CONNECT BY (PRIOR F.FK_OWNERID=F.FK_ID) OR (PRIOR F.FN_EQUIVALENT=F.FK_ID)
            START WITH F.FK_ID=pSLINFOID
          ORDER BY LEVEL DESC)   
             WHERE ROWNUM = 1;
  RETURN NVL(nTmp,0);
END;

END;-- Package Body PKG_SICK_LIST
/

SHOW ERRORS;


