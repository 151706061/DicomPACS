DROP VIEW ASU.VSTARTUP
/

/* Formatted on 06.04.2016 15:19:22 (QP5 v5.115.810.9015) */
--
-- VSTARTUP  (View)
--
--  Dependencies:
--   V_$INSTANCE (View)
--

CREATE OR REPLACE FORCE VIEW ASU.VSTARTUP
(
   STARTUP_TIME,
   FC_DATE
)
AS
   SELECT   STARTUP_TIME,
            TRUNC (SYSDATE - (STARTUP_TIME)) || ' day(s), '
            || TRUNC(24
                     * ( (SYSDATE - STARTUP_TIME)
                        - TRUNC (SYSDATE - STARTUP_TIME)))
            || ' hour(s), '
            || MOD (
                  TRUNC(1440
                        * ( (SYSDATE - STARTUP_TIME)
                           - TRUNC (SYSDATE - STARTUP_TIME))),
                  60
               )
            || ' minute(s), '
            || MOD (
                  TRUNC(86400
                        * ( (SYSDATE - STARTUP_TIME)
                           - TRUNC (SYSDATE - STARTUP_TIME))),
                  60
               )
            || ' seconds'
               AS fc_date
     FROM   sys.v_$instance
/


