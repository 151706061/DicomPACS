-- Start of DDL Script for Package Body MED.PKG_TREB
-- Generated 2.06.08 13:01:22 from MED@ASU

CREATE OR REPLACE 
PACKAGE     med.pkg_treb is

  -- Author  : Sill
  -- Created : 21.02.2006 17:19:11
  -- Purpose : Requirements Routine

  -- Public type declarations

  -- Public function and procedure declarations

  FUNCTION CREATESHABLON(pMoid IN NUMBER) RETURN NUMBER;

  FUNCTION CHECKINMEDIC(PFK_MEDICID IN NUMBER,
                        PFK_TREBID IN NUMBER) RETURN NUMBER;

  FUNCTION CHECKINMEDIC_TTREB_DPC_BYNAZ(PFK_MEDICID IN NUMBER,
                                         PFK_TREBID IN NUMBER) RETURN NUMBER;

  PROCEDURE DO_SET_TREB(pFk_Id IN NUMBER,
                        pNumDoc IN VARCHAR2 default NULL,
                        pDate IN DATE,
                        pMoFrom IN NUMBER,
                        pMoTo IN NUMBER,
                        pComment in VARCHAR2,
                        PMOGROUPID_FROM in NUMBER,
                        PMOGROUPID_TO in NUMBER,
                        pCito in NUMBER);

  FUNCTION DO_SET_TREB_DPC(pFK_Treb_Dpc IN NUMBER,
                           pFk_TrebId   IN NUMBER,
                           pFk_Medicid  IN NUMBER,
                           pFn_Kol      IN NUMBER) RETURN NUMBER;

  FUNCTION DO_SET_TTREB_DPC_BYNAZ(pfk_trebid IN NUMBER,
                           pfk_medicid   IN NUMBER,
                           pfn_trebkol   IN NUMBER,
                           pfk_nazn_medic_name IN NUMBER,
                           pfn_naznkol_u IN NUMBER,
                           pfk_nazn_ei IN NUMBER) RETURN NUMBER;

  FUNCTION ADD_TTREB_DPC_BYNAZ(pfk_trebid IN NUMBER,
                           pfk_medicid   IN NUMBER,
                           pfn_trebkol   IN NUMBER,
                           pfk_nazn_medic_name IN NUMBER,
                           pfn_naznkol_u  IN NUMBER,
                           pfk_nazn_ei IN NUMBER) RETURN NUMBER;

  PROCEDURE DO_DEL_TREB_DPC (pFK_Treb_Dpc IN NUMBER);

  PROCEDURE do_del_treb_dpc_TR_MED (pfk_trebid IN NUMBER,pfk_medicid IN NUMBER);

  PROCEDURE DO_DEL_TTREB_DPC_BYNAZ(pFK_ID IN NUMBER);

  PROCEDURE FORMBYNAZN (pFk_TrebId IN NUMBER,
                        pMoid      IN NUMBER);

  PROCEDURE FORMBYNAZN_TTREB_DPC_BYNAZ (pFk_TrebId IN NUMBER,
                        pMoid  IN NUMBER);

  PROCEDURE do_set_nazn_treb_medic (pFK_NAZN_MEDICID IN NUMBER, pFK_TREB_MEDICID IN NUMBER);
  PROCEDURE MOVE_TTREBDPCBYNAZ_TO_TTREBDPC (pFk_TrebId IN NUMBER,
                                            pMoid IN NUMBER);

  PROCEDURE FILL_MINZAPAS(pFk_trebId IN NUMBER,pMoGroupId IN NUMBER);

  FUNCTION DO_SET_TREB_DPC_BY_NAZMEDLECH(pFK_Treb_Dpc IN NUMBER,
                                         pFk_TrebId   IN NUMBER,
                                         pFk_Medicid  IN NUMBER,
                                         pFn_Kol      IN NUMBER,
                                         pFk_NML_ID   IN NUMBER) RETURN NUMBER;
  FUNCTION GET_TREB_DPC_LIST_TREBID ( PFK_TREBID IN NUMBER ) RETURN MED.O_TREB_DPC_TABLE;
end pkg_treb;
/
CREATE OR REPLACE 
PACKAGE BODY     med.pkg_treb IS
  -- Function and procedure implementations

  FUNCTION CREATESHABLON(pMoid IN NUMBER) RETURN NUMBER IS
    nRes NUMBER;
    MOGROUP_ID NUMBER;
  BEGIN
-- вытаскиваем номер группы мат. отв.
      MOGROUP_ID := MED.PKG_MEDSES.get_cur_mogroup_by_moid(pMoid);
    /* делает скелет требования см. DO_SET_TREB (мясо для скелета) */
    INSERT INTO MED.TTREB (FK_MOOWNERID, FK_MOGROUPID) VALUES (pMoid, MOGROUP_ID) RETURNING FK_ID INTO nRes;
    RETURN (nRes);
  END;

  FUNCTION CHECKINMEDIC(PFK_MEDICID IN NUMBER,
                        PFK_TREBID IN NUMBER) RETURN NUMBER IS
    CURSOR cExistsMed (aFK_MEDICID IN NUMBER, aFK_TREBID IN NUMBER) IS
      SELECT FK_ID FROM TTREB_DPC
      WHERE FK_TREBID = aFK_TREBID
        AND FK_MEDICID = aFK_MEDICID AND ROWNUM < 2;

    nFK_ID NUMBER;
  BEGIN

    /* проверяет наличие медикамента в требовании */
    nFK_ID := -1;
    OPEN cExistsMed(pFK_MEDICID,pFK_TREBID);
    FETCH cExistsMed INTO nFK_ID;
    CLOSE cExistsMed;

    RETURN(nFK_ID);
  END;

  FUNCTION CHECKINMEDIC_TTREB_DPC_BYNAZ(PFK_MEDICID IN NUMBER,
                                         PFK_TREBID IN NUMBER) RETURN NUMBER IS
    CURSOR cExistsMed (aFK_MEDICID IN NUMBER, aFK_TREBID IN NUMBER) IS
      SELECT FK_ID FROM TTREB_DPC_BYNAZ
      WHERE FK_TREBID = aFK_TREBID
        AND FK_MEDICID = aFK_MEDICID AND ROWNUM < 2;

    nFK_ID NUMBER;
  BEGIN
    /* проверяет наличие медикамента в требовании */
    nFK_ID := -1;
    OPEN cExistsMed(pFK_MEDICID,pFK_TREBID);
    FETCH cExistsMed INTO nFK_ID;
    CLOSE cExistsMed;

    RETURN(nFK_ID);
  END;

  PROCEDURE DO_SET_TREB(pFk_Id IN NUMBER,
                        pNumDoc IN VARCHAR2, /* надо передавать Null, заполнение имени происходит при формировании расхода по этому требованию*/
                        pDate IN DATE,
                        pMoFrom IN NUMBER,
                        pMoTo IN NUMBER,
                        pComment in VARCHAR2,
                        PMOGROUPID_FROM in NUMBER,
                        PMOGROUPID_TO in NUMBER,
                        pCito in NUMBER) IS
  BEGIN
    IF (pNumDoc='') OR (pNumDoc IS NULL)  THEN
      UPDATE ttreb b
      SET b.fc_treb = NULL,
          b.fd_date = pDate,
          b.fk_motoid = pMoTo,
          b.fk_mofromid = pMoFrom,
          b.fc_comment = pComment,
          b.fk_mogroupid_from = PMOGROUPID_FROM,
          b.fk_mogroupid_to = PMOGROUPID_TO,
          b.fl_cito = pCito
      WHERE b.fk_id = pFk_Id;
    ELSE
      UPDATE ttreb b
      SET b.fc_treb = pNumDoc,
          b.fd_date = pDate,
          b.fk_motoid = pMoTo,
          b.fk_mofromid = pMoFrom,
          b.fc_comment = pComment,
          b.fk_mogroupid_from = PMOGROUPID_FROM,
          b.fk_mogroupid_to = PMOGROUPID_TO,
          b.fl_cito = pCito
      WHERE b.fk_id = pFk_Id;
    END IF;
  END;


  FUNCTION DO_SET_TREB_DPC_BY_NAZMEDLECH(pFK_Treb_Dpc IN NUMBER,
                                         pFk_TrebId   IN NUMBER,
                                         pFk_Medicid  IN NUMBER,
                                         pFn_Kol      IN NUMBER,
                                         pFk_NML_ID   IN NUMBER) RETURN NUMBER IS
  nRes NUMBER;
  MedicID NUMBER;
  BEGIN
    nRes := -1;
    IF NVL(pFK_Treb_Dpc, -1) = -1 THEN
      INSERT INTO TTREB_DPC (FK_TREBID,FK_MEDICID,FN_KOL, FK_NAZMEDLECH_ID)
      VALUES (pFk_TrebId,pFK_MEDICID,pFN_KOL, pFk_NML_ID) RETURNING FK_ID INTO nRes;
    ELSE
      UPDATE TTREB_DPC
      SET FK_MEDICID = PFK_MEDICID,
          FK_TREBID = pFk_TrebId,
          FN_KOL = PFN_KOL,
          FK_NAZMEDLECH_ID = pFk_NML_ID
      WHERE FK_ID = pFK_Treb_Dpc;
      nRes := pFK_Treb_Dpc;
    END IF;
    RETURN (nRes);
  END;
  
  FUNCTION DO_SET_TREB_DPC(pFK_Treb_Dpc IN NUMBER,
                           pFk_TrebId   IN NUMBER,
                           pFk_Medicid  IN NUMBER,
                           pFn_Kol      IN NUMBER) RETURN NUMBER IS
  nRes NUMBER;
  BEGIN
    nRes := -1;
    IF (pFK_Treb_Dpc = -1) OR (pFK_Treb_Dpc IS NULL) THEN
      INSERT INTO TTREB_DPC (FK_TREBID,FK_MEDICID,FN_KOL)
      VALUES (pFk_TrebId,pFK_MEDICID,pFN_KOL) RETURNING FK_ID INTO nRes;
    ELSE
      UPDATE TTREB_DPC
      SET FK_MEDICID = PFK_MEDICID,
          FK_TREBID = pFk_TrebId,
          FN_KOL = PFN_KOL
      WHERE FK_ID = pFK_Treb_Dpc;
      nRes := pFK_Treb_Dpc;
    END IF;
    RETURN (nRes);
  END;

  FUNCTION DO_SET_TTREB_DPC_BYNAZ(pfk_trebid IN NUMBER,
                           pfk_medicid   IN NUMBER,
                           pfn_trebkol   IN NUMBER,
                           pfk_nazn_medic_name IN NUMBER,
                           pfn_naznkol_u IN NUMBER,
                           pfk_nazn_ei IN NUMBER) RETURN NUMBER IS
  nRes NUMBER;
  BEGIN
    UPDATE TTREB_DPC_BYNAZ
       SET fn_trebkol   = pfn_trebkol,
           fn_naznkol_u = pfn_naznkol_u
     WHERE fk_trebid = pfk_trebid
        AND FK_NAZN_MEDIC_NAME = pfk_nazn_medic_name
        AND fk_medicid = pfk_medicid;

    IF SQL%ROWCOUNT = 0 THEN
      INSERT INTO TTREB_DPC_BYNAZ (FK_ID,fk_trebid, fk_medicid, fn_trebkol, fk_nazn_medic_name, fn_naznkol_u, fk_nazn_ei)
                           VALUES (NULL,pfk_trebid,pfk_medicid,pfn_trebkol,pfk_nazn_medic_name,pfn_naznkol_u,pfk_nazn_ei)
                           RETURNING FK_ID INTO nRes;
    ELSE
      SELECT MAX(FK_ID)
      INTO nRes FROM MED.TTREB_DPC_BYNAZ
      WHERE fk_trebid = pfk_trebid
        AND FK_NAZN_MEDIC_NAME = pfk_nazn_medic_name
        AND fk_medicid = pfk_medicid;
    END IF;
    RETURN (nRes);
  END;

  FUNCTION ADD_TTREB_DPC_BYNAZ(pfk_trebid IN NUMBER,
                           pfk_medicid   IN NUMBER,
                           pfn_trebkol   IN NUMBER,
                           pfk_nazn_medic_name IN NUMBER,
                           pfn_naznkol_u  IN NUMBER,
                           pfk_nazn_ei IN NUMBER) RETURN NUMBER IS
  nRes NUMBER;
  BEGIN
    UPDATE TTREB_DPC_BYNAZ
       SET fn_trebkol = fn_trebkol + pfn_trebkol,
           fn_naznkol_u = fn_naznkol_u + pfn_naznkol_u
     WHERE fk_trebid = pfk_trebid
       AND FK_NAZN_MEDIC_NAME = pfk_nazn_medic_name
       AND fk_medicid = pfk_medicid;

    IF SQL%ROWCOUNT = 0 THEN
      INSERT INTO TTREB_DPC_BYNAZ (fk_id, fk_trebid, fk_medicid, fn_trebkol, FK_NAZN_MEDIC_NAME, fn_naznkol_u,  fk_nazn_ei)
                           VALUES (null, pfk_trebid,pfk_medicid,pfn_trebkol,pfk_nazn_medic_name, pfn_naznkol_u,pfk_nazn_ei)
                           RETURNING FK_ID INTO nRes;
    ELSE
      SELECT MAX(FK_ID)
      INTO nRes FROM MED.TTREB_DPC_BYNAZ
      WHERE fk_trebid = pfk_trebid
        AND FK_NAZN_MEDIC_NAME = pfk_nazn_medic_name
        AND fk_medicid = pfk_medicid;
    END IF;

    RETURN (nRes);
  END;

  PROCEDURE do_del_treb_dpc (pFK_Treb_Dpc IN NUMBER) IS
  BEGIN
    DELETE FROM TTREB_DPC WHERE FK_ID = pFK_Treb_Dpc;
    -- обнуление связи в назначении происходит в тригере
  END;

  PROCEDURE do_del_treb_dpc_TR_MED (pfk_trebid IN NUMBER,pfk_medicid IN NUMBER) IS
  BEGIN
    DELETE FROM TTREB_DPC
      WHERE FK_TREBID = pfk_trebid
        AND FK_MEDICID = pfk_medicid;
    -- обнуление связи в назначении происходит в тригере
  END;

  PROCEDURE do_del_TTREB_DPC_BYNAZ(pFK_ID   IN NUMBER) IS
  BEGIN
    DELETE FROM TTREB_DPC_BYNAZ
      WHERE FK_ID = pFK_ID;
  END;

  PROCEDURE CATCH_UNTREB_NAZMEDLECH(pMoid  IN NUMBER) IS
    CURSOR cNaznList (aMoid IN NUMBER) IS
      SELECT
      L.FK_NAZMEDID, /* для проставления TNazMed.fk_treb */
      L.FK_ID AS FK_NAZMEDLECHID, /* для проставления TNazMedlech.fk_treb_dpc */
      L.FK_MEDICID as FK_NAZN_MEDIC_NAME,
      ASU.PKG_MEDICNAZN.GET_SUMM_NAZNMEDLECH_KOL(N.FN_DURATION, F.FN_MNOG, L.FN_KOL, L.fn_doza) AS FN_FPACKKOL,
--      F.FN_MNOG * N.FN_DURATION * L.FN_KOL AS FN_FPACKKOL,--, /* кол-во во фасовочных ед. изм. - назначает врач */
      L.fk_dozunits,
      NVL(M_I_N.FK_MEDIC,-1) as FK_MEDIC
--      F.FN_MNOG * N.FN_DURATION * L.FN_KOL / DECODE(M.FN_FPACKINUPACK,0,1,M.FN_FPACKINUPACK) AS FN_UPACKKOL /* кол-во в упаковочных единицах - для провизиков*/

      FROM TNAZMED N, TNAZMEDLECH L, /*TMEDIC M, */ASU.TFREQUENCY F, MED.TMEDIC_INTERN_NAME M_I_N
      WHERE N.FK_ID = L.FK_NAZMEDID
--        AND M.MEDICID = L.FK_MEDICID
        AND N.FK_FREQUENCYID = F.FK_ID
        AND L.FK_MEDICID = M_I_N.FK_INTERN_NAME(+)
        AND N.FK_MOID = aMOID
        AND L.FK_TREB_DPC IS NULL
        order by L.FK_NAZMEDID; /* еще не формировались требования */  
  BEGIN
null;
  END;
  
  PROCEDURE FORMBYNAZN (pFk_TrebId IN NUMBER,
                        pMoid  IN NUMBER) IS
    /* Формирование требований по листам назначений */


/*группировать по медикаментам*/


    /* Курсор по всем необработанным назначениям врача ... Остатки не учитываются*/
    CURSOR cNaznList (aMoid IN NUMBER) IS
      SELECT
      L.FK_NAZMEDID, /* для проставления TNazMed.fk_treb */
      L.FK_ID AS FK_NAZMEDLECHID, /* для проставления TNazMedlech.fk_treb_dpc */
      L.FK_MEDICID as FK_NAZN_MEDIC_NAME,
      ASU.PKG_MEDICNAZN.GET_SUMM_NAZNMEDLECH_KOL(N.FN_DURATION, F.FN_MNOG, L.FN_KOL, L.fn_doza) AS FN_FPACKKOL,
--      F.FN_MNOG * N.FN_DURATION * L.FN_KOL AS FN_FPACKKOL,--, /* кол-во во фасовочных ед. изм. - назначает врач */
      L.fk_dozunits,
      NVL(M_I_N.FK_MEDIC,-1) as FK_MEDIC
--      F.FN_MNOG * N.FN_DURATION * L.FN_KOL / DECODE(M.FN_FPACKINUPACK,0,1,M.FN_FPACKINUPACK) AS FN_UPACKKOL /* кол-во в упаковочных единицах - для провизиков*/

      FROM TNAZMED N, TNAZMEDLECH L, /*TMEDIC M, */ASU.TFREQUENCY F, MED.TMEDIC_INTERN_NAME M_I_N
      WHERE N.FK_ID = L.FK_NAZMEDID
--        AND M.MEDICID = L.FK_MEDICID
        AND N.FK_FREQUENCYID = F.FK_ID
        AND L.FK_MEDICID = M_I_N.FK_INTERN_NAME(+)
        AND N.FK_MOID = aMOID
        AND L.FK_TREB_DPC IS NULL
        order by L.FK_NAZMEDID; /* еще не формировались требования */

    nTreb_DpcId NUMBER;
    nOst NUMBER;
    nMinZapas NUMBER;

    nTrebKol NUMBER;
    OldGroup NUMBER;
  BEGIN

    /*обнуление если уже формировали*/
    DELETE FROM Ttreb_Dpc WHERE fk_trebid = PFK_TREBID;

--    UPDATE TNAZMEDLECH
--    SET FK_TREB_DPC = NULL
--    WHERE FK_NAZMEDID IN (SELECT FK_ID FROM TNAZMED
--                            WHERE FK_TREB = PFK_TREBID);

    UPDATE TNAZMED
    SET FK_TREB = NULL
    WHERE FK_TREB = PFK_TREBID;

    FOR REC IN cNaznList(pMoid) LOOP

      -- здесь нужно взять остаток по ID группы мат. отв., указанных в pMoid
--      OldGroup := MED.pkg_medses.GET_CUR_MOGROUP_BY_CUR_MO; --сохраняем старую группу
--      MED.pkg_medses.set_curmo_group(pMoid); -- устанавливаем новую
--      nOst := nvl(MED.PKGMEDKART.GetOstMedic(REC.FK_MEDICID,SYSDATE,pMoid),0);
--      MED.pkg_medses.set_curmo_group(OldGroup); -- возвращаем старую

--      BEGIN
        /*мин запас идет в упаковочных ед. изм.*/
--        SELECT n.colvo INTO nMinZapas FROM NEOTLOZH.Tminzapas n
--        WHERE n.medicid = REC.FK_MEDICID
--          AND n.moid = pMoid;
--      EXCEPTION
--        WHEN NO_DATA_FOUND THEN nMinZapas := 0;
--        WHEN OTHERS THEN RAISE;
--      END;

-- здесь пытались учитывать остаток и минимальный запас, зачем - большой вопрос. Пока только мешает
--      nTrebKol := REC.FN_UPACKKOL - (nOst - nMinZapas);
-- теперь здесь фасовочные единицы
      nTrebKol := REC.FN_FPACKKOL; --REC.FN_UPACKKOL;
-- в связи с необязательным полем кол-во, эта проверка неактуальна
--      IF nTrebKol > 0 THEN

        nTreb_DpcId := DO_SET_TREB_DPC(-1,pFk_TrebId,REC.FK_MEDIC,nTrebKol);

        -- назначению проставляем требование, по которому будет обработано назначение
        UPDATE ASU.TNAZMED
        SET FK_TREB = pFk_TrebId
        WHERE FK_ID = REC.FK_NAZMEDID;

        -- каждому препарату из назначения сопоставляем строку требования
        IF nTreb_DpcId > -1 THEN
          UPDATE ASU.TNAZMEDLECH L
          SET L.FK_TREB_DPC = nTreb_DpcId
          WHERE L.FK_ID = REC.FK_NAZMEDLECHID;
        END IF;
--      END IF;
    END LOOP;
  END;


  PROCEDURE FORMBYNAZN_TTREB_DPC_BYNAZ (pFk_TrebId IN NUMBER,
                        pMoid  IN NUMBER) IS
    /* Формирование требований по листам назначений, В котором требования записываются в таблицу  TTREB_DPC_BYNAZ и связываются с требованиями из TTREB_DPC*/

/*группировать по медикаментам*/

    /* Курсор по всем необработанным назначениям врача ... Остатки не учитываются*/
    CURSOR cNaznList (aMoid IN NUMBER) IS
      SELECT
      L.FK_NAZMEDID, /* для проставления TNazMed.fk_treb */
      L.FK_ID AS FK_NAZMEDLECHID, /* для проставления TNazMedlech.fk_treb_dpc */
      L.FK_MEDICID as FK_NAZN_MEDIC_NAME,
      ASU.PKG_MEDICNAZN.GET_SUMM_NAZNMEDLECH_KOL(N.FN_DURATION, F.FN_MNOG, L.FN_KOL, L.fn_doza) AS FN_FPACKKOL,
--      F.FN_MNOG * N.FN_DURATION * L.FN_KOL AS FN_FPACKKOL,--, /* кол-во во фасовочных ед. изм. - назначает врач */
      L.fk_dozunits,
      NVL(M_I_N.FK_MEDIC,-1) as FK_MEDIC
--      F.FN_MNOG * N.FN_DURATION * L.FN_KOL / DECODE(M.FN_FPACKINUPACK,0,1,M.FN_FPACKINUPACK) AS FN_UPACKKOL /* кол-во в упаковочных единицах - для провизиков*/

      FROM TNAZMED N, TNAZMEDLECH L, /*TMEDIC M, */ASU.TFREQUENCY F, MED.TMEDIC_INTERN_NAME M_I_N
      WHERE N.FK_ID = L.FK_NAZMEDID
--        AND M.MEDICID = L.FK_MEDICID
        AND N.FK_FREQUENCYID = F.FK_ID
        AND L.FK_MEDICID = M_I_N.FK_INTERN_NAME(+)
        AND N.FK_MOID = aMOID
        AND L.FK_TREB_DPC IS NULL
        order by L.FK_NAZMEDID; /* еще не формировались требования */

    nTreb_DpcId NUMBER;
    nOst NUMBER;
    nMinZapas NUMBER;

    nTrebKol NUMBER;
    OldGroup NUMBER;
    nMedicID NUMBER;
  BEGIN

    /*обнуление если уже формировали*/
--    DELETE FROM Ttreb_Dpc WHERE fk_trebid = PFK_TREBID;
    DELETE FROM TTREB_DPC_BYNAZ WHERE fk_trebid = PFK_TREBID;

    UPDATE TNAZMEDLECH
    SET FK_TREB_DPC = NULL
    WHERE FK_NAZMEDID IN (SELECT FK_ID FROM TNAZMED
                            WHERE FK_TREB = PFK_TREBID);

    UPDATE TNAZMED
    SET FK_TREB = NULL
    WHERE FK_TREB = PFK_TREBID;

    FOR REC IN cNaznList(pMoid) LOOP

            -- здесь нужно взять остаток по ID группы мат. отв., указанных в pMoid
--      OldGroup := MED.pkg_medses.GET_CUR_MOGROUP_BY_CUR_MO; --сохраняем старую группу
--      MED.pkg_medses.set_curmo_group(pMoid); -- устанавливаем новую
--      nOst := nvl(MED.PKGMEDKART.GetOstMedic(REC.FK_MEDICID,SYSDATE,pMoid),0);
--      MED.pkg_medses.set_curmo_group(OldGroup); -- возвращаем старую



--      BEGIN
        /*мин запас идет в упаковочных ед. изм.*/
--        SELECT n.colvo INTO nMinZapas FROM NEOTLOZH.Tminzapas n
--        WHERE n.medicid = REC.FK_MEDICID
--          AND n.moid = pMoid;
--      EXCEPTION
--        WHEN NO_DATA_FOUND THEN nMinZapas := 0;
--        WHEN OTHERS THEN RAISE;
--      END;

-- здесь пытались учитывать остаток и минимальный запас, зачем - большой вопрос. Пока только мешает
--      nTrebKol := REC.FN_UPACKKOL - (nOst - nMinZapas);
      nTrebKol := REC.FN_FPACKKOL; --REC.FN_UPACKKOL;

      IF nTrebKol > 0 THEN
--        nTreb_DpcId := DO_SET_TREB_DPC(-1,pFk_TrebId,REC.FK_MEDICID,nTrebKol);

--        SELECT count(1) into nMedicID
--        FROM MED.TMEDIC_INTERN_NAME
--        WHERE FK_INTERN_NAME = REC.FK_NAZN_MEDIC_NAME;
--        IF nMedicID = 0 THEN
--          nMedicID := -1;
--        ELSE
--          SELECT MAX(FK_MEDIC) INTO nMedicID
--          FROM MED.TMEDIC_INTERN_NAME
--          WHERE FK_INTERN_NAME = REC.FK_NAZN_MEDIC_NAME;
--        END IF;

        nTreb_DpcId := ADD_TTREB_DPC_BYNAZ(pFk_TrebId, NVL(REC.FK_MEDIC,-1),nTrebKol, REC.FK_NAZN_MEDIC_NAME, REC.FN_FPACKKOL/*REC.FN_UPACKKOL*/, REC.fk_dozunits);

        UPDATE TNAZMED
        SET FK_TREB = pFk_TrebId
        WHERE FK_ID = REC.FK_NAZMEDID;

        IF nTreb_DpcId > -1 THEN
          UPDATE TNAZMEDLECH L
          SET L.FK_TREB_DPC = nTreb_DpcId
          WHERE L.FK_ID = REC.FK_NAZMEDLECHID;
        END IF;
      END IF;
    END LOOP;
  END;

  PROCEDURE do_set_nazn_treb_medic (pFK_NAZN_MEDICID IN NUMBER, pFK_TREB_MEDICID IN NUMBER) IS
  BEGIN
-- вставляем связь международного имени и медикамента
      UPDATE MED.TMEDIC_INTERN_NAME
         SET FK_MEDIC = pFK_TREB_MEDICID
       WHERE FK_INTERN_NAME = pFK_NAZN_MEDICID and pFK_TREB_MEDICID > 0;
      IF (SQL%ROWCOUNT = 0)and(pFK_TREB_MEDICID > 0) THEN
        INSERT INTO MED.TMEDIC_INTERN_NAME (FK_INTERN_NAME, FK_MEDIC)  VALUES (pFK_NAZN_MEDICID, pFK_TREB_MEDICID);
      end IF;
  END;

  PROCEDURE MOVE_TTREBDPCBYNAZ_TO_TTREBDPC (pFk_TrebId IN NUMBER,
                                            pMoid IN NUMBER) IS
    /* перемещаем все требования Fk_TrebId из таблицы TTREB_DPC_BYNAZ в TTREB_DPC*/

    CURSOR cTTREBDPCBYNAZ (aFk_TrebId IN NUMBER,aMoid IN NUMBER) IS
      SELECT
        L.FK_NAZMEDID, -- для проставления TNazMed.fk_treb
        L.FK_ID AS FK_NAZMEDLECHID, -- для проставления TNazMedlech.fk_treb_dpc
        D.FK_TREBID,
        D.FK_MEDICID,
        D.FN_TREBKOL,
        D.FN_NAZNKOL_U,
        D.FK_ID,
        D.fk_nazn_medic_name
      FROM MED.TTREB_DPC_BYNAZ D, ASU.TNAZMEDLECH L--, ASU.TNAZMED N
      WHERE D.Fk_TrebId = aFk_TrebId
        AND D.fk_id = L.fk_treb_dpc(+)
--        AND D.FK_MEDICID = L.FK_MEDICID
--        AND N.FK_ID = L.FK_NAZMEDID
--        AND N.FK_MOID = aMOID
        AND L.FK_TREB_DPC IS NULL;

    nTreb_DpcId NUMBER;
  BEGIN
    /*обнуление если уже формировали*/
    DELETE FROM Ttreb_Dpc WHERE fk_trebid = pFk_TrebId;

-- здесь этого делать нельзя, поскольку на основании этой связи работает курсор cTTREBDPCBYNAZ
--    UPDATE TNAZMEDLECH
--    SET FK_TREB_DPC = NULL
--    WHERE FK_NAZMEDID IN (SELECT FK_ID FROM TNAZMED
--                            WHERE FK_TREB = pFk_TrebId);

    UPDATE TNAZMED
    SET FK_TREB = NULL
    WHERE FK_TREB = PFK_TREBID;

    FOR REC IN cTTREBDPCBYNAZ(pFk_TrebId,pMoid) LOOP
      nTreb_DpcId := DO_SET_TREB_DPC(-1,pFk_TrebId,REC.FK_MEDICID,REC.FN_TREBKOL);

      UPDATE TNAZMED
        SET FK_TREB = pFk_TrebId
        WHERE FK_ID = REC.FK_NAZMEDID;

      IF nTreb_DpcId > -1 THEN
        UPDATE TNAZMEDLECH L
--         SET L.FK_TREB_DPC = nTreb_DpcId
         SET L.FK_TREB_DPC = REC.FK_ID -- теперь сохраняем ID из TTREB_DPC_BYNAZ
         WHERE L.FK_ID = REC.FK_NAZMEDLECHID;
      END IF;

      do_set_nazn_treb_medic (REC.fk_nazn_medic_name, REC.FK_MEDICID);
     END LOOP;

--    DELETE FROM TTREB_DPC_BYNAZ WHERE fk_trebid = PFK_TREBID;
  END;



  PROCEDURE FILL_MINZAPAS(pFk_trebId IN NUMBER,pMoGroupId IN NUMBER) IS

    type refcursor is ref cursor;
    cMedic refcursor;

    TYPE rMedic IS RECORD (medicid MED.tmedic.medicid%TYPE,
                           fn_qnt NEOTLOZH.TMINZAPAS.Colvo%TYPE);
    vMedic rMedic;


  BEGIN
  /* sill заполнение требования на основе данных мин запаса и остатков
    считается по формуле <Ост. Мин. запас> - <остаток по всем карточкам медикаменто отдельновзятого МО на текущую дату>
  */

  DELETE FROM Ttreb_Dpc WHERE fk_trebid = pFk_trebId;

  OPEN cMedic FOR
    'SELECT ' ||
    '    MEDICID, ' ||
    '    FN_QNT ' ||
    '  FROM   ' ||
    '(SELECT ' ||
    '  MZ.MEDICID AS MEDICID, ' ||
    '  CASE WHEN MZ.COLVO - NVL(OST.FN_KOLOST,0)>0 ' ||
    '            THEN MZ.COLVO - NVL(OST.FN_KOLOST,0) ' ||
    '            ELSE 0 ' ||
    '  END AS FN_QNT ' ||
    'FROM NEOTLOZH.TMINZAPAS MZ, ' ||
    '( SELECT A.MEDICID, SUM(A.FN_KOLOST) AS FN_KOLOST ' ||
    '  FROM /*(SELECT  K.MEDICID, ' ||
    '                CASE WHEN ' ||
    '                       MOTOID = :MOID ' ||
    '                       AND FP_VID IN (1,3) ' ||
    '                       AND FP_VIDMOVE IN (1,5,6,7,8) ' ||
    '                       AND FD_DATA BETWEEN TO_DATE(''01.01.2000'', ''DD.MM.YYYY'') AND TRUNC(SYSDATE) + 1 - 1/(24*60*60) ' ||
    '                  THEN C.FN_KOL ' ||
    '                     WHEN ' ||
    '                       MOFROMID = :MOID ' ||
    '                       AND FP_VID = 3 ' ||
    '                       AND FP_VIDMOVE IN (4,5,6,7,8) ' ||
    '                       AND FD_DATA BETWEEN TO_DATE(''01.01.2000'', ''DD.MM.YYYY'') AND TRUNC(SYSDATE) + 1 - 1/(24*60*60) ' ||
    '                       THEN -C.FN_KOL ELSE 0 END AS FN_KOLOSTEND ' ||
    '        FROM MED.TDOCS D, MED.TDPC C, MED.TKART K ' ||
    '        WHERE K.KARTID = C.KARTID ' ||
    '          AND C.DPID = D.DPID ' ||
    '          AND D.FD_DATA BETWEEN TO_DATE(''01.01.2000'', ''DD.MM.YYYY'') AND TRUNC(SYSDATE) + 1 - 1/(24*60*60) ' ||
    '          AND K.FL_DEL = 0 ' ||
    '          AND D.FL_EDIT = 0 ' ||
    '          AND (CASE WHEN FP_VID = 3 AND FP_VIDMOVE IN (4,5,6,7,8) THEN MOFROMID END = :MOID ' ||
    '          OR CASE WHEN FP_VID IN (1,3) AND FP_VIDMOVE IN (1,5,6,7,8) THEN MOTOID END = :MOID) ' ||
    '    )*/ MED.VMEDKART_KOLOST A ' ||
    '  GROUP BY A.MEDICID) OST ' ||
    'WHERE MZ.MEDICID = OST.MEDICID (+) ' ||
    '  AND MZ.MOID = :MOID ' ||
    ') WHERE FN_QNT>0' USING pMoGroupId; --pMoId,pMoId,pMoId,pMoId,pMoId;

    LOOP
      FETCH cMedic INTO vMedic;
      EXIT WHEN cMedic%NOTFOUND;
      INSERT INTO Ttreb_Dpc (Fk_Trebid,Fk_Medicid,Fn_Kol)
      VALUES (pFk_trebId,vMedic.medicid,vMedic.fn_qnt);
    END LOOP;
  END;

  FUNCTION GET_TREB_DPC_LIST_TREBID ( PFK_TREBID IN NUMBER ) RETURN MED.O_TREB_DPC_TABLE is
    vTrebDpcTbl med.O_TREB_DPC_TABLE := med.O_TREB_DPC_TABLE();
  begin
    select med.O_TREB_DPC( t.FK_ID, t.FK_TREBID, t.FK_MEDICID, t.FN_KOL )
      bulk collect into vTrebDpcTbl
      from med.TTREB_DPC t
     where t.FK_TREBID = PFK_TREBID;
     
    return vTrebDpcTbl;    
  end;

END PKG_TREB;
-- End of DDL Script for Package Body MED.PKG_TREB
/
