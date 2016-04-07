-- Start of DDL Script for Index MED.TDOCS_FP_VID_FP_VIDMOVE
-- Generated 6-фев-2008 16:14:00 from MED@ASU

CREATE INDEX med.tdocs_fp_vid_fp_vidmove ON med.tdocs
  (
    fp_vid                          ASC,
    fp_vidmove                      ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  usr
  STORAGE   (
    INITIAL     65536
    MINEXTENTS  1
    MAXEXTENTS  2147483645
  )
NOLOGGING
/


-- End of DDL Script for Index MED.TDOCS_FP_VID_FP_VIDMOVE

