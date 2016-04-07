-- Start of DDL Script for Index RLS.INX_BY_UPPER_FC_LATINNAME
-- Generated 31.03.08 15:57:24 from RLS@ASU

CREATE INDEX rls.inx_by_upper_fc_latinname ON rls.tlatinnames
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


-- End of DDL Script for Index RLS.INX_BY_UPPER_FC_LATINNAME

