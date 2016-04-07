DROP PACKAGE BODY ASU.PKGASKREPLY
/

--
-- PKGASKREPLY  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU.PkgAskReply IS
  -- Created 20110728 by Efimov V.A.

  FUNCTION AddToAskReplyElseLog(pREPLY      IN VARCHAR2,
                                pREPLYFIELD IN VARCHAR2,
                                pASK        IN VARCHAR2,
                                pASKFIELD   IN VARCHAR2,
                                pASKID      IN VARCHAR2,
                                pOWNER      IN VARCHAR2 default null,
                                pOWNERFIELD IN VARCHAR2 default null,
                                pOWNERID    IN VARCHAR2 default null,
                                pOWNERFILL  IN VARCHAR2 default null) RETURN VARCHAR2 IS
  pragma autonomous_transaction;
  BEGIN
    INSERT INTO ASU.TREPLYTABLE_ELSELOG (FC_ASK, FC_ASKFIELD, FC_ASKID, FC_REPLY, FC_REPLYFIELD, FC_OWNER, FC_OWNERFIELD, FC_OWNERID, FC_OWNERFILL)
         VALUES (pASK, pASKFIELD, pASKID, pREPLY, pREPLYFIELD, pOWNER, pOWNERFIELD, pOWNERID, pOWNERFILL);
    commit;

    RETURN null;
  END;

  FUNCTION GetReply(pREPLY      IN VARCHAR2,
                    pREPLYFIELD IN VARCHAR2,
                    pASK        IN VARCHAR2,
                    pASKFIELD   IN VARCHAR2,
                    pASKID      IN VARCHAR2) RETURN VARCHAR2 IS
    iRes ASU.TREPLYTABLE.FC_REPLYID%TYPE;
  BEGIN
    select Max(tr.FC_REPLYID)
      into iRes
      from ASU.TREPLYTABLE tr
     where tr.FC_REPLY = pREPLY
       and tr.FC_REPLYFIELD = pREPLYFIELD
       and tr.FC_ASK = pASK
       and tr.FC_ASKFIELD = pASKFIELD
       and tr.FC_ASKID = pASKID;

    RETURN iRes;
  END;

  FUNCTION GetReply_ElseLog(pREPLY      IN VARCHAR2,
                            pREPLYFIELD IN VARCHAR2,
                            pASK        IN VARCHAR2,
                            pASKFIELD   IN VARCHAR2,
                            pASKID      IN VARCHAR2,
                            pOWNER      IN VARCHAR2 default null,
                            pOWNERFIELD IN VARCHAR2 default null,
                            pOWNERID    IN VARCHAR2 default null,
                            pOWNERFILL  IN VARCHAR2 default null) RETURN VARCHAR2 IS
    iRes ASU.TREPLYTABLE.FC_REPLYID%TYPE;
  BEGIN
    select nvl(GetReply(pREPLY, pREPLYFIELD, pASK, pASKFIELD, pASKID),
               AddToAskReplyElseLog(pASK, pASKFIELD, pASKID, pREPLY, pREPLYFIELD, pOWNER, pOWNERFIELD, pOWNERID, pOWNERFILL))
      into iRes
      from dual ;

    RETURN iRes;
  END;

  FUNCTION GetLastAsk(pASK        IN VARCHAR2,
                      pASKFIELD   IN VARCHAR2,
                      pREPLY      IN VARCHAR2,
                      pREPLYFIELD IN VARCHAR2,
                      pREPLYID    IN VARCHAR2) RETURN VARCHAR2 IS
    iRes ASU.TREPLYTABLE.FC_ASKID%TYPE;
  BEGIN
    select max(FC_ASKID)
      into iRes
      from (select LAST_VALUE(tr.FC_ASKID) OVER(ORDER BY tr.fk_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) FC_ASKID
              from ASU.TREPLYTABLE tr
             where tr.FC_ASK = pASK
               and tr.FC_ASKFIELD = pASKFIELD
               and tr.FC_REPLY = pREPLY
               and tr.FC_REPLYFIELD = pREPLYFIELD
               and tr.FC_REPLYID = pREPLYID);

    RETURN iRes;
  END;

END PkgAskReply;
/

SHOW ERRORS;


