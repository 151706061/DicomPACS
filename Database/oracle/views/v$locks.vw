DROP VIEW ASU.V$LOCKS
/

/* Formatted on 06.04.2016 15:19:07 (QP5 v5.115.810.9015) */
--
-- V$LOCKS  (View)
--
--  Dependencies:
--   V$SESSION (Synonym)
--   V$ACCESS (Synonym)
--   V$LOCK (Synonym)
--

CREATE OR REPLACE FORCE VIEW ASU.V$LOCKS
(
   USERNAMEB,
   USERNAMEA,
   SESSIONIDH,
   SESSIONIDW,
   LOCK_TYPE,
   MODE_HELD,
   MODE_REQUESTED,
   OBJECTNAME,
   LOCK_ID1,
   LOCK_ID2
)
AS
   SELECT                                                          /*+ RULE */
         B  .USERNAME AS USERNAMEB,
            A.USERNAME AS USERNAMEA,
            H.SID AS SESSIONIDH,
            W.SID AS SESSIONIDW,
            DECODE (W.TYPE,
                    'MR', 'Media Recovery',
                    'RT', 'Redo Thread',
                    'UN', 'User Name',
                    'TX', 'Transaction',
                    'TM', 'DML',
                    'UL', 'PL/SQL User Lock',
                    'DX', 'Distributed Xaction',
                    'CF', 'Control File',
                    'IS', 'Instance State',
                    'FS', 'File Set',
                    'IR', 'Instance Recovery',
                    'ST', 'Disk Space Transaction',
                    'TS', 'Temp Segment',
                    'IV', 'Library Cache Invalidation',
                    'LS', 'Log Start or
Switch',
                    'RW', 'Row Wait',
                    'SQ', 'Sequence Number',
                    'TE', 'Extend
Table',
                    'TT', 'Temp Table',
                    W.TYPE)
               LOCK_TYPE,
            DECODE (H.LMODE,
                    0, 'None',
                    1, 'Null',
                    2, 'Row-S (SS)',
                    3, 'Row-X (SX)',
                    4, 'Share',
                    5, 'S/Row-X (SSX)',
                    6, 'Exclusive',
                    TO_CHAR (H.LMODE))
               AS MODE_HELD,
            DECODE (W.REQUEST,
                    0, 'None',
                    1, 'Null',
                    2, 'Row-S (SS)',
                    3, 'Row-X (SX)',
                    4, 'Share',
                    5, 'S/Row-X (SSX)',
                    6, 'Exclusive',
                    TO_CHAR (W.REQUEST))
               AS MODE_REQUESTED,
            O.OWNER || '.' || O.OBJECT || ' (' || O.TYPE || ')' AS OBJECTNAME,
            W.ID1 LOCK_ID1,
            W.ID2 LOCK_ID2
     FROM   V$SESSION B,
            V$ACCESS O,
            V$LOCK H,
            V$LOCK W,
            V$SESSION A
    WHERE       H.LMODE <> 0
            AND H.LMODE <> 1
            AND W.REQUEST <> 0
            AND H.TYPE = W.TYPE
            AND H.ID1 = W.ID1
            AND H.ID2 = W.ID2
            AND B.SID = H.SID
            AND W.SID = A.SID
            AND (O.SID = W.SID OR O.SID = H.SID)
            AND O.OWNER <> 'SYS'
/


