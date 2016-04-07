DROP TABLE ASU.TPROFP_INSPMANY_SMID CASCADE CONSTRAINTS
/

--
-- TPROFP_INSPMANY_SMID  (Table) 
--
CREATE GLOBAL TEMPORARY TABLE ASU.TPROFP_INSPMANY_SMID
(
  FK_PACID        NUMBER                        NOT NULL,
  FK_LISTID       NUMBER,
  FK_SMID         NUMBER,
  FC_SMID_NAME    VARCHAR2(300 BYTE),
  FK_SOTR         NUMBER,
  FK_SOTR_NAME    VARCHAR2(100 BYTE),
  FL_TYPE         NUMBER(1),
  FL_CHECK        NUMBER(1),
  FK_NAZID        NUMBER,
  FC_TEMP         VARCHAR2(100 BYTE),
  FL_IS_LIST_NAZ  NUMBER(1)                     DEFAULT 0
)
ON COMMIT PRESERVE ROWS
NOCACHE
/

COMMENT ON COLUMN ASU.TPROFP_INSPMANY_SMID.FK_PACID IS 'TAMBULANCE.FK_ID'
/

COMMENT ON COLUMN ASU.TPROFP_INSPMANY_SMID.FK_LISTID IS 'TPROFP_LIST.FK_ID'
/

COMMENT ON COLUMN ASU.TPROFP_INSPMANY_SMID.FK_SMID IS 'TSMID.FK_ID'
/

COMMENT ON COLUMN ASU.TPROFP_INSPMANY_SMID.FK_SOTR IS 'LOGIN.TSOTR.FK_ID ���������'
/

COMMENT ON COLUMN ASU.TPROFP_INSPMANY_SMID.FK_NAZID IS 'VNAZ.FK_ID ����������'
/


--
-- TPROFP_INSPMANU_BU  (Trigger) 
--
--  Dependencies: 
--   TPROFP_INSPMANY_SMID (Table)
--
CREATE OR REPLACE TRIGGER ASU.TPROFP_INSPMANU_BU
 BEFORE
 UPDATE
 ON ASU.TPROFP_INSPMANY_SMID  FOR EACH ROW
begin
if :new.FL_IS_LIST_NAZ=1 then
:new.FL_CHECK:=0;
end if;
end;
/
SHOW ERRORS;

