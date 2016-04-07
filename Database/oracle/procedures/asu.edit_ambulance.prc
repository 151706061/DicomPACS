DROP PROCEDURE ASU.EDIT_AMBULANCE
/

--
-- EDIT_AMBULANCE  (Procedure) 
--
--  Dependencies: 
--   STANDARD (Package)
--   SYS_STUB_FOR_PURITY_ANALYSIS (Package)
--   TIB (Table)
--   TAMBULANCE (Table)
--   TAMBVRACH (Table)
--   TSMID (Table)
--
CREATE OR REPLACE PROCEDURE ASU."EDIT_AMBULANCE" (nDoWhat     IN INTEGER,
                                           pFK_PEPLID  IN INTEGER,
  -- LastUpdated : 28.10.2003 by TimurLan
  -- LastUpdated : 02.10.2003 by X-Side
                                           pFC_FAM     IN VARCHAR2,
                                           pFC_IM      IN VARCHAR2,
                                           pFC_OTCH    IN VARCHAR2,
                                           pFC_ADR     IN VARCHAR2,
                                           pFC_RABOTA  IN VARCHAR2,
                                           pFC_PHONE   IN VARCHAR2,
                                           pFC_RECOM   IN VARCHAR2,
                                           pFD_ROJD    IN DATE,
                                           pFP_SEX     IN INTEGER,
                                           pFL_VOV     IN INTEGER,
                                           pFL_IVOV    IN INTEGER,
                                           pFL_ULA     IN INTEGER,
                                           pFK_ID      IN INTEGER,
                                           pFK_GROUPID IN INTEGER,
                                           pFK_PRIZN   IN INTEGER,
                                           pFK_IBID    IN INTEGER,
                                           pFK_IBY     IN INTEGER,
                                           pFL_VYB     IN INTEGER,
                                           pFK_VRACHID IN INTEGER,
                                          -- pFK_VIDOBSL IN NUMBER, -- Added by Kosov 13.05.2010
                                           PFK_UCHID   IN NUMBER DEFAULT NULL) IS

  cursor cVidObsl is select fk_id from tsmid s where s.fc_synonim = 'AMBTALON_OPL'; -- Added by Kosov 13.05.2010
  cursor cVidObslCount is select count(fk_id) from tib t where t.fk_pacid = pFK_PEPLID and t.fk_smeditid in (select fk_id
                                                                                                               from tsmid s
                                                                                                              where s.fc_synonim = 'AMBTALON_OPL');
                   -- Added by Kosov 14.05.2010

  pFK_MAXIBID INTEGER;
  pFK_MAXID   INTEGER;
--  pVidObsl NUMBER; -- Added by KOsov 13.05.2010
--  nCountTib NUMBER;-- Added by KOsov 14.05.2010
BEGIN
  --if nDoWhat=0 then
  --SELECT MAX(FK_IBID)+1 INTO pFK_MAXIBID FROM TAMBULANCE WHERE
  --    FK_IBY=TO_CHAR(SYSDATE,'YYYY');
  --  IF pFK_MAXIBID is NULL then
  --      pFK_MAXIBID:=1;
  --    end IF;
  --    SELECT seq_TKarta.NextVal INTO pFK_MAXID FROM DUAL;
  --    INSERT INTO TAMBULANCE(FK_ID,FK_IBID,FK_IBY)  VALUES
  --     (pFK_MAXID,pFK_IBID,TO_CHAR(SYSDATE,'YYYY'));
  --insert into TANAMNEZ (FK_ID,FK_PACID,FL_AMB) VALUES(SEQ_TANAMNEZ.NEXTVAL,pFK_MAXID,1);
  --    insert into TEPID (FK_ID,FK_PACID,FL_AMB) VALUES(SEQ_TEPID.NEXTVAL,pFK_MAXID,1);
  --  insert into TAMBVRACH (FK_ID,FK_PACID,FL_VID,FK_VRACHID,FK_DALID) VALUES(SEQ_TAMBVRACH.NEXTVAL,pFK_MAXID,'M',pFK_VRACHID,pFK_VRACHID);
  --NULL;
  --  else

  -- Added by Kosov 13.05.2010
 -- OPEN cVidObsl;
 --   FETCH cVidObsl INTO pVidObsl;
 -- CLOSE cVidObsl;
  -- End Add

  UPDATE TAMBULANCE
     SET FC_FAM     = pFC_FAM,
         FC_IM      = pFC_IM,
         FC_OTCH    = pFC_OTCH,
         FD_ROJD    = pFD_ROJD,
         FP_SEX     = pFP_SEX,
         FC_ADR     = pFC_ADR,
         FC_RABOTA  = pFC_RABOTA,
         FC_PHONE   = pFC_PHONE,
         FC_RECOM   = pFC_RECOM,
         FL_VOV     = pFL_VOV,
         FL_IVOV    = pFL_IVOV,
         FL_ULA     = pFL_ULA,
         FK_GROUPID = pFK_GROUPID,
         FK_PRIZN   = pFK_PRIZN,
         FK_IBID    = pFK_IBID,
         FL_VYB     = pFL_VYB,
         FK_IBY     = pFK_IBY,
         FK_PEPLID  = pFK_PEPLID,
         FK_UCHID   = pFK_UCHID
   WHERE FK_ID = pFK_ID;
  UPDATE TAMBVRACH
     SET FK_VRACHID = pFK_VRACHID, FK_DALID = pFK_VRACHID
   WHERE FK_PACID = pFK_ID;
  --  end if;
/*-- Added by Kosov 13.05.2010
  open cVidObslCount;
    fetch cVidObslCount into nCountTib;
  close cVidObslCount;
  if nCountTib = 0 then
    insert into tib(fk_pacid,fk_smid,fk_smeditid,fk_vrachid)
             values(pFK_PEPLID,pFK_VIDOBSL,pVidObsl,pFK_VRACHID);
  else
    update tib tb set fk_smid = pFK_VIDOBSL where tb.fk_pacid = pFK_PEPLID and tb.fk_smeditid in (select fk_id
                                                                                                   from tsmid s
                                                                                                  where s.fc_synonim = 'AMBTALON_OPL');
  end if;
-- End Add*/
END;
/

SHOW ERRORS;


