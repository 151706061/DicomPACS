DROP PROCEDURE ASU.GET_KLADR_ADDR_PARTS_BY_ID
/

--
-- GET_KLADR_ADDR_PARTS_BY_ID  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TKLADR (Table)
--
CREATE OR REPLACE PROCEDURE ASU."GET_KLADR_ADDR_PARTS_BY_ID" (pfk_id    IN TKLADR.FK_ID%TYPE,
                                                      pRegion   OUT VARCHAR2,
                                                      pRaion    OUT VARCHAR2,
                                                      pCity     OUT VARCHAR2,
                                                      pStreet   OUT VARCHAR2,
                                                      -- parameter added 20090914 by Linnikov
                                                      pWithPrefix IN NUMBER DEFAULT 1 -- 0 - без префикса
                                                      )
  IS
  -- Возвращает разбивку адреса КЛАДР
  -- Created 20081003 by Spasskiy

BEGIN
           -- commented 20090914 by Linnikov
--  FOR C IN (SELECT upper(FC_PREFIX) FC_PREFIX, FC_PREFIX||'. '||FC_NAME FC_NAME, FN_LEVEL,
           -- added 20090914 by Linnikov
  FOR C IN (SELECT upper(FC_PREFIX) FC_PREFIX, decode(pWithPrefix, 1, FC_PREFIX||'. '||FC_NAME, FC_NAME) FC_NAME, FN_LEVEL
              FROM TKLADR
             WHERE FL_DEL = 0
            CONNECT BY FK_ID = PRIOR FK_OWNER
             START WITH FK_ID = pfk_id
             ORDER BY FN_LEVEL) LOOP
    IF C.FN_LEVEL = 5 THEN
      pStreet := C.FC_NAME;
    END IF;
    IF C.FN_LEVEL IN (4, 3) THEN
      pCity := C.FC_NAME;
    END IF;
    IF C.FN_LEVEL = 2 THEN
      pRaion := C.FC_NAME;
    END IF;
    IF C.FN_LEVEL = 1 THEN
      IF C.FC_PREFIX = 'Г' THEN
        pCity := C.FC_NAME;
       ELSE
        pRegion := C.FC_NAME;
      END IF;
    END IF;
  END LOOP;

END GET_KLADR_ADDR_PARTS_BY_ID;
/

SHOW ERRORS;


