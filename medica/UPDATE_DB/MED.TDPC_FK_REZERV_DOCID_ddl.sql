-- Start of DDL Script for Index MED.TDPC_FK_REZERV_DOCID
-- Generated 25.01.08 9:47:37 from MED@ASU

CREATE INDEX med.tdpc_fk_rezerv_docid ON med.tdpc
  (
    fk_rezerv_docid                 ASC
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


-- End of DDL Script for Index MED.TDPC_FK_REZERV_DOCID

