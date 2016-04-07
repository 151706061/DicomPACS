DROP VIEW ASU.AQ$DOA_DEMO_QUEUE_TABLE
/

/* Formatted on 06.04.2016 15:18:58 (QP5 v5.115.810.9015) */
--
-- AQ$DOA_DEMO_QUEUE_TABLE  (View)
--
--  Dependencies:
--   STANDARD (Package)
--   DOA_DEMO_QUEUE_TABLE (Table)
--   DOA_DEMO_QUEUE_TYPE (Type)
--

CREATE OR REPLACE FORCE VIEW ASU.AQ$DOA_DEMO_QUEUE_TABLE
(
   QUEUE,
   MSG_ID,
   CORR_ID,
   MSG_PRIORITY,
   MSG_STATE,
   DELAY,
   DELAY_TIMESTAMP,
   EXPIRATION,
   ENQ_TIME,
   ENQ_TIMESTAMP,
   ENQ_USER_ID,
   ENQ_TXN_ID,
   DEQ_TIME,
   DEQ_TIMESTAMP,
   DEQ_USER_ID,
   DEQ_TXN_ID,
   RETRY_COUNT,
   EXCEPTION_QUEUE_OWNER,
   EXCEPTION_QUEUE,
   USER_DATA,
   ORIGINAL_QUEUE_NAME,
   ORIGINAL_QUEUE_OWNER,
   EXPIRATION_REASON
)
AS
   SELECT   q_name QUEUE,
            msgid MSG_ID,
            corrid CORR_ID,
            priority MSG_PRIORITY,
            DECODE (state,
                    0,
                    'READY',
                    1,
                    'WAIT',
                    2,
                    'PROCESSED',
                    3,
                    'EXPIRED',
                    10,
                    'BUFFERED_EXPIRED')
               MSG_STATE,
            CAST (
               FROM_TZ (delay, '05:00') AT TIME ZONE SESSIONTIMEZONE AS date
            )
               DELAY,
            delay DELAY_TIMESTAMP,
            expiration,
            CAST (
               FROM_TZ (enq_time, '05:00') AT TIME ZONE SESSIONTIMEZONE AS DATE
            )
               ENQ_TIME,
            CAST (
               FROM_TZ (enq_time, '05:00') AT TIME ZONE SESSIONTIMEZONE AS timestamp
            )
               ENQ_TIMESTAMP,
            enq_uid ENQ_USER_ID,
            enq_tid ENQ_TXN_ID,
            CAST (
               FROM_TZ (deq_time, '05:00') AT TIME ZONE SESSIONTIMEZONE AS DATE
            )
               DEQ_TIME,
            CAST (
               FROM_TZ (deq_time, '05:00') AT TIME ZONE SESSIONTIMEZONE AS timestamp
            )
               DEQ_TIMESTAMP,
            deq_uid DEQ_USER_ID,
            deq_tid DEQ_TXN_ID,
            retry_count,
            DECODE (state,
                    0, exception_qschema,
                    1, exception_qschema,
                    2, exception_qschema,
                    NULL)
               EXCEPTION_QUEUE_OWNER,
            DECODE (state,
                    0, exception_queue,
                    1, exception_queue,
                    2, exception_queue,
                    NULL)
               EXCEPTION_QUEUE,
            user_data,
            DECODE (
               state,
               3,
               DECODE (deq_tid, 'INVALID_TRANSACTION', NULL, exception_queue),
               NULL
            )
               ORIGINAL_QUEUE_NAME,
            DECODE (
               state,
               3,
               DECODE (deq_tid,
                       'INVALID_TRANSACTION', NULL,
                       exception_qschema),
               NULL
            )
               ORIGINAL_QUEUE_OWNER,
            DECODE (
               state,
               3,
               DECODE (
                  deq_time,
                  NULL,
                  DECODE (
                     deq_tid,
                     NULL,
                     DECODE (expiration,
                             NULL, 'MAX_RETRY_EXCEEDED',
                             'TIME_EXPIRATION'),
                     'INVALID_TRANSACTION',
                     NULL,
                     'MAX_RETRY_EXCEEDED'
                  ),
                  NULL
               ),
               NULL
            )
               EXPIRATION_REASON
     FROM   "DOA_DEMO_QUEUE_TABLE"
    WHERE   state != 7 AND state != 9
   WITH READ ONLY
/


