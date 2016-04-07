DROP FUNCTION ASU.GET_RES_TFHB_SJ
/

--
-- GET_RES_TFHB_SJ  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZAN (Table)
--   TRESAN (Table)
--   TSMID (Table)
--
CREATE OR REPLACE FUNCTION ASU.GET_RES_TFHB_SJ
  ( pFK_NAZID IN NUMBER)
  RETURN  VARCHAR2 IS
--
-- Результаты Tf, Hb
-- ---------   ------  -------------------------------------------
  CURSOR c(ppFK_NAZID NUMBER) IS SELECT ra.fn_res as tf_res, ra2.fn_res as hb_res
         FROM asu.tnazan an INNER JOIN ASU.TRESAN ra
         ON an.fk_id = ra.fk_nazid INNER JOIN ASU.TRESAN ra2
         ON ra.fk_nazid = ra2.fk_nazid AND ra.fk_colid = ra2.fk_colid
         WHERE an.FK_ID = ppFK_NAZID
         AND EXISTS(SELECT 1 FROM ASU.TSMID ts WHERE LOWER(ts.FC_NAME) = 'tf' AND ts.fk_id = ra.fk_smid
           CONNECT BY PRIOR ts.FK_ID = ts.FK_OWNER START WITH ts.FC_SYNONIM = 'BAK_HB_TF')
         AND EXISTS(SELECT 1 FROM ASU.TSMID ts2 WHERE LOWER(ts2.FC_NAME) = 'hb' AND ts2.fk_id = ra2.fk_smid
           CONNECT BY PRIOR ts2.FK_ID = ts2.FK_OWNER START WITH ts2.FC_SYNONIM = 'BAK_HB_TF');

  str VARCHAR2(32767);
BEGIN
  FOR p IN C(pFK_NAZID) LOOP
    IF str IS NULL THEN
      str:=str||'Tf = '||TO_CHAR(p.tf_res)||', Hb = '||TO_CHAR(p.hb_res);
    ELSE
      str:=str||'; '||'Tf = '||TO_CHAR(p.tf_res)||', Hb = '||TO_CHAR(p.hb_res);
    END IF;
  END LOOP;
  RETURN str;
END;
/

SHOW ERRORS;


