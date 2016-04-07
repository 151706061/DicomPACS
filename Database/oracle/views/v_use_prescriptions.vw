DROP VIEW ASU.V_USE_PRESCRIPTIONS
/

/* Formatted on 06.04.2016 15:19:24 (QP5 v5.115.810.9015) */
--
-- V_USE_PRESCRIPTIONS  (View)
--
--  Dependencies:
--   TSMID (Table)
--   GET_PROCMANID (Function)
--

CREATE OR REPLACE FORCE VIEW ASU.V_USE_PRESCRIPTIONS (ID, OWNER_ID, NAME)
AS
   (    SELECT   DISTINCT FK_ID AS ID, FK_OWNER AS OWNER_ID, FC_NAME AS NAME
          FROM   TSMID
         WHERE   FK_ID NOT IN (    SELECT   FK_ID
                                     FROM   TSMID
                               START WITH   FC_SYNONIM = 'RAZ_PROC'
                               CONNECT BY   PRIOR FK_OWNER = FK_ID)
    START WITH   FK_ID IN (    SELECT   FK_ID
                                 FROM   TSMID
                                WHERE   FL_SHOWANAL = 1
                           START WITH   FK_ID = GET_PROCMANID
                           CONNECT BY   PRIOR FK_ID = FK_OWNER)
    CONNECT BY   PRIOR FK_OWNER = FK_ID)
/
COMMENT ON TABLE ASU.V_USE_PRESCRIPTIONS IS 'ѕредназначена дл€ предоставлени€ назначений. Author: rca'
/


