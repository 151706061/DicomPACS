DROP FUNCTION ASU.GET_NAZLECHLIST_VID
/

--
-- GET_NAZLECHLIST_VID  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   DBMS_OUTPUT (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZLECH (Table)
--   TSMID (Table)
--   GET_NAZ_RECOMENDED (Function)
--   GET_NEVIP (Function)
--
CREATE OR REPLACE FUNCTION ASU."GET_NAZLECHLIST_VID" (PFK_PACID IN NUMBER)
  RETURN VARCHAR2 IS
  S VARCHAR2(32000);
BEGIN
  S := '';
  FOR C IN (SELECT DISTINCT SM.ROOT_NAME
              FROM TNAZLECH TN,
                   (SELECT FC_NAME,
                           FK_ID,
                           CONNECT_BY_ROOT FK_ID AS ROOT_ID,
                           CONNECT_BY_ROOT FC_NAME AS ROOT_NAME
                      FROM TSMID
                    CONNECT BY FK_OWNER = PRIOR FK_ID
                     START WITH FC_SYNONIM IN
                                ('NAZLECHLIST_ELECTROLECHENIE',
                                 'NAZLECHLIST_INGALYACII',
                                 'NAZLECHLIST_VODOLECHENIE',
                                 'NAZLECHLIST_TEPLOLECHENIE',
                                 'NAZLECHLIST_MASSAG', 'NAZLECHLIST_LFK',
                                 'NAZLECHLIST_IRT', 'NAZLECHLIST_OZOKERIT',
                                 'NAZLECHLIST_PDM')) SM
             WHERE FK_NAZSOSID IN (GET_NAZ_RECOMENDED, GET_NEVIP)
               AND TN.FK_SMID = SM.FK_ID
               AND FK_PACID = PFK_PACID) LOOP
    DBMS_OUTPUT.PUT_LINE(C.ROOT_NAME);
    S := C.ROOT_NAME || ', ' || S;
  END LOOP;
  RETURN RTRIM(S, ', ');
END;
/

SHOW ERRORS;


