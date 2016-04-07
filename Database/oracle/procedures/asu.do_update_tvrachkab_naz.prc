DROP PROCEDURE ASU.DO_UPDATE_TVRACHKAB_NAZ
/

--
-- DO_UPDATE_TVRACHKAB_NAZ  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TVRACHKAB_NAZ (Table)
--   TSMID (Table)
--   GET_ISSLEDID (Function)
--   GET_KONSID (Function)
--   GET_PROCID (Function)
--
CREATE OR REPLACE PROCEDURE ASU."DO_UPDATE_TVRACHKAB_NAZ" (pfk_sotrkabid IN NUMBER)
IS
  cursor c2(pKABID IN NUMBER) is SELECT MAX (tvn1.fk_id)
                        FROM tvrachkab_naz tvn1,
       (select *
          from (Select FK_ID, FK_OWNER from ASU.TSMID where FL_SHOWANAL = 1) TSS
        connect by prior FK_ID = FK_OWNER
         start with FK_ID in (ASU.Get_Konsid, asu.get_procid, asu.get_issledid)) TSM

                       WHERE tvn1.fk_sotrkabid =pKABID and tvn1.FK_SMID = TSM.FK_ID ;
  nTMP NUMBER(15);
BEGIN
   open c2(pfk_sotrkabid);
   fetch c2 into nTMP;
   close c2;
   UPDATE tvrachkab_naz tvn
      SET fk_id_ =
             DECODE (nTMP,
                     tvn.fk_id, tvn.fk_sotrkabid,
                     tvn.fk_id
                    )
    WHERE tvn.fk_sotrkabid = pfk_sotrkabid;
END;                                                              -- Procedure
/

SHOW ERRORS;


