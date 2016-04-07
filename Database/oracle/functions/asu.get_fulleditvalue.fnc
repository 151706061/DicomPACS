DROP FUNCTION ASU.GET_FULLEDITVALUE
/

--
-- GET_FULLEDITVALUE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--   GET_OWNER_FROM_SMID (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_FULLEDITVALUE" (id IN NUMBER, ToID IN NUMBER DEFAULT -1)
  RETURN VARCHAR2 IS
  sName     VARCHAR2(1000);
  sType     VARCHAR2(50);
  nKurID    NUMBER(9, 0);
  nKurOwner NUMBER(9, 0);
  sRes      VARCHAR2(32767);
  /* Edited by Spasskiy S.N. 29.04.2008 - обработка C1%NOTFOUND иначе циклилось если всегда fc_type is null*/
  CURSOR c1 IS
    SELECT /*+rule*/
     DECODE(fl_showprint, 1, fc_name, 0, '') AS fc_name, fc_type, fk_id
      FROM tsmid
     START WITH fk_id = id
    CONNECT BY PRIOR fk_owner = fk_id;

BEGIN
  sRes      := '';
  nKurOwner := get_owner_from_smid(ToID);
  OPEN c1;
  LOOP
    FETCH c1
      INTO sName, sType, nKurID;
    IF C1%NOTFOUND
    THEN
      EXIT;
    END IF;
    IF sType IS NULL AND (nKurID <> nKurOwner OR ToID = -1)
    THEN
      sRes := sName || ' ' || sRes;
    ELSE
      EXIT;
      /* CLOSE C1;
      RETURN SRES;*/

    END IF;
  END LOOP;
  CLOSE c1;
  RETURN sRes;
EXCEPTION
  WHEN OTHERS THEN
    -- CAUTION:HANDLES ALL EXCEPTIONS
    RAISE_APPLICATION_ERROR(-20003,
                            'LENGTH SRES=' || LENGTH(SRES) || ' ID=' || ID);
END;
/

SHOW ERRORS;


