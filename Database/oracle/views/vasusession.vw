DROP VIEW ASU.VASUSESSION
/

/* Formatted on 06.04.2016 15:19:03 (QP5 v5.115.810.9015) */
--
-- VASUSESSION  (View)
--
--  Dependencies:
--   V$SESSION (Synonym)
--

CREATE OR REPLACE FORCE VIEW ASU.VASUSESSION
(
   SID,
   STATUS,
   OSUSER,
   MACHINE,
   PROGRAM
)
AS
   SELECT   sid,
            status,
            osuser,
            machine,
            program
     FROM   V$SESSION
    WHERE   username = 'ASU'
/


