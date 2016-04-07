DROP PACKAGE ASU.QUEST_SL_TRACE_PARSE
/

--
-- QUEST_SL_TRACE_PARSE  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."QUEST_SL_TRACE_PARSE" AS

--    QUEST_SL_TRC_VERSION CONSTANT VARCHAR2(10) := 'V2-R1';

    QUEST_SL_TRC_BLOCK_SIZE           CONSTANT NUMBER := 10000;

    -- Operating System Definitions
    QUEST_SL_TRC_OS_WIN               CONSTANT NUMBER := 10;
    QUEST_SL_TRC_OS_UNX               CONSTANT NUMBER := 20;
    QUEST_SL_TRC_OS_VMS               CONSTANT NUMBER := 30;
    QUEST_SL_TRC_OS_NOV               CONSTANT NUMBER := 40;
    QUEST_SL_TRC_OS_ERR               CONSTANT NUMBER := 50;

    QUEST_SL_TRC_IS_SAME_CURSOR       CONSTANT NUMBER := 1;
    QUEST_SL_TRC_NOT_SAME_CURSOR      CONSTANT NUMBER := 0;
    QUEST_SL_TRC_CURSOR_REPARSE       CONSTANT NUMBER := -1;
    QUEST_SL_TRC_NO_CURSOR            CONSTANT NUMBER := -1;

    QUEST_SL_TRC_PARSE_OK             CONSTANT NUMBER := 0;
    QUEST_SL_TRC_FILE_OK              CONSTANT NUMBER := 0;

    QUEST_SL_TRC_OP_SUCCESS           CONSTANT NUMBER := 0;
    QUEST_TRC_OP_SUCCESS_MORE_DATA    CONSTANT NUMBER := 20001;
    QUEST_SL_TRC_BLOCK_DONE           CONSTANT NUMBER := 20002;

    QUEST_SL_TRC_STATMENT_FOUND       CONSTANT NUMBER := 80;
    QUEST_SL_TRC_MARKER_FOUND         CONSTANT NUMBER := 85;

    -- Internal Errors
    QUEST_SL_TRC_GET_TRC_DATA_ERR     CONSTANT NUMBER := 20201;
    QUEST_SL_TRC_RET_TRC_DATA_ERR     CONSTANT NUMBER := 20202;
    QUEST_SL_TRC_PARSE_FILE_ERR       CONSTANT NUMBER := 20203;
    QUEST_SL_TRC_TABLE_INDX_ERR       CONSTANT NUMBER := 20204;
    QUEST_SL_TRC_GET_TRC_MRKR_ERR     CONSTANT NUMBER := 20205;

    -- External Errors
    QUEST_SL_TRC_NO_SQL_STATEMENT     CONSTANT NUMBER := 20207;
    QUEST_SL_TRC_NO_TRC_MARKER        CONSTANT NUMBER := 20208;
    QUEST_SL_TRC_FIND_SQL_ERR         CONSTANT NUMBER := 20209;
    QUEST_SL_TRC_LOG_FILE_FULL_ERR    CONSTANT NUMBER := 20210;

    TRACE_FILE_FULL                CONSTANT VARCHAR(23) := '*** Trace file full ***';

    TYPE VARCHAR2T IS TABLE OF VARCHAR2(10000) INDEX BY BINARY_INTEGER;

    G_trace_table VARCHAR2T;
    G_trace_index BINARY_INTEGER;
    G_trace_out_data VARCHAR2(10000);
    G_data_size  NUMBER;
    G_line_count NUMBER := 0;
    G_file_open BOOLEAN := FALSE;

--    PROCEDURE get_body_version(vers OUT VARCHAR2);
--    PROCEDURE get_head_version(vers OUT VARCHAR2);

    FUNCTION get_trace_data(trace_data IN OUT VARCHAR2,
                            block_size IN OUT NUMBER,
                            cursor_num IN OUT NUMBER,
                            trc_marker IN     INTEGER,
                              stmnt_id IN     VARCHAR2,
                              dir_name IN     VARCHAR2,
                             file_name IN     VARCHAR2,
                              oper_sys IN     NUMBER) RETURN NUMBER;
    FUNCTION retrieve_trace_data(trace_data IN OUT VARCHAR2,
                                 block_size IN OUT NUMBER) RETURN NUMBER;
    FUNCTION search_for_trace_marker(marker IN INTEGER) RETURN NUMBER;
    FUNCTION is_trace_marker(line IN VARCHAR2, marker IN INTEGER) RETURN BOOLEAN;
    FUNCTION is_statement_id(line IN VARCHAR2, stmnt_id IN VARCHAR2) RETURN BOOLEAN;
    FUNCTION is_same_cursor(line IN VARCHAR2, cursor_# IN NUMBER) RETURN NUMBER;
    FUNCTION get_cursor_from_line(line IN VARCHAR2,
                                  strt IN VARCHAR2,
                                  stop IN VARCHAR2) RETURN NUMBER;
    FUNCTION parse_trace_file(cursor_num IN OUT NUMBER,
                              data_found IN OUT BOOLEAN,
                              trc_marker IN     INTEGER,
                                stmnt_id IN     VARCHAR2) RETURN NUMBER;
    FUNCTION find_statement_id(trc_marker IN     INTEGER,
                                 stmnt_id IN     VARCHAR2,
                        parse_cursor_line IN OUT VARCHAR2) RETURN NUMBER;

    PROCEDURE close_file(dir_name IN VARCHAR2, file_name IN VARCHAR2);
    PROCEDURE append_string(in_string IN VARCHAR2);

END quest_sl_trace_parse;
/

SHOW ERRORS;


