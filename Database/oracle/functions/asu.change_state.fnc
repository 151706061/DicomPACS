DROP FUNCTION ASU.CHANGE_STATE
/

--
-- CHANGE_STATE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSTATE (Table)
--
CREATE OR REPLACE FUNCTION ASU."CHANGE_STATE" (nuserid  IN NUMBER,
                                        ncarid   IN NUMBER,
                                        nstate   IN NUMBER,
                                        vcomment IN VARCHAR2,
                                        vuser    IN VARCHAR2 DEFAULT '',
                                        vcar     IN VARCHAR2 DEFAULT '') return number is
-- Created 20070511 by Linnikov
-- Функция записывает изменение состояния и возвращает ID записи

  nFK_ID NUMBER;
BEGIN
    INSERT INTO TSTATE
      (FK_USERID, FK_CARID, FD_DATE, FN_STATE, FC_COMMENT, FC_USER, FC_CAR)
    VALUES
      (nuserid, ncarid, SYSDATE, nstate, vcomment, vuser, vcar)
    RETURNING FK_ID INTO nfk_id;
  RETURN nfk_id;
END CHANGE_STATE;
/

SHOW ERRORS;


