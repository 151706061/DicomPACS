DROP PACKAGE BODY ASU.PKG_AMBTALON
/

--
-- PKG_AMBTALON  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY ASU."PKG_AMBTALON"
IS
   PROCEDURE add_talon (
      pAMBID        IN   NUMBER,
      pdate_begin   IN   DATE,
      potdelid      IN   NUMBER,
      psotrid       IN   NUMBER,
      pMedsesid       IN   NUMBER,
      preason       IN   NUMBER,
      poplat        IN   NUMBER,
      pserplace     IN   NUMBER,
      pfk_id        IN OUT NUMBER
   )
   IS
   BEGIN
      INSERT INTO tambtalon
                  (fk_ambid,fd_opened, fk_sotrid,fk_medsesid, fk_reason, fk_oplata, fk_servplace
                  , fk_otdelid)
           VALUES (pAMBID,pdate_begin, psotrid,pMedsesid, preason, poplat, pserplace
                  , potdelid)
        RETURNING fk_id
             INTO pfk_id;
   END;

   PROCEDURE LinkTalonNaz (
      pAMBID        IN   NUMBER,
      pTalonID       IN   NUMBER,
      pNazId       IN   NUMBER
   )
   IS
   BEGIN
      INSERT INTO tambtalon_naz
                  (fk_ambid,fk_talonid,fk_nazid
                  )
           VALUES (pAMBID,pTalonID,pNazId
                  );
   END;

   PROCEDURE DELETE_SUB_DIAG(pDIAGID IN NUMBER, pTALONID IN NUMBER)
   IS
   CURSOR C1 IS
        SELECT TD.FK_ID
           FROM TAMBTALON_NAZ TAMB, TDIAG TD
           WHERE TAMB.FK_TALONID=pTALONID
                 AND TD.FK_NAZID=TAMB.FK_NAZID AND TD.FL_MAIN=GET_SOPUTDIAG;
   BEGIN
    DELETE FROM TAMBTALON_DIAGS WHERE FK_DIAGID = pDIAGID AND FK_TALONID = pTALONID AND FL_DEL IS NULL;
    FOR DIAG IN C1
    LOOP
        INSERT INTO TAMBTALON_DIAGS (FK_DIAGID,FK_TALONID,FL_DEL) VALUES (DIAG.FK_ID,pTALONID,1);
    END LOOP;
   END;

   FUNCTION GET_SUB_LIST(pTALONID IN NUMBER) RETURN VARCHAR2
   IS
   sRESULT VARCHAR2(4000);
   CURSOR C1 IS
        select GET_MKB10_FROM_TSMID(FK_MKB_10) FC_NAME from
        (
        select td.fk_id, td.fc_write fc_name, td.fk_mkb_10
           from tambtalon_naz tamb, tdiag td
           where tamb.fk_talonid=pTALONID
                         and td.fk_pacid=tamb.fk_ambid and td.FL_MAIN=GET_SOPUTDIAG
          union
        select td.fk_id ,td.fc_write, td.fk_mkb_10
               from tambtalon_diags ta, tdiag td
               where ta.fk_diagid=td.fk_id
                          and ta.fk_talonid=pTALONID
                          and td.FL_MAIN=GET_SOPUTDIAG
          minus
        select td.fk_id ,td.fc_write, td.fk_mkb_10
               from tambtalon_diags ta, tdiag td
               where ta.fk_diagid=td.fk_id
                          and ta.fk_talonid=pTALONID
                          and td.FL_MAIN=GET_SOPUTDIAG
                          and fl_del = 1
        )
        where fk_mkb_10 > 0 order by fk_id;


   BEGIN
    FOR CC IN C1
    LOOP
        IF CC.FC_NAME IS NOT NULL THEN
           sRESULT:=sRESULT||CC.FC_NAME||'; ';
        END IF;
    END LOOP;
    RETURN sRESULT;
   END;

   FUNCTION GET_SUB_LIST_REASON(pTALONID IN NUMBER) RETURN VARCHAR2
   IS
   sRESULT VARCHAR2(4000);
   CURSOR C1 IS
        SELECT FK_ID,
        GET_SMIDNAME(FL_FIRST) FC_NAME
        FROM
        (
        select td.fk_id, td.fc_write fc_name, td.FL_FIRST, td.fk_mkb_10
           from tambtalon_naz tamb, tdiag td
           where tamb.fk_talonid=pTALONID
                         and td.fk_pacid=tamb.fk_ambid and td.FL_MAIN=GET_SOPUTDIAG
          union
        select td.fk_id ,td.fc_write, td.FL_FIRST, td.fk_mkb_10
               from tambtalon_diags ta, tdiag td
               where ta.fk_diagid=td.fk_id
                          and ta.fk_talonid=pTALONID
                          and td.FL_MAIN=GET_SOPUTDIAG
          minus
        select td.fk_id ,td.fc_write, td.FL_FIRST, td.fk_mkb_10
               from tambtalon_diags ta, tdiag td
               where ta.fk_diagid=td.fk_id
                          and ta.fk_talonid=pTALONID
                          and td.FL_MAIN=GET_SOPUTDIAG
                          and fl_del = 1
        )
        where fk_mkb_10 > 0 order by fk_id;

   BEGIN
    FOR CC IN C1
    LOOP
        IF CC.FC_NAME IS NOT NULL THEN
           sRESULT:=sRESULT||CC.FC_NAME||'; ';
        END IF;
    END LOOP;
    RETURN sRESULT;
   END;
   
   function  Get_last_diag_talon(pFK_TALONID in number, pFL_MAIN in number, pFP_TYPE in number) return number is 
res number;
cursor c is 
 select TDIAG.FK_ID
          from ASU.TSMID, ASU.TDIAG, TAMBTALON_NAZ, ASU.VNAZ
         where TAMBTALON_NAZ.FK_TALONID = pFK_TALONID
           and TAMBTALON_NAZ.FK_NAZID = TDIAG.FK_NAZID
           and VNAZ.FK_ID = TAMBTALON_NAZ.FK_NAZID
           and VNAZ.FK_NAZSOSID = ASU.GET_VIPNAZ
           and TDIAG.FK_SMDIAGID = TSMID.FK_ID
           and TDIAG.FL_MAIN = pFL_MAIN
           and TDIAG.FP_TYPE = pFP_TYPE order by TDIAG.FD_DATE DESC ;
BEgin
 OPEN C;
 FETCH C into res;
 close C; 
 return res;
End;


   
function  Get_last_diag_talon_MKB(pFK_TALONID in number, pFL_MAIN in number, pFP_TYPE in number) return varchar2 is 
res varchar2(512);
cursor c is 
 select TSMID.FK_MKB10 from ASU.TDIAG,ASU.TSMID where TDIAG.FK_SMDIAGID = TSMID.FK_ID
 and TDiag.Fk_Id = Get_last_diag_talon(pFK_TALONID , pFL_MAIN, pFP_TYPE );
BEgin
 OPEN C;
 FETCH C into res;
 close C; 
 return res;
End;

function  Get_last_diag_talon_FL_FIRST(pFK_TALONID in number, pFL_MAIN in number, pFP_TYPE in number) return number is 
res number;
cursor c is 
 select Tdiag.FL_FIRST from ASU.TDIAG where
 TDiag.Fk_Id = Get_last_diag_talon(pFK_TALONID , pFL_MAIN, pFP_TYPE );
BEgin
 OPEN C;
 FETCH C into res;
 close C; 
 return res;
End;


-- Enter further code below as specified in the Package spec.
END;
/

SHOW ERRORS;


