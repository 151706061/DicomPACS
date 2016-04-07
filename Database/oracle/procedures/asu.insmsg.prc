DROP PROCEDURE ASU.INSMSG
/

--
-- INSMSG  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   TMSG (Table)
--
CREATE OR REPLACE PROCEDURE ASU."INSMSG" (pUserID Number,pText Varchar2)
is

  PRAGMA AUTONOMOUS_TRANSACTION;
begin
INSERT INTO ASU.TMSG
          (FK_SENDER,
           FK_RECIEVER,
           FD_SEND,
           FC_TEXT,
           FP_NEED_READ,
           FK_BLOB,
           FP_TYPE,
           FP_MAIL,
           FK_OWNERID)
         VALUES
          (0,
          pUserID,
          SYSDATE,
          pText,
          0,
          0,
          0,
          0,
          NULL);
commit;
end;
/

SHOW ERRORS;


