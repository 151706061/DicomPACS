DROP FUNCTION ASU.SEND_MSG
/

--
-- SEND_MSG  (Function) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TMSG (Table)
--   TMULTIMSG (Table)
--
CREATE OR REPLACE FUNCTION ASU."SEND_MSG" (nsender   IN NUMBER,
                                    nreciever IN NUMBER,
                                    vtext     IN VARCHAR2,
                                    nneedread IN NUMBER,
                                    nblobid   IN NUMBER,
                                    ntype     IN NUMBER,
                                    nMail     IN NUMBER DEFAULT 0,
                                    dDate     IN DATE DEFAULT SYSDATE,
                                    nownerid  IN NUMBER DEFAULT 0) RETURN NUMBER IS
 -- Created 20070528 by Linnikov
 -- Функция записывает новое сообщение и возвращает ID записи

 nfk_id NUMBER;
 nTmp   NUMBER;

BEGIN
 INSERT INTO TMSG
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
  (nsender, nreciever, dDate, vtext, nneedread, nblobid, ntype, nMail, nownerid)
 RETURNING FK_ID INTO nfk_id;
 COMMIT;
 FOR C IN (SELECT FK_RECIEVER FROM TMULTIMSG WHERE FK_RESENDER = nreciever) LOOP
  nTmp := SEND_MSG(nsender,
                   C.FK_RECIEVER,
                   vtext,
                   nneedread,
                   nblobid,
                   ntype,
                   nMail,
                   dDate,
                   nownerid);
  COMMIT;
 END LOOP;
 RETURN nfk_id;
END SEND_MSG;
/

SHOW ERRORS;


