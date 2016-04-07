DROP VIEW ASU.AQ$_DOA_DEMO_QUEUE_TABLE_F
/

/* Formatted on 06.04.2016 15:18:55 (QP5 v5.115.810.9015) */
--
-- AQ$_DOA_DEMO_QUEUE_TABLE_F  (View)
--
--  Dependencies:
--   STANDARD (Package)
--   ALL_DEQUEUE_QUEUES (Synonym)
--   DOA_DEMO_QUEUE_TABLE (Table)
--   DOA_DEMO_QUEUE_TYPE (Type)
--

CREATE OR REPLACE FORCE VIEW ASU.AQ$_DOA_DEMO_QUEUE_TABLE_F
(
   Q_NAME,
   ROW_ID,
   MSGID,
   CORRID,
   PRIORITY,
   STATE,
   DELAY,
   EXPIRATION,
   ENQ_TIME,
   ENQ_UID,
   ENQ_TID,
   DEQ_TIME,
   DEQ_UID,
   DEQ_TID,
   RETRY_COUNT,
   EXCEPTION_QSCHEMA,
   EXCEPTION_QUEUE,
   CSCN,
   DSCN,
   CHAIN_NO,
   LOCAL_ORDER_NO,
   TIME_MANAGER_INFO,
   STEP_NO,
   USER_DATA
)
AS
   SELECT   qt.q_name Q_NAME,
            qt.ROWID ROW_ID,
            qt.msgid MSGID,
            qt.corrid CORRID,
            qt.priority PRIORITY,
            qt.state STATE,
            qt.delay DELAY,
            qt.expiration EXPIRATION,
            qt.enq_time ENQ_TIME,
            qt.enq_uid ENQ_UID,
            qt.enq_tid ENQ_TID,
            qt.deq_time DEQ_TIME,
            qt.deq_uid DEQ_UID,
            qt.deq_tid DEQ_TID,
            qt.retry_count RETRY_COUNT,
            qt.exception_qschema EXCEPTION_QSCHEMA,
            qt.exception_queue EXCEPTION_QUEUE,
            qt.cscn CSCN,
            qt.dscn DSCN,
            qt.chain_no CHAIN_NO,
            qt.local_order_no LOCAL_ORDER_NO,
            qt.time_manager_info TIME_MANAGER_INFO,
            qt.step_no STEP_NO,
            qt.user_data USER_DATA
     FROM   "DOA_DEMO_QUEUE_TABLE" qt, ALL_DEQUEUE_QUEUES qo
    WHERE   qt.q_name = qo.name
   WITH READ ONLY
/


