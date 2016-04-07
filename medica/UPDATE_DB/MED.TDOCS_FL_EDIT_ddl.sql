-- Start of DDL Script for Index MED.TDOCS_FL_EDIT
-- Generated 5.06.08 15:20:05 from MED@ASU

CREATE INDEX med.tdocs_fl_edit ON med.tdocs
  (
    fl_edit                         ASC
  )
  PCTFREE     10
  INITRANS    2
  MAXTRANS    255
  TABLESPACE  usr
  STORAGE   (
    INITIAL     40960
    NEXT        40960
    PCTINCREASE 50
    MINEXTENTS  1
    MAXEXTENTS  505
  )
/


-- End of DDL Script for Index MED.TDOCS_FL_EDIT

