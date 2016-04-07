DROP VIEW ASU.VUSERPROCESSES
/

/* Formatted on 06.04.2016 15:19:25 (QP5 v5.115.810.9015) */
--
-- VUSERPROCESSES  (View)
--
--  Dependencies:
--   V$PROCESS (Synonym)
--   V$SESSION (Synonym)
--

CREATE OR REPLACE FORCE VIEW ASU.VUSERPROCESSES
(
   SPID,
   PROGRAM,
   OSUSER,
   SID,
   STATUS,
   TERMINAL
)
AS
   SELECT   spid,
            s.program,
            osuser,
            sid,
            s.status,
            s.terminal
     FROM   v$session s, V$process p
    WHERE   p.addr = s.paddr
/


