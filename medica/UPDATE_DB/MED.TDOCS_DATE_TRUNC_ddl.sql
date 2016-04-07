-- Start of DDL Script for Index MED.TDOCS_DATE_TRUNC
-- Generated 5.06.08 15:19:57 from MED@ASU

CREATE INDEX med.tdocs_date_trunc ON med.tdocs
  (    TRUNC("FD_DATA") ASC )
 COMPUTE STATISTICS   
/


-- End of DDL Script for Index MED.TDOCS_DATE_TRUNC

