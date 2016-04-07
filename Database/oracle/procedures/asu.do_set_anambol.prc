DROP PROCEDURE ASU.DO_SET_ANAMBOL
/

--
-- DO_SET_ANAMBOL  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TANAMBOL (Table)
--   TCLOBS (Table)
--
CREATE OR REPLACE PROCEDURE ASU."DO_SET_ANAMBOL" 
   ( pFK_VRACHID IN NUMBER,pFK_PACID IN NUMBER,pFC_COMMENT IN VARCHAR2,pFD_DATE IN DATE, pFK_BID in NUMBER, pfk_clobid in out number)
   IS
CURSOR cTemp IS SELECT /*+ rule*/COUNT(FK_ID) FROM TANAMBOL WHERE FK_PACID=pFK_PACID;
cursor cClob is select fk_clobid from tanambol where fk_pacid=pFK_PACID;
nTemp NUMBER:=0;
nClobID number:=0;
BEGIN
  OPEN cTemp;
  FETCH cTemp INTO nTemp;
  CLOSE cTemp;
  if (pFK_CLOBID is null) or (pFK_CLOBID=0) then
    open cClob;
    fetch cClob into nClobID;
    close cClob;
    if nClobID is not null then
      delete from tclobs where fk_id=nClobID;
    end if;
    insert into tclobs (fk_id,fc_clob) values (null,EMPTY_CLOB()) returning fk_id into pFK_CLOBID; -- зарезервируем место под текст
  end if;
  if nTemp=0 then
    INSERT INTO TANAMBOL (FK_VRACHID,FK_PACID,FC_COMMENT,FD_DATE, FK_BID, fk_clobid) VALUES
                         (pFK_VRACHID,pFK_PACID,pFC_COMMENT,pFD_DATE, pFK_BID,pFK_CLOBID);
  else
    UPDATE TANAMBOL SET
       FC_COMMENT=pFC_COMMENT,
       fk_bid = pFK_BID,
       fk_clobid = pFK_CLOBID
     WHERE FK_PACID=pFK_PACID;
  end if;
END;
/

SHOW ERRORS;


