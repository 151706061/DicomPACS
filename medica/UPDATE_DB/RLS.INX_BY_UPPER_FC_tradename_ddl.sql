-- Start of DDL Script for Index RLS.INX_BY_UPPER_FC_NAME
-- Generated 31.03.08 15:08:14 from RLS@ASU

CREATE INDEX rls.inx_by_upper_fc_tradename ON rls.ttradenames
  (
    UPPER("FC_NAME") ASC
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


-- End of DDL Script for Index RLS.INX_BY_UPPER_FC_NAME

