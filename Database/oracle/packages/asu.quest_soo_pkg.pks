DROP PACKAGE ASU.QUEST_SOO_PKG
/

--
-- QUEST_SOO_PKG  (Package) 
--
--  Dependencies: 
--   STANDARD (Package)
--
CREATE OR REPLACE PACKAGE ASU."QUEST_SOO_PKG" 
IS
--
-- This package contains routines to support Spotlight On Oracle
--
-- Person      Date    Comments
-- ---------   ------  -----------------------------------------------
-- Guy         7oct98  Initial
-- Megh        20Jun99 Added procedures obj_keep, obj_unkeep and
--                     flush_shared_pool. Also added function obj_type
-- Han B Xie   Jun2000 - now.

    -- Global indicating that the object cache is initialized
    g_object_cache_initialized     NUMBER:=0;
    g_debug                        NUMBER:=0;

    --
    -- Function to format SQL
    --
    Function format_sql ( p_sql_text IN varchar2,
                          p_max_len  IN number:=256)
             RETURN  varchar2;
    PRAGMA restrict_references(format_sql, WNDS, RNDS, WNPS, RNPS);

    --
    -- Event_category returns the event "category" so we can group
    -- like categories.  It's overloaded to accept either a event anme
    -- or the INDX from X$KSLEI
    --
    FUNCTION event_category(p_event varchar2) RETURN varchar2;
    PRAGMA   RESTRICT_REFERENCES (event_category, WNDS, RNDS, WNPS);

    FUNCTION event_category(p_indx number) RETURN varchar2;
    PRAGMA   RESTRICT_REFERENCES (event_category, WNDS, RNDS, WNPS);

    FUNCTION latch_category(p_latch_name varchar2) RETURN varchar2;
    PRAGMA   RESTRICT_REFERENCES (latch_category, WNDS, RNDS, WNPS);

    FUNCTION obj_type(object_t varchar2) RETURN char;
    PRAGMA   RESTRICT_REFERENCES (obj_type, WNDS, RNDS, WNPS);

    --
    -- Event detail takes the p1, p2, p3 details from v$session_wait
    -- and returns the real location
    --
    FUNCTION event_detail(p_event varchar2,
                          p1text varchar2, p1 number,
                          p2text varchar2, p2 number,
                          p3text varchar2, p3 number)
             RETURN varchar2;

    FUNCTION IsSpOk RETURN number;
    PRAGMA   RESTRICT_REFERENCES (IsSpOk, WNDS, WNDS, WNPS);

    FUNCTION IsSprOk   RETURN number;
    PRAGMA   RESTRICT_REFERENCES (IsSprOk, WNDS, WNDS, WNPS);

    FUNCTION SgaOther RETURN number;
    PRAGMA   RESTRICT_REFERENCES (SgaOther, WNDS, WNDS, WNPS);

    --
    -- Procedure initialize to initialize PL/SQL tables , etc
    --
    PROCEDURE initialize;

    -- Quick but essential initialize
    PROCEDURE initializeA;
    -- Slower initialize which can be defered until main screen collected
    PROCEDURE initializeB;

    -- Print the current lock-tree
    PROCEDURE locktree;

    -- Set a normal trace on for the session
    PROCEDURE set_trace(p_sid NUMBER, p_serial NUMBER, p_mode boolean);

    -- Kill the nominated session
    PROCEDURE kill_session(p_sid NUMBER, p_serial NUMBER);

    -- Turn timed statistics on
    PROCEDURE set_timed_statistics;

    -- Keep object in shared pool
    -- PROCEDURE obj_keep(name in varchar2, type in varchar2);

    -- Unkeep object from shared pool
    -- PROCEDURE obj_unkeep(name in varchar2, type in varchar2);

    -- Flush shared pool
    PROCEDURE flush_shared_pool;

    --
    -- Translate values in the form 999{K|M} to byte values so
    -- instance monitor can deal with them
    --

    FUNCTION TRANSLATE_PARAMETER( p_value VARCHAR2) RETURN  varchar2;

    PRAGMA  RESTRICT_REFERENCES (translate_parameter, WNDS, RNDS, WNPS);

    --
    -- These routines support the "show locked row" facility
    --
    --Published procedures
    --Show the row locks being waited for by the specified sid
    FUNCTION show_locked_row(lsid in number) return varchar2;
    FUNCTION toRadixString(num in number, radix in number) return varchar2;
    PRAGMA   restrict_references(toRadixString, WNDS, WNPS, RNDS, RNPS);
    FUNCTION digitToString(num in number) return varchar2;
    PRAGMA   restrict_references(digitToString, WNDS, WNPS, RNDS, RNPS);

    FUNCTION sga_cat(p_pool VARCHAR2, p_name VARCHAR2) RETURN VARCHAR2;
    PRAGMA   restrict_references(sga_cat, WNDS, RNDS, WNPS, RNPS);

    FUNCTION sga_cat2(p_pool VARCHAR2, p_name VARCHAR2) RETURN VARCHAR2;
    PRAGMA   restrict_references(sga_cat2, WNDS, RNDS, WNPS, RNPS);

    FUNCTION sga_pool7(p_name VARCHAR2) RETURN VARCHAR2;
    PRAGMA   restrict_references(sga_pool7, WNDS, RNDS, WNPS, RNPS);

    FUNCTION sga_area7(p_name VARCHAR2) RETURN VARCHAR2;
    PRAGMA   restrict_references(sga_area7, WNDS, RNDS, WNPS, RNPS);

    -- Stuff for getting full SQL text
    FUNCTION exact_db_version(p_major OUT NUMBER,
                              p_minor1 OUT NUMBER,
                              p_minor2 OUT NUMBER)
             RETURN VARCHAR2;

    FUNCTION get_long_sqltext(p_hash_value NUMBER,
                              p_address RAW)
             RETURN VARCHAR2;

    FUNCTION get_session_long_sqltext(p_sid NUMBER)
             RETURN VARCHAR2;

    -- Decode lock details: TYPE, MODE, REQUEST
    FUNCTION lock_type_decode(type_p VARCHAR2, id2_p NUMBER default -1)
             RETURN VARCHAR2;
    PRAGMA restrict_references(lock_type_decode, WNDS, WNPS, RNPS);

    FUNCTION lock_mode_decode(mode_p NUMBER) RETURN VARCHAR2;
    PRAGMA   restrict_references(lock_mode_decode, WNDS, WNPS, RNPS);

END; -- quest_soo_pkg .
/

SHOW ERRORS;


