DROP VIEW ASU.VBASESIZE
/

/* Formatted on 06.04.2016 15:19:04 (QP5 v5.115.810.9015) */
--
-- VBASESIZE  (View)
--
--  Dependencies:
--   DBA_SEGMENTS (Synonym)
--   DBA_DATA_FILES (Synonym)
--   DBMS_SPACE_ADMIN (Package)
--

CREATE OR REPLACE FORCE VIEW ASU.VBASESIZE
(
   FN_SIZE,
   FC_COMMENT
)
AS
   SELECT   TO_CHAR ( (SUM (bytes) / 1024 / 1024)) fn_size,
            'Размер дисковых файлов' AS fc_comment
     FROM   dba_data_files
   UNION
   SELECT   TO_CHAR ( (SUM (bytes) / 1024 / 1024)) fn_size,
            'Объем используемого пространства' AS fc_comment
     FROM   dba_segments
    WHERE   segment_type IN ('TABLE', 'INDEX')
/


