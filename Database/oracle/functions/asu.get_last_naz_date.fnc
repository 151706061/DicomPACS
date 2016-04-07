DROP FUNCTION ASU.GET_LAST_NAZ_DATE
/

--
-- GET_LAST_NAZ_DATE  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TNAZAN (Table)
--
CREATE OR REPLACE FUNCTION ASU."GET_LAST_NAZ_DATE" (pacid IN NUMBER)
    RETURN  DATE IS

    CURSOR C IS
        SELECT
            fd_naz
        FROM
            tnazan
        WHERE
            fk_pacid = pacid
            AND tnazan.fk_nazsosid = 2
        ORDER BY
            fd_naz DESC;

    d   DATE;

BEGIN
    OPEN C;
    FETCH C INTO d;
    CLOSE C;
    RETURN d;
END;
/

SHOW ERRORS;


