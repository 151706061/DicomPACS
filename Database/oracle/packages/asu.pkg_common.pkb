DROP PACKAGE BODY ASU.PKG_COMMON
/

--
-- PKG_COMMON  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_COMMON" IS
--
-- To modify this template, edit file PKGBODY.TXT in TEMPLATE
-- directory of SQL Navigator
--
-- Purpose: Briefly explain the functionality of the package body
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  ------------------------------------------
   OSLEVEL   NUMBER := 0.0;
   -- Enter procedure, function bodies as shown below
   FUNCTION GET_OSLEVEL
      RETURN NUMBER
   IS
   BEGIN
      RETURN OSLEVEL;
   END;
-------------------------------------------------------------------------------
   PROCEDURE SET_OSLEVEL( VAL IN NUMBER )
   IS
   BEGIN
      OSLEVEL :=    VAL;
   END;
-------------------------------------------------------------------------------
   FUNCTION GET_MEDNAZID
      RETURN NUMBER
   IS
   BEGIN
      RETURN 37580;
   END;
-------------------------------------------------------------------------------
   FUNCTION GET_TYPE( PTYPE IN VARCHAR2 )
      RETURN VARCHAR2
   IS
   BEGIN
      IF PTYPE = '' THEN
         RETURN '';
      END IF;
      IF PTYPE = 'TEXT' THEN
         RETURN 'Текст';
      END IF;
      IF PTYPE = 'NUMBER' THEN
         RETURN 'Число';
      END IF;
      IF PTYPE = 'LIST' THEN
         RETURN 'Список';
      END IF;
      IF PTYPE = 'PROCCOUNT' THEN
         RETURN 'Кол-во процедур';
      END IF;
      IF PTYPE = 'ORDER' THEN
         RETURN 'Кратность';
      END IF;
      IF PTYPE = 'LINKTABLE' THEN
         RETURN 'Внешняя таблица';
      END IF;
      IF PTYPE = 'CHECKBOX' THEN
         RETURN 'Галочка';
      END IF;
      IF PTYPE = 'BIGMEMO' THEN
         RETURN 'Шаблон';
      END IF;
      RETURN PTYPE;
   END;
-------------------------------------------------------------------------------
   FUNCTION GET_RECEPTID( PID IN NUMBER )
      RETURN NUMBER
   IS
      NRES   NUMBER;
   BEGIN
      OPEN CRECEPT( PID );
      FETCH CRECEPT INTO NRES;
      CLOSE CRECEPT;
      RETURN NRES;
   END;
-------------------------------------------------------------------------------
   FUNCTION DECODE_STATUS( PID IN NUMBER )
      RETURN VARCHAR2
   IS
      CRES   VARCHAR2( 100 );
      CURSOR STATUS_NAME( ID NUMBER )
      IS
         SELECT FC_NAME
           FROM TNAZSOS
          WHERE FK_ID = ID;
   BEGIN
      OPEN STATUS_NAME( PID );
      FETCH STATUS_NAME INTO CRES;
      CLOSE STATUS_NAME;
      RETURN CRES;
   END;
-------------------------------------------------------------------------------
   FUNCTION DECODE_YESNO( VAL IN NUMBER )
      RETURN VARCHAR2
   IS
   BEGIN
      IF VAL = 0 THEN
         RETURN 'НЕТ';
      ELSE
         RETURN 'ДА';
      END IF;
   END;
-------------------------------------------------------------------------------
/*  FUNCTION DECODE_DEZH(VAL IN NUMBER)
	  RETURN VARCHAR2
	IS
	  dezh number:=0.0;
	  CURSOR cdezh(pid IN number) IS
		  SELECT fp_dezh
  		  FROM tnazmed
			 WHERE fk_id=pid;
	BEGIN
	  OPEN cdezh(VAL);
		FETCH cdezh INTO dezh;
		CLOSE cdezh;
		IF dezh=0 THEN
		  RETURN 'НЕТ';
		ELSE
  		RETURN 'ДА';
		END IF;
	END;
*/
-------------------------------------------------------------------------------
   FUNCTION GET_NEVIP
      RETURN NUMBER
   IS
   BEGIN
      RETURN 2;
   END;
-------------------------------------------------------------------------------
   FUNCTION GET_SHOWANAL( PID IN NUMBER )
      RETURN NUMBER
   IS
      CURSOR C( P_ID IN NUMBER )
      IS
         SELECT FL_SHOWANAL
           FROM TSMID
          WHERE FK_ID = P_ID;
      RESULT   NUMBER;
   BEGIN
      OPEN C( PID );
      FETCH C INTO RESULT;
      CLOSE C;
      RETURN RESULT;
   END GET_SHOWANAL;
-------------------------------------------------------------------------------
  FUNCTION DECODE_MEDTYPE(VAL IN NUMBER) RETURN VARCHAR2 IS
    res VARCHAR2(200):='';
    CURSOR cMedType IS SELECT FC_NAME FROM TRECEPTVID WHERE FK_ID=VAL;
  BEGIN
    OPEN cMedType;
    FETCH cMedType INTO res;
    CLOSE cMedType;
    RETURN res;
  END;

  FUNCTION GET_RECOMEND RETURN NUMBER
  IS
  begin
    return 64;
  end;
-- Enter further code below as specified in the Package spec.
END;                                                -- Package Body PKG_COMMON
/

SHOW ERRORS;


