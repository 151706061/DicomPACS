DROP PROCEDURE ASU.DO_INSERT_TNAZLECH
/

--
-- DO_INSERT_TNAZLECH  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZLECH (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_INSERT_TNAZLECH" 
(pSMID in NUMBER, pDRUN in DATE, pKABINETID in NUMBER, pVRACHID in NUMBER, pISPOLID in NUMBER,
 pNAZSOSID in NUMBER, pPACID in NUMBER, pPLAT in NUMBER, pTYPE in VARCHAR2, pFK_ID in out NUMBER, pFL_INS in NUMBER)
IS
BEGIN
  insert into tnazlech(fk_smid, fd_naz, fd_run, FK_ROOMID, fk_vrachid, fk_ispolid, fk_nazsosid, fk_pacid, fl_plat, fc_type, fl_ins)
         values (pSMID, SYSDATE, pDRUN, pKABINETID, pVRACHID, pISPOLID, pNAZSOSID, pPACID, pPLAT, pTYPE, pFL_INS)
  returning fk_id into pFK_ID;
END;
/

SHOW ERRORS;


