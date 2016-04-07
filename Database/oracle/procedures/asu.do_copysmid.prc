DROP PROCEDURE ASU.DO_COPYSMID
/

--
-- DO_COPYSMID  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   UTL_FILE (Synonym)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TSMID (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_COPYSMID" (nStartID IN NUMBER, nNewOwner IN NUMBER DEFAULT NULL)
IS
--
-- Purpose: Копирует поддерево из СМИД
--  процедура !!!  РЕКУРСИВНА  !!!
--
-- MODIFICATION HISTORY
-- Person      Date           Comments
-- ---------   ------  -      ------------------------------------------
-- Сэм         17,07,2000     Создание

  CURSOR cSource
  IS
    SELECT *
      FROM tsmid
     WHERE fk_owner = nStartID;

  CURSOR cRec (pFK_ID IN NUMBER)
  IS
    SELECT *
      FROM tsmid
     WHERE fk_id = pFK_ID;

  rSource       cSource%ROWTYPE;
  nOwner        NUMBER;
  nOwnerFirst   NUMBER;
  log_file      UTL_FILE.file_type;
-- Declare program variables as shown above
BEGIN
  IF nNewOwner IS NULL THEN                                                                                                                         -- первый раз опеределяем Owner
    SELECT fk_owner
      INTO nOwnerFirst
      FROM tsmid
     WHERE fk_id = nStartID;
  ELSE
    nOwnerFirst  := nNewOwner;
  END IF;
  OPEN cRec (nStartID);
  FETCH cRec INTO rSource;
  IF nNewOwner IS NOT NULL THEN
    INSERT INTO tsmid
                (
                  FK_ID,
                  FC_NAME,
                  FK_CLASS,
                  FK_CHANGE,
                  FC_ED_IZM,
                  FN_LOW_M,
                  FN_HI_M,
                  FN_LOW_W,
                  FN_HI_W,
                  FP_PAT,
                  FC_TIME,
                  FN_ED,
                  FC_REMARK,
                  FK_LOINC_CODE,
                  FC_SYNONIM,
                  FC_ANSWER,
                  FC_ANSWER_W,
                  FC_ANSWER_M,
                  FK_MKB9,
                  FK_MKB10,
                  FK_OWNER,
                  FP_ISFOLDER,
                  FC_TYPE,
                  FN_ORDER,
                  FK_DEFAULT,
                  FN_COUNT,
                  FN_PRICE,
                  FN_NORM0,
                  FN_NORM0M,
                  FN_NORM1,
                  FN_NORM1M,
                  FN_COST1,
                  FN_COST2,
                  FN_COST3,
                  FN_PEOPLE,
                  FP_INOUT,
                  FL_SHOWANAL,
                  FL_SHOWPRINT
                )
         VALUES (
           NULL,
           rSource.FC_NAME,
           rSource.FK_CLASS,
           rSource.FK_CHANGE,
           rSource.FC_ED_IZM,
           rSource.FN_LOW_M,
           rSource.FN_HI_M,
           rSource.FN_LOW_W,
           rSource.FN_HI_W,
           rSource.FP_PAT,
           rSource.FC_TIME,
           rSource.FN_ED,
           rSource.FC_REMARK,
           rSource.FK_LOINC_CODE,
           rSource.FC_SYNONIM,
           rSource.FC_ANSWER,
           rSource.FC_ANSWER_W,
           rSource.FC_ANSWER_M,
           rSource.FK_MKB9,
           rSource.FK_MKB10,
           nOwnerFirst,
           rSource.FP_ISFOLDER,
           rSource.FC_TYPE,
           rSource.FN_ORDER,
           rSource.FK_DEFAULT,
           rSource.FN_COUNT,
           rSource.FN_PRICE,
           rSource.FN_NORM0,
           rSource.FN_NORM0M,
           rSource.FN_NORM1,
           rSource.FN_NORM1M,
           rSource.FN_COST1,
           rSource.FN_COST2,
           rSource.FN_COST3,
           rSource.FN_PEOPLE,
           rSource.FP_INOUT,
           rSource.FL_SHOWANAL,
           rSource.FL_SHOWPRINT
         )
      RETURNING fk_id
      INTO nOwner;
  END IF;
--  DBMS_OUTPUT.PUT_LINE('Inserting '||rSource.FC_NAME||'  OldId='||rSource.FK_ID||'    NewID='||nOwner);
--  log_file:=utl_file.fopen('c:\temp','copysmids.log','a');
--  utl_file.put_line(log_file, 'Inserting '||rSource.FC_NAME||'  OldId='||rSource.FK_ID||'    NewID='||nOwner);
--  utl_file.fclose(log_file);
  CLOSE cRec;
  OPEN cSource;
  LOOP
    FETCH cSource INTO rSource;
    EXIT WHEN cSource%NOTFOUND;
    do_copysmid (rSource.FK_ID, nOwner);
  END LOOP;
  CLOSE csource;
END;                                                                                                                                                            -- Procedure DO_COPY


-- End DDL Extract of Procedure DO_COPYSMID
/

SHOW ERRORS;


