DROP PROCEDURE ASU.DO_SET_EPIKRIZ
/

--
-- DO_SET_EPIKRIZ  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TCLOBS (Table)
--   TEPIKRIZ (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_SET_EPIKRIZ" (
                    pFK_PACID in NUMBER,
                    pFP_EPIKRIZ in NUMBER,
                    pFK_VRACHID in NUMBER,
                    pFD_DATE in date,
                    pFL_PODPIS in NUMBER,
                    pFC_NAME in varchar2,
                    pFK_BID in NUMBER,
                    pFK_CLOBID in out number) IS
CURSOR cTemp IS SELECT /*+ rule*/COUNT(FK_ID) FROM TEPIKRIZ WHERE FK_PACID=pFK_PACID;
cursor cClob is select fk_clobid from TEPIKRIZ where fk_pacid=pFK_PACID;
nTemp NUMBER:=0;
nClobID number:=0;
BEGIN
   OPEN ctemp;
   FETCH ctemp INTO ntemp;
   CLOSE ctemp;
   IF    (pfk_clobid IS NULL) OR (pfk_clobid = 0) THEN
      OPEN cclob;
      FETCH cclob INTO nclobid;
      CLOSE cclob;
      IF nclobid IS NOT NULL THEN
         DELETE FROM tclobs WHERE fk_id = nclobid;
      END IF;
      INSERT INTO tclobs(fk_id) VALUES (NULL) RETURNING fk_id INTO pfk_clobid;                                                                                                                                                                                                    -- зарезервируем место под текст
   END IF;
   IF ntemp = 0 THEN
      INSERT INTO tepikriz(fk_pacid, fk_bid, fp_epikriz, fk_vrachid, fd_date, fl_podpis, fc_name, fk_clobid)
           VALUES (pfk_pacid, pfk_bid, pfp_epikriz, pfk_vrachid, pfd_date, pfl_podpis, pfc_name, pfk_clobid);
   ELSE
      UPDATE tepikriz
         SET fk_pacid = pfk_pacid
            ,fk_bid = pfk_bid
            ,fp_epikriz = pfp_epikriz
            ,fk_vrachid = pfk_vrachid
            ,fd_date = pfd_date
            ,fl_podpis = pfl_podpis
            ,fc_name = pfc_name
            ,fk_clobid = pfk_clobid
       WHERE fk_pacid = pfk_pacid;
   END IF;
END;
/

SHOW ERRORS;


