DROP TRIGGER ASU.TSMID_BACKUP
/

--
-- TSMID_BACKUP  (Trigger) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TSMID (Table)
--
CREATE OR REPLACE TRIGGER ASU."TSMID_BACKUP" --Created by TimurLan
  BEFORE DELETE ON ASU.TSMID   REFERENCING NEW AS NEW OLD AS OLD
  FOR EACH ROW

-- ��� �������� ������������� �������� �������������� ��������� ��������� ���������� aTrigger.exe ��:16.02.2004 21:47:18
BEGIN
  IF (USERENV('CLIENT_INFO') is null) or (USERENV('CLIENT_INFO') <> '%MAIL%') THEN

BEGIN
  -- ORIGINAL TRIGGER BODY BEGIN FROM HERE:
  BEGIN
    INSERT INTO TSMID_BACKUP(FK_ID, FC_NAME, FK_CLASS, FK_CHANGE, FC_ED_IZM, FN_LOW_M, FN_HI_M, FN_LOW_W, FN_HI_W, FP_PAT, FC_TIME, FN_ED, FC_REMARK, FK_LOINC_CODE, FC_SYNONIM, FC_ANSWER, FC_ANSWER_W, FC_ANSWER_M, FK_MKB9, FK_MKB10, FK_OWNER, FP_ISFOLDER, FC_TYPE, FN_ORDER, FK_DEFAULT, FN_COUNT, FN_PEOPLE, FN_PRICE, FN_NORM0, FN_NORM0M, FN_NORM1, FN_NORM1M, FN_COST1, FN_COST2, FN_COST3, FP_INOUT, FL_SHOWANAL, FL_STAT, FL_SHOWPRINT, FL_SHOWDIAGPREDZAKL, FN_EDCHILD, FL_PLATDEFAULT, FL_USLUGA, FL_DEL)
    VALUES (:OLD.FK_ID, :OLD.FC_NAME, :OLD.FK_CLASS, :OLD.FK_CHANGE, :OLD.FC_ED_IZM, :OLD.FN_LOW_M, :OLD.FN_HI_M, :OLD.FN_LOW_W, :OLD.FN_HI_W, :OLD.FP_PAT, :OLD.FC_TIME, :OLD.FN_ED, :OLD.FC_REMARK, :OLD.FK_LOINC_CODE, :OLD.FC_SYNONIM, :OLD.FC_ANSWER, :OLD.FC_ANSWER_W, :OLD.FC_ANSWER_M, :OLD.FK_MKB9, :OLD.FK_MKB10, :OLD.FK_OWNER, :OLD.FP_ISFOLDER, :OLD.FC_TYPE, :OLD.FN_ORDER, :OLD.FK_DEFAULT, :OLD.FN_COUNT, :OLD.FN_PEOPLE, :OLD.FN_PRICE, :OLD.FN_NORM0, :OLD.FN_NORM0M, :OLD.FN_NORM1, :OLD.FN_NORM1M, :OLD.FN_COST1, :OLD.FN_COST2, :OLD.FN_COST3, :OLD.FP_INOUT, :OLD.FL_SHOWANAL, :OLD.FL_STAT, :OLD.FL_SHOWPRINT, :OLD.FL_SHOWDIAGPREDZAKL, :OLD.FN_EDCHILD, :OLD.FL_PLATDEFAULT, :OLD.FL_USLUGA, :OLD.FL_DEL);
  END;
  -- ORIGINAL TRIGGER BODY ENDS HERE
END;

  END IF;
END;
/
SHOW ERRORS;

