-- Start of DDL Script for Index MED.TDOCS_GR_TO
-- Generated 5.06.08 15:19:44 from MED@ASU

CREATE INDEX med.tdocs_gr_to ON med.tdocs
  (
    fk_mogroupid_to                 ASC
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


-- End of DDL Script for Index MED.TDOCS_GR_TO

